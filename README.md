#dotfiles

This repository contains my dotfiles for Linux and a script to set up symlinks.

`deploy.sh` requires a `dotfiles.cfg` which lists the source (relative to the directory of `deploy.sh`) and destination (relative to `$HOME`) of each symlink. For example,

```
bashrc=.bashrc
vimrc=.vimrc
i3=.i3
```

instructs `deploy.sh` to symlink `.../dotfiles/bashrc` to `~/.bashrc`, `.../dotfiles/i3` to `~/.i3`, and so forth. Both directories and files may be listed as sources. If the destination already exists, `deploy.sh` will make a backup named `file.old` before creating the new symlink. Blank lines in `dotfiles.cfg` are permissible (to make the file easier to read).
