aux() {
	for ((I=1; I<$*; I++))
	do
		populate_dirs $I
	done
}	


davaQBom(){
    for J in $*
	do
		populate_dir ${J}
	done
}

