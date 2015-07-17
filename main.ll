; ModuleID = 'main'

@_S_14VirtualMachine = external global { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }
@_V_3PSH = internal constant i32 0
@_V_3ADD = internal constant i32 1
@_V_3POP = internal constant i32 2
@_V_3HLT = internal constant i32 3
@str = private unnamed_addr constant [10 x i8] c"fuck psh\0A\00"
@str1 = private unnamed_addr constant [17 x i8] c"sp at psh is %d\0A\00"
@str2 = private unnamed_addr constant [8 x i8] c"fuck p\0A\00"
@str3 = private unnamed_addr constant [11 x i8] c"popped %d\0A\00"
@str4 = private unnamed_addr constant [8 x i8] c"fuck a\0A\00"
@str5 = private unnamed_addr constant [11 x i8] c"fuck b %d\0A\00"
@str6 = private unnamed_addr constant [14 x i8] c"result is %d\0A\00"

declare i32 @printf(i8*, ...)

define fastcc i32 @_F_5fetch_14VirtualMachine({ i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 } %_V_2vm) {
entry:
  %_V_2vm1 = alloca { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }
  store { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 } %_V_2vm, { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1
  %_V_5instr = alloca i32
  %0 = bitcast i32* %_V_5instr to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32), i32 0, i1 false)
  %1 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %2 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %1, i32 0, i32 3
  %3 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %4 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %3, i32 0, i32 2
  %5 = load i32* %4
  %6 = getelementptr { i32, [0 x i32]* }* %2, i32 0, i32 0
  %7 = load i32* %6
  %boundscheck_lower = icmp sgt i32 0, %5
  br i1 %boundscheck_lower, label %boundscheck_segv, label %boundscheck_upper_block

boundscheck_segv:                                 ; preds = %boundscheck_upper_block, %entry
  %segfault = call i32 @raise(i32 11)
  unreachable

boundscheck_end:                                  ; preds = %boundscheck_upper_block
  %8 = getelementptr { i32, [0 x i32]* }* %2, i32 0, i32 1
  %9 = load [0 x i32]** %8
  %10 = getelementptr [0 x i32]* %9, i32 0, i32 %5
  %11 = load i32* %10
  store i32 %11, i32* %_V_5instr
  %12 = getelementptr i32* %_V_5instr, i32 0
  %13 = load i32* %12
  ret i32 %13

boundscheck_upper_block:                          ; preds = %entry
  %boundscheck_upper = icmp sle i32 %7, %5
  br i1 %boundscheck_upper, label %boundscheck_segv, label %boundscheck_end
}

define fastcc void @_F_4eval_14VirtualMachine_3s32({ i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 } %_V_2vm, i32 %_V_5instr) {
entry:
  %_V_2vm1 = alloca { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }
  store { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 } %_V_2vm, { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1
  %_V_5instr2 = alloca i32
  store i32 %_V_5instr, i32* %_V_5instr2
  %0 = getelementptr i32* %_V_5instr2, i32 0
  %1 = load i32* %0
  %2 = load i32* @_V_3HLT
  %3 = icmp eq i32 %1, %2
  %_V_3val = alloca i32
  %4 = bitcast i32* %_V_3val to i8*
  call void @llvm.memset.p0i8.i32(i8* %4, i8 0, i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32), i32 0, i1 false)
  %_V_1a = alloca i32
  %5 = bitcast i32* %_V_1a to i8*
  call void @llvm.memset.p0i8.i32(i8* %5, i8 0, i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32), i32 0, i1 false)
  %_V_1b = alloca i32
  %6 = bitcast i32* %_V_1b to i8*
  call void @llvm.memset.p0i8.i32(i8* %6, i8 0, i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32), i32 0, i1 false)
  %_V_6result = alloca i32
  %7 = bitcast i32* %_V_6result to i8*
  call void @llvm.memset.p0i8.i32(i8* %7, i8 0, i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32), i32 0, i1 false)
  br i1 %3, label %if_true, label %if_false

