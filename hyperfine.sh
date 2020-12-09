#!/usr/bin/env bash

declare -i TIMES=4000
declare -r CMD=$*
declare -A OUTP

declare -i longest=0
declare -i shortest=$TIMES
declare -i count=0

declare -a BLOCKS=(' ' '▏' '▎' '▍' '▌' '▋' '▊' '▉' '█')

# for DD
function hf_parse() {
	awk '{ printf $10 $11 }'
}

function repeat() {
    local -r char="$1"
    local -r count="$2"
    printf %${count}s |tr " " "${char}"
}


for i in $(seq 1 $TIMES); do
	KEY=$($CMD |& hf_parse)
	(( OUTP[$KEY]+=1 ))

	VAL=${OUTP[${KEY}]}

	(( ${VAL} > $longest )) && longest=${VAL}
	(( ${VAL} < $shortest )) && shortest=${VAL}

	(( count += 1 ))
done

for k in "${!OUTP[@]}"; do
	declare -i REP=0
	declare -i VAL=${OUTP[$k]}

	echo -ne "$k\t"

	(( REP = ${VAL} / 8 )) && repeat ${BLOCKS[8]} ${REP}
	(( REP = ${VAL} % 8 )) && echo -n ${BLOCKS[${REP}]}
	echo
done | sort -h

# if number of keys is really long..print every other?
# cat filename | awk 'NR % 2 == 1'

printf "\nmin=$shortest max=$longest count=$count\n"
