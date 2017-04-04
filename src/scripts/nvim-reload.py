#!/usr/bin/env python3

import subprocess
import sys

from neovim import attach


def send_cmd(path):
    try:
        attach('socket', path=path).command('source $MYVIMRC | AirlineRefresh')
    except:
        pass


def get_sockets():
    return (subprocess
            .run('find /tmp/nvim* -type s', shell=True, stdout=subprocess.PIPE)
            .stdout.decode('utf-8').split())


def main():
    list(map(send_cmd, get_sockets()))


if __name__ == '__main__':
    main()

