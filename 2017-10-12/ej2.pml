// Creo que tiene 2 estados (el i++ y el goto).
init {
    byte i  = 0;
    do
        :: i = i + 1
    od
}

// Tiene solo 1 (el i++), el goto no cuenta como estado.
