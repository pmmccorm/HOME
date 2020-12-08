#!/usr/bin/env bash

declare -i TIMES=500
declare -i WIDTH=$(tput cols)
declare -r CMD=$*
declare -A OUTP

# adjust for tab beginning
(( WIDTH -= 8 ))

function hf_parse() {
	awk '{ printf $10 $11 }'
}

function repeatChar() {
    local input="$1"
    local count="$2"
    printf -v myString "%s" "%${count}s"
    printf '%s\n' "${myString// /$input}"
}

declare -i longest=0
declare -i shortest=$TIMES
declare -i count=0

for i in $(seq 1 $TIMES); do
	KEY=$($CMD |& hf_parse)
	(( OUTP[$KEY]+=1 ))
	VAL=${OUTP[$KEY]}

	(( ${VAL} > $longest )) && longest=${VAL}
	(( ${VAL} < $shortest )) && shortest=${VAL}

	(( count += 1 ))

	(( $longest >= $WIDTH )) && break
done

for k in "${!OUTP[@]}"; do
	echo -ne "$k\t"
	for v in $(seq 1 ${OUTP[$k]}); do
		echo -n '#'
	done
	echo
done | sort -h

# if number of keys is really long..print every other?
# cat filename | awk 'NR % 2 == 1'

printf "\nmin=$shortest max=$longest count=$count\n"
