Session terminated, killing shell...[C 12:51:46.866 NotebookApp] received signal 15, stopping
[I 12:51:46.867 NotebookApp] Shutting down 0 kernels
[I 12:51:46.868 NotebookApp] Shutting down 0 terminals
 ...killed.
+ case $1 in
+ run_post_stop
+ echo 'Jupyter server stopped.'
+ logger -t jupyter
+ case $1 in
+ run_pre_start
+ echo 'Starting Jupyter server...'
+ logger -t jupyter
+ case $1 in
+ run_start
+ KEY_PATH=/home/ec2-user/.jupyter/notebookkey.key
+ CERT_PATH=/home/ec2-user/.jupyter/notebookcert.pem
+ '[' '!' -f /home/ec2-user/.jupyter/notebookkey.key ']'
+ '[' '!' -f /home/ec2-user/.jupyter/notebookcert.pem ']'
+ echo 'Self-signed certificate and key already exist at /home/ec2-user/.jupyter/notebookcert.pem and /home/ec2-user/.jupyter/notebookkey.key.'
+ case $1 in
+ run_post_start
+ logger -t jupyter
+ echo 'Jupyter server launched.'
+ logger -t jupyter
++ jq .csrf_check /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ CSRF_CHECK=enabled
+ [[ enabled == \d\i\s\a\b\l\e\d ]]
+ [[ enabled == \e\n\a\b\l\e\d ]]
++ jq .notebook_uri /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ ALLOWED_URI_PATTERN='https:\/\/(689b7809-ff37-44c1-a3f2-196deb912119|689b7809-ff37-44c1-a3f2-196deb912119).notebook.us-east-1.sagemaker.aws'
+ logger -t jupyter
+ echo 'Launching Jupyter server with csrf check enabled...'
+ exec su -s /bin/sh -l -c 'PATH=/home/ec2-user/anaconda3/bin:$PATH && source activate JupyterSystemEnv && exec "$0" "$@"' ec2-user -- jupyter notebook --notebook-dir=/home/ec2-user/SageMaker/ --ip=0.0.0.0 --NotebookApp.token=[REDACTED]
[I 12:51:51.399 NotebookApp] [nb_conda_kernels] enabled, 11 kernels found
[I 12:51:51.438 NotebookApp] Authentication of /metrics is OFF, since other authentication is disabled.
[W 12:51:51.671 NotebookApp] All authentication is disabled.  Anyone who can connect to this server will be able to run code.
[I 12:51:52.172 NotebookApp] JupyterLab extension loaded from /home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/jupyterlab
[I 12:51:52.172 NotebookApp] JupyterLab application directory is /home/ec2-user/anaconda3/envs/JupyterSystemEnv/share/jupyter/lab
[I 12:51:52.605 NotebookApp] [nb_conda] enabled
[W 12:51:52.662 NotebookApp] Error loading server extension nbdime
    Traceback (most recent call last):
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/notebookapp.py", line 2050, in init_server_extensions
        func(self)
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/__init__.py", line 17, in load_jupyter_server_extension
        from .webapp.nb_server_extension import _load_jupyter_server_extension
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nb_server_extension.py", line 27, in <module>
        from .nbdimeserver import (
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nbdimeserver.py", line 16, in <module>
        from notebook import DEFAULT_STATIC_FILES_PATH
    ImportError: cannot import name 'DEFAULT_STATIC_FILES_PATH' from 'notebook' (/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/__init__.py)
[I 12:51:53.187 NotebookApp] sparkmagic extension enabled!
[I 12:51:53.189 NotebookApp] Serving notebooks from local directory: /home/ec2-user/SageMaker
[I 12:51:53.189 NotebookApp] Jupyter Notebook 6.5.7 is running at:
[I 12:51:53.189 NotebookApp] https://ip-172-16-86-226.ec2.internal:8443/
[I 12:51:53.189 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 12:51:53.192 NotebookApp] No web browser found: could not locate runnable browser.
[I 12:52:18.193 NotebookApp] 301 GET /lab/workspaces/auto-y/?clone (10.1.35.236) 0.730000ms
[I 12:52:22.659 NotebookApp] Build is up to date
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: MissingIDFieldWarning: Cell is missing an id field, this will become a hard error in future nbformat versions. You may want to use `normalize()` on your notebooks before validations (available since nbformat 5.1.4). Previous versions of nbformat are fixing this issue transparently, and will stop doing so in the future.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '3019e08e' detected. Corrected to '41cbeccb'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'ce5723a5' detected. Corrected to 'c426e236'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'bb02351a' detected. Corrected to '41dfb973'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '5f6e3f85' detected. Corrected to '575bc0a3'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '8d636275' detected. Corrected to '014f61fa'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '8f82e791' detected. Corrected to 'fdf5cde9'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'f95bab56' detected. Corrected to '3774d85a'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'cb187715' detected. Corrected to '8d5722cf'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '9d1a92ce' detected. Corrected to '7369bb8b'.
  validate(nb)
[E 12:52:24.605 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][7]:
    {'cell_type': 'markdown',
     'execution_count': 10,
     'id': 'c2e488ba-455b-42d5-92af-f8c63b254028',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T17:07:04.101715Z',
                                  'start_time': '2023-09-22T17:07:04.092727Z'}},
     'outputs': ['...0 outputs...'],
     'source': '## Define pipeline steps'}
[E 12:52:24.612 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][5]:
    {'cell_type': 'markdown',
     'execution_count': 9,
     'id': 'eb1e4035-df62-4370-ac26-af14c025b503',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T16:53:32.158974Z',
                                  'start_time': '2023-09-22T16:53:31.520437Z'}},
     'outputs': ['...0 outputs...'],
     'source': 'Next, run the cell bellow to install all dependencies required '
               'b...'}
[E 12:52:24.620 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][7]:
    {'cell_type': 'markdown',
     'execution_count': 10,
     'id': 'c2e488ba-455b-42d5-92af-f8c63b254028',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T17:07:04.101715Z',
                                  'start_time': '2023-09-22T17:07:04.092727Z'}},
     'outputs': ['...0 outputs...'],
     'source': '## Define pipeline steps'}
