#!/bin/sh

set -eu

num="$1"
minlength=2
vowels='aeiou'
consonantics='bcdfglmnprstvz'
v="$num"
length=0
st=

idx=1
while [ "$v" -ne 0 ] || [ $idx -ne 1 ] || [ $length -lt $minlength ]
do
    if [ "${idx}" -eq 1 ]; then
        al="$vowels"
        idx=0
    else
        al="$consonantics"
        idx=1
    fi
    len="${#al}"
    r=$((v % len + 1))
    v=$((v / len))
    st="$(echo "$al" | cut -c "$r")$st"

    length=$((length + 1))
done

echo "$st"
