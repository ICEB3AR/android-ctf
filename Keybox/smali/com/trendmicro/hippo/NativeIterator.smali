.class public final Lcom/trendmicro/hippo/NativeIterator;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeIterator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/NativeIterator$StopIteration;,
        Lcom/trendmicro/hippo/NativeIterator$WrappedJavaIterator;
    }
.end annotation


# static fields
.field public static final ITERATOR_PROPERTY_NAME:Ljava/lang/String; = "__iterator__"

.field private static final ITERATOR_TAG:Ljava/lang/Object;

.field private static final Id___iterator__:I = 0x3

.field private static final Id_constructor:I = 0x1

.field private static final Id_next:I = 0x2

.field private static final MAX_PROTOTYPE_ID:I = 0x3

.field private static final STOP_ITERATION:Ljava/lang/String; = "StopIteration"

.field private static final serialVersionUID:J = -0x396976a99d923961L


# instance fields
.field private objectIterator:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-string v0, "Iterator"

    sput-object v0, Lcom/trendmicro/hippo/NativeIterator;->ITERATOR_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 46
    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .param p1, "objectIterator"    # Ljava/lang/Object;

    .line 48
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeIterator;->objectIterator:Ljava/lang/Object;

    .line 50
    return-void
.end method

.method private static getJavaIterator(Ljava/lang/Object;)Ljava/util/Iterator;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Iterator<",
            "*>;"
        }
    .end annotation

    .line 199
    instance-of v0, p0, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v0, :cond_2

    .line 200
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    .line 201
    .local v0, "unwrapped":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 202
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    instance-of v2, v0, Ljava/util/Iterator;

    if-eqz v2, :cond_0

    .line 203
    move-object v1, v0

    check-cast v1, Ljava/util/Iterator;

    .line 204
    :cond_0
    instance-of v2, v0, Ljava/lang/Iterable;

    if-eqz v2, :cond_1

    .line 205
    move-object v2, v0

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 206
    :cond_1
    return-object v1

    .line 208
    .end local v0    # "unwrapped":Ljava/lang/Object;
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getStopIterationObject(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 61
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 62
    .local v0, "top":Lcom/trendmicro/hippo/Scriptable;
    sget-object v1, Lcom/trendmicro/hippo/NativeIterator;->ITERATOR_TAG:Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopScopeValue(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method static init(Lcom/trendmicro/hippo/ScriptableObject;Z)V
    .locals 4
    .param p0, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p1, "sealed"    # Z

    .line 23
    new-instance v0, Lcom/trendmicro/hippo/NativeIterator;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeIterator;-><init>()V

    .line 24
    .local v0, "iterator":Lcom/trendmicro/hippo/NativeIterator;
    const/4 v1, 0x3

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeIterator;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 27
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeGenerator;->init(Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/NativeGenerator;

    .line 30
    new-instance v1, Lcom/trendmicro/hippo/NativeIterator$StopIteration;

    invoke-direct {v1}, Lcom/trendmicro/hippo/NativeIterator$StopIteration;-><init>()V

    .line 31
    .local v1, "obj":Lcom/trendmicro/hippo/NativeObject;
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeIterator;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/NativeObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 32
    invoke-virtual {v1, p0}, Lcom/trendmicro/hippo/NativeObject;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 33
    if-eqz p1, :cond_0

    invoke-virtual {v1}, Lcom/trendmicro/hippo/NativeObject;->sealObject()V

    .line 34
    :cond_0
    const/4 v2, 0x2

    const-string v3, "StopIteration"

    invoke-static {p0, v3, v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 39
    sget-object v2, Lcom/trendmicro/hippo/NativeIterator;->ITERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, v1}, Lcom/trendmicro/hippo/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    return-void
.end method

.method private static jsConstructor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 139
    array-length v0, p3

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    aget-object v0, p3, v1

    if-eqz v0, :cond_5

    aget-object v0, p3, v1

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v2, :cond_0

    goto :goto_1

    .line 146
    :cond_0
    aget-object v0, p3, v1

    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 147
    .local v0, "obj":Lcom/trendmicro/hippo/Scriptable;
    array-length v2, p3

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    aget-object v2, p3, v3

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    move v1, v3

    .line 148
    .local v1, "keyOnly":Z
    :cond_1
    if-eqz p2, :cond_3

    .line 154
    invoke-static {v0}, Lcom/trendmicro/hippo/NativeIterator;->getJavaIterator(Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object v2

    .line 155
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    if-eqz v2, :cond_2

    .line 156
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p1

    .line 157
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v3

    new-instance v4, Lcom/trendmicro/hippo/NativeIterator$WrappedJavaIterator;

    invoke-direct {v4, v2, p1}, Lcom/trendmicro/hippo/NativeIterator$WrappedJavaIterator;-><init>(Ljava/util/Iterator;Lcom/trendmicro/hippo/Scriptable;)V

    const-class v5, Lcom/trendmicro/hippo/NativeIterator$WrappedJavaIterator;

    invoke-virtual {v3, p0, p1, v4, v5}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 163
    :cond_2
    invoke-static {p0, p1, v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toIterator(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    .line 165
    .local v4, "jsIterator":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v4, :cond_3

    .line 166
    return-object v4

    .line 172
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v4    # "jsIterator":Lcom/trendmicro/hippo/Scriptable;
    :cond_3
    nop

    .line 173
    if-eqz v1, :cond_4

    const/4 v2, 0x3

    goto :goto_0

    .line 174
    :cond_4
    const/4 v2, 0x5

    .line 172
    :goto_0
    invoke-static {v0, p0, p1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->enumInit(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v2

    .line 175
    .local v2, "objectIterator":Ljava/lang/Object;
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->setEnumNumbers(Ljava/lang/Object;Z)V

    .line 176
    new-instance v3, Lcom/trendmicro/hippo/NativeIterator;

    invoke-direct {v3, v2}, Lcom/trendmicro/hippo/NativeIterator;-><init>(Ljava/lang/Object;)V

    .line 177
    .local v3, "result":Lcom/trendmicro/hippo/NativeIterator;
    nop

    .line 178
    invoke-virtual {v3}, Lcom/trendmicro/hippo/NativeIterator;->getClassName()Ljava/lang/String;

    move-result-object v4

    .line 177
    invoke-static {p1, v4}, Lcom/trendmicro/hippo/ScriptableObject;->getClassPrototype(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/NativeIterator;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 179
    invoke-virtual {v3, p1}, Lcom/trendmicro/hippo/NativeIterator;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 180
    return-object v3

    .line 142
    .end local v0    # "obj":Lcom/trendmicro/hippo/Scriptable;
    .end local v1    # "keyOnly":Z
    .end local v2    # "objectIterator":Ljava/lang/Object;
    .end local v3    # "result":Lcom/trendmicro/hippo/NativeIterator;
    :cond_5
    :goto_1
    array-length v0, p3

    if-nez v0, :cond_6

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_2

    :cond_6
    aget-object v0, p3, v1

    .line 143
    .local v0, "argument":Ljava/lang/Object;
    :goto_2
    nop

    .line 144
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 143
    const-string v2, "msg.no.properties"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method private next(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 184
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeIterator;->objectIterator:Ljava/lang/Object;

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->enumNext(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v0

    .line 185
    .local v0, "b":Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 190
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeIterator;->objectIterator:Ljava/lang/Object;

    invoke-static {v1, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->enumId(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 187
    :cond_0
    new-instance v1, Lcom/trendmicro/hippo/JavaScriptException;

    .line 188
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeIterator;->getStopIterationObject(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v1
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 107
    sget-object v0, Lcom/trendmicro/hippo/NativeIterator;->ITERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 108
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 110
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 112
    .local v0, "id":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 113
    invoke-static {p2, p3, p4, p5}, Lcom/trendmicro/hippo/NativeIterator;->jsConstructor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 116
    :cond_1
    instance-of v1, p4, Lcom/trendmicro/hippo/NativeIterator;

    if-eqz v1, :cond_4

    .line 119
    move-object v1, p4

    check-cast v1, Lcom/trendmicro/hippo/NativeIterator;

    .line 121
    .local v1, "iterator":Lcom/trendmicro/hippo/NativeIterator;
    const/4 v2, 0x2

    if-eq v0, v2, :cond_3

    const/4 v2, 0x3

    if-ne v0, v2, :cond_2

    .line 128
    return-object p4

    .line 131
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 124
    :cond_3
    invoke-direct {v1, p2, p3}, Lcom/trendmicro/hippo/NativeIterator;->next(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 117
    .end local v1    # "iterator":Lcom/trendmicro/hippo/NativeIterator;
    :cond_4
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeIterator;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 241
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 242
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 243
    .local v2, "s_length":I
    const/4 v3, 0x4

    if-ne v2, v3, :cond_0

    const-string v1, "next"

    const/4 v0, 0x2

    goto :goto_0

    .line 244
    :cond_0
    const/16 v3, 0xb

    if-ne v2, v3, :cond_1

    const-string v1, "constructor"

    const/4 v0, 0x1

    goto :goto_0

    .line 245
    :cond_1
    const/16 v3, 0xc

    if-ne v2, v3, :cond_2

    const-string v1, "__iterator__"

    const/4 v0, 0x3

    .line 246
    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    if-eq v1, p1, :cond_3

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v0, 0x0

    .line 250
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_3
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 87
    const-string v0, "Iterator"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 94
    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 97
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "__iterator__"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 98
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "next"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 95
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 100
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/NativeIterator;->ITERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeIterator;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 101
    return-void
.end method
