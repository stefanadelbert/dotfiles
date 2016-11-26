#!/bin/bash

# To set up a layout, do something like this. Essentially append a layout to an existing or and empty workspace.
i3-msg "workspace 3; append_layout /home/stefan/.i3/layout/remex_otp.json"

# In general there is a problem when nesting levels of calls to functions which need to have their arguments grouped (in inverted commas). It's not obvious to me how I should deal with inverted command inside inverted commas in the general case. Sure, the inside ones could be escaped and the ones inside those could be double escaped, but that doesn't scale.
# One suggestion is to finish one quoted section and then use an escaped inverted command and then start another quoted section, i.e. "abc"\""abc" yields abc"abc.

# The below command will:
#  * cd to the blackbear directory
#  * cd to the bin dir in the out of tree build
#  * switch into a running chroot
#  * run remex-cli on port 5550
# Note: the terminal will exit when remex-cli is exited. To prevent this behaviour, add an additional `bash` after the call to run remex-cli.
gnome-terminal --role "remex_otp" -e "bash -c \"cd ${BLACKBEAR_DIR}; cd build/final/debug; schroot --run-session --chroot ${CHROOT_SESSION:?} -- bash -i -c './bin/remex_otp --foreground --config config/remex_otp/remex_otp.VIVA.cfg; bash'\"" &
gnome-terminal --role "remex-cli" -e "bash -c \"cd ${BLACKBEAR_DIR}; cd build/final/debug/bin; schroot --run-session --chroot ${CHROOT_SESSION:?} -- bash -i -c './remex-cli --port 5550; bash'\"" &
gnome-terminal --role "remex log" -e "bash -c \"cd ${BLACKBEAR_DIR}; cd build/final/debug; tail -f remex.log; bash\""&
