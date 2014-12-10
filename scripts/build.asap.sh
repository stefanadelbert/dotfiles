#!/bin/bash

if [[ -z $1 ]]
then
	echo "-C ../.build/"
	exit 0
fi

if [[ -f $1 ]]
then
	FILEPATH=$(readlink -f $1)
	FILENAME=$(basename ${FILEPATH})
	EXTENSION="${FILENAME##*.}"
	if [[ ${EXTENSION} != "cpp" ]]
	then
		echo "ERROR # ${EXTENSION} ${FILENAME} ${FILEPATH}"
		exit 1
	fi
	BUILDPATH=$(dirname ${FILEPATH} | sed 's#\/ASAP\/#/.build/#')
	echo "-C ${BUILDPATH} ${FILENAME}.o"
	exit 0
fi

if [[ -d $1 ]]
then
	echo "Building a directory"
	exit 0
fi

