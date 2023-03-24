#!/bin/bash

start=${1:-0}
end=${2:-100}

fizz=${3:-3}
buzz=${4:-5}
fizzbuzz=$(( ${fizz} * ${buzz} ))


echo "starting from: ${start}"
echo "ending with:   ${end}"

echo "fizz:     ${fizz}"
echo "buzz:     ${buzz}"
echo "fizzbuzz: ${fizzbuzz}"

for ((i = "${start}" ; i < "${end}" ; i++)); do

    if ! (( i % ${fizzbuzz} )); then
        echo "${i}: fizzbuzz"
    elif ! (( i % ${fizz} )); then
        echo "${i}: fizz"
    elif ! (( i % ${buzz} )); then
        echo "${i}: buzz"
    else
        # comment out to skip non-matches
        echo "${i}: "
    fi 

done

