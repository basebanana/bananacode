console.log(bananaencode(5000));
console.log(bananaencode(10000));
console.log(bananaencode(1000, 8));

console.log(bananarandom());
console.log(bananarandom(10));



function bananaencode(num, minlength = 1) {
    alphabets = Array("bcdfglmnprstvz".split(""), "aeiou".split(""));
    shiftalpha = 0;
    alphaend = 0;

    numalpha = alphabets.length;
    v = num;
    st = "";
    length = 0;

    idx = (numalpha - 1 + shiftalpha + alphaend) % numalpha;
    while (!(v == 0 && idx == (numalpha - 1 + shiftalpha) % numalpha && length >= minlength)) {
        al = alphabets[idx];
        r = v % al.length;
        v = Math.floor(v / al.length);
        st = al[r] + st;

        idx = (idx + numalpha - 1) % numalpha;
        length = length + 1;
    }

    return st;
}

function bananarandom(minlength = 6) {
    alphabets = Array("bcdfglmnprstvz".split(""), "aeiou".split(""));
    shiftalpha = 0;
    alphaend = 0;

    numalpha = alphabets.length;
    st = "";

    if (minlength < 1) { 
        return "";
    }
    curr_alpha = (numalpha - 1 + shiftalpha + alphaend) % numalpha;
    final_alpha = (numalpha - 1 + shiftalpha) % numalpha;
    while (curr_alpha != final_alpha || st.length < minlength) {
        al = alphabets[curr_alpha];
        st = al[Math.floor(Math.random() * al.length)] + st;
        curr_alpha = (curr_alpha + numalpha - 1) % numalpha;
    }

    return st;
}