if_true:                                          ; preds = %entry
  %8 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %9 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %8, i32 0, i32 0
  store i1 false, i1* %9
  br label %end

if_false:                                         ; preds = %entry
  %10 = getelementptr i32* %_V_5instr2, i32 0
  %11 = load i32* %10
  %12 = load i32* @_V_3PSH
  %13 = icmp eq i32 %11, %12
  br i1 %13, label %if_true3, label %if_false4

if_true3:                                         ; preds = %if_false
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @str, i32 0, i32 0))
  %15 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %16 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %15, i32 0, i32 2
  %17 = load i32* %16
  %18 = add i32 %17, 1
  %19 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %20 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %19, i32 0, i32 2
  store i32 %18, i32* %20
  %21 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %22 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %21, i32 0, i32 1
  %23 = load i32* %22
  %24 = add i32 %23, 1
  %25 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %26 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %25, i32 0, i32 1
  store i32 %24, i32* %26
  %27 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %28 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %27, i32 0, i32 1
  %29 = load i32* %28
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @str1, i32 0, i32 0), i32 %29)
  %31 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %32 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %31, i32 0, i32 3
  %33 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %34 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %33, i32 0, i32 2
  %35 = load i32* %34
  %36 = getelementptr { i32, [0 x i32]* }* %32, i32 0, i32 0
  %37 = load i32* %36
  %boundscheck_lower = icmp sgt i32 0, %35
  br i1 %boundscheck_lower, label %boundscheck_segv, label %boundscheck_upper_block

if_false4:                                        ; preds = %if_false
  %38 = getelementptr i32* %_V_5instr2, i32 0
  %39 = load i32* %38
  %40 = load i32* @_V_3POP
  %41 = icmp eq i32 %39, %40
  br i1 %41, label %if_true11, label %if_false12

boundscheck_segv:                                 ; preds = %boundscheck_upper_block, %if_true3
  %segfault = call i32 @raise(i32 11)
  unreachable

boundscheck_end:                                  ; preds = %boundscheck_upper_block
  %42 = getelementptr { i32, [0 x i32]* }* %32, i32 0, i32 1
  %43 = load [0 x i32]** %42
  %44 = getelementptr [0 x i32]* %43, i32 0, i32 %35
  %45 = load i32* %44
  %46 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %47 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %46, i32 0, i32 4
  %48 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %49 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %48, i32 0, i32 1
  %50 = load i32* %49
  %51 = getelementptr { i32, [0 x i32]* }* %47, i32 0, i32 0
  %52 = load i32* %51
  %boundscheck_lower8 = icmp sgt i32 0, %50
  br i1 %boundscheck_lower8, label %boundscheck_segv5, label %boundscheck_upper_block7

boundscheck_upper_block:                          ; preds = %if_true3
  %boundscheck_upper = icmp sle i32 %37, %35
  br i1 %boundscheck_upper, label %boundscheck_segv, label %boundscheck_end

boundscheck_segv5:                                ; preds = %boundscheck_upper_block7, %boundscheck_end
  %segfault10 = call i32 @raise(i32 11)
  unreachable

boundscheck_end6:                                 ; preds = %boundscheck_upper_block7
  %53 = getelementptr { i32, [0 x i32]* }* %47, i32 0, i32 1
  %54 = load [0 x i32]** %53
  %55 = getelementptr [0 x i32]* %54, i32 0, i32 %50
  store i32 %45, i32* %55
  br label %end

boundscheck_upper_block7:                         ; preds = %boundscheck_end
  %boundscheck_upper9 = icmp sle i32 %52, %50
  br i1 %boundscheck_upper9, label %boundscheck_segv5, label %boundscheck_end6

if_true11:                                        ; preds = %if_false4
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @str2, i32 0, i32 0))
  %57 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %58 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %57, i32 0, i32 4
  %59 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %60 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %59, i32 0, i32 1
  %61 = load i32* %60
  %62 = getelementptr { i32, [0 x i32]* }* %58, i32 0, i32 0
  %63 = load i32* %62
  %boundscheck_lower16 = icmp sgt i32 0, %61
  br i1 %boundscheck_lower16, label %boundscheck_segv13, label %boundscheck_upper_block15

