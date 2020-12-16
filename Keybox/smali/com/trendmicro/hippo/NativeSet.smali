.class public Lcom/trendmicro/hippo/NativeSet;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeSet.java"


# static fields
.field static final GETSIZE:Lcom/trendmicro/hippo/SymbolKey;

.field static final ITERATOR_TAG:Ljava/lang/String; = "Set Iterator"

.field private static final Id_add:I = 0x2

.field private static final Id_clear:I = 0x5

.field private static final Id_constructor:I = 0x1

.field private static final Id_delete:I = 0x3

.field private static final Id_entries:I = 0x7

.field private static final Id_forEach:I = 0x8

.field private static final Id_has:I = 0x4

.field private static final Id_keys:I = 0x6

.field private static final Id_values:I = 0x6

.field private static final MAX_PROTOTYPE_ID:I = 0xa

.field private static final SET_TAG:Ljava/lang/Object;

.field private static final SymbolId_getSize:I = 0x9

.field private static final SymbolId_toStringTag:I = 0xa


# instance fields
.field private final entries:Lcom/trendmicro/hippo/Hashtable;

.field private instanceOfSet:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 14
    const-string v0, "Set"

    sput-object v0, Lcom/trendmicro/hippo/NativeSet;->SET_TAG:Ljava/lang/Object;

    .line 17
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "[Symbol.getSize]"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/NativeSet;->GETSIZE:Lcom/trendmicro/hippo/SymbolKey;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 19
    new-instance v0, Lcom/trendmicro/hippo/Hashtable;

    invoke-direct {v0}, Lcom/trendmicro/hippo/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeSet;->entries:Lcom/trendmicro/hippo/Hashtable;

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/NativeSet;->instanceOfSet:Z

    return-void
.end method