[E 12:52:24.629 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][7]:
    {'cell_type': 'markdown',
     'execution_count': 10,
     'id': 'c2e488ba-455b-42d5-92af-f8c63b254028',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T17:07:04.101715Z',
                                  'start_time': '2023-09-22T17:07:04.092727Z'}},
     'outputs': ['...0 outputs...'],
     'source': '## Define pipeline steps'}
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'f207c2b8' detected. Corrected to '67b03086'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '66b60a2b' detected. Corrected to 'ed932fc9'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '207aa954' detected. Corrected to 'c44f5f33'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'a8f18b23' detected. Corrected to 'f2a6f3af'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '2f21e958' detected. Corrected to 'cb5d4e83'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'a56a7e16' detected. Corrected to '148ad7d0'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'motivated-cattle' detected. Corrected to '5e072a04'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '8c8a3cea' detected. Corrected to '990e44c9'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '09323c51-6cb3-4a7d-9c7a-ef3b41e63248' detected. Corrected to '0eb560b0'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '5ef72609-b294-4cce-a917-6629581c2ac6' detected. Corrected to '9ef5bd59'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '09323c51-6cb3-4a7d-9c7a-ef3b41e63248' detected. Corrected to 'de5b6c79'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'ae16b7f1' detected. Corrected to '6929d4ab'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '2f919041' detected. Corrected to 'ac16d657'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '09ea5c99' detected. Corrected to '14f3ccc4'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '27811923-bb05-4bae-a8dc-eaf6887a72ab' detected. Corrected to 'f7c0836f'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'a64814c4-c157-4162-b859-6180ef5f0ff2' detected. Corrected to '33e38cc0'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '1b2aebda' detected. Corrected to '4f2ea141'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'f10765e2' detected. Corrected to '0b141c55'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '80b9b865' detected. Corrected to 'feb89f34'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '33386bb3' detected. Corrected to '507aa1dc'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '17c9b56d' detected. Corrected to '5da623ec'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'e950fa8e' detected. Corrected to '58cc3ea0'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'dc468afe' detected. Corrected to '89499949'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '9b08c378' detected. Corrected to '6a0787b8'.
  validate(nb)
[E 12:52:26.913 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'da6f1605',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:52:27.000 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'bb71225a',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:52:27.003 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'b5d4bf05',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:52:27.011 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'fa3c7af7',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:52:27.022 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': '41591bd8',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:52:27.029 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'c21cd2bf',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:52:27.138 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': '08d29d66',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:52:27.184 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': '2f3fcfea',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[I 12:55:40.833 NotebookApp] Build is up to date
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: MissingIDFieldWarning: Cell is missing an id field, this will become a hard error in future nbformat versions. You may want to use `normalize()` on your notebooks before validations (available since nbformat 5.1.4). Previous versions of nbformat are fixing this issue transparently, and will stop doing so in the future.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '3019e08e' detected. Corrected to '8c9a1d70'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'ce5723a5' detected. Corrected to '17a8033d'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'bb02351a' detected. Corrected to 'ed2582b4'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '5f6e3f85' detected. Corrected to '3b73cf9a'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '8d636275' detected. Corrected to '4dbdc176'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '8f82e791' detected. Corrected to 'd0ccc79f'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'f95bab56' detected. Corrected to 'f6ea4c30'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'cb187715' detected. Corrected to 'a64c2291'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '9d1a92ce' detected. Corrected to 'a1a1350f'.
  validate(nb)
[E 12:55:42.315 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][7]:
    {'cell_type': 'markdown',
     'execution_count': 10,
     'id': 'c2e488ba-455b-42d5-92af-f8c63b254028',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T17:07:04.101715Z',
                                  'start_time': '2023-09-22T17:07:04.092727Z'}},
     'outputs': ['...0 outputs...'],
     'source': '## Define pipeline steps'}
[E 12:55:42.322 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][5]:
    {'cell_type': 'markdown',
     'execution_count': 9,
     'id': 'eb1e4035-df62-4370-ac26-af14c025b503',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T16:53:32.158974Z',
                                  'start_time': '2023-09-22T16:53:31.520437Z'}},
     'outputs': ['...0 outputs...'],
     'source': 'Next, run the cell bellow to install all dependencies required '
               'b...'}
[E 12:55:42.329 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][7]:
    {'cell_type': 'markdown',
     'execution_count': 10,
     'id': 'c2e488ba-455b-42d5-92af-f8c63b254028',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T17:07:04.101715Z',
                                  'start_time': '2023-09-22T17:07:04.092727Z'}},
     'outputs': ['...0 outputs...'],
     'source': '## Define pipeline steps'}
[E 12:55:42.338 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][7]:
    {'cell_type': 'markdown',
     'execution_count': 10,
     'id': 'c2e488ba-455b-42d5-92af-f8c63b254028',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T17:07:04.101715Z',
                                  'start_time': '2023-09-22T17:07:04.092727Z'}},
     'outputs': ['...0 outputs...'],
     'source': '## Define pipeline steps'}
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'f207c2b8' detected. Corrected to 'abbf619e'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '66b60a2b' detected. Corrected to '0b18dfa9'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '207aa954' detected. Corrected to '5c101375'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'a8f18b23' detected. Corrected to 'f7fa239d'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '2f21e958' detected. Corrected to '9df73c5f'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'a56a7e16' detected. Corrected to '6b8d4f87'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'motivated-cattle' detected. Corrected to '6f137152'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '8c8a3cea' detected. Corrected to '4b75459d'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '09323c51-6cb3-4a7d-9c7a-ef3b41e63248' detected. Corrected to '72655935'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '5ef72609-b294-4cce-a917-6629581c2ac6' detected. Corrected to '4e191d08'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '09323c51-6cb3-4a7d-9c7a-ef3b41e63248' detected. Corrected to '56854316'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'ae16b7f1' detected. Corrected to 'c960e0da'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '2f919041' detected. Corrected to 'cfeeeda4'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '09ea5c99' detected. Corrected to '485caa3d'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '27811923-bb05-4bae-a8dc-eaf6887a72ab' detected. Corrected to '089399f0'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'a64814c4-c157-4162-b859-6180ef5f0ff2' detected. Corrected to 'a90c088a'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '1b2aebda' detected. Corrected to '1b4d111e'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'f10765e2' detected. Corrected to '9b917dfc'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '80b9b865' detected. Corrected to '94507c3d'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '33386bb3' detected. Corrected to '9cc5f9d1'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '17c9b56d' detected. Corrected to '556645df'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'e950fa8e' detected. Corrected to '80d8930d'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'dc468afe' detected. Corrected to '9cc4e8d9'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '9b08c378' detected. Corrected to '61fe40c8'.
  validate(nb)
