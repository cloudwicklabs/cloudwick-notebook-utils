# Notebook Utilities

This repository is aimed for providing scripts and documentation for setting up custom tools on top of Amorphic Notebooks.

## Code Server (VSCode)

### Manual Set up

Open a Jupyter notebook terminal, and run the following commands. The setup takes typically under 10 minutes. Choose if you want to use automatically the latest release or a specific one.

```sh
# use the latest
export notebook_utils_release_latest=$(curl -s https://api.github.com/repos/cloudwicklabs/cloudwick-notebook-utils/releases/latest | grep '"tag_name":' | cut -d '"' -f 4)
```

```sh
# or use a specific release
export notebook_utils_release="cnu-0.1.8"
curl -LO https://github.com/cloudwicklabs/cloudwick-notebook-utils/archive/refs/tags/${notebook_utils_release}.tar.gz
tar -xvzf ${notebook_utils_release}.tar.gz
nohup sudo -u ec2-user /home/ec2-user/anaconda3/envs/JupyterSystemEnv/bin/python cloudwick-notebook-utils-${notebook_utils_release}/code-server/notebook-instances/code-server-setup.py &
code_server_setup_pid=$!


# ... other code goes here
wait $code_server_setup_pid
echo "code_server_setup.py has finished!"
# for non dockerized jupyter servers
sudo systemctl restart jupyter-server
```

### Lifecycle Set up

To set up VSCode via the Lifecycle policies of the Notebook, you can simply create Lifecycle and add the code above.

You may find sample Lifecycle policies for vscode-with-glue for [start-up here](/code-server/notebook-instances/samples/vscode-with-glue/on-start.sh) and for [on-create here](/code-server/notebook-instances/samples/vscode-with-glue/on-create.sh).

### Screenshots

#### Starting VSCode from Jupyter Lab

![Jupyter Lab - Code Server](/code-server/notebook-instances/imgs/launcher-code-server.png)

#### Starting VSCode from Jupyter Notebook

![Jupyter Notebook - Code Server](/code-server/notebook-instances/imgs/jupyter-code-server.png)