if_false12:                                       ; preds = %if_false4
  %64 = getelementptr i32* %_V_5instr2, i32 0
  %65 = load i32* %64
  %66 = load i32* @_V_3ADD
  %67 = icmp eq i32 %65, %66
  br i1 %67, label %if_true19, label %if_false20

boundscheck_segv13:                               ; preds = %boundscheck_upper_block15, %if_true11
  %segfault18 = call i32 @raise(i32 11)
  unreachable

boundscheck_end14:                                ; preds = %boundscheck_upper_block15
  %68 = getelementptr { i32, [0 x i32]* }* %58, i32 0, i32 1
  %69 = load [0 x i32]** %68
  %70 = getelementptr [0 x i32]* %69, i32 0, i32 %61
  %71 = load i32* %70
  store i32 %71, i32* %_V_3val
  %72 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %73 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %72, i32 0, i32 1
  %74 = load i32* %73
  %75 = sub i32 %74, 1
  %76 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %77 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %76, i32 0, i32 1
  store i32 %75, i32* %77
  %78 = getelementptr i32* %_V_3val, i32 0
  %79 = load i32* %78
  %80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @str3, i32 0, i32 0), i32 %79)
  br label %end

boundscheck_upper_block15:                        ; preds = %if_true11
  %boundscheck_upper17 = icmp sle i32 %63, %61
  br i1 %boundscheck_upper17, label %boundscheck_segv13, label %boundscheck_end14

if_true19:                                        ; preds = %if_false12
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @str4, i32 0, i32 0))
  %82 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %83 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %82, i32 0, i32 4
  %84 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %85 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %84, i32 0, i32 1
  %86 = load i32* %85
  %87 = getelementptr { i32, [0 x i32]* }* %83, i32 0, i32 0
  %88 = load i32* %87
  %boundscheck_lower24 = icmp sgt i32 0, %86
  br i1 %boundscheck_lower24, label %boundscheck_segv21, label %boundscheck_upper_block23

if_false20:                                       ; preds = %if_false12
  br label %end

end:                                              ; preds = %if_false20, %boundscheck_end34, %boundscheck_end14, %boundscheck_end6, %if_true
  ret void

boundscheck_segv21:                               ; preds = %boundscheck_upper_block23, %if_true19
  %segfault26 = call i32 @raise(i32 11)
  unreachable

boundscheck_end22:                                ; preds = %boundscheck_upper_block23
  %89 = getelementptr { i32, [0 x i32]* }* %83, i32 0, i32 1
  %90 = load [0 x i32]** %89
  %91 = getelementptr [0 x i32]* %90, i32 0, i32 %86
  %92 = load i32* %91
  store i32 %92, i32* %_V_1a
  %93 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %94 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %93, i32 0, i32 1
  %95 = load i32* %94
  %96 = sub i32 %95, 1
  %97 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %98 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %97, i32 0, i32 1
  store i32 %96, i32* %98
  %99 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %100 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %99, i32 0, i32 1
  %101 = load i32* %100
  %102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @str5, i32 0, i32 0), i32 %101)
  %103 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %104 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %103, i32 0, i32 4
  %105 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %106 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %105, i32 0, i32 1
  %107 = load i32* %106
  %108 = getelementptr { i32, [0 x i32]* }* %104, i32 0, i32 0
  %109 = load i32* %108
  %boundscheck_lower30 = icmp sgt i32 0, %107
  br i1 %boundscheck_lower30, label %boundscheck_segv27, label %boundscheck_upper_block29

boundscheck_upper_block23:                        ; preds = %if_true19
  %boundscheck_upper25 = icmp sle i32 %88, %86
  br i1 %boundscheck_upper25, label %boundscheck_segv21, label %boundscheck_end22