[E 12:55:44.162 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'da6f1605',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:55:44.248 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'bb71225a',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:55:44.251 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'b5d4bf05',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:55:44.259 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'fa3c7af7',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:55:44.269 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': '41591bd8',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:55:44.277 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'c21cd2bf',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:55:44.386 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': '08d29d66',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 12:55:44.430 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': '2f3fcfea',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
+ case $1 in
+ run_pre_start
+ logger -t jupyter
+ echo 'Starting Jupyter server...'
+ case $1 in
+ run_post_start
+ case $1 in
+ run_start
+ KEY_PATH=/home/ec2-user/.jupyter/notebookkey.key
+ CERT_PATH=/home/ec2-user/.jupyter/notebookcert.pem
+ '[' '!' -f /home/ec2-user/.jupyter/notebookkey.key ']'
+ logger -t jupyter
+ echo 'Jupyter server launched.'
+ logger -t jupyter
+ echo 'Generating self-signed certificate and key to /home/ec2-user/.jupyter/notebookcert.pem and /home/ec2-user/.jupyter/notebookkey.key...'
+ sudo -u ec2-user openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -sha256 -keyout /home/ec2-user/.jupyter/notebookkey.key -out /home/ec2-user/.jupyter/notebookcert.pem -subj /CN=sagemaker
Generating a 2048 bit RSA private key
......................+++
.......................................+++
writing new private key to '/home/ec2-user/.jupyter/notebookkey.key'
-----
+ logger -t jupyter
+ echo 'Self-signed certificate generated.'
++ jq .csrf_check /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ CSRF_CHECK=enabled
+ [[ enabled == \d\i\s\a\b\l\e\d ]]
+ [[ enabled == \e\n\a\b\l\e\d ]]
++ jq .notebook_uri /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ ALLOWED_URI_PATTERN='https:\/\/(689b7809-ff37-44c1-a3f2-196deb912119|689b7809-ff37-44c1-a3f2-196deb912119).notebook.us-east-1.sagemaker.aws'
+ echo 'Launching Jupyter server with csrf check enabled...'
+ logger -t jupyter
+ exec su -s /bin/sh -l -c 'PATH=/home/ec2-user/anaconda3/bin:$PATH && source activate JupyterSystemEnv && exec "$0" "$@"' ec2-user -- jupyter notebook --notebook-dir=/home/ec2-user/SageMaker/ --ip=0.0.0.0 --NotebookApp.token=[REDACTED]
[I 13:14:03.488 NotebookApp] Using EnvironmentKernelSpecManager...
[I 13:14:03.540 NotebookApp] Started periodic updates of the kernel list (every 3 minutes).
[I 13:14:05.720 NotebookApp] Writing notebook server cookie secret to /home/ec2-user/.local/share/jupyter/runtime/notebook_cookie_secret
[I 13:14:05.721 NotebookApp] Authentication of /metrics is OFF, since other authentication is disabled.
[W 13:14:12.877 NotebookApp] All authentication is disabled.  Anyone who can connect to this server will be able to run code.
[I 13:14:21.687 NotebookApp] JupyterLab extension loaded from /home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/jupyterlab
[I 13:14:21.687 NotebookApp] JupyterLab application directory is /home/ec2-user/anaconda3/envs/JupyterSystemEnv/share/jupyter/lab
[I 13:14:25.110 NotebookApp] [nb_conda] enabled
[W 13:14:28.096 NotebookApp] Error loading server extension nbdime
    Traceback (most recent call last):
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/notebookapp.py", line 2050, in init_server_extensions
        func(self)
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/__init__.py", line 17, in load_jupyter_server_extension
        from .webapp.nb_server_extension import _load_jupyter_server_extension
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nb_server_extension.py", line 27, in <module>
        from .nbdimeserver import (
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nbdimeserver.py", line 16, in <module>
        from notebook import DEFAULT_STATIC_FILES_PATH
    ImportError: cannot import name 'DEFAULT_STATIC_FILES_PATH' from 'notebook' (/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/__init__.py)
[I 13:14:44.100 NotebookApp] sparkmagic extension enabled!
[I 13:14:44.101 NotebookApp] Serving notebooks from local directory: /home/ec2-user/SageMaker
[I 13:14:44.101 NotebookApp] Jupyter Notebook 6.5.7 is running at:
[I 13:14:44.101 NotebookApp] https://ip-172-16-93-226.ec2.internal:8443/
[I 13:14:44.101 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 13:14:44.105 NotebookApp] No web browser found: could not locate runnable browser.
[I 13:14:44.105 NotebookApp] Starting initial scan of virtual environments...
[I 13:15:59.088 NotebookApp] Found new kernels in environments: conda_python3, conda_pytorch_p310, conda_tensorflow2_p310
[I 13:20:07.199 NotebookApp] Found new kernels in environments: conda_glue_pyspark, conda_glue_scala
+ case $1 in
+ run_pre_start
+ logger -t jupyter
+ echo 'Starting Jupyter server...'
+ case $1 in
+ run_post_start
+ echo 'Jupyter server launched.'
+ logger -t jupyter
+ case $1 in
+ run_start
+ KEY_PATH=/home/ec2-user/.jupyter/notebookkey.key
+ CERT_PATH=/home/ec2-user/.jupyter/notebookcert.pem
+ '[' '!' -f /home/ec2-user/.jupyter/notebookkey.key ']'
+ echo 'Generating self-signed certificate and key to /home/ec2-user/.jupyter/notebookcert.pem and /home/ec2-user/.jupyter/notebookkey.key...'
+ logger -t jupyter
+ sudo -u ec2-user openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -sha256 -keyout /home/ec2-user/.jupyter/notebookkey.key -out /home/ec2-user/.jupyter/notebookcert.pem -subj /CN=sagemaker
Generating a 2048 bit RSA private key
.......................................................+++
..........................+++
writing new private key to '/home/ec2-user/.jupyter/notebookkey.key'
-----
+ echo 'Self-signed certificate generated.'
+ logger -t jupyter
++ jq .csrf_check /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ CSRF_CHECK=enabled
+ [[ enabled == \d\i\s\a\b\l\e\d ]]
+ [[ enabled == \e\n\a\b\l\e\d ]]
++ jq .notebook_uri /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ ALLOWED_URI_PATTERN='https:\/\/(689b7809-ff37-44c1-a3f2-196deb912119|689b7809-ff37-44c1-a3f2-196deb912119).notebook.us-east-1.sagemaker.aws'
+ echo 'Launching Jupyter server with csrf check enabled...'
+ logger -t jupyter
+ exec su -s /bin/sh -l -c 'PATH=/home/ec2-user/anaconda3/bin:$PATH && source activate JupyterSystemEnv && exec "$0" "$@"' ec2-user -- jupyter notebook --notebook-dir=/home/ec2-user/SageMaker/ --ip=0.0.0.0 --NotebookApp.token=[REDACTED]
[I 13:33:53.315 NotebookApp] Using EnvironmentKernelSpecManager...
[I 13:33:53.361 NotebookApp] Started periodic updates of the kernel list (every 3 minutes).
[I 13:33:56.130 NotebookApp] Writing notebook server cookie secret to /home/ec2-user/.local/share/jupyter/runtime/notebook_cookie_secret
[I 13:33:56.131 NotebookApp] Authentication of /metrics is OFF, since other authentication is disabled.
[W 13:34:05.144 NotebookApp] All authentication is disabled.  Anyone who can connect to this server will be able to run code.
[I 13:34:17.066 NotebookApp] JupyterLab extension loaded from /home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/jupyterlab
[I 13:34:17.066 NotebookApp] JupyterLab application directory is /home/ec2-user/anaconda3/envs/JupyterSystemEnv/share/jupyter/lab
[I 13:34:21.308 NotebookApp] [nb_conda] enabled
[W 13:34:25.412 NotebookApp] Error loading server extension nbdime
    Traceback (most recent call last):
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/notebookapp.py", line 2050, in init_server_extensions
        func(self)
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/__init__.py", line 17, in load_jupyter_server_extension
        from .webapp.nb_server_extension import _load_jupyter_server_extension
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nb_server_extension.py", line 27, in <module>
        from .nbdimeserver import (
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nbdimeserver.py", line 16, in <module>
        from notebook import DEFAULT_STATIC_FILES_PATH
    ImportError: cannot import name 'DEFAULT_STATIC_FILES_PATH' from 'notebook' (/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/__init__.py)
[I 13:34:44.324 NotebookApp] sparkmagic extension enabled!
[I 13:34:44.325 NotebookApp] Serving notebooks from local directory: /home/ec2-user/SageMaker
[I 13:34:44.325 NotebookApp] Jupyter Notebook 6.5.7 is running at:
[I 13:34:44.325 NotebookApp] https://ip-172-16-82-151.ec2.internal:8443/
[I 13:34:44.325 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 13:34:44.329 NotebookApp] No web browser found: could not locate runnable browser.
[I 13:34:44.329 NotebookApp] Starting initial scan of virtual environments...
[I 13:36:04.914 NotebookApp] Found new kernels in environments: conda_tensorflow2_p310, conda_python3, conda_pytorch_p310
Session terminated, killing shell...[C 13:39:45.930 NotebookApp] received signal 15, stopping
[I 13:39:45.931 NotebookApp] Shutting down 0 kernels
[I 13:39:45.931 NotebookApp] Shutting down 0 terminals
 ...killed.
+ case $1 in
+ run_post_stop
+ logger -t jupyter
+ echo 'Jupyter server stopped.'
+ case $1 in
+ run_pre_start
+ echo 'Starting Jupyter server...'
+ logger -t jupyter
+ case $1 in
+ run_start
+ KEY_PATH=/home/ec2-user/.jupyter/notebookkey.key
+ CERT_PATH=/home/ec2-user/.jupyter/notebookcert.pem
+ '[' '!' -f /home/ec2-user/.jupyter/notebookkey.key ']'
+ '[' '!' -f /home/ec2-user/.jupyter/notebookcert.pem ']'
+ case $1 in
+ run_post_start
+ echo 'Self-signed certificate and key already exist at /home/ec2-user/.jupyter/notebookcert.pem and /home/ec2-user/.jupyter/notebookkey.key.'
+ logger -t jupyter
+ logger -t jupyter
+ echo 'Jupyter server launched.'
++ jq .csrf_check /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ CSRF_CHECK=enabled
+ [[ enabled == \d\i\s\a\b\l\e\d ]]
+ [[ enabled == \e\n\a\b\l\e\d ]]
++ jq .notebook_uri /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ ALLOWED_URI_PATTERN='https:\/\/(689b7809-ff37-44c1-a3f2-196deb912119|689b7809-ff37-44c1-a3f2-196deb912119).notebook.us-east-1.sagemaker.aws'
+ logger -t jupyter
+ echo 'Launching Jupyter server with csrf check enabled...'
+ exec su -s /bin/sh -l -c 'PATH=/home/ec2-user/anaconda3/bin:$PATH && source activate JupyterSystemEnv && exec "$0" "$@"' ec2-user -- jupyter notebook --notebook-dir=/home/ec2-user/SageMaker/ --ip=0.0.0.0 --NotebookApp.token=[REDACTED]
[I 13:39:50.651 NotebookApp] [nb_conda_kernels] enabled, 11 kernels found
[I 13:39:50.691 NotebookApp] Authentication of /metrics is OFF, since other authentication is disabled.
[W 13:39:50.926 NotebookApp] All authentication is disabled.  Anyone who can connect to this server will be able to run code.
[I 13:39:51.462 NotebookApp] JupyterLab extension loaded from /home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/jupyterlab
[I 13:39:51.462 NotebookApp] JupyterLab application directory is /home/ec2-user/anaconda3/envs/JupyterSystemEnv/share/jupyter/lab
[I 13:39:52.047 NotebookApp] [nb_conda] enabled
[W 13:39:52.264 NotebookApp] Error loading server extension nbdime
    Traceback (most recent call last):
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/notebookapp.py", line 2050, in init_server_extensions
        func(self)
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/__init__.py", line 17, in load_jupyter_server_extension
        from .webapp.nb_server_extension import _load_jupyter_server_extension
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nb_server_extension.py", line 27, in <module>
        from .nbdimeserver import (
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nbdimeserver.py", line 16, in <module>
        from notebook import DEFAULT_STATIC_FILES_PATH
    ImportError: cannot import name 'DEFAULT_STATIC_FILES_PATH' from 'notebook' (/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/__init__.py)
[I 13:39:53.354 NotebookApp] sparkmagic extension enabled!
[I 13:39:53.356 NotebookApp] Serving notebooks from local directory: /home/ec2-user/SageMaker
[I 13:39:53.356 NotebookApp] Jupyter Notebook 6.5.7 is running at:
[I 13:39:53.356 NotebookApp] https://ip-172-16-82-151.ec2.internal:8443/
[I 13:39:53.356 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 13:39:53.359 NotebookApp] No web browser found: could not locate runnable browser.
[I 13:40:33.880 NotebookApp] Build is up to date
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: MissingIDFieldWarning: Cell is missing an id field, this will become a hard error in future nbformat versions. You may want to use `normalize()` on your notebooks before validations (available since nbformat 5.1.4). Previous versions of nbformat are fixing this issue transparently, and will stop doing so in the future.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '3019e08e' detected. Corrected to '8fceb7a5'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'ce5723a5' detected. Corrected to '1a87945a'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'bb02351a' detected. Corrected to 'e5579126'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '5f6e3f85' detected. Corrected to '24f74f77'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '8d636275' detected. Corrected to '96063ad0'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '8f82e791' detected. Corrected to '95677c02'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'f95bab56' detected. Corrected to '9369ca61'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'cb187715' detected. Corrected to 'cbf2f01e'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '9d1a92ce' detected. Corrected to '375deba2'.
  validate(nb)
[E 13:40:35.935 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][7]:
    {'cell_type': 'markdown',
     'execution_count': 10,
     'id': 'c2e488ba-455b-42d5-92af-f8c63b254028',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T17:07:04.101715Z',
                                  'start_time': '2023-09-22T17:07:04.092727Z'}},
     'outputs': ['...0 outputs...'],
     'source': '## Define pipeline steps'}
[E 13:40:35.943 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][5]:
    {'cell_type': 'markdown',
     'execution_count': 9,
     'id': 'eb1e4035-df62-4370-ac26-af14c025b503',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T16:53:32.158974Z',
                                  'start_time': '2023-09-22T16:53:31.520437Z'}},
     'outputs': ['...0 outputs...'],
     'source': 'Next, run the cell bellow to install all dependencies required '
               'b...'}
