#!/bin/bash

directory="$1"

echo
read -p "This script replaces all special chars (\-, etc) in this directory. Are you sure? y/n " -n 1 -r
echo    
echo
if [[ $REPLY =~ ^[YyTt]$ ]]
then
	find "$directory" -iname "*.pdf" -print | while read file
	do
		title=`exiftool -t -Title "$file" | cut -f2 -s`
  		title_clean=${title//[\\()&\'\,\®,\?,\!,\",\.,\™,\/,\|,\.,\…]/}
		path_temp=`realpath "$file"`
		path_final=`dirname "$path_temp"`
		#echo "$file -> $path_final/$title_clean.pdf"
  		mv -v "$file" "$path_final/$title_clean.pdf" #2>/dev/null
	done
fi

