import os
import sys

import pystache
import yaml


SRC_DIR = 'src'
OUT_DIR = 'out'


def get_cfg(cfg_file):
    try:
        with open(cfg_file) as cfg:
            return yaml.load(cfg)
    except:
        return None


def render(src, cfg, out):
    with open(src) as template:
        rendered = pystache.render(template.read(), cfg)
    with open(out, 'w') as output:
        output.write(rendered)


def main():
    if len(sys.argv) != 2:
        sys.exit('Usage: {} config.yml'.format(sys.argv[0]))

    cfg_file = sys.argv[1]
    cfg = get_cfg(cfg_file)
    if cfg is None:
        sys.exit('Could not read config {}'.format(cfg_file))

    for f in ['vimrc', 'termite/config']:
        src = os.path.join('src', f)
        out = os.path.join('out', f)
        render(src, cfg, out)


if __name__ == '__main__':
    main()
