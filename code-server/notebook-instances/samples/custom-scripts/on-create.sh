#!/bin/bash
# On-Create Script
# The script setups code server and restarts jupyter server once it is setup

set -ex

export notebook_utils_release="cnu-0.1.6"
curl -LO https://github.com/cloudwicklabs/cloudwick-notebook-utils/archive/refs/tags/${notebook_utils_release}.tar.gz
tar -xvzf ${notebook_utils_release}.tar.gz
sudo -u ec2-user /home/ec2-user/anaconda3/envs/JupyterSystemEnv/bin/python cloudwick-notebook-utils-${notebook_utils_release}/code-server/notebook-instances/code-server-setup.py &
code_server_setup_pid=$!

# Timeout Variables
timeout_duration=$((20 * 60))
check_interval=10
elapsed_time=0

# Check for glue_ready file and wait for code_server_setup.py if needed
if [ -e /home/ec2-user/glue_ready ]; then
    wait $code_server_setup_pid
    echo "code_server_setup.py has finished!"
    # Restart jupyter-server for non-dockerized setups
    systemctl restart jupyter-server
    # Exit with a 0 status code
    exit 0
fi

cat <<'EOF' > /home/ec2-user/SageMaker/.glue_setup.sh

# System updates and package installation
sudo yum remove openssl-devel -y
sudo yum install htop -y
sudo yum install gcc zlib-devel bzip2 bzip2-devel patch readline-devel sqlite sqlite-devel openssl11-devel tk-devel libffi-devel xz-devel htop ncurses-devel -y

# Install Miniconda to SageMaker EBS
echo "INFO: Installing Miniconda on SageMaker EBS"
WORKING_DIR=/home/ec2-user/SageMaker/.custom-miniconda
mkdir -p "$WORKING_DIR"

# -----------------pyenv & poetry: start
echo '-------Configuring Pyenv and Poetry'
PYENV_ROOT=$WORKING_DIR/.pyenv
POETRY_HOME=$WORKING_DIR/pypoetry
echo ' ' >> ~/.bash_profile
echo '# ---------------Pyenv & Poetry Configuration' >> ~/.bash_profile
echo 'WORKING_DIR=/home/ec2-user/SageMaker/.custom-miniconda' >> ~/.bash_profile
echo 'export PYENV_ROOT="$WORKING_DIR/.pyenv"' >> ~/.bash_profile
echo 'export POETRY_HOME="$WORKING_DIR/pypoetry"' >> ~/.bash_profile
echo 'export PATH="$PATH:$POETRY_HOME/venv/bin"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
# -----------------pyenv & poetry: end

wget https://repo.anaconda.com/miniconda/Miniconda3-4.6.14-Linux-x86_64.sh -O "$WORKING_DIR/miniconda.sh"
bash "$WORKING_DIR/miniconda.sh" -b -u -p "$WORKING_DIR/miniconda"
rm -rf "$WORKING_DIR/miniconda.sh"

# Initialize conda
echo "INFO: Initializing conda"
source "$WORKING_DIR/miniconda/etc/profile.d/conda.sh"

# Configure Conda to use the custom environment directory
echo "INFO: Configuring conda to use custom environments directory"
conda config --add envs_dirs $WORKING_DIR/envs

echo "INFO: Creating glue_pyspark conda environment"
conda create --name glue_pyspark ipykernel jupyterlab pandas=1.5.1 -y

echo "INFO: Activating glue_pyspark"
conda activate glue_pyspark

# Initialize the latest Python path
echo "INFO: Getting site packages directory of latest python version"
SITE_PACKAGES_DIR=$(python -c 'import site; print(site.getsitepackages()[0])')
echo "INFO: Site package directory is --- $SITE_PACKAGES_DIR"

# Install AWS Glue Sessions to the environment
echo "INFO: Installing AWS Glue Sessions with pip"
pip install aws-glue-sessions==1.0.4
pip install nbdime