.method static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 25
    new-instance v0, Lcom/trendmicro/hippo/NativeSet;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeSet;-><init>()V

    .line 26
    .local v0, "obj":Lcom/trendmicro/hippo/NativeSet;
    const/16 v1, 0xa

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/trendmicro/hippo/NativeSet;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 28
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ScriptableObject;

    .line 29
    .local v1, "desc":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "enumerable"

    invoke-virtual {v1, v3, v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 30
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "configurable"

    invoke-virtual {v1, v3, v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 31
    sget-object v2, Lcom/trendmicro/hippo/NativeSet;->GETSIZE:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, v2, v0}, Lcom/trendmicro/hippo/NativeSet;->get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "get"

    invoke-virtual {v1, v3, v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 32
    const-string v2, "size"

    invoke-virtual {v0, p0, v2, v1}, Lcom/trendmicro/hippo/NativeSet;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 34
    if-eqz p2, :cond_0

    .line 35
    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeSet;->sealObject()V

    .line 37
    :cond_0
    return-void
.end method

.method private js_add(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "k"    # Ljava/lang/Object;

    .line 89
    move-object v0, p1

    .line 90
    .local v0, "key":Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/Number;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Ljava/lang/Number;

    .line 91
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v1

    sget-wide v3, Lcom/trendmicro/hippo/ScriptRuntime;->negativeZero:D

    cmpl-double v1, v1, v3

    if-nez v1, :cond_0

    .line 92
    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 94
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeSet;->entries:Lcom/trendmicro/hippo/Hashtable;

    invoke-virtual {v1, v0, v0}, Lcom/trendmicro/hippo/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 95
    return-object p0
.end method

.method private js_clear()Ljava/lang/Object;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeSet;->entries:Lcom/trendmicro/hippo/Hashtable;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Hashtable;->clear()V

    .line 112
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0
.end method

.method private js_delete(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "arg"    # Ljava/lang/Object;

    .line 100
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeSet;->entries:Lcom/trendmicro/hippo/Hashtable;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/Hashtable;->delete(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 101
    .local v0, "ov":Ljava/lang/Object;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method

.method private js_forEach(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "arg1"    # Ljava/lang/Object;
    .param p4, "arg2"    # Ljava/lang/Object;

    .line 127
    instance-of v0, p3, Lcom/trendmicro/hippo/Callable;

    if-eqz v0, :cond_3

    .line 130
    move-object v0, p3

    check-cast v0, Lcom/trendmicro/hippo/Callable;

    .line 132
    .local v0, "f":Lcom/trendmicro/hippo/Callable;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v1

    .line 133
    .local v1, "isStrict":Z
    iget-object v2, p0, Lcom/trendmicro/hippo/NativeSet;->entries:Lcom/trendmicro/hippo/Hashtable;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/Hashtable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 134
    .local v2, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/trendmicro/hippo/Hashtable$Entry;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 136
    invoke-static {p1, p4, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 138
    .local v3, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    if-nez v3, :cond_0

    if-nez v1, :cond_0

    .line 139
    move-object v3, p2

    .line 141
    :cond_0
    if-nez v3, :cond_1

    .line 142
    sget-object v3, Lcom/trendmicro/hippo/Undefined;->SCRIPTABLE_UNDEFINED:Lcom/trendmicro/hippo/Scriptable;

    .line 145
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 146
    .local v4, "e":Lcom/trendmicro/hippo/Hashtable$Entry;
    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, v4, Lcom/trendmicro/hippo/Hashtable$Entry;->value:Ljava/lang/Object;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, v4, Lcom/trendmicro/hippo/Hashtable$Entry;->value:Ljava/lang/Object;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    aput-object p0, v5, v6

    invoke-interface {v0, p1, p2, v3, v5}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .end local v3    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v4    # "e":Lcom/trendmicro/hippo/Hashtable$Entry;
    goto :goto_0

    .line 148
    :cond_2
    sget-object v3, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v3

    .line 128
    .end local v0    # "f":Lcom/trendmicro/hippo/Callable;
    .end local v1    # "isStrict":Z
    .end local v2    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/trendmicro/hippo/Hashtable$Entry;>;"
    :cond_3
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private js_getSize()Ljava/lang/Object;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeSet;->entries:Lcom/trendmicro/hippo/Hashtable;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Hashtable;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method private js_has(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "arg"    # Ljava/lang/Object;

    .line 106
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeSet;->entries:Lcom/trendmicro/hippo/Hashtable;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/Hashtable;->has(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method private js_iterator(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeCollectionIterator$Type;)Ljava/lang/Object;
    .locals 3
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "type"    # Lcom/trendmicro/hippo/NativeCollectionIterator$Type;

    .line 122
    new-instance v0, Lcom/trendmicro/hippo/NativeCollectionIterator;

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeSet;->entries:Lcom/trendmicro/hippo/Hashtable;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/Hashtable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const-string v2, "Set Iterator"

    invoke-direct {v0, p1, v2, p2, v1}, Lcom/trendmicro/hippo/NativeCollectionIterator;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/NativeCollectionIterator$Type;Ljava/util/Iterator;)V

    return-object v0
.end method

.method static loadFromIterable(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/Object;)V
    .locals 9
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "set"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p3, "arg1"    # Ljava/lang/Object;

    .line 157
    if-eqz p3, :cond_4

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {v0, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_3

    .line 162
    :cond_0
    invoke-static {p3, p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->callIterator(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 163
    .local v0, "ito":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 165
    return-void

    .line 171
    :cond_1
    invoke-virtual {p2}, Lcom/trendmicro/hippo/ScriptableObject;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/NativeSet;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v1

    .line 172
    .local v1, "dummy":Lcom/trendmicro/hippo/ScriptableObject;
    nop

    .line 173
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ScriptableObject;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    const-string v3, "add"

    invoke-static {v2, v3, p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v2

    .line 175
    .local v2, "add":Lcom/trendmicro/hippo/Callable;
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    .line 178
    new-instance v3, Lcom/trendmicro/hippo/IteratorLikeIterable;

    invoke-direct {v3, p0, p1, v0}, Lcom/trendmicro/hippo/IteratorLikeIterable;-><init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 179
    .local v3, "it":Lcom/trendmicro/hippo/IteratorLikeIterable;
    :try_start_0
    invoke-virtual {v3}, Lcom/trendmicro/hippo/IteratorLikeIterable;->iterator()Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 180
    .local v5, "val":Ljava/lang/Object;
    sget-object v6, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v5, v6, :cond_2

    sget-object v6, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1

    :cond_2
    move-object v6, v5

    .line 181
    .local v6, "finalVal":Ljava/lang/Object;
    :goto_1
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v6, v7, v8

    invoke-interface {v2, p0, p1, p2, v7}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 182
    nop

    .end local v5    # "val":Ljava/lang/Object;
    .end local v6    # "finalVal":Ljava/lang/Object;
    goto :goto_0

    .line 183
    :cond_3
    invoke-virtual {v3}, Lcom/trendmicro/hippo/IteratorLikeIterable;->close()V

    .line 184
    .end local v3    # "it":Lcom/trendmicro/hippo/IteratorLikeIterable;
    return-void

    .line 178
    .restart local v3    # "it":Lcom/trendmicro/hippo/IteratorLikeIterable;
    :catchall_0
    move-exception v4

    :try_start_1
    invoke-virtual {v3}, Lcom/trendmicro/hippo/IteratorLikeIterable;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v5

    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw v4

    .line 158
    .end local v0    # "ito":Ljava/lang/Object;
    .end local v1    # "dummy":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v2    # "add":Lcom/trendmicro/hippo/Callable;
    .end local v3    # "it":Lcom/trendmicro/hippo/IteratorLikeIterable;
    :cond_4
    :goto_3
    return-void
.end method

.method private realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeSet;
    .locals 2
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 188
    if-eqz p1, :cond_1

    .line 192
    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeSet;

    .line 193
    .local v0, "ns":Lcom/trendmicro/hippo/NativeSet;
    iget-boolean v1, v0, Lcom/trendmicro/hippo/NativeSet;->instanceOfSet:Z

    if-eqz v1, :cond_0

    .line 197
    return-object v0

    .line 195
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeSet;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    .end local p1    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local p2    # "f":Lcom/trendmicro/hippo/IdFunctionObject;
    throw v1
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    .end local v0    # "ns":Lcom/trendmicro/hippo/NativeSet;
    .restart local p1    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local p2    # "f":Lcom/trendmicro/hippo/IdFunctionObject;
    :catch_0
    move-exception v0

    .line 199
    .local v0, "cce":Ljava/lang/ClassCastException;
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeSet;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 189
    .end local v0    # "cce":Ljava/lang/ClassCastException;
    :cond_1
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeSet;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

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

    .line 48
    sget-object v0, Lcom/trendmicro/hippo/NativeSet;->SET_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 49
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 51
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 52
    .local v0, "id":I
    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    .line 83
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Set.prototype has no method: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 81
    :pswitch_0
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeSet;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeSet;

    move-result-object v1

    invoke-direct {v1}, Lcom/trendmicro/hippo/NativeSet;->js_getSize()Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 77
    :pswitch_1
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeSet;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeSet;

    move-result-object v3

    .line 78
    array-length v4, p5

    if-lez v4, :cond_1

    aget-object v2, p5, v2

    goto :goto_0

    :cond_1
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 79
    :goto_0
    array-length v4, p5

    if-le v4, v1, :cond_2

    aget-object v1, p5, v1

    goto :goto_1

    :cond_2
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 77
    :goto_1
    invoke-direct {v3, p2, p3, v2, v1}, Lcom/trendmicro/hippo/NativeSet;->js_forEach(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 75
    :pswitch_2
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeSet;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeSet;

    move-result-object v1

    sget-object v2, Lcom/trendmicro/hippo/NativeCollectionIterator$Type;->BOTH:Lcom/trendmicro/hippo/NativeCollectionIterator$Type;

    invoke-direct {v1, p3, v2}, Lcom/trendmicro/hippo/NativeSet;->js_iterator(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeCollectionIterator$Type;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 73
    :pswitch_3
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeSet;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeSet;

    move-result-object v1

    sget-object v2, Lcom/trendmicro/hippo/NativeCollectionIterator$Type;->VALUES:Lcom/trendmicro/hippo/NativeCollectionIterator$Type;

    invoke-direct {v1, p3, v2}, Lcom/trendmicro/hippo/NativeSet;->js_iterator(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeCollectionIterator$Type;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 71
    :pswitch_4
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeSet;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeSet;

    move-result-object v1

    invoke-direct {v1}, Lcom/trendmicro/hippo/NativeSet;->js_clear()Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 69
    :pswitch_5
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeSet;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeSet;

    move-result-object v1

    array-length v3, p5

    if-lez v3, :cond_3

    aget-object v2, p5, v2

    goto :goto_2

    :cond_3
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_2
    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/NativeSet;->js_has(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 67
    :pswitch_6
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeSet;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeSet;

    move-result-object v1

    array-length v3, p5

    if-lez v3, :cond_4

    aget-object v2, p5, v2

    goto :goto_3

    :cond_4
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_3
    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/NativeSet;->js_delete(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 65
    :pswitch_7
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/NativeSet;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeSet;

    move-result-object v1

    array-length v3, p5

    if-lez v3, :cond_5

    aget-object v2, p5, v2

    goto :goto_4

    :cond_5
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_4
    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/NativeSet;->js_add(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 54
    :pswitch_8
    if-nez p4, :cond_7

    .line 55
    new-instance v3, Lcom/trendmicro/hippo/NativeSet;

    invoke-direct {v3}, Lcom/trendmicro/hippo/NativeSet;-><init>()V

    .line 56
    .local v3, "ns":Lcom/trendmicro/hippo/NativeSet;
    iput-boolean v1, v3, Lcom/trendmicro/hippo/NativeSet;->instanceOfSet:Z

    .line 57
    array-length v1, p5

    if-lez v1, :cond_6

    .line 58
    aget-object v1, p5, v2

    invoke-static {p2, p3, v3, v1}, Lcom/trendmicro/hippo/NativeSet;->loadFromIterable(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/Object;)V

    .line 60
    :cond_6
    return-object v3

    .line 62
    .end local v3    # "ns":Lcom/trendmicro/hippo/NativeSet;
    :cond_7
    const-string v1, "msg.no.new"

    const-string v2, "Set"

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    :pswitch_data_0
    .packed-switch 0x1
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

.method protected findPrototypeId(Lcom/trendmicro/hippo/Symbol;)I
    .locals 1
    .param p1, "k"    # Lcom/trendmicro/hippo/Symbol;

    .line 236
    sget-object v0, Lcom/trendmicro/hippo/NativeSet;->GETSIZE:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 237
    const/16 v0, 0x9

    return v0

    .line 239
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 240
    const/4 v0, 0x6

    return v0

    .line 242
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 243
    const/16 v0, 0xa

    return v0

    .line 245
    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 7
    .param p1, "s"    # Ljava/lang/String;

    .line 255
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 256
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x3

    const/16 v4, 0x64

    const/4 v5, 0x0

    if-eq v2, v3, :cond_7

    const/4 v3, 0x4

    if-eq v2, v3, :cond_6

    const/4 v3, 0x5

    if-eq v2, v3, :cond_5

    const/4 v3, 0x6

    if-eq v2, v3, :cond_3

    const/4 v3, 0x7

    if-eq v2, v3, :cond_1

    const/16 v3, 0xb

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 271
    :cond_0
    const-string v1, "constructor"

    const/4 v0, 0x1

    goto :goto_0

    .line 267
    :cond_1
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 268
    .local v2, "c":I
    const/16 v3, 0x65

    if-ne v2, v3, :cond_2

    const-string v1, "entries"

    const/4 v0, 0x7

    goto :goto_0

    .line 269
    :cond_2
    const/16 v3, 0x66

    if-ne v2, v3, :cond_9

    const-string v1, "forEach"

    const/16 v0, 0x8

    goto :goto_0

    .line 263
    .end local v2    # "c":I
    :cond_3
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 264
    .restart local v2    # "c":I
    if-ne v2, v4, :cond_4

    const-string v1, "delete"

    const/4 v0, 0x3

    goto :goto_0

    .line 265
    :cond_4
    const/16 v3, 0x76

    if-ne v2, v3, :cond_9

    const-string v1, "values"

    const/4 v0, 0x6

    goto :goto_0

    .line 262
    .end local v2    # "c":I
    :cond_5
    const-string v1, "clear"

    const/4 v0, 0x5

    goto :goto_0

    .line 261
    :cond_6
    const-string v1, "keys"

    const/4 v0, 0x6

    goto :goto_0

    .line 257
    :cond_7
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 258
    .restart local v2    # "c":I
    const/4 v3, 0x1

    const/4 v5, 0x2

    const/16 v6, 0x61

    if-ne v2, v6, :cond_8

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v4, :cond_9

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v4, :cond_9

    const/4 v0, 0x2

    goto :goto_1

    .line 259
    :cond_8
    const/16 v4, 0x68

    if-ne v2, v4, :cond_9

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x73

    if-ne v4, v5, :cond_9

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_9

    const/4 v0, 0x4

    goto :goto_1

    .line 273
    .end local v2    # "c":I
    :cond_9
    :goto_0
    if-eqz v1, :cond_a

    if-eq v1, p1, :cond_a

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    const/4 v0, 0x0

    .line 277
    .end local v1    # "X":Ljava/lang/String;
    :cond_a
    :goto_1
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 41
    const-string v0, "Set"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 10
    .param p1, "id"    # I

    .line 206
    const/16 v0, 0x9

    if-eq p1, v0, :cond_1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_0

    .line 217
    const/4 v0, 0x0

    .line 219
    .local v0, "fnName":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 228
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 227
    :pswitch_0
    const/4 v1, 0x1

    .local v1, "arity":I
    const-string v2, "forEach"

    move v7, v1

    move-object v8, v2

    .local v2, "s":Ljava/lang/String;
    goto :goto_0

    .line 225
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "entries"

    move v7, v1

    move-object v8, v2

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 226
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "values"

    move v7, v1

    move-object v8, v2

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 224
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "clear"

    move v7, v1

    move-object v8, v2

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 223
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "has"

    move v7, v1

    move-object v8, v2

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 222
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "delete"

    move v7, v1

    move-object v8, v2

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 221
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "add"

    move v7, v1

    move-object v8, v2

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 220
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "constructor"

    move v7, v1

    move-object v8, v2

    .line 230
    .end local v1    # "arity":I
    .local v7, "arity":I
    .local v8, "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/NativeSet;->SET_TAG:Ljava/lang/Object;

    move-object v1, p0

    move v3, p1

    move-object v4, v8

    move-object v5, v0

    move v6, v7

    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/hippo/NativeSet;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 231
    return-void

    .line 211
    .end local v0    # "fnName":Ljava/lang/String;
    .end local v7    # "arity":I
    .end local v8    # "s":Ljava/lang/String;
    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/SymbolKey;->TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

    .line 212
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeSet;->getClassName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    .line 211
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSet;->initPrototypeValue(ILcom/trendmicro/hippo/Symbol;Ljava/lang/Object;I)V

    .line 213
    return-void

    .line 208
    :cond_1
    sget-object v5, Lcom/trendmicro/hippo/NativeSet;->SET_TAG:Ljava/lang/Object;

    sget-object v7, Lcom/trendmicro/hippo/NativeSet;->GETSIZE:Lcom/trendmicro/hippo/SymbolKey;

    const/4 v9, 0x0

    const-string v8, "get size"

    move-object v4, p0

    move v6, p1

    invoke-virtual/range {v4 .. v9}, Lcom/trendmicro/hippo/NativeSet;->initPrototypeMethod(Ljava/lang/Object;ILcom/trendmicro/hippo/Symbol;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 209
    return-void

    :pswitch_data_0
    .packed-switch 0x1
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
