import sys

from neovim import attach


def send_cmd(path):
    attach('socket', path=path).command('source $MYVIMRC | AirlineRefresh')

if len(sys.argv) < 2:
    sys.exit('Usage: {} socket_lines')
list(map(send_cmd, sys.argv[1].split()))

