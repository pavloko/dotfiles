Dotfiles
========
This repo includes my custom dotfiles.
Clone to your home directory so that the path is `~/.dotfiles'.

Folder includes setup script, which is smart enough to backup your existing
files into `./.dotfiles_old/` directory if you already have any dotfiles of the
same naem as the dotfiles being created in your home directory.


Installation
------------

```bash
git clone git://github.com/pavloko/dotfiles ~/.dotfiles
cd ~/dotfiles
./makesymlinks.sh
```

