#!/bin/bash 

num=$1
minlength=1


alphabets=(bcdfglmnprstvz aeiou)
numalpha=${#alphabets[@]}
v=$num
st=
length=0

idx=$((($numalpha - 1) % $numalpha))
while !( [ $v -eq 0 ] && [ $idx -eq $((($numalpha - 1) % $numalpha)) ] && [ $length -ge $minlength ] )
do
            al=${alphabets[idx]}
            r=$(($v % ${#al}))
            v=$(($v / ${#al}))
            st="${al:$r:1}$st"

            idx=$((($idx + $numalpha - 1) % $numalpha))
            length=$(($length + 1))
done

echo $st
