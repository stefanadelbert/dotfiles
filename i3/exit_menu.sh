#!/bin/bash
while [ "$SELECTION" != "No" -a "$SELECTION" != "Yes" ]; do
	SELECTION=$(echo -e 'Yes\nNo' | dmenu -nb '#111111' -nf '#555555' -sb '#001055' -sf '#AAAAAA' -i -p 'Exit?')
	#SELECTION=$(echo -e 'Yes\nNo' | dmenu -nb '#111111' -i -p 'Exit?')
	[ -z "$SELECTION" ] && exit 0
done
[ "$SELECTION" = "No" ] && exit 0
i3-msg exit
