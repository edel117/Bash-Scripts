#!/bin/bash


 filesfunction () {

existingfiles=$(ls . | tr -d [0-9] | cut -f 1 -d '.' | uniq)
#numberofuniquefiles=$(ls . | tr -d [0-9] | cut -f 1 -d '.' | uniq | wc -l)

echo "The names of files present in this folder start with: 

$(echo $existingfiles | awk 1 ORS=' ';echo)"


echo "Please select one of the present files to add 25 more files."
read filename

filearray=($existingfiles)

for file in ${filearray[@]}; do

	if [[ $filename == $file ]]; then
		echo "25 additional files have been created"
		number=$(($(echo $(ls . | grep $filename | grep -Eo '[0-9]+' | sort -g | tail -1)) + 1))
		number2=$(($number+24))

		for ((i=1;i<=number2;i++)); do
			touch ./"$filename$i"
		done
#		filearray+=("$filename")
		break
	
	else
		continue
	fi
done

if [[ ${filearray[@]} =~ (^|[[:space:]])"${filename}"($|[[:space:]]) ]]; then
	:

else
	echo "This file does not exist in the directory. 25 initial files will be created."
	for ((i=1;i<=25;i++)); do
		touch ./"$filename$i"
	done
fi


}

filesfunction
