#!/bin/bash

function show_selection_dialog {
    display_options=$(ls ~/.scripts/display)
    display_option=$(zenity --list --text="Select display configuration" --hide-header --column "Configuration" ${display_options})
    [ ! -z ${display_option} ] && ~/.scripts/display/${display_option}
}

[ ! -z ${BLOCK_BUTTON} ] && show_selection_dialog

echo ""
exit 0
