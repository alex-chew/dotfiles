#!/usr/bin/env python

import os
import subprocess
import sys


find_cmd = 'cd {}; find . -path "{}" | cut -c 3-'
rofi_cmd = 'rofi -levenshtein-sort -dmenu -i -no-custom -p "book: " -format i'
open_cmd = 'xdg-open {}'


def basename(path):
    return subprocess.check_output('basename "{}"'.format(path),
            shell=True)[:-1]

if len(sys.argv) > 1 and sys.argv[1]:
    base = '~/school/books'
    search = '*.pdf'
else:
    base = '~/qd'
    search = '*/books/*.pdf'

books = subprocess.check_output(find_cmd.format(base, search),
        shell=True).split('\n')
books = filter(None, books)

try:
    fnames = '\n'.join(map(basename, books))
    booknum = subprocess.check_output('echo "{}" | {}'.format(fnames,
        rofi_cmd), shell=True)[:-1]
except subprocess.CalledProcessError: # pressed Esc or something at the prompt
    sys.exit(0)

book = os.path.join(base, books[int(booknum)]).replace(' ', '\\ ')
subprocess.call(open_cmd.format(book), shell=True)
print(open_cmd.format(book))
