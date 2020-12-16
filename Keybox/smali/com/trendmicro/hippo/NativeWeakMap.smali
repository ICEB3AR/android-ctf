.class public Lcom/trendmicro/hippo/NativeWeakMap;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeWeakMap.java"


# static fields
.field private static final Id_constructor:I = 0x1

.field private static final Id_delete:I = 0x2

.field private static final Id_get:I = 0x3

.field private static final Id_has:I = 0x4

.field private static final Id_set:I = 0x5

.field private static final MAP_TAG:Ljava/lang/Object;

.field private static final MAX_PROTOTYPE_ID:I = 0x6

.field private static final NULL_VALUE:Ljava/lang/Object;

.field private static final SymbolId_toStringTag:I = 0x6


# instance fields
.field private instanceOfWeakMap:Z

.field private transient map:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 24
    const-string v0, "WeakMap"

    sput-object v0, Lcom/trendmicro/hippo/NativeWeakMap;->MAP_TAG:Ljava/lang/Object;

    .line 30
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/NativeWeakMap;->NULL_VALUE:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/NativeWeakMap;->instanceOfWeakMap:Z

    .line 28
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeWeakMap;->map:Ljava/util/WeakHashMap;

    return-void
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 33
    new-instance v0, Lcom/trendmicro/hippo/NativeWeakMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeWeakMap;-><init>()V

    .line 34
    .local v0, "m":Lcom/trendmicro/hippo/NativeWeakMap;
    const/4 v1, 0x6

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeWeakMap;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 35
    return-void
.end method

