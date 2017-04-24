#!/usr/bin/env python3

from panflute import *

def is_bullet_item(elem):
    return (isinstance(elem, (Plain, Para))
            and isinstance(elem.parent, ListItem))

def checkitem_html(checked):
    return RawInline('<input type="checkbox" disabled {}>'
            .format('checked' if checked else ''))

def checkitem_latex(checked):
    return RawInline('$\\{}$'.format('boxtimes' if checked else 'square'),
            format='latex')

def checkitem_md(checked):
    return RawInline('[{}]'.format('x' if checked else ' '))

def add_checkitem(content, checked, doc):
    if doc.format.startswith('html'):
        content.insert(0, checkitem_html(checked))
    elif doc.format == 'latex':
        content.insert(0, checkitem_latex(checked))
    else:
        content.insert(0, checkitem_md(checked))

def action(elem, doc):
    if not is_bullet_item(elem):
        return

    c = elem.content
    if (isinstance(c[0], Str) and c[0].text == '[x]'
            and isinstance(c[1], Space)):
        del c[0]
        add_checkitem(c, True, doc)
    elif (isinstance(c[0], Str) and c[0].text == '['
            and isinstance(c[1], Space)
            and isinstance(c[2], Str) and c[2].text == ']'):
        del c[:3]
        add_checkitem(c, False, doc)

def main(doc=None):
    return run_filter(action, doc=doc)

if __name__ == '__main__':
    main()

