#!/home/ec2-user/anaconda3/envs/JupyterSystemEnv/bin/python
"""
Configure Jupyter Proxy and setup Code Server (VSCode) for AWS SageMaker Jupyter Notebook and Lab.

This script configures Jupyter Proxy to enable access to Code Server (VSCode) within an AWS SageMaker Jupyter Notebook and JupyterLab environment.
It ensures seamless integration of Code Server for enhanced coding capabilities within the SageMaker environment.

Prerequisites:
- This script assumes you have an active AWS SageMaker instance with Jupyter Notebook and JupyterLab installed.
- It also assumes that you have necessary permissions to install and configure additional software within the SageMaker environment.

Usage:
- Run this script within your AWS SageMaker instance to configure Jupyter Proxy and setup Code Server.

Example:
    $ nohup sudo -u ec2-user /home/ec2-user/anaconda3/envs/JupyterSystemEnv/bin/python code-server-setup.py

Note:
- This script requires internet access to download and install additional dependencies.
"""

import argparse
import json
import os
import pathlib
import subprocess
import shutil
import sys


def system_configs(args: argparse.Namespace) -> None:
    """General system configurations to improve the end user experience"""
    if not args.customize_system:
        return None
    return set_max_user_watches(max_user_watches=args.max_user_watches)


def set_max_user_watches(max_user_watches: int = 524288) -> None:
    """Set max_user_watches temporarily until next reboot.
    VSCode needs to be able to track files for changes
    https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc
    """
    try:
        subprocess.run(
            ["sudo", "sysctl", "-w", f"fs.inotify.max_user_watches={max_user_watches}"],
            check=True,
        )
    except subprocess.CalledProcessError as e:
        print("Warning: Failed to set max_user_watches:", e)


def shell_pipe_settings(args: argparse.Namespace):
    """Configures shell pipe settings"""
    return f"""
{"set -x;" if args.verbose_shell else "# set -x;"}
"""


def conda_activate_command(as_string: bool = False):
    """Activates the Jupyter conda env"""
    command = [
        "source",
        "/home/ec2-user/anaconda3/bin/activate",
        "JupyterSystemEnv",
        ";",
    ]
    if as_string:
        return " ".join(command)
    return command


def conda_deactivate_command(as_string: bool = False):
    """Deactivates the conda env"""
    command = [
        "conda",
        "deactivate",
    ]
    if as_string:
        return " ".join(command)
    return command


def ensure_dir(path: str) -> str:
    """Creates a directory and any missing parent directories,
    ignoring errors if the path already exists."""
    pathlib.Path(path).mkdir(parents=True, exist_ok=True)
    return path


def download_icon(code_server_install_loc):
    """Reads and configures Code Server (VSCode) icon from the local directory"""
    current_dir = pathlib.Path(__file__).parent
    local_icon_path = (
        current_dir / "vscode.svg"
    )  # Assuming the image is in the same directory as the Python script
    icon_path = pathlib.Path(code_server_install_loc) / "icon.svg"

    # Copy the local icon file to the target directory
    shutil.copy(local_icon_path, icon_path)


def _vs_code_env_vars(args: argparse.Namespace) -> str:
    persistent_volume_path = args.persistent_volume_path
    code_server_install_loc = f"{persistent_volume_path}/.code-server"
    xdg_data_home = f"{persistent_volume_path}/.xdg/data"
    xdg_config_home = f"{persistent_volume_path}/.xdg/config"
    return f"""
export XDG_DATA_HOME="{xdg_data_home}";
export XDG_CONFIG_HOME="{xdg_config_home}";
export PATH="{code_server_install_loc}/bin/:$PATH";
"""


