; RUN: %llc_dwarf -filetype=obj < %s | llvm-dwarfdump -debug-dump=info - | FileCheck %s
; REQUIRES: object-emission

; Generated by clang -c -g -std=c11 -S -emit-llvm from the following C11 source
;
; _Atomic const int i;
;

; CHECK: DW_TAG_variable
; CHECK: DW_TAG_const_type
; CHECK-NOT: DW_TAG_atomic_type
; CHECK: DW_TAG_base_type

; ModuleID = 'atomic.c'
source_filename = "atomic.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = common global i32 0, align 4, !dbg !0

!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = distinct !DIGlobalVariable(name: "i", scope: !1, file: !5, line: 1, type: !6, isLocal: false, isDefinition: true)
!1 = distinct !DICompileUnit(language: DW_LANG_C99, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git cd238117e3a8a57271a82d0bb03d6df6ad8f073e) (http://llvm.org/git/llvm.git 9fd063832c1541aad3907cd60ac344d36997905f)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, globals: !4)
!2 = !DIFile(filename: "atomic.c", directory: "/tmp")
!3 = !{}
!4 = !{!0}
!5 = !DIFile(filename: "atomic.c", directory: "/tmp")
!6 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!7 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !8)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git cd238117e3a8a57271a82d0bb03d6df6ad8f073e) (http://llvm.org/git/llvm.git 9fd063832c1541aad3907cd60ac344d36997905f)"}