# Verify installation of AWS Glue Sessions
if conda list -n glue_pyspark aws-glue-sessions | grep -q aws-glue-sessions; then
  echo "INFO: Package 'aws-glue-sessions' is installed in the 'glue_pyspark' environment successfully"
else
  echo "ERROR: Package 'aws-glue-sessions' is not installed in the 'glue_pyspark' environment or 'glue_pyspark' was not created properly. Notebook will go into 'Failed' state. Contact Admin."
  sleep 500
fi

# Clone glue_pyspark to glue_scala environment
echo "INFO: Cloning glue_pyspark to glue_scala"
conda create --name glue_scala --clone glue_pyspark -y

# Verify installation of AWS Glue Sessions in glue_scala environment
if conda list -n glue_scala aws-glue-sessions | grep -q aws-glue-sessions; then
  echo "INFO: Package 'aws-glue-sessions' is installed in the 'glue_scala' environment successfully"
else
  echo "ERROR: Package 'aws-glue-sessions' is not installed in the 'glue_scala' environment or 'glue_scala' was not created properly. Notebook will go into 'Failed' state. Contact Admin."
  sleep 500
fi

# Remove python3 kernel from glue_pyspark and glue_scala
echo "INFO: Removing python3 kernel from glue_pyspark and glue_scala"
rm -r ${WORKING_DIR}/envs/glue_pyspark/share/jupyter/kernels/python3
rm -r ${WORKING_DIR}/envs/glue_scala/share/jupyter/kernels/python3

# Copy kernels to Jupyter kernel environment (Discoverable by conda_nb_kernel)
echo "INFO: Copying Glue PySpark Kernel"
cp -r ${SITE_PACKAGES_DIR}/aws_glue_interactive_sessions_kernel/glue_pyspark/ ${WORKING_DIR}/envs/glue_pyspark/share/jupyter/kernels/glue_pyspark/

echo "INFO: Copying Glue Spark Kernel"
mkdir ${WORKING_DIR}/envs/glue_scala/share/jupyter/kernels
cp -r ${SITE_PACKAGES_DIR}/aws_glue_interactive_sessions_kernel/glue_spark/ ${WORKING_DIR}/envs/glue_scala/share/jupyter/kernels/glue_spark/

# Modify Jupyter config to use CondaKernelSpecManager
echo "INFO: Changing Jupyter kernel manager from EnvironmentKernelSpecManager to CondaKernelSpecManager"
JUPYTER_CONFIG=/home/ec2-user/.jupyter/jupyter_notebook_config.py

sed -i '/EnvironmentKernelSpecManager/ s/^/#/' ${JUPYTER_CONFIG}
echo "c.CondaKernelSpecManager.name_format='conda_{environment}'" >> ${JUPYTER_CONFIG}
echo "c.CondaKernelSpecManager.env_filter='.custom-miniconda$|JupyterSystemEnv$|/R$'" >> ${JUPYTER_CONFIG}

sudo systemctl restart jupyter-server
sudo touch /home/ec2-user/glue_ready

echo "INFO: Setup complete!"

EOF

# Make the glue setup script executable
chmod +x /home/ec2-user/SageMaker/.glue_setup.sh

while kill -0 $code_server_setup_pid 2>/dev/null; do
  echo "Process $code_server_setup_pid Running."
  if [ $elapsed_time -ge $timeout_duration ]; then
    echo "Process $code_server_setup_pid did not complete within 20 minutes."
    exit 1
  fi
  sleep $check_interval
  elapsed_time=$((elapsed_time + check_interval))
done
echo "code_server_setup.py has finished!"

sudo systemctl restart jupyter-server
sudo touch /home/ec2-user/glue_ready

# Schedule the script to run once after a short delay using at, which runs as a seperate background process
echo "/home/ec2-user/SageMaker/.glue_setup.sh" | at now + 2 minute