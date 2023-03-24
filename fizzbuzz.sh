#!/bin/bash

start=${1:-1}
end=${2:-101}

fizz=${3:-3}
buzz=${4:-5}
fizzbuzz=$(( ${fizz} * ${buzz} ))

output="README.md"

# basic output controls
OUT_DATA=1
OUT_ARRAY=
OUT_LIST=1
OUT_README=1

if [[ -n ${OUT_README} ]]; then
    exec > ${output}

    # begin code block
    echo '# readme'
    echo '```'
fi

if [[ -n ${OUT_DATA} ]]; then
    printf "starting: %s\n"    "${start}"
    printf "ending:   %s\n"      "${end}"
    printf "fizz:     %s\n"     "${fizz}"
    printf "buzz:     %s\n"     "${buzz}"
    printf "fizzbuzz: %s\n" "${fizzbuzz}"
    printf "output:   %s\n"   "${output}"
fi

# $1: number
# $2: string
write_out() {
    if [[ -n ${OUT_ARRAY} ]]; then
        if [[ -n ${2} ]]; then
            printf "%s " "${2}"
        else
            printf "%d " "${1}"
        fi
    fi

    if [[ -n ${OUT_LIST} ]]; then
        echo "${1}: ${2}"
    fi
}

for ((i = "${start}" ; i < "${end}" ; i++)); do

    if ! (( i % ${fizzbuzz} )); then
        write_out "${i}" "fizzbuzz"
    elif ! (( i % ${fizz} )); then
        write_out "${i}" "fizz"
    elif ! (( i % ${buzz} )); then
        write_out "${i}" "buzz"
    else
        # comment out to skip non-matches, but you do need to for the array
        write_out "${i}" ""
    fi 

done

echo

if [[ -n ${OUT_README} ]]; then
    # end code block
    echo '```'
fi