[E 13:40:35.951 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][7]:
    {'cell_type': 'markdown',
     'execution_count': 10,
     'id': 'c2e488ba-455b-42d5-92af-f8c63b254028',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T17:07:04.101715Z',
                                  'start_time': '2023-09-22T17:07:04.092727Z'}},
     'outputs': ['...0 outputs...'],
     'source': '## Define pipeline steps'}
[E 13:40:35.960 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][7]:
    {'cell_type': 'markdown',
     'execution_count': 10,
     'id': 'c2e488ba-455b-42d5-92af-f8c63b254028',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T17:07:04.101715Z',
                                  'start_time': '2023-09-22T17:07:04.092727Z'}},
     'outputs': ['...0 outputs...'],
     'source': '## Define pipeline steps'}
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'f207c2b8' detected. Corrected to 'ab3e6128'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '66b60a2b' detected. Corrected to '5c74aadb'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '207aa954' detected. Corrected to 'f7655f82'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'a8f18b23' detected. Corrected to '70aacea7'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '2f21e958' detected. Corrected to '1120fa61'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'a56a7e16' detected. Corrected to '907fbb79'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'motivated-cattle' detected. Corrected to 'c299849a'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '8c8a3cea' detected. Corrected to '9ca39007'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '09323c51-6cb3-4a7d-9c7a-ef3b41e63248' detected. Corrected to 'a5818255'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '5ef72609-b294-4cce-a917-6629581c2ac6' detected. Corrected to 'abc964bf'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '09323c51-6cb3-4a7d-9c7a-ef3b41e63248' detected. Corrected to '3dc23b98'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'ae16b7f1' detected. Corrected to '46846274'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '2f919041' detected. Corrected to 'f8f06749'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '09ea5c99' detected. Corrected to 'e7cefc0f'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '27811923-bb05-4bae-a8dc-eaf6887a72ab' detected. Corrected to 'b6ec1898'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'a64814c4-c157-4162-b859-6180ef5f0ff2' detected. Corrected to '423dbeb9'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '1b2aebda' detected. Corrected to '152be14e'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'f10765e2' detected. Corrected to 'c729efe4'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '80b9b865' detected. Corrected to '2a0e3ed2'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '33386bb3' detected. Corrected to 'f6bf2f00'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '17c9b56d' detected. Corrected to '4afe9685'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'e950fa8e' detected. Corrected to 'ec8802b8'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'dc468afe' detected. Corrected to '9253ee30'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '9b08c378' detected. Corrected to '4f7af616'.
  validate(nb)
