c = get_config()
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8888
c.NotebookApp.notebook_dir = '/home/jovyan'
c.NotebookApp.allow_origin = '*'
c.NotebookApp.token = ''
# 보안 위협에 노출 될 수 있으므로 반드시 password를 설정합니다. (sha)
c.NotebookApp.password = ''

