#!/bin/bash

NUM_OF_FILES=$((8*90))
FILE_SIZE_IN_KB=1
declare -a input

populate_dir() {
	DIR=$1
	echo Populating $DIR
	for ((I=0; I<${NUM_OF_FILES}; I++))
	do
		FILENAME=${DIR}/$(openssl rand -hex 2)
		dd bs=1K count=${FILE_SIZE_IN_KB} if=/dev/urandom of=${FILENAME} 2>/dev/null
	done
}

populate_dirs() {
	dir=($@)
	tam=$(($#-1))	
	
	for ((x=0; x<tam; x++))
	do
		populate_dir ${dir[$x]}
		#echo ${dir[$x]}
	done
}

setup() {
	rm -rf $*
	mkdir $*
}

if [ $# -le 2 ]
then
	echo "it's necessary to have at least three arguments: two inputs and one output :)"
	exit 0
fi

setup $*
populate_dirs $@
echo Done