def install_code_server(args: argparse.Namespace):
    """Installs Code Server (VSCode) on the local machine"""
    # Set variables from command line arguments
    code_server_version = args.code_server_version
    persistent_volume_path = args.persistent_volume_path
    code_server_install_loc = ensure_dir(f"{persistent_volume_path}/.code-server")
    xdg_data_home = ensure_dir(f"{persistent_volume_path}/.xdg/data")
    conda_env_python_version = args.conda_env_python_version
    conda_env_location = ensure_dir(
        f"{code_server_install_loc}/conda/envs/codeserver_py{conda_env_python_version}"
    )
    use_custom_python_environment = args.use_custom_python_environment
    install_extensions = args.install_extensions
    # Install code-server
    download_icon(code_server_install_loc)
    install_script = f"""
{shell_pipe_settings(args=args)}
unset SUDO_UID
{_vs_code_env_vars(args=args)}


if [[ ! -d "{code_server_install_loc}/lib/code-server-{code_server_version}" ]]; then
    echo "Directory {code_server_install_loc}/lib/code-server-{code_server_version} does not exist. Installing code-server..."

    mkdir -p {code_server_install_loc}/lib {code_server_install_loc}/bin
    curl -fL https://github.com/coder/code-server/releases/download/v{code_server_version}/code-server-{code_server_version}-linux-amd64.tar.gz \\
    | tar -C {code_server_install_loc}/lib -xz
    mv {code_server_install_loc}/lib/code-server-{code_server_version}-linux-amd64 {code_server_install_loc}/lib/code-server-{code_server_version}
  echo "code-server installed successfully!"
else
  echo "Directory {code_server_install_loc}/lib/code-server-{code_server_version} already exists."
fi

unlink '{code_server_install_loc}/bin/code-server' || true
ln -s '{code_server_install_loc}/lib/code-server-{code_server_version}/bin/code-server' '{code_server_install_loc}/bin/code-server'
"""
    # install vscode
    subprocess.run(
        install_script, check=True, shell=True, executable=args.shell_executable
    )
    # create optional conda environment, and configure vscode to use it
    if args.create_new_conda_env:
        create_conda_script = f"""
{shell_pipe_settings(args=args)}
{conda_activate_command(as_string=True)}
# Check if the target directory exists and is empty
if [[ ! -d "{conda_env_location}" ]] || [[ -z "$(ls -A "{conda_env_location}")" ]]; then
  # Directory doesn't exist or is empty, create the conda environment
  conda create --prefix "{conda_env_location}" python="{conda_env_python_version}" -y
else
  # Directory exists and is not empty, skip creation
  echo "Conda environment already exists at {conda_env_location}"
fi
if [[ "{use_custom_python_environment}" == "True" ]]; then
        MACHINE_DIR="{xdg_data_home}/code-server/Machine"
        mkdir -p "$MACHINE_DIR"
        CODE_SERVER_MACHINE_SETTINGS_FILE="$MACHINE_DIR/settings.json"
        touch "$CODE_SERVER_MACHINE_SETTINGS_FILE"
        if grep -q "python.defaultInterpreterPath" "$CODE_SERVER_MACHINE_SETTINGS_FILE"
        then
            echo "Default interpreter path is already set."
        else
            cat >>$CODE_SERVER_MACHINE_SETTINGS_FILE <<- MACHINESETTINGS
{{
    "python.defaultInterpreterPath": "{conda_env_location}/bin"
}}
MACHINESETTINGS
        fi
fi
{conda_deactivate_command(as_string=True)}
"""
        subprocess.run(
            create_conda_script,
            check=True,
            shell=True,
            executable=args.shell_executable,
        )
    # install vscode addons
    if len(install_extensions) > 0:
        install_script_extension_script = f"""{shell_pipe_settings(args=args)}
unset SUDO_UID
{_vs_code_env_vars(args=args)}
""" + "\n".join(
            [
                f"{code_server_install_loc}/bin/code-server --install-extension {extension} --force;"
                for extension in install_extensions
            ]
        )

        subprocess.run(
            install_script_extension_script,
            check=True,
            shell=True,
            executable=args.shell_executable,
        )


def check_code_in_file(config_file, code_snippet):
    """
    Checks if the given code snippet exists in the specified Jupyter config file.
    Args:
        config_file (str): The path to the Jupyter config file.
        code_snippet (str): The code snippet to search for.
    Returns:
        bool: True if the code snippet is found in the file, False otherwise.
    """
    with open(config_file, "r", encoding="utf-8") as file:
        config_file_contents = file.read()
    return code_snippet in config_file_contents


