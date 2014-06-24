#!/bin/bash

set -e

ROOT=$HOME
DOTFILE_DIR=${ROOT}/dotfiles # dotfiles directory
OLD_DOTFILE_DIR=${ROOT}/dotfiles.old # old dotfiles backup directory
FILES="bashrc vimrc vim i3 i3status.conf" # list of files/folders to symlink in homedir

# Run the below in a subshell so that the absolute directory changes
# don't affect the current directory of the context of where this script
# is run from.
(
echo "Changing to ${ROOT} directory"
cd ${ROOT}

# Create backup directory.
if [[ -d ${OLD_DOTFILE_DIR} ]]
then
    echo "Removing existing backup ${OLD_DOTFILE_DIR}"
    rm -rf ${OLD_DOTFILE_DIR}
fi
echo "Creating ${OLD_DOTFILE_DIR} for backup"
mkdir -p ${OLD_DOTFILE_DIR}

# change to the dotfiles directory
echo "Changing to the ${DOTFILE_DIR} directory"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks 
for file in ${FILES}
do
    OLD_FILE=${ROOT}/.${file}
    if [[ -e ${OLD_FILE} || -h ${OLD_FILE} ]]
    then
        echo "Moving existing ${OLD_FILE}"
        mv ${ROOT}/.${file} ${OLD_DOTFILE_DIR}/${file}
    fi
    echo "Creating symlink to ${file} in ${ROOT}"
    ln -s ${DOTFILE_DIR}/${file} ~/.${file}
done
)
