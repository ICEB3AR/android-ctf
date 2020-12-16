.class public Lcom/trendmicro/hippo/NativeWeakSet;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeWeakSet.java"


# static fields
.field private static final Id_add:I = 0x2

.field private static final Id_constructor:I = 0x1

.field private static final Id_delete:I = 0x3

.field private static final Id_has:I = 0x4

.field private static final MAP_TAG:Ljava/lang/Object;

.field private static final MAX_PROTOTYPE_ID:I = 0x5

.field private static final SymbolId_toStringTag:I = 0x5


# instance fields
.field private instanceOfWeakSet:Z

.field private transient map:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 23
    const-string v0, "WeakSet"

    sput-object v0, Lcom/trendmicro/hippo/NativeWeakSet;->MAP_TAG:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 20
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/NativeWeakSet;->instanceOfWeakSet:Z

    .line 27
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeWeakSet;->map:Ljava/util/WeakHashMap;

    return-void
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 30
    new-instance v0, Lcom/trendmicro/hippo/NativeWeakSet;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeWeakSet;-><init>()V

    .line 31
    .local v0, "m":Lcom/trendmicro/hippo/NativeWeakSet;
    const/4 v1, 0x5

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeWeakSet;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 32
    return-void
.end method

.method private js_add(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;

    .line 73
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isObject(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWeakSet;->map:Ljava/util/WeakHashMap;

    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    return-object p0

    .line 74
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "msg.arg.not.object"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private js_delete(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 83
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isObject(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 84
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWeakSet;->map:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 87
    .local v0, "oldVal":Ljava/lang/Object;
    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method

.method private js_has(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 91
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isObject(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 92
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWeakSet;->map:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .param p1, "stream"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 177
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 178
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeWeakSet;->map:Ljava/util/WeakHashMap;

    .line 179
    return-void
.end method

.method private realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeWeakSet;
    .locals 2
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 98
    if-eqz p1, :cond_1

    .line 102
    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeWeakSet;

    .line 103
    .local v0, "ns":Lcom/trendmicro/hippo/NativeWeakSet;
    iget-boolean v1, v0, Lcom/trendmicro/hippo/NativeWeakSet;->instanceOfWeakSet:Z

    if-eqz v1, :cond_0

    .line 107
    return-object v0

    .line 105
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeWeakSet;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    .end local p1    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local p2    # "f":Lcom/trendmicro/hippo/IdFunctionObject;
    throw v1
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    .end local v0    # "ns":Lcom/trendmicro/hippo/NativeWeakSet;
    .restart local p1    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local p2    # "f":Lcom/trendmicro/hippo/IdFunctionObject;
    :catch_0
    move-exception v0

    .line 109
    .local v0, "cce":Ljava/lang/ClassCastException;
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeWeakSet;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 99
    .end local v0    # "cce":Ljava/lang/ClassCastException;
    :cond_1
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeWeakSet;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 43
    sget-object v0, Lcom/trendmicro/hippo/NativeWeakSet;->MAP_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 44
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 46
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 47
    .local v0, "id":I
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_7

    const/4 v1, 0x2

    if-eq v0, v1, :cond_5

    const/4 v1, 0x3

    if-eq v0, v1, :cond_3

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    .line 63
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeWeakSet;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeWeakSet;

    move-result-object v1

    array-length v3, p5

    if-lez v3, :cond_1

    aget-object v2, p5, v2

    goto :goto_0

    :cond_1
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_0
    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/NativeWeakSet;->js_has(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 65
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "WeakMap.prototype has no method: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 61
    :cond_3
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeWeakSet;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeWeakSet;

    move-result-object v1

    array-length v3, p5

    if-lez v3, :cond_4

    aget-object v2, p5, v2

    goto :goto_1

    :cond_4
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_1
    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/NativeWeakSet;->js_delete(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 59
    :cond_5
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeWeakSet;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeWeakSet;

    move-result-object v1

    array-length v3, p5

    if-lez v3, :cond_6

    aget-object v2, p5, v2

    goto :goto_2

    :cond_6
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_2
    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/NativeWeakSet;->js_add(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 49
    :cond_7
    if-nez p4, :cond_9

    .line 50
    new-instance v3, Lcom/trendmicro/hippo/NativeWeakSet;

    invoke-direct {v3}, Lcom/trendmicro/hippo/NativeWeakSet;-><init>()V

    .line 51
    .local v3, "ns":Lcom/trendmicro/hippo/NativeWeakSet;
    iput-boolean v1, v3, Lcom/trendmicro/hippo/NativeWeakSet;->instanceOfWeakSet:Z

    .line 52
    array-length v1, p5

    if-lez v1, :cond_8

    .line 53
    aget-object v1, p5, v2

    invoke-static {p2, p3, v3, v1}, Lcom/trendmicro/hippo/NativeSet;->loadFromIterable(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/Object;)V

    .line 55
    :cond_8
    return-object v3

    .line 57
    .end local v3    # "ns":Lcom/trendmicro/hippo/NativeWeakSet;
    :cond_9
    const-string v1, "msg.no.new"

    const-string v2, "WeakSet"

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method protected findPrototypeId(Lcom/trendmicro/hippo/Symbol;)I
    .locals 1
    .param p1, "k"    # Lcom/trendmicro/hippo/Symbol;

    .line 136
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    const/4 v0, 0x5

    return v0

    .line 139
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 8
    .param p1, "s"    # Ljava/lang/String;

    .line 148
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 149
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 150
    .local v2, "s_length":I
    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    .line 151
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 152
    .local v3, "c":I
    const/4 v4, 0x1

    const/4 v5, 0x2

    const/16 v6, 0x61

    if-ne v3, v6, :cond_0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x64

    if-ne v5, v6, :cond_3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_3

    const/4 v0, 0x2

    goto :goto_1

    .line 153
    :cond_0
    const/16 v7, 0x68

    if-ne v3, v7, :cond_3

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v7, 0x73

    if-ne v5, v7, :cond_3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_3

    const/4 v0, 0x4

    goto :goto_1

    .line 155
    .end local v3    # "c":I
    :cond_1
    const/4 v3, 0x6

    if-ne v2, v3, :cond_2

    const-string v1, "delete"

    const/4 v0, 0x3

    goto :goto_0

    .line 156
    :cond_2
    const/16 v3, 0xb

    if-ne v2, v3, :cond_3

    const-string v1, "constructor"

    const/4 v0, 0x1

    .line 157
    :cond_3
    :goto_0
    if-eqz v1, :cond_4

    if-eq v1, p1, :cond_4

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    const/4 v0, 0x0

    .line 161
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_4
    :goto_1
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 36
    const-string v0, "WeakSet"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 10
    .param p1, "id"    # I

    .line 115
    const/4 v0, 0x3

    const/4 v1, 0x5

    if-ne p1, v1, :cond_0

    .line 116
    sget-object v2, Lcom/trendmicro/hippo/SymbolKey;->TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

    .line 117
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeWeakSet;->getClassName()Ljava/lang/String;

    move-result-object v3

    .line 116
    invoke-virtual {p0, v1, v2, v3, v0}, Lcom/trendmicro/hippo/NativeWeakSet;->initPrototypeValue(ILcom/trendmicro/hippo/Symbol;Ljava/lang/Object;I)V

    .line 118
    return-void

    .line 121
    :cond_0
    const/4 v1, 0x0

    .line 123
    .local v1, "fnName":Ljava/lang/String;
    const/4 v2, 0x1

    if-eq p1, v2, :cond_4

    const/4 v2, 0x2

    if-eq p1, v2, :cond_3

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    if-ne p1, v0, :cond_1

    .line 127
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v2, "has"

    .local v2, "s":Ljava/lang/String;
    goto :goto_0

    .line 128
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 126
    :cond_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "delete"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 125
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_3
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "add"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 124
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_4
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "constructor"

    .line 130
    .restart local v2    # "s":Ljava/lang/String;
    :goto_0
    sget-object v5, Lcom/trendmicro/hippo/NativeWeakSet;->MAP_TAG:Ljava/lang/Object;

    move-object v4, p0

    move v6, p1

    move-object v7, v2

    move-object v8, v1

    move v9, v0

    invoke-virtual/range {v4 .. v9}, Lcom/trendmicro/hippo/NativeWeakSet;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 131
    return-void
.end method
