#!/usr/bin/env bash
set -e

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv activate neovim-python3
python <<'EOD'
import subprocess
from neovim import attach

try:
    socket_paths = (subprocess
        .run('find /tmp/nvim* -type s', shell=True, stdout=subprocess.PIPE)
        .stdout
        .decode('utf-8')
        .split())
except Exception as e:
    print(e)

for path in socket_paths:
    try:
        attach('socket', path=path).command('source $MYVIMRC | AirlineRefresh')
    except Exception as e:
        print(e)
EOD
