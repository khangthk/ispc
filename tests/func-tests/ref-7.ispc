#include "test_static.isph"
void foo(float &a) {
    a += a;
}

struct Foo {
    float a, b, c;
};

task void f_fu(uniform float RET[], uniform float aFOO[], uniform float b) {
    Foo f = { b, aFOO[programIndex], 1 };
    if (programIndex < 2)
        foo(f.b);
    RET[programIndex] = f.b;
}

task void result(uniform float RET[]) {
    RET[programIndex] = 1+programIndex;
    RET[0] = 2;
    RET[1] = 4;
}