.method private js_delete(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 76
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isObject(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 77
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWeakMap;->map:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 80
    .local v0, "oldVal":Ljava/lang/Object;
    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method

.method private js_get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 84
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isObject(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 85
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWeakMap;->map:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 88
    .local v0, "result":Ljava/lang/Object;
    if-nez v0, :cond_1

    .line 89
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 90
    :cond_1
    sget-object v1, Lcom/trendmicro/hippo/NativeWeakMap;->NULL_VALUE:Ljava/lang/Object;

    if-ne v0, v1, :cond_2

    .line 91
    const/4 v1, 0x0

    return-object v1

    .line 93
    :cond_2
    return-object v0
.end method

.method private js_has(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 97
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isObject(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 98
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWeakMap;->map:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method private js_set(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "v"    # Ljava/lang/Object;

    .line 108
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isObject(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 113
    if-nez p2, :cond_0

    sget-object v0, Lcom/trendmicro/hippo/NativeWeakMap;->NULL_VALUE:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    move-object v0, p2

    .line 114
    .local v0, "value":Ljava/lang/Object;
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeWeakMap;->map:Ljava/util/WeakHashMap;

    move-object v2, p1

    check-cast v2, Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {v1, v2, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    return-object p0

    .line 109
    .end local v0    # "value":Ljava/lang/Object;
    :cond_1
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "msg.arg.not.object"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
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

    .line 201
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 202
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeWeakMap;->map:Ljava/util/WeakHashMap;

    .line 203
    return-void
.end method

.method private realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeWeakMap;
    .locals 2
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 119
    if-eqz p1, :cond_1

    .line 123
    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeWeakMap;

    .line 124
    .local v0, "nm":Lcom/trendmicro/hippo/NativeWeakMap;
    iget-boolean v1, v0, Lcom/trendmicro/hippo/NativeWeakMap;->instanceOfWeakMap:Z

    if-eqz v1, :cond_0

    .line 128
    return-object v0

    .line 126
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeWeakMap;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    .end local p1    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local p2    # "f":Lcom/trendmicro/hippo/IdFunctionObject;
    throw v1
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    .end local v0    # "nm":Lcom/trendmicro/hippo/NativeWeakMap;
    .restart local p1    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local p2    # "f":Lcom/trendmicro/hippo/IdFunctionObject;
    :catch_0
    move-exception v0

    .line 130
    .local v0, "cce":Ljava/lang/ClassCastException;
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeWeakMap;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 120
    .end local v0    # "cce":Ljava/lang/ClassCastException;
    :cond_1
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeWeakMap;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 46
    sget-object v0, Lcom/trendmicro/hippo/NativeWeakMap;->MAP_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 47
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 49
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 50
    .local v0, "id":I
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_a

    const/4 v3, 0x2

    if-eq v0, v3, :cond_8

    const/4 v3, 0x3

    if-eq v0, v3, :cond_6

    const/4 v3, 0x4

    if-eq v0, v3, :cond_4

    const/4 v3, 0x5

    if-ne v0, v3, :cond_3

    .line 68
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeWeakMap;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeWeakMap;

    move-result-object v3

    .line 69
    array-length v4, p5

    if-lez v4, :cond_1

    aget-object v2, p5, v2

    goto :goto_0

    :cond_1
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 70
    :goto_0
    array-length v4, p5

    if-le v4, v1, :cond_2

    aget-object v1, p5, v1

    goto :goto_1

    :cond_2
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 68
    :goto_1
    invoke-direct {v3, v2, v1}, Lcom/trendmicro/hippo/NativeWeakMap;->js_set(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 72
    :cond_3
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

    .line 66
    :cond_4
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeWeakMap;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeWeakMap;

    move-result-object v1

    array-length v3, p5

    if-lez v3, :cond_5

    aget-object v2, p5, v2

    goto :goto_2

    :cond_5
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_2
    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/NativeWeakMap;->js_has(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 64
    :cond_6
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeWeakMap;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeWeakMap;

    move-result-object v1

    array-length v3, p5

    if-lez v3, :cond_7

    aget-object v2, p5, v2

    goto :goto_3

    :cond_7
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_3
    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/NativeWeakMap;->js_get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 62
    :cond_8
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeWeakMap;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeWeakMap;

    move-result-object v1

    array-length v3, p5

    if-lez v3, :cond_9

    aget-object v2, p5, v2

    goto :goto_4

    :cond_9
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_4
    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/NativeWeakMap;->js_delete(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 52
    :cond_a
    if-nez p4, :cond_c

    .line 53
    new-instance v3, Lcom/trendmicro/hippo/NativeWeakMap;

    invoke-direct {v3}, Lcom/trendmicro/hippo/NativeWeakMap;-><init>()V

    .line 54
    .local v3, "nm":Lcom/trendmicro/hippo/NativeWeakMap;
    iput-boolean v1, v3, Lcom/trendmicro/hippo/NativeWeakMap;->instanceOfWeakMap:Z

    .line 55
    array-length v1, p5

    if-lez v1, :cond_b

    .line 56
    aget-object v1, p5, v2

    invoke-static {p2, p3, v3, v1}, Lcom/trendmicro/hippo/NativeMap;->loadFromIterable(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/Object;)V

    .line 58
    :cond_b
    return-object v3

    .line 60
    .end local v3    # "nm":Lcom/trendmicro/hippo/NativeWeakMap;
    :cond_c
    const-string v1, "msg.no.new"

    const-string v2, "WeakMap"

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method protected findPrototypeId(Lcom/trendmicro/hippo/Symbol;)I
    .locals 1
    .param p1, "k"    # Lcom/trendmicro/hippo/Symbol;

    .line 158
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    const/4 v0, 0x6

    return v0

    .line 161
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 10
    .param p1, "s"    # Ljava/lang/String;

    .line 170
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 171
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 172
    .local v2, "s_length":I
    const/4 v3, 0x3

    if-ne v2, v3, :cond_2

    .line 173
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 174
    .local v3, "c":I
    const/16 v4, 0x67

    const/16 v5, 0x65

    const/16 v6, 0x74

    const/4 v7, 0x1

    const/4 v8, 0x2

    if-ne v3, v4, :cond_0

    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_4

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v5, :cond_4

    const/4 v0, 0x3

    goto :goto_1

    .line 175
    :cond_0
    const/16 v4, 0x68

    const/16 v9, 0x73

    if-ne v3, v4, :cond_1

    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v9, :cond_4

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x61

    if-ne v4, v5, :cond_4

    const/4 v0, 0x4

    goto :goto_1

    .line 176
    :cond_1
    if-ne v3, v9, :cond_4

    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_4

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v5, :cond_4

    const/4 v0, 0x5

    goto :goto_1

    .line 178
    .end local v3    # "c":I
    :cond_2
    const/4 v3, 0x6

    if-ne v2, v3, :cond_3

    const-string v1, "delete"

    const/4 v0, 0x2

    goto :goto_0

    .line 179
    :cond_3
    const/16 v3, 0xb

    if-ne v2, v3, :cond_4

    const-string v1, "constructor"

    const/4 v0, 0x1

    .line 180
    :cond_4
    :goto_0
    if-eqz v1, :cond_5

    if-eq v1, p1, :cond_5

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    const/4 v0, 0x0

    .line 184
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_5
    :goto_1
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 39
    const-string v0, "WeakMap"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 10
    .param p1, "id"    # I

    .line 136
    const/4 v0, 0x3

    const/4 v1, 0x6

    if-ne p1, v1, :cond_0

    .line 137
    sget-object v2, Lcom/trendmicro/hippo/SymbolKey;->TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

    .line 138
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeWeakMap;->getClassName()Ljava/lang/String;

    move-result-object v3

    .line 137
    invoke-virtual {p0, v1, v2, v3, v0}, Lcom/trendmicro/hippo/NativeWeakMap;->initPrototypeValue(ILcom/trendmicro/hippo/Symbol;Ljava/lang/Object;I)V

    .line 139
    return-void

    .line 142
    :cond_0
    const/4 v1, 0x0

    .line 144
    .local v1, "fnName":Ljava/lang/String;
    const/4 v2, 0x1

    if-eq p1, v2, :cond_5

    const/4 v2, 0x2

    if-eq p1, v2, :cond_4

    if-eq p1, v0, :cond_3

    const/4 v0, 0x4

    if-eq p1, v0, :cond_2

    const/4 v0, 0x5

    if-ne p1, v0, :cond_1

    .line 149
    const/4 v0, 0x2

    .local v0, "arity":I
    const-string v2, "set"

    .local v2, "s":Ljava/lang/String;
    goto :goto_0

    .line 150
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "has"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 147
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_3
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "get"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 146
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_4
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "delete"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 145
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_5
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "constructor"

    .line 152
    .restart local v2    # "s":Ljava/lang/String;
    :goto_0
    sget-object v5, Lcom/trendmicro/hippo/NativeWeakMap;->MAP_TAG:Ljava/lang/Object;

    move-object v4, p0

    move v6, p1

    move-object v7, v2

    move-object v8, v1

    move v9, v0

    invoke-virtual/range {v4 .. v9}, Lcom/trendmicro/hippo/NativeWeakMap;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 153
    return-void
.end method
