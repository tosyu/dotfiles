iab <buffer> fn@ void function () {<cr>}<C-c>kf(
iab <buffer> mn@ int main(int argc, char** argv) {<cr>}<C-o><S-o>
iab <buffer> if@ if () {<cr>}<C-c>kf)
iab <buffer> ifn@ if (!) {<cr>}<C-c>kf)
iab <buffer> ife@ if () {<cr>} else {<cr>}<C-c>2kf)
iab <buffer> wh@ while () {<cr>}<C-c>kf)
iab <buffer> for@ for () {<cr>}<C-c>kf)
iab <buffer> fori@ for (int i = 0; i < ; i++) {<cr>}<C-c>k2f;
iab <buffer> h@ #ifndef _<C-o>"%p_H_<cr>#define _<C-o>"%p_H_<cr><cr>#endif<C-c>3kwgUwf.2xj2xbgUwj
iab <buffer> i@ #include <>
iab <buffer> d@ #define 
