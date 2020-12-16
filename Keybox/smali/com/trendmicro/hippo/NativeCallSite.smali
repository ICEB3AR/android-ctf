.class public Lcom/trendmicro/hippo/NativeCallSite;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeCallSite.java"


# static fields
.field private static final CALLSITE_TAG:Ljava/lang/String; = "CallSite"

.field private static final Id_constructor:I = 0x1

.field private static final Id_getColumnNumber:I = 0x9

.field private static final Id_getEvalOrigin:I = 0xa

.field private static final Id_getFileName:I = 0x7

.field private static final Id_getFunction:I = 0x4

.field private static final Id_getFunctionName:I = 0x5

.field private static final Id_getLineNumber:I = 0x8

.field private static final Id_getMethodName:I = 0x6

.field private static final Id_getThis:I = 0x2

.field private static final Id_getTypeName:I = 0x3

.field private static final Id_isConstructor:I = 0xe

.field private static final Id_isEval:I = 0xc

.field private static final Id_isNative:I = 0xd

.field private static final Id_isToplevel:I = 0xb

.field private static final Id_toString:I = 0xf

.field private static final MAX_PROTOTYPE_ID:I = 0xf


# instance fields
.field private element:Lcom/trendmicro/hippo/ScriptStackElement;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 37
    return-void
.end method

