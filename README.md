dotfiles
========

My personal dotfiles for (amongst other things):
* bash
* vim
* i3
* scripts
 
Also includes
* personal wiki (to be used with vimwiki)

# Installation
Included is a bash install script which will create a backup of existing dotfiles and then create symlinks from $HOME to a checkout of this repository.
From the checkout, e.g. `$HOME/dotfiles`, run

```$ ./install.h```

## vim
_vundle_ bear minimum are included in this repo, so all that should be required (after running the install script) is to run the following

```$ vim +BundleInstall +qall```

which will cause _vundle_ to fetch all plugins mentioned in vimrc.

## wiki

The vimrc includes the `vimwiki` plugin. Under wiki is `personalwiki` - there should be a symlink at `$HOME/wiki/personalwiki` which points back to iy.
