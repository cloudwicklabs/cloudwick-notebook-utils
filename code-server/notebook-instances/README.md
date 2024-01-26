# code-server-setup


```sh
> python code-server-setup.py --help
usage: code-server-setup.py [-h] [--code-server-version CODE_SERVER_VERSION] [--jupyter-server-proxy-version JUPYTER_SERVER_PROXY_VERSION] [--shell-executable SHELL_EXECUTABLE]
                            [--persistent-volume-path PERSISTENT_VOLUME_PATH] [--create-new-conda-env CREATE_NEW_CONDA_ENV] [--verbose-shell VERBOSE_SHELL] [--restart-jupiter RESTART_JUPITER] [--conda-env-python-version CONDA_ENV_PYTHON_VERSION] [--use-custom-python-environment USE_CUSTOM_PYTHON_ENVIRONMENT] [--launcher-entry-title LAUNCHER_ENTRY_TITLE]
                            [--chown-username CHOWN_USERNAME] [--proxy-path PROXY_PATH] [--install-extensions INSTALL_EXTENSIONS]

Install and configure code-server and Jupyter.

options:
  -h, --help            show this help message and exit
  --code-server-version CODE_SERVER_VERSION
                        Code Server version. (default: 4.16.1)
  --jupyter-server-proxy-version JUPYTER_SERVER_PROXY_VERSION
                        Jupyter server proxy version. (default: 1.6.0)
  --shell-executable SHELL_EXECUTABLE
                        Shell executable (default: /usr/bin/bash)
  --persistent-volume-path PERSISTENT_VOLUME_PATH
                        Path to the persistent volume. (default: /home/ec2-user/SageMaker)
  --create-new-conda-env CREATE_NEW_CONDA_ENV
                        Create a new conda environment (default: True). Set to False to disable, True to explicitly enable. (default: True)
  --verbose-shell VERBOSE_SHELL
                        Make the shell verbose for debug purposes. Set to False to disable, True to explicitly enable. (default: False)
  --restart-jupiter RESTART_JUPITER
                        Restart the jupiter server at the end of the run. Set to False to disable, True to explicitly enable. (default: False)
  --conda-env-python-version CONDA_ENV_PYTHON_VERSION
                        Python version for the conda environment. (default: 3.11)
  --use-custom-python-environment USE_CUSTOM_PYTHON_ENVIRONMENT
                        Use a custom extension gallery (default: True). Set to False to disable, True to explicitly enable. (default: False)
  --launcher-entry-title LAUNCHER_ENTRY_TITLE
                        Title for the launcher entry. (default: Code Server)
  --chown-username CHOWN_USERNAME
                        User name to own the files (default: ec2-user)
  --proxy-path PROXY_PATH
                        Path for the proxy. (default: codeserver)
  --install-extensions INSTALL_EXTENSIONS
                        List of vscode/code-server extensions to install. (default: ['ms-toolsai.jupyter', 'formulahendry.code-runner', 'ms-python.python', 'ryuta46.multi-command',
                        'ms-azuretools.vscode-docker', 'mechatroner.rainbow-csv', 'esbenp.prettier-vscode'])
```


## Debugging

In the case of failures you can check the jupiter log `cat /var/log/jupyter.log` or the nohup logs.
