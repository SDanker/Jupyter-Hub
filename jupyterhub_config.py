import pwd, subprocess

import os, nativeauthenticator
c.JupyterHub.template_paths = [f"{os.path.dirname(nativeauthenticator.__file__)}/templates/"]

c.JupyterHub.authenticator_class = 'nativeauthenticator.NativeAuthenticator'

c.Authenticator.admin_users = {'pipa'}

def pre_spawn_hook(spawner):

    username = spawner.user.name

    try:

        pwd.getpwnam(username)

    except KeyError:

        subprocess.check_call(['useradd', '-ms', '/bin/bash', username])

c.Spawner.pre_spawn_hook = pre_spawn_hook

c.Spawner.default_url = '/lab'
