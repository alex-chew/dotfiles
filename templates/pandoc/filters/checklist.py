#!/usr/bin/env python3

from panflute import *

def is_bullet_item(elem):
    return isinstance(elem, (Plain, Para)) \
        and isinstance(elem.parent, ListItem)

def add_checked_repr(content, doc):
    if doc.format.startswith('html'):
        content.insert(0, RawInline(
              '<input type="checkbox" checked disabled>'))
    elif doc.format == 'latex':
        content.insert(0, RawInline('$\\boxtimes$', format='latex'))
    else:
        content.insert(0, RawInline('[x]'))

def add_unchecked_repr(content, doc):
    if doc.format.startswith('html'):
        content.insert(0, RawInline(
              '<input type="checkbox" disabled>'))
    elif doc.format == 'latex':
        content.insert(0, RawInline('$\\square$', format='latex'))
    else:
        content.insert(0, RawInline('[ ]'))

def action(elem, doc):
    if not is_bullet_item(elem):
        return

    c = elem.content
    if isinstance(c[0], Str) and c[0].text.startswith('[x]'):
        c[0].text = c[0].text[3:]
        add_checked_repr(c, doc)
    elif (isinstance(c[0], Str) and c[0].text == '['
            and isinstance(c[1], Space)
            and isinstance(c[2], Str) and c[2].text == ']'):
        del c[:3]
        add_unchecked_repr(c, doc)

def main(doc=None):
    return run_filter(action, doc=doc)

if __name__ == '__main__':
    main()

