# dotfiles

This repository contains my dotfiles for Linux, and scripts to render templates (for different themes) and set up symlinks.

## Usage

First, define [mustache](https://mustache.github.io/) template files (stored in `templates/`).
For example, `templates/vimrc`:
```vim
set nocompatible
colorscheme {{ vim.color }}
```

Next, define [YAML](http://yaml.org/) theme files (conventionally stored in `themes/`).
For example, `themes/default.yml`:
```yaml
vim:
  color: desert
```

Next, define a `dotfiles.cfg` which maps templates (relative to `templates/`) to their ultimate destinations (relative to `$HOME`).
For example, `dotfiles.cfg`:
```
vimrc=.vimrc
```

Finally, render the contents of `templates/` to `out/` using `render`, and set up the appropriate symlinks using `deploy`:
```
$ ./render themes/default.yml
$ ./deploy
```

This creates `~/.vimrc` which is symlinked to `out/vimrc` which contains
```vim
set nocompatible
colorscheme desert
```

In `dotfiles.cfg`, both directories and files may be listed as templates.
If the destination `dest` already exists, `deploy` will rename it to `dest.old` before creating the new symlink.
Blank lines in `dotfiles.cfg` are permissible (to make the file easier to read).
