#dotfiles

This repository contains my dotfiles for Linux, as well as a deploy script to set up symlinks to the correct destinations.

To use the _deploy.py script, copy your dotfiles somewhere under the same directory as the script, and add a `config.json` file.
The `config.json` file should be a single object, with key-value pairs as strings in the format `"dotfile": "destination"`. For example:

```json
{
	"bashrc": "~/.bashrc",
	"vimrc": "~/.vimrc",
	"tmux.conf": "~/.tmux.conf"
}
```

(Using the `~` to indicate home directory is acceptable, as it is replaced by the script with your own home directory.)

If the destination is a directory, the script will leave it alone. If it is a file or existing link, it will make a backup of the file as `file.old` before creating the new symlink.
