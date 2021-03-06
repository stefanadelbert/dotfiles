#!/bin/bash

set -e

FILES_CONFIG=files.conf

if [[ ! -e ${FILES_CONFIG} ]]; then
	echo "Coulnd't file required configuration file ${FILES_CONFIG}"
	exit 1
fi

ROOT=$HOME
DOTFILE_DIR=${ROOT}/dotfiles # dotfiles directory
OLD_DOTFILE_DIR=${ROOT}/dotfiles.old # old dotfiles backup directory
FILES=$(cat ${FILES_CONFIG})

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
    if [[ -z ${file} ]]; then
        continue
    fi

    OLD_FILE=${ROOT}/.${file}
    if [[ -e ${OLD_FILE} || -h ${OLD_FILE} ]]
    then
        echo "Moving existing ${OLD_FILE}"
        mv ${ROOT}/.${file} ${OLD_DOTFILE_DIR}/${file}
    fi
    echo "Creating symlink to ${file} in ${ROOT}"
	if [[ -e ${DOTFILE_DIR}/${HOSTNAME}.${file} ]]; then
		# Check for a host specific version of the file and use
		# it if it exists.
		ln -s ${DOTFILE_DIR}/${HOSTNAME}.${file} ~/.${file}
	else
		# No host specific file exists, so use the generic one.
		ln -s ${DOTFILE_DIR}/${file} ~/.${file}
	fi
done
)
