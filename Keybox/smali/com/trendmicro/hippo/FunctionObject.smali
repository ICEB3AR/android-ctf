.class public Lcom/trendmicro/hippo/FunctionObject;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "FunctionObject.java"


# static fields
.field public static final JAVA_BOOLEAN_TYPE:I = 0x3

.field public static final JAVA_DOUBLE_TYPE:I = 0x4

.field public static final JAVA_INT_TYPE:I = 0x2

.field public static final JAVA_OBJECT_TYPE:I = 0x6

.field public static final JAVA_SCRIPTABLE_TYPE:I = 0x5

.field public static final JAVA_STRING_TYPE:I = 0x1

.field public static final JAVA_UNSUPPORTED_TYPE:I = 0x0

.field private static final VARARGS_CTOR:S = -0x2s

.field private static final VARARGS_METHOD:S = -0x1s

.field private static sawSecurityException:Z = false

.field private static final serialVersionUID:J = -0x4a002e39945f012bL


# instance fields
.field private functionName:Ljava/lang/String;

.field private transient hasVoidReturn:Z

.field private isStatic:Z

.field member:Lcom/trendmicro/hippo/MemberBox;

.field private parmsLength:I

.field private transient returnTypeTag:I

.field private transient typeTags:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/reflect/Member;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "methodOrConstructor"    # Ljava/lang/reflect/Member;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 88
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 89
    instance-of v0, p2, Ljava/lang/reflect/Constructor;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 90
    new-instance v0, Lcom/trendmicro/hippo/MemberBox;

    move-object v2, p2

    check-cast v2, Ljava/lang/reflect/Constructor;

    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/MemberBox;-><init>(Ljava/lang/reflect/Constructor;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    .line 91
    iput-boolean v1, p0, Lcom/trendmicro/hippo/FunctionObject;->isStatic:Z

    goto :goto_0

    .line 93
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/MemberBox;

    move-object v2, p2

    check-cast v2, Ljava/lang/reflect/Method;

    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/MemberBox;-><init>(Ljava/lang/reflect/Method;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    .line 94
    invoke-virtual {v0}, Lcom/trendmicro/hippo/MemberBox;->isStatic()Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/FunctionObject;->isStatic:Z

    .line 96
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/MemberBox;->getName()Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "methodName":Ljava/lang/String;
    iput-object p1, p0, Lcom/trendmicro/hippo/FunctionObject;->functionName:Ljava/lang/String;

    .line 98
    iget-object v2, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    iget-object v2, v2, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 99
    .local v2, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v3, v2

    .line 100
    .local v3, "arity":I
    const/4 v4, 0x4

    if-ne v3, v4, :cond_5

    aget-object v4, v2, v1

    invoke-virtual {v4}, Ljava/lang/Class;->isArray()Z

    move-result v4

    const/4 v5, 0x2

    if-nez v4, :cond_1

    aget-object v4, v2, v5

    invoke-virtual {v4}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 102
    :cond_1
    aget-object v4, v2, v1

    invoke-virtual {v4}, Ljava/lang/Class;->isArray()Z

    move-result v4

    const/4 v6, 0x3

    const/4 v7, 0x0

    if-eqz v4, :cond_3

    .line 103
    iget-boolean v4, p0, Lcom/trendmicro/hippo/FunctionObject;->isStatic:Z

    if-eqz v4, :cond_2

    aget-object v4, v2, v7

    sget-object v7, Lcom/trendmicro/hippo/ScriptRuntime;->ContextClass:Ljava/lang/Class;

    if-ne v4, v7, :cond_2

    aget-object v4, v2, v1

    .line 105
    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    sget-object v7, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne v4, v7, :cond_2

    aget-object v4, v2, v5

    sget-object v5, Lcom/trendmicro/hippo/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    if-ne v4, v5, :cond_2

    aget-object v4, v2, v6

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v4, v5, :cond_2

    .line 112
    const/4 v4, -0x2

    iput v4, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    goto :goto_2

    .line 109
    :cond_2
    const-string v1, "msg.varargs.ctor"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 114
    :cond_3
    iget-boolean v4, p0, Lcom/trendmicro/hippo/FunctionObject;->isStatic:Z

    if-eqz v4, :cond_4

    aget-object v4, v2, v7

    sget-object v7, Lcom/trendmicro/hippo/ScriptRuntime;->ContextClass:Ljava/lang/Class;

    if-ne v4, v7, :cond_4

    aget-object v4, v2, v1

    sget-object v7, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-ne v4, v7, :cond_4

    aget-object v4, v2, v5

    .line 117
    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    sget-object v5, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne v4, v5, :cond_4

    aget-object v4, v2, v6

    sget-object v5, Lcom/trendmicro/hippo/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    if-ne v4, v5, :cond_4

    .line 123
    const/4 v4, -0x1

    iput v4, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    goto :goto_2

    .line 120
    :cond_4
    const-string v1, "msg.varargs.fun"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 126
    :cond_5
    iput v3, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    .line 127
    if-lez v3, :cond_7

    .line 128
    new-array v4, v3, [B

    iput-object v4, p0, Lcom/trendmicro/hippo/FunctionObject;->typeTags:[B

    .line 129
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-eq v4, v3, :cond_7

    .line 130
    aget-object v5, v2, v4

    invoke-static {v5}, Lcom/trendmicro/hippo/FunctionObject;->getTypeTag(Ljava/lang/Class;)I

    move-result v5

    .line 131
    .local v5, "tag":I
    if-eqz v5, :cond_6

    .line 135
    iget-object v6, p0, Lcom/trendmicro/hippo/FunctionObject;->typeTags:[B

    int-to-byte v7, v5

    aput-byte v7, v6, v4

    .line 129
    .end local v5    # "tag":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 132
    .restart local v5    # "tag":I
    :cond_6
    aget-object v1, v2, v4

    .line 133
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 132
    const-string v6, "msg.bad.parms"

    invoke-static {v6, v1, v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 140
    .end local v4    # "i":I
    .end local v5    # "tag":I
    :cond_7
    :goto_2
    iget-object v4, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/MemberBox;->isMethod()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 141
    iget-object v4, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v4

    .line 142
    .local v4, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    .line 143
    .local v5, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v6, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v5, v6, :cond_8

    .line 144
    iput-boolean v1, p0, Lcom/trendmicro/hippo/FunctionObject;->hasVoidReturn:Z

    goto :goto_3

    .line 146
    :cond_8
    invoke-static {v5}, Lcom/trendmicro/hippo/FunctionObject;->getTypeTag(Ljava/lang/Class;)I

    move-result v1

    iput v1, p0, Lcom/trendmicro/hippo/FunctionObject;->returnTypeTag:I

    .line 148
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_3
    goto :goto_4

    .line 149
    :cond_9
    iget-object v1, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    .line 150
    .local v1, "ctorType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v4, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    invoke-virtual {v4, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 156
    .end local v1    # "ctorType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_4
    invoke-static {p0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->setFunctionProtoAndParent(Lcom/trendmicro/hippo/BaseFunction;Lcom/trendmicro/hippo/Scriptable;)V

    .line 157
    return-void

    .line 151
    .restart local v1    # "ctorType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_a
    nop

    .line 152
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 151
    const-string v5, "msg.bad.ctor.return"

    invoke-static {v5, v4}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v4

    throw v4
.end method

.method public static convertArg(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "arg"    # Ljava/lang/Object;
    .param p3, "typeTag"    # I

    .line 188
    packed-switch p3, :pswitch_data_0

    .line 211
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 209
    :pswitch_0
    return-object p2

    .line 207
    :pswitch_1
    invoke-static {p0, p2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 203
    :pswitch_2
    instance-of v0, p2, Ljava/lang/Double;

    if-eqz v0, :cond_0

    .line 204
    return-object p2

    .line 205
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    .line 198
    :pswitch_3
    instance-of v0, p2, Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    .line 199
    return-object p2

    .line 200
    :cond_1
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 201
    :cond_2
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 200
    :goto_0
    return-object v0

    .line 194
    :pswitch_4
    instance-of v0, p2, Ljava/lang/Integer;

    if-eqz v0, :cond_3

    .line 195
    return-object p2

    .line 196
    :cond_3
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 190
    :pswitch_5
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_4

    .line 191
    return-object p2

    .line 192
    :cond_4
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static convertArg(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "arg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Context;",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 356
    .local p3, "desired":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p3}, Lcom/trendmicro/hippo/FunctionObject;->getTypeTag(Ljava/lang/Class;)I

    move-result v0

    .line 357
    .local v0, "tag":I
    if-eqz v0, :cond_0

    .line 361
    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/FunctionObject;->convertArg(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 358
    :cond_0
    nop

    .line 359
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "msg.cant.convert"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1
.end method

.method static findSingleMethod([Ljava/lang/reflect/Method;Ljava/lang/String;)Ljava/lang/reflect/Method;
    .locals 6
    .param p0, "methods"    # [Ljava/lang/reflect/Method;
    .param p1, "name"    # Ljava/lang/String;

    .line 253
    const/4 v0, 0x0

    .line 254
    .local v0, "found":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v2, p0

    .local v2, "N":I
    :goto_0
    if-eq v1, v2, :cond_2

    .line 255
    aget-object v3, p0, v1

    .line 256
    .local v3, "method":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 257
    if-nez v0, :cond_0

    .line 262
    move-object v0, v3

    goto :goto_1

    .line 258
    :cond_0
    nop

    .line 260
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 258
    const-string v5, "msg.no.overload"

    invoke-static {v5, p1, v4}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v4

    throw v4

    .line 254
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 265
    .end local v1    # "i":I
    .end local v2    # "N":I
    :cond_2
    return-object v0
.end method

.method static getMethodList(Ljava/lang/Class;)[Ljava/lang/reflect/Method;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)[",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 277
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 281
    .local v0, "methods":[Ljava/lang/reflect/Method;
    :try_start_0
    sget-boolean v1, Lcom/trendmicro/hippo/FunctionObject;->sawSecurityException:Z

    if-nez v1, :cond_0

    .line 282
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 286
    :cond_0
    goto :goto_0

    .line 283
    :catch_0
    move-exception v1

    .line 285
    .local v1, "e":Ljava/lang/SecurityException;
    const/4 v2, 0x1

    sput-boolean v2, Lcom/trendmicro/hippo/FunctionObject;->sawSecurityException:Z

    .line 287
    .end local v1    # "e":Ljava/lang/SecurityException;
    :goto_0
    if-nez v0, :cond_1

    .line 288
    invoke-virtual {p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .line 290
    :cond_1
    const/4 v1, 0x0

    .line 291
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v3, v0

    if-ge v2, v3, :cond_4

    .line 292
    sget-boolean v3, Lcom/trendmicro/hippo/FunctionObject;->sawSecurityException:Z

    if-eqz v3, :cond_2

    aget-object v3, v0, v2

    .line 293
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v3, p0, :cond_3

    goto :goto_2

    :cond_2
    aget-object v3, v0, v2

    .line 294
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v3

    if-nez v3, :cond_3

    .line 296
    :goto_2
    const/4 v3, 0x0

    aput-object v3, v0, v2

    goto :goto_3

    .line 298
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 291
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 301
    .end local v2    # "i":I
    :cond_4
    new-array v2, v1, [Ljava/lang/reflect/Method;

    .line 302
    .local v2, "result":[Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    .line 303
    .local v3, "j":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_4
    array-length v5, v0

    if-ge v4, v5, :cond_6

    .line 304
    aget-object v5, v0, v4

    if-eqz v5, :cond_5

    .line 305
    add-int/lit8 v5, v3, 0x1

    .end local v3    # "j":I
    .local v5, "j":I
    aget-object v6, v0, v4

    aput-object v6, v2, v3

    move v3, v5

    .line 303
    .end local v5    # "j":I
    .restart local v3    # "j":I
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 307
    .end local v4    # "i":I
    :cond_6
    return-object v2
.end method

.method public static getTypeTag(Ljava/lang/Class;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)I"
        }
    .end annotation

    .line 166
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_0

    .line 167
    const/4 v0, 0x1

    return v0

    .line 168
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->IntegerClass:Ljava/lang/Class;

    if-eq p0, v0, :cond_8

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_1

    goto :goto_2

    .line 170
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-eq p0, v0, :cond_7

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_2

    goto :goto_1

    .line 172
    :cond_2
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->DoubleClass:Ljava/lang/Class;

    if-eq p0, v0, :cond_6

    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_3

    goto :goto_0

    .line 174
    :cond_3
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 175
    const/4 v0, 0x5

    return v0

    .line 176
    :cond_4
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_5

    .line 177
    const/4 v0, 0x6

    return v0

    .line 182
    :cond_5
    const/4 v0, 0x0

    return v0

    .line 173
    :cond_6
    :goto_0
    const/4 v0, 0x4

    return v0

    .line 171
    :cond_7
    :goto_1
    const/4 v0, 0x3

    return v0

    .line 169
    :cond_8
    :goto_2
    const/4 v0, 0x2

    return v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 4
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 511
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 512
    iget v0, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    if-lez v0, :cond_0

    .line 513
    iget-object v0, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    iget-object v0, v0, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 514
    .local v0, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    iget v1, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/trendmicro/hippo/FunctionObject;->typeTags:[B

    .line 515
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    if-eq v1, v2, :cond_0

    .line 516
    iget-object v2, p0, Lcom/trendmicro/hippo/FunctionObject;->typeTags:[B

    aget-object v3, v0, v1

    invoke-static {v3}, Lcom/trendmicro/hippo/FunctionObject;->getTypeTag(Ljava/lang/Class;)I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    .line 515
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 519
    .end local v0    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v1    # "i":I
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/MemberBox;->isMethod()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 520
    iget-object v0, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v0

    .line 521
    .local v0, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    .line 522
    .local v1, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v2, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_1

    .line 523
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/trendmicro/hippo/FunctionObject;->hasVoidReturn:Z

    goto :goto_1

    .line 525
    :cond_1
    invoke-static {v1}, Lcom/trendmicro/hippo/FunctionObject;->getTypeTag(Ljava/lang/Class;)I

    move-result v2

    iput v2, p0, Lcom/trendmicro/hippo/FunctionObject;->returnTypeTag:I

    .line 528
    .end local v0    # "method":Ljava/lang/reflect/Method;
    .end local v1    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public addAsConstructor(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "prototype"    # Lcom/trendmicro/hippo/Scriptable;

    .line 328
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/FunctionObject;->initAsConstructor(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V

    .line 329
    invoke-interface {p2}, Lcom/trendmicro/hippo/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {p1, v0, p0, v1}, Lcom/trendmicro/hippo/FunctionObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 331
    return-void
.end method

.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 378
    const/4 v0, 0x0

    .line 379
    .local v0, "checkMethodResult":Z
    array-length v1, p4

    .line 381
    .local v1, "argsLength":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 383
    aget-object v3, p4, v2

    instance-of v3, v3, Lcom/trendmicro/hippo/ConsString;

    if-eqz v3, :cond_0

    .line 384
    aget-object v3, p4, v2

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, p4, v2

    .line 381
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 388
    .end local v2    # "i":I
    :cond_1
    iget v2, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    const/4 v3, 0x0

    if-gez v2, :cond_6

    .line 389
    const/4 v4, -0x1

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x4

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-ne v2, v4, :cond_2

    .line 390
    new-array v2, v7, [Ljava/lang/Object;

    aput-object p1, v2, v8

    aput-object p3, v2, v9

    aput-object p4, v2, v6

    aput-object p0, v2, v5

    .line 391
    .local v2, "invokeArgs":[Ljava/lang/Object;
    iget-object v4, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v4, v3, v2}, Lcom/trendmicro/hippo/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 392
    .local v4, "result":Ljava/lang/Object;
    const/4 v0, 0x1

    .line 393
    .end local v2    # "invokeArgs":[Ljava/lang/Object;
    goto/16 :goto_9

    .line 394
    .end local v4    # "result":Ljava/lang/Object;
    :cond_2
    if-nez p3, :cond_3

    move v2, v9

    goto :goto_1

    :cond_3
    move v2, v8

    .line 395
    .local v2, "inNewExpr":Z
    :goto_1
    if-eqz v2, :cond_4

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_2

    :cond_4
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 396
    .local v4, "b":Ljava/lang/Boolean;
    :goto_2
    new-array v7, v7, [Ljava/lang/Object;

    aput-object p1, v7, v8

    aput-object p4, v7, v9

    aput-object p0, v7, v6

    aput-object v4, v7, v5

    move-object v5, v7

    .line 397
    .local v5, "invokeArgs":[Ljava/lang/Object;
    iget-object v6, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/MemberBox;->isCtor()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 398
    iget-object v6, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v6, v5}, Lcom/trendmicro/hippo/MemberBox;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    goto :goto_3

    .line 399
    :cond_5
    iget-object v6, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v6, v3, v5}, Lcom/trendmicro/hippo/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    :goto_3
    move-object v4, v6

    .line 400
    .end local v2    # "inNewExpr":Z
    .end local v5    # "invokeArgs":[Ljava/lang/Object;
    .local v4, "result":Ljava/lang/Object;
    goto/16 :goto_9

    .line 403
    .end local v4    # "result":Ljava/lang/Object;
    :cond_6
    iget-boolean v2, p0, Lcom/trendmicro/hippo/FunctionObject;->isStatic:Z

    if-nez v2, :cond_9

    .line 404
    iget-object v2, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v2

    .line 405
    .local v2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v2, p3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    .line 406
    const/4 v4, 0x0

    .line 407
    .local v4, "compatible":Z
    if-ne p3, p2, :cond_7

    .line 408
    invoke-virtual {p0}, Lcom/trendmicro/hippo/FunctionObject;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    .line 409
    .local v5, "parentScope":Lcom/trendmicro/hippo/Scriptable;
    if-eq p2, v5, :cond_7

    .line 412
    invoke-virtual {v2, v5}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    .line 413
    if-eqz v4, :cond_7

    .line 414
    move-object p3, v5

    .line 418
    .end local v5    # "parentScope":Lcom/trendmicro/hippo/Scriptable;
    :cond_7
    if-eqz v4, :cond_8

    goto :goto_4

    .line 420
    :cond_8
    iget-object v3, p0, Lcom/trendmicro/hippo/FunctionObject;->functionName:Ljava/lang/String;

    const-string v5, "msg.incompat.call"

    invoke-static {v5, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v3

    throw v3

    .line 427
    .end local v2    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "compatible":Z
    :cond_9
    :goto_4
    iget v2, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    if-ne v2, v1, :cond_d

    .line 430
    move-object v2, p4

    .line 431
    .local v2, "invokeArgs":[Ljava/lang/Object;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_5
    iget v5, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    if-eq v4, v5, :cond_c

    .line 432
    aget-object v5, p4, v4

    .line 433
    .local v5, "arg":Ljava/lang/Object;
    iget-object v6, p0, Lcom/trendmicro/hippo/FunctionObject;->typeTags:[B

    aget-byte v6, v6, v4

    invoke-static {p1, p2, v5, v6}, Lcom/trendmicro/hippo/FunctionObject;->convertArg(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v6

    .line 434
    .local v6, "converted":Ljava/lang/Object;
    if-eq v5, v6, :cond_b

    .line 435
    if-ne v2, p4, :cond_a

    .line 436
    invoke-virtual {p4}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v7

    move-object v2, v7

    check-cast v2, [Ljava/lang/Object;

    .line 438
    :cond_a
    aput-object v6, v2, v4

    .line 431
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v6    # "converted":Ljava/lang/Object;
    :cond_b
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .end local v4    # "i":I
    :cond_c
    goto :goto_8

    .line 441
    .end local v2    # "invokeArgs":[Ljava/lang/Object;
    :cond_d
    if-nez v2, :cond_e

    .line 442
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .restart local v2    # "invokeArgs":[Ljava/lang/Object;
    goto :goto_8

    .line 444
    .end local v2    # "invokeArgs":[Ljava/lang/Object;
    :cond_e
    new-array v2, v2, [Ljava/lang/Object;

    .line 445
    .restart local v2    # "invokeArgs":[Ljava/lang/Object;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_6
    iget v5, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    if-eq v4, v5, :cond_10

    .line 446
    if-ge v4, v1, :cond_f

    .line 447
    aget-object v5, p4, v4

    goto :goto_7

    .line 448
    :cond_f
    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_7
    nop

    .line 449
    .restart local v5    # "arg":Ljava/lang/Object;
    iget-object v6, p0, Lcom/trendmicro/hippo/FunctionObject;->typeTags:[B

    aget-byte v6, v6, v4

    invoke-static {p1, p2, v5, v6}, Lcom/trendmicro/hippo/FunctionObject;->convertArg(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v2, v4

    .line 445
    .end local v5    # "arg":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 453
    .end local v4    # "i":I
    :cond_10
    :goto_8
    iget-object v4, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/MemberBox;->isMethod()Z

    move-result v4

    if-eqz v4, :cond_11

    .line 454
    iget-object v4, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v4, p3, v2}, Lcom/trendmicro/hippo/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 455
    .local v4, "result":Ljava/lang/Object;
    const/4 v0, 0x1

    goto :goto_9

    .line 457
    .end local v4    # "result":Ljava/lang/Object;
    :cond_11
    iget-object v4, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v4, v2}, Lcom/trendmicro/hippo/MemberBox;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 462
    .end local v2    # "invokeArgs":[Ljava/lang/Object;
    .restart local v4    # "result":Ljava/lang/Object;
    :goto_9
    if-eqz v0, :cond_13

    .line 463
    iget-boolean v2, p0, Lcom/trendmicro/hippo/FunctionObject;->hasVoidReturn:Z

    if-eqz v2, :cond_12

    .line 464
    sget-object v4, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_a

    .line 465
    :cond_12
    iget v2, p0, Lcom/trendmicro/hippo/FunctionObject;->returnTypeTag:I

    if-nez v2, :cond_13

    .line 466
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v2

    invoke-virtual {v2, p1, p2, v4, v3}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    .line 474
    :cond_13
    :goto_a
    return-object v4
.end method

.method public createObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 485
    iget-object v0, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/MemberBox;->isCtor()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    const/4 v1, -0x2

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 490
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 493
    .local v0, "result":Lcom/trendmicro/hippo/Scriptable;
    nop

    .line 495
    invoke-virtual {p0}, Lcom/trendmicro/hippo/FunctionObject;->getClassPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/Scriptable;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 496
    invoke-virtual {p0}, Lcom/trendmicro/hippo/FunctionObject;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/Scriptable;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 497
    return-object v0

    .line 491
    .end local v0    # "result":Lcom/trendmicro/hippo/Scriptable;
    :catch_0
    move-exception v0

    .line 492
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 486
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getArity()I
    .locals 1

    .line 222
    iget v0, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public getFunctionName()Ljava/lang/String;
    .locals 1

    .line 236
    iget-object v0, p0, Lcom/trendmicro/hippo/FunctionObject;->functionName:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    :cond_0
    return-object v0
.end method

.method public getLength()I
    .locals 1

    .line 230
    invoke-virtual {p0}, Lcom/trendmicro/hippo/FunctionObject;->getArity()I

    move-result v0

    return v0
.end method

.method public getMethodOrConstructor()Ljava/lang/reflect/Member;
    .locals 1

    .line 244
    iget-object v0, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/MemberBox;->isMethod()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 245
    iget-object v0, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0

    .line 247
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/FunctionObject;->member:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/MemberBox;->ctor()Ljava/lang/reflect/Constructor;

    move-result-object v0

    return-object v0
.end method

.method initAsConstructor(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "prototype"    # Lcom/trendmicro/hippo/Scriptable;

    .line 335
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->setFunctionProtoAndParent(Lcom/trendmicro/hippo/BaseFunction;Lcom/trendmicro/hippo/Scriptable;)V

    .line 336
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/FunctionObject;->setImmunePrototypeProperty(Ljava/lang/Object;)V

    .line 338
    invoke-interface {p2, p0}, Lcom/trendmicro/hippo/Scriptable;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 340
    const-string v0, "constructor"

    const/4 v1, 0x7

    invoke-static {p2, v0, p0, v1}, Lcom/trendmicro/hippo/FunctionObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 344
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/FunctionObject;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 345
    return-void
.end method

.method isVarArgsConstructor()Z
    .locals 2

    .line 505
    iget v0, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    const/4 v1, -0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isVarArgsMethod()Z
    .locals 2

    .line 501
    iget v0, p0, Lcom/trendmicro/hippo/FunctionObject;->parmsLength:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
