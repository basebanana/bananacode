#!/usr/bin/php
<?php

echo bananaencode(5000) . "\n";
echo bananaencode(10000) . "\n";
echo bananaencode(1000, 8) . "\n";

echo bananarandom() . "\n";
echo bananarandom(10) . "\n";



function bananaencode($num, $minlength = 1) {
    $alphabets = Array(str_split("bcdfglmnprstvz"), str_split("aeiou"));
    $shiftalpha = 0;
    $alphaend = 0;

    $numalpha = count($alphabets);
    $v = $num;
    $st = "";
    $length = 0;

    $idx = ($numalpha - 1 + $shiftalpha + $alphaend) % $numalpha;
    while (!($v == 0 && $idx == ($numalpha - 1 + $shiftalpha) % $numalpha && $length >= $minlength)) {
        $al = $alphabets[$idx];
        $r = $v % count($al);
        $v = intval($v / count($al));
        $st = $al[$r] . $st;

        $idx = ($idx + $numalpha - 1) % $numalpha;
        $length = $length + 1;
    }

    return $st;
}

function bananarandom($minlength = 6) {
    $alphabets = Array(str_split("bcdfglmnprstvz"), str_split("aeiou"));
    $shiftalpha = 0;
    $alphaend = 0;

    $numalpha = count($alphabets);
    $st = "";

    if ($minlength < 1) { 
        return "";
    }
    $curr_alpha = ($numalpha - 1 + $shiftalpha + $alphaend) % $numalpha;
    $final_alpha = ($numalpha - 1 + $shiftalpha) % $numalpha;
    while ($curr_alpha != $final_alpha || strlen($st) < $minlength) {
        $al = $alphabets[$curr_alpha];
        $st = $al[intval(rand(0, count($al) - 1))] . $st;
        $curr_alpha = ($curr_alpha + $numalpha - 1) % $numalpha;
    }

    return $st;
}

?>