[E 13:40:38.376 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'da6f1605',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:40:38.466 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'bb71225a',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:40:38.469 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'b5d4bf05',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:40:38.476 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'fa3c7af7',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:40:38.487 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': '41591bd8',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:40:38.495 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'c21cd2bf',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:40:38.606 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': '08d29d66',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:40:38.653 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': '2f3fcfea',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
+ case $1 in
+ run_pre_start
+ echo 'Starting Jupyter server...'
+ logger -t jupyter
+ case $1 in
+ run_post_start
+ echo 'Jupyter server launched.'
+ logger -t jupyter
+ case $1 in
+ run_start
+ KEY_PATH=/home/ec2-user/.jupyter/notebookkey.key
+ CERT_PATH=/home/ec2-user/.jupyter/notebookcert.pem
+ '[' '!' -f /home/ec2-user/.jupyter/notebookkey.key ']'
+ logger -t jupyter
+ echo 'Generating self-signed certificate and key to /home/ec2-user/.jupyter/notebookcert.pem and /home/ec2-user/.jupyter/notebookkey.key...'
+ sudo -u ec2-user openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -sha256 -keyout /home/ec2-user/.jupyter/notebookkey.key -out /home/ec2-user/.jupyter/notebookcert.pem -subj /CN=sagemaker
Generating a 2048 bit RSA private key
..............................................................+++
..............................+++
writing new private key to '/home/ec2-user/.jupyter/notebookkey.key'
-----
+ echo 'Self-signed certificate generated.'
+ logger -t jupyter
++ jq .csrf_check /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ CSRF_CHECK=enabled
+ [[ enabled == \d\i\s\a\b\l\e\d ]]
+ [[ enabled == \e\n\a\b\l\e\d ]]
++ jq .notebook_uri /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ ALLOWED_URI_PATTERN='https:\/\/(689b7809-ff37-44c1-a3f2-196deb912119|689b7809-ff37-44c1-a3f2-196deb912119).notebook.us-east-1.sagemaker.aws'
+ logger -t jupyter
+ echo 'Launching Jupyter server with csrf check enabled...'
+ exec su -s /bin/sh -l -c 'PATH=/home/ec2-user/anaconda3/bin:$PATH && source activate JupyterSystemEnv && exec "$0" "$@"' ec2-user -- jupyter notebook --notebook-dir=/home/ec2-user/SageMaker/ --ip=0.0.0.0 --NotebookApp.token=[REDACTED]
[I 13:51:15.823 NotebookApp] Using EnvironmentKernelSpecManager...
[I 13:51:15.881 NotebookApp] Started periodic updates of the kernel list (every 3 minutes).
[I 13:51:18.082 NotebookApp] Writing notebook server cookie secret to /home/ec2-user/.local/share/jupyter/runtime/notebook_cookie_secret
[I 13:51:18.082 NotebookApp] Authentication of /metrics is OFF, since other authentication is disabled.
[W 13:51:24.873 NotebookApp] All authentication is disabled.  Anyone who can connect to this server will be able to run code.
[I 13:51:33.868 NotebookApp] JupyterLab extension loaded from /home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/jupyterlab
[I 13:51:33.868 NotebookApp] JupyterLab application directory is /home/ec2-user/anaconda3/envs/JupyterSystemEnv/share/jupyter/lab
[I 13:51:37.475 NotebookApp] [nb_conda] enabled
[W 13:51:40.460 NotebookApp] Error loading server extension nbdime
    Traceback (most recent call last):
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/notebookapp.py", line 2050, in init_server_extensions
        func(self)
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/__init__.py", line 17, in load_jupyter_server_extension
        from .webapp.nb_server_extension import _load_jupyter_server_extension
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nb_server_extension.py", line 27, in <module>
        from .nbdimeserver import (
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nbdimeserver.py", line 16, in <module>
        from notebook import DEFAULT_STATIC_FILES_PATH
    ImportError: cannot import name 'DEFAULT_STATIC_FILES_PATH' from 'notebook' (/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/__init__.py)
[I 13:51:57.229 NotebookApp] sparkmagic extension enabled!
[I 13:51:57.230 NotebookApp] Serving notebooks from local directory: /home/ec2-user/SageMaker
[I 13:51:57.230 NotebookApp] Jupyter Notebook 6.5.7 is running at:
[I 13:51:57.230 NotebookApp] https://ip-172-16-88-134.ec2.internal:8443/
[I 13:51:57.230 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 13:51:57.234 NotebookApp] No web browser found: could not locate runnable browser.
[I 13:51:57.235 NotebookApp] Starting initial scan of virtual environments...
[I 13:53:09.251 NotebookApp] Found new kernels in environments: conda_python3, conda_pytorch_p310, conda_tensorflow2_p310
Session terminated, killing shell...[C 13:56:37.489 NotebookApp] received signal 15, stopping
[I 13:56:37.489 NotebookApp] Shutting down 0 kernels
[I 13:56:37.489 NotebookApp] Shutting down 0 terminals
 ...killed.
+ case $1 in
+ run_post_stop
+ logger -t jupyter
+ echo 'Jupyter server stopped.'
+ case $1 in
+ run_pre_start
+ echo 'Starting Jupyter server...'
+ logger -t jupyter
+ case $1 in
+ run_post_start
+ case $1 in
+ run_start
+ KEY_PATH=/home/ec2-user/.jupyter/notebookkey.key
+ CERT_PATH=/home/ec2-user/.jupyter/notebookcert.pem
+ '[' '!' -f /home/ec2-user/.jupyter/notebookkey.key ']'
+ '[' '!' -f /home/ec2-user/.jupyter/notebookcert.pem ']'
+ echo 'Self-signed certificate and key already exist at /home/ec2-user/.jupyter/notebookcert.pem and /home/ec2-user/.jupyter/notebookkey.key.'
+ logger -t jupyter
+ logger -t jupyter
+ echo 'Jupyter server launched.'
++ jq .csrf_check /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ CSRF_CHECK=enabled
+ [[ enabled == \d\i\s\a\b\l\e\d ]]
+ [[ enabled == \e\n\a\b\l\e\d ]]
++ jq .notebook_uri /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ ALLOWED_URI_PATTERN='https:\/\/(689b7809-ff37-44c1-a3f2-196deb912119|689b7809-ff37-44c1-a3f2-196deb912119).notebook.us-east-1.sagemaker.aws'
+ echo 'Launching Jupyter server with csrf check enabled...'
+ logger -t jupyter
+ exec su -s /bin/sh -l -c 'PATH=/home/ec2-user/anaconda3/bin:$PATH && source activate JupyterSystemEnv && exec "$0" "$@"' ec2-user -- jupyter notebook --notebook-dir=/home/ec2-user/SageMaker/ --ip=0.0.0.0 --NotebookApp.token=[REDACTED]
[I 13:56:42.357 NotebookApp] [nb_conda_kernels] enabled, 11 kernels found
[I 13:56:42.395 NotebookApp] Authentication of /metrics is OFF, since other authentication is disabled.
[W 13:56:42.630 NotebookApp] All authentication is disabled.  Anyone who can connect to this server will be able to run code.
[I 13:56:43.152 NotebookApp] JupyterLab extension loaded from /home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/jupyterlab
[I 13:56:43.152 NotebookApp] JupyterLab application directory is /home/ec2-user/anaconda3/envs/JupyterSystemEnv/share/jupyter/lab
[I 13:56:43.590 NotebookApp] [nb_conda] enabled
[W 13:56:43.650 NotebookApp] Error loading server extension nbdime
    Traceback (most recent call last):
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/notebookapp.py", line 2050, in init_server_extensions
        func(self)
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/__init__.py", line 17, in load_jupyter_server_extension
        from .webapp.nb_server_extension import _load_jupyter_server_extension
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nb_server_extension.py", line 27, in <module>
        from .nbdimeserver import (
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nbdimeserver.py", line 16, in <module>
        from notebook import DEFAULT_STATIC_FILES_PATH
    ImportError: cannot import name 'DEFAULT_STATIC_FILES_PATH' from 'notebook' (/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/__init__.py)
[I 13:56:44.198 NotebookApp] sparkmagic extension enabled!
[I 13:56:44.200 NotebookApp] Serving notebooks from local directory: /home/ec2-user/SageMaker
[I 13:56:44.200 NotebookApp] Jupyter Notebook 6.5.7 is running at:
[I 13:56:44.200 NotebookApp] https://ip-172-16-88-134.ec2.internal:8443/
[I 13:56:44.200 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 13:56:44.203 NotebookApp] No web browser found: could not locate runnable browser.
[I 13:57:35.976 NotebookApp] Build is up to date
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: MissingIDFieldWarning: Cell is missing an id field, this will become a hard error in future nbformat versions. You may want to use `normalize()` on your notebooks before validations (available since nbformat 5.1.4). Previous versions of nbformat are fixing this issue transparently, and will stop doing so in the future.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '3019e08e' detected. Corrected to '40114048'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'ce5723a5' detected. Corrected to '53dbe8ae'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'bb02351a' detected. Corrected to '35f2796a'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '5f6e3f85' detected. Corrected to '09e883c4'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '8d636275' detected. Corrected to '90b846a7'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '8f82e791' detected. Corrected to '040e8a6f'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'f95bab56' detected. Corrected to 'b2925f3e'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'cb187715' detected. Corrected to '1358bf5d'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '9d1a92ce' detected. Corrected to '3dcccb21'.
  validate(nb)
[E 13:57:38.013 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][7]:
    {'cell_type': 'markdown',
     'execution_count': 10,
     'id': 'c2e488ba-455b-42d5-92af-f8c63b254028',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T17:07:04.101715Z',
                                  'start_time': '2023-09-22T17:07:04.092727Z'}},
     'outputs': ['...0 outputs...'],
     'source': '## Define pipeline steps'}
[E 13:57:38.020 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][5]:
    {'cell_type': 'markdown',
     'execution_count': 9,
     'id': 'eb1e4035-df62-4370-ac26-af14c025b503',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T16:53:32.158974Z',
                                  'start_time': '2023-09-22T16:53:31.520437Z'}},
     'outputs': ['...0 outputs...'],
     'source': 'Next, run the cell bellow to install all dependencies required '
               'b...'}
