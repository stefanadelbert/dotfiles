#!/bin/bash

function usage {
	echo "$0 <version> <date>"
	echo
	echo "  <date>       (optional) YYYY/MM/DD, defaults to today. Can be anything that 'date' understands."
}

if [[ $1 == "-h" || $1 == "--help" ]]; then
	usage
	exit 0
elif [[ 1 -eq $# ]]; then
	DATE=$(date +"%Y/%m/%d")
else
	DATE=$(date -d $2 +"%Y/%m/%d")
fi

# Now use ${DATE} in a command
