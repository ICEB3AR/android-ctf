.class public final Lcom/trendmicro/hippo/Interpreter;
.super Lcom/trendmicro/hippo/Icode;
.source "Interpreter.java"

# interfaces
.implements Lcom/trendmicro/hippo/Evaluator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/Interpreter$CallFrame;,
        Lcom/trendmicro/hippo/Interpreter$GeneratorState;,
        Lcom/trendmicro/hippo/Interpreter$ContinuationJump;
    }
.end annotation


# static fields
.field static final EXCEPTION_HANDLER_SLOT:I = 0x2

.field static final EXCEPTION_LOCAL_SLOT:I = 0x4

.field static final EXCEPTION_SCOPE_SLOT:I = 0x5

.field static final EXCEPTION_SLOT_SIZE:I = 0x6

.field static final EXCEPTION_TRY_END_SLOT:I = 0x1

.field static final EXCEPTION_TRY_START_SLOT:I = 0x0

.field static final EXCEPTION_TYPE_SLOT:I = 0x3


# instance fields
.field itsData:Lcom/trendmicro/hippo/InterpreterData;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 375
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/trendmicro/hippo/Icode;-><init>()V

    return-void
.end method

.method static synthetic access$000([Ljava/lang/Object;[DII)[Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # [Ljava/lang/Object;
    .param p1, "x1"    # [D
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .line 23
    invoke-static {p0, p1, p2, p3}, Lcom/trendmicro/hippo/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/InterpretedFunction;I)V
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/Context;
    .param p1, "x1"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "x2"    # Lcom/trendmicro/hippo/InterpretedFunction;
    .param p3, "x3"    # I

    .line 23
    invoke-static {p0, p1, p2, p3}, Lcom/trendmicro/hippo/Interpreter;->initFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/InterpretedFunction;I)V

    return-void
.end method

.method static synthetic access$200(Lcom/trendmicro/hippo/InterpreterData;Lcom/trendmicro/hippo/InterpreterData;)Z
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/InterpreterData;
    .param p1, "x1"    # Lcom/trendmicro/hippo/InterpreterData;

    .line 23
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/Interpreter;->compareIdata(Lcom/trendmicro/hippo/InterpreterData;Lcom/trendmicro/hippo/InterpreterData;)Z

    move-result v0

    return v0
.end method

.method private static addInstructionCount(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;I)V
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "extra"    # I

    .line 3234
    iget v0, p0, Lcom/trendmicro/hippo/Context;->instructionCount:I

    iget v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    iget v2, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pcPrevBranch:I

    sub-int/2addr v1, v2

    add-int/2addr v1, p2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/trendmicro/hippo/Context;->instructionCount:I

    .line 3235
    iget v0, p0, Lcom/trendmicro/hippo/Context;->instructionCount:I

    iget v1, p0, Lcom/trendmicro/hippo/Context;->instructionThreshold:I

    if-le v0, v1, :cond_0

    .line 3236
    iget v0, p0, Lcom/trendmicro/hippo/Context;->instructionCount:I

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Context;->observeInstructionCount(I)V

    .line 3237
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/Context;->instructionCount:I

    .line 3239
    :cond_0
    return-void
.end method

.method private static bytecodeSpan(I)I
    .locals 4
    .param p0, "bytecode"    # I

    .line 685
    const/16 v0, -0x36

    const/4 v1, 0x3

    if-eq p0, v0, :cond_4

    const/16 v0, -0x17

    if-eq p0, v0, :cond_4

    const/16 v0, -0x15

    const/4 v2, 0x5

    if-eq p0, v0, :cond_3

    const/16 v0, 0x32

    if-eq p0, v0, :cond_2

    const/16 v0, 0x39

    const/4 v3, 0x2

    if-eq p0, v0, :cond_1

    const/16 v0, 0x49

    if-eq p0, v0, :cond_2

    if-eq p0, v2, :cond_4

    const/4 v0, 0x6

    if-eq p0, v0, :cond_4

    const/4 v0, 0x7

    if-eq p0, v0, :cond_4

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    packed-switch p0, :pswitch_data_2

    packed-switch p0, :pswitch_data_3

    packed-switch p0, :pswitch_data_4

    .line 762
    invoke-static {p0}, Lcom/trendmicro/hippo/Interpreter;->validBytecode(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 763
    const/4 v0, 0x1

    return v0

    .line 762
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 718
    :pswitch_0
    return v3

    .line 760
    :pswitch_1
    return v1

    .line 722
    :pswitch_2
    return v1

    .line 726
    :pswitch_3
    return v2

    .line 730
    :pswitch_4
    return v3

    .line 734
    :pswitch_5
    return v1

    .line 738
    :pswitch_6
    return v2

    .line 742
    :pswitch_7
    return v3

    .line 746
    :pswitch_8
    return v1

    .line 750
    :pswitch_9
    return v2

    .line 756
    :pswitch_a
    return v3

    .line 710
    :cond_1
    return v3

    .line 691
    :cond_2
    :pswitch_b
    return v1

    .line 706
    :cond_3
    return v2

    .line 700
    :cond_4
    :pswitch_c
    return v1

    :pswitch_data_0
    .packed-switch -0x3f
        :pswitch_b
        :pswitch_b
        :pswitch_a
    .end packed-switch

    :pswitch_data_1
    .packed-switch -0x31
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch

    :pswitch_data_2
    .packed-switch -0x28
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_3
    .packed-switch -0x1c
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_4
    .packed-switch -0xb
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_c
    .end packed-switch
.end method

.method public static captureContinuation(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/NativeContinuation;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 3032
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    instance-of v0, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;

    if-eqz v0, :cond_0

    .line 3037
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    check-cast v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/trendmicro/hippo/Interpreter;->captureContinuation(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Z)Lcom/trendmicro/hippo/NativeContinuation;

    move-result-object v0

    return-object v0

    .line 3035
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Interpreter frames not found"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static captureContinuation(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Z)Lcom/trendmicro/hippo/NativeContinuation;
    .locals 6
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "requireContinuationsTopFrame"    # Z

    .line 3043
    new-instance v0, Lcom/trendmicro/hippo/NativeContinuation;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeContinuation;-><init>()V

    .line 3044
    .local v0, "c":Lcom/trendmicro/hippo/NativeContinuation;
    nop

    .line 3045
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 3044
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;)V

    .line 3048
    move-object v1, p1

    .line 3049
    .local v1, "x":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    move-object v2, p1

    .line 3050
    .local v2, "outermost":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :goto_0
    if-eqz v1, :cond_3

    iget-boolean v3, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    if-nez v3, :cond_3

    .line 3051
    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    .line 3053
    iget v4, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    add-int/2addr v4, v3

    .local v4, "i":I
    :goto_1
    iget-object v3, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    array-length v3, v3

    const/4 v5, 0x0

    if-eq v4, v3, :cond_0

    .line 3055
    iget-object v3, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aput-object v5, v3, v4

    .line 3056
    iget-object v3, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stackAttributes:[I

    const/4 v5, 0x0

    aput v5, v3, v4

    .line 3053
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 3058
    .end local v4    # "i":I
    :cond_0
    iget v3, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedCallOp:I

    const/16 v4, 0x26

    if-ne v3, v4, :cond_1

    .line 3060
    iget-object v3, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget v4, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    aput-object v5, v3, v4

    goto :goto_2

    .line 3062
    :cond_1
    iget v3, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedCallOp:I

    const/16 v4, 0x1e

    if-eq v3, v4, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 3067
    :cond_2
    :goto_2
    move-object v2, v1

    .line 3068
    iget-object v1, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    goto :goto_0

    .line 3071
    :cond_3
    if-eqz p2, :cond_6

    .line 3072
    :goto_3
    iget-object v3, v2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    if-eqz v3, :cond_4

    .line 3073
    iget-object v2, v2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    goto :goto_3

    .line 3075
    :cond_4
    iget-boolean v3, v2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->isContinuationsTopFrame:Z

    if-eqz v3, :cond_5

    goto :goto_4

    .line 3076
    :cond_5
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Cannot capture continuation from JavaScript code not called directly by executeScriptWithContinuations or callFunctionWithContinuations"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 3083
    :cond_6
    :goto_4
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/NativeContinuation;->initImplementation(Ljava/lang/Object;)V

    .line 3084
    return-object v0
.end method

.method private static captureFrameForGenerator(Lcom/trendmicro/hippo/Interpreter$CallFrame;)Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .locals 3
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 351
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    .line 352
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Interpreter$CallFrame;->cloneFrozen()Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object v0

    .line 353
    .local v0, "result":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    .line 356
    const/4 v2, 0x0

    iput-object v2, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 357
    iput v1, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frameIndex:I

    .line 359
    return-object v0
.end method

.method private static compareIdata(Lcom/trendmicro/hippo/InterpreterData;Lcom/trendmicro/hippo/InterpreterData;)Z
    .locals 2
    .param p0, "i1"    # Lcom/trendmicro/hippo/InterpreterData;
    .param p1, "i2"    # Lcom/trendmicro/hippo/InterpreterData;

    .line 293
    if-eq p0, p1, :cond_1

    invoke-static {p0}, Lcom/trendmicro/hippo/Interpreter;->getEncodedSource(Lcom/trendmicro/hippo/InterpreterData;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/trendmicro/hippo/Interpreter;->getEncodedSource(Lcom/trendmicro/hippo/InterpreterData;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private static doAdd([Ljava/lang/Object;[DILcom/trendmicro/hippo/Context;)V
    .locals 9
    .param p0, "stack"    # [Ljava/lang/Object;
    .param p1, "sDbl"    # [D
    .param p2, "stackTop"    # I
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 3130
    add-int/lit8 v0, p2, 0x1

    aget-object v0, p0, v0

    .line 3131
    .local v0, "rhs":Ljava/lang/Object;
    aget-object v1, p0, p2

    .line 3134
    .local v1, "lhs":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v2, :cond_1

    .line 3135
    add-int/lit8 v2, p2, 0x1

    aget-wide v2, p1, v2

    .line 3136
    .local v2, "d":D
    sget-object v4, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v4, :cond_0

    .line 3137
    aget-wide v4, p1, p2

    add-double/2addr v4, v2

    aput-wide v4, p1, p2

    .line 3138
    return-void

    .line 3140
    :cond_0
    const/4 v4, 0x1

    .local v4, "leftRightOrder":Z
    goto :goto_0

    .line 3142
    .end local v2    # "d":D
    .end local v4    # "leftRightOrder":Z
    :cond_1
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_7

    .line 3143
    aget-wide v2, p1, p2

    .line 3144
    .restart local v2    # "d":D
    move-object v1, v0

    .line 3145
    const/4 v4, 0x0

    .line 3166
    .restart local v4    # "leftRightOrder":Z
    :goto_0
    instance-of v5, v1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v5, :cond_3

    .line 3167
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 3168
    if-nez v4, :cond_2

    .line 3169
    move-object v5, v1

    .line 3170
    .local v5, "tmp":Ljava/lang/Object;
    move-object v1, v0

    .line 3171
    move-object v0, v5

    .line 3173
    .end local v5    # "tmp":Ljava/lang/Object;
    :cond_2
    invoke-static {v1, v0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->add(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, p0, p2

    goto :goto_3

    .line 3174
    :cond_3
    instance-of v5, v1, Ljava/lang/CharSequence;

    if-eqz v5, :cond_5

    .line 3175
    move-object v5, v1

    check-cast v5, Ljava/lang/CharSequence;

    .line 3176
    .local v5, "lstr":Ljava/lang/CharSequence;
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v6

    .line 3177
    .local v6, "rstr":Ljava/lang/CharSequence;
    if-eqz v4, :cond_4

    .line 3178
    new-instance v7, Lcom/trendmicro/hippo/ConsString;

    invoke-direct {v7, v5, v6}, Lcom/trendmicro/hippo/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    aput-object v7, p0, p2

    goto :goto_1

    .line 3180
    :cond_4
    new-instance v7, Lcom/trendmicro/hippo/ConsString;

    invoke-direct {v7, v6, v5}, Lcom/trendmicro/hippo/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    aput-object v7, p0, p2

    .line 3182
    .end local v5    # "lstr":Ljava/lang/CharSequence;
    .end local v6    # "rstr":Ljava/lang/CharSequence;
    :goto_1
    goto :goto_3

    .line 3183
    :cond_5
    instance-of v5, v1, Ljava/lang/Number;

    if-eqz v5, :cond_6

    .line 3184
    move-object v5, v1

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v5

    goto :goto_2

    :cond_6
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v5

    .line 3185
    .local v5, "lDbl":D
    :goto_2
    sget-object v7, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    aput-object v7, p0, p2

    .line 3186
    add-double v7, v5, v2

    aput-wide v7, p1, p2

    .line 3188
    .end local v5    # "lDbl":D
    :goto_3
    return-void

    .line 3148
    .end local v2    # "d":D
    .end local v4    # "leftRightOrder":Z
    :cond_7
    instance-of v2, v1, Lcom/trendmicro/hippo/Scriptable;

    if-nez v2, :cond_d

    instance-of v2, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_8

    goto :goto_7

    .line 3150
    :cond_8
    instance-of v2, v1, Ljava/lang/CharSequence;

    if-nez v2, :cond_c

    instance-of v2, v0, Ljava/lang/CharSequence;

    if-eqz v2, :cond_9

    goto :goto_6

    .line 3155
    :cond_9
    instance-of v2, v1, Ljava/lang/Number;

    if-eqz v2, :cond_a

    .line 3156
    move-object v2, v1

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    goto :goto_4

    :cond_a
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    .line 3157
    .local v2, "lDbl":D
    :goto_4
    instance-of v4, v0, Ljava/lang/Number;

    if-eqz v4, :cond_b

    .line 3158
    move-object v4, v0

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    goto :goto_5

    :cond_b
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v4

    .line 3159
    .local v4, "rDbl":D
    :goto_5
    sget-object v6, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    aput-object v6, p0, p2

    .line 3160
    add-double v6, v2, v4

    aput-wide v6, p1, p2

    goto :goto_8

    .line 3151
    .end local v2    # "lDbl":D
    .end local v4    # "rDbl":D
    :cond_c
    :goto_6
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v2

    .line 3152
    .local v2, "lstr":Ljava/lang/CharSequence;
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v3

    .line 3153
    .local v3, "rstr":Ljava/lang/CharSequence;
    new-instance v4, Lcom/trendmicro/hippo/ConsString;

    invoke-direct {v4, v2, v3}, Lcom/trendmicro/hippo/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    aput-object v4, p0, p2

    .line 3154
    .end local v2    # "lstr":Ljava/lang/CharSequence;
    .end local v3    # "rstr":Ljava/lang/CharSequence;
    goto :goto_8

    .line 3149
    :cond_d
    :goto_7
    invoke-static {v1, v0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->add(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p0, p2

    .line 3162
    :goto_8
    return-void
.end method

.method private static doArithmetic(Lcom/trendmicro/hippo/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I
    .locals 5
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "op"    # I
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .line 3192
    invoke-static {p0, p4}, Lcom/trendmicro/hippo/Interpreter;->stack_double(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)D

    move-result-wide v0

    .line 3193
    .local v0, "rDbl":D
    add-int/lit8 p4, p4, -0x1

    .line 3194
    invoke-static {p0, p4}, Lcom/trendmicro/hippo/Interpreter;->stack_double(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)D

    move-result-wide v2

    .line 3195
    .local v2, "lDbl":D
    sget-object v4, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    aput-object v4, p2, p4

    .line 3196
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 3207
    :pswitch_0
    rem-double/2addr v2, v0

    goto :goto_0

    .line 3204
    :pswitch_1
    div-double/2addr v2, v0

    .line 3205
    goto :goto_0

    .line 3201
    :pswitch_2
    mul-double/2addr v2, v0

    .line 3202
    goto :goto_0

    .line 3198
    :pswitch_3
    sub-double/2addr v2, v0

    .line 3199
    nop

    .line 3210
    :goto_0
    aput-wide v2, p3, p4

    .line 3211
    return p4

    nop

    :pswitch_data_0
    .packed-switch 0x16
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static doBitOp(Lcom/trendmicro/hippo/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I
    .locals 4
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "op"    # I
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .line 2364
    add-int/lit8 v0, p4, -0x1

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/Interpreter;->stack_int32(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)I

    move-result v0

    .line 2365
    .local v0, "lIntValue":I
    invoke-static {p0, p4}, Lcom/trendmicro/hippo/Interpreter;->stack_int32(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)I

    move-result v1

    .line 2366
    .local v1, "rIntValue":I
    add-int/lit8 p4, p4, -0x1

    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    aput-object v2, p2, p4

    .line 2367
    const/16 v2, 0x12

    if-eq p1, v2, :cond_1

    const/16 v2, 0x13

    if-eq p1, v2, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 2369
    :pswitch_0
    and-int/2addr v0, v1

    .line 2370
    goto :goto_0

    .line 2375
    :pswitch_1
    xor-int/2addr v0, v1

    .line 2376
    goto :goto_0

    .line 2372
    :pswitch_2
    or-int/2addr v0, v1

    .line 2373
    goto :goto_0

    .line 2381
    :cond_0
    shr-int/2addr v0, v1

    goto :goto_0

    .line 2378
    :cond_1
    shl-int/2addr v0, v1

    .line 2379
    nop

    .line 2384
    :goto_0
    int-to-double v2, v0

    aput-wide v2, p3, p4

    .line 2385
    return p4

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static doCallSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI[BI)I
    .locals 21
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I
    .param p5, "iCode"    # [B
    .param p6, "indexReg"    # I

    .line 2459
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p5

    move/from16 v4, p6

    iget v5, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    aget-byte v5, v3, v5

    and-int/lit16 v5, v5, 0xff

    .line 2460
    .local v5, "callType":I
    iget v6, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/4 v7, 0x1

    add-int/2addr v6, v7

    aget-byte v6, v3, v6

    if-eqz v6, :cond_0

    goto :goto_0

    :cond_0
    const/4 v7, 0x0

    :goto_0
    move v15, v7

    .line 2461
    .local v15, "isNew":Z
    iget v6, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v6, 0x2

    invoke-static {v3, v6}, Lcom/trendmicro/hippo/Interpreter;->getIndex([BI)I

    move-result v16

    .line 2464
    .local v16, "sourceLine":I
    if-eqz v15, :cond_2

    .line 2466
    sub-int v6, p4, v4

    .line 2468
    .end local p4    # "stackTop":I
    .local v6, "stackTop":I
    aget-object v7, v1, v6

    .line 2469
    .local v7, "function":Ljava/lang/Object;
    sget-object v8, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v7, v8, :cond_1

    .line 2470
    aget-wide v8, v2, v6

    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v7

    .line 2471
    :cond_1
    add-int/lit8 v8, v6, 0x1

    invoke-static {v1, v2, v8, v4}, Lcom/trendmicro/hippo/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v8

    .line 2473
    .local v8, "outArgs":[Ljava/lang/Object;
    iget-object v9, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    move-object/from16 v14, p0

    invoke-static {v14, v7, v8, v9, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->newSpecial(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;[Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v1, v6

    .line 2475
    .end local v7    # "function":Ljava/lang/Object;
    .end local v8    # "outArgs":[Ljava/lang/Object;
    goto :goto_1

    .line 2477
    .end local v6    # "stackTop":I
    .restart local p4    # "stackTop":I
    :cond_2
    move-object/from16 v14, p0

    add-int/lit8 v6, v4, 0x1

    sub-int v17, p4, v6

    .line 2481
    .end local p4    # "stackTop":I
    .local v17, "stackTop":I
    add-int/lit8 v6, v17, 0x1

    aget-object v6, v1, v6

    move-object/from16 v18, v6

    check-cast v18, Lcom/trendmicro/hippo/Scriptable;

    .line 2482
    .local v18, "functionThis":Lcom/trendmicro/hippo/Scriptable;
    aget-object v6, v1, v17

    move-object/from16 v19, v6

    check-cast v19, Lcom/trendmicro/hippo/Callable;

    .line 2483
    .local v19, "function":Lcom/trendmicro/hippo/Callable;
    add-int/lit8 v6, v17, 0x2

    invoke-static {v1, v2, v6, v4}, Lcom/trendmicro/hippo/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v20

    .line 2485
    .local v20, "outArgs":[Ljava/lang/Object;
    iget-object v10, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v11, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->thisObj:Lcom/trendmicro/hippo/Scriptable;

    iget-object v6, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v13, v6, Lcom/trendmicro/hippo/InterpreterData;->itsSourceFile:Ljava/lang/String;

    move-object/from16 v6, p0

    move-object/from16 v7, v19

    move-object/from16 v8, v18

    move-object/from16 v9, v20

    move v12, v5

    move/from16 v14, v16

    invoke-static/range {v6 .. v14}, Lcom/trendmicro/hippo/ScriptRuntime;->callSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/String;I)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v1, v17

    move/from16 v6, v17

    .line 2490
    .end local v17    # "stackTop":I
    .end local v18    # "functionThis":Lcom/trendmicro/hippo/Scriptable;
    .end local v19    # "function":Lcom/trendmicro/hippo/Callable;
    .end local v20    # "outArgs":[Ljava/lang/Object;
    .restart local v6    # "stackTop":I
    :goto_1
    iget v7, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/lit8 v7, v7, 0x4

    iput v7, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 2491
    return v6
.end method

.method private static doCompare(Lcom/trendmicro/hippo/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I
    .locals 9
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "op"    # I
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .line 2306
    add-int/lit8 p4, p4, -0x1

    .line 2307
    add-int/lit8 v0, p4, 0x1

    aget-object v0, p2, v0

    .line 2308
    .local v0, "rhs":Ljava/lang/Object;
    aget-object v1, p2, p4

    .line 2315
    .local v1, "lhs":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v2, :cond_0

    .line 2316
    add-int/lit8 v2, p4, 0x1

    aget-wide v2, p3, v2

    .line 2317
    .local v2, "rDbl":D
    invoke-static {p0, p4}, Lcom/trendmicro/hippo/Interpreter;->stack_double(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)D

    move-result-wide v4

    .local v4, "lDbl":D
    goto :goto_0

    .line 2318
    .end local v2    # "rDbl":D
    .end local v4    # "lDbl":D
    :cond_0
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_5

    .line 2319
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    .line 2320
    .restart local v2    # "rDbl":D
    aget-wide v4, p3, p4

    .line 2324
    .restart local v4    # "lDbl":D
    :goto_0
    const/4 v6, 0x0

    const/4 v7, 0x1

    packed-switch p1, :pswitch_data_0

    .line 2338
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6

    .line 2326
    :pswitch_0
    cmpl-double v8, v4, v2

    if-ltz v8, :cond_1

    move v6, v7

    .line 2327
    .local v6, "valBln":Z
    :cond_1
    goto :goto_1

    .line 2332
    .end local v6    # "valBln":Z
    :pswitch_1
    cmpl-double v8, v4, v2

    if-lez v8, :cond_2

    move v6, v7

    .line 2333
    .restart local v6    # "valBln":Z
    :cond_2
    goto :goto_1

    .line 2329
    .end local v6    # "valBln":Z
    :pswitch_2
    cmpg-double v8, v4, v2

    if-gtz v8, :cond_3

    move v6, v7

    .line 2330
    .restart local v6    # "valBln":Z
    :cond_3
    goto :goto_1

    .line 2335
    .end local v6    # "valBln":Z
    :pswitch_3
    cmpg-double v8, v4, v2

    if-gez v8, :cond_4

    move v6, v7

    .line 2336
    .restart local v6    # "valBln":Z
    :cond_4
    goto :goto_1

    .line 2341
    .end local v2    # "rDbl":D
    .end local v4    # "lDbl":D
    .end local v6    # "valBln":Z
    :cond_5
    packed-switch p1, :pswitch_data_1

    .line 2355
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 2343
    :pswitch_4
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->cmp_LE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 2344
    .restart local v6    # "valBln":Z
    goto :goto_1

    .line 2349
    .end local v6    # "valBln":Z
    :pswitch_5
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->cmp_LT(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 2350
    .restart local v6    # "valBln":Z
    goto :goto_1

    .line 2346
    .end local v6    # "valBln":Z
    :pswitch_6
    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->cmp_LE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 2347
    .restart local v6    # "valBln":Z
    goto :goto_1

    .line 2352
    .end local v6    # "valBln":Z
    :pswitch_7
    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->cmp_LT(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 2353
    .restart local v6    # "valBln":Z
    nop

    .line 2358
    :goto_1
    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, p2, p4

    .line 2359
    return p4

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xe
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method private static doDelName(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "op"    # I
    .param p3, "stack"    # [Ljava/lang/Object;
    .param p4, "sDbl"    # [D
    .param p5, "stackTop"    # I

    .line 2390
    aget-object v0, p3, p5

    .line 2391
    .local v0, "rhs":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_0

    aget-wide v1, p4, p5

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2392
    :cond_0
    add-int/lit8 p5, p5, -0x1

    .line 2393
    aget-object v1, p3, p5

    .line 2394
    .local v1, "lhs":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_1

    aget-wide v2, p4, p5

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2395
    :cond_1
    iget-object v2, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    if-nez p2, :cond_2

    const/4 v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    :goto_0
    invoke-static {v1, v0, p0, v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->delete(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p3, p5

    .line 2397
    return p5
.end method

.method private static doElemIncDec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[B[Ljava/lang/Object;[DI)I
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "iCode"    # [B
    .param p3, "stack"    # [Ljava/lang/Object;
    .param p4, "sDbl"    # [D
    .param p5, "stackTop"    # I

    .line 2444
    aget-object v0, p3, p5

    .line 2445
    .local v0, "rhs":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_0

    aget-wide v1, p4, p5

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2446
    :cond_0
    add-int/lit8 p5, p5, -0x1

    .line 2447
    aget-object v1, p3, p5

    .line 2448
    .local v1, "lhs":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_1

    aget-wide v2, p4, p5

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2449
    :cond_1
    iget-object v2, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget v3, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    aget-byte v3, p2, v3

    invoke-static {v1, v0, p0, v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->elemIncrDecr(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p3, p5

    .line 2451
    iget v2, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 2452
    return p5
.end method

.method private static doEquals([Ljava/lang/Object;[DI)Z
    .locals 6
    .param p0, "stack"    # [Ljava/lang/Object;
    .param p1, "sDbl"    # [D
    .param p2, "stackTop"    # I

    .line 2680
    add-int/lit8 v0, p2, 0x1

    aget-object v0, p0, v0

    .line 2681
    .local v0, "rhs":Ljava/lang/Object;
    aget-object v1, p0, p2

    .line 2682
    .local v1, "lhs":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v2, :cond_2

    .line 2683
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_1

    .line 2684
    aget-wide v2, p1, p2

    add-int/lit8 v4, p2, 0x1

    aget-wide v4, p1, v4

    cmpl-double v2, v2, v4

    if-nez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 2686
    :cond_1
    add-int/lit8 v2, p2, 0x1

    aget-wide v2, p1, v2

    invoke-static {v2, v3, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v2

    return v2

    .line 2688
    :cond_2
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_3

    .line 2689
    aget-wide v2, p1, p2

    invoke-static {v2, v3, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v2

    return v2

    .line 2691
    :cond_3
    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->eq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    return v2
.end method

.method private static doGetElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI)I
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .line 2402
    add-int/lit8 p4, p4, -0x1

    .line 2403
    aget-object v0, p2, p4

    .line 2404
    .local v0, "lhs":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_0

    .line 2405
    aget-wide v1, p3, p4

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2408
    :cond_0
    add-int/lit8 v1, p4, 0x1

    aget-object v1, p2, v1

    .line 2409
    .local v1, "id":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-eq v1, v2, :cond_1

    .line 2410
    iget-object v2, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v0, v1, p0, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectElem(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .local v2, "value":Ljava/lang/Object;
    goto :goto_0

    .line 2412
    .end local v2    # "value":Ljava/lang/Object;
    :cond_1
    add-int/lit8 v2, p4, 0x1

    aget-wide v2, p3, v2

    .line 2413
    .local v2, "d":D
    iget-object v4, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v0, v2, v3, p0, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectIndex(Ljava/lang/Object;DLcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    move-object v2, v4

    .line 2415
    .local v2, "value":Ljava/lang/Object;
    :goto_0
    aput-object v2, p2, p4

    .line 2416
    return p4
.end method

.method private static doGetVar(Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[DI)I
    .locals 3
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "vars"    # [Ljava/lang/Object;
    .param p5, "varDbls"    # [D
    .param p6, "indexReg"    # I

    .line 2545
    add-int/lit8 p3, p3, 0x1

    .line 2546
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->useActivation:Z

    if-nez v0, :cond_0

    .line 2547
    aget-object v0, p4, p6

    aput-object v0, p1, p3

    .line 2548
    aget-wide v0, p5, p6

    aput-wide v0, p2, p3

    goto :goto_0

    .line 2550
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v0, v0, p6

    .line 2551
    .local v0, "stringReg":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v2, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v1, v0, v2}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    aput-object v1, p1, p3

    .line 2553
    .end local v0    # "stringReg":Ljava/lang/String;
    :goto_0
    return p3
.end method

.method private static doInOrInstanceof(Lcom/trendmicro/hippo/Context;I[Ljava/lang/Object;[DI)I
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "op"    # I
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .line 2289
    aget-object v0, p2, p4

    .line 2290
    .local v0, "rhs":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_0

    aget-wide v1, p3, p4

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2291
    :cond_0
    add-int/lit8 p4, p4, -0x1

    .line 2292
    aget-object v1, p2, p4

    .line 2293
    .local v1, "lhs":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_1

    aget-wide v2, p3, p4

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2295
    :cond_1
    const/16 v2, 0x34

    if-ne p1, v2, :cond_2

    .line 2296
    invoke-static {v1, v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->in(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Z

    move-result v2

    .local v2, "valBln":Z
    goto :goto_0

    .line 2298
    .end local v2    # "valBln":Z
    :cond_2
    invoke-static {v1, v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->instanceOf(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Z

    move-result v2

    .line 2300
    .restart local v2    # "valBln":Z
    :goto_0
    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, p2, p4

    .line 2301
    return p4
.end method

.method private static doRefMember(Lcom/trendmicro/hippo/Context;[Ljava/lang/Object;[DII)I
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "flags"    # I

    .line 2601
    aget-object v0, p1, p3

    .line 2602
    .local v0, "elem":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_0

    aget-wide v1, p2, p3

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2603
    :cond_0
    add-int/lit8 p3, p3, -0x1

    .line 2604
    aget-object v1, p1, p3

    .line 2605
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_1

    aget-wide v2, p2, p3

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2606
    :cond_1
    invoke-static {v1, v0, p0, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->memberRef(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;I)Lcom/trendmicro/hippo/Ref;

    move-result-object v2

    aput-object v2, p1, p3

    .line 2607
    return p3
.end method

.method private static doRefNsMember(Lcom/trendmicro/hippo/Context;[Ljava/lang/Object;[DII)I
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "flags"    # I

    .line 2612
    aget-object v0, p1, p3

    .line 2613
    .local v0, "elem":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_0

    aget-wide v1, p2, p3

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2614
    :cond_0
    add-int/lit8 p3, p3, -0x1

    .line 2615
    aget-object v1, p1, p3

    .line 2616
    .local v1, "ns":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_1

    aget-wide v2, p2, p3

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2617
    :cond_1
    add-int/lit8 p3, p3, -0x1

    .line 2618
    aget-object v2, p1, p3

    .line 2619
    .local v2, "obj":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v2, v3, :cond_2

    aget-wide v3, p2, p3

    invoke-static {v3, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    .line 2620
    :cond_2
    invoke-static {v2, v1, v0, p0, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->memberRef(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;I)Lcom/trendmicro/hippo/Ref;

    move-result-object v3

    aput-object v3, p1, p3

    .line 2621
    return p3
.end method

.method private static doRefNsName(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DII)I
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I
    .param p5, "flags"    # I

    .line 2627
    aget-object v0, p2, p4

    .line 2628
    .local v0, "name":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_0

    aget-wide v1, p3, p4

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2629
    :cond_0
    add-int/lit8 p4, p4, -0x1

    .line 2630
    aget-object v1, p2, p4

    .line 2631
    .local v1, "ns":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_1

    aget-wide v2, p3, p4

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2632
    :cond_1
    iget-object v2, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v0, p0, v2, p5}, Lcom/trendmicro/hippo/ScriptRuntime;->nameRef(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Ref;

    move-result-object v2

    aput-object v2, p2, p4

    .line 2633
    return p4
.end method

.method private static doSetConstVar(Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I
    .locals 4
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "vars"    # [Ljava/lang/Object;
    .param p5, "varDbls"    # [D
    .param p6, "varAttributes"    # [I
    .param p7, "indexReg"    # I

    .line 2498
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->useActivation:Z

    if-nez v0, :cond_1

    .line 2499
    aget v0, p6, p7

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 2503
    aget v0, p6, p7

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_3

    .line 2506
    aget-object v0, p1, p3

    aput-object v0, p4, p7

    .line 2507
    aget v0, p6, p7

    and-int/lit8 v0, v0, -0x9

    aput v0, p6, p7

    .line 2508
    aget-wide v0, p2, p3

    aput-wide v0, p5, p7

    goto :goto_0

    .line 2500
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v0, v0, p7

    const-string v1, "msg.var.redecl"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0

    .line 2511
    :cond_1
    aget-object v0, p1, p3

    .line 2512
    .local v0, "val":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_2

    aget-wide v1, p2, p3

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2513
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v1, v1, p7

    .line 2514
    .local v1, "stringReg":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    instance-of v2, v2, Lcom/trendmicro/hippo/ConstProperties;

    if-eqz v2, :cond_4

    .line 2515
    iget-object v2, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    check-cast v2, Lcom/trendmicro/hippo/ConstProperties;

    .line 2516
    .local v2, "cp":Lcom/trendmicro/hippo/ConstProperties;
    iget-object v3, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v2, v1, v3, v0}, Lcom/trendmicro/hippo/ConstProperties;->putConst(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 2517
    .end local v2    # "cp":Lcom/trendmicro/hippo/ConstProperties;
    nop

    .line 2520
    .end local v0    # "val":Ljava/lang/Object;
    .end local v1    # "stringReg":Ljava/lang/String;
    :cond_3
    :goto_0
    return p3

    .line 2518
    .restart local v0    # "val":Ljava/lang/Object;
    .restart local v1    # "stringReg":Ljava/lang/String;
    :cond_4
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2
.end method

.method private static doSetElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI)I
    .locals 11
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .line 2421
    add-int/lit8 p4, p4, -0x2

    .line 2422
    add-int/lit8 v0, p4, 0x2

    aget-object v0, p2, v0

    .line 2423
    .local v0, "rhs":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_0

    .line 2424
    add-int/lit8 v1, p4, 0x2

    aget-wide v1, p3, v1

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2426
    :cond_0
    aget-object v1, p2, p4

    .line 2427
    .local v1, "lhs":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_1

    .line 2428
    aget-wide v2, p3, p4

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    move-object v7, v1

    goto :goto_0

    .line 2427
    :cond_1
    move-object v7, v1

    .line 2431
    .end local v1    # "lhs":Ljava/lang/Object;
    .local v7, "lhs":Ljava/lang/Object;
    :goto_0
    add-int/lit8 v1, p4, 0x1

    aget-object v8, p2, v1

    .line 2432
    .local v8, "id":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-eq v8, v1, :cond_2

    .line 2433
    iget-object v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v7, v8, v0, p0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectElem(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .local v1, "value":Ljava/lang/Object;
    goto :goto_1

    .line 2435
    .end local v1    # "value":Ljava/lang/Object;
    :cond_2
    add-int/lit8 v1, p4, 0x1

    aget-wide v9, p3, v1

    .line 2436
    .local v9, "d":D
    iget-object v6, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    move-object v1, v7

    move-wide v2, v9

    move-object v4, v0

    move-object v5, p0

    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectIndex(Ljava/lang/Object;DLjava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 2438
    .end local v9    # "d":D
    .restart local v1    # "value":Ljava/lang/Object;
    :goto_1
    aput-object v1, p2, p4

    .line 2439
    return p4
.end method

.method private static doSetVar(Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I
    .locals 4
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "vars"    # [Ljava/lang/Object;
    .param p5, "varDbls"    # [D
    .param p6, "varAttributes"    # [I
    .param p7, "indexReg"    # I

    .line 2527
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->useActivation:Z

    if-nez v0, :cond_0

    .line 2528
    aget v0, p6, p7

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_2

    .line 2529
    aget-object v0, p1, p3

    aput-object v0, p4, p7

    .line 2530
    aget-wide v0, p2, p3

    aput-wide v0, p5, p7

    goto :goto_0

    .line 2533
    :cond_0
    aget-object v0, p1, p3

    .line 2534
    .local v0, "val":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_1

    aget-wide v1, p2, p3

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2535
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v1, v1, p7

    .line 2536
    .local v1, "stringReg":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v3, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v2, v1, v3, v0}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 2538
    .end local v0    # "val":Ljava/lang/Object;
    .end local v1    # "stringReg":Ljava/lang/String;
    :cond_2
    :goto_0
    return p3
.end method

.method private static doShallowEquals([Ljava/lang/Object;[DI)Z
    .locals 9
    .param p0, "stack"    # [Ljava/lang/Object;
    .param p1, "sDbl"    # [D
    .param p2, "stackTop"    # I

    .line 2697
    add-int/lit8 v0, p2, 0x1

    aget-object v0, p0, v0

    .line 2698
    .local v0, "rhs":Ljava/lang/Object;
    aget-object v1, p0, p2

    .line 2699
    .local v1, "lhs":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    .line 2701
    .local v2, "DBL_MRK":Ljava/lang/Object;
    const/4 v3, 0x0

    if-ne v0, v2, :cond_2

    .line 2702
    add-int/lit8 v4, p2, 0x1

    aget-wide v4, p1, v4

    .line 2703
    .local v4, "rdbl":D
    if-ne v1, v2, :cond_0

    .line 2704
    aget-wide v6, p1, p2

    .local v6, "ldbl":D
    goto :goto_0

    .line 2705
    .end local v6    # "ldbl":D
    :cond_0
    instance-of v6, v1, Ljava/lang/Number;

    if-eqz v6, :cond_1

    .line 2706
    move-object v6, v1

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    .restart local v6    # "ldbl":D
    goto :goto_0

    .line 2708
    .end local v6    # "ldbl":D
    :cond_1
    return v3

    .line 2710
    .end local v4    # "rdbl":D
    :cond_2
    if-ne v1, v2, :cond_5

    .line 2711
    aget-wide v6, p1, p2

    .line 2712
    .restart local v6    # "ldbl":D
    instance-of v4, v0, Ljava/lang/Number;

    if-eqz v4, :cond_4

    .line 2713
    move-object v4, v0

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    .line 2720
    .restart local v4    # "rdbl":D
    :goto_0
    cmpl-double v8, v6, v4

    if-nez v8, :cond_3

    const/4 v3, 0x1

    :cond_3
    return v3

    .line 2715
    .end local v4    # "rdbl":D
    :cond_4
    return v3

    .line 2718
    .end local v6    # "ldbl":D
    :cond_5
    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    return v3
.end method

.method private static doVarIncDec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I
    .locals 12
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I
    .param p5, "vars"    # [Ljava/lang/Object;
    .param p6, "varDbls"    # [D
    .param p7, "varAttributes"    # [I
    .param p8, "indexReg"    # I

    .line 2562
    move-object v0, p1

    const/4 v1, 0x1

    add-int/lit8 v2, p4, 0x1

    .line 2563
    .end local p4    # "stackTop":I
    .local v2, "stackTop":I
    iget-object v3, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v3, v3, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    iget v4, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    aget-byte v3, v3, v4

    .line 2564
    .local v3, "incrDecrMask":I
    iget-boolean v4, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->useActivation:Z

    if-nez v4, :cond_8

    .line 2565
    aget-object v4, p5, p8

    .line 2567
    .local v4, "varValue":Ljava/lang/Object;
    sget-object v5, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v4, v5, :cond_0

    .line 2568
    aget-wide v5, p6, p8

    .local v5, "d":D
    goto :goto_0

    .line 2570
    .end local v5    # "d":D
    :cond_0
    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v5

    .line 2572
    .restart local v5    # "d":D
    :goto_0
    and-int/lit8 v7, v3, 0x1

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    if-nez v7, :cond_1

    .line 2573
    add-double/2addr v8, v5

    goto :goto_1

    :cond_1
    sub-double v8, v5, v8

    :goto_1
    move-wide v7, v8

    .line 2574
    .local v7, "d2":D
    and-int/lit8 v9, v3, 0x2

    if-eqz v9, :cond_2

    move v9, v1

    goto :goto_2

    :cond_2
    const/4 v9, 0x0

    .line 2575
    .local v9, "post":Z
    :goto_2
    aget v10, p7, p8

    and-int/2addr v10, v1

    if-nez v10, :cond_5

    .line 2576
    sget-object v10, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-eq v4, v10, :cond_3

    .line 2577
    sget-object v10, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    aput-object v10, p5, p8

    .line 2579
    :cond_3
    aput-wide v7, p6, p8

    .line 2580
    sget-object v10, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    aput-object v10, p2, v2

    .line 2581
    if-eqz v9, :cond_4

    move-wide v10, v5

    goto :goto_3

    :cond_4
    move-wide v10, v7

    :goto_3
    aput-wide v10, p3, v2

    goto :goto_5

    .line 2583
    :cond_5
    if-eqz v9, :cond_6

    sget-object v10, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-eq v4, v10, :cond_6

    .line 2584
    aput-object v4, p2, v2

    goto :goto_5

    .line 2586
    :cond_6
    sget-object v10, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    aput-object v10, p2, v2

    .line 2587
    if-eqz v9, :cond_7

    move-wide v10, v5

    goto :goto_4

    :cond_7
    move-wide v10, v7

    :goto_4
    aput-wide v10, p3, v2

    .line 2590
    .end local v4    # "varValue":Ljava/lang/Object;
    .end local v5    # "d":D
    .end local v7    # "d2":D
    .end local v9    # "post":Z
    :goto_5
    move-object v6, p0

    goto :goto_6

    .line 2591
    :cond_8
    iget-object v4, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v4, v4, Lcom/trendmicro/hippo/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v4, v4, p8

    .line 2592
    .local v4, "varName":Ljava/lang/String;
    iget-object v5, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    move-object v6, p0

    invoke-static {v5, v4, p0, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->nameIncrDecr(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, p2, v2

    .line 2595
    .end local v4    # "varName":Ljava/lang/String;
    :goto_6
    iget v4, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/2addr v4, v1

    iput v4, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 2596
    return v2
.end method

.method static dumpICode(Lcom/trendmicro/hippo/InterpreterData;)V
    .locals 0
    .param p0, "idata"    # Lcom/trendmicro/hippo/InterpreterData;

    .line 475
    return-void
.end method

.method private static enterFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;Z)V
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "continuationRestart"    # Z

    .line 2927
    iget-object v0, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsNeedsActivation:Z

    .line 2928
    .local v0, "usesActivation":Z
    iget-object v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 2929
    .local v1, "isDebugged":Z
    :goto_0
    if-nez v0, :cond_1

    if-eqz v1, :cond_7

    .line 2930
    :cond_1
    iget-object v2, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 2931
    .local v2, "scope":Lcom/trendmicro/hippo/Scriptable;
    if-nez v2, :cond_2

    .line 2932
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_1

    .line 2933
    :cond_2
    if-eqz p3, :cond_5

    .line 2943
    :cond_3
    instance-of v3, v2, Lcom/trendmicro/hippo/NativeWith;

    if-eqz v3, :cond_5

    .line 2944
    invoke-interface {v2}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 2945
    if-eqz v2, :cond_4

    iget-object v3, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    if-eqz v3, :cond_3

    iget-object v3, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    iget-object v3, v3, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    if-ne v3, v2, :cond_3

    .line 2951
    :cond_4
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2961
    :cond_5
    :goto_1
    if-eqz v1, :cond_6

    .line 2962
    iget-object v3, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

    iget-object v4, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->thisObj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v3, p0, v2, v4, p2}, Lcom/trendmicro/hippo/debug/DebugFrame;->onEnter(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)V

    .line 2967
    :cond_6
    if-eqz v0, :cond_7

    .line 2968
    invoke-static {p0, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->enterActivationFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V

    .line 2971
    .end local v2    # "scope":Lcom/trendmicro/hippo/Scriptable;
    :cond_7
    return-void
.end method

.method private static exitFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;)V
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "throwable"    # Ljava/lang/Object;

    .line 2976
    iget-object v0, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsNeedsActivation:Z

    if-eqz v0, :cond_0

    .line 2977
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->exitActivationFunction(Lcom/trendmicro/hippo/Context;)V

    .line 2980
    :cond_0
    iget-object v0, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

    if-eqz v0, :cond_5

    .line 2982
    :try_start_0
    instance-of v0, p2, Ljava/lang/Throwable;

    if-eqz v0, :cond_1

    .line 2983
    iget-object v0, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

    const/4 v1, 0x1

    invoke-interface {v0, p0, v1, p2}, Lcom/trendmicro/hippo/debug/DebugFrame;->onExit(Lcom/trendmicro/hippo/Context;ZLjava/lang/Object;)V

    goto :goto_2

    .line 2986
    :cond_1
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;

    .line 2987
    .local v0, "cjump":Lcom/trendmicro/hippo/Interpreter$ContinuationJump;
    if-nez v0, :cond_2

    .line 2988
    iget-object v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .local v1, "result":Ljava/lang/Object;
    goto :goto_0

    .line 2990
    .end local v1    # "result":Ljava/lang/Object;
    :cond_2
    iget-object v1, v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    .line 2992
    .restart local v1    # "result":Ljava/lang/Object;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_4

    .line 2994
    if-nez v0, :cond_3

    .line 2995
    iget-wide v2, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->resultDbl:D

    .local v2, "resultDbl":D
    goto :goto_1

    .line 2997
    .end local v2    # "resultDbl":D
    :cond_3
    iget-wide v2, v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->resultDbl:D

    .line 2999
    .restart local v2    # "resultDbl":D
    :goto_1
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    move-object v1, v4

    .line 3001
    .end local v2    # "resultDbl":D
    :cond_4
    iget-object v2, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

    const/4 v3, 0x0

    invoke-interface {v2, p0, v3, v1}, Lcom/trendmicro/hippo/debug/DebugFrame;->onExit(Lcom/trendmicro/hippo/Context;ZLjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3007
    .end local v0    # "cjump":Lcom/trendmicro/hippo/Interpreter$ContinuationJump;
    .end local v1    # "result":Ljava/lang/Object;
    :goto_2
    goto :goto_3

    .line 3003
    :catchall_0
    move-exception v0

    .line 3004
    .local v0, "ex":Ljava/lang/Throwable;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v2, "HIPPO USAGE WARNING: onExit terminated with exception"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 3006
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 3009
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_5
    :goto_3
    return-void
.end method

.method private static freezeGenerator(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;ILcom/trendmicro/hippo/Interpreter$GeneratorState;)Ljava/lang/Object;
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "stackTop"    # I
    .param p3, "generatorState"    # Lcom/trendmicro/hippo/Interpreter$GeneratorState;

    .line 2823
    iget v0, p3, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->operation:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    .line 2828
    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    .line 2829
    iget-object v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v1, v1, p2

    iput-object v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 2830
    iget-object v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    aget-wide v2, v1, p2

    iput-wide v2, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->resultDbl:D

    .line 2831
    iput p2, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    .line 2832
    iget v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    sub-int/2addr v1, v0

    iput v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 2833
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->exitActivationFunction(Lcom/trendmicro/hippo/Context;)V

    .line 2834
    iget-object v0, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->result:Ljava/lang/Object;

    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-eq v0, v1, :cond_0

    .line 2835
    iget-object v0, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->result:Ljava/lang/Object;

    goto :goto_0

    .line 2836
    :cond_0
    iget-wide v0, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->resultDbl:D

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2834
    :goto_0
    return-object v0

    .line 2825
    :cond_1
    const-string v0, "msg.yield.closing"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private static getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;
    .locals 5
    .param p0, "stack"    # [Ljava/lang/Object;
    .param p1, "sDbl"    # [D
    .param p2, "shift"    # I
    .param p3, "count"    # I

    .line 3217
    if-nez p3, :cond_0

    .line 3218
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    return-object v0

    .line 3220
    :cond_0
    new-array v0, p3, [Ljava/lang/Object;

    .line 3221
    .local v0, "args":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, p3, :cond_2

    .line 3222
    aget-object v2, p0, p2

    .line 3223
    .local v2, "val":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v2, v3, :cond_1

    .line 3224
    aget-wide v3, p1, p2

    invoke-static {v3, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    .line 3226
    :cond_1
    aput-object v2, v0, v1

    .line 3221
    .end local v2    # "val":Ljava/lang/Object;
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 3228
    .end local v1    # "i":I
    :cond_2
    return-object v0
.end method

.method static getEncodedSource(Lcom/trendmicro/hippo/InterpreterData;)Ljava/lang/String;
    .locals 3
    .param p0, "idata"    # Lcom/trendmicro/hippo/InterpreterData;

    .line 972
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->encodedSource:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 973
    const/4 v0, 0x0

    return-object v0

    .line 975
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->encodedSource:Ljava/lang/String;

    iget v1, p0, Lcom/trendmicro/hippo/InterpreterData;->encodedSourceStart:I

    iget v2, p0, Lcom/trendmicro/hippo/InterpreterData;->encodedSourceEnd:I

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getExceptionHandler(Lcom/trendmicro/hippo/Interpreter$CallFrame;Z)I
    .locals 10
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "onlyFinally"    # Z

    .line 432
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsExceptionTable:[I

    .line 433
    .local v0, "exceptionTable":[I
    if-nez v0, :cond_0

    .line 435
    const/4 v1, -0x1

    return v1

    .line 441
    :cond_0
    iget v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    .line 444
    .local v1, "pc":I
    const/4 v3, -0x1

    .local v3, "best":I
    const/4 v4, 0x0

    .local v4, "bestStart":I
    const/4 v5, 0x0

    .line 445
    .local v5, "bestEnd":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    array-length v7, v0

    if-eq v6, v7, :cond_7

    .line 446
    add-int/lit8 v7, v6, 0x0

    aget v7, v0, v7

    .line 447
    .local v7, "start":I
    add-int/lit8 v8, v6, 0x1

    aget v8, v0, v8

    .line 448
    .local v8, "end":I
    if-gt v7, v1, :cond_6

    if-lt v1, v8, :cond_1

    .line 449
    goto :goto_1

    .line 451
    :cond_1
    if-eqz p1, :cond_2

    add-int/lit8 v9, v6, 0x3

    aget v9, v0, v9

    if-eq v9, v2, :cond_2

    .line 452
    goto :goto_1

    .line 454
    :cond_2
    if-ltz v3, :cond_5

    .line 458
    if-ge v5, v8, :cond_3

    .line 459
    goto :goto_1

    .line 462
    :cond_3
    if-le v4, v7, :cond_4

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 463
    :cond_4
    if-ne v5, v8, :cond_5

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 465
    :cond_5
    move v3, v6

    .line 466
    move v4, v7

    .line 467
    move v5, v8

    .line 445
    .end local v7    # "start":I
    .end local v8    # "end":I
    :cond_6
    :goto_1
    add-int/lit8 v6, v6, 0x6

    goto :goto_0

    .line 469
    .end local v6    # "i":I
    :cond_7
    return v3
.end method

.method private static getIndex([BI)I
    .locals 2
    .param p0, "iCode"    # [B
    .param p1, "pc"    # I

    .line 421
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private static getInt([BI)I
    .locals 2
    .param p0, "iCode"    # [B
    .param p1, "pc"    # I

    .line 425
    aget-byte v0, p0, p1

    shl-int/lit8 v0, v0, 0x18

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method static getLineNumbers(Lcom/trendmicro/hippo/InterpreterData;)[I
    .locals 8
    .param p0, "data"    # Lcom/trendmicro/hippo/InterpreterData;

    .line 768
    new-instance v0, Lcom/trendmicro/hippo/UintMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/UintMap;-><init>()V

    .line 770
    .local v0, "presentLines":Lcom/trendmicro/hippo/UintMap;
    iget-object v1, p0, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    .line 771
    .local v1, "iCode":[B
    array-length v2, v1

    .line 772
    .local v2, "iCodeLength":I
    const/4 v3, 0x0

    .local v3, "pc":I
    :goto_0
    if-eq v3, v2, :cond_2

    .line 773
    aget-byte v4, v1, v3

    .line 774
    .local v4, "bytecode":I
    invoke-static {v4}, Lcom/trendmicro/hippo/Interpreter;->bytecodeSpan(I)I

    move-result v5

    .line 775
    .local v5, "span":I
    const/16 v6, -0x1a

    if-ne v4, v6, :cond_1

    .line 776
    const/4 v6, 0x3

    if-eq v5, v6, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 777
    :cond_0
    add-int/lit8 v6, v3, 0x1

    invoke-static {v1, v6}, Lcom/trendmicro/hippo/Interpreter;->getIndex([BI)I

    move-result v6

    .line 778
    .local v6, "line":I
    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 780
    .end local v6    # "line":I
    :cond_1
    add-int/2addr v3, v5

    .line 781
    .end local v4    # "bytecode":I
    .end local v5    # "span":I
    goto :goto_0

    .line 783
    .end local v3    # "pc":I
    :cond_2
    invoke-virtual {v0}, Lcom/trendmicro/hippo/UintMap;->getKeys()[I

    move-result-object v3

    return-object v3
.end method

.method private static getShort([BI)I
    .locals 2
    .param p0, "iCode"    # [B
    .param p1, "pc"    # I

    .line 417
    aget-byte v0, p0, p1

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private static initFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;[DIILcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/Interpreter$CallFrame;)Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .locals 12
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "callerScope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "argsDbl"    # [D
    .param p5, "argShift"    # I
    .param p6, "argCount"    # I
    .param p7, "fnOrScript"    # Lcom/trendmicro/hippo/InterpretedFunction;
    .param p8, "parentFrame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 2918
    move-object v7, p0

    new-instance v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-object v8, p2

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    invoke-direct {v0, p0, p2, v9, v10}, Lcom/trendmicro/hippo/Interpreter$CallFrame;-><init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/Interpreter$CallFrame;)V

    move-object v11, v0

    .line 2919
    .local v11, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    move-object v1, p0

    move-object v2, p1

    move-object v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/trendmicro/hippo/Interpreter$CallFrame;->initializeArgs(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;[DII)V

    .line 2920
    const/4 v0, 0x0

    move-object v1, p3

    invoke-static {p0, v11, p3, v0}, Lcom/trendmicro/hippo/Interpreter;->enterFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;Z)V

    .line 2921
    return-object v11
.end method

.method private static initFrameForApplyOrCall(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;I[Ljava/lang/Object;[DIILcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/InterpretedFunction;)Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .locals 16
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "indexReg"    # I
    .param p3, "stack"    # [Ljava/lang/Object;
    .param p4, "sDbl"    # [D
    .param p5, "stackTop"    # I
    .param p6, "op"    # I
    .param p7, "calleeScope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p8, "ifun"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p9, "iApplyCallable"    # Lcom/trendmicro/hippo/InterpretedFunction;

    .line 2869
    move-object/from16 v9, p0

    move-object/from16 v0, p1

    move/from16 v10, p2

    move/from16 v11, p5

    move/from16 v12, p6

    if-eqz v10, :cond_1

    .line 2870
    add-int/lit8 v1, v11, 0x2

    aget-object v1, p3, v1

    .line 2871
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v2, :cond_0

    .line 2872
    add-int/lit8 v2, v11, 0x2

    aget-wide v2, p4, v2

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2873
    :cond_0
    iget-object v2, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v9, v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 2874
    .local v1, "applyThis":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_0

    .line 2876
    .end local v1    # "applyThis":Lcom/trendmicro/hippo/Scriptable;
    :cond_1
    const/4 v1, 0x0

    .line 2878
    .restart local v1    # "applyThis":Lcom/trendmicro/hippo/Scriptable;
    :goto_0
    if-nez v1, :cond_2

    .line 2880
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    move-object v13, v1

    goto :goto_1

    .line 2878
    :cond_2
    move-object v13, v1

    .line 2882
    .end local v1    # "applyThis":Lcom/trendmicro/hippo/Scriptable;
    .local v13, "applyThis":Lcom/trendmicro/hippo/Scriptable;
    :goto_1
    const/16 v1, -0x37

    if-ne v12, v1, :cond_3

    .line 2883
    const/4 v1, 0x0

    invoke-static {v9, v0, v1}, Lcom/trendmicro/hippo/Interpreter;->exitFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 2884
    iget-object v0, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-object v14, v0

    .end local p1    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v0, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    goto :goto_2

    .line 2887
    .end local v0    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local p1    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :cond_3
    iput v11, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    .line 2888
    iput v12, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedCallOp:I

    move-object v14, v0

    .line 2891
    .end local p1    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v14, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :goto_2
    invoke-static/range {p8 .. p8}, Lcom/trendmicro/hippo/BaseFunction;->isApply(Lcom/trendmicro/hippo/IdFunctionObject;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_5

    .line 2892
    if-ge v10, v1, :cond_4

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    goto :goto_3

    .line 2893
    :cond_4
    add-int/lit8 v0, v11, 0x3

    aget-object v0, p3, v0

    invoke-static {v9, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getApplyArguments(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    :goto_3
    move-object v15, v0

    .line 2894
    .local v15, "callArgs":[Ljava/lang/Object;
    const/4 v4, 0x0

    const/4 v5, 0x0

    array-length v6, v15

    move-object/from16 v0, p0

    move-object/from16 v1, p7

    move-object v2, v13

    move-object v3, v15

    move-object/from16 v7, p9

    move-object v8, v14

    invoke-static/range {v0 .. v8}, Lcom/trendmicro/hippo/Interpreter;->initFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;[DIILcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/Interpreter$CallFrame;)Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object v0

    .line 2896
    .end local v15    # "callArgs":[Ljava/lang/Object;
    .local v0, "calleeFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    goto :goto_6

    .line 2899
    .end local v0    # "calleeFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :cond_5
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_4
    if-ge v0, v10, :cond_6

    .line 2900
    add-int/lit8 v2, v11, 0x1

    add-int/2addr v2, v0

    add-int/lit8 v3, v11, 0x2

    add-int/2addr v3, v0

    aget-object v3, p3, v3

    aput-object v3, p3, v2

    .line 2901
    add-int/lit8 v2, v11, 0x1

    add-int/2addr v2, v0

    add-int/lit8 v3, v11, 0x2

    add-int/2addr v3, v0

    aget-wide v3, p4, v3

    aput-wide v3, p4, v2

    .line 2899
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 2903
    .end local v0    # "i":I
    :cond_6
    if-ge v10, v1, :cond_7

    const/4 v0, 0x0

    goto :goto_5

    :cond_7
    add-int/lit8 v0, v10, -0x1

    :goto_5
    move v6, v0

    .line 2904
    .local v6, "argCount":I
    add-int/lit8 v5, v11, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, p7

    move-object v2, v13

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v7, p9

    move-object v8, v14

    invoke-static/range {v0 .. v8}, Lcom/trendmicro/hippo/Interpreter;->initFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;[DIILcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/Interpreter$CallFrame;)Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object v0

    .line 2908
    .end local v6    # "argCount":I
    .local v0, "calleeFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :goto_6
    return-object v0
.end method

.method private static initFrameForNoSuchMethod(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;I[Ljava/lang/Object;[DIILcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;Lcom/trendmicro/hippo/InterpretedFunction;)Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .locals 19
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "indexReg"    # I
    .param p3, "stack"    # [Ljava/lang/Object;
    .param p4, "sDbl"    # [D
    .param p5, "stackTop"    # I
    .param p6, "op"    # I
    .param p7, "funThisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p8, "calleeScope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p9, "noSuchMethodShim"    # Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    .param p10, "ifun"    # Lcom/trendmicro/hippo/InterpretedFunction;

    .line 2645
    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move/from16 v11, p2

    move/from16 v12, p5

    move/from16 v13, p6

    const/4 v0, 0x0

    .line 2648
    .local v0, "argsArray":[Ljava/lang/Object;
    add-int/lit8 v1, v12, 0x2

    .line 2649
    .local v1, "shift":I
    new-array v14, v11, [Ljava/lang/Object;

    .line 2650
    .local v14, "elements":[Ljava/lang/Object;
    const/4 v2, 0x0

    move v15, v1

    .end local v1    # "shift":I
    .local v2, "i":I
    .local v15, "shift":I
    :goto_0
    if-ge v2, v11, :cond_1

    .line 2651
    aget-object v1, p3, v15

    .line 2652
    .local v1, "val":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v1, v3, :cond_0

    .line 2653
    aget-wide v3, p4, v15

    invoke-static {v3, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2655
    :cond_0
    aput-object v1, v14, v2

    .line 2650
    .end local v1    # "val":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 2657
    .end local v2    # "i":I
    :cond_1
    const/4 v1, 0x2

    new-array v8, v1, [Ljava/lang/Object;

    .line 2658
    .end local v0    # "argsArray":[Ljava/lang/Object;
    .local v8, "argsArray":[Ljava/lang/Object;
    const/4 v0, 0x0

    move-object/from16 v7, p9

    iget-object v1, v7, Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;->methodName:Ljava/lang/String;

    aput-object v1, v8, v0

    .line 2659
    move-object/from16 v6, p8

    invoke-virtual {v9, v6, v14}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v8, v1

    .line 2662
    move-object/from16 v0, p1

    .line 2663
    .local v0, "callParentFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    const/16 v5, -0x37

    if-ne v13, v5, :cond_2

    .line 2664
    iget-object v0, v10, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 2665
    const/4 v1, 0x0

    invoke-static {v9, v10, v1}, Lcom/trendmicro/hippo/Interpreter;->exitFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;)V

    move-object/from16 v16, v0

    goto :goto_1

    .line 2663
    :cond_2
    move-object/from16 v16, v0

    .line 2669
    .end local v0    # "callParentFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v16, "callParentFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :goto_1
    const/4 v4, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, p8

    move-object/from16 v2, p7

    move-object v3, v8

    move/from16 v5, v17

    move/from16 v6, v18

    move-object/from16 v7, p10

    move-object/from16 v17, v8

    .end local v8    # "argsArray":[Ljava/lang/Object;
    .local v17, "argsArray":[Ljava/lang/Object;
    move-object/from16 v8, v16

    invoke-static/range {v0 .. v8}, Lcom/trendmicro/hippo/Interpreter;->initFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;[DIILcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/Interpreter$CallFrame;)Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object v0

    .line 2671
    .local v0, "calleeFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    const/16 v1, -0x37

    if-eq v13, v1, :cond_3

    .line 2672
    iput v12, v10, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    .line 2673
    iput v13, v10, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedCallOp:I

    .line 2675
    :cond_3
    return-object v0
.end method

.method private static initFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/InterpretedFunction;I)V
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "parent"    # Lcom/trendmicro/hippo/InterpretedFunction;
    .param p3, "index"    # I

    .line 983
    invoke-static {p0, p1, p2, p3}, Lcom/trendmicro/hippo/InterpretedFunction;->createFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/InterpretedFunction;I)Lcom/trendmicro/hippo/InterpretedFunction;

    move-result-object v0

    .line 984
    .local v0, "fn":Lcom/trendmicro/hippo/InterpretedFunction;
    iget-object v1, v0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v1, v1, Lcom/trendmicro/hippo/InterpreterData;->itsFunctionType:I

    iget-object v2, p2, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v2, v2, Lcom/trendmicro/hippo/InterpreterData;->evalScriptFlag:Z

    invoke-static {p0, p1, v0, v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->initFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeFunction;IZ)V

    .line 986
    return-void
.end method

.method static interpret(Lcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11
    .param p0, "ifun"    # Lcom/trendmicro/hippo/InterpretedFunction;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 992
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->hasTopCall(Lcom/trendmicro/hippo/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 994
    :cond_0
    iget-object v0, p1, Lcom/trendmicro/hippo/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    iget-object v1, p0, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    if-eq v0, v1, :cond_1

    .line 995
    iget-object v0, p1, Lcom/trendmicro/hippo/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    .line 996
    .local v0, "savedDomain":Ljava/lang/Object;
    iget-object v1, p0, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    iput-object v1, p1, Lcom/trendmicro/hippo/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    .line 998
    :try_start_0
    iget-object v2, p0, Lcom/trendmicro/hippo/InterpretedFunction;->securityController:Lcom/trendmicro/hippo/SecurityController;

    iget-object v3, p0, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    move-object v4, p1

    move-object v5, p0

    move-object v6, p2

    move-object v7, p3

    move-object v8, p4

    invoke-virtual/range {v2 .. v8}, Lcom/trendmicro/hippo/SecurityController;->callWithDomain(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1001
    iput-object v0, p1, Lcom/trendmicro/hippo/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    .line 998
    return-object v1

    .line 1001
    :catchall_0
    move-exception v1

    iput-object v0, p1, Lcom/trendmicro/hippo/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    .line 1002
    throw v1

    .line 1005
    .end local v0    # "savedDomain":Ljava/lang/Object;
    :cond_1
    const/4 v6, 0x0

    const/4 v7, 0x0

    array-length v8, p4

    const/4 v10, 0x0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v9, p0

    invoke-static/range {v2 .. v10}, Lcom/trendmicro/hippo/Interpreter;->initFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;[DIILcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/Interpreter$CallFrame;)Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object v0

    .line 1007
    .local v0, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    iget-boolean v1, p1, Lcom/trendmicro/hippo/Context;->isContinuationsTopCall:Z

    iput-boolean v1, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->isContinuationsTopFrame:Z

    .line 1008
    const/4 v1, 0x0

    iput-boolean v1, p1, Lcom/trendmicro/hippo/Context;->isContinuationsTopCall:Z

    .line 1010
    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/trendmicro/hippo/Interpreter;->interpretLoop(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private static interpretLoop(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 47
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "throwable"    # Ljava/lang/Object;

    .line 1080
    move-object/from16 v14, p0

    move-object/from16 v1, p2

    sget-object v13, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    .line 1081
    .local v13, "DBL_MRK":Ljava/lang/Object;
    sget-object v12, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1083
    .local v12, "undefined":Ljava/lang/Object;
    iget v2, v14, Lcom/trendmicro/hippo/Context;->instructionThreshold:I

    const/4 v10, 0x1

    if-eqz v2, :cond_0

    move v2, v10

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    move v9, v2

    .line 1086
    .local v9, "instructionCounting":Z
    const/16 v19, 0x64

    .line 1088
    .local v19, "INVOCATION_COST":I
    const/16 v20, 0x64

    .line 1090
    .local v20, "EXCEPTION_COST":I
    const/4 v2, 0x0

    .line 1091
    .local v2, "stringReg":Ljava/lang/String;
    const/4 v3, -0x1

    .line 1093
    .local v3, "indexReg":I
    iget-object v4, v14, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-eqz v4, :cond_2

    .line 1096
    iget-object v4, v14, Lcom/trendmicro/hippo/Context;->previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

    if-nez v4, :cond_1

    .line 1097
    new-instance v4, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v4}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v4, v14, Lcom/trendmicro/hippo/Context;->previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

    .line 1099
    :cond_1
    iget-object v4, v14, Lcom/trendmicro/hippo/Context;->previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

    iget-object v5, v14, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/ObjArray;->push(Ljava/lang/Object;)V

    .line 1109
    :cond_2
    const/4 v4, 0x0

    .line 1110
    .local v4, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    if-eqz v1, :cond_4

    .line 1111
    instance-of v5, v1, Lcom/trendmicro/hippo/Interpreter$GeneratorState;

    if-eqz v5, :cond_3

    .line 1112
    move-object v4, v1

    check-cast v4, Lcom/trendmicro/hippo/Interpreter$GeneratorState;

    .line 1115
    sget-object v5, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    move-object/from16 v6, p1

    invoke-static {v14, v6, v5, v10}, Lcom/trendmicro/hippo/Interpreter;->enterFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;Z)V

    .line 1116
    const/4 v1, 0x0

    move-object v8, v4

    .end local p2    # "throwable":Ljava/lang/Object;
    .local v1, "throwable":Ljava/lang/Object;
    goto :goto_2

    .line 1117
    .end local v1    # "throwable":Ljava/lang/Object;
    .restart local p2    # "throwable":Ljava/lang/Object;
    :cond_3
    move-object/from16 v6, p1

    instance-of v5, v1, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;

    if-nez v5, :cond_5

    .line 1119
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_1

    .line 1110
    :cond_4
    move-object/from16 v6, p1

    .line 1123
    :cond_5
    :goto_1
    move-object v8, v4

    .end local v4    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local p2    # "throwable":Ljava/lang/Object;
    .restart local v1    # "throwable":Ljava/lang/Object;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    :goto_2
    const/4 v4, 0x0

    .line 1124
    .local v4, "interpreterResult":Ljava/lang/Object;
    const-wide/16 v15, 0x0

    move-object/from16 v21, v4

    move-wide/from16 v22, v15

    .line 1129
    .end local v4    # "interpreterResult":Ljava/lang/Object;
    .end local p1    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v21, "interpreterResult":Ljava/lang/Object;
    .local v22, "interpreterResultDbl":D
    :goto_3
    const/4 v4, 0x0

    const/4 v15, 0x2

    if-eqz v1, :cond_6

    .line 1133
    :try_start_0
    invoke-static {v14, v1, v6, v3, v9}, Lcom/trendmicro/hippo/Interpreter;->processThrowable(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Interpreter$CallFrame;IZ)Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object v16

    move-object/from16 v6, v16

    .line 1135
    iget-object v5, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->throwable:Ljava/lang/Object;

    move-object v1, v5

    .line 1136
    iput-object v4, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->throwable:Ljava/lang/Object;

    move-object/from16 v24, v1

    goto :goto_4

    .line 2130
    :catchall_0
    move-exception v0

    move-object v5, v0

    move-object/from16 v24, v1

    move-object v4, v8

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object v1, v14

    const/16 v33, 0x0

    move-object v9, v6

    move-object v6, v13

    goto/16 :goto_2d

    .line 1138
    :cond_6
    if-nez v8, :cond_7

    iget-boolean v5, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    if-eqz v5, :cond_7

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1143
    :cond_7
    move-object/from16 v24, v1

    .end local v1    # "throwable":Ljava/lang/Object;
    .local v24, "throwable":Ljava/lang/Object;
    :goto_4
    :try_start_1
    iget-object v1, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    move-object v5, v1

    .line 1144
    .local v5, "stack":[Ljava/lang/Object;
    iget-object v1, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    .line 1145
    .local v1, "sDbl":[D
    iget-object v4, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->varSource:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    iget-object v4, v4, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    move-object v15, v4

    .line 1146
    .local v15, "vars":[Ljava/lang/Object;
    iget-object v4, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->varSource:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    iget-object v4, v4, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    move-object/from16 v16, v4

    .line 1147
    .local v16, "varDbls":[D
    iget-object v4, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->varSource:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    iget-object v4, v4, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stackAttributes:[I

    move-object/from16 v17, v4

    .line 1148
    .local v17, "varAttributes":[I
    iget-object v4, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v4, v4, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    .line 1149
    .local v4, "iCode":[B
    iget-object v7, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v7, v7, Lcom/trendmicro/hippo/InterpreterData;->itsStringTable:[Ljava/lang/String;

    move-object/from16 v34, v7

    .line 1155
    .local v34, "strings":[Ljava/lang/String;
    iget v7, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    .line 1158
    .local v7, "stackTop":I
    iput-object v6, v14, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3e

    move/from16 v45, v7

    move-object v7, v2

    move/from16 v2, v45

    .line 1165
    .local v2, "stackTop":I
    .local v7, "stringReg":Ljava/lang/String;
    :goto_5
    :try_start_2
    iget v11, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/lit8 v10, v11, 0x1

    iput v10, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    aget-byte v10, v4, v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3d

    move v11, v10

    .line 1169
    .local v11, "op":I
    const/16 v10, 0x9d

    if-eq v11, v10, :cond_58

    packed-switch v11, :pswitch_data_0

    const-wide/16 v27, 0x0

    const/4 v10, 0x4

    packed-switch v11, :pswitch_data_1

    packed-switch v11, :pswitch_data_2

    .line 2087
    :try_start_3
    iget-object v10, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    invoke-static {v10}, Lcom/trendmicro/hippo/Interpreter;->dumpICode(Lcom/trendmicro/hippo/InterpreterData;)V

    .line 2088
    new-instance v10, Ljava/lang/RuntimeException;

    move-object/from16 v29, v1

    .end local v1    # "sDbl":[D
    .local v29, "sDbl":[D
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v30, v2

    .end local v2    # "stackTop":I
    .local v30, "stackTop":I
    const-string v2, "Unknown icode : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " @ pc : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/16 v26, 0x1

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v10, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local v3    # "indexReg":I
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v9    # "instructionCounting":Z
    .end local v12    # "undefined":Ljava/lang/Object;
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .end local v19    # "INVOCATION_COST":I
    .end local v20    # "EXCEPTION_COST":I
    .end local v21    # "interpreterResult":Ljava/lang/Object;
    .end local v22    # "interpreterResultDbl":D
    .end local v24    # "throwable":Ljava/lang/Object;
    .end local p0    # "cx":Lcom/trendmicro/hippo/Context;
    throw v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 2130
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v29    # "sDbl":[D
    .end local v30    # "stackTop":I
    .end local v34    # "strings":[Ljava/lang/String;
    .restart local v3    # "indexReg":I
    .restart local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v9    # "instructionCounting":Z
    .restart local v12    # "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v19    # "INVOCATION_COST":I
    .restart local v20    # "EXCEPTION_COST":I
    .restart local v21    # "interpreterResult":Ljava/lang/Object;
    .restart local v22    # "interpreterResultDbl":D
    .restart local v24    # "throwable":Ljava/lang/Object;
    .restart local p0    # "cx":Lcom/trendmicro/hippo/Context;
    :catchall_1
    move-exception v0

    move-object v5, v0

    move-object v2, v7

    move-object v4, v8

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object v1, v14

    const/16 v33, 0x0

    move-object v9, v6

    move-object v6, v13

    goto/16 :goto_2d

    .line 1894
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .restart local v11    # "op":I
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_0
    move-object/from16 v29, v1

    move/from16 v30, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .restart local v29    # "sDbl":[D
    .restart local v30    # "stackTop":I
    move-object/from16 v10, v29

    .end local v29    # "sDbl":[D
    .local v10, "sDbl":[D
    move-object/from16 v1, p0

    move/from16 v35, v30

    .end local v30    # "stackTop":I
    .local v35, "stackTop":I
    move-object v2, v6

    move/from16 v29, v3

    .end local v3    # "indexReg":I
    .local v29, "indexReg":I
    move-object v3, v5

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/4 v12, 0x0

    move-object v15, v4

    .end local v4    # "iCode":[B
    .end local v12    # "undefined":Ljava/lang/Object;
    .local v15, "iCode":[B
    .local v30, "undefined":Ljava/lang/Object;
    .local v36, "vars":[Ljava/lang/Object;
    move-object v4, v10

    move-object v12, v5

    move-object/from16 v31, v8

    const/16 v8, 0x64

    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "stack":[Ljava/lang/Object;
    .local v31, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    move/from16 v5, v35

    move-object v8, v6

    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    move/from16 v6, v29

    :try_start_4
    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/Interpreter;->doRefNsName(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DII)I

    move-result v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move v2, v1

    .line 1895
    .end local v35    # "stackTop":I
    .restart local v2    # "stackTop":I
    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v3, v29

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    const/4 v10, 0x1

    goto/16 :goto_5

    .line 2130
    .end local v2    # "stackTop":I
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v15    # "iCode":[B
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    :catchall_2
    move-exception v0

    move-object v5, v0

    move-object v2, v7

    move/from16 v40, v9

    move-object v6, v13

    move-object v1, v14

    move/from16 v3, v29

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v9, v8

    goto/16 :goto_2d

    .line 1886
    .end local v29    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .restart local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_1
    move-object v10, v1

    move/from16 v35, v2

    move/from16 v29, v3

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v29    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v35    # "stackTop":I
    .restart local v36    # "vars":[Ljava/lang/Object;
    move/from16 v6, v35

    .end local v35    # "stackTop":I
    .local v6, "stackTop":I
    :try_start_5
    aget-object v1, v12, v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 1887
    .local v1, "name":Ljava/lang/Object;
    if-ne v1, v13, :cond_8

    :try_start_6
    aget-wide v2, v10, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    move-object v1, v2

    .line 1888
    :cond_8
    :try_start_7
    iget-object v2, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    move/from16 v5, v29

    .end local v29    # "indexReg":I
    .local v5, "indexReg":I
    :try_start_8
    invoke-static {v1, v14, v2, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->nameRef(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Ref;

    move-result-object v2

    aput-object v2, v12, v6

    .line 1890
    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_2b

    .line 2130
    .end local v1    # "name":Ljava/lang/Object;
    .end local v5    # "indexReg":I
    .end local v6    # "stackTop":I
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v15    # "iCode":[B
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v29    # "indexReg":I
    :catchall_3
    move-exception v0

    move/from16 v5, v29

    move v3, v5

    move-object v2, v7

    move/from16 v40, v9

    move-object v6, v13

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v5, v0

    move-object v9, v8

    .end local v29    # "indexReg":I
    .restart local v5    # "indexReg":I
    goto/16 :goto_2d

    .line 1881
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_2
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    invoke-static {v14, v12, v10, v6, v5}, Lcom/trendmicro/hippo/Interpreter;->doRefNsMember(Lcom/trendmicro/hippo/Context;[Ljava/lang/Object;[DII)I

    move-result v1

    move v2, v1

    .line 1882
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    const/4 v10, 0x1

    goto/16 :goto_5

    .line 1876
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_3
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    invoke-static {v14, v12, v10, v6, v5}, Lcom/trendmicro/hippo/Interpreter;->doRefMember(Lcom/trendmicro/hippo/Context;[Ljava/lang/Object;[DII)I

    move-result v1

    move v2, v1

    .line 1877
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    const/4 v10, 0x1

    goto/16 :goto_5

    .line 2013
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_4
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    aget-object v1, v12, v6

    .line 2014
    .local v1, "value":Ljava/lang/Object;
    if-eq v1, v13, :cond_9

    .line 2015
    invoke-static {v1, v14}, Lcom/trendmicro/hippo/ScriptRuntime;->escapeTextValue(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v12, v6

    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_2b

    .line 2014
    :cond_9
    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_2b

    .line 2006
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_5
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    aget-object v1, v12, v6

    .line 2007
    .local v1, "value":Ljava/lang/Object;
    if-eq v1, v13, :cond_a

    .line 2008
    invoke-static {v1, v14}, Lcom/trendmicro/hippo/ScriptRuntime;->escapeAttributeValue(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v12, v6

    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_2b

    .line 2007
    :cond_a
    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_2b

    .line 2000
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_6
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    aget-object v1, v12, v6

    .line 2001
    .local v1, "value":Ljava/lang/Object;
    if-ne v1, v13, :cond_b

    aget-wide v2, v10, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 2002
    :cond_b
    invoke-static {v1, v14}, Lcom/trendmicro/hippo/ScriptRuntime;->setDefaultNamespace(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v12, v6

    .line 2003
    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_2b

    .line 1169
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_7
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v39, v31

    const/4 v9, 0x1

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move v15, v11

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_28

    .line 1868
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_8
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    aget-object v1, v12, v6

    .line 1869
    .local v1, "obj":Ljava/lang/Object;
    if-ne v1, v13, :cond_c

    aget-wide v2, v10, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1870
    :cond_c
    iget-object v2, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v7, v14, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->specialRef(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Ref;

    move-result-object v2

    aput-object v2, v12, v6

    .line 1872
    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_2b

    .line 1482
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_9
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    aget-object v1, v12, v6

    check-cast v1, Lcom/trendmicro/hippo/Ref;

    .line 1483
    .local v1, "ref":Lcom/trendmicro/hippo/Ref;
    invoke-static {v1, v14}, Lcom/trendmicro/hippo/ScriptRuntime;->refDel(Lcom/trendmicro/hippo/Ref;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v12, v6

    .line 1484
    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_2b

    .line 1474
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_a
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    aget-object v1, v12, v6

    .line 1475
    .local v1, "value":Ljava/lang/Object;
    if-ne v1, v13, :cond_d

    aget-wide v2, v10, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1476
    :cond_d
    add-int/lit8 v2, v6, -0x1

    .line 1477
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    aget-object v3, v12, v2

    check-cast v3, Lcom/trendmicro/hippo/Ref;

    .line 1478
    .local v3, "ref":Lcom/trendmicro/hippo/Ref;
    iget-object v4, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v3, v1, v14, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->refSet(Lcom/trendmicro/hippo/Ref;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    aput-object v4, v12, v2

    .line 1479
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    const/4 v10, 0x1

    goto/16 :goto_5

    .line 1469
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .local v3, "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_b
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    aget-object v1, v12, v6

    check-cast v1, Lcom/trendmicro/hippo/Ref;

    .line 1470
    .local v1, "ref":Lcom/trendmicro/hippo/Ref;
    invoke-static {v1, v14}, Lcom/trendmicro/hippo/ScriptRuntime;->refGet(Lcom/trendmicro/hippo/Ref;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v12, v6

    .line 1471
    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_2b

    .line 1169
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_c
    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v8, v6

    move v12, v2

    move v6, v3

    move-object v15, v4

    move-object/from16 v37, v7

    move/from16 v40, v9

    move/from16 v18, v11

    move-object/from16 v10, v30

    move-object/from16 v39, v31

    const/4 v11, 0x0

    move-object v7, v1

    move-object v9, v8

    move-object v8, v13

    move-object v13, v14

    move-object v14, v5

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    goto/16 :goto_16

    .line 1344
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_d
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_29

    .line 1796
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_e
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    iget-object v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    aput-object v1, v12, v2

    .line 1797
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    const/4 v10, 0x1

    goto/16 :goto_5

    .line 1858
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_f
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    iget v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_7

    add-int v3, v5, v1

    .line 1859
    .end local v5    # "indexReg":I
    .restart local v3    # "indexReg":I
    :try_start_9
    aget-object v1, v12, v3

    .line 1860
    .local v1, "val":Ljava/lang/Object;
    add-int/lit8 v2, v6, 0x1

    .line 1861
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    const/16 v4, 0x3e

    if-ne v11, v4, :cond_e

    .line 1862
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->enumNext(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v4

    goto :goto_6

    .line 1863
    :cond_e
    invoke-static {v1, v14}, Lcom/trendmicro/hippo/ScriptRuntime;->enumId(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v4

    :goto_6
    aput-object v4, v12, v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    .line 1864
    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    const/4 v10, 0x1

    goto/16 :goto_5

    .line 1842
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_10
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    :try_start_a
    aget-object v1, v12, v6

    .line 1843
    .local v1, "lhs":Ljava/lang/Object;
    if-ne v1, v13, :cond_f

    aget-wide v2, v10, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1844
    :cond_f
    add-int/lit8 v2, v6, -0x1

    .line 1845
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    iget v3, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_7

    add-int/2addr v3, v5

    .line 1846
    .end local v5    # "indexReg":I
    .restart local v3    # "indexReg":I
    const/16 v4, 0x3a

    if-ne v11, v4, :cond_10

    .line 1847
    const/4 v4, 0x0

    goto :goto_7

    .line 1848
    :cond_10
    const/16 v4, 0x3b

    if-ne v11, v4, :cond_11

    .line 1849
    const/4 v4, 0x1

    goto :goto_7

    .line 1850
    :cond_11
    const/16 v4, 0x3d

    if-ne v11, v4, :cond_12

    .line 1851
    const/4 v4, 0x6

    goto :goto_7

    .line 1852
    :cond_12
    const/4 v4, 0x2

    :goto_7
    nop

    .line 1853
    .local v4, "enumType":I
    :try_start_b
    iget-object v5, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v14, v5, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->enumInit(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v12, v3
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    .line 1854
    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    const/4 v10, 0x1

    goto/16 :goto_5

    .line 1821
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .local v4, "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_11
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    add-int/lit8 v2, v6, -0x1

    .line 1822
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    :try_start_c
    iget v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    add-int v3, v5, v1

    .line 1824
    .end local v5    # "indexReg":I
    .restart local v3    # "indexReg":I
    :try_start_d
    iget-object v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    iget v4, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    aget-byte v1, v1, v4

    if-eqz v1, :cond_13

    const/4 v1, 0x1

    goto :goto_8

    :cond_13
    const/4 v1, 0x0

    .line 1825
    .local v1, "afterFirstScope":Z
    :goto_8
    add-int/lit8 v4, v2, 0x1

    aget-object v4, v12, v4

    check-cast v4, Ljava/lang/Throwable;

    .line 1827
    .local v4, "caughtException":Ljava/lang/Throwable;
    if-nez v1, :cond_14

    .line 1828
    const/4 v5, 0x0

    .local v5, "lastCatchScope":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_9

    .line 1830
    .end local v5    # "lastCatchScope":Lcom/trendmicro/hippo/Scriptable;
    :cond_14
    aget-object v5, v12, v3

    check-cast v5, Lcom/trendmicro/hippo/Scriptable;

    .line 1832
    .restart local v5    # "lastCatchScope":Lcom/trendmicro/hippo/Scriptable;
    :goto_9
    iget-object v6, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v4, v5, v7, v14, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->newCatchScope(Ljava/lang/Throwable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v6

    aput-object v6, v12, v3

    .line 1835
    iget v6, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    const/16 v26, 0x1

    add-int/lit8 v6, v6, 0x1

    :try_start_e
    iput v6, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    .line 1836
    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 2130
    .end local v1    # "afterFirstScope":Z
    .end local v2    # "stackTop":I
    .end local v4    # "caughtException":Ljava/lang/Throwable;
    .end local v5    # "lastCatchScope":Lcom/trendmicro/hippo/Scriptable;
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v15    # "iCode":[B
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    :catchall_4
    move-exception v0

    const/16 v26, 0x1

    move-object v5, v0

    move-object v2, v7

    move/from16 v40, v9

    move-object v6, v13

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v9, v8

    goto/16 :goto_2d

    .end local v3    # "indexReg":I
    .local v5, "indexReg":I
    :catchall_5
    move-exception v0

    const/16 v26, 0x1

    move v3, v5

    move-object v2, v7

    move/from16 v40, v9

    move-object v6, v13

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v5, v0

    move-object v9, v8

    goto/16 :goto_2d

    .line 1169
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .local v4, "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_12
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    move-object/from16 v37, v7

    move/from16 v40, v9

    move-object v7, v10

    move v5, v11

    move/from16 v18, v26

    move-object/from16 v10, v30

    move-object/from16 v39, v31

    move-object/from16 v15, v36

    const/4 v11, 0x0

    move-object v9, v8

    move-object v8, v13

    move-object v13, v14

    move-object v14, v12

    move v12, v6

    goto/16 :goto_19

    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_13
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    move-object/from16 v37, v7

    move/from16 v40, v9

    move-object v7, v10

    move v5, v11

    move/from16 v18, v26

    move-object/from16 v10, v30

    move-object/from16 v39, v31

    const/4 v11, 0x0

    move-object v9, v8

    move-object v8, v13

    move-object v13, v14

    move-object v14, v12

    move v12, v6

    goto/16 :goto_18

    .line 1494
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_14
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    add-int/lit8 v2, v6, 0x1

    .line 1495
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    :try_start_f
    iget v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_7

    add-int v3, v5, v1

    .line 1496
    .end local v5    # "indexReg":I
    .restart local v3    # "indexReg":I
    :try_start_10
    aget-object v1, v12, v3

    aput-object v1, v12, v2

    .line 1497
    aget-wide v4, v10, v3

    aput-wide v4, v10, v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 1498
    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1230
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_15
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    :try_start_11
    invoke-static {v14, v11, v12, v10, v6}, Lcom/trendmicro/hippo/Interpreter;->doInOrInstanceof(Lcom/trendmicro/hippo/Context;I[Ljava/lang/Object;[DI)I

    move-result v1

    move v2, v1

    .line 1231
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1217
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_16
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    iget v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_7

    add-int v3, v5, v1

    .line 1218
    .end local v5    # "indexReg":I
    .restart local v3    # "indexReg":I
    :try_start_12
    aget-object v1, v12, v3
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_6

    .line 1219
    .end local v24    # "throwable":Ljava/lang/Object;
    .local v1, "throwable":Ljava/lang/Object;
    move-object v2, v1

    move-object/from16 v37, v7

    move/from16 v40, v9

    move-object v6, v13

    move-object v1, v14

    move-object/from16 v7, v21

    move-wide/from16 v10, v22

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v13, v8

    goto/16 :goto_2e

    .line 2130
    .end local v1    # "throwable":Ljava/lang/Object;
    .end local v6    # "stackTop":I
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v15    # "iCode":[B
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v24    # "throwable":Ljava/lang/Object;
    :catchall_6
    move-exception v0

    move-object v5, v0

    move-object v2, v7

    move/from16 v40, v9

    move-object v6, v13

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v9, v8

    goto/16 :goto_2d

    .line 1206
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_17
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    :try_start_13
    aget-object v1, v12, v6

    .line 1207
    .local v1, "value":Ljava/lang/Object;
    if-ne v1, v13, :cond_15

    aget-wide v2, v10, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1208
    :cond_15
    add-int/lit8 v2, v6, -0x1

    .line 1210
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    iget v3, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    invoke-static {v15, v3}, Lcom/trendmicro/hippo/Interpreter;->getIndex([BI)I

    move-result v3

    .line 1211
    .local v3, "sourceLine":I
    new-instance v4, Lcom/trendmicro/hippo/JavaScriptException;

    iget-object v6, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v6, v6, Lcom/trendmicro/hippo/InterpreterData;->itsSourceFile:Ljava/lang/String;

    invoke-direct {v4, v1, v6, v3}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    .line 1214
    .end local v24    # "throwable":Ljava/lang/Object;
    .local v4, "throwable":Ljava/lang/Object;
    move-object v2, v4

    move v3, v5

    move-object/from16 v37, v7

    move/from16 v40, v9

    move-object v6, v13

    move-object v1, v14

    move-object/from16 v7, v21

    move-wide/from16 v10, v22

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v13, v8

    goto/16 :goto_2e

    .line 1395
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .local v3, "indexReg":I
    .local v4, "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v24    # "throwable":Ljava/lang/Object;
    :pswitch_18
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    iget-object v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v14, v1, v7}, Lcom/trendmicro/hippo/ScriptRuntime;->bind(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    aput-object v1, v12, v2

    .line 1396
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1919
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_19
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    iget-object v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpreterData;->itsRegExpLiterals:[Ljava/lang/Object;

    aget-object v1, v1, v5

    .line 1920
    .local v1, "re":Ljava/lang/Object;
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    iget-object v3, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v14, v3, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    aput-object v3, v12, v2

    .line 1921
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1243
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_1a
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    add-int/lit8 v2, v6, -0x1

    .line 1244
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    invoke-static {v12, v10, v2}, Lcom/trendmicro/hippo/Interpreter;->doShallowEquals([Ljava/lang/Object;[DI)Z

    move-result v1

    .line 1245
    .local v1, "valBln":Z
    const/16 v3, 0x2f

    if-ne v11, v3, :cond_16

    move/from16 v3, v26

    goto :goto_a

    :cond_16
    const/4 v3, 0x0

    :goto_a
    xor-int/2addr v1, v3

    .line 1246
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v12, v2

    .line 1247
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1802
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_1b
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    aput-object v1, v12, v2

    .line 1803
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1799
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_1c
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    aput-object v1, v12, v2

    .line 1800
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1793
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_1d
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    iget-object v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->thisObj:Lcom/trendmicro/hippo/Scriptable;

    aput-object v1, v12, v2

    .line 1794
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1790
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_1e
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    add-int/lit8 v2, v6, 0x1

    const/4 v1, 0x0

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    aput-object v1, v12, v2

    .line 1791
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1727
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_1f
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    aput-object v7, v12, v2

    .line 1728
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1742
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_20
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    add-int/lit8 v2, v6, 0x1

    .line 1743
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    aput-object v13, v12, v2

    .line 1744
    iget-object v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpreterData;->itsDoubleTable:[D

    aget-wide v3, v1, v5

    aput-wide v3, v10, v2

    .line 1745
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1747
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_21
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    iget-object v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v14, v1, v7}, Lcom/trendmicro/hippo/ScriptRuntime;->name(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    aput-object v1, v12, v2

    .line 1748
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1169
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_22
    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v8, v6

    move v12, v2

    move v6, v3

    move-object/from16 v37, v7

    move/from16 v40, v9

    move/from16 v18, v26

    move-object/from16 v10, v30

    move-object/from16 v39, v31

    move-object v7, v1

    move-object v9, v8

    move-object v8, v13

    move-object v13, v14

    move-object v14, v5

    move v5, v11

    const/4 v11, 0x0

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    goto/16 :goto_1d

    .line 1461
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_23
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    invoke-static {v14, v8, v12, v10, v6}, Lcom/trendmicro/hippo/Interpreter;->doSetElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI)I

    move-result v1

    move v2, v1

    .line 1462
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1457
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_24
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    invoke-static {v14, v8, v12, v10, v6}, Lcom/trendmicro/hippo/Interpreter;->doGetElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI)I

    move-result v1

    move v2, v1

    .line 1458
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1438
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_25
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    aget-object v1, v12, v6

    .line 1439
    .local v1, "rhs":Ljava/lang/Object;
    if-ne v1, v13, :cond_17

    aget-wide v2, v10, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1440
    :cond_17
    add-int/lit8 v2, v6, -0x1

    .line 1441
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    aget-object v3, v12, v2

    .line 1442
    .local v3, "lhs":Ljava/lang/Object;
    if-ne v3, v13, :cond_18

    aget-wide v27, v10, v2

    invoke-static/range {v27 .. v28}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    move-object v3, v4

    .line 1443
    :cond_18
    iget-object v4, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v3, v7, v1, v14, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectProp(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    aput-object v4, v12, v2

    .line 1445
    move v3, v5

    move-object v6, v8

    move-object v1, v10

    move-object v5, v12

    move-object v4, v15

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v8, v31

    move-object/from16 v15, v36

    goto/16 :goto_5

    .line 1424
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .local v3, "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_26
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    aget-object v1, v12, v6

    .line 1425
    .local v1, "lhs":Ljava/lang/Object;
    if-ne v1, v13, :cond_19

    aget-wide v2, v10, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1426
    :cond_19
    iget-object v2, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v7, v14, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectPropNoWarn(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v12, v6

    .line 1428
    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_2b

    .line 1431
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_27
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    aget-object v1, v12, v6

    .line 1432
    .local v1, "lhs":Ljava/lang/Object;
    if-ne v1, v13, :cond_1a

    aget-wide v2, v10, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1433
    :cond_1a
    iget-object v2, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v7, v14, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectProp(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v12, v6

    .line 1435
    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_2b

    .line 1718
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_28
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    aget-object v1, v12, v6

    .line 1719
    .local v1, "lhs":Ljava/lang/Object;
    if-ne v1, v13, :cond_1b

    aget-wide v2, v10, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1720
    :cond_1b
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v12, v6

    .line 1721
    move/from16 v40, v9

    move-object v3, v10

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v10, v7

    move-object v14, v12

    move-object v7, v15

    move v12, v6

    move-object v6, v13

    move-object v13, v8

    goto/16 :goto_2b

    .line 2130
    .end local v1    # "lhs":Ljava/lang/Object;
    .end local v6    # "stackTop":I
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v15    # "iCode":[B
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    :catchall_7
    move-exception v0

    move v3, v5

    move-object v2, v7

    move/from16 v40, v9

    move-object v6, v13

    move-object v1, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    const/16 v33, 0x0

    move-object v5, v0

    move-object v9, v8

    goto/16 :goto_2d

    .line 1169
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_29
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move-object/from16 v35, v4

    move-object v5, v7

    move/from16 v40, v9

    move-object/from16 v39, v31

    const/4 v4, 0x2

    const/4 v7, 0x0

    const/16 v15, 0xd

    move-object v9, v8

    move-object v8, v14

    move v14, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    goto/16 :goto_13

    .line 1676
    .end local v10    # "sDbl":[D
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_2a
    move-object v10, v1

    move-object/from16 v31, v8

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/16 v26, 0x1

    move-object v15, v4

    move-object v12, v5

    move-object v8, v6

    move v6, v2

    move v5, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v36    # "vars":[Ljava/lang/Object;
    if-eqz v9, :cond_1c

    .line 1677
    iget v1, v14, Lcom/trendmicro/hippo/Context;->instructionCount:I

    const/16 v27, 0x64

    add-int/lit8 v1, v1, 0x64

    iput v1, v14, Lcom/trendmicro/hippo/Context;->instructionCount:I
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_7

    goto :goto_b

    .line 1676
    :cond_1c
    const/16 v27, 0x64

    .line 1681
    :goto_b
    sub-int/2addr v6, v5

    .line 1683
    :try_start_14
    aget-object v1, v12, v6

    move-object v4, v1

    .line 1684
    .local v4, "lhs":Ljava/lang/Object;
    nop

    instance-of v1, v4, Lcom/trendmicro/hippo/InterpretedFunction;
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_d

    if-eqz v1, :cond_1e

    .line 1685
    :try_start_15
    move-object v1, v4

    check-cast v1, Lcom/trendmicro/hippo/InterpretedFunction;

    move-object v3, v1

    .line 1686
    .local v3, "f":Lcom/trendmicro/hippo/InterpretedFunction;
    iget-object v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    iget-object v2, v3, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    if-ne v1, v2, :cond_1d

    .line 1687
    iget-object v1, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {v3, v14, v1}, Lcom/trendmicro/hippo/InterpretedFunction;->createObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    move-object/from16 v28, v1

    .line 1688
    .local v28, "newInstance":Lcom/trendmicro/hippo/Scriptable;
    iget-object v2, v8, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_9

    add-int/lit8 v29, v6, 0x1

    move-object/from16 v1, p0

    move-object/from16 v32, v3

    .end local v3    # "f":Lcom/trendmicro/hippo/InterpretedFunction;
    .local v32, "f":Lcom/trendmicro/hippo/InterpretedFunction;
    move-object/from16 v3, v28

    move-object/from16 v35, v15

    move-object v15, v4

    .end local v4    # "lhs":Ljava/lang/Object;
    .local v15, "lhs":Ljava/lang/Object;
    .local v35, "iCode":[B
    move-object v4, v12

    move/from16 p1, v5

    .end local v5    # "indexReg":I
    .local p1, "indexReg":I
    move-object v5, v10

    move v14, v6

    .end local v6    # "stackTop":I
    .local v14, "stackTop":I
    move/from16 v6, v29

    move-object/from16 v37, v7

    .end local v7    # "stringReg":Ljava/lang/String;
    .local v37, "stringReg":Ljava/lang/String;
    move/from16 v7, p1

    move-object/from16 v38, v8

    move-object/from16 v39, v31

    .end local v8    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v38, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v39, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    move-object/from16 v8, v32

    move/from16 v40, v9

    .end local v9    # "instructionCounting":Z
    .local v40, "instructionCounting":Z
    move-object/from16 v9, v38

    :try_start_16
    invoke-static/range {v1 .. v9}, Lcom/trendmicro/hippo/Interpreter;->initFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;[DIILcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/Interpreter$CallFrame;)Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object v1

    .line 1691
    .local v1, "calleeFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    aput-object v28, v12, v14
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_8

    .line 1692
    move-object/from16 v9, v38

    .end local v38    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :try_start_17
    iput v14, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    .line 1693
    iput v11, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedCallOp:I
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_a

    .line 1694
    move-object v6, v1

    .line 1695
    .end local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    move-object/from16 v14, p0

    move/from16 v3, p1

    move-object/from16 v1, v24

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v2, v37

    move-object/from16 v8, v39

    move/from16 v9, v40

    goto/16 :goto_3

    .line 2130
    .end local v1    # "calleeFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v14    # "stackTop":I
    .end local v15    # "lhs":Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v28    # "newInstance":Lcom/trendmicro/hippo/Scriptable;
    .end local v32    # "f":Lcom/trendmicro/hippo/InterpretedFunction;
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v38    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :catchall_8
    move-exception v0

    move-object/from16 v9, v38

    move-object/from16 v1, p0

    move/from16 v3, p1

    move-object v5, v0

    move-object v6, v13

    move-object/from16 v18, v30

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    const/16 v33, 0x0

    .end local v38    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    goto/16 :goto_2d

    .line 1686
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local p1    # "indexReg":I
    .restart local v3    # "f":Lcom/trendmicro/hippo/InterpretedFunction;
    .restart local v4    # "lhs":Ljava/lang/Object;
    .restart local v5    # "indexReg":I
    .local v6, "stackTop":I
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v9, "instructionCounting":Z
    .restart local v10    # "sDbl":[D
    .restart local v11    # "op":I
    .restart local v12    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v34    # "strings":[Ljava/lang/String;
    .restart local v36    # "vars":[Ljava/lang/Object;
    :cond_1d
    move-object/from16 v32, v3

    move/from16 p1, v5

    move v14, v6

    move-object/from16 v37, v7

    move/from16 v40, v9

    move-object/from16 v35, v15

    move-object/from16 v39, v31

    move-object v15, v4

    move-object v9, v8

    .end local v3    # "f":Lcom/trendmicro/hippo/InterpretedFunction;
    .end local v4    # "lhs":Ljava/lang/Object;
    .end local v5    # "indexReg":I
    .end local v6    # "stackTop":I
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stackTop":I
    .local v15, "lhs":Ljava/lang/Object;
    .restart local v32    # "f":Lcom/trendmicro/hippo/InterpretedFunction;
    .restart local v35    # "iCode":[B
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local p1    # "indexReg":I
    goto :goto_c

    .line 2130
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v14    # "stackTop":I
    .end local v15    # "lhs":Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v32    # "f":Lcom/trendmicro/hippo/InterpretedFunction;
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local p1    # "indexReg":I
    .restart local v5    # "indexReg":I
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v9, "instructionCounting":Z
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    :catchall_9
    move-exception v0

    move/from16 p1, v5

    move-object/from16 v37, v7

    move/from16 v40, v9

    move-object v9, v8

    move-object/from16 v1, p0

    move/from16 v3, p1

    move-object v5, v0

    move-object v6, v13

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    move-object/from16 v2, v37

    const/16 v33, 0x0

    .end local v5    # "indexReg":I
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local p1    # "indexReg":I
    goto/16 :goto_2d

    .line 1684
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local p1    # "indexReg":I
    .restart local v4    # "lhs":Ljava/lang/Object;
    .restart local v5    # "indexReg":I
    .restart local v6    # "stackTop":I
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v9, "instructionCounting":Z
    .restart local v10    # "sDbl":[D
    .restart local v11    # "op":I
    .restart local v12    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v34    # "strings":[Ljava/lang/String;
    .restart local v36    # "vars":[Ljava/lang/Object;
    :cond_1e
    move/from16 p1, v5

    move v14, v6

    move-object/from16 v37, v7

    move/from16 v40, v9

    move-object/from16 v35, v15

    move-object/from16 v39, v31

    move-object v15, v4

    move-object v9, v8

    .line 1698
    .end local v4    # "lhs":Ljava/lang/Object;
    .end local v5    # "indexReg":I
    .end local v6    # "stackTop":I
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stackTop":I
    .local v15, "lhs":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local p1    # "indexReg":I
    :goto_c
    :try_start_18
    instance-of v1, v15, Lcom/trendmicro/hippo/Function;
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_c

    if-nez v1, :cond_20

    .line 1699
    if-ne v15, v13, :cond_1f

    :try_start_19
    aget-wide v1, v10, v14

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    move-object v4, v1

    .end local v15    # "lhs":Ljava/lang/Object;
    .restart local v4    # "lhs":Ljava/lang/Object;
    goto :goto_d

    .end local v4    # "lhs":Ljava/lang/Object;
    .restart local v15    # "lhs":Ljava/lang/Object;
    :cond_1f
    move-object v4, v15

    .line 1700
    .end local v15    # "lhs":Ljava/lang/Object;
    .restart local v4    # "lhs":Ljava/lang/Object;
    :goto_d
    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    .end local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .end local v19    # "INVOCATION_COST":I
    .end local v20    # "EXCEPTION_COST":I
    .end local v21    # "interpreterResult":Ljava/lang/Object;
    .end local v22    # "interpreterResultDbl":D
    .end local v24    # "throwable":Ljava/lang/Object;
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local p0    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p1    # "indexReg":I
    throw v1
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_a

    .line 2130
    .end local v4    # "lhs":Ljava/lang/Object;
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v14    # "stackTop":I
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v19    # "INVOCATION_COST":I
    .restart local v20    # "EXCEPTION_COST":I
    .restart local v21    # "interpreterResult":Ljava/lang/Object;
    .restart local v22    # "interpreterResultDbl":D
    .restart local v24    # "throwable":Ljava/lang/Object;
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local p0    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p1    # "indexReg":I
    :catchall_a
    move-exception v0

    move-object/from16 v1, p0

    move/from16 v3, p1

    move-object v5, v0

    move-object v6, v13

    move-object/from16 v18, v30

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    const/16 v33, 0x0

    goto/16 :goto_2d

    .line 1702
    .restart local v10    # "sDbl":[D
    .restart local v11    # "op":I
    .restart local v12    # "stack":[Ljava/lang/Object;
    .restart local v14    # "stackTop":I
    .restart local v15    # "lhs":Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    :cond_20
    :try_start_1a
    move-object v1, v15

    check-cast v1, Lcom/trendmicro/hippo/Function;

    .line 1704
    .local v1, "fun":Lcom/trendmicro/hippo/Function;
    instance-of v2, v1, Lcom/trendmicro/hippo/IdFunctionObject;
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_c

    if-eqz v2, :cond_22

    .line 1705
    :try_start_1b
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/IdFunctionObject;

    .line 1706
    .local v2, "ifun":Lcom/trendmicro/hippo/IdFunctionObject;
    invoke-static {v2}, Lcom/trendmicro/hippo/NativeContinuation;->isContinuationConstructor(Lcom/trendmicro/hippo/IdFunctionObject;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 1707
    iget-object v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget-object v4, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_a

    .line 1708
    const/4 v7, 0x0

    move-object/from16 v8, p0

    move v5, v14

    .end local v14    # "stackTop":I
    .local v5, "stackTop":I
    :try_start_1c
    invoke-static {v8, v4, v7}, Lcom/trendmicro/hippo/Interpreter;->captureContinuation(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Z)Lcom/trendmicro/hippo/NativeContinuation;

    move-result-object v4

    aput-object v4, v3, v5
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_b

    .line 1709
    move/from16 v14, p1

    goto :goto_f

    .line 2130
    .end local v1    # "fun":Lcom/trendmicro/hippo/Function;
    .end local v2    # "ifun":Lcom/trendmicro/hippo/IdFunctionObject;
    .end local v5    # "stackTop":I
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v15    # "lhs":Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    :catchall_b
    move-exception v0

    move/from16 v3, p1

    move-object v5, v0

    move/from16 v33, v7

    move-object v1, v8

    move-object v6, v13

    move-object/from16 v18, v30

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    goto/16 :goto_2d

    .line 1706
    .restart local v1    # "fun":Lcom/trendmicro/hippo/Function;
    .restart local v2    # "ifun":Lcom/trendmicro/hippo/IdFunctionObject;
    .restart local v10    # "sDbl":[D
    .restart local v11    # "op":I
    .restart local v12    # "stack":[Ljava/lang/Object;
    .restart local v14    # "stackTop":I
    .restart local v15    # "lhs":Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    :cond_21
    const/4 v7, 0x0

    move-object/from16 v8, p0

    move v5, v14

    .end local v14    # "stackTop":I
    .restart local v5    # "stackTop":I
    goto :goto_e

    .line 1704
    .end local v2    # "ifun":Lcom/trendmicro/hippo/IdFunctionObject;
    .end local v5    # "stackTop":I
    .restart local v14    # "stackTop":I
    :cond_22
    const/4 v7, 0x0

    move-object/from16 v8, p0

    move v5, v14

    .line 1713
    .end local v14    # "stackTop":I
    .restart local v5    # "stackTop":I
    :goto_e
    add-int/lit8 v6, v5, 0x1

    move/from16 v14, p1

    .end local p1    # "indexReg":I
    .local v14, "indexReg":I
    :try_start_1d
    invoke-static {v12, v10, v6, v14}, Lcom/trendmicro/hippo/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v2

    .line 1714
    .local v2, "outArgs":[Ljava/lang/Object;
    iget-object v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v1, v8, v3, v2}, Lcom/trendmicro/hippo/Function;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    aput-object v3, v12, v5

    .line 1715
    nop

    .line 1165
    .end local v1    # "fun":Lcom/trendmicro/hippo/Function;
    .end local v2    # "outArgs":[Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v15    # "lhs":Ljava/lang/Object;
    :goto_f
    move v2, v5

    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2130
    .end local v5    # "stackTop":I
    .end local v10    # "sDbl":[D
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v14    # "indexReg":I
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local p1    # "indexReg":I
    :catchall_c
    move-exception v0

    move/from16 v14, p1

    move-object/from16 v1, p0

    move-object v5, v0

    move-object v6, v13

    move v3, v14

    move-object/from16 v18, v30

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    const/16 v33, 0x0

    .end local p1    # "indexReg":I
    .restart local v14    # "indexReg":I
    goto/16 :goto_2d

    .end local v14    # "indexReg":I
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v5, "indexReg":I
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v9, "instructionCounting":Z
    .restart local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    :catchall_d
    move-exception v0

    move-object/from16 v37, v7

    move/from16 v40, v9

    move-object v9, v8

    move-object v8, v14

    move v14, v5

    move-object v5, v0

    move-object v1, v8

    move-object v6, v13

    move v3, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v31

    move-object/from16 v2, v37

    const/16 v33, 0x0

    .end local v5    # "indexReg":I
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "indexReg":I
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    goto/16 :goto_2d

    .line 1371
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .local v2, "stackTop":I
    .local v3, "indexReg":I
    .local v4, "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_2b
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    invoke-static {v9, v6}, Lcom/trendmicro/hippo/Interpreter;->stack_double(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)D

    move-result-wide v1

    .line 1372
    .local v1, "rDbl":D
    aput-object v13, v12, v6

    .line 1373
    const/16 v3, 0x1d

    if-ne v11, v3, :cond_23

    .line 1374
    neg-double v1, v1

    .line 1376
    :cond_23
    aput-wide v1, v10, v6

    .line 1377
    move/from16 v33, v7

    move-object v1, v8

    move-object v3, v10

    move v5, v14

    move-object/from16 v18, v30

    move-object/from16 v7, v35

    move-object/from16 v10, v37

    move-object/from16 v4, v39

    move-object v14, v12

    move v12, v6

    move-object v6, v13

    move-object v13, v9

    goto/16 :goto_2b

    .line 1349
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_2c
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    invoke-static {v9, v6}, Lcom/trendmicro/hippo/Interpreter;->stack_int32(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)I

    move-result v1

    .line 1350
    .local v1, "rIntValue":I
    aput-object v13, v12, v6

    .line 1351
    not-int v2, v1

    int-to-double v2, v2

    aput-wide v2, v10, v6

    .line 1352
    move/from16 v33, v7

    move-object v1, v8

    move-object v3, v10

    move v5, v14

    move-object/from16 v18, v30

    move-object/from16 v7, v35

    move-object/from16 v10, v37

    move-object/from16 v4, v39

    move-object v14, v12

    move v12, v6

    move-object v6, v13

    move-object v13, v9

    goto/16 :goto_2b

    .line 1391
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_2d
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .line 1392
    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    invoke-static {v9, v6}, Lcom/trendmicro/hippo/Interpreter;->stack_boolean(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)Z

    move-result v1

    if-nez v1, :cond_24

    move/from16 v1, v26

    goto :goto_10

    :cond_24
    move v1, v7

    .line 1391
    :goto_10
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v12, v6

    .line 1393
    move/from16 v33, v7

    move-object v1, v8

    move-object v3, v10

    move v5, v14

    move-object/from16 v18, v30

    move-object/from16 v7, v35

    move-object/from16 v10, v37

    move-object/from16 v4, v39

    move-object v14, v12

    move v12, v6

    move-object v6, v13

    move-object v13, v9

    goto/16 :goto_2b

    .line 1387
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_2e
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    invoke-static {v9, v11, v12, v10, v6}, Lcom/trendmicro/hippo/Interpreter;->doArithmetic(Lcom/trendmicro/hippo/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I

    move-result v1

    move v2, v1

    .line 1388
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1380
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_2f
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    add-int/lit8 v2, v6, -0x1

    .line 1381
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    invoke-static {v12, v10, v2, v8}, Lcom/trendmicro/hippo/Interpreter;->doAdd([Ljava/lang/Object;[DILcom/trendmicro/hippo/Context;)V

    .line 1382
    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1363
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_30
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    add-int/lit8 v2, v6, -0x1

    invoke-static {v9, v2}, Lcom/trendmicro/hippo/Interpreter;->stack_double(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)D

    move-result-wide v1

    .line 1364
    .local v1, "lDbl":D
    invoke-static {v9, v6}, Lcom/trendmicro/hippo/Interpreter;->stack_int32(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)I

    move-result v3

    and-int/lit8 v3, v3, 0x1f

    .line 1365
    .local v3, "rIntValue":I
    add-int/lit8 v4, v6, -0x1

    .end local v6    # "stackTop":I
    .local v4, "stackTop":I
    aput-object v13, v12, v4

    .line 1366
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toUint32(D)J

    move-result-wide v5

    ushr-long/2addr v5, v3

    long-to-double v5, v5

    aput-wide v5, v10, v4

    .line 1367
    move v2, v4

    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1225
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .local v3, "indexReg":I
    .local v4, "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_31
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    invoke-static {v9, v11, v12, v10, v6}, Lcom/trendmicro/hippo/Interpreter;->doCompare(Lcom/trendmicro/hippo/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I

    move-result v1

    move v2, v1

    .line 1226
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1235
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_32
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    add-int/lit8 v2, v6, -0x1

    .line 1236
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    invoke-static {v12, v10, v2}, Lcom/trendmicro/hippo/Interpreter;->doEquals([Ljava/lang/Object;[DI)Z

    move-result v1

    .line 1237
    .local v1, "valBln":Z
    const/16 v15, 0xd

    if-ne v11, v15, :cond_25

    move/from16 v3, v26

    goto :goto_11

    :cond_25
    move v3, v7

    :goto_11
    xor-int/2addr v1, v3

    .line 1238
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v12, v2

    .line 1239
    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1359
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_33
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/16 v15, 0xd

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    invoke-static {v9, v11, v12, v10, v6}, Lcom/trendmicro/hippo/Interpreter;->doBitOp(Lcom/trendmicro/hippo/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I

    move-result v1
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_e

    move v2, v1

    .line 1360
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2130
    .end local v2    # "stackTop":I
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    :catchall_e
    move-exception v0

    move-object v5, v0

    move/from16 v33, v7

    move-object v1, v8

    move-object v6, v13

    move v3, v14

    move-object/from16 v18, v30

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    goto/16 :goto_2d

    .line 1399
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_34
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/16 v15, 0xd

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :try_start_1e
    aget-object v1, v12, v6
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_f

    .line 1400
    .local v1, "rhs":Ljava/lang/Object;
    if-ne v1, v13, :cond_26

    :try_start_1f
    aget-wide v2, v10, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_e

    move-object v1, v2

    .line 1401
    :cond_26
    add-int/lit8 v2, v6, -0x1

    .line 1402
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    :try_start_20
    aget-object v3, v12, v2

    check-cast v3, Lcom/trendmicro/hippo/Scriptable;

    .line 1403
    .local v3, "lhs":Lcom/trendmicro/hippo/Scriptable;
    const/16 v4, 0x8

    if-ne v11, v4, :cond_27

    .line 1404
    iget-object v4, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_f

    move-object/from16 v5, v37

    .end local v37    # "stringReg":Ljava/lang/String;
    .local v5, "stringReg":Ljava/lang/String;
    :try_start_21
    invoke-static {v3, v1, v8, v4, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->setName(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_12

    .line 1406
    .end local v5    # "stringReg":Ljava/lang/String;
    .restart local v37    # "stringReg":Ljava/lang/String;
    :cond_27
    move-object/from16 v5, v37

    .end local v37    # "stringReg":Ljava/lang/String;
    .restart local v5    # "stringReg":Ljava/lang/String;
    iget-object v4, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v3, v1, v8, v4, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->strictSetName(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    :goto_12
    aput-object v4, v12, v2

    .line 1408
    move-object v7, v5

    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move/from16 v9, v40

    move-object v14, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2130
    .end local v1    # "rhs":Ljava/lang/Object;
    .end local v2    # "stackTop":I
    .end local v3    # "lhs":Lcom/trendmicro/hippo/Scriptable;
    .end local v5    # "stringReg":Ljava/lang/String;
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    :catchall_f
    move-exception v0

    move-object/from16 v5, v37

    move-object v2, v5

    move/from16 v33, v7

    move-object v1, v8

    move-object v6, v13

    move v3, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v39

    move-object v5, v0

    .end local v37    # "stringReg":Ljava/lang/String;
    .restart local v5    # "stringReg":Ljava/lang/String;
    goto/16 :goto_2d

    .line 1250
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .local v3, "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_35
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/16 v15, 0xd

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move-object v5, v7

    const/4 v7, 0x0

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v5, "stringReg":Ljava/lang/String;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    add-int/lit8 v2, v6, -0x1

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    invoke-static {v9, v6}, Lcom/trendmicro/hippo/Interpreter;->stack_boolean(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 1251
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/4 v4, 0x2

    add-int/2addr v1, v4

    iput v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 1252
    move-object v7, v5

    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move/from16 v9, v40

    move-object v14, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1250
    :cond_28
    const/4 v4, 0x2

    move-object/from16 v37, v5

    move v5, v11

    move v6, v14

    move/from16 v18, v26

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move v11, v7

    move-object v7, v10

    move-object v14, v12

    move-object/from16 v10, v30

    move-object/from16 v45, v13

    move-object v13, v8

    move-object/from16 v8, v45

    goto/16 :goto_1a

    .line 1256
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_36
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v4, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move-object v5, v7

    const/4 v7, 0x0

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v5, "stringReg":Ljava/lang/String;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    add-int/lit8 v2, v6, -0x1

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    invoke-static {v9, v6}, Lcom/trendmicro/hippo/Interpreter;->stack_boolean(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)Z

    move-result v1

    if-nez v1, :cond_29

    .line 1257
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/2addr v1, v4

    iput v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 1258
    move-object v7, v5

    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move/from16 v9, v40

    move-object v14, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1256
    :cond_29
    move-object/from16 v37, v5

    move v5, v11

    move v6, v14

    move/from16 v18, v26

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move v11, v7

    move-object v7, v10

    move-object v14, v12

    move-object/from16 v10, v30

    move-object/from16 v45, v13

    move-object v13, v8

    move-object/from16 v8, v45

    goto/16 :goto_1a

    .line 1269
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_37
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v4, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move-object v5, v7

    const/4 v7, 0x0

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v5, "stringReg":Ljava/lang/String;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    move-object/from16 v37, v5

    move v5, v11

    move v6, v14

    move/from16 v18, v26

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move v11, v7

    move-object v7, v10

    move-object v14, v12

    move-object/from16 v10, v30

    move-object/from16 v45, v13

    move-object v13, v8

    move-object/from16 v8, v45

    goto/16 :goto_1a

    .line 1339
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_38
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v4, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move-object v5, v7

    const/4 v7, 0x0

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v5, "stringReg":Ljava/lang/String;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    aget-object v1, v12, v6

    iput-object v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 1340
    aget-wide v1, v10, v6

    iput-wide v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->resultDbl:D

    .line 1341
    add-int/lit8 v2, v6, -0x1

    .line 1342
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move/from16 v33, v7

    move-object v1, v8

    move-object v3, v10

    move-object v6, v13

    move-object/from16 v18, v30

    move-object/from16 v7, v35

    move-object/from16 v4, v39

    move-object v10, v5

    move-object v13, v9

    move v5, v14

    move-object v14, v12

    goto/16 :goto_2a

    .line 1815
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_39
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v4, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move-object v5, v7

    const/4 v7, 0x0

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v5, "stringReg":Ljava/lang/String;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    iget-object v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->leaveWith(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    iput-object v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 1816
    move/from16 v33, v7

    move-object v1, v8

    move-object v3, v10

    move-object/from16 v18, v30

    move-object/from16 v7, v35

    move-object/from16 v4, v39

    move-object v10, v5

    move v5, v14

    move-object v14, v12

    move v12, v6

    move-object v6, v13

    move-object v13, v9

    goto/16 :goto_2b

    .line 1808
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_3a
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v4, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move-object v5, v7

    const/4 v7, 0x0

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v5, "stringReg":Ljava/lang/String;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    aget-object v1, v12, v6

    .line 1809
    .local v1, "lhs":Ljava/lang/Object;
    if-ne v1, v13, :cond_2a

    aget-wide v2, v10, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1810
    :cond_2a
    add-int/lit8 v2, v6, -0x1

    .line 1811
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    iget-object v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v8, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->enterWith(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    iput-object v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_10

    .line 1812
    move-object v7, v5

    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move/from16 v9, v40

    move-object v14, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2130
    .end local v1    # "lhs":Ljava/lang/Object;
    .end local v2    # "stackTop":I
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    :catchall_10
    move-exception v0

    move-object v2, v5

    move/from16 v33, v7

    move-object v1, v8

    move-object v6, v13

    move v3, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v39

    move-object v5, v0

    goto/16 :goto_2d

    .line 1169
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_3b
    move-object v10, v1

    move-object/from16 v35, v4

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v14

    move-object/from16 v36, v15

    const/4 v4, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move v14, v3

    move-object v12, v5

    move-object v9, v6

    move-object v5, v7

    const/4 v7, 0x0

    move v6, v2

    .line 1420
    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v5, "stringReg":Ljava/lang/String;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :goto_13
    move-object/from16 v1, p0

    move-object v2, v9

    move v3, v11

    move v8, v4

    move-object v4, v12

    move-object/from16 v41, v5

    .end local v5    # "stringReg":Ljava/lang/String;
    .local v41, "stringReg":Ljava/lang/String;
    move-object v5, v10

    move/from16 p1, v6

    .end local v6    # "stackTop":I
    .local p1, "stackTop":I
    :try_start_22
    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/Interpreter;->doDelName(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I

    move-result v1

    move v2, v1

    .line 1421
    .end local p1    # "stackTop":I
    .restart local v2    # "stackTop":I
    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v7, v41

    move-object/from16 v14, p0

    goto/16 :goto_5

    .line 1318
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local v41    # "stringReg":Ljava/lang/String;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_3c
    move-object v10, v1

    move/from16 p1, v2

    move v14, v3

    move-object/from16 v35, v4

    move-object/from16 v41, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move-object v12, v5

    move-object v9, v6

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v41    # "stringReg":Ljava/lang/String;
    .restart local p1    # "stackTop":I
    move/from16 v6, p1

    .end local p1    # "stackTop":I
    .local v6, "stackTop":I
    add-int/lit8 v2, v6, 0x1

    aget-object v1, v12, v6

    aput-object v1, v12, v2

    .line 1319
    add-int/lit8 v2, v6, 0x1

    aget-wide v3, v10, v6

    aput-wide v3, v10, v2

    .line 1320
    add-int/lit8 v2, v6, 0x1

    .line 1321
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v7, v41

    move-object/from16 v14, p0

    goto/16 :goto_5

    .line 1323
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local v41    # "stringReg":Ljava/lang/String;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_3d
    move-object v10, v1

    move v14, v3

    move-object/from16 v35, v4

    move-object/from16 v41, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v41    # "stringReg":Ljava/lang/String;
    add-int/lit8 v2, v6, 0x1

    add-int/lit8 v1, v6, -0x1

    aget-object v1, v12, v1

    aput-object v1, v12, v2

    .line 1324
    add-int/lit8 v2, v6, 0x1

    add-int/lit8 v1, v6, -0x1

    aget-wide v3, v10, v1

    aput-wide v3, v10, v2

    .line 1325
    add-int/lit8 v2, v6, 0x2

    aget-object v1, v12, v6

    aput-object v1, v12, v2

    .line 1326
    add-int/lit8 v2, v6, 0x2

    aget-wide v3, v10, v6

    aput-wide v3, v10, v2

    .line 1327
    add-int/lit8 v2, v6, 0x2

    .line 1328
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v7, v41

    move-object/from16 v14, p0

    goto/16 :goto_5

    .line 1330
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local v41    # "stringReg":Ljava/lang/String;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_3e
    move-object v10, v1

    move v14, v3

    move-object/from16 v35, v4

    move-object/from16 v41, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v41    # "stringReg":Ljava/lang/String;
    aget-object v1, v12, v6

    .line 1331
    .local v1, "o":Ljava/lang/Object;
    add-int/lit8 v2, v6, -0x1

    aget-object v2, v12, v2

    aput-object v2, v12, v6

    .line 1332
    add-int/lit8 v2, v6, -0x1

    aput-object v1, v12, v2

    .line 1333
    aget-wide v2, v10, v6

    .line 1334
    .local v2, "d":D
    add-int/lit8 v4, v6, -0x1

    aget-wide v4, v10, v4

    aput-wide v4, v10, v6

    .line 1335
    add-int/lit8 v4, v6, -0x1

    aput-wide v2, v10, v4

    .line 1336
    move-object/from16 v1, p0

    move/from16 v33, v7

    move-object v3, v10

    move v5, v14

    move-object/from16 v18, v30

    move-object/from16 v7, v35

    move-object/from16 v4, v39

    move-object/from16 v10, v41

    move-object v14, v12

    move v12, v6

    move-object v6, v13

    move-object v13, v9

    goto/16 :goto_2b

    .line 1308
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local v41    # "stringReg":Ljava/lang/String;
    .local v1, "sDbl":[D
    .local v2, "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_3f
    move-object v10, v1

    move v14, v3

    move-object/from16 v35, v4

    move-object/from16 v41, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v41    # "stringReg":Ljava/lang/String;
    const/4 v1, 0x0

    aput-object v1, v12, v6

    .line 1309
    add-int/lit8 v2, v6, -0x1

    .line 1310
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v7, v41

    move-object/from16 v14, p0

    goto/16 :goto_5

    .line 1312
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local v41    # "stringReg":Ljava/lang/String;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_40
    move-object v10, v1

    move v14, v3

    move-object/from16 v35, v4

    move-object/from16 v41, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v41    # "stringReg":Ljava/lang/String;
    aget-object v1, v12, v6

    iput-object v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 1313
    aget-wide v1, v10, v6

    iput-wide v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->resultDbl:D

    .line 1314
    const/4 v1, 0x0

    aput-object v1, v12, v6

    .line 1315
    add-int/lit8 v2, v6, -0x1

    .line 1316
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v7, v41

    move-object/from16 v14, p0

    goto/16 :goto_5

    .line 1262
    .end local v10    # "sDbl":[D
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local v41    # "stringReg":Ljava/lang/String;
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    :pswitch_41
    move-object v10, v1

    move v14, v3

    move-object/from16 v35, v4

    move-object/from16 v41, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v41    # "stringReg":Ljava/lang/String;
    add-int/lit8 v2, v6, -0x1

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    invoke-static {v9, v6}, Lcom/trendmicro/hippo/Interpreter;->stack_boolean(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)Z

    move-result v1

    if-nez v1, :cond_2b

    .line 1263
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/2addr v1, v8

    iput v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 1264
    move-object v6, v9

    move-object v1, v10

    move-object v5, v12

    move v3, v14

    move/from16 v10, v26

    move-object/from16 v12, v30

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v7, v41

    move-object/from16 v14, p0

    goto/16 :goto_5

    .line 1266
    :cond_2b
    add-int/lit8 v1, v2, -0x1

    const/4 v3, 0x0

    .end local v2    # "stackTop":I
    .local v1, "stackTop":I
    aput-object v3, v12, v2
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_11

    .line 1267
    move v2, v1

    move v5, v11

    move-object v8, v13

    move v6, v14

    move/from16 v18, v26

    move-object/from16 v4, v35

    move-object/from16 v15, v36

    move-object/from16 v37, v41

    move-object/from16 v13, p0

    move v11, v7

    move-object v7, v10

    move-object v14, v12

    move-object/from16 v10, v30

    goto/16 :goto_1a

    .line 2130
    .end local v1    # "stackTop":I
    .end local v10    # "sDbl":[D
    .end local v11    # "op":I
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    :catchall_11
    move-exception v0

    move-object/from16 v1, p0

    move-object v5, v0

    move/from16 v33, v7

    move-object v6, v13

    move v3, v14

    move-object/from16 v18, v30

    move-object/from16 v4, v39

    move-object/from16 v2, v41

    goto/16 :goto_2d

    .line 1775
    .end local v14    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local v41    # "stringReg":Ljava/lang/String;
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_42
    move-object v10, v1

    move v14, v3

    move-object/from16 v35, v4

    move-object/from16 v41, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object/from16 v36, v15

    const/4 v3, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/16 v15, 0xd

    const/16 v26, 0x1

    move-object v12, v5

    move-object v9, v6

    move v6, v2

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v15    # "vars":[Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .restart local v14    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v41    # "stringReg":Ljava/lang/String;
    move-object v4, v10

    move/from16 v5, v26

    .end local v10    # "sDbl":[D
    .local v4, "sDbl":[D
    move-object/from16 v10, p0

    move v2, v11

    .end local v11    # "op":I
    .local v2, "op":I
    move-object v11, v9

    move-object v1, v12

    move-object/from16 v3, v30

    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v30    # "undefined":Ljava/lang/Object;
    .local v1, "stack":[Ljava/lang/Object;
    .local v3, "undefined":Ljava/lang/Object;
    move-object v8, v13

    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v8, "DBL_MRK":Ljava/lang/Object;
    move-object v13, v4

    move-object/from16 v5, p0

    move/from16 v29, v14

    .end local v14    # "indexReg":I
    .restart local v29    # "indexReg":I
    move v14, v6

    move/from16 v18, v29

    move-object/from16 v7, v35

    move-object/from16 v15, v36

    .end local v35    # "iCode":[B
    .end local v36    # "vars":[Ljava/lang/Object;
    .local v7, "iCode":[B
    .restart local v15    # "vars":[Ljava/lang/Object;
    :try_start_23
    invoke-static/range {v10 .. v18}, Lcom/trendmicro/hippo/Interpreter;->doVarIncDec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I

    move-result v10
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_12

    move v6, v10

    .line 1777
    move-object v12, v3

    move-object v14, v5

    move v2, v6

    move-object v13, v8

    move-object v6, v9

    move/from16 v3, v29

    move-object/from16 v8, v39

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object v5, v1

    move-object v1, v4

    move-object v4, v7

    move-object/from16 v7, v41

    goto/16 :goto_5

    .line 2130
    .end local v1    # "stack":[Ljava/lang/Object;
    .end local v2    # "op":I
    .end local v4    # "sDbl":[D
    .end local v6    # "stackTop":I
    .end local v7    # "iCode":[B
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    :catchall_12
    move-exception v0

    move-object/from16 v18, v3

    move-object v1, v5

    move-object v6, v8

    move/from16 v3, v29

    move-object/from16 v4, v39

    move-object/from16 v2, v41

    const/16 v33, 0x0

    move-object v5, v0

    goto/16 :goto_2d

    .line 1750
    .end local v29    # "indexReg":I
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local v41    # "stringReg":Ljava/lang/String;
    .local v1, "sDbl":[D
    .local v2, "stackTop":I
    .local v3, "indexReg":I
    .local v4, "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_43
    move/from16 v29, v3

    move-object/from16 v41, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v3, v12

    move-object v8, v13

    move-object v7, v4

    move-object v9, v6

    move-object v4, v1

    move v6, v2

    move-object v1, v5

    move v2, v11

    move-object v5, v14

    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v12    # "undefined":Ljava/lang/Object;
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v1, "stack":[Ljava/lang/Object;
    .local v2, "op":I
    .local v3, "undefined":Ljava/lang/Object;
    .local v4, "sDbl":[D
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v29    # "indexReg":I
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v41    # "stringReg":Ljava/lang/String;
    add-int/lit8 v6, v6, 0x1

    :try_start_24
    iget-object v10, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget v11, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    aget-byte v11, v7, v11
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_13

    move-object/from16 v12, v41

    .end local v41    # "stringReg":Ljava/lang/String;
    .local v12, "stringReg":Ljava/lang/String;
    :try_start_25
    invoke-static {v10, v12, v5, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->nameIncrDecr(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;

    move-result-object v10

    aput-object v10, v1, v6

    .line 1752
    iget v10, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/4 v11, 0x1

    add-int/2addr v10, v11

    iput v10, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 1753
    move-object v14, v5

    move v2, v6

    move-object v13, v8

    move-object v6, v9

    move-object/from16 v8, v39

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object v5, v1

    move-object v1, v4

    move-object v4, v7

    move-object v7, v12

    move-object v12, v3

    move/from16 v3, v29

    goto/16 :goto_5

    .line 2130
    .end local v1    # "stack":[Ljava/lang/Object;
    .end local v2    # "op":I
    .end local v4    # "sDbl":[D
    .end local v6    # "stackTop":I
    .end local v7    # "iCode":[B
    .end local v12    # "stringReg":Ljava/lang/String;
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .restart local v41    # "stringReg":Ljava/lang/String;
    :catchall_13
    move-exception v0

    move-object/from16 v12, v41

    move-object/from16 v18, v3

    move-object v1, v5

    move-object v6, v8

    move-object v2, v12

    move/from16 v3, v29

    move-object/from16 v4, v39

    const/16 v33, 0x0

    move-object v5, v0

    .end local v41    # "stringReg":Ljava/lang/String;
    .restart local v12    # "stringReg":Ljava/lang/String;
    goto/16 :goto_2d

    .line 1448
    .end local v29    # "indexReg":I
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .local v2, "stackTop":I
    .local v3, "indexReg":I
    .local v4, "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_44
    move/from16 v29, v3

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v3, v12

    move-object v8, v13

    move-object v9, v6

    move-object v12, v7

    move v6, v2

    move-object v7, v4

    move v2, v11

    move-object v4, v1

    move-object v1, v5

    move-object v5, v14

    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v1, "stack":[Ljava/lang/Object;
    .local v2, "op":I
    .local v3, "undefined":Ljava/lang/Object;
    .local v4, "sDbl":[D
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v29    # "indexReg":I
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    aget-object v10, v1, v6

    .line 1449
    .local v10, "lhs":Ljava/lang/Object;
    if-ne v10, v8, :cond_2c

    aget-wide v13, v4, v6

    invoke-static {v13, v14}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v11

    move-object v10, v11

    .line 1450
    :cond_2c
    iget-object v11, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget v13, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    aget-byte v13, v7, v13

    invoke-static {v10, v12, v5, v11, v13}, Lcom/trendmicro/hippo/ScriptRuntime;->propIncrDecr(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v11

    aput-object v11, v1, v6

    .line 1453
    iget v11, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/4 v13, 0x1

    add-int/2addr v11, v13

    iput v11, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_14

    .line 1454
    move-object v14, v1

    move-object/from16 v18, v3

    move-object v3, v4

    move-object v1, v5

    move-object v13, v9

    move-object v10, v12

    move-object/from16 v36, v15

    move/from16 v5, v29

    move-object/from16 v4, v39

    const/16 v33, 0x0

    move v12, v6

    move-object v6, v8

    goto/16 :goto_2b

    .line 2130
    .end local v1    # "stack":[Ljava/lang/Object;
    .end local v2    # "op":I
    .end local v4    # "sDbl":[D
    .end local v6    # "stackTop":I
    .end local v7    # "iCode":[B
    .end local v10    # "lhs":Ljava/lang/Object;
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    :catchall_14
    move-exception v0

    move-object/from16 v18, v3

    move-object v1, v5

    move-object v6, v8

    move-object v2, v12

    move/from16 v3, v29

    move-object/from16 v4, v39

    const/16 v33, 0x0

    move-object v5, v0

    goto/16 :goto_2d

    .line 1465
    .end local v29    # "indexReg":I
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .local v2, "stackTop":I
    .local v3, "indexReg":I
    .local v4, "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_45
    move/from16 v29, v3

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v3, v12

    move-object v8, v13

    const/4 v13, 0x1

    move-object v9, v6

    move-object v12, v7

    move v6, v2

    move-object v7, v4

    move v2, v11

    move-object v4, v1

    move-object v1, v5

    move-object v5, v14

    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v1, "stack":[Ljava/lang/Object;
    .local v2, "op":I
    .local v3, "undefined":Ljava/lang/Object;
    .local v4, "sDbl":[D
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v29    # "indexReg":I
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    move-object v14, v1

    .end local v1    # "stack":[Ljava/lang/Object;
    .local v14, "stack":[Ljava/lang/Object;
    move-object/from16 v1, p0

    .end local v2    # "op":I
    .restart local v11    # "op":I
    move-object v2, v9

    move-object v10, v3

    .end local v3    # "undefined":Ljava/lang/Object;
    .local v10, "undefined":Ljava/lang/Object;
    move-object v3, v7

    move-object/from16 p1, v4

    .end local v4    # "sDbl":[D
    .local p1, "sDbl":[D
    move-object v4, v14

    move-object/from16 v30, v10

    move v10, v13

    move-object v13, v5

    .end local v10    # "undefined":Ljava/lang/Object;
    .restart local v30    # "undefined":Ljava/lang/Object;
    move-object/from16 v5, p1

    move/from16 v35, v6

    .end local v6    # "stackTop":I
    .local v35, "stackTop":I
    :try_start_26
    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/Interpreter;->doElemIncDec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[B[Ljava/lang/Object;[DI)I

    move-result v1

    move v2, v1

    .line 1466
    .end local v35    # "stackTop":I
    .local v2, "stackTop":I
    move-object/from16 v1, p1

    move-object v4, v7

    move-object v6, v9

    move-object v7, v12

    move-object v5, v14

    move/from16 v3, v29

    move-object/from16 v12, v30

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1487
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v29    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local p1    # "sDbl":[D
    .local v1, "sDbl":[D
    .local v3, "indexReg":I
    .local v4, "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    :pswitch_46
    move-object/from16 p1, v1

    move/from16 v35, v2

    move/from16 v29, v3

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v13

    move-object v13, v14

    const/4 v10, 0x1

    move-object v14, v5

    move-object v9, v6

    move-object v12, v7

    move-object v7, v4

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v29    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v35    # "stackTop":I
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local p1    # "sDbl":[D
    move/from16 v6, v35

    .end local v35    # "stackTop":I
    .local v6, "stackTop":I
    aget-object v1, v14, v6

    check-cast v1, Lcom/trendmicro/hippo/Ref;

    .line 1488
    .local v1, "ref":Lcom/trendmicro/hippo/Ref;
    iget-object v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    aget-byte v3, v7, v3

    invoke-static {v1, v13, v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->refIncrDecr(Lcom/trendmicro/hippo/Ref;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v14, v6

    .line 1490
    iget v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/2addr v2, v10

    iput v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_15

    .line 1491
    move-object/from16 v3, p1

    move-object v10, v12

    move-object v1, v13

    move-object/from16 v36, v15

    move/from16 v5, v29

    move-object/from16 v18, v30

    move-object/from16 v4, v39

    const/16 v33, 0x0

    move v12, v6

    move-object v6, v8

    move-object v13, v9

    goto/16 :goto_2b

    .line 2130
    .end local v1    # "ref":Lcom/trendmicro/hippo/Ref;
    .end local v6    # "stackTop":I
    .end local v7    # "iCode":[B
    .end local v11    # "op":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local p1    # "sDbl":[D
    :catchall_15
    move-exception v0

    move-object v5, v0

    move-object v6, v8

    move-object v2, v12

    move-object v1, v13

    move/from16 v3, v29

    move-object/from16 v18, v30

    move-object/from16 v4, v39

    const/16 v33, 0x0

    goto/16 :goto_2d

    .line 1898
    .end local v29    # "indexReg":I
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_47
    move-object/from16 p1, v1

    move/from16 v29, v3

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v13

    move-object v13, v14

    const/4 v10, 0x1

    move-object v14, v5

    move-object v9, v6

    move-object v12, v7

    move v6, v2

    move-object v7, v4

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v29    # "indexReg":I
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local p1    # "sDbl":[D
    :try_start_27
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_16

    move/from16 v5, v29

    .end local v29    # "indexReg":I
    .local v5, "indexReg":I
    add-int v3, v5, v1

    .line 1899
    .end local v5    # "indexReg":I
    .restart local v3    # "indexReg":I
    :try_start_28
    aget-object v1, v14, v3

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    iput-object v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_17

    .line 1900
    move-object/from16 v1, p1

    move v2, v6

    move-object v4, v7

    move-object v6, v9

    move-object v7, v12

    move-object v5, v14

    move-object/from16 v12, v30

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2130
    .end local v3    # "indexReg":I
    .end local v6    # "stackTop":I
    .end local v7    # "iCode":[B
    .end local v11    # "op":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local p1    # "sDbl":[D
    .restart local v29    # "indexReg":I
    :catchall_16
    move-exception v0

    move/from16 v5, v29

    move v3, v5

    move-object v6, v8

    move-object v2, v12

    move-object v1, v13

    move-object/from16 v18, v30

    move-object/from16 v4, v39

    const/16 v33, 0x0

    move-object v5, v0

    .end local v29    # "indexReg":I
    .restart local v5    # "indexReg":I
    goto/16 :goto_2d

    .line 1902
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_48
    move-object/from16 p1, v1

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v13

    move-object v13, v14

    const/4 v10, 0x1

    move-object v14, v5

    move-object v9, v6

    move-object v12, v7

    move v6, v2

    move v5, v3

    move-object v7, v4

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local p1    # "sDbl":[D
    :try_start_29
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_18

    add-int v3, v5, v1

    .line 1903
    .end local v5    # "indexReg":I
    .restart local v3    # "indexReg":I
    :try_start_2a
    iget-object v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    aput-object v1, v14, v3
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_17

    .line 1904
    move-object/from16 v1, p1

    move v2, v6

    move-object v4, v7

    move-object v6, v9

    move-object v7, v12

    move-object v5, v14

    move-object/from16 v12, v30

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2130
    .end local v6    # "stackTop":I
    .end local v7    # "iCode":[B
    .end local v11    # "op":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local p1    # "sDbl":[D
    :catchall_17
    move-exception v0

    move-object v5, v0

    move-object v6, v8

    move-object v2, v12

    move-object v1, v13

    move-object/from16 v18, v30

    move-object/from16 v4, v39

    const/16 v33, 0x0

    goto/16 :goto_2d

    .line 1724
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_49
    move-object/from16 p1, v1

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v13

    move-object v13, v14

    const/4 v10, 0x1

    move-object v14, v5

    move-object v9, v6

    move-object v12, v7

    move v6, v2

    move v5, v3

    move-object v7, v4

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local p1    # "sDbl":[D
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    :try_start_2b
    iget-object v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v12}, Lcom/trendmicro/hippo/ScriptRuntime;->typeofName(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v14, v2

    .line 1725
    move-object/from16 v1, p1

    move v3, v5

    move-object v4, v7

    move-object v6, v9

    move-object v7, v12

    move-object v5, v14

    move-object/from16 v12, v30

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1505
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local p1    # "sDbl":[D
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    :pswitch_4a
    move-object/from16 p1, v1

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v13

    move-object v13, v14

    const/4 v10, 0x1

    move-object v14, v5

    move-object v9, v6

    move-object v12, v7

    move v6, v2

    move v5, v3

    move-object v7, v4

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local p1    # "sDbl":[D
    add-int/lit8 v2, v6, 0x1

    .line 1506
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    iget-object v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v12, v13, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->getNameFunctionAndThis(Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v1

    aput-object v1, v14, v2

    .line 1508
    add-int/lit8 v2, v2, 0x1

    .line 1509
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/ScriptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    aput-object v1, v14, v2

    .line 1510
    move-object/from16 v1, p1

    move v3, v5

    move-object v4, v7

    move-object v6, v9

    move-object v7, v12

    move-object v5, v14

    move-object/from16 v12, v30

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1512
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local p1    # "sDbl":[D
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    :pswitch_4b
    move-object/from16 p1, v1

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v13

    move-object v13, v14

    const/4 v10, 0x1

    move-object v14, v5

    move-object v9, v6

    move-object v12, v7

    move v6, v2

    move v5, v3

    move-object v7, v4

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local p1    # "sDbl":[D
    aget-object v1, v14, v6

    .line 1513
    .local v1, "obj":Ljava/lang/Object;
    if-ne v1, v8, :cond_2d

    move-object/from16 v4, p1

    .end local p1    # "sDbl":[D
    .local v4, "sDbl":[D
    aget-wide v2, v4, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    goto :goto_14

    .end local v4    # "sDbl":[D
    .restart local p1    # "sDbl":[D
    :cond_2d
    move-object/from16 v4, p1

    .line 1515
    .end local p1    # "sDbl":[D
    .restart local v4    # "sDbl":[D
    :goto_14
    iget-object v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v12, v13, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v2

    aput-object v2, v14, v6

    .line 1517
    add-int/lit8 v2, v6, 0x1

    .line 1518
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/ScriptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    aput-object v3, v14, v2

    .line 1519
    move-object v1, v4

    move v3, v5

    move-object v4, v7

    move-object v6, v9

    move-object v7, v12

    move-object v5, v14

    move-object/from16 v12, v30

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1522
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v3    # "indexReg":I
    .local v4, "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    :pswitch_4c
    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v13

    move-object v13, v14

    const/4 v10, 0x1

    move-object v14, v5

    move-object v9, v6

    move-object v12, v7

    move v6, v2

    move v5, v3

    move-object v7, v4

    move-object v4, v1

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v4, "sDbl":[D
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    add-int/lit8 v2, v6, -0x1

    aget-object v1, v14, v2

    .line 1523
    .local v1, "obj":Ljava/lang/Object;
    if-ne v1, v8, :cond_2e

    add-int/lit8 v2, v6, -0x1

    aget-wide v2, v4, v2

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1524
    :cond_2e
    aget-object v2, v14, v6

    .line 1525
    .local v2, "id":Ljava/lang/Object;
    if-ne v2, v8, :cond_2f

    aget-wide v26, v4, v6

    invoke-static/range {v26 .. v27}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    move-object v2, v3

    .line 1526
    :cond_2f
    add-int/lit8 v3, v6, -0x1

    iget-object v10, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v2, v13, v10}, Lcom/trendmicro/hippo/ScriptRuntime;->getElemFunctionAndThis(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v10

    aput-object v10, v14, v3

    .line 1528
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/ScriptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    aput-object v3, v14, v6

    .line 1529
    move-object v3, v4

    move-object v10, v12

    move-object v1, v13

    move-object/from16 v36, v15

    move-object/from16 v18, v30

    move-object/from16 v4, v39

    const/16 v33, 0x0

    move v12, v6

    move-object v6, v8

    move-object v13, v9

    goto/16 :goto_2b

    .line 1532
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .local v2, "stackTop":I
    .restart local v3    # "indexReg":I
    .local v4, "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    :pswitch_4d
    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v30, v12

    move-object v8, v13

    move-object v13, v14

    move-object v14, v5

    move-object v9, v6

    move-object v12, v7

    move v6, v2

    move v5, v3

    move-object v7, v4

    move-object v4, v1

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v4, "sDbl":[D
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v30    # "undefined":Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    aget-object v1, v14, v6

    .line 1533
    .local v1, "value":Ljava/lang/Object;
    if-ne v1, v8, :cond_30

    aget-wide v2, v4, v6

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1534
    :cond_30
    invoke-static {v1, v13}, Lcom/trendmicro/hippo/ScriptRuntime;->getValueFunctionAndThis(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Callable;

    move-result-object v2

    aput-object v2, v14, v6

    .line 1535
    add-int/lit8 v2, v6, 0x1

    .line 1536
    .end local v6    # "stackTop":I
    .restart local v2    # "stackTop":I
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/ScriptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    aput-object v3, v14, v2
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_18

    .line 1537
    move-object v1, v4

    move v3, v5

    move-object v4, v7

    move-object v6, v9

    move-object v7, v12

    move-object v5, v14

    move-object/from16 v12, v30

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2130
    .end local v1    # "value":Ljava/lang/Object;
    .end local v2    # "stackTop":I
    .end local v4    # "sDbl":[D
    .end local v7    # "iCode":[B
    .end local v11    # "op":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    :catchall_18
    move-exception v0

    move v3, v5

    move-object v6, v8

    move-object v2, v12

    move-object v1, v13

    move-object/from16 v18, v30

    move-object/from16 v4, v39

    const/16 v33, 0x0

    move-object v5, v0

    goto/16 :goto_2d

    .line 1906
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .local v4, "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_4e
    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v8, v13

    move-object v13, v14

    move-object v14, v5

    move-object v9, v6

    move v6, v2

    move v5, v3

    move-object/from16 v45, v4

    move-object v4, v1

    move v1, v10

    move-object v10, v12

    move-object v12, v7

    move-object/from16 v7, v45

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v4, "sDbl":[D
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :try_start_2c
    iget-object v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    invoke-static {v13, v2, v3, v5}, Lcom/trendmicro/hippo/InterpretedFunction;->createFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/InterpretedFunction;I)Lcom/trendmicro/hippo/InterpretedFunction;

    move-result-object v2

    .line 1909
    .local v2, "fn":Lcom/trendmicro/hippo/InterpretedFunction;
    iget-object v3, v2, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v3, v3, Lcom/trendmicro/hippo/InterpreterData;->itsFunctionType:I

    if-ne v3, v1, :cond_31

    .line 1910
    add-int/lit8 v1, v6, 0x1

    .end local v6    # "stackTop":I
    .local v1, "stackTop":I
    new-instance v3, Lcom/trendmicro/hippo/ArrowFunction;

    iget-object v6, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    move-object/from16 v29, v4

    .end local v4    # "sDbl":[D
    .local v29, "sDbl":[D
    iget-object v4, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->thisObj:Lcom/trendmicro/hippo/Scriptable;

    invoke-direct {v3, v13, v6, v2, v4}, Lcom/trendmicro/hippo/ArrowFunction;-><init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;)V

    aput-object v3, v14, v1

    move v2, v1

    move v3, v5

    move-object v4, v7

    move-object v6, v9

    move-object v7, v12

    move-object v5, v14

    move-object/from16 v1, v29

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1912
    .end local v1    # "stackTop":I
    .end local v29    # "sDbl":[D
    .restart local v4    # "sDbl":[D
    .restart local v6    # "stackTop":I
    :cond_31
    move-object/from16 v29, v4

    .end local v4    # "sDbl":[D
    .restart local v29    # "sDbl":[D
    add-int/lit8 v1, v6, 0x1

    .end local v6    # "stackTop":I
    .restart local v1    # "stackTop":I
    aput-object v2, v14, v1

    .line 1914
    move v2, v1

    move v3, v5

    move-object v4, v7

    move-object v6, v9

    move-object v7, v12

    move-object v5, v14

    move-object/from16 v1, v29

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1916
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v29    # "sDbl":[D
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .local v2, "stackTop":I
    .restart local v3    # "indexReg":I
    .local v4, "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    :pswitch_4f
    move-object/from16 v29, v1

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object v14, v5

    move-object v9, v6

    move-object v12, v7

    move v6, v2

    move v5, v3

    move-object v7, v4

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v29    # "sDbl":[D
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    iget-object v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    invoke-static {v13, v1, v2, v5}, Lcom/trendmicro/hippo/Interpreter;->initFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/InterpretedFunction;I)V

    .line 1917
    move-object/from16 v18, v10

    move-object v10, v12

    move-object v1, v13

    move-object/from16 v36, v15

    move-object/from16 v3, v29

    move-object/from16 v4, v39

    const/16 v33, 0x0

    move v12, v6

    move-object v6, v8

    move-object v13, v9

    goto/16 :goto_2b

    .line 2130
    .end local v6    # "stackTop":I
    .end local v7    # "iCode":[B
    .end local v11    # "op":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v29    # "sDbl":[D
    .end local v34    # "strings":[Ljava/lang/String;
    :catchall_19
    move-exception v0

    move v3, v5

    move-object v6, v8

    move-object/from16 v18, v10

    move-object v2, v12

    move-object v1, v13

    move-object/from16 v4, v39

    const/16 v33, 0x0

    move-object v5, v0

    goto/16 :goto_2d

    .line 1540
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_50
    move-object/from16 v29, v1

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object v14, v5

    move-object v9, v6

    move-object v12, v7

    move v6, v2

    move v5, v3

    move-object v7, v4

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "indexReg":I
    .local v6, "stackTop":I
    .local v7, "iCode":[B
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stringReg":Ljava/lang/String;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v29    # "sDbl":[D
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    if-eqz v40, :cond_32

    .line 1541
    iget v1, v13, Lcom/trendmicro/hippo/Context;->instructionCount:I

    const/16 v4, 0x64

    add-int/2addr v1, v4

    iput v1, v13, Lcom/trendmicro/hippo/Context;->instructionCount:I
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_19

    goto :goto_15

    .line 1540
    :cond_32
    const/16 v4, 0x64

    .line 1543
    :goto_15
    move-object/from16 v1, p0

    move-object v2, v9

    move-object v3, v14

    move-object/from16 v37, v12

    move-object/from16 p2, v29

    move v12, v4

    .end local v12    # "stringReg":Ljava/lang/String;
    .end local v29    # "sDbl":[D
    .restart local v37    # "stringReg":Ljava/lang/String;
    .local p2, "sDbl":[D
    move-object/from16 v4, p2

    move/from16 v29, v5

    .end local v5    # "indexReg":I
    .local v29, "indexReg":I
    move v5, v6

    move v12, v6

    .end local v6    # "stackTop":I
    .local v12, "stackTop":I
    move-object v6, v7

    move/from16 v18, v11

    move-object/from16 v36, v15

    const/4 v11, 0x0

    move-object v15, v7

    .end local v7    # "iCode":[B
    .end local v11    # "op":I
    .local v15, "iCode":[B
    .local v18, "op":I
    .restart local v36    # "vars":[Ljava/lang/Object;
    move/from16 v7, v29

    :try_start_2d
    invoke-static/range {v1 .. v7}, Lcom/trendmicro/hippo/Interpreter;->doCallSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI[BI)I

    move-result v1

    move v2, v1

    .line 1544
    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    move-object/from16 v1, p2

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move-object v4, v15

    move/from16 v3, v29

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1346
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v18    # "op":I
    .end local v29    # "indexReg":I
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local p2    # "sDbl":[D
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_51
    move-object/from16 p2, v1

    move/from16 v29, v3

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move/from16 v18, v11

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/4 v11, 0x0

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v18    # "op":I
    .restart local v29    # "indexReg":I
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local p2    # "sDbl":[D
    iput-object v10, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 1347
    move-object/from16 v3, p2

    move-object v6, v8

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    move-object v7, v15

    move/from16 v5, v29

    move-object/from16 v10, v37

    move-object/from16 v4, v39

    move-object v13, v9

    goto/16 :goto_29

    .line 1271
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v18    # "op":I
    .end local v29    # "indexReg":I
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local p2    # "sDbl":[D
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .restart local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_52
    move-object/from16 p2, v1

    move/from16 v29, v3

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move/from16 v18, v11

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/4 v11, 0x0

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v18    # "op":I
    .restart local v29    # "indexReg":I
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local p2    # "sDbl":[D
    add-int/lit8 v2, v12, 0x1

    .line 1272
    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    aput-object v8, v14, v2

    .line 1273
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/4 v3, 0x2

    add-int/2addr v1, v3

    int-to-double v3, v1

    move-object/from16 v7, p2

    .end local p2    # "sDbl":[D
    .local v7, "sDbl":[D
    aput-wide v3, v7, v2
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_1a

    .line 1274
    move-object v4, v15

    move/from16 v5, v18

    move/from16 v6, v29

    move-object/from16 v15, v36

    const/16 v18, 0x1

    goto/16 :goto_1a

    .line 2130
    .end local v2    # "stackTop":I
    .end local v7    # "sDbl":[D
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "iCode":[B
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v18    # "op":I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    :catchall_1a
    move-exception v0

    move-object v5, v0

    move-object v6, v8

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    move/from16 v3, v29

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    goto/16 :goto_2d

    .line 1276
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v29    # "indexReg":I
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .restart local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_53
    move/from16 v29, v3

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move/from16 v18, v11

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/4 v11, 0x0

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v18    # "op":I
    .restart local v29    # "indexReg":I
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :try_start_2e
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->emptyStackTop:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    if-ne v12, v1, :cond_33

    .line 1278
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_1b

    move/from16 v6, v29

    .end local v29    # "indexReg":I
    .local v6, "indexReg":I
    add-int v3, v6, v1

    .line 1279
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    :try_start_2f
    aget-object v1, v14, v12

    aput-object v1, v14, v3

    .line 1280
    aget-wide v1, v7, v12

    aput-wide v1, v7, v3
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_1e

    .line 1281
    add-int/lit8 v2, v12, -0x1

    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    goto/16 :goto_5

    .line 1285
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .restart local v12    # "stackTop":I
    .restart local v29    # "indexReg":I
    :cond_33
    move/from16 v6, v29

    .end local v29    # "indexReg":I
    .restart local v6    # "indexReg":I
    :try_start_30
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->emptyStackTop:I

    if-eq v12, v1, :cond_34

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    :cond_34
    move v5, v6

    move-object v3, v7

    move-object v6, v8

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    move-object v7, v15

    move-object/from16 v10, v37

    move-object/from16 v4, v39

    move-object v13, v9

    goto/16 :goto_2b

    .line 2130
    .end local v6    # "indexReg":I
    .end local v7    # "sDbl":[D
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "iCode":[B
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v18    # "op":I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v29    # "indexReg":I
    :catchall_1b
    move-exception v0

    move/from16 v6, v29

    move-object v5, v0

    move v3, v6

    move-object v6, v8

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    .end local v29    # "indexReg":I
    .restart local v6    # "indexReg":I
    goto/16 :goto_2d

    .line 1290
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_54
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move/from16 v18, v11

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/4 v11, 0x0

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v18    # "op":I
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    if-eqz v40, :cond_35

    .line 1291
    invoke-static {v13, v9, v11}, Lcom/trendmicro/hippo/Interpreter;->addInstructionCount(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;I)V

    .line 1293
    :cond_35
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_1f

    add-int v3, v6, v1

    .line 1294
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    :try_start_31
    aget-object v1, v14, v3

    .line 1295
    .local v1, "value":Ljava/lang/Object;
    if-eq v1, v8, :cond_36

    .line 1297
    move-object v2, v1

    .line 1298
    .end local v24    # "throwable":Ljava/lang/Object;
    .local v2, "throwable":Ljava/lang/Object;
    move-object v6, v8

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    move-object/from16 v7, v21

    move-wide/from16 v10, v22

    move-object/from16 v4, v39

    move-object v13, v9

    goto/16 :goto_2e

    .line 1301
    .end local v2    # "throwable":Ljava/lang/Object;
    .restart local v24    # "throwable":Ljava/lang/Object;
    :cond_36
    aget-wide v4, v7, v3

    double-to-int v2, v4

    iput v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 1302
    if-eqz v40, :cond_37

    .line 1303
    iget v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    iput v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pcPrevBranch:I
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_1e

    .line 1165
    .end local v1    # "value":Ljava/lang/Object;
    .end local v18    # "op":I
    :cond_37
    move-object v1, v7

    move-object v6, v9

    move v2, v12

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2025
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .local v2, "stackTop":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_55
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move/from16 v18, v11

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/4 v11, 0x0

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v18    # "op":I
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :try_start_32
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    iput v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pcSourceLineStart:I

    .line 2026
    iget-object v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

    if-eqz v1, :cond_38

    .line 2027
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    invoke-static {v15, v1}, Lcom/trendmicro/hippo/Interpreter;->getIndex([BI)I

    move-result v1

    .line 2028
    .local v1, "line":I
    iget-object v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

    invoke-interface {v2, v13, v1}, Lcom/trendmicro/hippo/debug/DebugFrame;->onLineChange(Lcom/trendmicro/hippo/Context;I)V

    .line 2030
    .end local v1    # "line":I
    :cond_38
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/4 v2, 0x2

    add-int/2addr v1, v2

    iput v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 2031
    move v5, v6

    move-object v3, v7

    move-object v6, v8

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    move-object v7, v15

    move-object/from16 v10, v37

    move-object/from16 v4, v39

    move-object v13, v9

    goto/16 :goto_2b

    .line 1730
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v18    # "op":I
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_56
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move/from16 v18, v11

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/4 v11, 0x0

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v18    # "op":I
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    add-int/lit8 v2, v12, 0x1

    .line 1731
    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    aput-object v8, v14, v2

    .line 1732
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    invoke-static {v15, v1}, Lcom/trendmicro/hippo/Interpreter;->getShort([BI)I

    move-result v1

    int-to-double v3, v1

    aput-wide v3, v7, v2

    .line 1733
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/4 v3, 0x2

    add-int/2addr v1, v3

    iput v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 1734
    move v3, v6

    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1736
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v18    # "op":I
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_57
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move/from16 v18, v11

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/4 v11, 0x0

    move-object v7, v1

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v1, v10

    move-object v10, v12

    move v12, v2

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v18    # "op":I
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    add-int/lit8 v2, v12, 0x1

    .line 1737
    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    aput-object v8, v14, v2

    .line 1738
    iget v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    invoke-static {v15, v3}, Lcom/trendmicro/hippo/Interpreter;->getInt([BI)I

    move-result v3

    int-to-double v3, v3

    aput-wide v3, v7, v2

    .line 1739
    iget v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/2addr v3, v1

    iput v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 1740
    move v3, v6

    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1924
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v18    # "op":I
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_58
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move/from16 v18, v11

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/4 v11, 0x0

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v18    # "op":I
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    add-int/lit8 v2, v12, 0x1

    .line 1925
    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    new-array v1, v6, [I

    aput-object v1, v14, v2

    .line 1926
    add-int/lit8 v2, v2, 0x1

    .line 1927
    new-array v1, v6, [Ljava/lang/Object;

    aput-object v1, v14, v2

    .line 1928
    aput-wide v27, v7, v2

    .line 1929
    move v3, v6

    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1931
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v18    # "op":I
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_59
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move/from16 v18, v11

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/4 v11, 0x0

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v18    # "op":I
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    aget-object v1, v14, v12

    .line 1932
    .local v1, "value":Ljava/lang/Object;
    if-ne v1, v8, :cond_39

    aget-wide v2, v7, v12

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1933
    :cond_39
    add-int/lit8 v2, v12, -0x1

    .line 1934
    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    aget-wide v3, v7, v2

    double-to-int v3, v3

    .line 1935
    .local v3, "i":I
    aget-object v4, v14, v2

    check-cast v4, [Ljava/lang/Object;

    aput-object v1, v4, v3

    .line 1936
    add-int/lit8 v4, v3, 0x1

    int-to-double v4, v4

    aput-wide v4, v7, v2

    .line 1937
    move v3, v6

    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1169
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v18    # "op":I
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .local v3, "indexReg":I
    .restart local v4    # "iCode":[B
    .restart local v5    # "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_5a
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move/from16 v18, v11

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/4 v11, 0x0

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v6, v3

    .line 1960
    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v5    # "stack":[Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v18    # "op":I
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :goto_16
    aget-object v1, v14, v12

    check-cast v1, [Ljava/lang/Object;

    .line 1961
    .local v1, "data":[Ljava/lang/Object;
    add-int/lit8 v2, v12, -0x1

    .line 1962
    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    aget-object v3, v14, v2

    check-cast v3, [I

    .line 1964
    .local v3, "getterSetters":[I
    const/16 v4, 0x43

    move/from16 v5, v18

    .end local v18    # "op":I
    .local v5, "op":I
    if-ne v5, v4, :cond_3a

    .line 1965
    iget-object v4, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v4, v4, Lcom/trendmicro/hippo/InterpreterData;->literalIds:[Ljava/lang/Object;

    aget-object v4, v4, v6

    check-cast v4, [Ljava/lang/Object;

    .line 1966
    .local v4, "ids":[Ljava/lang/Object;
    iget-object v12, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v4, v1, v3, v13, v12}, Lcom/trendmicro/hippo/ScriptRuntime;->newObjectLiteral([Ljava/lang/Object;[Ljava/lang/Object;[ILcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v12

    move-object v4, v12

    .line 1968
    .local v4, "val":Ljava/lang/Object;
    goto :goto_17

    .line 1969
    .end local v4    # "val":Ljava/lang/Object;
    :cond_3a
    const/4 v4, 0x0

    .line 1970
    .local v4, "skipIndexces":[I
    const/16 v12, -0x1f

    if-ne v5, v12, :cond_3b

    .line 1971
    iget-object v12, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v12, v12, Lcom/trendmicro/hippo/InterpreterData;->literalIds:[Ljava/lang/Object;

    aget-object v12, v12, v6

    check-cast v12, [I

    move-object v4, v12

    .line 1973
    :cond_3b
    iget-object v12, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v4, v13, v12}, Lcom/trendmicro/hippo/ScriptRuntime;->newArrayLiteral([Ljava/lang/Object;[ILcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v12

    move-object v4, v12

    .line 1976
    .local v4, "val":Ljava/lang/Object;
    :goto_17
    aput-object v4, v14, v2

    .line 1977
    move v3, v6

    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2033
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .local v3, "indexReg":I
    .local v4, "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_5b
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    const/4 v3, 0x0

    .line 2034
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    move-object v6, v9

    move-object v5, v14

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2036
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_5c
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    const/4 v3, 0x1

    .line 2037
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    move-object v6, v9

    move-object v5, v14

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2039
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_5d
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    const/4 v3, 0x2

    .line 2040
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    move-object v6, v9

    move-object v5, v14

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2042
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_5e
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    const/4 v3, 0x3

    .line 2043
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    move-object v6, v9

    move-object v5, v14

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2045
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_5f
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    const/4 v3, 0x4

    .line 2046
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    move-object v6, v9

    move-object v5, v14

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2048
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_60
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    const/4 v3, 0x5

    .line 2049
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    move-object v6, v9

    move-object v5, v14

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2051
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_61
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    aget-byte v1, v15, v1
    :try_end_32
    .catchall {:try_start_32 .. :try_end_32} :catchall_1f

    and-int/lit16 v3, v1, 0xff

    .line 2052
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    :try_start_33
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I
    :try_end_33
    .catchall {:try_start_33 .. :try_end_33} :catchall_1e

    .line 2053
    move-object v1, v7

    move-object v6, v9

    move v2, v12

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2055
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_62
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :try_start_34
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    invoke-static {v15, v1}, Lcom/trendmicro/hippo/Interpreter;->getIndex([BI)I

    move-result v1
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_1f

    move v3, v1

    .line 2056
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    :try_start_35
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/4 v2, 0x2

    add-int/2addr v1, v2

    iput v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I
    :try_end_35
    .catchall {:try_start_35 .. :try_end_35} :catchall_1e

    .line 2057
    move-object v1, v7

    move-object v6, v9

    move v2, v12

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2059
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_63
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v1, v10

    move v5, v11

    move-object v10, v12

    const/4 v11, 0x0

    move v12, v2

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :try_start_36
    iget v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    invoke-static {v15, v2}, Lcom/trendmicro/hippo/Interpreter;->getInt([BI)I

    move-result v2
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_1f

    move v3, v2

    .line 2060
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    :try_start_37
    iget v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/2addr v2, v1

    iput v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I
    :try_end_37
    .catchall {:try_start_37 .. :try_end_37} :catchall_1e

    .line 2061
    move-object v1, v7

    move-object v6, v9

    move v2, v12

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2063
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_64
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :try_start_38
    aget-object v1, v34, v11

    .line 2064
    .end local v37    # "stringReg":Ljava/lang/String;
    .local v1, "stringReg":Ljava/lang/String;
    move v3, v6

    move-object v6, v9

    move v2, v12

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    move-object/from16 v45, v7

    move-object v7, v1

    move-object/from16 v1, v45

    goto/16 :goto_5

    .line 2066
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_65
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    const/4 v1, 0x1

    aget-object v2, v34, v1

    move-object v1, v2

    .line 2067
    .end local v37    # "stringReg":Ljava/lang/String;
    .local v1, "stringReg":Ljava/lang/String;
    move v3, v6

    move-object v6, v9

    move v2, v12

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    move-object/from16 v45, v7

    move-object v7, v1

    move-object/from16 v1, v45

    goto/16 :goto_5

    .line 2069
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_66
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    const/4 v1, 0x2

    aget-object v2, v34, v1

    move-object v1, v2

    .line 2070
    .end local v37    # "stringReg":Ljava/lang/String;
    .local v1, "stringReg":Ljava/lang/String;
    move v3, v6

    move-object v6, v9

    move v2, v12

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    move-object/from16 v45, v7

    move-object v7, v1

    move-object/from16 v1, v45

    goto/16 :goto_5

    .line 2072
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_67
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    const/4 v1, 0x3

    aget-object v1, v34, v1

    .line 2073
    .end local v37    # "stringReg":Ljava/lang/String;
    .local v1, "stringReg":Ljava/lang/String;
    move v3, v6

    move-object v6, v9

    move v2, v12

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    const/4 v10, 0x1

    move-object v13, v8

    move-object/from16 v8, v39

    move-object/from16 v45, v7

    move-object v7, v1

    move-object/from16 v1, v45

    goto/16 :goto_5

    .line 2075
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_68
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    aget-byte v1, v15, v1

    and-int/lit16 v1, v1, 0xff

    aget-object v1, v34, v1
    :try_end_38
    .catchall {:try_start_38 .. :try_end_38} :catchall_1f

    .line 2076
    .end local v37    # "stringReg":Ljava/lang/String;
    .local v1, "stringReg":Ljava/lang/String;
    :try_start_39
    iget v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/16 v18, 0x1

    add-int/lit8 v2, v2, 0x1

    iput v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I
    :try_end_39
    .catchall {:try_start_39 .. :try_end_39} :catchall_1c

    .line 2077
    move v3, v6

    move-object v6, v9

    move v2, v12

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    move/from16 v10, v18

    move-object v13, v8

    move-object/from16 v8, v39

    move-object/from16 v45, v7

    move-object v7, v1

    move-object/from16 v1, v45

    goto/16 :goto_5

    .line 2079
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_69
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/16 v18, 0x1

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :try_start_3a
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    invoke-static {v15, v1}, Lcom/trendmicro/hippo/Interpreter;->getIndex([BI)I

    move-result v1

    aget-object v1, v34, v1
    :try_end_3a
    .catchall {:try_start_3a .. :try_end_3a} :catchall_1f

    .line 2080
    .end local v37    # "stringReg":Ljava/lang/String;
    .local v1, "stringReg":Ljava/lang/String;
    :try_start_3b
    iget v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/4 v3, 0x2

    add-int/2addr v2, v3

    iput v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I
    :try_end_3b
    .catchall {:try_start_3b .. :try_end_3b} :catchall_1c

    .line 2081
    move v3, v6

    move-object v6, v9

    move v2, v12

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move/from16 v9, v40

    move-object v12, v10

    move-object v14, v13

    move/from16 v10, v18

    move-object v13, v8

    move-object/from16 v8, v39

    move-object/from16 v45, v7

    move-object v7, v1

    move-object/from16 v1, v45

    goto/16 :goto_5

    .line 2130
    .end local v5    # "op":I
    .end local v7    # "sDbl":[D
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "iCode":[B
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    :catchall_1c
    move-exception v0

    move-object v5, v0

    move-object v2, v1

    move v3, v6

    move-object v6, v8

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    move-object/from16 v4, v39

    goto/16 :goto_2d

    .line 2083
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_6a
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/16 v18, 0x1

    move-object v7, v1

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v1, v10

    move v5, v11

    move-object v10, v12

    const/4 v11, 0x0

    move v12, v2

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :try_start_3c
    iget v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    invoke-static {v15, v2}, Lcom/trendmicro/hippo/Interpreter;->getInt([BI)I

    move-result v2

    aget-object v2, v34, v2
    :try_end_3c
    .catchall {:try_start_3c .. :try_end_3c} :catchall_1f

    .line 2084
    .end local v37    # "stringReg":Ljava/lang/String;
    .local v2, "stringReg":Ljava/lang/String;
    :try_start_3d
    iget v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/2addr v3, v1

    iput v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I
    :try_end_3d
    .catchall {:try_start_3d .. :try_end_3d} :catchall_1d

    .line 2085
    move v3, v6

    move-object v1, v7

    move-object v6, v9

    move-object v5, v14

    move-object v4, v15

    move-object/from16 v15, v36

    move/from16 v9, v40

    move-object v7, v2

    move v2, v12

    move-object v14, v13

    move-object v13, v8

    move-object v12, v10

    move/from16 v10, v18

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2130
    .end local v5    # "op":I
    .end local v7    # "sDbl":[D
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "iCode":[B
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    :catchall_1d
    move-exception v0

    move-object v5, v0

    move v3, v6

    move-object v6, v8

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    move-object/from16 v4, v39

    goto/16 :goto_2d

    .line 1769
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .local v2, "stackTop":I
    .restart local v3    # "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_6b
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    move-object/from16 v36, v15

    const/16 v18, 0x1

    move-object v7, v1

    move v12, v2

    move-object v15, v4

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v4    # "iCode":[B
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "iCode":[B
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :try_start_3e
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    aget-byte v1, v15, v1
    :try_end_3e
    .catchall {:try_start_3e .. :try_end_3e} :catchall_1f

    move v3, v1

    .line 1772
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    :goto_18
    move-object/from16 v25, v9

    move-object/from16 v26, v14

    move-object/from16 v27, v7

    move/from16 v28, v12

    move-object v4, v15

    move-object/from16 v15, v36

    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v4    # "iCode":[B
    .local v15, "vars":[Ljava/lang/Object;
    move-object/from16 v29, v15

    move-object/from16 v30, v16

    move/from16 v31, v3

    :try_start_3f
    invoke-static/range {v25 .. v31}, Lcom/trendmicro/hippo/Interpreter;->doGetVar(Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[DI)I

    move-result v1
    :try_end_3f
    .catchall {:try_start_3f .. :try_end_3f} :catchall_1e

    move v2, v1

    .line 1773
    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move/from16 v10, v18

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2130
    .end local v2    # "stackTop":I
    .end local v4    # "iCode":[B
    .end local v5    # "op":I
    .end local v7    # "sDbl":[D
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    :catchall_1e
    move-exception v0

    move-object v5, v0

    move-object v6, v8

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    goto/16 :goto_2d

    .line 1762
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_6c
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    const/16 v18, 0x1

    move-object v7, v1

    move v12, v2

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :try_start_40
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    aget-byte v1, v4, v1
    :try_end_40
    .catchall {:try_start_40 .. :try_end_40} :catchall_1f

    move v3, v1

    .line 1765
    .end local v6    # "indexReg":I
    .restart local v3    # "indexReg":I
    :goto_19
    move-object/from16 v25, v9

    move-object/from16 v26, v14

    move-object/from16 v27, v7

    move/from16 v28, v12

    move-object/from16 v29, v15

    move-object/from16 v30, v16

    move-object/from16 v31, v17

    move/from16 v32, v3

    :try_start_41
    invoke-static/range {v25 .. v32}, Lcom/trendmicro/hippo/Interpreter;->doSetVar(Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I

    move-result v1
    :try_end_41
    .catchall {:try_start_41 .. :try_end_41} :catchall_1e

    move v2, v1

    .line 1767
    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move/from16 v10, v18

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1805
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    :pswitch_6d
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    const/16 v18, 0x1

    move-object v7, v1

    move v12, v2

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    add-int/lit8 v2, v12, 0x1

    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    :try_start_42
    aput-object v10, v14, v2

    .line 1806
    move v3, v6

    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move/from16 v10, v18

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1780
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    :pswitch_6e
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    const/16 v18, 0x1

    move-object v7, v1

    move v12, v2

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    add-int/lit8 v2, v12, 0x1

    .line 1781
    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    aput-object v8, v14, v2

    .line 1782
    aput-wide v27, v7, v2

    .line 1783
    move v3, v6

    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move/from16 v10, v18

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1785
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    :pswitch_6f
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    const/16 v18, 0x1

    move-object v7, v1

    move v12, v2

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    add-int/lit8 v2, v12, 0x1

    .line 1786
    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    aput-object v8, v14, v2

    .line 1787
    const-wide/high16 v25, 0x3ff0000000000000L    # 1.0

    aput-wide v25, v7, v2

    .line 1788
    move v3, v6

    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move/from16 v10, v18

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1980
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v3    # "indexReg":I
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    :pswitch_70
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    const/16 v18, 0x1

    move-object v7, v1

    move v12, v2

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    aget-object v1, v14, v12

    .line 1981
    .local v1, "lhs":Ljava/lang/Object;
    if-ne v1, v8, :cond_3c

    aget-wide v2, v7, v12

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    move-object v1, v2

    .line 1982
    :cond_3c
    add-int/lit8 v2, v12, -0x1

    .line 1983
    .end local v12    # "stackTop":I
    .restart local v2    # "stackTop":I
    iget-object v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->enterDotQuery(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    iput-object v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 1984
    move v3, v6

    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move/from16 v10, v18

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 1987
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v3    # "indexReg":I
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    :pswitch_71
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    const/16 v18, 0x1

    move-object v7, v1

    move v12, v2

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    invoke-static {v9, v12}, Lcom/trendmicro/hippo/Interpreter;->stack_boolean(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)Z

    move-result v1

    .line 1988
    .local v1, "valBln":Z
    iget-object v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->updateDotQuery(ZLcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 1989
    .local v2, "x":Ljava/lang/Object;
    if-eqz v2, :cond_3d

    .line 1990
    aput-object v2, v14, v12

    .line 1991
    iget-object v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->leaveDotQuery(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    iput-object v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 1992
    iget v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/16 v25, 0x2

    add-int/lit8 v3, v3, 0x2

    iput v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 1993
    move v5, v6

    move-object v3, v7

    move-object v6, v8

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    move-object/from16 v36, v15

    move-object/from16 v10, v37

    move-object v7, v4

    move-object v13, v9

    move-object/from16 v4, v39

    goto/16 :goto_2b

    .line 1996
    :cond_3d
    add-int/lit8 v3, v12, -0x1

    .line 1997
    .end local v12    # "stackTop":I
    .local v3, "stackTop":I
    move v2, v3

    .line 2096
    .end local v1    # "valBln":Z
    .end local v3    # "stackTop":I
    .local v2, "stackTop":I
    :goto_1a
    if-eqz v40, :cond_3e

    .line 2097
    const/4 v3, 0x2

    invoke-static {v13, v9, v3}, Lcom/trendmicro/hippo/Interpreter;->addInstructionCount(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;I)V

    goto :goto_1b

    .line 2096
    :cond_3e
    const/4 v3, 0x2

    .line 2099
    :goto_1b
    iget v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    invoke-static {v4, v1}, Lcom/trendmicro/hippo/Interpreter;->getShort([BI)I

    move-result v1

    .line 2100
    .local v1, "offset":I
    if-eqz v1, :cond_3f

    .line 2102
    iget v12, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/lit8 v25, v1, -0x1

    add-int v12, v12, v25

    iput v12, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    goto :goto_1c

    .line 2104
    :cond_3f
    iget-object v12, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v12, v12, Lcom/trendmicro/hippo/InterpreterData;->longJumps:Lcom/trendmicro/hippo/UintMap;

    iget v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 2105
    invoke-virtual {v12, v3}, Lcom/trendmicro/hippo/UintMap;->getExistingInt(I)I

    move-result v3

    iput v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 2107
    :goto_1c
    if-eqz v40, :cond_40

    .line 2108
    iget v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    iput v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pcPrevBranch:I

    .line 1165
    .end local v1    # "offset":I
    .end local v5    # "op":I
    :cond_40
    move v3, v6

    move-object v1, v7

    move-object v6, v9

    move-object v12, v10

    move-object v5, v14

    move/from16 v10, v18

    move-object/from16 v7, v37

    move/from16 v9, v40

    move-object v14, v13

    move-object v13, v8

    move-object/from16 v8, v39

    goto/16 :goto_5

    .line 2130
    .end local v2    # "stackTop":I
    .end local v4    # "iCode":[B
    .end local v7    # "sDbl":[D
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    :catchall_1f
    move-exception v0

    move-object v5, v0

    move v3, v6

    move-object v6, v8

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    goto/16 :goto_2d

    .line 1169
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .local v1, "sDbl":[D
    .restart local v2    # "stackTop":I
    .local v3, "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .restart local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_72
    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object v10, v12

    move-object v8, v13

    move-object v13, v14

    const/16 v18, 0x1

    move-object v7, v1

    move v12, v2

    move-object v14, v5

    move-object v9, v6

    move v5, v11

    const/4 v11, 0x0

    move v6, v3

    .line 1549
    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v3    # "indexReg":I
    .end local v11    # "op":I
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .local v5, "op":I
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local v12, "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :goto_1d
    if-eqz v40, :cond_41

    .line 1550
    iget v1, v13, Lcom/trendmicro/hippo/Context;->instructionCount:I

    const/16 v2, 0x64

    add-int/2addr v1, v2

    iput v1, v13, Lcom/trendmicro/hippo/Context;->instructionCount:I
    :try_end_42
    .catchall {:try_start_42 .. :try_end_42} :catchall_1f

    .line 1554
    :cond_41
    add-int/lit8 v3, v6, 0x1

    sub-int/2addr v12, v3

    .line 1558
    :try_start_43
    aget-object v1, v14, v12

    check-cast v1, Lcom/trendmicro/hippo/Callable;

    move-object v3, v1

    .line 1559
    .local v3, "fun":Lcom/trendmicro/hippo/Callable;
    add-int/lit8 v1, v12, 0x1

    aget-object v1, v14, v1

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;
    :try_end_43
    .catchall {:try_start_43 .. :try_end_43} :catchall_30

    move-object v2, v1

    .line 1560
    .local v2, "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    const/16 v1, 0x47

    if-ne v5, v1, :cond_42

    .line 1561
    add-int/lit8 v1, v12, 0x2

    :try_start_44
    invoke-static {v14, v7, v1, v6}, Lcom/trendmicro/hippo/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v1

    .line 1563
    .local v1, "outArgs":[Ljava/lang/Object;
    invoke-static {v3, v2, v1, v13}, Lcom/trendmicro/hippo/ScriptRuntime;->callRef(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Ref;

    move-result-object v25

    aput-object v25, v14, v12
    :try_end_44
    .catchall {:try_start_44 .. :try_end_44} :catchall_1f

    .line 1565
    move-object/from16 v42, v4

    move v5, v6

    move-object v3, v7

    move-object/from16 v43, v8

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    move-object/from16 v36, v15

    move-object v13, v9

    goto/16 :goto_25

    .line 1567
    .end local v1    # "outArgs":[Ljava/lang/Object;
    :cond_42
    :try_start_45
    iget-object v1, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;
    :try_end_45
    .catchall {:try_start_45 .. :try_end_45} :catchall_30

    .line 1568
    .local v1, "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    :try_start_46
    iget-boolean v11, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->useActivation:Z
    :try_end_46
    .catchall {:try_start_46 .. :try_end_46} :catchall_2f

    if-eqz v11, :cond_43

    .line 1569
    :try_start_47
    iget-object v11, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v11}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v11
    :try_end_47
    .catchall {:try_start_47 .. :try_end_47} :catchall_20

    move-object v1, v11

    goto :goto_1e

    .line 2130
    .end local v1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .end local v2    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v3    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v4    # "iCode":[B
    .end local v5    # "op":I
    .end local v7    # "sDbl":[D
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    :catchall_20
    move-exception v0

    move-object v5, v0

    move v3, v6

    move-object v6, v8

    move-object/from16 v18, v10

    move-object v1, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    const/16 v33, 0x0

    goto/16 :goto_2d

    .line 1568
    .restart local v1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .restart local v2    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local v3    # "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v4    # "iCode":[B
    .restart local v5    # "op":I
    .restart local v7    # "sDbl":[D
    .restart local v12    # "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :cond_43
    move-object v11, v1

    .line 1571
    .end local v1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .local v11, "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    :goto_1e
    :try_start_48
    instance-of v1, v3, Lcom/trendmicro/hippo/InterpretedFunction;
    :try_end_48
    .catchall {:try_start_48 .. :try_end_48} :catchall_2f

    if-eqz v1, :cond_47

    .line 1572
    :try_start_49
    move-object v1, v3

    check-cast v1, Lcom/trendmicro/hippo/InterpretedFunction;

    .line 1573
    .local v1, "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    move-object/from16 p1, v2

    .end local v2    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .local p1, "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    iget-object v2, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    iget-object v2, v2, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    move-object/from16 p2, v3

    .end local v3    # "fun":Lcom/trendmicro/hippo/Callable;
    .local p2, "fun":Lcom/trendmicro/hippo/Callable;
    iget-object v3, v1, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;
    :try_end_49
    .catchall {:try_start_49 .. :try_end_49} :catchall_22

    if-ne v2, v3, :cond_46

    .line 1574
    move-object v2, v9

    .line 1575
    .local v2, "callParentFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    const/16 v3, -0x37

    if-ne v5, v3, :cond_44

    .line 1591
    :try_start_4a
    iget-object v3, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-object v2, v3

    .line 1594
    const/4 v3, 0x0

    invoke-static {v13, v9, v3}, Lcom/trendmicro/hippo/Interpreter;->exitFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;)V
    :try_end_4a
    .catchall {:try_start_4a .. :try_end_4a} :catchall_20

    move-object/from16 v27, v2

    goto :goto_1f

    .line 1575
    :cond_44
    const/4 v3, 0x0

    move-object/from16 v27, v2

    .line 1596
    .end local v2    # "callParentFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v27, "callParentFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :goto_1f
    add-int/lit8 v28, v12, 0x2

    move-object/from16 v29, v1

    .end local v1    # "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    .local v29, "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    move-object/from16 v1, p0

    move-object/from16 v30, p1

    .end local p1    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .local v30, "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    move-object v2, v11

    move-object/from16 p1, v11

    move-object/from16 v36, v15

    const/16 v11, -0x37

    const/16 v26, 0x2

    move-object/from16 v15, p2

    .end local v11    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .end local p2    # "fun":Lcom/trendmicro/hippo/Callable;
    .local v15, "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .local p1, "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    move-object/from16 v3, v30

    move-object/from16 v42, v4

    .end local v4    # "iCode":[B
    .local v42, "iCode":[B
    move-object v4, v14

    move v11, v5

    .end local v5    # "op":I
    .local v11, "op":I
    move-object v5, v7

    move/from16 p2, v6

    .end local v6    # "indexReg":I
    .local p2, "indexReg":I
    move/from16 v6, v28

    move-object v13, v7

    .end local v7    # "sDbl":[D
    .local v13, "sDbl":[D
    move/from16 v7, p2

    move-object/from16 v43, v8

    .end local v8    # "DBL_MRK":Ljava/lang/Object;
    .local v43, "DBL_MRK":Ljava/lang/Object;
    move-object/from16 v8, v29

    move-object/from16 v26, v13

    move-object v13, v9

    .end local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v26, "sDbl":[D
    move-object/from16 v9, v27

    :try_start_4b
    invoke-static/range {v1 .. v9}, Lcom/trendmicro/hippo/Interpreter;->initFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;[DIILcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/Interpreter$CallFrame;)Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object v1

    .line 1598
    .local v1, "calleeFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    const/16 v2, -0x37

    if-eq v11, v2, :cond_45

    .line 1599
    iput v12, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    .line 1600
    iput v11, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedCallOp:I
    :try_end_4b
    .catchall {:try_start_4b .. :try_end_4b} :catchall_21

    .line 1602
    :cond_45
    move-object v6, v1

    .line 1603
    .end local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    move-object/from16 v14, p0

    move/from16 v3, p2

    move-object v12, v10

    move/from16 v10, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v37

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v13, v43

    goto/16 :goto_3

    .line 2130
    .end local v1    # "calleeFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v11    # "op":I
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v26    # "sDbl":[D
    .end local v27    # "callParentFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v29    # "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    .end local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    .end local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .restart local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :catchall_21
    move-exception v0

    move-object/from16 v1, p0

    move/from16 v3, p2

    move-object v5, v0

    move-object/from16 v18, v10

    move-object v9, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    const/16 v33, 0x0

    goto/16 :goto_2d

    .line 1573
    .end local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v43    # "DBL_MRK":Ljava/lang/Object;
    .local v1, "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    .restart local v4    # "iCode":[B
    .restart local v5    # "op":I
    .local v6, "indexReg":I
    .restart local v7    # "sDbl":[D
    .restart local v8    # "DBL_MRK":Ljava/lang/Object;
    .restart local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v11, "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .restart local v12    # "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    .local p1, "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .local p2, "fun":Lcom/trendmicro/hippo/Callable;
    :cond_46
    move-object/from16 v30, p1

    move-object/from16 v29, v1

    move-object/from16 v42, v4

    move-object/from16 v26, v7

    move-object/from16 v43, v8

    move-object v13, v9

    move-object/from16 p1, v11

    move-object/from16 v36, v15

    move-object/from16 v15, p2

    move v11, v5

    move/from16 p2, v6

    .end local v1    # "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    .end local v4    # "iCode":[B
    .end local v5    # "op":I
    .end local v6    # "indexReg":I
    .end local v7    # "sDbl":[D
    .end local v8    # "DBL_MRK":Ljava/lang/Object;
    .end local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v11, "op":I
    .restart local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v15, "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v26    # "sDbl":[D
    .restart local v29    # "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    .restart local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v42    # "iCode":[B
    .restart local v43    # "DBL_MRK":Ljava/lang/Object;
    .local p1, "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .local p2, "indexReg":I
    goto :goto_20

    .line 2130
    .end local v11    # "op":I
    .end local v12    # "stackTop":I
    .end local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v26    # "sDbl":[D
    .end local v29    # "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    .end local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    .end local v43    # "DBL_MRK":Ljava/lang/Object;
    .end local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .end local p2    # "indexReg":I
    .restart local v6    # "indexReg":I
    .restart local v8    # "DBL_MRK":Ljava/lang/Object;
    .restart local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :catchall_22
    move-exception v0

    move/from16 p2, v6

    move-object v13, v9

    move-object/from16 v1, p0

    move/from16 v3, p2

    move-object v5, v0

    move-object v6, v8

    move-object/from16 v18, v10

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    const/16 v33, 0x0

    .end local v6    # "indexReg":I
    .end local v8    # "DBL_MRK":Ljava/lang/Object;
    .end local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v43    # "DBL_MRK":Ljava/lang/Object;
    .restart local p2    # "indexReg":I
    goto/16 :goto_2d

    .line 1571
    .end local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v43    # "DBL_MRK":Ljava/lang/Object;
    .end local p2    # "indexReg":I
    .local v2, "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local v3    # "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v4    # "iCode":[B
    .restart local v5    # "op":I
    .restart local v6    # "indexReg":I
    .restart local v7    # "sDbl":[D
    .restart local v8    # "DBL_MRK":Ljava/lang/Object;
    .restart local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v11, "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .restart local v12    # "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :cond_47
    move-object/from16 v30, v2

    move-object/from16 v42, v4

    move/from16 p2, v6

    move-object/from16 v26, v7

    move-object/from16 v43, v8

    move-object v13, v9

    move-object/from16 p1, v11

    move-object/from16 v36, v15

    move-object v15, v3

    move v11, v5

    .line 1607
    .end local v2    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v3    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v4    # "iCode":[B
    .end local v5    # "op":I
    .end local v6    # "indexReg":I
    .end local v7    # "sDbl":[D
    .end local v8    # "DBL_MRK":Ljava/lang/Object;
    .end local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v11, "op":I
    .restart local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v15, "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v26    # "sDbl":[D
    .restart local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v42    # "iCode":[B
    .restart local v43    # "DBL_MRK":Ljava/lang/Object;
    .restart local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .restart local p2    # "indexReg":I
    :goto_20
    :try_start_4c
    instance-of v1, v15, Lcom/trendmicro/hippo/NativeContinuation;
    :try_end_4c
    .catchall {:try_start_4c .. :try_end_4c} :catchall_2e

    if-eqz v1, :cond_49

    .line 1610
    :try_start_4d
    new-instance v1, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;

    move-object v2, v15

    check-cast v2, Lcom/trendmicro/hippo/NativeContinuation;

    invoke-direct {v1, v2, v13}, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;-><init>(Lcom/trendmicro/hippo/NativeContinuation;Lcom/trendmicro/hippo/Interpreter$CallFrame;)V
    :try_end_4d
    .catchall {:try_start_4d .. :try_end_4d} :catchall_24

    .line 1614
    .local v1, "cjump":Lcom/trendmicro/hippo/Interpreter$ContinuationJump;
    move/from16 v8, p2

    .end local p2    # "indexReg":I
    .local v8, "indexReg":I
    if-nez v8, :cond_48

    .line 1615
    :try_start_4e
    iput-object v10, v1, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    goto :goto_21

    .line 1617
    :cond_48
    add-int/lit8 v2, v12, 0x2

    aget-object v2, v14, v2

    iput-object v2, v1, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    .line 1618
    add-int/lit8 v2, v12, 0x2

    aget-wide v2, v26, v2

    iput-wide v2, v1, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->resultDbl:D
    :try_end_4e
    .catchall {:try_start_4e .. :try_end_4e} :catchall_23

    .line 1622
    :goto_21
    move-object v2, v1

    .line 1623
    .end local v24    # "throwable":Ljava/lang/Object;
    .local v2, "throwable":Ljava/lang/Object;
    move-object/from16 v1, p0

    move v3, v8

    move-object/from16 v18, v10

    move-object/from16 v7, v21

    move-wide/from16 v10, v22

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    const/16 v33, 0x0

    goto/16 :goto_2e

    .line 2130
    .end local v1    # "cjump":Lcom/trendmicro/hippo/Interpreter$ContinuationJump;
    .end local v2    # "throwable":Ljava/lang/Object;
    .end local v11    # "op":I
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v26    # "sDbl":[D
    .end local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    .end local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .restart local v24    # "throwable":Ljava/lang/Object;
    :catchall_23
    move-exception v0

    move-object/from16 v1, p0

    move-object v5, v0

    move v3, v8

    move-object/from16 v18, v10

    move-object v9, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    const/16 v33, 0x0

    goto/16 :goto_2d

    .end local v8    # "indexReg":I
    .restart local p2    # "indexReg":I
    :catchall_24
    move-exception v0

    move/from16 v8, p2

    move-object/from16 v1, p0

    move-object v5, v0

    move v3, v8

    move-object/from16 v18, v10

    move-object v9, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    const/16 v33, 0x0

    .end local p2    # "indexReg":I
    .restart local v8    # "indexReg":I
    goto/16 :goto_2d

    .line 1626
    .end local v8    # "indexReg":I
    .restart local v11    # "op":I
    .restart local v12    # "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v15    # "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v26    # "sDbl":[D
    .restart local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local v34    # "strings":[Ljava/lang/String;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v42    # "iCode":[B
    .restart local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .restart local p2    # "indexReg":I
    :cond_49
    move/from16 v8, p2

    .end local p2    # "indexReg":I
    .restart local v8    # "indexReg":I
    :try_start_4f
    instance-of v1, v15, Lcom/trendmicro/hippo/IdFunctionObject;
    :try_end_4f
    .catchall {:try_start_4f .. :try_end_4f} :catchall_2d

    if-eqz v1, :cond_4e

    .line 1627
    :try_start_50
    move-object v9, v15

    check-cast v9, Lcom/trendmicro/hippo/IdFunctionObject;

    .line 1628
    .local v9, "ifun":Lcom/trendmicro/hippo/IdFunctionObject;
    invoke-static {v9}, Lcom/trendmicro/hippo/NativeContinuation;->isContinuationConstructor(Lcom/trendmicro/hippo/IdFunctionObject;)Z

    move-result v1
    :try_end_50
    .catchall {:try_start_50 .. :try_end_50} :catchall_28

    if-eqz v1, :cond_4a

    .line 1629
    :try_start_51
    iget-object v1, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget-object v2, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :try_end_51
    .catchall {:try_start_51 .. :try_end_51} :catchall_23

    const/4 v5, 0x0

    move-object/from16 v7, p0

    move-object/from16 v6, v26

    .end local v26    # "sDbl":[D
    .local v6, "sDbl":[D
    :try_start_52
    invoke-static {v7, v2, v5}, Lcom/trendmicro/hippo/Interpreter;->captureContinuation(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Z)Lcom/trendmicro/hippo/NativeContinuation;

    move-result-object v2

    aput-object v2, v1, v12
    :try_end_52
    .catchall {:try_start_52 .. :try_end_52} :catchall_25

    .line 1631
    move/from16 v33, v5

    move-object v3, v6

    move-object v1, v7

    move v5, v8

    move-object/from16 v18, v10

    goto/16 :goto_25

    .line 2130
    .end local v6    # "sDbl":[D
    .end local v9    # "ifun":Lcom/trendmicro/hippo/IdFunctionObject;
    .end local v11    # "op":I
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    .end local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    :catchall_25
    move-exception v0

    move/from16 v33, v5

    move-object v1, v7

    move v3, v8

    move-object/from16 v18, v10

    move-object v9, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    move-object v5, v0

    goto/16 :goto_2d

    .line 1635
    .restart local v9    # "ifun":Lcom/trendmicro/hippo/IdFunctionObject;
    .restart local v11    # "op":I
    .restart local v12    # "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v15    # "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v26    # "sDbl":[D
    .restart local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local v34    # "strings":[Ljava/lang/String;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v42    # "iCode":[B
    .restart local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    :cond_4a
    const/4 v5, 0x0

    move-object/from16 v7, p0

    move-object/from16 v6, v26

    .end local v26    # "sDbl":[D
    .restart local v6    # "sDbl":[D
    :try_start_53
    invoke-static {v9}, Lcom/trendmicro/hippo/BaseFunction;->isApplyOrCall(Lcom/trendmicro/hippo/IdFunctionObject;)Z

    move-result v1

    if-eqz v1, :cond_4d

    .line 1636
    invoke-static/range {v30 .. v30}, Lcom/trendmicro/hippo/ScriptRuntime;->getCallable(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v1

    move-object v4, v1

    .line 1637
    .local v4, "applyCallable":Lcom/trendmicro/hippo/Callable;
    nop

    instance-of v1, v4, Lcom/trendmicro/hippo/InterpretedFunction;

    if-eqz v1, :cond_4c

    .line 1638
    move-object v1, v4

    check-cast v1, Lcom/trendmicro/hippo/InterpretedFunction;

    move-object v3, v1

    .line 1639
    .local v3, "iApplyCallable":Lcom/trendmicro/hippo/InterpretedFunction;
    iget-object v1, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    iget-object v2, v3, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;
    :try_end_53
    .catchall {:try_start_53 .. :try_end_53} :catchall_27

    if-ne v1, v2, :cond_4b

    .line 1640
    move-object/from16 v1, p0

    move-object v2, v13

    move-object/from16 v25, v3

    .end local v3    # "iApplyCallable":Lcom/trendmicro/hippo/InterpretedFunction;
    .local v25, "iApplyCallable":Lcom/trendmicro/hippo/InterpretedFunction;
    move v3, v8

    move-object/from16 v26, v4

    .end local v4    # "applyCallable":Lcom/trendmicro/hippo/Callable;
    .local v26, "applyCallable":Lcom/trendmicro/hippo/Callable;
    move-object v4, v14

    move/from16 v27, v5

    move-object v5, v6

    move-object/from16 p2, v6

    .end local v6    # "sDbl":[D
    .local p2, "sDbl":[D
    move v6, v12

    move v7, v11

    move/from16 v29, v8

    .end local v8    # "indexReg":I
    .local v29, "indexReg":I
    move-object/from16 v8, p1

    move-object/from16 v18, v10

    .end local v10    # "undefined":Ljava/lang/Object;
    .local v18, "undefined":Ljava/lang/Object;
    move-object/from16 v10, v25

    :try_start_54
    invoke-static/range {v1 .. v10}, Lcom/trendmicro/hippo/Interpreter;->initFrameForApplyOrCall(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;I[Ljava/lang/Object;[DIILcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/InterpretedFunction;)Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object v1
    :try_end_54
    .catchall {:try_start_54 .. :try_end_54} :catchall_26

    move-object v6, v1

    .line 1643
    .end local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    move-object/from16 v14, p0

    move-object/from16 v12, v18

    move-object/from16 v1, v24

    move/from16 v3, v29

    move-object/from16 v2, v37

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v13, v43

    const/4 v10, 0x1

    goto/16 :goto_3

    .line 2130
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v9    # "ifun":Lcom/trendmicro/hippo/IdFunctionObject;
    .end local v11    # "op":I
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v25    # "iApplyCallable":Lcom/trendmicro/hippo/InterpretedFunction;
    .end local v26    # "applyCallable":Lcom/trendmicro/hippo/Callable;
    .end local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    .end local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .end local p2    # "sDbl":[D
    .restart local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :catchall_26
    move-exception v0

    move-object/from16 v1, p0

    move-object v5, v0

    move-object v9, v13

    move/from16 v33, v27

    move/from16 v3, v29

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    goto/16 :goto_2d

    .line 1639
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v29    # "indexReg":I
    .restart local v3    # "iApplyCallable":Lcom/trendmicro/hippo/InterpretedFunction;
    .restart local v4    # "applyCallable":Lcom/trendmicro/hippo/Callable;
    .local v6, "sDbl":[D
    .restart local v8    # "indexReg":I
    .restart local v9    # "ifun":Lcom/trendmicro/hippo/IdFunctionObject;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .restart local v11    # "op":I
    .restart local v12    # "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v15    # "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local v34    # "strings":[Ljava/lang/String;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v42    # "iCode":[B
    .restart local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    :cond_4b
    move-object/from16 v25, v3

    move-object/from16 v26, v4

    move/from16 v27, v5

    move-object/from16 p2, v6

    move/from16 v29, v8

    move-object/from16 v18, v10

    .end local v3    # "iApplyCallable":Lcom/trendmicro/hippo/InterpretedFunction;
    .end local v4    # "applyCallable":Lcom/trendmicro/hippo/Callable;
    .end local v6    # "sDbl":[D
    .end local v8    # "indexReg":I
    .end local v10    # "undefined":Ljava/lang/Object;
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v25    # "iApplyCallable":Lcom/trendmicro/hippo/InterpretedFunction;
    .restart local v26    # "applyCallable":Lcom/trendmicro/hippo/Callable;
    .restart local v29    # "indexReg":I
    .restart local p2    # "sDbl":[D
    goto :goto_23

    .line 1637
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v25    # "iApplyCallable":Lcom/trendmicro/hippo/InterpretedFunction;
    .end local v26    # "applyCallable":Lcom/trendmicro/hippo/Callable;
    .end local v29    # "indexReg":I
    .end local p2    # "sDbl":[D
    .restart local v4    # "applyCallable":Lcom/trendmicro/hippo/Callable;
    .restart local v6    # "sDbl":[D
    .restart local v8    # "indexReg":I
    .restart local v10    # "undefined":Ljava/lang/Object;
    :cond_4c
    move-object/from16 v26, v4

    move/from16 v27, v5

    move-object/from16 p2, v6

    move/from16 v29, v8

    move-object/from16 v18, v10

    .end local v4    # "applyCallable":Lcom/trendmicro/hippo/Callable;
    .end local v6    # "sDbl":[D
    .end local v8    # "indexReg":I
    .end local v10    # "undefined":Ljava/lang/Object;
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v26    # "applyCallable":Lcom/trendmicro/hippo/Callable;
    .restart local v29    # "indexReg":I
    .restart local p2    # "sDbl":[D
    goto :goto_23

    .line 1635
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v26    # "applyCallable":Lcom/trendmicro/hippo/Callable;
    .end local v29    # "indexReg":I
    .end local p2    # "sDbl":[D
    .restart local v6    # "sDbl":[D
    .restart local v8    # "indexReg":I
    .restart local v10    # "undefined":Ljava/lang/Object;
    :cond_4d
    move/from16 v27, v5

    move-object/from16 p2, v6

    move/from16 v29, v8

    move-object/from16 v18, v10

    .end local v6    # "sDbl":[D
    .end local v8    # "indexReg":I
    .end local v10    # "undefined":Ljava/lang/Object;
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v29    # "indexReg":I
    .restart local p2    # "sDbl":[D
    goto :goto_23

    .line 2130
    .end local v9    # "ifun":Lcom/trendmicro/hippo/IdFunctionObject;
    .end local v11    # "op":I
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v29    # "indexReg":I
    .end local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    .end local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .end local p2    # "sDbl":[D
    .restart local v8    # "indexReg":I
    .restart local v10    # "undefined":Ljava/lang/Object;
    :catchall_27
    move-exception v0

    move/from16 v29, v8

    move-object/from16 v18, v10

    move-object/from16 v1, p0

    move/from16 v33, v5

    move-object v9, v13

    move/from16 v3, v29

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    move-object v5, v0

    goto :goto_22

    :catchall_28
    move-exception v0

    move/from16 v29, v8

    move-object/from16 v18, v10

    move-object/from16 v1, p0

    move-object v5, v0

    move-object v9, v13

    move/from16 v3, v29

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    const/16 v33, 0x0

    .end local v8    # "indexReg":I
    .end local v10    # "undefined":Ljava/lang/Object;
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v29    # "indexReg":I
    :goto_22
    goto/16 :goto_2d

    .line 1626
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v29    # "indexReg":I
    .restart local v8    # "indexReg":I
    .restart local v10    # "undefined":Ljava/lang/Object;
    .restart local v11    # "op":I
    .restart local v12    # "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v15    # "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .local v26, "sDbl":[D
    .restart local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local v34    # "strings":[Ljava/lang/String;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v42    # "iCode":[B
    .restart local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    :cond_4e
    move/from16 v29, v8

    move-object/from16 v18, v10

    move-object/from16 p2, v26

    const/16 v27, 0x0

    .line 1651
    .end local v8    # "indexReg":I
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v26    # "sDbl":[D
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v29    # "indexReg":I
    .restart local p2    # "sDbl":[D
    :goto_23
    :try_start_55
    instance-of v1, v15, Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    :try_end_55
    .catchall {:try_start_55 .. :try_end_55} :catchall_2c

    if-eqz v1, :cond_51

    .line 1653
    :try_start_56
    move-object v1, v15

    check-cast v1, Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;

    move-object v10, v1

    .line 1654
    .local v10, "noSuchMethodShim":Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    iget-object v1, v10, Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;->noSuchMethodMethod:Lcom/trendmicro/hippo/Callable;

    move-object v9, v1

    .line 1656
    .local v9, "noSuchMethodMethod":Lcom/trendmicro/hippo/Callable;
    nop

    instance-of v1, v9, Lcom/trendmicro/hippo/InterpretedFunction;

    if-eqz v1, :cond_50

    .line 1657
    move-object v1, v9

    check-cast v1, Lcom/trendmicro/hippo/InterpretedFunction;

    move-object v8, v1

    .line 1658
    .local v8, "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    iget-object v1, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    iget-object v2, v8, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;
    :try_end_56
    .catchall {:try_start_56 .. :try_end_56} :catchall_2a

    if-ne v1, v2, :cond_4f

    .line 1659
    move-object/from16 v1, p0

    move-object v2, v13

    move/from16 v3, v29

    move-object v4, v14

    move-object/from16 v5, p2

    move v6, v12

    move v7, v11

    move-object/from16 v25, v8

    .end local v8    # "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    .local v25, "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    move-object/from16 v8, v30

    move-object/from16 v26, v9

    .end local v9    # "noSuchMethodMethod":Lcom/trendmicro/hippo/Callable;
    .local v26, "noSuchMethodMethod":Lcom/trendmicro/hippo/Callable;
    move-object/from16 v9, p1

    move-object/from16 v28, v10

    .end local v10    # "noSuchMethodShim":Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    .local v28, "noSuchMethodShim":Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    move-object/from16 v44, p1

    move-object/from16 v31, v15

    move/from16 v33, v27

    move v15, v11

    .end local v11    # "op":I
    .end local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .local v15, "op":I
    .local v31, "fun":Lcom/trendmicro/hippo/Callable;
    .local v44, "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    move-object/from16 v11, v25

    :try_start_57
    invoke-static/range {v1 .. v11}, Lcom/trendmicro/hippo/Interpreter;->initFrameForNoSuchMethod(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;I[Ljava/lang/Object;[DIILcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;Lcom/trendmicro/hippo/InterpretedFunction;)Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object v1
    :try_end_57
    .catchall {:try_start_57 .. :try_end_57} :catchall_29

    move-object v6, v1

    .line 1662
    .end local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    move-object/from16 v14, p0

    move-object/from16 v12, v18

    move-object/from16 v1, v24

    move/from16 v3, v29

    move-object/from16 v2, v37

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v13, v43

    const/4 v10, 0x1

    goto/16 :goto_3

    .line 2130
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "op":I
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v25    # "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    .end local v26    # "noSuchMethodMethod":Lcom/trendmicro/hippo/Callable;
    .end local v28    # "noSuchMethodShim":Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    .end local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v31    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    .end local v44    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .end local p2    # "sDbl":[D
    .restart local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :catchall_29
    move-exception v0

    move-object/from16 v1, p0

    move-object v5, v0

    move-object v9, v13

    move/from16 v3, v29

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    goto/16 :goto_2d

    .line 1658
    .restart local v8    # "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    .restart local v9    # "noSuchMethodMethod":Lcom/trendmicro/hippo/Callable;
    .restart local v10    # "noSuchMethodShim":Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    .restart local v11    # "op":I
    .restart local v12    # "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local v34    # "strings":[Ljava/lang/String;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v42    # "iCode":[B
    .restart local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .restart local p2    # "sDbl":[D
    :cond_4f
    move-object/from16 v44, p1

    move-object/from16 v25, v8

    move-object/from16 v26, v9

    move-object/from16 v28, v10

    move-object/from16 v31, v15

    move/from16 v33, v27

    move v15, v11

    .end local v8    # "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    .end local v9    # "noSuchMethodMethod":Lcom/trendmicro/hippo/Callable;
    .end local v10    # "noSuchMethodShim":Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    .end local v11    # "op":I
    .end local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .local v15, "op":I
    .restart local v25    # "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    .restart local v26    # "noSuchMethodMethod":Lcom/trendmicro/hippo/Callable;
    .restart local v28    # "noSuchMethodShim":Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    .restart local v31    # "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v44    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_24

    .line 1656
    .end local v25    # "ifun":Lcom/trendmicro/hippo/InterpretedFunction;
    .end local v26    # "noSuchMethodMethod":Lcom/trendmicro/hippo/Callable;
    .end local v28    # "noSuchMethodShim":Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    .end local v31    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v44    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .restart local v9    # "noSuchMethodMethod":Lcom/trendmicro/hippo/Callable;
    .restart local v10    # "noSuchMethodShim":Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    .restart local v11    # "op":I
    .local v15, "fun":Lcom/trendmicro/hippo/Callable;
    .restart local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    :cond_50
    move-object/from16 v44, p1

    move-object/from16 v26, v9

    move-object/from16 v28, v10

    move-object/from16 v31, v15

    move/from16 v33, v27

    move v15, v11

    .end local v9    # "noSuchMethodMethod":Lcom/trendmicro/hippo/Callable;
    .end local v10    # "noSuchMethodShim":Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    .end local v11    # "op":I
    .end local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .local v15, "op":I
    .restart local v26    # "noSuchMethodMethod":Lcom/trendmicro/hippo/Callable;
    .restart local v28    # "noSuchMethodShim":Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    .restart local v31    # "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v44    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_24

    .line 2130
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "op":I
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v26    # "noSuchMethodMethod":Lcom/trendmicro/hippo/Callable;
    .end local v28    # "noSuchMethodShim":Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
    .end local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v31    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    .end local v44    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .end local p2    # "sDbl":[D
    :catchall_2a
    move-exception v0

    move/from16 v33, v27

    move-object/from16 v1, p0

    move-object v5, v0

    move-object v9, v13

    move/from16 v3, v29

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    goto/16 :goto_2d

    .line 1651
    .restart local v11    # "op":I
    .restart local v12    # "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local v34    # "strings":[Ljava/lang/String;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v42    # "iCode":[B
    .restart local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .restart local p2    # "sDbl":[D
    :cond_51
    move-object/from16 v44, p1

    move-object/from16 v31, v15

    move/from16 v33, v27

    move v15, v11

    .line 1667
    .end local v11    # "op":I
    .end local p1    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .local v15, "op":I
    .restart local v31    # "fun":Lcom/trendmicro/hippo/Callable;
    .restart local v44    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    :goto_24
    move-object/from16 v1, p0

    :try_start_58
    iput-object v13, v1, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    .line 1668
    iput v15, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedCallOp:I

    .line 1669
    iput v12, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I
    :try_end_58
    .catchall {:try_start_58 .. :try_end_58} :catchall_2b

    .line 1670
    add-int/lit8 v2, v12, 0x2

    .line 1671
    move-object/from16 v3, p2

    move/from16 v5, v29

    .end local v29    # "indexReg":I
    .end local p2    # "sDbl":[D
    .local v3, "sDbl":[D
    .local v5, "indexReg":I
    :try_start_59
    invoke-static {v14, v3, v2, v5}, Lcom/trendmicro/hippo/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v2

    .line 1670
    move-object/from16 v6, v30

    move-object/from16 v4, v31

    move-object/from16 v7, v44

    .end local v30    # "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v31    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v44    # "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    .local v4, "fun":Lcom/trendmicro/hippo/Callable;
    .local v6, "funThisObj":Lcom/trendmicro/hippo/Scriptable;
    .local v7, "calleeScope":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v4, v1, v7, v6, v2}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v14, v12

    .line 1673
    nop

    .line 1165
    .end local v3    # "sDbl":[D
    .end local v5    # "indexReg":I
    .end local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    .end local v43    # "DBL_MRK":Ljava/lang/Object;
    .local v4, "iCode":[B
    .local v6, "indexReg":I
    .local v7, "sDbl":[D
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v10, "undefined":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :goto_25
    move v2, v12

    move-object v6, v13

    move-object/from16 v12, v18

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v4, v42

    move-object/from16 v13, v43

    const/4 v10, 0x1

    move-object/from16 v45, v14

    move-object v14, v1

    move-object v1, v3

    move v3, v5

    move-object/from16 v5, v45

    .end local v4    # "iCode":[B
    .end local v6    # "indexReg":I
    .end local v7    # "sDbl":[D
    .end local v8    # "DBL_MRK":Ljava/lang/Object;
    .end local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v10    # "undefined":Ljava/lang/Object;
    .end local v15    # "vars":[Ljava/lang/Object;
    .restart local v3    # "sDbl":[D
    .restart local v5    # "indexReg":I
    .restart local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v42    # "iCode":[B
    .restart local v43    # "DBL_MRK":Ljava/lang/Object;
    goto/16 :goto_5

    .line 2130
    .end local v3    # "sDbl":[D
    .end local v5    # "indexReg":I
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    .restart local v29    # "indexReg":I
    :catchall_2b
    move-exception v0

    move/from16 v5, v29

    move v3, v5

    move-object v9, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    move-object v5, v0

    .end local v29    # "indexReg":I
    .restart local v5    # "indexReg":I
    goto/16 :goto_2d

    .end local v5    # "indexReg":I
    .restart local v29    # "indexReg":I
    :catchall_2c
    move-exception v0

    move-object/from16 v1, p0

    move/from16 v33, v27

    move/from16 v5, v29

    move v3, v5

    move-object v9, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    move-object v5, v0

    .end local v29    # "indexReg":I
    .restart local v5    # "indexReg":I
    goto/16 :goto_2d

    .end local v5    # "indexReg":I
    .end local v18    # "undefined":Ljava/lang/Object;
    .local v8, "indexReg":I
    .restart local v10    # "undefined":Ljava/lang/Object;
    :catchall_2d
    move-exception v0

    const/16 v33, 0x0

    move-object/from16 v1, p0

    move v5, v8

    move-object/from16 v18, v10

    move v3, v5

    move-object v9, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    move-object v5, v0

    .end local v8    # "indexReg":I
    .end local v10    # "undefined":Ljava/lang/Object;
    .restart local v5    # "indexReg":I
    .restart local v18    # "undefined":Ljava/lang/Object;
    goto/16 :goto_2d

    .end local v5    # "indexReg":I
    .end local v18    # "undefined":Ljava/lang/Object;
    .restart local v10    # "undefined":Ljava/lang/Object;
    .local p2, "indexReg":I
    :catchall_2e
    move-exception v0

    const/16 v33, 0x0

    move-object/from16 v1, p0

    move/from16 v5, p2

    move-object/from16 v18, v10

    move v3, v5

    move-object v9, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    move-object v5, v0

    .end local v10    # "undefined":Ljava/lang/Object;
    .end local p2    # "indexReg":I
    .restart local v5    # "indexReg":I
    .restart local v18    # "undefined":Ljava/lang/Object;
    goto/16 :goto_2d

    .end local v5    # "indexReg":I
    .end local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v43    # "DBL_MRK":Ljava/lang/Object;
    .restart local v6    # "indexReg":I
    .local v8, "DBL_MRK":Ljava/lang/Object;
    .restart local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v10    # "undefined":Ljava/lang/Object;
    :catchall_2f
    move-exception v0

    move v5, v6

    move-object/from16 v18, v10

    move-object v1, v13

    const/16 v33, 0x0

    goto :goto_26

    :catchall_30
    move-exception v0

    move v5, v6

    move-object/from16 v18, v10

    move/from16 v33, v11

    move-object v1, v13

    :goto_26
    move-object v13, v9

    move v3, v5

    move-object v6, v8

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object v5, v0

    .end local v6    # "indexReg":I
    .end local v8    # "DBL_MRK":Ljava/lang/Object;
    .end local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v10    # "undefined":Ljava/lang/Object;
    .restart local v5    # "indexReg":I
    .restart local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v43    # "DBL_MRK":Ljava/lang/Object;
    goto/16 :goto_2d

    .line 1500
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local v43    # "DBL_MRK":Ljava/lang/Object;
    .local v1, "sDbl":[D
    .local v2, "stackTop":I
    .local v3, "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v13, "DBL_MRK":Ljava/lang/Object;
    .restart local v15    # "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_73
    move-object/from16 v42, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object/from16 v43, v13

    move-object/from16 v36, v15

    const/16 v33, 0x0

    move v12, v2

    move-object v13, v6

    move v15, v11

    move/from16 v45, v3

    move-object v3, v1

    move-object v1, v14

    move-object v14, v5

    move/from16 v5, v45

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v4    # "iCode":[B
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v9    # "instructionCounting":Z
    .end local v11    # "op":I
    .local v3, "sDbl":[D
    .local v5, "indexReg":I
    .local v12, "stackTop":I
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "op":I
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v42    # "iCode":[B
    .restart local v43    # "DBL_MRK":Ljava/lang/Object;
    iget v2, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I
    :try_end_59
    .catchall {:try_start_59 .. :try_end_59} :catchall_32

    add-int/2addr v2, v5

    .line 1501
    .end local v5    # "indexReg":I
    .local v2, "indexReg":I
    const/4 v4, 0x0

    :try_start_5a
    aput-object v4, v14, v2
    :try_end_5a
    .catchall {:try_start_5a .. :try_end_5a} :catchall_31

    .line 1502
    move-object v6, v13

    move-object v5, v14

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v4, v42

    move-object/from16 v13, v43

    const/4 v10, 0x1

    move-object v14, v1

    move-object v1, v3

    move v3, v2

    move v2, v12

    move-object/from16 v12, v18

    goto/16 :goto_5

    .line 2130
    .end local v3    # "sDbl":[D
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "op":I
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    :catchall_31
    move-exception v0

    move-object v5, v0

    move v3, v2

    move-object v9, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    goto/16 :goto_2d

    .line 1940
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local v43    # "DBL_MRK":Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .local v2, "stackTop":I
    .local v3, "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .restart local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v7    # "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v9    # "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v13, "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_74
    move-object/from16 v42, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object/from16 v43, v13

    move-object/from16 v36, v15

    const/4 v4, 0x0

    const/16 v33, 0x0

    move v12, v2

    move-object v13, v6

    move v15, v11

    move/from16 v45, v3

    move-object v3, v1

    move-object v1, v14

    move-object v14, v5

    move/from16 v5, v45

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v4    # "iCode":[B
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v9    # "instructionCounting":Z
    .end local v11    # "op":I
    .local v3, "sDbl":[D
    .local v5, "indexReg":I
    .local v12, "stackTop":I
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "op":I
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v42    # "iCode":[B
    .restart local v43    # "DBL_MRK":Ljava/lang/Object;
    :try_start_5b
    aget-object v2, v14, v12

    .line 1941
    .local v2, "value":Ljava/lang/Object;
    add-int/lit8 v6, v12, -0x1

    .line 1942
    .end local v12    # "stackTop":I
    .local v6, "stackTop":I
    aget-wide v7, v3, v6

    double-to-int v7, v7

    .line 1943
    .local v7, "i":I
    aget-object v8, v14, v6

    check-cast v8, [Ljava/lang/Object;

    aput-object v2, v8, v7

    .line 1944
    add-int/lit8 v8, v6, -0x1

    aget-object v8, v14, v8

    check-cast v8, [I

    const/4 v9, -0x1

    aput v9, v8, v7

    .line 1945
    add-int/lit8 v8, v7, 0x1

    int-to-double v8, v8

    aput-wide v8, v3, v6

    .line 1946
    move v2, v6

    move-object v6, v13

    move-object/from16 v12, v18

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v4, v42

    move-object/from16 v13, v43

    const/4 v10, 0x1

    move-object/from16 v45, v14

    move-object v14, v1

    move-object v1, v3

    move v3, v5

    move-object/from16 v5, v45

    goto/16 :goto_5

    .line 1949
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local v42    # "iCode":[B
    .end local v43    # "DBL_MRK":Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .local v2, "stackTop":I
    .local v3, "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v9    # "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v13, "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    :pswitch_75
    move-object/from16 v42, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object/from16 v43, v13

    move-object/from16 v36, v15

    const/4 v4, 0x0

    const/16 v33, 0x0

    move v12, v2

    move-object v13, v6

    move v15, v11

    move/from16 v45, v3

    move-object v3, v1

    move-object v1, v14

    move-object v14, v5

    move/from16 v5, v45

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v4    # "iCode":[B
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v9    # "instructionCounting":Z
    .end local v11    # "op":I
    .local v3, "sDbl":[D
    .local v5, "indexReg":I
    .local v12, "stackTop":I
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "op":I
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v42    # "iCode":[B
    .restart local v43    # "DBL_MRK":Ljava/lang/Object;
    aget-object v2, v14, v12

    .line 1950
    .local v2, "value":Ljava/lang/Object;
    add-int/lit8 v6, v12, -0x1

    .line 1951
    .end local v12    # "stackTop":I
    .local v6, "stackTop":I
    aget-wide v7, v3, v6

    double-to-int v7, v7

    .line 1952
    .local v7, "i":I
    aget-object v8, v14, v6

    check-cast v8, [Ljava/lang/Object;

    aput-object v2, v8, v7

    .line 1953
    add-int/lit8 v8, v6, -0x1

    aget-object v8, v14, v8

    check-cast v8, [I

    const/4 v9, 0x1

    aput v9, v8, v7

    .line 1954
    add-int/lit8 v8, v7, 0x1

    int-to-double v10, v8

    aput-wide v10, v3, v6
    :try_end_5b
    .catchall {:try_start_5b .. :try_end_5b} :catchall_32

    .line 1955
    move v2, v6

    move v10, v9

    move-object v6, v13

    move-object/from16 v12, v18

    move-object/from16 v15, v36

    move-object/from16 v7, v37

    move-object/from16 v8, v39

    move/from16 v9, v40

    move-object/from16 v4, v42

    move-object/from16 v13, v43

    move-object/from16 v45, v14

    move-object v14, v1

    move-object v1, v3

    move v3, v5

    move-object/from16 v5, v45

    goto/16 :goto_5

    .line 2130
    .end local v2    # "value":Ljava/lang/Object;
    .end local v3    # "sDbl":[D
    .end local v6    # "stackTop":I
    .end local v7    # "i":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "op":I
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    :catchall_32
    move-exception v0

    move v3, v5

    move-object v9, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object/from16 v6, v43

    move-object v5, v0

    goto/16 :goto_2d

    .line 1411
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .end local v43    # "DBL_MRK":Ljava/lang/Object;
    .restart local v1    # "sDbl":[D
    .local v2, "stackTop":I
    .local v3, "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v9    # "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v13, "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_76
    move-object/from16 v42, v4

    move-object/from16 v37, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object/from16 v43, v13

    move-object/from16 v36, v15

    const/4 v4, 0x0

    const/4 v9, 0x1

    const/16 v33, 0x0

    move v12, v2

    move-object v13, v6

    move v15, v11

    move/from16 v45, v3

    move-object v3, v1

    move-object v1, v14

    move-object v14, v5

    move/from16 v5, v45

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v4    # "iCode":[B
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v9    # "instructionCounting":Z
    .end local v11    # "op":I
    .local v3, "sDbl":[D
    .local v5, "indexReg":I
    .local v12, "stackTop":I
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "op":I
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v42    # "iCode":[B
    .restart local v43    # "DBL_MRK":Ljava/lang/Object;
    :try_start_5c
    aget-object v2, v14, v12
    :try_end_5c
    .catchall {:try_start_5c .. :try_end_5c} :catchall_35

    .line 1412
    .local v2, "rhs":Ljava/lang/Object;
    move-object/from16 v6, v43

    .end local v43    # "DBL_MRK":Ljava/lang/Object;
    .local v6, "DBL_MRK":Ljava/lang/Object;
    if-ne v2, v6, :cond_52

    :try_start_5d
    aget-wide v7, v3, v12

    invoke-static {v7, v8}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v7
    :try_end_5d
    .catchall {:try_start_5d .. :try_end_5d} :catchall_33

    move-object v2, v7

    goto :goto_27

    .line 2130
    .end local v2    # "rhs":Ljava/lang/Object;
    .end local v3    # "sDbl":[D
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "op":I
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    :catchall_33
    move-exception v0

    move v3, v5

    move-object v9, v13

    move-object/from16 v2, v37

    move-object/from16 v4, v39

    move-object v5, v0

    goto/16 :goto_2d

    .line 1413
    .restart local v2    # "rhs":Ljava/lang/Object;
    .restart local v3    # "sDbl":[D
    .restart local v12    # "stackTop":I
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v15    # "op":I
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v42    # "iCode":[B
    :cond_52
    :goto_27
    add-int/lit8 v7, v12, -0x1

    .line 1414
    .end local v12    # "stackTop":I
    .local v7, "stackTop":I
    :try_start_5e
    aget-object v8, v14, v7

    check-cast v8, Lcom/trendmicro/hippo/Scriptable;
    :try_end_5e
    .catchall {:try_start_5e .. :try_end_5e} :catchall_34

    .line 1415
    .local v8, "lhs":Lcom/trendmicro/hippo/Scriptable;
    move-object/from16 v10, v37

    .end local v37    # "stringReg":Ljava/lang/String;
    .local v10, "stringReg":Ljava/lang/String;
    :try_start_5f
    invoke-static {v8, v2, v1, v10}, Lcom/trendmicro/hippo/ScriptRuntime;->setConst(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    aput-object v11, v14, v7

    .line 1416
    move v2, v7

    move-object v7, v10

    move-object/from16 v12, v18

    move-object/from16 v15, v36

    move-object/from16 v8, v39

    move-object/from16 v4, v42

    move v10, v9

    move/from16 v9, v40

    move-object/from16 v45, v14

    move-object v14, v1

    move-object v1, v3

    move v3, v5

    move-object/from16 v5, v45

    move-object/from16 v46, v13

    move-object v13, v6

    move-object/from16 v6, v46

    goto/16 :goto_5

    .line 2130
    .end local v2    # "rhs":Ljava/lang/Object;
    .end local v3    # "sDbl":[D
    .end local v7    # "stackTop":I
    .end local v8    # "lhs":Lcom/trendmicro/hippo/Scriptable;
    .end local v10    # "stringReg":Ljava/lang/String;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "op":I
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .end local v42    # "iCode":[B
    .restart local v37    # "stringReg":Ljava/lang/String;
    :catchall_34
    move-exception v0

    move-object/from16 v10, v37

    move v3, v5

    move-object v2, v10

    move-object v9, v13

    move-object/from16 v4, v39

    move-object v5, v0

    .end local v37    # "stringReg":Ljava/lang/String;
    .restart local v10    # "stringReg":Ljava/lang/String;
    goto/16 :goto_2d

    .end local v6    # "DBL_MRK":Ljava/lang/Object;
    .end local v10    # "stringReg":Ljava/lang/String;
    .restart local v37    # "stringReg":Ljava/lang/String;
    .restart local v43    # "DBL_MRK":Ljava/lang/Object;
    :catchall_35
    move-exception v0

    move-object/from16 v10, v37

    move-object/from16 v6, v43

    move v3, v5

    move-object v2, v10

    move-object v9, v13

    move-object/from16 v4, v39

    move-object v5, v0

    .end local v37    # "stringReg":Ljava/lang/String;
    .end local v43    # "DBL_MRK":Ljava/lang/Object;
    .restart local v6    # "DBL_MRK":Ljava/lang/Object;
    .restart local v10    # "stringReg":Ljava/lang/String;
    goto/16 :goto_2d

    .line 1755
    .end local v10    # "stringReg":Ljava/lang/String;
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .local v2, "stackTop":I
    .local v3, "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v9    # "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v13, "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_77
    move-object/from16 v42, v4

    move-object v10, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object/from16 v36, v15

    const/4 v4, 0x0

    const/4 v9, 0x1

    const/16 v33, 0x0

    move v12, v2

    move v15, v11

    move/from16 v45, v3

    move-object v3, v1

    move-object v1, v14

    move-object v14, v5

    move/from16 v5, v45

    move-object/from16 v46, v13

    move-object v13, v6

    move-object/from16 v6, v46

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v4    # "iCode":[B
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v9    # "instructionCounting":Z
    .end local v11    # "op":I
    .local v3, "sDbl":[D
    .local v5, "indexReg":I
    .local v6, "DBL_MRK":Ljava/lang/Object;
    .restart local v10    # "stringReg":Ljava/lang/String;
    .local v12, "stackTop":I
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "op":I
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    .restart local v42    # "iCode":[B
    iget v2, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/lit8 v7, v2, 0x1

    iput v7, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    move-object/from16 v7, v42

    .end local v42    # "iCode":[B
    .local v7, "iCode":[B
    aget-byte v2, v7, v2
    :try_end_5f
    .catchall {:try_start_5f .. :try_end_5f} :catchall_36

    move-object/from16 v4, v39

    .end local v5    # "indexReg":I
    .local v2, "indexReg":I
    goto/16 :goto_2c

    .line 2130
    .end local v2    # "indexReg":I
    .end local v3    # "sDbl":[D
    .end local v7    # "iCode":[B
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "op":I
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v5    # "indexReg":I
    :catchall_36
    move-exception v0

    move v3, v5

    move-object v2, v10

    move-object v9, v13

    move-object/from16 v4, v39

    move-object v5, v0

    goto/16 :goto_2d

    .line 1171
    .end local v10    # "stringReg":Ljava/lang/String;
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .local v2, "stackTop":I
    .local v3, "indexReg":I
    .restart local v4    # "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v9    # "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v13, "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_78
    move-object v10, v7

    move-object/from16 v39, v8

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object/from16 v36, v15

    const/4 v9, 0x1

    const/16 v33, 0x0

    move v12, v2

    move-object v7, v4

    move v15, v11

    const/4 v4, 0x0

    move/from16 v45, v3

    move-object v3, v1

    move-object v1, v14

    move-object v14, v5

    move/from16 v5, v45

    move-object/from16 v46, v13

    move-object v13, v6

    move-object/from16 v6, v46

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v4    # "iCode":[B
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v9    # "instructionCounting":Z
    .end local v11    # "op":I
    .local v3, "sDbl":[D
    .local v5, "indexReg":I
    .local v6, "DBL_MRK":Ljava/lang/Object;
    .local v7, "iCode":[B
    .restart local v10    # "stringReg":Ljava/lang/String;
    .local v12, "stackTop":I
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "op":I
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v40    # "instructionCounting":Z
    :try_start_60
    iget-boolean v2, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z
    :try_end_60
    .catchall {:try_start_60 .. :try_end_60} :catchall_37

    if-nez v2, :cond_53

    .line 1174
    :try_start_61
    iget v2, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    sub-int/2addr v2, v9

    iput v2, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 1175
    invoke-static {v13}, Lcom/trendmicro/hippo/Interpreter;->captureFrameForGenerator(Lcom/trendmicro/hippo/Interpreter$CallFrame;)Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object v2

    .line 1176
    .local v2, "generatorFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    iput-boolean v9, v2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    .line 1177
    new-instance v8, Lcom/trendmicro/hippo/NativeGenerator;

    iget-object v11, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v4, v2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    invoke-direct {v8, v11, v4, v2}, Lcom/trendmicro/hippo/NativeGenerator;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeFunction;Ljava/lang/Object;)V

    move-object v4, v8

    .line 1179
    .local v4, "generator":Lcom/trendmicro/hippo/NativeGenerator;
    iput-object v4, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->result:Ljava/lang/Object;
    :try_end_61
    .catchall {:try_start_61 .. :try_end_61} :catchall_36

    .line 1180
    move-object/from16 v4, v39

    goto/16 :goto_29

    .line 1186
    .end local v2    # "generatorFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v4    # "generator":Lcom/trendmicro/hippo/NativeGenerator;
    :cond_53
    :goto_28
    :try_start_62
    iget-boolean v2, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z
    :try_end_62
    .catchall {:try_start_62 .. :try_end_62} :catchall_37

    if-nez v2, :cond_54

    .line 1187
    move-object/from16 v4, v39

    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v4, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    :try_start_63
    invoke-static {v1, v13, v12, v4}, Lcom/trendmicro/hippo/Interpreter;->freezeGenerator(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;ILcom/trendmicro/hippo/Interpreter$GeneratorState;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 1189
    .end local v4    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    :cond_54
    move-object/from16 v4, v39

    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v4    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    invoke-static {v13, v12, v4, v15}, Lcom/trendmicro/hippo/Interpreter;->thawGenerator(Lcom/trendmicro/hippo/Interpreter$CallFrame;ILcom/trendmicro/hippo/Interpreter$GeneratorState;I)Ljava/lang/Object;

    move-result-object v2

    .line 1190
    .local v2, "obj":Ljava/lang/Object;
    sget-object v8, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v8, :cond_57

    .line 1191
    move-object v8, v2

    .line 1192
    .end local v24    # "throwable":Ljava/lang/Object;
    .local v8, "throwable":Ljava/lang/Object;
    move v3, v5

    move-object/from16 v37, v10

    move-object/from16 v7, v21

    move-wide/from16 v10, v22

    goto/16 :goto_2e

    .line 2130
    .end local v2    # "obj":Ljava/lang/Object;
    .end local v3    # "sDbl":[D
    .end local v4    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v7    # "iCode":[B
    .end local v8    # "throwable":Ljava/lang/Object;
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "op":I
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v24    # "throwable":Ljava/lang/Object;
    .restart local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    :catchall_37
    move-exception v0

    move-object/from16 v4, v39

    move v3, v5

    move-object v2, v10

    move-object v9, v13

    move-object v5, v0

    .end local v39    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v4    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    goto/16 :goto_2d

    .line 1198
    .end local v10    # "stringReg":Ljava/lang/String;
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .local v2, "stackTop":I
    .local v3, "indexReg":I
    .local v4, "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v9    # "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v13, "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_79
    move-object v10, v7

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object/from16 v36, v15

    const/4 v9, 0x1

    const/16 v33, 0x0

    move v12, v2

    move-object v7, v4

    move-object v4, v8

    move v15, v11

    move/from16 v45, v3

    move-object v3, v1

    move-object v1, v14

    move-object v14, v5

    move/from16 v5, v45

    move-object/from16 v46, v13

    move-object v13, v6

    move-object/from16 v6, v46

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v9    # "instructionCounting":Z
    .end local v11    # "op":I
    .local v3, "sDbl":[D
    .local v4, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v5, "indexReg":I
    .local v6, "DBL_MRK":Ljava/lang/Object;
    .local v7, "iCode":[B
    .restart local v10    # "stringReg":Ljava/lang/String;
    .local v12, "stackTop":I
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "op":I
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v40    # "instructionCounting":Z
    iput-boolean v9, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    .line 1199
    iget v2, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    invoke-static {v7, v2}, Lcom/trendmicro/hippo/Interpreter;->getIndex([BI)I

    move-result v2

    .line 1200
    .local v2, "sourceLine":I
    new-instance v8, Lcom/trendmicro/hippo/JavaScriptException;

    iget-object v11, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 1201
    invoke-static {v11}, Lcom/trendmicro/hippo/NativeIterator;->getStopIterationObject(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v11

    iget-object v9, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v9, v9, Lcom/trendmicro/hippo/InterpreterData;->itsSourceFile:Ljava/lang/String;

    invoke-direct {v8, v11, v9, v2}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    iput-object v8, v4, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->returnedException:Ljava/lang/RuntimeException;

    .line 1203
    nop

    .line 2114
    .end local v2    # "sourceLine":I
    .end local v3    # "sDbl":[D
    .end local v4    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v40    # "instructionCounting":Z
    .local v6, "stackTop":I
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v9    # "instructionCounting":Z
    .local v10, "sDbl":[D
    .local v12, "stack":[Ljava/lang/Object;
    .local v13, "DBL_MRK":Ljava/lang/Object;
    .local v15, "iCode":[B
    .local v30, "undefined":Ljava/lang/Object;
    .local v31, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    :goto_29
    move v2, v12

    .end local v8    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v9    # "instructionCounting":Z
    .end local v12    # "stack":[Ljava/lang/Object;
    .end local v15    # "iCode":[B
    .end local v30    # "undefined":Ljava/lang/Object;
    .end local v31    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v2, "stackTop":I
    .restart local v3    # "sDbl":[D
    .restart local v4    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v6, "DBL_MRK":Ljava/lang/Object;
    .local v7, "iCode":[B
    .local v10, "stringReg":Ljava/lang/String;
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v40    # "instructionCounting":Z
    :goto_2a
    const/4 v8, 0x0

    invoke-static {v1, v13, v8}, Lcom/trendmicro/hippo/Interpreter;->exitFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 2115
    iget-object v8, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->result:Ljava/lang/Object;
    :try_end_63
    .catchall {:try_start_63 .. :try_end_63} :catchall_3b

    .line 2116
    .end local v21    # "interpreterResult":Ljava/lang/Object;
    .local v8, "interpreterResult":Ljava/lang/Object;
    :try_start_64
    iget-wide v11, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->resultDbl:D
    :try_end_64
    .catchall {:try_start_64 .. :try_end_64} :catchall_3a

    .line 2117
    .end local v22    # "interpreterResultDbl":D
    .local v11, "interpreterResultDbl":D
    :try_start_65
    iget-object v9, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    if-eqz v9, :cond_56

    .line 2118
    iget-object v9, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :try_end_65
    .catchall {:try_start_65 .. :try_end_65} :catchall_39

    .line 2119
    .end local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :try_start_66
    iget-boolean v13, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    if-eqz v13, :cond_55

    .line 2120
    invoke-virtual {v9}, Lcom/trendmicro/hippo/Interpreter$CallFrame;->cloneFrozen()Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object v13

    move-object v9, v13

    .line 2122
    :cond_55
    invoke-static {v9, v8, v11, v12}, Lcom/trendmicro/hippo/Interpreter;->setCallResult(Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;D)V
    :try_end_66
    .catchall {:try_start_66 .. :try_end_66} :catchall_38

    .line 2124
    const/16 v21, 0x0

    .line 2125
    .end local v8    # "interpreterResult":Ljava/lang/Object;
    .restart local v21    # "interpreterResult":Ljava/lang/Object;
    move-object v14, v1

    move-object v8, v4

    move v3, v5

    move-object v13, v6

    move-object v6, v9

    move-object v2, v10

    move-wide/from16 v22, v11

    move-object/from16 v12, v18

    move-object/from16 v1, v24

    move/from16 v9, v40

    const/4 v10, 0x1

    goto/16 :goto_3

    .line 2130
    .end local v2    # "stackTop":I
    .end local v3    # "sDbl":[D
    .end local v7    # "iCode":[B
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v21    # "interpreterResult":Ljava/lang/Object;
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    .restart local v8    # "interpreterResult":Ljava/lang/Object;
    :catchall_38
    move-exception v0

    move v3, v5

    move-object/from16 v21, v8

    move-object v2, v10

    move-wide/from16 v22, v11

    move-object v5, v0

    goto/16 :goto_2d

    .line 2127
    .end local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v2    # "stackTop":I
    .restart local v3    # "sDbl":[D
    .restart local v7    # "iCode":[B
    .restart local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    .restart local v36    # "vars":[Ljava/lang/Object;
    :cond_56
    move v3, v5

    move-object v7, v10

    move-object/from16 v2, v24

    goto/16 :goto_37

    .line 2130
    .end local v2    # "stackTop":I
    .end local v3    # "sDbl":[D
    .end local v7    # "iCode":[B
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    :catchall_39
    move-exception v0

    move v3, v5

    move-object/from16 v21, v8

    move-object v2, v10

    move-wide/from16 v22, v11

    move-object v9, v13

    move-object v5, v0

    goto/16 :goto_2d

    .end local v11    # "interpreterResultDbl":D
    .restart local v22    # "interpreterResultDbl":D
    :catchall_3a
    move-exception v0

    move v3, v5

    move-object/from16 v21, v8

    move-object v2, v10

    move-object v9, v13

    move-object v5, v0

    goto/16 :goto_2d

    .line 2020
    .end local v10    # "stringReg":Ljava/lang/String;
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .local v3, "indexReg":I
    .local v4, "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v9, "instructionCounting":Z
    .local v11, "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v13, "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v21    # "interpreterResult":Ljava/lang/Object;
    .restart local v34    # "strings":[Ljava/lang/String;
    :pswitch_7a
    move-object v10, v7

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object/from16 v36, v15

    const/16 v33, 0x0

    move v12, v2

    move-object v7, v4

    move-object v4, v8

    move v15, v11

    move/from16 v45, v3

    move-object v3, v1

    move-object v1, v14

    move-object v14, v5

    move/from16 v5, v45

    move-object/from16 v46, v13

    move-object v13, v6

    move-object/from16 v6, v46

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v9    # "instructionCounting":Z
    .end local v11    # "op":I
    .local v3, "sDbl":[D
    .local v4, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v5, "indexReg":I
    .local v6, "DBL_MRK":Ljava/lang/Object;
    .local v7, "iCode":[B
    .restart local v10    # "stringReg":Ljava/lang/String;
    .local v12, "stackTop":I
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "op":I
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v40    # "instructionCounting":Z
    :try_start_67
    iget-object v2, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

    if-eqz v2, :cond_57

    .line 2021
    iget-object v2, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

    invoke-interface {v2, v1}, Lcom/trendmicro/hippo/debug/DebugFrame;->onDebuggerStatement(Lcom/trendmicro/hippo/Context;)V
    :try_end_67
    .catchall {:try_start_67 .. :try_end_67} :catchall_3b

    .line 1165
    .end local v15    # "op":I
    :cond_57
    :goto_2b
    move-object v8, v4

    move-object v4, v7

    move-object v7, v10

    move v2, v12

    move-object/from16 v12, v18

    move-object/from16 v15, v36

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object/from16 v45, v14

    move-object v14, v1

    move-object v1, v3

    move v3, v5

    move-object/from16 v5, v45

    move-object/from16 v46, v13

    move-object v13, v6

    move-object/from16 v6, v46

    goto/16 :goto_5

    .line 2130
    .end local v3    # "sDbl":[D
    .end local v7    # "iCode":[B
    .end local v12    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    .end local v36    # "vars":[Ljava/lang/Object;
    :catchall_3b
    move-exception v0

    move v3, v5

    move-object v2, v10

    move-object v9, v13

    move-object v5, v0

    goto/16 :goto_2d

    .line 1169
    .end local v10    # "stringReg":Ljava/lang/String;
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v40    # "instructionCounting":Z
    .restart local v1    # "sDbl":[D
    .restart local v2    # "stackTop":I
    .local v3, "indexReg":I
    .local v4, "iCode":[B
    .local v5, "stack":[Ljava/lang/Object;
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v9    # "instructionCounting":Z
    .restart local v11    # "op":I
    .local v12, "undefined":Ljava/lang/Object;
    .local v13, "DBL_MRK":Ljava/lang/Object;
    .local v15, "vars":[Ljava/lang/Object;
    .restart local v16    # "varDbls":[D
    .restart local v17    # "varAttributes":[I
    .restart local v34    # "strings":[Ljava/lang/String;
    :cond_58
    move-object v10, v7

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object/from16 v36, v15

    const/16 v33, 0x0

    move v12, v2

    move-object v7, v4

    move-object v4, v8

    move v15, v11

    move/from16 v45, v3

    move-object v3, v1

    move-object v1, v14

    move-object v14, v5

    move/from16 v5, v45

    move-object/from16 v46, v13

    move-object v13, v6

    move-object/from16 v6, v46

    .end local v1    # "sDbl":[D
    .end local v2    # "stackTop":I
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v9    # "instructionCounting":Z
    .end local v11    # "op":I
    .local v3, "sDbl":[D
    .local v4, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v5, "indexReg":I
    .local v6, "DBL_MRK":Ljava/lang/Object;
    .local v7, "iCode":[B
    .restart local v10    # "stringReg":Ljava/lang/String;
    .local v12, "stackTop":I
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v14    # "stack":[Ljava/lang/Object;
    .local v15, "op":I
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v36    # "vars":[Ljava/lang/Object;
    .restart local v40    # "instructionCounting":Z
    move v2, v5

    .line 1758
    .end local v5    # "indexReg":I
    .local v2, "indexReg":I
    :goto_2c
    move-object/from16 v25, v13

    move-object/from16 v26, v14

    move-object/from16 v27, v3

    move/from16 v28, v12

    move v5, v15

    move-object/from16 v15, v36

    .end local v36    # "vars":[Ljava/lang/Object;
    .local v5, "op":I
    .local v15, "vars":[Ljava/lang/Object;
    move-object/from16 v29, v15

    move-object/from16 v30, v16

    move-object/from16 v31, v17

    move/from16 v32, v2

    :try_start_68
    invoke-static/range {v25 .. v32}, Lcom/trendmicro/hippo/Interpreter;->doSetConstVar(Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I

    move-result v8
    :try_end_68
    .catchall {:try_start_68 .. :try_end_68} :catchall_3c

    .line 1760
    .end local v12    # "stackTop":I
    .local v8, "stackTop":I
    move-object v5, v14

    move-object/from16 v12, v18

    move/from16 v9, v40

    move-object v14, v1

    move-object v1, v3

    move v3, v2

    move v2, v8

    move-object v8, v4

    move-object v4, v7

    move-object v7, v10

    const/4 v10, 0x1

    move-object/from16 v45, v13

    move-object v13, v6

    move-object/from16 v6, v45

    goto/16 :goto_5

    .line 2130
    .end local v3    # "sDbl":[D
    .end local v5    # "op":I
    .end local v7    # "iCode":[B
    .end local v8    # "stackTop":I
    .end local v14    # "stack":[Ljava/lang/Object;
    .end local v15    # "vars":[Ljava/lang/Object;
    .end local v16    # "varDbls":[D
    .end local v17    # "varAttributes":[I
    .end local v34    # "strings":[Ljava/lang/String;
    :catchall_3c
    move-exception v0

    move-object v5, v0

    move v3, v2

    move-object v2, v10

    move-object v9, v13

    goto :goto_2d

    .end local v2    # "indexReg":I
    .end local v4    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v10    # "stringReg":Ljava/lang/String;
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v40    # "instructionCounting":Z
    .local v3, "indexReg":I
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v9    # "instructionCounting":Z
    .local v12, "undefined":Ljava/lang/Object;
    .local v13, "DBL_MRK":Ljava/lang/Object;
    :catchall_3d
    move-exception v0

    move v5, v3

    move-object v10, v7

    move-object v4, v8

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object v1, v14

    const/16 v33, 0x0

    move-object/from16 v45, v13

    move-object v13, v6

    move-object/from16 v6, v45

    move-object v2, v10

    move-object v9, v13

    move-object v5, v0

    .end local v3    # "indexReg":I
    .end local v7    # "stringReg":Ljava/lang/String;
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v9    # "instructionCounting":Z
    .end local v12    # "undefined":Ljava/lang/Object;
    .restart local v4    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v5, "indexReg":I
    .local v6, "DBL_MRK":Ljava/lang/Object;
    .restart local v10    # "stringReg":Ljava/lang/String;
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v40    # "instructionCounting":Z
    goto :goto_2d

    .end local v4    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v5    # "indexReg":I
    .end local v10    # "stringReg":Ljava/lang/String;
    .end local v18    # "undefined":Ljava/lang/Object;
    .end local v40    # "instructionCounting":Z
    .local v2, "stringReg":Ljava/lang/String;
    .restart local v3    # "indexReg":I
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .restart local v9    # "instructionCounting":Z
    .restart local v12    # "undefined":Ljava/lang/Object;
    .local v13, "DBL_MRK":Ljava/lang/Object;
    :catchall_3e
    move-exception v0

    move-object v4, v8

    move/from16 v40, v9

    move-object/from16 v18, v12

    move-object v1, v14

    const/16 v33, 0x0

    move-object/from16 v45, v13

    move-object v13, v6

    move-object/from16 v6, v45

    move-object v5, v0

    move-object v9, v13

    .line 2131
    .end local v8    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .end local v12    # "undefined":Ljava/lang/Object;
    .end local v13    # "DBL_MRK":Ljava/lang/Object;
    .restart local v4    # "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .local v5, "ex":Ljava/lang/Throwable;
    .local v6, "DBL_MRK":Ljava/lang/Object;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v18    # "undefined":Ljava/lang/Object;
    .restart local v40    # "instructionCounting":Z
    :goto_2d
    if-nez v24, :cond_73

    .line 2136
    move-object v7, v5

    move-object/from16 v37, v2

    move-object v2, v7

    move-object v13, v9

    move-object/from16 v7, v21

    move-wide/from16 v10, v22

    .line 2142
    .end local v5    # "ex":Ljava/lang/Throwable;
    .end local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v21    # "interpreterResult":Ljava/lang/Object;
    .end local v22    # "interpreterResultDbl":D
    .end local v24    # "throwable":Ljava/lang/Object;
    .local v2, "throwable":Ljava/lang/Object;
    .local v7, "interpreterResult":Ljava/lang/Object;
    .local v10, "interpreterResultDbl":D
    .local v13, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v37    # "stringReg":Ljava/lang/String;
    :goto_2e
    if-nez v2, :cond_59

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2145
    :cond_59
    const/4 v8, 0x2

    .line 2146
    .local v8, "EX_CATCH_STATE":I
    const/4 v12, 0x1

    .line 2147
    .local v12, "EX_FINALLY_STATE":I
    const/4 v14, 0x0

    .line 2150
    .local v14, "EX_NO_JS_STATE":I
    const/4 v5, 0x0

    .line 2152
    .local v5, "cjump":Lcom/trendmicro/hippo/Interpreter$ContinuationJump;
    if-eqz v4, :cond_5a

    iget v9, v4, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->operation:I

    const/4 v15, 0x2

    if-ne v9, v15, :cond_5b

    iget-object v9, v4, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    if-ne v2, v9, :cond_5b

    .line 2156
    const/4 v9, 0x1

    .local v9, "exState":I
    goto :goto_32

    .line 2152
    .end local v9    # "exState":I
    :cond_5a
    const/4 v15, 0x2

    .line 2157
    :cond_5b
    instance-of v9, v2, Lcom/trendmicro/hippo/JavaScriptException;

    if-eqz v9, :cond_5c

    .line 2158
    const/4 v9, 0x2

    .restart local v9    # "exState":I
    goto :goto_32

    .line 2159
    .end local v9    # "exState":I
    :cond_5c
    instance-of v9, v2, Lcom/trendmicro/hippo/EcmaError;

    if-eqz v9, :cond_5d

    .line 2161
    const/4 v9, 0x2

    .restart local v9    # "exState":I
    goto :goto_32

    .line 2162
    .end local v9    # "exState":I
    :cond_5d
    instance-of v9, v2, Lcom/trendmicro/hippo/EvaluatorException;

    if-eqz v9, :cond_5e

    .line 2163
    const/4 v9, 0x2

    .restart local v9    # "exState":I
    goto :goto_32

    .line 2164
    .end local v9    # "exState":I
    :cond_5e
    instance-of v9, v2, Lcom/trendmicro/hippo/ContinuationPending;

    if-eqz v9, :cond_5f

    .line 2165
    const/4 v9, 0x0

    .restart local v9    # "exState":I
    goto :goto_32

    .line 2166
    .end local v9    # "exState":I
    :cond_5f
    instance-of v9, v2, Ljava/lang/RuntimeException;

    if-eqz v9, :cond_61

    .line 2167
    const/16 v9, 0xd

    invoke-virtual {v1, v9}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v9

    if-eqz v9, :cond_60

    .line 2168
    move v9, v15

    goto :goto_2f

    .line 2169
    :cond_60
    const/4 v9, 0x1

    :goto_2f
    nop

    .restart local v9    # "exState":I
    goto :goto_32

    .line 2170
    .end local v9    # "exState":I
    :cond_61
    const/16 v9, 0xd

    instance-of v15, v2, Ljava/lang/Error;

    if-eqz v15, :cond_63

    .line 2171
    invoke-virtual {v1, v9}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v9

    if-eqz v9, :cond_62

    .line 2172
    const/4 v9, 0x2

    goto :goto_30

    .line 2173
    :cond_62
    move/from16 v9, v33

    :goto_30
    nop

    .restart local v9    # "exState":I
    goto :goto_32

    .line 2174
    .end local v9    # "exState":I
    :cond_63
    instance-of v15, v2, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;

    if-eqz v15, :cond_64

    .line 2176
    const/4 v9, 0x1

    .line 2177
    .restart local v9    # "exState":I
    move-object v5, v2

    check-cast v5, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;

    goto :goto_32

    .line 2179
    .end local v9    # "exState":I
    :cond_64
    invoke-virtual {v1, v9}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v9

    if-eqz v9, :cond_65

    .line 2180
    const/4 v9, 0x2

    goto :goto_31

    .line 2181
    :cond_65
    const/4 v9, 0x1

    :goto_31
    nop

    .line 2184
    .restart local v9    # "exState":I
    :goto_32
    if-eqz v40, :cond_66

    .line 2186
    const/16 v15, 0x64

    :try_start_69
    invoke-static {v1, v13, v15}, Lcom/trendmicro/hippo/Interpreter;->addInstructionCount(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;I)V
    :try_end_69
    .catch Ljava/lang/RuntimeException; {:try_start_69 .. :try_end_69} :catch_1
    .catch Ljava/lang/Error; {:try_start_69 .. :try_end_69} :catch_0

    goto :goto_33

    .line 2190
    :catch_0
    move-exception v0

    move-object v15, v0

    .line 2193
    .local v15, "ex":Ljava/lang/Error;
    move-object v2, v15

    .line 2194
    const/4 v5, 0x0

    .line 2195
    const/4 v9, 0x0

    goto :goto_33

    .line 2187
    .end local v15    # "ex":Ljava/lang/Error;
    :catch_1
    move-exception v0

    move-object v15, v0

    .line 2188
    .local v15, "ex":Ljava/lang/RuntimeException;
    move-object v2, v15

    .line 2189
    const/4 v9, 0x1

    .line 2198
    .end local v15    # "ex":Ljava/lang/RuntimeException;
    :cond_66
    :goto_33
    iget-object v15, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

    if-eqz v15, :cond_67

    instance-of v15, v2, Ljava/lang/RuntimeException;

    if-eqz v15, :cond_67

    .line 2202
    move-object v15, v2

    check-cast v15, Ljava/lang/RuntimeException;

    .line 2204
    .local v15, "rex":Ljava/lang/RuntimeException;
    move-object/from16 v16, v2

    .end local v2    # "throwable":Ljava/lang/Object;
    .local v16, "throwable":Ljava/lang/Object;
    :try_start_6a
    iget-object v2, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

    invoke-interface {v2, v1, v15}, Lcom/trendmicro/hippo/debug/DebugFrame;->onExceptionThrown(Lcom/trendmicro/hippo/Context;Ljava/lang/Throwable;)V
    :try_end_6a
    .catchall {:try_start_6a .. :try_end_6a} :catchall_3f

    .line 2211
    goto :goto_34

    .line 2205
    :catchall_3f
    move-exception v0

    move-object v2, v0

    .line 2208
    .local v2, "ex":Ljava/lang/Throwable;
    move-object/from16 v16, v2

    .line 2209
    const/4 v5, 0x0

    .line 2210
    const/4 v9, 0x0

    goto :goto_35

    .line 2198
    .end local v15    # "rex":Ljava/lang/RuntimeException;
    .end local v16    # "throwable":Ljava/lang/Object;
    .local v2, "throwable":Ljava/lang/Object;
    :cond_67
    move-object/from16 v16, v2

    .line 2215
    .end local v2    # "throwable":Ljava/lang/Object;
    .restart local v16    # "throwable":Ljava/lang/Object;
    :goto_34
    move-object/from16 v2, v16

    .end local v16    # "throwable":Ljava/lang/Object;
    .restart local v2    # "throwable":Ljava/lang/Object;
    :cond_68
    :goto_35
    if-eqz v9, :cond_6a

    .line 2216
    const/4 v15, 0x2

    if-eq v9, v15, :cond_69

    const/16 v16, 0x1

    goto :goto_36

    :cond_69
    move/from16 v16, v33

    :goto_36
    move/from16 p1, v16

    .line 2217
    .local p1, "onlyFinally":Z
    move/from16 v15, p1

    .end local p1    # "onlyFinally":Z
    .local v15, "onlyFinally":Z
    invoke-static {v13, v15}, Lcom/trendmicro/hippo/Interpreter;->getExceptionHandler(Lcom/trendmicro/hippo/Interpreter$CallFrame;Z)I

    move-result v3

    .line 2218
    if-ltz v3, :cond_6a

    .line 2222
    move-object v14, v1

    move-object v1, v2

    move-object v8, v4

    move-object/from16 v21, v7

    move-wide/from16 v22, v10

    move-object/from16 v12, v18

    move-object/from16 v2, v37

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object/from16 v45, v13

    move-object v13, v6

    move-object/from16 v6, v45

    goto/16 :goto_3

    .line 2228
    .end local v15    # "onlyFinally":Z
    :cond_6a
    invoke-static {v1, v13, v2}, Lcom/trendmicro/hippo/Interpreter;->exitFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 2230
    iget-object v13, v13, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 2231
    if-nez v13, :cond_72

    .line 2241
    if-eqz v5, :cond_6d

    .line 2242
    iget-object v15, v5, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->branchFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    if-eqz v15, :cond_6b

    .line 2244
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2246
    :cond_6b
    iget-object v15, v5, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->capturedFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    if-eqz v15, :cond_6c

    .line 2248
    const/4 v3, -0x1

    .line 2249
    move-object v14, v1

    move-object v1, v2

    move-object v8, v4

    move-object/from16 v21, v7

    move-wide/from16 v22, v10

    move-object/from16 v12, v18

    move-object/from16 v2, v37

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object/from16 v45, v13

    move-object v13, v6

    move-object/from16 v6, v45

    goto/16 :goto_3

    .line 2252
    :cond_6c
    iget-object v7, v5, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    .line 2253
    iget-wide v10, v5, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->resultDbl:D

    .line 2254
    const/16 v24, 0x0

    move-object v8, v7

    move-wide v11, v10

    move-object/from16 v2, v24

    move-object/from16 v7, v37

    .end local v2    # "throwable":Ljava/lang/Object;
    .restart local v24    # "throwable":Ljava/lang/Object;
    goto :goto_37

    .line 2241
    .end local v24    # "throwable":Ljava/lang/Object;
    .restart local v2    # "throwable":Ljava/lang/Object;
    :cond_6d
    move-object v8, v7

    move-wide v11, v10

    move-object/from16 v7, v37

    .line 2262
    .end local v5    # "cjump":Lcom/trendmicro/hippo/Interpreter$ContinuationJump;
    .end local v9    # "exState":I
    .end local v10    # "interpreterResultDbl":D
    .end local v12    # "EX_FINALLY_STATE":I
    .end local v14    # "EX_NO_JS_STATE":I
    .end local v37    # "stringReg":Ljava/lang/String;
    .local v7, "stringReg":Ljava/lang/String;
    .local v8, "interpreterResult":Ljava/lang/Object;
    .local v11, "interpreterResultDbl":D
    :goto_37
    iget-object v5, v1, Lcom/trendmicro/hippo/Context;->previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

    if-eqz v5, :cond_6e

    iget-object v5, v1, Lcom/trendmicro/hippo/Context;->previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

    .line 2263
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v5

    if-eqz v5, :cond_6e

    .line 2265
    iget-object v5, v1, Lcom/trendmicro/hippo/Context;->previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

    .line 2266
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ObjArray;->pop()Ljava/lang/Object;

    move-result-object v5

    iput-object v5, v1, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    goto :goto_38

    .line 2269
    :cond_6e
    const/4 v15, 0x0

    iput-object v15, v1, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    .line 2271
    iput-object v15, v1, Lcom/trendmicro/hippo/Context;->previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

    .line 2274
    :goto_38
    if-eqz v2, :cond_70

    .line 2275
    instance-of v5, v2, Ljava/lang/RuntimeException;

    if-eqz v5, :cond_6f

    .line 2276
    move-object v5, v2

    check-cast v5, Ljava/lang/RuntimeException;

    throw v5

    .line 2279
    :cond_6f
    move-object v5, v2

    check-cast v5, Ljava/lang/Error;

    throw v5

    .line 2282
    :cond_70
    if-eq v8, v6, :cond_71

    .line 2283
    move-object v5, v8

    goto :goto_39

    .line 2284
    :cond_71
    invoke-static {v11, v12}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    .line 2282
    :goto_39
    return-object v5

    .line 2232
    .end local v11    # "interpreterResultDbl":D
    .restart local v5    # "cjump":Lcom/trendmicro/hippo/Interpreter$ContinuationJump;
    .local v7, "interpreterResult":Ljava/lang/Object;
    .local v8, "EX_CATCH_STATE":I
    .restart local v9    # "exState":I
    .restart local v10    # "interpreterResultDbl":D
    .restart local v12    # "EX_FINALLY_STATE":I
    .restart local v14    # "EX_NO_JS_STATE":I
    .restart local v37    # "stringReg":Ljava/lang/String;
    :cond_72
    const/4 v15, 0x0

    if-eqz v5, :cond_68

    iget-object v15, v5, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->branchFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    if-ne v15, v13, :cond_68

    .line 2235
    const/4 v3, -0x1

    .line 2236
    move-object v14, v1

    move-object v1, v2

    move-object v8, v4

    move-object/from16 v21, v7

    move-wide/from16 v22, v10

    move-object/from16 v12, v18

    move-object/from16 v2, v37

    move/from16 v9, v40

    const/4 v10, 0x1

    move-object/from16 v45, v13

    move-object v13, v6

    move-object/from16 v6, v45

    goto/16 :goto_3

    .line 2133
    .end local v7    # "interpreterResult":Ljava/lang/Object;
    .end local v8    # "EX_CATCH_STATE":I
    .end local v10    # "interpreterResultDbl":D
    .end local v12    # "EX_FINALLY_STATE":I
    .end local v13    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v14    # "EX_NO_JS_STATE":I
    .end local v37    # "stringReg":Ljava/lang/String;
    .local v2, "stringReg":Ljava/lang/String;
    .local v5, "ex":Ljava/lang/Throwable;
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .restart local v21    # "interpreterResult":Ljava/lang/Object;
    .restart local v22    # "interpreterResultDbl":D
    .restart local v24    # "throwable":Ljava/lang/Object;
    :cond_73
    sget-object v7, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v5, v7}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 2134
    new-instance v7, Ljava/lang/IllegalStateException;

    invoke-direct {v7}, Ljava/lang/IllegalStateException;-><init>()V

    throw v7

    nop

    :pswitch_data_0
    .packed-switch -0x40
        :pswitch_7a
        :pswitch_79
        :pswitch_78
        :pswitch_77
    .end packed-switch

    :pswitch_data_1
    .packed-switch -0x3b
        :pswitch_76
        :pswitch_75
        :pswitch_74
        :pswitch_73
        :pswitch_72
        :pswitch_71
        :pswitch_70
        :pswitch_6f
        :pswitch_6e
        :pswitch_6d
        :pswitch_6c
        :pswitch_6b
        :pswitch_6a
        :pswitch_69
        :pswitch_68
        :pswitch_67
        :pswitch_66
        :pswitch_65
        :pswitch_64
        :pswitch_63
        :pswitch_62
        :pswitch_61
        :pswitch_60
        :pswitch_5f
        :pswitch_5e
        :pswitch_5d
        :pswitch_5c
        :pswitch_5b
        :pswitch_5a
        :pswitch_59
        :pswitch_58
        :pswitch_57
        :pswitch_56
        :pswitch_55
        :pswitch_54
        :pswitch_53
        :pswitch_52
        :pswitch_51
        :pswitch_50
        :pswitch_4f
        :pswitch_4e
        :pswitch_4d
        :pswitch_4c
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x2
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_32
        :pswitch_32
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_33
        :pswitch_33
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2e
        :pswitch_2e
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_f
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_22
        :pswitch_8
        :pswitch_7
        :pswitch_34
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static processThrowable(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Interpreter$CallFrame;IZ)Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .locals 8
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "throwable"    # Ljava/lang/Object;
    .param p2, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p3, "indexReg"    # I
    .param p4, "instructionCounting"    # Z

    .line 2730
    if-ltz p3, :cond_2

    .line 2734
    iget-boolean v0, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    if-eqz v0, :cond_0

    .line 2736
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Interpreter$CallFrame;->cloneFrozen()Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object p2

    .line 2739
    :cond_0
    iget-object v0, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsExceptionTable:[I

    .line 2741
    .local v0, "table":[I
    add-int/lit8 v1, p3, 0x2

    aget v1, v0, v1

    iput v1, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 2742
    if-eqz p4, :cond_1

    .line 2743
    iget v1, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    iput v1, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pcPrevBranch:I

    .line 2746
    :cond_1
    iget v1, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->emptyStackTop:I

    iput v1, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    .line 2747
    iget v1, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I

    add-int/lit8 v2, p3, 0x5

    aget v2, v0, v2

    add-int/2addr v1, v2

    .line 2750
    .local v1, "scopeLocal":I
    iget v2, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I

    add-int/lit8 v3, p3, 0x4

    aget v3, v0, v3

    add-int/2addr v2, v3

    .line 2753
    .local v2, "exLocal":I
    iget-object v3, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v3, v3, v1

    check-cast v3, Lcom/trendmicro/hippo/Scriptable;

    iput-object v3, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 2754
    iget-object v3, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aput-object p1, v3, v2

    .line 2756
    const/4 p1, 0x0

    .line 2757
    .end local v0    # "table":[I
    .end local v1    # "scopeLocal":I
    .end local v2    # "exLocal":I
    goto :goto_2

    .line 2759
    :cond_2
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;

    .line 2762
    .local v0, "cjump":Lcom/trendmicro/hippo/Interpreter$ContinuationJump;
    const/4 p1, 0x0

    .line 2764
    iget-object v1, v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->branchFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    if-eq v1, p2, :cond_3

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2769
    :cond_3
    iget-object v1, v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->capturedFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    if-nez v1, :cond_4

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2773
    :cond_4
    iget-object v1, v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->capturedFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    iget v1, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frameIndex:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    .line 2774
    .local v1, "rewindCount":I
    iget-object v3, v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->branchFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    if-eqz v3, :cond_5

    .line 2775
    iget-object v3, v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->branchFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    iget v3, v3, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frameIndex:I

    sub-int/2addr v1, v3

    .line 2778
    :cond_5
    const/4 v3, 0x0

    .line 2779
    .local v3, "enterCount":I
    const/4 v4, 0x0

    .line 2781
    .local v4, "enterFrames":[Lcom/trendmicro/hippo/Interpreter$CallFrame;
    iget-object v5, v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->capturedFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 2782
    .local v5, "x":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-eq v6, v1, :cond_9

    .line 2783
    iget-boolean v7, v5, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    if-nez v7, :cond_6

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2784
    :cond_6
    iget-boolean v7, v5, Lcom/trendmicro/hippo/Interpreter$CallFrame;->useActivation:Z

    if-eqz v7, :cond_8

    .line 2785
    if-nez v4, :cond_7

    .line 2789
    sub-int v7, v1, v6

    new-array v4, v7, [Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 2792
    :cond_7
    aput-object v5, v4, v3

    .line 2793
    add-int/lit8 v3, v3, 0x1

    .line 2795
    :cond_8
    iget-object v5, v5, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 2782
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 2798
    .end local v6    # "i":I
    :cond_9
    :goto_1
    if-eqz v3, :cond_a

    .line 2802
    add-int/lit8 v3, v3, -0x1

    .line 2803
    aget-object v5, v4, v3

    .line 2804
    sget-object v6, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-static {p0, v5, v6, v2}, Lcom/trendmicro/hippo/Interpreter;->enterFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;[Ljava/lang/Object;Z)V

    goto :goto_1

    .line 2811
    :cond_a
    iget-object v2, v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->capturedFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/Interpreter$CallFrame;->cloneFrozen()Lcom/trendmicro/hippo/Interpreter$CallFrame;

    move-result-object p2

    .line 2812
    iget-object v2, v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    iget-wide v6, v0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->resultDbl:D

    invoke-static {p2, v2, v6, v7}, Lcom/trendmicro/hippo/Interpreter;->setCallResult(Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;D)V

    .line 2815
    .end local v0    # "cjump":Lcom/trendmicro/hippo/Interpreter$ContinuationJump;
    .end local v1    # "rewindCount":I
    .end local v3    # "enterCount":I
    .end local v4    # "enterFrames":[Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v5    # "x":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :goto_2
    iput-object p1, p2, Lcom/trendmicro/hippo/Interpreter$CallFrame;->throwable:Ljava/lang/Object;

    .line 2816
    return-object p2
.end method

.method public static restartContinuation(Lcom/trendmicro/hippo/NativeContinuation;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p0, "c"    # Lcom/trendmicro/hippo/NativeContinuation;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1050
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->hasTopCall(Lcom/trendmicro/hippo/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1051
    const/4 v4, 0x0

    iget-boolean v6, p1, Lcom/trendmicro/hippo/Context;->isTopLevelStrict:Z

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/ScriptRuntime;->doTopCall(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 1055
    :cond_0
    array-length v0, p3

    if-nez v0, :cond_1

    .line 1056
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .local v0, "arg":Ljava/lang/Object;
    goto :goto_0

    .line 1058
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_1
    const/4 v0, 0x0

    aget-object v0, p3, v0

    .line 1061
    .restart local v0    # "arg":Ljava/lang/Object;
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeContinuation;->getImplementation()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 1062
    .local v1, "capturedFrame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    if-nez v1, :cond_2

    .line 1064
    return-object v0

    .line 1067
    :cond_2
    new-instance v2, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;-><init>(Lcom/trendmicro/hippo/NativeContinuation;Lcom/trendmicro/hippo/Interpreter$CallFrame;)V

    .line 1069
    .local v2, "cjump":Lcom/trendmicro/hippo/Interpreter$ContinuationJump;
    iput-object v0, v2, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    .line 1070
    invoke-static {p1, v3, v2}, Lcom/trendmicro/hippo/Interpreter;->interpretLoop(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public static resumeGenerator(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "operation"    # I
    .param p3, "savedState"    # Ljava/lang/Object;
    .param p4, "value"    # Ljava/lang/Object;

    .line 1029
    move-object v0, p3

    check-cast v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 1030
    .local v0, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    new-instance v1, Lcom/trendmicro/hippo/Interpreter$GeneratorState;

    invoke-direct {v1, p2, p4}, Lcom/trendmicro/hippo/Interpreter$GeneratorState;-><init>(ILjava/lang/Object;)V

    .line 1031
    .local v1, "generatorState":Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    const/4 v2, 0x2

    if-ne p2, v2, :cond_1

    .line 1033
    :try_start_0
    invoke-static {p0, v0, v1}, Lcom/trendmicro/hippo/Interpreter;->interpretLoop(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 1034
    :catch_0
    move-exception v2

    .line 1036
    .local v2, "e":Ljava/lang/RuntimeException;
    if-ne v2, p4, :cond_0

    .line 1039
    .end local v2    # "e":Ljava/lang/RuntimeException;
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v2

    .line 1037
    .restart local v2    # "e":Ljava/lang/RuntimeException;
    :cond_0
    throw v2

    .line 1041
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :cond_1
    invoke-static {p0, v0, v1}, Lcom/trendmicro/hippo/Interpreter;->interpretLoop(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1042
    .local v2, "result":Ljava/lang/Object;
    iget-object v3, v1, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->returnedException:Ljava/lang/RuntimeException;

    if-nez v3, :cond_2

    .line 1044
    return-object v2

    .line 1043
    :cond_2
    iget-object v3, v1, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->returnedException:Ljava/lang/RuntimeException;

    throw v3
.end method

.method private static setCallResult(Lcom/trendmicro/hippo/Interpreter$CallFrame;Ljava/lang/Object;D)V
    .locals 2
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "callResult"    # Ljava/lang/Object;
    .param p2, "callResultDbl"    # D

    .line 3015
    iget v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedCallOp:I

    const/16 v1, 0x26

    if-ne v0, v1, :cond_0

    .line 3016
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    aput-object p1, v0, v1

    .line 3017
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    iget v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    aput-wide p2, v0, v1

    goto :goto_0

    .line 3018
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedCallOp:I

    const/16 v1, 0x1e

    if-ne v0, v1, :cond_1

    .line 3022
    instance-of v0, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_2

    .line 3023
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    aput-object p1, v0, v1

    goto :goto_0

    .line 3026
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 3028
    :cond_2
    :goto_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedCallOp:I

    .line 3029
    return-void
.end method

.method private static stack_boolean(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)Z
    .locals 8
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "i"    # I

    .line 3107
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v0, v0, p1

    .line 3108
    .local v0, "x":Ljava/lang/Object;
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 3109
    return v2

    .line 3110
    :cond_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const/4 v3, 0x0

    if-ne v0, v1, :cond_1

    .line 3111
    return v3

    .line 3112
    :cond_1
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    const-wide/16 v4, 0x0

    if-ne v0, v1, :cond_3

    .line 3113
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    aget-wide v6, v1, p1

    .line 3114
    .local v6, "d":D
    cmpl-double v1, v6, v6

    if-nez v1, :cond_2

    cmpl-double v1, v6, v4

    if-eqz v1, :cond_2

    goto :goto_0

    :cond_2
    move v2, v3

    :goto_0
    return v2

    .line 3115
    .end local v6    # "d":D
    :cond_3
    if-eqz v0, :cond_8

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v1, :cond_4

    goto :goto_2

    .line 3117
    :cond_4
    instance-of v1, v0, Ljava/lang/Number;

    if-eqz v1, :cond_6

    .line 3118
    move-object v1, v0

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    .line 3119
    .restart local v6    # "d":D
    cmpl-double v1, v6, v6

    if-nez v1, :cond_5

    cmpl-double v1, v6, v4

    if-eqz v1, :cond_5

    goto :goto_1

    :cond_5
    move v2, v3

    :goto_1
    return v2

    .line 3120
    .end local v6    # "d":D
    :cond_6
    instance-of v1, v0, Ljava/lang/Boolean;

    if-eqz v1, :cond_7

    .line 3121
    move-object v1, v0

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 3123
    :cond_7
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 3116
    :cond_8
    :goto_2
    return v3
.end method

.method private static stack_double(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)D
    .locals 4
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "i"    # I

    .line 3098
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v0, v0, p1

    .line 3099
    .local v0, "x":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-eq v0, v1, :cond_0

    .line 3100
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v1

    return-wide v1

    .line 3102
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    aget-wide v2, v1, p1

    return-wide v2
.end method

.method private static stack_int32(Lcom/trendmicro/hippo/Interpreter$CallFrame;I)I
    .locals 4
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "i"    # I

    .line 3089
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v0, v0, p1

    .line 3090
    .local v0, "x":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_0

    .line 3091
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    aget-wide v2, v1, p1

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(D)I

    move-result v1

    return v1

    .line 3093
    :cond_0
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    return v1
.end method

.method private static thawGenerator(Lcom/trendmicro/hippo/Interpreter$CallFrame;ILcom/trendmicro/hippo/Interpreter$GeneratorState;I)Ljava/lang/Object;
    .locals 4
    .param p0, "frame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "stackTop"    # I
    .param p2, "generatorState"    # Lcom/trendmicro/hippo/Interpreter$GeneratorState;
    .param p3, "op"    # I

    .line 2843
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    .line 2844
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    iget v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/Interpreter;->getIndex([BI)I

    move-result v0

    .line 2845
    .local v0, "sourceLine":I
    iget v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    const/4 v2, 0x2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    .line 2846
    iget v1, p2, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->operation:I

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    .line 2849
    new-instance v1, Lcom/trendmicro/hippo/JavaScriptException;

    iget-object v2, p2, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    iget-object v3, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v3, v3, Lcom/trendmicro/hippo/InterpreterData;->itsSourceFile:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v0}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    return-object v1

    .line 2853
    :cond_0
    iget v1, p2, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->operation:I

    if-ne v1, v2, :cond_1

    .line 2854
    iget-object v1, p2, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    return-object v1

    .line 2856
    :cond_1
    iget v1, p2, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->operation:I

    if-nez v1, :cond_3

    .line 2858
    const/16 v1, 0x49

    if-ne p3, v1, :cond_2

    .line 2859
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget-object v2, p2, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    aput-object v2, v1, p1

    .line 2860
    :cond_2
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v1

    .line 2857
    :cond_3
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method public captureStackInfo(Lcom/trendmicro/hippo/HippoException;)V
    .locals 8
    .param p1, "ex"    # Lcom/trendmicro/hippo/HippoException;

    .line 789
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 790
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_8

    iget-object v1, v0, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-nez v1, :cond_0

    goto :goto_5

    .line 798
    :cond_0
    iget-object v1, v0, Lcom/trendmicro/hippo/Context;->previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

    const/4 v2, 0x1

    if-eqz v1, :cond_3

    iget-object v1, v0, Lcom/trendmicro/hippo/Context;->previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

    .line 799
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 803
    :cond_1
    iget-object v1, v0, Lcom/trendmicro/hippo/Context;->previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v1

    .line 804
    .local v1, "previousCount":I
    iget-object v3, v0, Lcom/trendmicro/hippo/Context;->previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ObjArray;->peek()Ljava/lang/Object;

    move-result-object v3

    iget-object v4, v0, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-ne v3, v4, :cond_2

    .line 811
    add-int/lit8 v1, v1, -0x1

    .line 813
    :cond_2
    add-int/lit8 v3, v1, 0x1

    new-array v3, v3, [Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 814
    .local v3, "array":[Lcom/trendmicro/hippo/Interpreter$CallFrame;
    iget-object v4, v0, Lcom/trendmicro/hippo/Context;->previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/ObjArray;->toArray([Ljava/lang/Object;)V

    goto :goto_1

    .line 801
    .end local v1    # "previousCount":I
    .end local v3    # "array":[Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :cond_3
    :goto_0
    new-array v3, v2, [Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 816
    .restart local v3    # "array":[Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :goto_1
    array-length v1, v3

    sub-int/2addr v1, v2

    iget-object v4, v0, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    check-cast v4, Lcom/trendmicro/hippo/Interpreter$CallFrame;

    aput-object v4, v3, v1

    .line 818
    const/4 v1, 0x0

    .line 819
    .local v1, "interpreterFrameCount":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    array-length v5, v3

    if-eq v4, v5, :cond_4

    .line 820
    aget-object v5, v3, v4

    iget v5, v5, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frameIndex:I

    add-int/2addr v5, v2

    add-int/2addr v1, v5

    .line 819
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 823
    .end local v4    # "i":I
    :cond_4
    new-array v2, v1, [I

    .line 826
    .local v2, "linePC":[I
    move v4, v1

    .line 827
    .local v4, "linePCIndex":I
    array-length v5, v3

    .local v5, "i":I
    :goto_3
    if-eqz v5, :cond_6

    .line 828
    add-int/lit8 v5, v5, -0x1

    .line 829
    aget-object v6, v3, v5

    .line 830
    .local v6, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :goto_4
    if-eqz v6, :cond_5

    .line 831
    add-int/lit8 v4, v4, -0x1

    .line 832
    iget v7, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pcSourceLineStart:I

    aput v7, v2, v4

    .line 833
    iget-object v6, v6, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    goto :goto_4

    .line 835
    .end local v6    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :cond_5
    goto :goto_3

    .line 836
    .end local v5    # "i":I
    :cond_6
    if-eqz v4, :cond_7

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 838
    :cond_7
    iput-object v3, p1, Lcom/trendmicro/hippo/HippoException;->interpreterStackInfo:Ljava/lang/Object;

    .line 839
    iput-object v2, p1, Lcom/trendmicro/hippo/HippoException;->interpreterLineData:[I

    .line 840
    return-void

    .line 792
    .end local v1    # "interpreterFrameCount":I
    .end local v2    # "linePC":[I
    .end local v3    # "array":[Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v4    # "linePCIndex":I
    :cond_8
    :goto_5
    const/4 v1, 0x0

    iput-object v1, p1, Lcom/trendmicro/hippo/HippoException;->interpreterStackInfo:Ljava/lang/Object;

    .line 793
    iput-object v1, p1, Lcom/trendmicro/hippo/HippoException;->interpreterLineData:[I

    .line 794
    return-void
.end method

.method public compile(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ast/ScriptNode;Ljava/lang/String;Z)Ljava/lang/Object;
    .locals 2
    .param p1, "compilerEnv"    # Lcom/trendmicro/hippo/CompilerEnvirons;
    .param p2, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;
    .param p3, "encodedSource"    # Ljava/lang/String;
    .param p4, "returnFunction"    # Z

    .line 383
    new-instance v0, Lcom/trendmicro/hippo/CodeGenerator;

    invoke-direct {v0}, Lcom/trendmicro/hippo/CodeGenerator;-><init>()V

    .line 384
    .local v0, "cgen":Lcom/trendmicro/hippo/CodeGenerator;
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/CodeGenerator;->compile(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ast/ScriptNode;Ljava/lang/String;Z)Lcom/trendmicro/hippo/InterpreterData;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/Interpreter;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    .line 385
    return-object v1
.end method

.method public createFunctionObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/Function;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "bytecode"    # Ljava/lang/Object;
    .param p4, "staticSecurityDomain"    # Ljava/lang/Object;

    .line 408
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    if-eq p3, v0, :cond_0

    .line 410
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 412
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    invoke-static {p1, p2, v0, p4}, Lcom/trendmicro/hippo/InterpretedFunction;->createFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/InterpreterData;Ljava/lang/Object;)Lcom/trendmicro/hippo/InterpretedFunction;

    move-result-object v0

    return-object v0
.end method

.method public createScriptObject(Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/Script;
    .locals 1
    .param p1, "bytecode"    # Ljava/lang/Object;
    .param p2, "staticSecurityDomain"    # Ljava/lang/Object;

    .line 391
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    if-eq p1, v0, :cond_0

    .line 393
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 395
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    invoke-static {v0, p2}, Lcom/trendmicro/hippo/InterpretedFunction;->createScript(Lcom/trendmicro/hippo/InterpreterData;Ljava/lang/Object;)Lcom/trendmicro/hippo/InterpretedFunction;

    move-result-object v0

    return-object v0
.end method

.method public getPatchedStack(Lcom/trendmicro/hippo/HippoException;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p1, "ex"    # Lcom/trendmicro/hippo/HippoException;
    .param p2, "nativeStackTrace"    # Ljava/lang/String;

    .line 859
    const-string v0, "com.trendmicro.hippo.Interpreter.interpretLoop"

    .line 860
    .local v0, "tag":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit16 v2, v2, 0x3e8

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 861
    .local v1, "sb":Ljava/lang/StringBuilder;
    const-string v2, "line.separator"

    invoke-static {v2}, Lcom/trendmicro/hippo/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 863
    .local v2, "lineSeparator":Ljava/lang/String;
    iget-object v3, p1, Lcom/trendmicro/hippo/HippoException;->interpreterStackInfo:Ljava/lang/Object;

    check-cast v3, [Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 864
    .local v3, "array":[Lcom/trendmicro/hippo/Interpreter$CallFrame;
    iget-object v4, p1, Lcom/trendmicro/hippo/HippoException;->interpreterLineData:[I

    .line 865
    .local v4, "linePC":[I
    array-length v5, v3

    .line 866
    .local v5, "arrayIndex":I
    array-length v6, v4

    .line 867
    .local v6, "linePCIndex":I
    const/4 v7, 0x0

    .line 868
    .local v7, "offset":I
    :goto_0
    if-eqz v5, :cond_7

    .line 869
    add-int/lit8 v5, v5, -0x1

    .line 870
    invoke-virtual {p2, v0, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v8

    .line 871
    .local v8, "pos":I
    if-gez v8, :cond_0

    .line 872
    goto/16 :goto_4

    .line 876
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    add-int/2addr v8, v9

    .line 878
    :goto_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v9

    if-eq v8, v9, :cond_2

    .line 879
    invoke-virtual {p2, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 880
    .local v9, "c":C
    const/16 v10, 0xa

    if-eq v9, v10, :cond_2

    const/16 v10, 0xd

    if-ne v9, v10, :cond_1

    .line 881
    goto :goto_2

    .line 878
    .end local v9    # "c":C
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 884
    :cond_2
    :goto_2
    invoke-virtual {p2, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 885
    move v7, v8

    .line 887
    aget-object v9, v3, v5

    .line 888
    .local v9, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :goto_3
    if-eqz v9, :cond_6

    .line 889
    if-nez v6, :cond_3

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 890
    :cond_3
    add-int/lit8 v6, v6, -0x1

    .line 891
    iget-object v10, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    .line 892
    .local v10, "idata":Lcom/trendmicro/hippo/InterpreterData;
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 893
    const-string v11, "\tat script"

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 894
    iget-object v11, v10, Lcom/trendmicro/hippo/InterpreterData;->itsName:Ljava/lang/String;

    if-eqz v11, :cond_4

    iget-object v11, v10, Lcom/trendmicro/hippo/InterpreterData;->itsName:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_4

    .line 895
    const/16 v11, 0x2e

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 896
    iget-object v11, v10, Lcom/trendmicro/hippo/InterpreterData;->itsName:Ljava/lang/String;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 898
    :cond_4
    const/16 v11, 0x28

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 899
    iget-object v11, v10, Lcom/trendmicro/hippo/InterpreterData;->itsSourceFile:Ljava/lang/String;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 900
    aget v11, v4, v6

    .line 901
    .local v11, "pc":I
    if-ltz v11, :cond_5

    .line 903
    const/16 v12, 0x3a

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 904
    iget-object v12, v10, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    invoke-static {v12, v11}, Lcom/trendmicro/hippo/Interpreter;->getIndex([BI)I

    move-result v12

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 906
    :cond_5
    const/16 v12, 0x29

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 907
    iget-object v9, v9, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 908
    .end local v10    # "idata":Lcom/trendmicro/hippo/InterpreterData;
    .end local v11    # "pc":I
    goto :goto_3

    .line 909
    .end local v8    # "pos":I
    .end local v9    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :cond_6
    goto :goto_0

    .line 910
    :cond_7
    :goto_4
    invoke-virtual {p2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 912
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method public getScriptStack(Lcom/trendmicro/hippo/HippoException;)Ljava/util/List;
    .locals 11
    .param p1, "ex"    # Lcom/trendmicro/hippo/HippoException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/HippoException;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 917
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/Interpreter;->getScriptStackElements(Lcom/trendmicro/hippo/HippoException;)[[Lcom/trendmicro/hippo/ScriptStackElement;

    move-result-object v0

    .line 918
    .local v0, "stack":[[Lcom/trendmicro/hippo/ScriptStackElement;
    new-instance v1, Ljava/util/ArrayList;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 919
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    nop

    .line 920
    const-string v2, "line.separator"

    invoke-static {v2}, Lcom/trendmicro/hippo/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 921
    .local v2, "lineSeparator":Ljava/lang/String;
    array-length v3, v0

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_1

    aget-object v6, v0, v5

    .line 922
    .local v6, "group":[Lcom/trendmicro/hippo/ScriptStackElement;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 923
    .local v7, "sb":Ljava/lang/StringBuilder;
    array-length v8, v6

    move v9, v4

    :goto_1
    if-ge v9, v8, :cond_0

    aget-object v10, v6, v9

    .line 924
    .local v10, "elem":Lcom/trendmicro/hippo/ScriptStackElement;
    invoke-virtual {v10, v7}, Lcom/trendmicro/hippo/ScriptStackElement;->renderJavaStyle(Ljava/lang/StringBuilder;)V

    .line 925
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 923
    .end local v10    # "elem":Lcom/trendmicro/hippo/ScriptStackElement;
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 927
    :cond_0
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 921
    .end local v6    # "group":[Lcom/trendmicro/hippo/ScriptStackElement;
    .end local v7    # "sb":Ljava/lang/StringBuilder;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 929
    :cond_1
    return-object v1
.end method

.method public getScriptStackElements(Lcom/trendmicro/hippo/HippoException;)[[Lcom/trendmicro/hippo/ScriptStackElement;
    .locals 13
    .param p1, "ex"    # Lcom/trendmicro/hippo/HippoException;

    .line 934
    iget-object v0, p1, Lcom/trendmicro/hippo/HippoException;->interpreterStackInfo:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 935
    const/4 v0, 0x0

    return-object v0

    .line 938
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 940
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<[Lcom/trendmicro/hippo/ScriptStackElement;>;"
    iget-object v1, p1, Lcom/trendmicro/hippo/HippoException;->interpreterStackInfo:Ljava/lang/Object;

    check-cast v1, [Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 941
    .local v1, "array":[Lcom/trendmicro/hippo/Interpreter$CallFrame;
    iget-object v2, p1, Lcom/trendmicro/hippo/HippoException;->interpreterLineData:[I

    .line 942
    .local v2, "linePC":[I
    array-length v3, v1

    .line 943
    .local v3, "arrayIndex":I
    array-length v4, v2

    .line 944
    .local v4, "linePCIndex":I
    :goto_0
    if-eqz v3, :cond_5

    .line 945
    add-int/lit8 v3, v3, -0x1

    .line 946
    aget-object v5, v1, v3

    .line 947
    .local v5, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 948
    .local v6, "group":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ScriptStackElement;>;"
    :goto_1
    if-eqz v5, :cond_4

    .line 949
    if-nez v4, :cond_1

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 950
    :cond_1
    add-int/lit8 v4, v4, -0x1

    .line 951
    iget-object v7, v5, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    .line 952
    .local v7, "idata":Lcom/trendmicro/hippo/InterpreterData;
    iget-object v8, v7, Lcom/trendmicro/hippo/InterpreterData;->itsSourceFile:Ljava/lang/String;

    .line 953
    .local v8, "fileName":Ljava/lang/String;
    const/4 v9, 0x0

    .line 954
    .local v9, "functionName":Ljava/lang/String;
    const/4 v10, -0x1

    .line 955
    .local v10, "lineNumber":I
    aget v11, v2, v4

    .line 956
    .local v11, "pc":I
    if-ltz v11, :cond_2

    .line 957
    iget-object v12, v7, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    invoke-static {v12, v11}, Lcom/trendmicro/hippo/Interpreter;->getIndex([BI)I

    move-result v10

    .line 959
    :cond_2
    iget-object v12, v7, Lcom/trendmicro/hippo/InterpreterData;->itsName:Ljava/lang/String;

    if-eqz v12, :cond_3

    iget-object v12, v7, Lcom/trendmicro/hippo/InterpreterData;->itsName:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-eqz v12, :cond_3

    .line 960
    iget-object v9, v7, Lcom/trendmicro/hippo/InterpreterData;->itsName:Ljava/lang/String;

    .line 962
    :cond_3
    iget-object v5, v5, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 963
    new-instance v12, Lcom/trendmicro/hippo/ScriptStackElement;

    invoke-direct {v12, v8, v9, v10}, Lcom/trendmicro/hippo/ScriptStackElement;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v6, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 964
    .end local v7    # "idata":Lcom/trendmicro/hippo/InterpreterData;
    .end local v8    # "fileName":Ljava/lang/String;
    .end local v9    # "functionName":Ljava/lang/String;
    .end local v10    # "lineNumber":I
    .end local v11    # "pc":I
    goto :goto_1

    .line 965
    :cond_4
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Lcom/trendmicro/hippo/ScriptStackElement;

    invoke-interface {v6, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lcom/trendmicro/hippo/ScriptStackElement;

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 966
    .end local v5    # "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v6    # "group":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ScriptStackElement;>;"
    goto :goto_0

    .line 967
    :cond_5
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [[Lcom/trendmicro/hippo/ScriptStackElement;

    invoke-interface {v0, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [[Lcom/trendmicro/hippo/ScriptStackElement;

    return-object v5
.end method

.method public getSourcePositionFromStack(Lcom/trendmicro/hippo/Context;[I)Ljava/lang/String;
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "linep"    # [I

    .line 845
    iget-object v0, p1, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    check-cast v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 846
    .local v0, "frame":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    iget-object v1, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    .line 847
    .local v1, "idata":Lcom/trendmicro/hippo/InterpreterData;
    iget v2, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pcSourceLineStart:I

    const/4 v3, 0x0

    if-ltz v2, :cond_0

    .line 848
    iget-object v2, v1, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    iget v4, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pcSourceLineStart:I

    invoke-static {v2, v4}, Lcom/trendmicro/hippo/Interpreter;->getIndex([BI)I

    move-result v2

    aput v2, p2, v3

    goto :goto_0

    .line 850
    :cond_0
    aput v3, p2, v3

    .line 852
    :goto_0
    iget-object v2, v1, Lcom/trendmicro/hippo/InterpreterData;->itsSourceFile:Ljava/lang/String;

    return-object v2
.end method

.method public setEvalScriptFlag(Lcom/trendmicro/hippo/Script;)V
    .locals 2
    .param p1, "script"    # Lcom/trendmicro/hippo/Script;

    .line 401
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/InterpretedFunction;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/trendmicro/hippo/InterpreterData;->evalScriptFlag:Z

    .line 402
    return-void
.end method
