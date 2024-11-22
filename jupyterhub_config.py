import pwd, subprocess

import os, nativeauthenticator
c.JupyterHub.template_paths = [f"{os.path.dirname(nativeauthenticator.__file__)}/templates/"]

c.JupyterHub.authenticator_class = 'nativeauthenticator.NativeAuthenticator'

c.Authenticator.admin_users = {'admin'}

# The pre_spawn_hook function is used to create a new user on the system if it does not already exist.
def pre_spawn_hook(spawner):

    username = spawner.user.name

    try:

        pwd.getpwnam(username)

    except KeyError:

        subprocess.check_call(['useradd', '-ms', '/bin/bash', username])

c.Spawner.pre_spawn_hook = pre_spawn_hook

# The default_url setting specifies the URL that users will be redirected to after logging in.
c.Spawner.default_url = '/lab'
