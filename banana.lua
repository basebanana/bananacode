#!/usr/bin/lua

function bananaencode(num, minlength)
    minlength = minlength or 1

    alphabets = {{"b","c","d","f","g","l","m","n","p","r","s","t","v","z"}, {"a","e","i","o","u"}};
    shiftalpha = 0
    alphaend = 0

    numalpha = #alphabets
    v = num
    st = ""
    length = 0

    idx = (numalpha - 1 + shiftalpha + alphaend) % numalpha
    while (not (v == 0 and idx == (numalpha - 1 + shiftalpha) % numalpha and length >= minlength))
    do
        al = alphabets[idx + 1]
        r = v % #al
        v = math.floor(v / #al)
        st = al[r + 1] .. st

        idx = (idx + numalpha - 1) % numalpha;
        length = length + 1
    end

    return st
end


function bananarandom(minlength)
    minlength = minlength or 6
    math.randomseed(os.clock()*100000000000)
    
    alphabets = {{"b","c","d","f","g","l","m","n","p","r","s","t","v","z"}, {"a","e","i","o","u"}};
    shiftalpha = 0
    alphaend = 0

    numalpha = #alphabets
    st = ""

    if minlength < 1 then return "" end
    curr_alpha = (numalpha - 1 + shiftalpha + alphaend) % numalpha
    final_alpha = (numalpha - 1 + shiftalpha) % numalpha
    while (curr_alpha ~= final_alpha or #st < minlength)
    do
        al = alphabets[curr_alpha + 1];
        st = al[math.floor(math.random() * #al + 1)] .. st
        curr_alpha = (curr_alpha + numalpha - 1) % numalpha
    end

    return st
end




print(bananaencode(5000))
print(bananaencode(10000))
print(bananaencode(1000, 8))

print(bananarandom())
print(bananarandom(10))