def _get_jupyter_server_proxy_version(
    args: argparse.Namespace, jupyter_lab_version: str
) -> str:
    """Select the most appropriate version for the jupyter server proxy

    Args:
        args (argparse.Namespace): cli arguments
        jupyter_lab_version (str): jupyter lab version

    Returns:
        str: the most suitable version for jupyter server proxy
    """
    if args.jupyter_server_proxy_version is not None:
        return args.jupyter_server_proxy_version
    if jupyter_lab_version.startswith("1."):
        return "1.6.0"
    if jupyter_lab_version.startswith("3."):
        return "3.2.0"
    print(
        "Running potentially unsupported Jupyter version. Defaulting jupyter server proxy version."
    )
    return "3.2.0"


def configure_jupyter(args: argparse.Namespace):
    """Configures Jupyter proxy server installation and set up for path for VSCode"""
    persistent_volume_path = args.persistent_volume_path
    code_server_install_loc = f"{persistent_volume_path}/.code-server"
    xdg_data_home = f"{persistent_volume_path}/.xdg/data"
    xdg_config_home = f"{persistent_volume_path}/.xdg/config"
    proxy_path = args.proxy_path
    # Jupyter configuration
    jupyter_config_file = "/home/ec2-user/.jupyter/jupyter_notebook_config.py"
    if not check_code_in_file(
        jupyter_config_file, f"{code_server_install_loc}/bin/code-server"
    ):
        with open(jupyter_config_file, "a", encoding="utf-8") as config_file:
            config_file.write(
                f"""
c.ServerProxy.servers = {{
    '{proxy_path}': {{
        'launcher_entry': {{
            'enabled': True,
            'title': '{args.launcher_entry_title}',
            'icon_path': '{code_server_install_loc}/icon.svg'
        }},
        'command': ['{code_server_install_loc}/bin/code-server', '--auth', 'none', '--disable-telemetry', '--bind-addr', '127.0.0.1:{{port}}', '--open', '{persistent_volume_path}/'],
        'environment': {{
            'XDG_DATA_HOME': '{xdg_data_home}',
            'XDG_CONFIG_HOME': '{xdg_config_home}',
            'SHELL': '{args.shell_executable}'
        }},
        'absolute_url': False,
        'timeout': 60
    }}
}}
# Additional settings for Jupyter server
c.NotebookApp.keep_alive = True
c.NotebookApp.connection_timeout = 60000  # 60 seconds
"""
            )
    jupyter_lab_version = subprocess.check_output(
        ["/home/ec2-user/anaconda3/envs/JupyterSystemEnv/bin/jupyter-lab", "--version"],
        universal_newlines=True,
    ).strip()

    subprocess_args = conda_activate_command()

    jupyter_server_proxy_version = _get_jupyter_server_proxy_version(
        args=args, jupyter_lab_version=jupyter_lab_version
    )

    conda_setup_commands = [
        ["pip", "uninstall", "--yes", "nbserverproxy", ";"],
        [
            "pip",
            "install",
            f"jupyter-server-proxy=={jupyter_server_proxy_version}",
            ";",
        ],
        ["jupyter", "labextension", "install", "@jupyterlab/server-proxy", ";"],
        [
            "jupyter",
            "serverextension",
            "enable",
            "--sys-prefix",
            "jupyter_server_proxy",
            ";",
        ],
        ["jupyter", "labextension", "enable", "jupyterlab-server-proxy", ";"],
        [
            "chown",
            "-R",
            args.chown_username,
            code_server_install_loc,
            xdg_config_home,
            xdg_data_home,
            ";",
        ],
    ]

    subprocess_args.extend([x for sublist in conda_setup_commands for x in sublist])
    subprocess_args.extend(conda_deactivate_command())
    subprocess.run(
        " ".join(subprocess_args),
        check=True,
        shell=True,
        executable=args.shell_executable,
    )

    if pathlib.Path("/home/ec2-user/bin/dockerd-rootless.sh").exists():
        print(
            "Running in rootless mode; please restart Jupyter Server from the 'File' > 'Shut Down' menu and re-open Jupyter/JupyterLab."
        )
    elif args.restart_jupyter:
        print("Root mode. Restarting Jupyter Server...")
        subprocess_args = ["sudo", "systemctl", "restart", "jupyter-server", ";"]
        subprocess.run(
            " ".join(subprocess_args),
            check=True,
            shell=True,
            executable=args.shell_executable,
        )


def _argparse_bool(action, arg_string):
    """Custom action to parse True or False values."""
    if arg_string.lower() in ["true", "t"]:
        return True
    if arg_string.lower() in ["false", "f"]:
        return False
    raise argparse.ArgumentTypeError(
        f"argument {action} requires True or False, not {arg_string!r}"
    )


