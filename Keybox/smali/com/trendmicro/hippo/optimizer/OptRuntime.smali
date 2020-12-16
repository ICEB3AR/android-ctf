.class public final Lcom/trendmicro/hippo/optimizer/OptRuntime;
.super Lcom/trendmicro/hippo/ScriptRuntime;
.source "OptRuntime.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;
    }
.end annotation


# static fields
.field public static final minusOneObj:Ljava/lang/Double;

.field public static final oneObj:Ljava/lang/Double;

.field public static final zeroObj:Ljava/lang/Double;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 26
    new-instance v0, Ljava/lang/Double;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lcom/trendmicro/hippo/optimizer/OptRuntime;->zeroObj:Ljava/lang/Double;

    .line 27
    new-instance v0, Ljava/lang/Double;

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lcom/trendmicro/hippo/optimizer/OptRuntime;->oneObj:Ljava/lang/Double;

    .line 28
    new-instance v0, Ljava/lang/Double;

    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lcom/trendmicro/hippo/optimizer/OptRuntime;->minusOneObj:Ljava/lang/Double;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/trendmicro/hippo/ScriptRuntime;-><init>()V

    return-void
.end method

.method public static add(DLjava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p0, "val1"    # D
    .param p2, "val2"    # Ljava/lang/Object;

    .line 112
    instance-of v0, p2, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    .line 113
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    .line 114
    :cond_0
    instance-of v0, p2, Ljava/lang/CharSequence;

    if-nez v0, :cond_1

    .line 115
    invoke-static {p2}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    add-double/2addr v0, p0

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->wrapDouble(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    .line 116
    :cond_1
    new-instance v0, Lcom/trendmicro/hippo/ConsString;

    invoke-static {p0, p1}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v1

    move-object v2, p2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-object v0
.end method

.method public static add(Ljava/lang/Object;D)Ljava/lang/Object;
    .locals 3
    .param p0, "val1"    # Ljava/lang/Object;
    .param p1, "val2"    # D

    .line 103
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    .line 104
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 105
    :cond_0
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-nez v0, :cond_1

    .line 106
    invoke-static {p0}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    add-double/2addr v0, p1

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->wrapDouble(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    .line 107
    :cond_1
    new-instance v0, Lcom/trendmicro/hippo/ConsString;

    move-object v1, p0

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {p1, p2}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-object v0
.end method

.method public static bindThis(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Function;
    .locals 1
    .param p0, "fn"    # Lcom/trendmicro/hippo/NativeFunction;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 151
    new-instance v0, Lcom/trendmicro/hippo/ArrowFunction;

    invoke-direct {v0, p1, p2, p0, p3}, Lcom/trendmicro/hippo/ArrowFunction;-><init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;)V

    return-object v0
.end method

.method public static call0(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p0, "fun"    # Lcom/trendmicro/hippo/Callable;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 36
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {p0, p2, p3, p1, v0}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static call1(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "fun"    # Lcom/trendmicro/hippo/Callable;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "arg0"    # Ljava/lang/Object;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 45
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-interface {p0, p3, p4, p1, v0}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static call2(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "fun"    # Lcom/trendmicro/hippo/Callable;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "arg0"    # Ljava/lang/Object;
    .param p3, "arg1"    # Ljava/lang/Object;
    .param p4, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p5, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 55
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    invoke-interface {p0, p4, p5, p1, v0}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static callN(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p0, "fun"    # Lcom/trendmicro/hippo/Callable;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 65
    invoke-interface {p0, p3, p4, p1, p2}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static callName([Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 74
    invoke-static {p1, p2, p3}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->getNameFunctionAndThis(Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v0

    .line 75
    .local v0, "f":Lcom/trendmicro/hippo/Callable;
    invoke-static {p2}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 76
    .local v1, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v0, p2, p3, v1, p0}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public static callName0(Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 85
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->getNameFunctionAndThis(Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v0

    .line 86
    .local v0, "f":Lcom/trendmicro/hippo/Callable;
    invoke-static {p1}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 87
    .local v1, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v0, p1, p2, v1, v2}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public static callProp0(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 96
    invoke-static {p0, p1, p2, p3}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v0

    .line 97
    .local v0, "f":Lcom/trendmicro/hippo/Callable;
    invoke-static {p2}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 98
    .local v1, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v0, p2, p3, v1, v2}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public static callSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/String;I)Ljava/lang/Object;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "fun"    # Lcom/trendmicro/hippo/Callable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "callerThis"    # Lcom/trendmicro/hippo/Scriptable;
    .param p6, "callType"    # I
    .param p7, "fileName"    # Ljava/lang/String;
    .param p8, "lineNumber"    # I

    .line 160
    invoke-static/range {p0 .. p8}, Lcom/trendmicro/hippo/ScriptRuntime;->callSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static createNativeGenerator(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;II)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "funObj"    # Lcom/trendmicro/hippo/NativeFunction;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "maxLocals"    # I
    .param p4, "maxStack"    # I

    .line 261
    new-instance v0, Lcom/trendmicro/hippo/NativeGenerator;

    new-instance v1, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;

    invoke-direct {v1, p2, p3, p4}, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;-><init>(Lcom/trendmicro/hippo/Scriptable;II)V

    invoke-direct {v0, p1, p0, v1}, Lcom/trendmicro/hippo/NativeGenerator;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeFunction;Ljava/lang/Object;)V

    return-object v0
.end method

.method private static decodeIntArray(Ljava/lang/String;I)[I
    .locals 6
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "arraySize"    # I

    .line 208
    if-nez p1, :cond_1

    .line 209
    if-nez p0, :cond_0

    .line 210
    const/4 v0, 0x0

    return-object v0

    .line 209
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 212
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    mul-int/lit8 v1, p1, 0x2

    const/4 v2, 0x1

    add-int/2addr v1, v2

    if-eq v0, v1, :cond_3

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v2, :cond_2

    goto :goto_0

    .line 213
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 215
    :cond_3
    :goto_0
    new-array v0, p1, [I

    .line 216
    .local v0, "array":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-eq v1, p1, :cond_4

    .line 217
    mul-int/lit8 v3, v1, 0x2

    add-int/2addr v3, v2

    .line 218
    .local v3, "shift":I
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    shl-int/lit8 v4, v4, 0x10

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    or-int/2addr v4, v5

    aput v4, v0, v1

    .line 216
    .end local v3    # "shift":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 220
    .end local v1    # "i":I
    :cond_4
    return-object v0
.end method

.method public static elemIncrDecr(Ljava/lang/Object;DLcom/trendmicro/hippo/Context;I)Ljava/lang/Object;
    .locals 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "index"    # D
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p4, "incrDecrMask"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 126
    invoke-static {p3}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->elemIncrDecr(Ljava/lang/Object;DLcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static elemIncrDecr(Ljava/lang/Object;DLcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "index"    # D
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "incrDecrMask"    # I

    .line 133
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {p0, v0, p3, p4, p5}, Lcom/trendmicro/hippo/ScriptRuntime;->elemIncrDecr(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static encodeIntArray([I)Ljava/lang/String;
    .locals 8
    .param p0, "array"    # [I

    .line 192
    if-nez p0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 193
    :cond_0
    array-length v0, p0

    .line 194
    .local v0, "n":I
    mul-int/lit8 v1, v0, 0x2

    const/4 v2, 0x1

    add-int/2addr v1, v2

    new-array v1, v1, [C

    .line 195
    .local v1, "buffer":[C
    const/4 v3, 0x0

    aput-char v2, v1, v3

    .line 196
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-eq v3, v0, :cond_1

    .line 197
    aget v4, p0, v3

    .line 198
    .local v4, "value":I
    mul-int/lit8 v5, v3, 0x2

    add-int/2addr v5, v2

    .line 199
    .local v5, "shift":I
    ushr-int/lit8 v6, v4, 0x10

    int-to-char v6, v6

    aput-char v6, v1, v5

    .line 200
    add-int/lit8 v6, v5, 0x1

    int-to-char v7, v4

    aput-char v7, v1, v6

    .line 196
    .end local v4    # "value":I
    .end local v5    # "shift":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 202
    .end local v3    # "i":I
    :cond_1
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([C)V

    return-object v2
.end method

.method public static getGeneratorLocalsState(Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;

    .line 273
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;

    .line 274
    .local v0, "rgs":Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;
    iget-object v1, v0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;->localsState:[Ljava/lang/Object;

    if-nez v1, :cond_0

    .line 275
    iget v1, v0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;->maxLocals:I

    new-array v1, v1, [Ljava/lang/Object;

    iput-object v1, v0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;->localsState:[Ljava/lang/Object;

    .line 276
    :cond_0
    iget-object v1, v0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;->localsState:[Ljava/lang/Object;

    return-object v1
.end method

.method public static getGeneratorStackState(Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;

    .line 266
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;

    .line 267
    .local v0, "rgs":Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;
    iget-object v1, v0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;->stackState:[Ljava/lang/Object;

    if-nez v1, :cond_0

    .line 268
    iget v1, v0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;->maxStack:I

    new-array v1, v1, [Ljava/lang/Object;

    iput-object v1, v0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;->stackState:[Ljava/lang/Object;

    .line 269
    :cond_0
    iget-object v1, v0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;->stackState:[Ljava/lang/Object;

    return-object v1
.end method

.method public static initFunction(Lcom/trendmicro/hippo/NativeFunction;ILcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Context;)V
    .locals 1
    .param p0, "fn"    # Lcom/trendmicro/hippo/NativeFunction;
    .param p1, "functionType"    # I
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 146
    const/4 v0, 0x0

    invoke-static {p3, p2, p0, p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->initFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeFunction;IZ)V

    .line 147
    return-void
.end method

.method private static synthetic lambda$main$0([Ljava/lang/String;Lcom/trendmicro/hippo/Script;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 5
    .param p0, "args"    # [Ljava/lang/String;
    .param p1, "script"    # Lcom/trendmicro/hippo/Script;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 236
    invoke-static {p2}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->getGlobal(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    .line 240
    .local v0, "global":Lcom/trendmicro/hippo/ScriptableObject;
    array-length v1, p0

    new-array v1, v1, [Ljava/lang/Object;

    .line 241
    .local v1, "argsCopy":[Ljava/lang/Object;
    array-length v2, p0

    const/4 v3, 0x0

    invoke-static {p0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 242
    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 243
    .local v2, "argsObj":Lcom/trendmicro/hippo/Scriptable;
    const-string v3, "arguments"

    const/4 v4, 0x2

    invoke-virtual {v0, v3, v2, v4}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 245
    invoke-interface {p1, p2, v0}, Lcom/trendmicro/hippo/Script;->exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    .line 246
    const/4 v3, 0x0

    return-object v3
.end method

.method public static main(Lcom/trendmicro/hippo/Script;[Ljava/lang/String;)V
    .locals 2
    .param p0, "script"    # Lcom/trendmicro/hippo/Script;
    .param p1, "args"    # [Ljava/lang/String;

    .line 235
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    #disallowed odex opcode
    #iput-object-volatile v0, p0, Landroid/app/Notification;->category:Ljava/lang/String;
    nop

    new-array v0, v0, Landroid/graphics/drawable/VectorDrawable;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ContextFactory;->call(Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;

    .line 248
    return-void
.end method

.method public static newArrayLiteral([Ljava/lang/Object;Ljava/lang/String;ILcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "objects"    # [Ljava/lang/Object;
    .param p1, "encodedInts"    # Ljava/lang/String;
    .param p2, "skipCount"    # I
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 229
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->decodeIntArray(Ljava/lang/String;I)[I

    move-result-object v0

    .line 230
    .local v0, "skipIndexces":[I
    invoke-static {p0, v0, p3, p4}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->newArrayLiteral([Ljava/lang/Object;[ILcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method public static newObjectSpecial(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;[Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "fun"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "callerThis"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "callType"    # I

    .line 169
    invoke-static {p0, p1, p2, p3, p5}, Lcom/trendmicro/hippo/ScriptRuntime;->newSpecial(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;[Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static padStart([Ljava/lang/Object;I)[Ljava/lang/Object;
    .locals 3
    .param p0, "currentArgs"    # [Ljava/lang/Object;
    .param p1, "count"    # I

    .line 138
    array-length v0, p0

    add-int/2addr v0, p1

    new-array v0, v0, [Ljava/lang/Object;

    .line 139
    .local v0, "result":[Ljava/lang/Object;
    array-length v1, p0

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, p1, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 140
    return-object v0
.end method

.method public static throwStopIteration(Ljava/lang/Object;)V
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;

    .line 251
    new-instance v0, Lcom/trendmicro/hippo/JavaScriptException;

    move-object v1, p0

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    .line 252
    invoke-static {v1}, Lcom/trendmicro/hippo/NativeIterator;->getStopIterationObject(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, ""

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v0
.end method

.method public static wrapDouble(D)Ljava/lang/Double;
    .locals 5
    .param p0, "num"    # D

    .line 174
    const-wide/16 v0, 0x0

    cmpl-double v2, p0, v0

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    if-nez v2, :cond_0

    .line 175
    div-double/2addr v3, p0

    cmpl-double v0, v3, v0

    if-lez v0, :cond_3

    .line 177
    sget-object v0, Lcom/trendmicro/hippo/optimizer/OptRuntime;->zeroObj:Ljava/lang/Double;

    return-object v0

    .line 179
    :cond_0
    cmpl-double v0, p0, v3

    if-nez v0, :cond_1

    .line 180
    sget-object v0, Lcom/trendmicro/hippo/optimizer/OptRuntime;->oneObj:Ljava/lang/Double;

    return-object v0

    .line 181
    :cond_1
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    cmpl-double v0, p0, v0

    if-nez v0, :cond_2

    .line 182
    sget-object v0, Lcom/trendmicro/hippo/optimizer/OptRuntime;->minusOneObj:Ljava/lang/Double;

    return-object v0

    .line 183
    :cond_2
    cmpl-double v0, p0, p0

    if-eqz v0, :cond_3

    .line 184
    sget-object v0, Lcom/trendmicro/hippo/optimizer/OptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v0

    .line 186
    :cond_3
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method
