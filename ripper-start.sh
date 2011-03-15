#!/bin/bash


# This script is used to transform all ripped html files to beautiful pdfs
# You need to download the website first, using ScapBook Firefox Add-On for example.
# The process looks like this:
# 1/ search for all html files in this directory 
# 2/ identify the website core content and extract it (extractor.py)
# 3/ insert your own headers and footers (extractor.py)
# 4/ convert to beautiful pdf file using Prince XML
# 5/ finally, copy all the pdfs to one directory

path_in="$1"
path_out="$2"

echo
read -p "This script will generate a lot of temporary files. Are you ready? y/n " -n 1 -r
echo    
if [[ $REPLY =~ ^[YyTt]$ ]]
then

	n=0
	find $path_in -iname "index.html" | \
	while read I;
	do
		n=$((n+1))
		path_dir=`dirname $I`
		#path_category=`python cataloger.py $I 2>/dev/null`
		python extractor.py $I | (cd $path_dir && prince -i html - -o "$path_out/$n.pdf")
		echo "Om nom nom... $path_dir -> $path_out/$path_category/$n.pdf"
	done
fi


