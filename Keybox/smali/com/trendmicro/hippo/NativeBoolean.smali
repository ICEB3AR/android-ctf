.class final Lcom/trendmicro/hippo/NativeBoolean;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeBoolean.java"


# static fields
.field private static final BOOLEAN_TAG:Ljava/lang/Object;

.field private static final Id_constructor:I = 0x1

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field private static final Id_valueOf:I = 0x4

.field private static final MAX_PROTOTYPE_ID:I = 0x4

.field private static final serialVersionUID:J = -0x33956cfcac6218e5L


# instance fields
.field private booleanValue:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    const-string v0, "Boolean"

    sput-object v0, Lcom/trendmicro/hippo/NativeBoolean;->BOOLEAN_TAG:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Z)V
    .locals 0
    .param p1, "b"    # Z

    .line 27
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 28
    iput-boolean p1, p0, Lcom/trendmicro/hippo/NativeBoolean;->booleanValue:Z

    .line 29
    return-void
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 22
    new-instance v0, Lcom/trendmicro/hippo/NativeBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/NativeBoolean;-><init>(Z)V

    .line 23
    .local v0, "obj":Lcom/trendmicro/hippo/NativeBoolean;
    const/4 v1, 0x4

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeBoolean;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 24
    return-void
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 65
    sget-object v0, Lcom/trendmicro/hippo/NativeBoolean;->BOOLEAN_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 66
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 68
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 70
    .local v0, "id":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_4

    .line 72
    array-length v2, p5

    if-nez v2, :cond_1

    .line 73
    const/4 v1, 0x0

    .local v1, "b":Z
    goto :goto_1

    .line 75
    .end local v1    # "b":Z
    :cond_1
    const/4 v2, 0x0

    aget-object v3, p5, v2

    instance-of v3, v3, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v3, :cond_2

    aget-object v3, p5, v2

    check-cast v3, Lcom/trendmicro/hippo/ScriptableObject;

    .line 76
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ScriptableObject;->avoidObjectDetection()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 77
    goto :goto_0

    .line 78
    :cond_2
    aget-object v1, p5, v2

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    :goto_0
    nop

    .line 80
    .restart local v1    # "b":Z
    :goto_1
    if-nez p4, :cond_3

    .line 82
    new-instance v2, Lcom/trendmicro/hippo/NativeBoolean;

    invoke-direct {v2, v1}, Lcom/trendmicro/hippo/NativeBoolean;-><init>(Z)V

    return-object v2

    .line 85
    :cond_3
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v2

    return-object v2

    .line 90
    .end local v1    # "b":Z
    :cond_4
    instance-of v1, p4, Lcom/trendmicro/hippo/NativeBoolean;

    if-eqz v1, :cond_a

    .line 92
    move-object v1, p4

    check-cast v1, Lcom/trendmicro/hippo/NativeBoolean;

    iget-boolean v1, v1, Lcom/trendmicro/hippo/NativeBoolean;->booleanValue:Z

    .line 94
    .local v1, "value":Z
    const/4 v2, 0x2

    if-eq v0, v2, :cond_8

    const/4 v2, 0x3

    if-eq v0, v2, :cond_6

    const/4 v2, 0x4

    if-ne v0, v2, :cond_5

    .line 103
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v2

    return-object v2

    .line 105
    :cond_5
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 100
    :cond_6
    if-eqz v1, :cond_7

    const-string v2, "(new Boolean(true))"

    goto :goto_2

    :cond_7
    const-string v2, "(new Boolean(false))"

    :goto_2
    return-object v2

    .line 97
    :cond_8
    if-eqz v1, :cond_9

    const-string v2, "true"

    goto :goto_3

    :cond_9
    const-string v2, "false"

    :goto_3
    return-object v2

    .line 91
    .end local v1    # "value":Z
    :cond_a
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeBoolean;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .line 115
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 116
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 117
    .local v2, "s_length":I
    const/4 v3, 0x7

    if-ne v2, v3, :cond_0

    const-string v1, "valueOf"

    const/4 v0, 0x4

    goto :goto_0

    .line 118
    :cond_0
    const/16 v3, 0x8

    if-ne v2, v3, :cond_2

    .line 119
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 120
    .local v3, "c":I
    const/16 v4, 0x6f

    if-ne v3, v4, :cond_1

    const-string v1, "toSource"

    const/4 v0, 0x3

    goto :goto_0

    .line 121
    :cond_1
    const/16 v4, 0x74

    if-ne v3, v4, :cond_3

    const-string v1, "toString"

    const/4 v0, 0x2

    goto :goto_0

    .line 123
    .end local v3    # "c":I
    :cond_2
    const/16 v3, 0xb

    if-ne v2, v3, :cond_3

    const-string v1, "constructor"

    const/4 v0, 0x1

    .line 124
    :cond_3
    :goto_0
    if-eqz v1, :cond_4

    if-eq v1, p1, :cond_4

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    const/4 v0, 0x0

    .line 128
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_4
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 34
    const-string v0, "Boolean"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 41
    .local p1, "typeHint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_0

    .line 42
    iget-boolean v0, p0, Lcom/trendmicro/hippo/NativeBoolean;->booleanValue:Z

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 43
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 51
    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 55
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "valueOf"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 56
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 53
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 52
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_3
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 58
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/NativeBoolean;->BOOLEAN_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeBoolean;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 59
    return-void
.end method
