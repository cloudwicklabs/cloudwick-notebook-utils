#!/bin/bash
# On-Start Script

set -ex

export notebook_utils_release="cnu-0.1.8"
curl -LO https://github.com/cloudwicklabs/cloudwick-notebook-utils/archive/refs/tags/${notebook_utils_release}.tar.gz
tar -xvzf ${notebook_utils_release}.tar.gz
nohup sudo -u ec2-user /home/ec2-user/anaconda3/envs/JupyterSystemEnv/bin/python cloudwick-notebook-utils-${notebook_utils_release}/code-server/notebook-instances/code-server-setup.py &
code_server_setup_pid=$!

# Timeout Variables
timeout_duration=$((20 * 60))
check_interval=10
elapsed_time=0

# Check for glue_ready file and wait for code_server_setup.py if needed
if [ -e /home/ec2-user/glue_ready ]; then
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
  # Disable nbserverproxy
  jupyter serverextension disable nbserverproxy
  # Restart jupyter-server for non-dockerized setups
  systemctl restart jupyter-server
  # Exit with a 0 status code
  exit 0
fi

sudo -u ec2-user -i <<'EOF'

ANACONDA_DIR=/home/ec2-user/anaconda3

# Create and Activate Conda Env
echo "INFO: Creating glue_pyspark conda environment"
conda create --name glue_pyspark ipykernel jupyterlab pandas=1.5.3 -y

echo "INFO: Activating glue_pyspark"
source activate glue_pyspark

# Initialize Latest Python Path
echo "INFO: Getting site packages directory of latest python version"
SITE_PACKAGES_DIR=$(python -c 'import site; print(site.getsitepackages()[0])')
echo "INFO: Site package directory is --- $SITE_PACKAGES_DIR"

# Install Glue Sessions to Env
echo "INFO: Installing AWS Glue Sessions with pip"
# Get Latest Glue Session version
#LATEST_GLUE_SESSIONS=$(curl -s https://pypi.org/pypi/aws-glue-sessions/json | python -c "import sys, json; print(json.load(sys.stdin)['info']['version'])")
#pip install aws-glue-sessions==$LATEST_GLUE_SESSIONS
# If a particular glue session version to be installed
pip install aws-glue-sessions==1.0.4

# Check if the 'glue_pyspark' environment is active and packages are properly installed
if conda list -n glue_pyspark aws-glue-sessions | grep -q aws-glue-sessions; then
  echo "INFO: Package 'aws-glue-sessions' is installed in the 'glue_pyspark' environment successfully"
else
  echo "ERROR: Package 'aws-glue-sessions' is not installed in the 'glue_pyspark' environment or 'glue_pyspark' was not created properly. Notebook will go into 'Failed' state. Contact Admin."
  sleep 500
fi

# Clone glue_pyspark to glue_scala. This is required to match kernel naming conventions to their environments and can't have two kernels in one conda env.
echo "INFO: Cloning glue_pyspark to glue_scala"
conda create --name glue_scala --clone glue_pyspark -y

# Check if the 'glue_scala' environment is active and packages are properly installed
if conda list -n glue_scala aws-glue-sessions | grep -q aws-glue-sessions; then
  echo "INFO: Package 'aws-glue-sessions' is installed in the 'glue_scala' environment successfully"
else
  echo "ERROR: Package 'aws-glue-sessions' is not installed in the 'glue_scala' environment or 'glue_scala' was not created properly. Notebook will go into 'Failed' state. Contact Admin."
  sleep 500
fi

# Remove python3 kernel from glue_pyspark and glue_scala
echo "INFO: Removing python3 kernel from glue_pyspark and glue_scala"
rm -r ${ANACONDA_DIR}/envs/glue_pyspark/share/jupyter/kernels/python3
rm -r ${ANACONDA_DIR}/envs/glue_scala/share/jupyter/kernels/python3

# Copy kernels to Jupyter kernel env (Discoverable by conda_nb_kernel)
echo "INFO: Copying Glue PySpark Kernel"
cp -r ${SITE_PACKAGES_DIR}/aws_glue_interactive_sessions_kernel/glue_pyspark/ ${ANACONDA_DIR}/envs/glue_pyspark/share/jupyter/kernels/glue_pyspark/

echo "INFO: Copying Glue Spark Kernel"
mkdir ${ANACONDA_DIR}/envs/glue_scala/share/jupyter/kernels
cp -r ${SITE_PACKAGES_DIR}/aws_glue_interactive_sessions_kernel/glue_spark/ ${ANACONDA_DIR}/envs/glue_scala/share/jupyter/kernels/glue_spark/

echo "INFO: Changing Jupyter kernel manager from EnvironmentKernelSpecManager to CondaKernelSpecManager"
JUPYTER_CONFIG=/home/ec2-user/.jupyter/jupyter_notebook_config.py

sed -i '/EnvironmentKernelSpecManager/ s/^/#/' ${JUPYTER_CONFIG}
echo "c.CondaKernelSpecManager.name_format='conda_{environment}'" >> ${JUPYTER_CONFIG}
echo "c.CondaKernelSpecManager.env_filter='anaconda3$|JupyterSystemEnv$|/R$'" >> ${JUPYTER_CONFIG}

EOF

elapsed_time=0
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

# Disable nbserverproxy
jupyter serverextension disable nbserverproxy
systemctl restart jupyter-server
sudo touch /home/ec2-user/glue_ready

