#define N 2
// Creo que va a tener 1 estado.
init {
    chan dummy = [N] of {byte};
    do
        :: dummy!85
        :: dummy!170
    od
}

// Tiene un estado, y no cambia al cambiar el N
