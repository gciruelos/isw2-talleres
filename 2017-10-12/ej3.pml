#define N 2
// Creo que va a tener 4 estados.
//  init -> goto next -> dummy!85
//  | ^ ^___goto next ______|
//  | |__goto next __
//  V                \
//  goto next -> dummy!170 
// init
// dummy!85 -> goto next -> dummy!170 -> goto next
//   ^                                       |
//   |---------------------------------------|
init {
    chan dummy = [N] of {byte};
    do
        :: dummy!85
        :: dummy!170
    od
}
