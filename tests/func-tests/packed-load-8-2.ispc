#include "test_static.isph"
task void f_f(uniform float RET[], uniform float aFOO[]) {
    uniform int8 a[programCount];
    a[programIndex] = aFOO[programIndex];
    int8 aa = 15;
    if (programIndex < 2)
        packed_load_active(a, &aa);
    RET[programIndex] = aa;
}

task void result(uniform float RET[]) {
    RET[programIndex] = 15;
    RET[0] = 1;
    RET[1] = 2;
}