boundscheck_segv27:                               ; preds = %boundscheck_upper_block29, %boundscheck_end22
  %segfault32 = call i32 @raise(i32 11)
  unreachable

boundscheck_end28:                                ; preds = %boundscheck_upper_block29
  %110 = getelementptr { i32, [0 x i32]* }* %104, i32 0, i32 1
  %111 = load [0 x i32]** %110
  %112 = getelementptr [0 x i32]* %111, i32 0, i32 %107
  %113 = load i32* %112
  store i32 %113, i32* %_V_1b
  %114 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %115 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %114, i32 0, i32 1
  %116 = load i32* %115
  %117 = sub i32 %116, 1
  %118 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %119 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %118, i32 0, i32 1
  store i32 %117, i32* %119
  %120 = getelementptr i32* %_V_1a, i32 0
  %121 = load i32* %120
  %122 = getelementptr i32* %_V_1b, i32 0
  %123 = load i32* %122
  %124 = add i32 %121, %123
  store i32 %124, i32* %_V_6result
  %125 = getelementptr i32* %_V_6result, i32 0
  %126 = load i32* %125
  %127 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @str6, i32 0, i32 0), i32 %126)
  %128 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %129 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %128, i32 0, i32 1
  %130 = load i32* %129
  %131 = add i32 %130, 1
  %132 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %133 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %132, i32 0, i32 1
  store i32 %131, i32* %133
  %134 = getelementptr i32* %_V_6result, i32 0
  %135 = load i32* %134
  %136 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %137 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %136, i32 0, i32 4
  %138 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm1, i32 0
  %139 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %138, i32 0, i32 1
  %140 = load i32* %139
  %141 = getelementptr { i32, [0 x i32]* }* %137, i32 0, i32 0
  %142 = load i32* %141
  %boundscheck_lower36 = icmp sgt i32 0, %140
  br i1 %boundscheck_lower36, label %boundscheck_segv33, label %boundscheck_upper_block35

boundscheck_upper_block29:                        ; preds = %boundscheck_end22
  %boundscheck_upper31 = icmp sle i32 %109, %107
  br i1 %boundscheck_upper31, label %boundscheck_segv27, label %boundscheck_end28

boundscheck_segv33:                               ; preds = %boundscheck_upper_block35, %boundscheck_end28
  %segfault38 = call i32 @raise(i32 11)
  unreachable

boundscheck_end34:                                ; preds = %boundscheck_upper_block35
  %143 = getelementptr { i32, [0 x i32]* }* %137, i32 0, i32 1
  %144 = load [0 x i32]** %143
  %145 = getelementptr [0 x i32]* %144, i32 0, i32 %140
  store i32 %135, i32* %145
  br label %end

boundscheck_upper_block35:                        ; preds = %boundscheck_end28
  %boundscheck_upper37 = icmp sle i32 %142, %140
  br i1 %boundscheck_upper37, label %boundscheck_segv33, label %boundscheck_end34
}

