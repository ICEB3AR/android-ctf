.class Lcom/trendmicro/hippo/NativeScript;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "NativeScript.java"


# static fields
.field private static final Id_compile:I = 0x3

.field private static final Id_constructor:I = 0x1

.field private static final Id_exec:I = 0x4

.field private static final Id_toString:I = 0x2

.field private static final MAX_PROTOTYPE_ID:I = 0x4

.field private static final SCRIPT_TAG:Ljava/lang/Object;

.field private static final serialVersionUID:J = -0x5e4d0c813cab5264L


# instance fields
.field private script:Lcom/trendmicro/hippo/Script;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    const-string v0, "Script"

    sput-object v0, Lcom/trendmicro/hippo/NativeScript;->SCRIPT_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Lcom/trendmicro/hippo/Script;)V
    .locals 0
    .param p1, "script"    # Lcom/trendmicro/hippo/Script;

    .line 36
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeScript;->script:Lcom/trendmicro/hippo/Script;

    .line 38
    return-void
.end method

.method private static compile(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/Script;
    .locals 11
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "source"    # Ljava/lang/String;

    .line 151
    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    aput v2, v1, v2

    .line 152
    .local v1, "linep":[I
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v3

    .line 153
    .local v3, "filename":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 154
    const-string v3, "<Script object>"

    .line 155
    aput v0, v1, v2

    .line 158
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/DefaultErrorReporter;->forEval(Lcom/trendmicro/hippo/ErrorReporter;)Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v0

    .line 159
    .local v0, "reporter":Lcom/trendmicro/hippo/ErrorReporter;
    const/4 v6, 0x0

    aget v9, v1, v2

    const/4 v10, 0x0

    move-object v4, p0

    move-object v5, p1

    move-object v7, v0

    move-object v8, v3

    invoke-virtual/range {v4 .. v10}, Lcom/trendmicro/hippo/Context;->compileString(Ljava/lang/String;Lcom/trendmicro/hippo/Evaluator;Lcom/trendmicro/hippo/ErrorReporter;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v2

    return-object v2
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 31
    new-instance v0, Lcom/trendmicro/hippo/NativeScript;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/NativeScript;-><init>(Lcom/trendmicro/hippo/Script;)V

    .line 32
    .local v0, "obj":Lcom/trendmicro/hippo/NativeScript;
    const/4 v1, 0x4

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeScript;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 33
    return-void
.end method

.method private static realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeScript;
    .locals 1
    .param p0, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 144
    instance-of v0, p0, Lcom/trendmicro/hippo/NativeScript;

    if-eqz v0, :cond_0

    .line 146
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeScript;

    return-object v0

    .line 145
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeScript;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 53
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeScript;->script:Lcom/trendmicro/hippo/Script;

    if-eqz v0, :cond_0

    .line 54
    invoke-interface {v0, p1, p2}, Lcom/trendmicro/hippo/Script;->exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 56
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0
.end method

.method public construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 62
    const-string v0, "msg.script.is.not.constructor"

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method decompile(II)Ljava/lang/String;
    .locals 2
    .param p1, "indent"    # I
    .param p2, "flags"    # I

    .line 80
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeScript;->script:Lcom/trendmicro/hippo/Script;

    instance-of v1, v0, Lcom/trendmicro/hippo/NativeFunction;

    if-eqz v1, :cond_0

    .line 81
    check-cast v0, Lcom/trendmicro/hippo/NativeFunction;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/NativeFunction;->decompile(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 83
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/BaseFunction;->decompile(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 105
    sget-object v0, Lcom/trendmicro/hippo/NativeScript;->SCRIPT_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 106
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/BaseFunction;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 108
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 109
    .local v0, "id":I
    const/4 v1, 0x1

    const-string v2, ""

    const/4 v3, 0x0

    if-eq v0, v1, :cond_5

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    .line 139
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 128
    :cond_1
    const-string v1, "msg.cant.call.indirect"

    const-string v2, "exec"

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 133
    :cond_2
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/NativeScript;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeScript;

    move-result-object v1

    .line 134
    .local v1, "real":Lcom/trendmicro/hippo/NativeScript;
    invoke-static {p5, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v2

    .line 135
    .local v2, "source":Ljava/lang/String;
    invoke-static {p2, v2}, Lcom/trendmicro/hippo/NativeScript;->compile(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/Script;

    move-result-object v3

    iput-object v3, v1, Lcom/trendmicro/hippo/NativeScript;->script:Lcom/trendmicro/hippo/Script;

    .line 136
    return-object v1

    .line 121
    .end local v1    # "real":Lcom/trendmicro/hippo/NativeScript;
    .end local v2    # "source":Ljava/lang/String;
    :cond_3
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/NativeScript;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeScript;

    move-result-object v1

    .line 122
    .restart local v1    # "real":Lcom/trendmicro/hippo/NativeScript;
    iget-object v4, v1, Lcom/trendmicro/hippo/NativeScript;->script:Lcom/trendmicro/hippo/Script;

    .line 123
    .local v4, "realScript":Lcom/trendmicro/hippo/Script;
    if-nez v4, :cond_4

    return-object v2

    .line 124
    :cond_4
    invoke-virtual {p2, v4, v3}, Lcom/trendmicro/hippo/Context;->decompileScript(Lcom/trendmicro/hippo/Script;I)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 111
    .end local v1    # "real":Lcom/trendmicro/hippo/NativeScript;
    .end local v4    # "realScript":Lcom/trendmicro/hippo/Script;
    :cond_5
    array-length v1, p5

    if-nez v1, :cond_6

    .line 112
    goto :goto_0

    .line 113
    :cond_6
    aget-object v1, p5, v3

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    move-object v1, v2

    .line 114
    .local v1, "source":Ljava/lang/String;
    invoke-static {p2, v1}, Lcom/trendmicro/hippo/NativeScript;->compile(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/Script;

    move-result-object v2

    .line 115
    .local v2, "script":Lcom/trendmicro/hippo/Script;
    new-instance v3, Lcom/trendmicro/hippo/NativeScript;

    invoke-direct {v3, v2}, Lcom/trendmicro/hippo/NativeScript;-><init>(Lcom/trendmicro/hippo/Script;)V

    .line 116
    .local v3, "nscript":Lcom/trendmicro/hippo/NativeScript;
    invoke-static {v3, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;)V

    .line 117
    return-object v3
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 170
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 171
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x4

    if-eq v2, v3, :cond_3

    const/16 v3, 0xb

    if-eq v2, v3, :cond_2

    const/4 v3, 0x7

    if-eq v2, v3, :cond_1

    const/16 v3, 0x8

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 174
    :cond_0
    const-string v1, "toString"

    const/4 v0, 0x2

    goto :goto_0

    .line 173
    :cond_1
    const-string v1, "compile"

    const/4 v0, 0x3

    goto :goto_0

    .line 175
    :cond_2
    const-string v1, "constructor"

    const/4 v0, 0x1

    goto :goto_0

    .line 172
    :cond_3
    const-string v1, "exec"

    const/4 v0, 0x4

    .line 177
    :goto_0
    if-eqz v1, :cond_4

    if-eq v1, p1, :cond_4

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    const/4 v0, 0x0

    .line 181
    .end local v1    # "X":Ljava/lang/String;
    :cond_4
    return v0
.end method

.method public getArity()I
    .locals 1

    .line 74
    const/4 v0, 0x0

    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 46
    const-string v0, "Script"

    return-object v0
.end method

.method public getLength()I
    .locals 1

    .line 68
    const/4 v0, 0x0

    return v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 91
    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 94
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "exec"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 96
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "compile"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 93
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 92
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_3
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 98
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/NativeScript;->SCRIPT_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeScript;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 99
    return-void
.end method
