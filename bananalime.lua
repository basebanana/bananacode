#!/usr/bin/lua

function mac2banana(mac)
    v = tonumber(string.sub(table.concat(mac,""),-6),16)
    minlength = 8

    alphabets = {{"b","c","d","f","g","l","m","n","p","r","s","t","v","z"}, {"a","e","i","o","u"}};
    shiftalpha = 0
    alphaend = 0

    numalpha = #alphabets
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



-- mac = {"4c","34","88","88","5e","e6"}
-- mac = {"50","7b","9d","38","a3","bc"}
mac = {"18","d6","c7","95","41","c3"}

template = "Lime-%M4%M5%M6"
for i=1,6,1 do template = template:gsub("%%M"..i, mac[i]) end
print(template)

local macbanana = mac2banana(mac)
template = "Lime-%B8"
for i=4,8,2 do template = template:gsub("%%B"..i, string.sub(macbanana, -i)) end
print(template)
