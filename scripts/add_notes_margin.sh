#!/usr/bin/env bash

# This script adds an area for note taking to the right of each page of a PDF. It does this using:
# * pdftk
# * imagemagick (convert)
# The notes area is the same size as the original PDF page size.

INPUT_FILE_PATH=$1

if [[ ! -f ${INPUT_FILE_PATH} ]]; then
	echo "Invalid input file ${INPUT_FILE_PATH}"
	exit 1
fi

INPUT_FILENAME=$(basename ${INPUT_FILE_PATH})
INPUT_FILENAME=${INPUT_FILENAME%.*}

echo "Adding note taking areas to all pages of ${INPUT_FILE_PATH}"

# Extract each page from the input PDF document.
pdftk ${INPUT_FILE_PATH} burst output tmp_${INPUT_FILENAME}_%02d.pdf

# Add a note taking area to each extracted page.
for page in tmp_${INPUT_FILENAME}_*.pdf; do
	echo "Converting page ${page}"
	# Note the use of the 'density' flag - this ensures that the resolution is not lost whenreading a PDF.
	convert -density 150 ${page} -background WhiteSmoke -extent 175%x100% -quality 100 ${page}
done

# Recreate the PDF from the modified pages.
pdftk tmp_${INPUT_FILENAME}_*.pdf cat output ${INPUT_FILENAME}.notes.pdf

# Remove intermediate files.
rm tmp_${INPUT_FILENAME}_*
rm doc_data*

echo "Done"
