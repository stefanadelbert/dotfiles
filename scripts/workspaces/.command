#!/bin/bash

_name="${BLOCK_NAME}"
_title="Select Workspace"
_icon=""

function show_selection_dialog {
    local _display_options=$(ls ~/.scripts/${_name})
    local _display_option=$(zenity --list --text="${_title}" --hide-header --column "header" ${_display_options})
    if [ ! -z ${_display_option} ]; then
		# There is a problem with running programs this way in that they only respond to input when the
		# status bar is active. If the status bar is normally hidden then it needs to be unhidden for
		# the program to update.
		~/.scripts/${_name}/${_display_option}
	fi
}

[ ! -z ${BLOCK_BUTTON} ] && show_selection_dialog

echo "${_icon}"
exit 0
