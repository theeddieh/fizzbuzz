#!/bin/bash

start=${1:-1}
end=${2:-100}

fizz=${3:-3}
buzz=${4:-5}
fizzbuzz=$(( ${fizz} * ${buzz} ))


echo "starting from: ${start}"
echo "ending with:   ${end}"

echo "fizz:     ${fizz}"
echo "buzz:     ${buzz}"
echo "fizzbuzz: ${fizzbuzz}"

# $1: number
# $2: string
write_out() {

    if [[ -n ${2} ]]; then
        printf "%s " "${2}"
    else
        printf "%d " "${1}"
    fi

    # echo "${1}: ${2}"
}

for ((i = "${start}" ; i < "${end}" ; i++)); do

    if ! (( i % ${fizzbuzz} )); then
        write_out "${i}" "fizzbuzz"
    elif ! (( i % ${fizz} )); then
        write_out "${i}" "fizz"
    elif ! (( i % ${buzz} )); then
        write_out "${i}" "buzz"
    else
        # comment out to skip non-matches
        write_out "${i}" ""
    fi 

done
