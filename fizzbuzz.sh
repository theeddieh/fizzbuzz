#!/bin/bash

start=${1:-1}
end=${2:-101}

fizz=${3:-3}
buzz=${4:-5}
fizzbuzz=$(( ${fizz} * ${buzz} ))

output="README.md"

echo '```' > "${output}"

echo "starting from: ${start}" >> "${output}"
echo "ending with:   ${end}" >> "${output}"

echo "fizz:     ${fizz}" >> "${output}"
echo "buzz:     ${buzz}" >> "${output}"
echo "fizzbuzz: ${fizzbuzz}" >> "${output}"

echo "output: ${output}" >> "${output}"

echo

# $1: number
# $2: string
write_out() {

    # if [[ -n ${2} ]]; then
    #     printf "%s " "${2}"
    # else
    #     printf "%d " "${1}"
    # fi

    echo "${1}: ${2}" >> "${output}"
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

echo '```' >> "${output}"