.method private static getFileName(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 150
    :goto_0
    if-eqz p0, :cond_0

    instance-of v0, p0, Lcom/trendmicro/hippo/NativeCallSite;

    if-nez v0, :cond_0

    .line 151
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    goto :goto_0

    .line 153
    :cond_0
    if-nez p0, :cond_1

    .line 154
    sget-object v0, Lcom/trendmicro/hippo/NativeCallSite;->NOT_FOUND:Ljava/lang/Object;

    return-object v0

    .line 156
    :cond_1
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeCallSite;

    .line 157
    .local v0, "cs":Lcom/trendmicro/hippo/NativeCallSite;
    iget-object v1, v0, Lcom/trendmicro/hippo/NativeCallSite;->element:Lcom/trendmicro/hippo/ScriptStackElement;

    if-nez v1, :cond_2

    const/4 v1, 0x0

    goto :goto_1

    :cond_2
    iget-object v1, v1, Lcom/trendmicro/hippo/ScriptStackElement;->fileName:Ljava/lang/String;

    :goto_1
    return-object v1
.end method

.method private static getFunctionName(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 138
    :goto_0
    if-eqz p0, :cond_0

    instance-of v0, p0, Lcom/trendmicro/hippo/NativeCallSite;

    if-nez v0, :cond_0

    .line 139
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    goto :goto_0

    .line 141
    :cond_0
    if-nez p0, :cond_1

    .line 142
    sget-object v0, Lcom/trendmicro/hippo/NativeCallSite;->NOT_FOUND:Ljava/lang/Object;

    return-object v0

    .line 144
    :cond_1
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeCallSite;

    .line 145
    .local v0, "cs":Lcom/trendmicro/hippo/NativeCallSite;
    iget-object v1, v0, Lcom/trendmicro/hippo/NativeCallSite;->element:Lcom/trendmicro/hippo/ScriptStackElement;

    if-nez v1, :cond_2

    const/4 v1, 0x0

    goto :goto_1

    :cond_2
    iget-object v1, v1, Lcom/trendmicro/hippo/ScriptStackElement;->functionName:Ljava/lang/String;

    :goto_1
    return-object v1
.end method

.method private static getLineNumber(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 162
    :goto_0
    if-eqz p0, :cond_0

    instance-of v0, p0, Lcom/trendmicro/hippo/NativeCallSite;

    if-nez v0, :cond_0

    .line 163
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    goto :goto_0

    .line 165
    :cond_0
    if-nez p0, :cond_1

    .line 166
    sget-object v0, Lcom/trendmicro/hippo/NativeCallSite;->NOT_FOUND:Ljava/lang/Object;

    return-object v0

    .line 168
    :cond_1
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeCallSite;

    .line 169
    .local v0, "cs":Lcom/trendmicro/hippo/NativeCallSite;
    iget-object v1, v0, Lcom/trendmicro/hippo/NativeCallSite;->element:Lcom/trendmicro/hippo/ScriptStackElement;

    if-eqz v1, :cond_3

    iget v1, v1, Lcom/trendmicro/hippo/ScriptStackElement;->lineNumber:I

    if-gez v1, :cond_2

    goto :goto_1

    .line 172
    :cond_2
    iget-object v1, v0, Lcom/trendmicro/hippo/NativeCallSite;->element:Lcom/trendmicro/hippo/ScriptStackElement;

    iget v1, v1, Lcom/trendmicro/hippo/ScriptStackElement;->lineNumber:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1

    .line 170
    :cond_3
    :goto_1
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 22
    new-instance v0, Lcom/trendmicro/hippo/NativeCallSite;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeCallSite;-><init>()V

    .line 23
    .local v0, "cs":Lcom/trendmicro/hippo/NativeCallSite;
    const/16 v1, 0xf

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeCallSite;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 24
    return-void
.end method

.method private static js_toString(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 124
    :goto_0
    if-eqz p0, :cond_0

    instance-of v0, p0, Lcom/trendmicro/hippo/NativeCallSite;

    if-nez v0, :cond_0

    .line 125
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    goto :goto_0

    .line 127
    :cond_0
    if-nez p0, :cond_1

    .line 128
    sget-object v0, Lcom/trendmicro/hippo/NativeCallSite;->NOT_FOUND:Ljava/lang/Object;

    return-object v0

    .line 130
    :cond_1
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeCallSite;

    .line 131
    .local v0, "cs":Lcom/trendmicro/hippo/NativeCallSite;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    .local v1, "sb":Ljava/lang/StringBuilder;
    iget-object v2, v0, Lcom/trendmicro/hippo/NativeCallSite;->element:Lcom/trendmicro/hippo/ScriptStackElement;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ScriptStackElement;->renderJavaStyle(Ljava/lang/StringBuilder;)V

    .line 133
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method static make(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/NativeCallSite;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "ctorObj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 28
    new-instance v0, Lcom/trendmicro/hippo/NativeCallSite;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeCallSite;-><init>()V

    .line 29
    .local v0, "cs":Lcom/trendmicro/hippo/NativeCallSite;
    const-string v1, "prototype"

    invoke-interface {p1, v1, p1}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    .line 30
    .local v1, "proto":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/NativeCallSite;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 31
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/NativeCallSite;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 32
    return-object v0
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 80
    const-string v0, "CallSite"

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 81
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 83
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 84
    .local v0, "id":I
    packed-switch v0, :pswitch_data_0

    .line 109
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 107
    :pswitch_0
    invoke-static {p4}, Lcom/trendmicro/hippo/NativeCallSite;->js_toString(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 105
    :pswitch_1
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v1

    .line 92
    :pswitch_2
    invoke-static {p4}, Lcom/trendmicro/hippo/NativeCallSite;->getLineNumber(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 90
    :pswitch_3
    invoke-static {p4}, Lcom/trendmicro/hippo/NativeCallSite;->getFileName(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 99
    :pswitch_4
    const/4 v1, 0x0

    return-object v1

    .line 88
    :pswitch_5
    invoke-static {p4}, Lcom/trendmicro/hippo/NativeCallSite;->getFunctionName(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 97
    :pswitch_6
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 86
    :pswitch_7
    invoke-static {p3, p1}, Lcom/trendmicro/hippo/NativeCallSite;->make(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/NativeCallSite;

    move-result-object v1

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_6
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 6
    .param p1, "s"    # Ljava/lang/String;

    .line 182
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 183
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x3

    const/16 v4, 0x74

    const/16 v5, 0x69

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 203
    :pswitch_1
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 204
    .local v2, "c":I
    const/16 v3, 0x43

    if-ne v2, v3, :cond_0

    const-string v1, "getColumnNumber"

    const/16 v0, 0x9

    goto/16 :goto_0

    .line 205
    :cond_0
    const/16 v3, 0x46

    if-ne v2, v3, :cond_a

    const-string v1, "getFunctionName"

    const/4 v0, 0x5

    goto/16 :goto_0

    .line 197
    .end local v2    # "c":I
    :pswitch_2
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x45

    if-eq v2, v3, :cond_4

    const/16 v3, 0x6f

    if-eq v2, v3, :cond_3

    const/16 v3, 0x4c

    if-eq v2, v3, :cond_2

    const/16 v3, 0x4d

    if-eq v2, v3, :cond_1

    .line 202
    goto :goto_0

    .line 200
    :cond_1
    const-string v1, "getMethodName"

    const/4 v0, 0x6

    goto :goto_0

    .line 199
    :cond_2
    const-string v1, "getLineNumber"

    const/16 v0, 0x8

    goto :goto_0

    .line 201
    :cond_3
    const-string v1, "isConstructor"

    const/16 v0, 0xe

    goto :goto_0

    .line 198
    :cond_4
    const-string v1, "getEvalOrigin"

    const/16 v0, 0xa

    goto :goto_0

    .line 191
    :pswitch_3
    const/4 v2, 0x4

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v5, :cond_8

    const/16 v3, 0x79

    if-eq v2, v3, :cond_7

    if-eq v2, v4, :cond_6

    const/16 v3, 0x75

    if-eq v2, v3, :cond_5

    .line 196
    goto :goto_0

    .line 194
    :cond_5
    const-string v1, "getFunction"

    const/4 v0, 0x4

    goto :goto_0

    .line 193
    :cond_6
    const-string v1, "constructor"

    const/4 v0, 0x1

    goto :goto_0

    .line 195
    :cond_7
    const-string v1, "getTypeName"

    const/4 v0, 0x3

    goto :goto_0

    .line 192
    :cond_8
    const-string v1, "getFileName"

    const/4 v0, 0x7

    goto :goto_0

    .line 190
    :pswitch_4
    const-string v1, "isToplevel"

    const/16 v0, 0xb

    goto :goto_0

    .line 186
    :pswitch_5
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 187
    .restart local v2    # "c":I
    if-ne v2, v5, :cond_9

    const-string v1, "isNative"

    const/16 v0, 0xd

    goto :goto_0

    .line 188
    :cond_9
    if-ne v2, v4, :cond_a

    const-string v1, "toString"

    const/16 v0, 0xf

    goto :goto_0

    .line 185
    .end local v2    # "c":I
    :pswitch_6
    const-string v1, "getThis"

    const/4 v0, 0x2

    goto :goto_0

    .line 184
    :pswitch_7
    const-string v1, "isEval"

    const/16 v0, 0xc

    .line 208
    :cond_a
    :goto_0
    if-eqz v1, :cond_b

    if-eq v1, p1, :cond_b

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b

    const/4 v0, 0x0

    .line 212
    .end local v1    # "X":Ljava/lang/String;
    :cond_b
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 47
    const-string v0, "CallSite"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 55
    packed-switch p1, :pswitch_data_0

    .line 71
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :pswitch_0
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "toString"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 69
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "isConstructor"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 68
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "isNative"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 67
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "isEval"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 66
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "isToplevel"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 65
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getEvalOrigin"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 64
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getColumnNumber"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 63
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getLineNumber"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 62
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_8
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getFileName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 61
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_9
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getMethodName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 60
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getFunctionName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 59
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_b
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getFunction"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 58
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_c
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getTypeName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 57
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_d
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getThis"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 56
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 73
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    const-string v2, "CallSite"

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeCallSite;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 74
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method setElement(Lcom/trendmicro/hippo/ScriptStackElement;)V
    .locals 0
    .param p1, "elt"    # Lcom/trendmicro/hippo/ScriptStackElement;

    .line 41
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeCallSite;->element:Lcom/trendmicro/hippo/ScriptStackElement;

    .line 42
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeCallSite;->element:Lcom/trendmicro/hippo/ScriptStackElement;

    if-nez v0, :cond_0

    .line 117
    const-string v0, ""

    return-object v0

    .line 119
    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ScriptStackElement;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
