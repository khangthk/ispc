// This test checks number of mul operations for taskIndex/taskCount calculations for Xe targets.
// RUN: %{ispc} --emit-spirv --target=xehpg-x8 --device=acm-g10 %s -o %t.spv
// RUN: ocloc compile -file %t.spv -spirv_input -options "-vc-codegen -Xfinalizer -output" -device acm-g10 -output %t.bin -output_no_suffix
// RUN: FileCheck %s -check-prefix=CHECK_TASKCOUNT -input-file=taskCount_kernel.asm
// RUN: FileCheck %s -check-prefix=CHECK_TASKCOUNT0 -input-file=taskCount0_kernel.asm
// RUN: FileCheck %s -check-prefix=CHECK_TASKCOUNT1 -input-file=taskCount1_kernel.asm
// RUN: FileCheck %s -check-prefix=CHECK_TASKCOUNT2 -input-file=taskCount2_kernel.asm
// RUN: FileCheck %s -check-prefix=CHECK_TASKINDEX -input-file=taskIndex_kernel.asm
// RUN: FileCheck %s -check-prefix=CHECK_TASKINDEX0 -input-file=taskIndex0_kernel.asm
// RUN: FileCheck %s -check-prefix=CHECK_TASKINDEX1 -input-file=taskIndex1_kernel.asm
// RUN: FileCheck %s -check-prefix=CHECK_TASKINDEX2 -input-file=taskIndex2_kernel.asm

// REQUIRES: XE_ENABLED
// REQUIRES: OCLOC_INSTALLED
// REQUIRES: LINUX_HOST

// CHECK_TASKCOUNT: mul (2|M0)
// CHECK_TASKCOUNT-COUNT-3: mul
task void taskCount_kernel(uniform int res[]) {
    res[0] = taskCount;
}
// CHECK_TASKCOUNT0-COUNT-1: mul
task void taskCount0_kernel(uniform int res[]) {
    res[0] = taskCount0;
}
// CHECK_TASKCOUNT1-COUNT-1: mul
task void taskCount1_kernel(uniform int res[]) {
    res[0] = taskCount1;
}
// CHECK_TASKCOUNT2-COUNT-1: mul
task void taskCount2_kernel(uniform int res[]) {
    res[0] = taskCount2;
}

// CHECK_TASKINDEX-COUNT-5: mul
task void taskIndex_kernel(uniform int res[]) {
    res[0] = taskIndex;
}

// CHECK_TASKINDEX0-COUNT-1: mul
task void taskIndex0_kernel(uniform int res[]) {
    res[0] = taskIndex0;
}

// CHECK_TASKINDEX1-COUNT-1: mul
task void taskIndex1_kernel(uniform int res[]) {
    res[0] = taskIndex1;
}

// CHECK_TASKINDEX2-COUNT-1: mul
task void taskIndex2_kernel(uniform int res[]) {
    res[0] = taskIndex2;
}
