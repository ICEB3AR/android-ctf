.class final Lcom/trendmicro/hippo/EqualObjectGraphs;
.super Ljava/lang/Object;
.source "EqualObjectGraphs.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final instance:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Lcom/trendmicro/hippo/EqualObjectGraphs;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final currentlyCompared:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final knownEquals:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    nop

    .line 42
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/EqualObjectGraphs;->instance:Ljava/lang/ThreadLocal;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/EqualObjectGraphs;->knownEquals:Ljava/util/Map;

    .line 48
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/EqualObjectGraphs;->currentlyCompared:Ljava/util/Map;

    return-void
.end method

.method private equalGraphsNoMemo(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .line 115
    instance-of v0, p1, Lcom/trendmicro/hippo/Wrapper;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 116
    instance-of v0, p2, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    move-object v3, p2

    check-cast v3, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v3}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v0, v3}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    .line 117
    :cond_1
    instance-of v0, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_3

    .line 118
    instance-of v0, p2, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_2

    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    move-object v3, p2

    check-cast v3, Lcom/trendmicro/hippo/Scriptable;

    invoke-direct {p0, v0, v3}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalScriptables(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    return v1

    .line 119
    :cond_3
    instance-of v0, p1, Lcom/trendmicro/hippo/ConsString;

    if-eqz v0, :cond_4

    .line 120
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ConsString;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ConsString;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 121
    :cond_4
    instance-of v0, p2, Lcom/trendmicro/hippo/ConsString;

    if-eqz v0, :cond_5

    .line 122
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/ConsString;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ConsString;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 123
    :cond_5
    instance-of v0, p1, Lcom/trendmicro/hippo/SymbolKey;

    if-eqz v0, :cond_7

    .line 124
    instance-of v0, p2, Lcom/trendmicro/hippo/SymbolKey;

    if-eqz v0, :cond_6

    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/SymbolKey;->getName()Ljava/lang/String;

    move-result-object v0

    move-object v3, p2

    check-cast v3, Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/SymbolKey;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, v3}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_2

    :cond_6
    move v1, v2

    :goto_2
    return v1

    .line 125
    :cond_7
    instance-of v0, p1, [Ljava/lang/Object;

    if-eqz v0, :cond_9

    .line 126
    instance-of v0, p2, [Ljava/lang/Object;

    if-eqz v0, :cond_8

    move-object v0, p1

    check-cast v0, [Ljava/lang/Object;

    move-object v3, p2

    check-cast v3, [Ljava/lang/Object;

    invoke-direct {p0, v0, v3}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalObjectArrays([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    goto :goto_3

    :cond_8
    move v1, v2

    :goto_3
    return v1

    .line 127
    :cond_9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 128
    invoke-static {p1, p2}, Ljava/util/Objects;->deepEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 129
    :cond_a
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_c

    .line 130
    instance-of v0, p2, Ljava/util/List;

    if-eqz v0, :cond_b

    move-object v0, p1

    check-cast v0, Ljava/util/List;

    move-object v3, p2

    check-cast v3, Ljava/util/List;

    invoke-direct {p0, v0, v3}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalLists(Ljava/util/List;Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_4

    :cond_b
    move v1, v2

    :goto_4
    return v1

    .line 131
    :cond_c
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_e

    .line 132
    instance-of v0, p2, Ljava/util/Map;

    if-eqz v0, :cond_d

    move-object v0, p1

    check-cast v0, Ljava/util/Map;

    move-object v3, p2

    check-cast v3, Ljava/util/Map;

    invoke-direct {p0, v0, v3}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalMaps(Ljava/util/Map;Ljava/util/Map;)Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_5

    :cond_d
    move v1, v2

    :goto_5
    return v1

    .line 133
    :cond_e
    instance-of v0, p1, Ljava/util/Set;

    if-eqz v0, :cond_10

    .line 134
    instance-of v0, p2, Ljava/util/Set;

    if-eqz v0, :cond_f

    move-object v0, p1

    check-cast v0, Ljava/util/Set;

    move-object v3, p2

    check-cast v3, Ljava/util/Set;

    invoke-direct {p0, v0, v3}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalSets(Ljava/util/Set;Ljava/util/Set;)Z

    move-result v0

    if-eqz v0, :cond_f

    goto :goto_6

    :cond_f
    move v1, v2

    :goto_6
    return v1

    .line 135
    :cond_10
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeGlobal;

    if-eqz v0, :cond_11

    .line 136
    instance-of v0, p2, Lcom/trendmicro/hippo/NativeGlobal;

    return v0

    .line 137
    :cond_11
    instance-of v0, p1, Lcom/trendmicro/hippo/JavaAdapter;

    if-eqz v0, :cond_12

    .line 138
    instance-of v0, p2, Lcom/trendmicro/hippo/JavaAdapter;

    return v0

    .line 139
    :cond_12
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeJavaTopPackage;

    if-eqz v0, :cond_13

    .line 140
    instance-of v0, p2, Lcom/trendmicro/hippo/NativeJavaTopPackage;

    return v0

    .line 144
    :cond_13
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static equalInterpretedFunctions(Lcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/InterpretedFunction;)Z
    .locals 2
    .param p0, "f1"    # Lcom/trendmicro/hippo/InterpretedFunction;
    .param p1, "f2"    # Lcom/trendmicro/hippo/InterpretedFunction;

    .line 251
    invoke-virtual {p0}, Lcom/trendmicro/hippo/InterpretedFunction;->getEncodedSource()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/InterpretedFunction;->getEncodedSource()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private equalLists(Ljava/util/List;Ljava/util/List;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;",
            "Ljava/util/List<",
            "*>;)Z"
        }
    .end annotation

    .line 197
    .local p1, "l1":Ljava/util/List;, "Ljava/util/List<*>;"
    .local p2, "l2":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 198
    return v2

    .line 200
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 201
    .local v0, "i1":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 202
    .local v1, "i2":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 203
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 204
    return v2

    .line 207
    :cond_2
    nop

    .line 208
    const/4 v2, 0x1

    return v2
.end method

.method private equalMaps(Ljava/util/Map;Ljava/util/Map;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;",
            "Ljava/util/Map<",
            "**>;)Z"
        }
    .end annotation

    .line 213
    .local p1, "m1":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .local p2, "m2":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 214
    return v2

    .line 216
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->sortedEntries(Ljava/util/Map;)Ljava/util/Iterator;

    move-result-object v0

    .line 217
    .local v0, "i1":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry;>;"
    invoke-static {p2}, Lcom/trendmicro/hippo/EqualObjectGraphs;->sortedEntries(Ljava/util/Map;)Ljava/util/Iterator;

    move-result-object v1

    .line 219
    .local v1, "i2":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 220
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 221
    .local v3, "kv1":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 222
    .local v4, "kv2":Ljava/util/Map$Entry;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_1

    .line 225
    .end local v3    # "kv1":Ljava/util/Map$Entry;
    .end local v4    # "kv2":Ljava/util/Map$Entry;
    :cond_1
    goto :goto_0

    .line 223
    .restart local v3    # "kv1":Ljava/util/Map$Entry;
    .restart local v4    # "kv2":Ljava/util/Map$Entry;
    :cond_2
    :goto_1
    return v2

    .line 226
    .end local v3    # "kv1":Ljava/util/Map$Entry;
    .end local v4    # "kv2":Ljava/util/Map$Entry;
    :cond_3
    nop

    .line 228
    const/4 v2, 0x1

    return v2
.end method

.method private equalObjectArrays([Ljava/lang/Object;[Ljava/lang/Object;)Z
    .locals 4
    .param p1, "a1"    # [Ljava/lang/Object;
    .param p2, "a2"    # [Ljava/lang/Object;

    .line 185
    array-length v0, p1

    array-length v1, p2

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 186
    return v2

    .line 188
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_2

    .line 189
    aget-object v1, p1, v0

    aget-object v3, p2, v0

    invoke-virtual {p0, v1, v3}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 190
    return v2

    .line 188
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 193
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method private equalScriptables(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 7
    .param p1, "s1"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "s2"    # Lcom/trendmicro/hippo/Scriptable;

    .line 148
    invoke-static {p1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->getSortedIds(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;

    move-result-object v0

    .line 149
    .local v0, "ids1":[Ljava/lang/Object;
    invoke-static {p2}, Lcom/trendmicro/hippo/EqualObjectGraphs;->getSortedIds(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;

    move-result-object v1

    .line 150
    .local v1, "ids2":[Ljava/lang/Object;
    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalObjectArrays([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 151
    return v3

    .line 153
    :cond_0
    array-length v2, v0

    .line 154
    .local v2, "l":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v2, :cond_2

    .line 155
    aget-object v5, v0, v4

    invoke-static {p1, v5}, Lcom/trendmicro/hippo/EqualObjectGraphs;->getValue(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aget-object v6, v1, v4

    invoke-static {p2, v6}, Lcom/trendmicro/hippo/EqualObjectGraphs;->getValue(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 156
    return v3

    .line 154
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 159
    .end local v4    # "i":I
    :cond_2
    invoke-interface {p1}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    invoke-interface {p2}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 160
    return v3

    .line 161
    :cond_3
    invoke-interface {p1}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    invoke-interface {p2}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 162
    return v3

    .line 166
    :cond_4
    instance-of v4, p1, Lcom/trendmicro/hippo/NativeContinuation;

    const/4 v5, 0x1

    if-eqz v4, :cond_6

    .line 167
    instance-of v4, p2, Lcom/trendmicro/hippo/NativeContinuation;

    if-eqz v4, :cond_5

    move-object v4, p1

    check-cast v4, Lcom/trendmicro/hippo/NativeContinuation;

    move-object v6, p2

    check-cast v6, Lcom/trendmicro/hippo/NativeContinuation;

    invoke-static {v4, v6}, Lcom/trendmicro/hippo/NativeContinuation;->equalImplementations(Lcom/trendmicro/hippo/NativeContinuation;Lcom/trendmicro/hippo/NativeContinuation;)Z

    move-result v4

    if-eqz v4, :cond_5

    move v3, v5

    :cond_5
    return v3

    .line 168
    :cond_6
    instance-of v4, p1, Lcom/trendmicro/hippo/NativeJavaPackage;

    if-eqz v4, :cond_7

    .line 169
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    return v3

    .line 170
    :cond_7
    instance-of v4, p1, Lcom/trendmicro/hippo/IdFunctionObject;

    if-eqz v4, :cond_9

    .line 171
    instance-of v4, p2, Lcom/trendmicro/hippo/IdFunctionObject;

    if-eqz v4, :cond_8

    move-object v4, p1

    check-cast v4, Lcom/trendmicro/hippo/IdFunctionObject;

    move-object v6, p2

    check-cast v6, Lcom/trendmicro/hippo/IdFunctionObject;

    invoke-static {v4, v6, p0}, Lcom/trendmicro/hippo/IdFunctionObject;->equalObjectGraphs(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/EqualObjectGraphs;)Z

    move-result v4

    if-eqz v4, :cond_8

    move v3, v5

    :cond_8
    return v3

    .line 172
    :cond_9
    instance-of v4, p1, Lcom/trendmicro/hippo/InterpretedFunction;

    if-eqz v4, :cond_b

    .line 173
    instance-of v4, p2, Lcom/trendmicro/hippo/InterpretedFunction;

    if-eqz v4, :cond_a

    move-object v4, p1

    check-cast v4, Lcom/trendmicro/hippo/InterpretedFunction;

    move-object v6, p2

    check-cast v6, Lcom/trendmicro/hippo/InterpretedFunction;

    invoke-static {v4, v6}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalInterpretedFunctions(Lcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/InterpretedFunction;)Z

    move-result v4

    if-eqz v4, :cond_a

    move v3, v5

    :cond_a
    return v3

    .line 174
    :cond_b
    instance-of v4, p1, Lcom/trendmicro/hippo/ArrowFunction;

    if-eqz v4, :cond_d

    .line 175
    instance-of v4, p2, Lcom/trendmicro/hippo/ArrowFunction;

    if-eqz v4, :cond_c

    move-object v4, p1

    check-cast v4, Lcom/trendmicro/hippo/ArrowFunction;

    move-object v6, p2

    check-cast v6, Lcom/trendmicro/hippo/ArrowFunction;

    invoke-static {v4, v6, p0}, Lcom/trendmicro/hippo/ArrowFunction;->equalObjectGraphs(Lcom/trendmicro/hippo/ArrowFunction;Lcom/trendmicro/hippo/ArrowFunction;Lcom/trendmicro/hippo/EqualObjectGraphs;)Z

    move-result v4

    if-eqz v4, :cond_c

    move v3, v5

    :cond_c
    return v3

    .line 176
    :cond_d
    instance-of v4, p1, Lcom/trendmicro/hippo/BoundFunction;

    if-eqz v4, :cond_f

    .line 177
    instance-of v4, p2, Lcom/trendmicro/hippo/BoundFunction;

    if-eqz v4, :cond_e

    move-object v4, p1

    check-cast v4, Lcom/trendmicro/hippo/BoundFunction;

    move-object v6, p2

    check-cast v6, Lcom/trendmicro/hippo/BoundFunction;

    invoke-static {v4, v6, p0}, Lcom/trendmicro/hippo/BoundFunction;->equalObjectGraphs(Lcom/trendmicro/hippo/BoundFunction;Lcom/trendmicro/hippo/BoundFunction;Lcom/trendmicro/hippo/EqualObjectGraphs;)Z

    move-result v4

    if-eqz v4, :cond_e

    move v3, v5

    :cond_e
    return v3

    .line 178
    :cond_f
    instance-of v4, p1, Lcom/trendmicro/hippo/NativeSymbol;

    if-eqz v4, :cond_11

    .line 179
    instance-of v4, p2, Lcom/trendmicro/hippo/NativeSymbol;

    if-eqz v4, :cond_10

    move-object v4, p1

    check-cast v4, Lcom/trendmicro/hippo/NativeSymbol;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/NativeSymbol;->getKey()Lcom/trendmicro/hippo/SymbolKey;

    move-result-object v4

    move-object v6, p2

    check-cast v6, Lcom/trendmicro/hippo/NativeSymbol;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/NativeSymbol;->getKey()Lcom/trendmicro/hippo/SymbolKey;

    move-result-object v6

    invoke-virtual {p0, v4, v6}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    move v3, v5

    :cond_10
    return v3

    .line 181
    :cond_11
    return v5
.end method

.method private equalSets(Ljava/util/Set;Ljava/util/Set;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "*>;",
            "Ljava/util/Set<",
            "*>;)Z"
        }
    .end annotation

    .line 241
    .local p1, "s1":Ljava/util/Set;, "Ljava/util/Set<*>;"
    .local p2, "s2":Ljava/util/Set;, "Ljava/util/Set<*>;"
    invoke-static {p1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->sortedSet(Ljava/util/Set;)[Ljava/lang/Object;

    move-result-object v0

    invoke-static {p2}, Lcom/trendmicro/hippo/EqualObjectGraphs;->sortedSet(Ljava/util/Set;)[Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalObjectArrays([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static getIds(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;
    .locals 2
    .param p0, "s"    # Lcom/trendmicro/hippo/Scriptable;

    .line 300
    instance-of v0, p0, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v0, :cond_0

    .line 302
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getIds(ZZ)[Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 303
    :cond_0
    instance-of v0, p0, Lcom/trendmicro/hippo/debug/DebuggableObject;

    if-eqz v0, :cond_1

    .line 304
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/debug/DebuggableObject;

    invoke-interface {v0}, Lcom/trendmicro/hippo/debug/DebuggableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 306
    :cond_1
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static getSortedIds(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;
    .locals 2
    .param p0, "s"    # Lcom/trendmicro/hippo/Scriptable;

    .line 256
    invoke-static {p0}, Lcom/trendmicro/hippo/EqualObjectGraphs;->getIds(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;

    move-result-object v0

    .line 257
    .local v0, "ids":[Ljava/lang/Object;
    #disallowed odex opcode
    #iput-object-volatile v0, v0, Landroid/app/Notification$Action;->icon:I
    nop

    nop

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 285
    return-object v0
.end method

.method private static getSymbolName(Lcom/trendmicro/hippo/Symbol;)Ljava/lang/String;
    .locals 1
    .param p0, "s"    # Lcom/trendmicro/hippo/Symbol;

    .line 289
    instance-of v0, p0, Lcom/trendmicro/hippo/SymbolKey;

    if-eqz v0, :cond_0

    .line 290
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/SymbolKey;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 291
    :cond_0
    instance-of v0, p0, Lcom/trendmicro/hippo/NativeSymbol;

    if-eqz v0, :cond_1

    .line 292
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeSymbol;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeSymbol;->getKey()Lcom/trendmicro/hippo/SymbolKey;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/SymbolKey;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 295
    :cond_1
    new-instance v0, Ljava/lang/ClassCastException;

    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    throw v0
.end method

.method private static getValue(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "s"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "id"    # Ljava/lang/Object;

    .line 311
    instance-of v0, p1, Lcom/trendmicro/hippo/Symbol;

    if-eqz v0, :cond_0

    .line 312
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Symbol;

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 313
    :cond_0
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_1

    .line 314
    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 315
    :cond_1
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 316
    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 318
    :cond_2
    new-instance v0, Ljava/lang/ClassCastException;

    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    throw v0
.end method

.method private static synthetic lambda$getSortedIds$0(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 3
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .line 258
    instance-of v0, p0, Ljava/lang/Integer;

    const/4 v1, -0x1

    if-eqz v0, :cond_2

    .line 259
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 260
    move-object v0, p0

    check-cast v0, Ljava/lang/Integer;

    move-object v1, p1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v0

    return v0

    .line 261
    :cond_0
    instance-of v0, p1, Ljava/lang/String;

    if-nez v0, :cond_1

    instance-of v0, p1, Lcom/trendmicro/hippo/Symbol;

    if-eqz v0, :cond_8

    .line 262
    :cond_1
    return v1

    .line 264
    :cond_2
    instance-of v0, p0, Ljava/lang/String;

    const/4 v2, 0x1

    if-eqz v0, :cond_5

    .line 265
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 266
    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 267
    :cond_3
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_4

    .line 268
    return v2

    .line 269
    :cond_4
    instance-of v0, p1, Lcom/trendmicro/hippo/Symbol;

    if-eqz v0, :cond_8

    .line 270
    return v1

    .line 272
    :cond_5
    instance-of v0, p0, Lcom/trendmicro/hippo/Symbol;

    if-eqz v0, :cond_8

    .line 273
    instance-of v0, p1, Lcom/trendmicro/hippo/Symbol;

    if-eqz v0, :cond_6

    .line 277
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Symbol;

    invoke-static {v0}, Lcom/trendmicro/hippo/EqualObjectGraphs;->getSymbolName(Lcom/trendmicro/hippo/Symbol;)Ljava/lang/String;

    move-result-object v0

    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/Symbol;

    invoke-static {v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->getSymbolName(Lcom/trendmicro/hippo/Symbol;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 278
    :cond_6
    instance-of v0, p1, Ljava/lang/Integer;

    if-nez v0, :cond_7

    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_8

    .line 279
    :cond_7
    return v2

    .line 283
    :cond_8
    new-instance v0, Ljava/lang/ClassCastException;

    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    throw v0
.end method

.method private static sortedEntries(Ljava/util/Map;)Ljava/util/Iterator;
    .locals 2
    .param p0, "m"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map;",
            ")",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry;",
            ">;"
        }
    .end annotation

    .line 236
    instance-of v0, p0, Ljava/util/SortedMap;

    if-eqz v0, :cond_0

    move-object v0, p0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0, p0}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    .line 237
    .local v0, "sortedMap":Ljava/util/Map;
    :goto_0
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    return-object v1
.end method

.method private static sortedSet(Ljava/util/Set;)[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "*>;)[",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 245
    .local p0, "s":Ljava/util/Set;, "Ljava/util/Set<*>;"
    invoke-interface {p0}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v0

    .line 246
    .local v0, "a":[Ljava/lang/Object;
    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 247
    return-object v0
.end method

.method static withThreadLocal(Ljava/util/function/Function;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/function/Function<",
            "Lcom/trendmicro/hippo/EqualObjectGraphs;",
            "TT;>;)TT;"
        }
    .end annotation

    .line 51
    .local p0, "action":Ljava/util/function/Function;, "Ljava/util/function/Function<Lcom/trendmicro/hippo/EqualObjectGraphs;TT;>;"
    sget-object v0, Lcom/trendmicro/hippo/EqualObjectGraphs;->instance:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/EqualObjectGraphs;

    .line 52
    .local v0, "currEq":Lcom/trendmicro/hippo/EqualObjectGraphs;
    if-nez v0, :cond_0

    .line 53
    new-instance v1, Lcom/trendmicro/hippo/EqualObjectGraphs;

    invoke-direct {v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;-><init>()V

    .line 54
    .local v1, "eq":Lcom/trendmicro/hippo/EqualObjectGraphs;
    sget-object v2, Lcom/trendmicro/hippo/EqualObjectGraphs;->instance:Ljava/lang/ThreadLocal;

    invoke-virtual {v2, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 56
    const/4 v2, 0x0

    :try_start_0
    invoke-interface {p0, v1}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    sget-object v4, Lcom/trendmicro/hippo/EqualObjectGraphs;->instance:Ljava/lang/ThreadLocal;

    invoke-virtual {v4, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 56
    return-object v3

    .line 58
    :catchall_0
    move-exception v3

    sget-object v4, Lcom/trendmicro/hippo/EqualObjectGraphs;->instance:Ljava/lang/ThreadLocal;

    invoke-virtual {v4, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 59
    throw v3

    .line 61
    .end local v1    # "eq":Lcom/trendmicro/hippo/EqualObjectGraphs;
    :cond_0
    invoke-interface {p0, v0}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .line 65
    const/4 v0, 0x1

    if-ne p1, p2, :cond_0

    .line 66
    return v0

    .line 67
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_8

    if-nez p2, :cond_1

    goto :goto_0

    .line 71
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/EqualObjectGraphs;->currentlyCompared:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 72
    .local v2, "curr2":Ljava/lang/Object;
    if-ne v2, p2, :cond_2

    .line 81
    return v0

    .line 82
    :cond_2
    if-eqz v2, :cond_3

    .line 85
    return v1

    .line 88
    :cond_3
    iget-object v3, p0, Lcom/trendmicro/hippo/EqualObjectGraphs;->knownEquals:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 89
    .local v3, "prev2":Ljava/lang/Object;
    if-ne v3, p2, :cond_4

    .line 91
    return v0

    .line 92
    :cond_4
    if-eqz v3, :cond_5

    .line 94
    return v1

    .line 97
    :cond_5
    iget-object v0, p0, Lcom/trendmicro/hippo/EqualObjectGraphs;->knownEquals:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 98
    .local v0, "prev1":Ljava/lang/Object;
    nop

    .line 99
    if-eqz v0, :cond_6

    .line 101
    return v1

    .line 104
    :cond_6
    iget-object v1, p0, Lcom/trendmicro/hippo/EqualObjectGraphs;->currentlyCompared:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphsNoMemo(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    .line 106
    .local v1, "eq":Z
    if-eqz v1, :cond_7

    .line 107
    iget-object v4, p0, Lcom/trendmicro/hippo/EqualObjectGraphs;->knownEquals:Ljava/util/Map;

    invoke-interface {v4, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    iget-object v4, p0, Lcom/trendmicro/hippo/EqualObjectGraphs;->knownEquals:Ljava/util/Map;

    invoke-interface {v4, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    :cond_7
    iget-object v4, p0, Lcom/trendmicro/hippo/EqualObjectGraphs;->currentlyCompared:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    return v1

    .line 68
    .end local v0    # "prev1":Ljava/lang/Object;
    .end local v1    # "eq":Z
    .end local v2    # "curr2":Ljava/lang/Object;
    .end local v3    # "prev2":Ljava/lang/Object;
    :cond_8
    :goto_0
    return v1
.end method