define fastcc i32 @main() {
entry:
  %_V_2vm = alloca { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }
  %0 = bitcast { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 ptrtoint ({ i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* getelementptr ({ i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* null, i32 1) to i32), i32 0, i1 false)
  %1 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %2 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %1, i32 0, i32 0
  store i1 true, i1* %2
  %3 = alloca [7 x i32]
  %4 = getelementptr [7 x i32]* %3, i32 0, i32 0
  %5 = load i32* @_V_3PSH
  store i32 %5, i32* %4
  %6 = getelementptr [7 x i32]* %3, i32 0, i32 1
  store i32 5, i32* %6
  %7 = getelementptr [7 x i32]* %3, i32 0, i32 2
  %8 = load i32* @_V_3PSH
  store i32 %8, i32* %7
  %9 = getelementptr [7 x i32]* %3, i32 0, i32 3
  store i32 5, i32* %9
  %10 = getelementptr [7 x i32]* %3, i32 0, i32 4
  %11 = load i32* @_V_3ADD
  store i32 %11, i32* %10
  %12 = getelementptr [7 x i32]* %3, i32 0, i32 5
  %13 = load i32* @_V_3POP
  store i32 %13, i32* %12
  %14 = getelementptr [7 x i32]* %3, i32 0, i32 6
  %15 = load i32* @_V_3HLT
  store i32 %15, i32* %14
  %16 = alloca { i32, [0 x i32]* }
  %17 = getelementptr { i32, [0 x i32]* }* %16, i32 0, i32 0
  store i32 7, i32* %17
  %18 = getelementptr { i32, [0 x i32]* }* %16, i32 0, i32 1
  %19 = bitcast [7 x i32]* %3 to [0 x i32]*
  store [0 x i32]* %19, [0 x i32]** %18
  %20 = load { i32, [0 x i32]* }* %16
  %21 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %22 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %21, i32 0, i32 3
  store { i32, [0 x i32]* } %20, { i32, [0 x i32]* }* %22
  %23 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %24 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %23, i32 0, i32 5
  store i32 udiv (i32 ptrtoint ({ i32, [0 x i32]* }* getelementptr ({ i32, [0 x i32]* }* null, i32 1) to i32), i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32)), i32* %24
  %25 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %26 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %25, i32 0, i32 2
  store i32 0, i32* %26
  %27 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %28 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %27, i32 0, i32 1
  store i32 0, i32* %28
  %29 = alloca [5 x i32]
  %30 = getelementptr [5 x i32]* %29, i32 0, i32 0
  store i32 0, i32* %30
  %31 = getelementptr [5 x i32]* %29, i32 0, i32 1
  store i32 0, i32* %31
  %32 = getelementptr [5 x i32]* %29, i32 0, i32 2
  store i32 0, i32* %32
  %33 = getelementptr [5 x i32]* %29, i32 0, i32 3
  store i32 0, i32* %33
  %34 = getelementptr [5 x i32]* %29, i32 0, i32 4
  store i32 0, i32* %34
  %35 = alloca { i32, [0 x i32]* }
  %36 = getelementptr { i32, [0 x i32]* }* %35, i32 0, i32 0
  store i32 5, i32* %36
  %37 = getelementptr { i32, [0 x i32]* }* %35, i32 0, i32 1
  %38 = bitcast [5 x i32]* %29 to [0 x i32]*
  store [0 x i32]* %38, [0 x i32]** %37
  %39 = load { i32, [0 x i32]* }* %35
  %40 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %41 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %40, i32 0, i32 4
  store { i32, [0 x i32]* } %39, { i32, [0 x i32]* }* %41
  br label %42

; <label>:42                                      ; preds = %54, %entry
  %43 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %44 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %43, i32 0, i32 0
  %45 = load i1* %44
  %46 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %47 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %46, i32 0, i32 2
  %48 = load i32* %47
  %49 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %50 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %49, i32 0, i32 5
  %51 = load i32* %50
  %52 = icmp sle i32 %48, %51
  %53 = and i1 %45, %52
  br i1 %53, label %54, label %66

; <label>:54                                      ; preds = %42
  %55 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %56 = load { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %55
  %57 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %58 = load { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %57
  %59 = call fastcc i32 @_F_5fetch_14VirtualMachine({ i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 } %58)
  call fastcc void @_F_4eval_14VirtualMachine_3s32({ i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 } %56, i32 %59)
  %60 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %61 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %60, i32 0, i32 2
  %62 = load i32* %61
  %63 = add i32 %62, 1
  %64 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %_V_2vm, i32 0
  %65 = getelementptr { i1, i32, i32, { i32, [0 x i32]* }, { i32, [0 x i32]* }, i32 }* %64, i32 0, i32 2
  store i32 %63, i32* %65
  br label %42

; <label>:66                                      ; preds = %42
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture, i8, i32, i32, i1) #0

declare i32 @raise(i32)

attributes #0 = { nounwind }