[E 13:57:38.031 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][7]:
    {'cell_type': 'markdown',
     'execution_count': 10,
     'id': 'c2e488ba-455b-42d5-92af-f8c63b254028',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T17:07:04.101715Z',
                                  'start_time': '2023-09-22T17:07:04.092727Z'}},
     'outputs': ['...0 outputs...'],
     'source': '## Define pipeline steps'}
[E 13:57:38.042 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('execution_count', 'outputs' were unexpected)
    
    Failed validating 'additionalProperties' in markdown_cell:
    
    On instance['cells'][7]:
    {'cell_type': 'markdown',
     'execution_count': 10,
     'id': 'c2e488ba-455b-42d5-92af-f8c63b254028',
     'metadata': {'ExecuteTime': {'end_time': '2023-09-22T17:07:04.101715Z',
                                  'start_time': '2023-09-22T17:07:04.092727Z'}},
     'outputs': ['...0 outputs...'],
     'source': '## Define pipeline steps'}
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'f207c2b8' detected. Corrected to '4c6566de'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '66b60a2b' detected. Corrected to 'bd71c259'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '207aa954' detected. Corrected to '162e4d30'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'a8f18b23' detected. Corrected to '04c438ab'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '2f21e958' detected. Corrected to '8f3661e5'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'a56a7e16' detected. Corrected to '4994ac29'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'motivated-cattle' detected. Corrected to 'c16f0c96'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '8c8a3cea' detected. Corrected to '012bd6aa'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '09323c51-6cb3-4a7d-9c7a-ef3b41e63248' detected. Corrected to 'e5b157a2'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '5ef72609-b294-4cce-a917-6629581c2ac6' detected. Corrected to '4aa3dba2'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '09323c51-6cb3-4a7d-9c7a-ef3b41e63248' detected. Corrected to '184ca409'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'ae16b7f1' detected. Corrected to 'a420a5f1'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '2f919041' detected. Corrected to 'b8947866'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '09ea5c99' detected. Corrected to '4bcefa6e'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '27811923-bb05-4bae-a8dc-eaf6887a72ab' detected. Corrected to '4265ac43'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'a64814c4-c157-4162-b859-6180ef5f0ff2' detected. Corrected to 'ff4f4943'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '1b2aebda' detected. Corrected to '3dfa2816'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'f10765e2' detected. Corrected to 'd823750e'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '80b9b865' detected. Corrected to '00c6ed3b'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '33386bb3' detected. Corrected to '52a2ef17'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '17c9b56d' detected. Corrected to '46d56eb5'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'e950fa8e' detected. Corrected to '136bd677'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id 'dc468afe' detected. Corrected to '906a5e7b'.
  validate(nb)
/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbformat/__init__.py:96: DuplicateCellId: Non-unique cell id '9b08c378' detected. Corrected to '5663d2bf'.
  validate(nb)
[E 13:57:40.414 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'da6f1605',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:57:40.502 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'bb71225a',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:57:40.505 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'b5d4bf05',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:57:40.512 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'fa3c7af7',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:57:40.523 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': '41591bd8',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:57:40.531 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': 'c21cd2bf',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:57:40.640 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': '08d29d66',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[E 13:57:40.688 NotebookApp] Notebook JSON is invalid: Additional properties are not allowed ('id' was unexpected)
    
    Failed validating 'additionalProperties' in code_cell:
    
    On instance['cells'][2]:
    {'cell_type': 'code',
     'execution_count': None,
     'id': '2f3fcfea',
     'metadata': {},
     'outputs': ['...0 outputs...'],
     'source': '# Run this cell to load the video\n'
               'from IPython.display import di...'}
[I 14:00:58.766 NotebookApp] New terminal with automatic name: 1
TermSocket.open: 1
TermSocket.open: Opened 1
+ case $1 in
+ run_pre_start
+ logger -t jupyter
+ echo 'Starting Jupyter server...'
+ case $1 in
+ run_post_start
+ logger -t jupyter
+ echo 'Jupyter server launched.'
+ case $1 in
+ run_start
+ KEY_PATH=/home/ec2-user/.jupyter/notebookkey.key
+ CERT_PATH=/home/ec2-user/.jupyter/notebookcert.pem
+ '[' '!' -f /home/ec2-user/.jupyter/notebookkey.key ']'
+ logger -t jupyter
+ echo 'Generating self-signed certificate and key to /home/ec2-user/.jupyter/notebookcert.pem and /home/ec2-user/.jupyter/notebookkey.key...'
+ sudo -u ec2-user openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -sha256 -keyout /home/ec2-user/.jupyter/notebookkey.key -out /home/ec2-user/.jupyter/notebookcert.pem -subj /CN=sagemaker
Generating a 2048 bit RSA private key
..................+++
...+++
writing new private key to '/home/ec2-user/.jupyter/notebookkey.key'
-----
+ echo 'Self-signed certificate generated.'
+ logger -t jupyter
++ jq .csrf_check /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ CSRF_CHECK=enabled
+ [[ enabled == \d\i\s\a\b\l\e\d ]]
+ [[ enabled == \e\n\a\b\l\e\d ]]
++ jq .notebook_uri /etc/opt/ml/sagemaker-notebook-instance-config.json -r
+ ALLOWED_URI_PATTERN='https:\/\/(689b7809-ff37-44c1-a3f2-196deb912119|689b7809-ff37-44c1-a3f2-196deb912119).notebook.us-east-1.sagemaker.aws'
+ echo 'Launching Jupyter server with csrf check enabled...'
+ logger -t jupyter
+ exec su -s /bin/sh -l -c 'PATH=/home/ec2-user/anaconda3/bin:$PATH && source activate JupyterSystemEnv && exec "$0" "$@"' ec2-user -- jupyter notebook --notebook-dir=/home/ec2-user/SageMaker/ --ip=0.0.0.0 --NotebookApp.token=[REDACTED]
[I 14:14:30.452 NotebookApp] Using EnvironmentKernelSpecManager...
[I 14:14:30.550 NotebookApp] Started periodic updates of the kernel list (every 3 minutes).
[I 14:14:32.678 NotebookApp] Writing notebook server cookie secret to /home/ec2-user/.local/share/jupyter/runtime/notebook_cookie_secret
[I 14:14:32.679 NotebookApp] Authentication of /metrics is OFF, since other authentication is disabled.
[W 14:14:39.189 NotebookApp] All authentication is disabled.  Anyone who can connect to this server will be able to run code.
[I 14:14:48.332 NotebookApp] JupyterLab extension loaded from /home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/jupyterlab
[I 14:14:48.332 NotebookApp] JupyterLab application directory is /home/ec2-user/anaconda3/envs/JupyterSystemEnv/share/jupyter/lab
[I 14:14:51.704 NotebookApp] [nb_conda] enabled
[W 14:14:54.261 NotebookApp] Error loading server extension nbdime
    Traceback (most recent call last):
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/notebookapp.py", line 2050, in init_server_extensions
        func(self)
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/__init__.py", line 17, in load_jupyter_server_extension
        from .webapp.nb_server_extension import _load_jupyter_server_extension
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nb_server_extension.py", line 27, in <module>
        from .nbdimeserver import (
      File "/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/nbdime/webapp/nbdimeserver.py", line 16, in <module>
        from notebook import DEFAULT_STATIC_FILES_PATH
    ImportError: cannot import name 'DEFAULT_STATIC_FILES_PATH' from 'notebook' (/home/ec2-user/anaconda3/envs/JupyterSystemEnv/lib/python3.10/site-packages/notebook/__init__.py)
[I 14:15:09.951 NotebookApp] sparkmagic extension enabled!
[I 14:15:09.952 NotebookApp] Serving notebooks from local directory: /home/ec2-user/SageMaker
[I 14:15:09.952 NotebookApp] Jupyter Notebook 6.5.7 is running at:
[I 14:15:09.952 NotebookApp] https://ip-172-16-72-93.ec2.internal:8443/
[I 14:15:09.952 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 14:15:09.956 NotebookApp] No web browser found: could not locate runnable browser.
[I 14:15:09.956 NotebookApp] Starting initial scan of virtual environments...
[I 14:16:09.238 NotebookApp] Found new kernels in environments: conda_python3, conda_tensorflow2_p310, conda_pytorch_p310
[I 14:20:33.768 NotebookApp] Found new kernels in environments: conda_glue_scala, conda_glue_pyspark