def _argparse_int(action: str, arg: int, min_allowed: int, max_allowed: int):
    """Custom action to validate arg int in [min, max]"""
    if arg < min_allowed:
        raise argparse.ArgumentTypeError(
            f"argument {action} require value greater or equal to {min_allowed}, not {arg!r}"
        )
    if arg > max_allowed:
        raise argparse.ArgumentTypeError(
            f"argument {action} require value lower or equal to {max_allowed}, not {arg!r}"
        )
    return arg


def arg_parser() -> argparse.Namespace:
    """ArgParser for code server setup"""
    parser = argparse.ArgumentParser(
        description="Install and configure code-server and Jupyter.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    # Add command-line arguments
    parser.add_argument(
        "--code-server-version", type=str, default="4.16.1", help="Code Server version."
    )
    parser.add_argument(
        "--jupyter-server-proxy-version",
        type=str,
        default=None,
        help="Jupyter server proxy version.",
    )
    parser.add_argument(
        "--shell-executable", type=str, default="/usr/bin/bash", help="Shell executable"
    )
    parser.add_argument(
        "--persistent-volume-path",
        type=str,
        default="/home/ec2-user/SageMaker",
        help="Path to the persistent volume.",
    )
    parser.add_argument(
        "--create-new-conda-env",
        default=True,
        type=lambda x: _argparse_bool("create_new_conda_env", x),
        help="Create a new conda environment. Set to False to disable, True to explicitly enable.",
    )
    parser.add_argument(
        "--customize-system",
        default=True,
        type=lambda x: _argparse_bool("customize_system", x),
        help="Perform custom operations to the system such as increase watch file limits etc. Set to False to disable, True to explicitly enable.",
    )
    parser.add_argument(
        "--verbose-shell",
        default=False,
        type=lambda x: _argparse_bool("verbose_shell", x),
        help="Make the shell verbose for debug purposes. Set to False to disable, True to explicitly enable.",
    )
    parser.add_argument(
        "--restart-jupyter",
        default=False,
        type=lambda x: _argparse_bool("restart_jupyter", x),
        help="Restart the jupyter server at the end of the run. Set to False to disable, True to explicitly enable.",
    )
    parser.add_argument(
        "--conda-env-python-version",
        type=str,
        default="3.11",
        help="Python version for the conda environment.",
    )
    parser.add_argument(
        "--use-custom-python-environment",
        dest="use_custom_python_environment",
        default=False,
        type=lambda x: _argparse_bool("use_custom_python_environment", x),
        help="Use a custom extension gallery. Set to False to disable, True to explicitly enable.",
    )
    parser.add_argument(
        "--launcher-entry-title",
        type=str,
        default="Code Server",
        help="Title for the launcher entry.",
    )
    parser.add_argument(
        "--chown-username",
        type=str,
        default="ec2-user",
        help="User name to own the files",
    )
    parser.add_argument(
        "--proxy-path", type=str, default="codeserver", help="Path for the proxy."
    )
    parser.add_argument(
        "--install-extensions",
        type=json.loads,
        default=[
            "ms-toolsai.jupyter",
            "formulahendry.code-runner",
            "ms-python.python",
            "ryuta46.multi-command",
            "ms-azuretools.vscode-docker",
            "mechatroner.rainbow-csv",
            "esbenp.prettier-vscode",
        ],
        help="List of vscode/code-server extensions to install.",
    )
    parser.add_argument(
        "--max-user-watches",
        type=lambda x: _argparse_int(
            "max_user_watches", x, min_allowed=8192, max_allowed=524288
        ),
        default=524288,
        help="List of vscode/code-server extensions to install. Depended on customize-system arg",
    )

    return parser


def must_run_as_sudo():
    """Ensure this code is ran with sudo"""
    if os.getenv("SUDO_USER") is None and os.getuid() != 0:
        print("This script must be run as root/sudo.")
        sys.exit(1)


def main():
    """Main function"""
    parser = arg_parser()
    args = parser.parse_args()
    must_run_as_sudo()
    install_code_server(args)
    configure_jupyter(args)
    system_configs(args)
    print("Finished setup...")


if __name__ == "__main__":
    main()
