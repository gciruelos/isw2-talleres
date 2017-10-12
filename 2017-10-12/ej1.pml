chan buffer_a_b = [1] of {int}
chan buffer_b_c = [1] of {int}
chan buffer_c_a = [1] of {int}

proctype A() {
    int i = 0;
    do
        :: buffer_c_a?i;
           i++;
           buffer_a_b!i;
    od;
}

proctype B() {
    int i = 0;
    do
        :: buffer_a_b?i;
           i++;
           buffer_b_c!i;
    od;
}

proctype C() {
    int i = 0;
    do
        :: buffer_b_c?i;
           i++;
           buffer_c_a!i;
    od;
}

init {
    buffer_a_b!0;
    run A();
    run B();
    run C();
}
