import sys

from neovim import attach


def send_cmd(path):
    try:
        attach('socket', path=path).command('source $MYVIMRC | AirlineRefresh')
    except:
        pass

if len(sys.argv) < 2:
    sys.exit('Usage: {} socket_lines')
list(map(send_cmd, sys.argv[1].split()))

