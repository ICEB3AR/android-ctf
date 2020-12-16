.class public Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18;
.super Lcom/trendmicro/hippo/VMBridge;
.source "VMBridge_jdk18.java"


# instance fields
.field private contextLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "[",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Lcom/trendmicro/hippo/VMBridge;-><init>()V

    .line 24
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18;->contextLocal:Ljava/lang/ThreadLocal;

    return-void
.end method


# virtual methods
.method protected getContext(Ljava/lang/Object;)Lcom/trendmicro/hippo/Context;
    .locals 2
    .param p1, "contextHelper"    # Ljava/lang/Object;

    .line 49
    move-object v0, p1

    check-cast v0, [Ljava/lang/Object;

    .line 50
    .local v0, "storage":[Ljava/lang/Object;
    const/4 v1, 0x0

    aget-object v1, v0, v1

    check-cast v1, Lcom/trendmicro/hippo/Context;

    return-object v1
.end method

.method protected getInterfaceProxyHelper(Lcom/trendmicro/hippo/ContextFactory;[Ljava/lang/Class;)Ljava/lang/Object;
    .locals 5
    .param p1, "cf"    # Lcom/trendmicro/hippo/ContextFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/ContextFactory;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 79
    .local p2, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    aget-object v1, p2, v0

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 80
    .local v1, "loader":Ljava/lang/ClassLoader;
    invoke-static {v1, p2}, Ljava/lang/reflect/Proxy;->getProxyClass(Ljava/lang/ClassLoader;[Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v2

    .line 83
    .local v2, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Ljava/lang/reflect/InvocationHandler;

    aput-object v4, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .local v0, "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    nop

    .line 88
    return-object v0

    .line 84
    .end local v0    # "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :catch_0
    move-exception v0

    .line 86
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method protected getThreadContextHelper()Ljava/lang/Object;
    .locals 2

    .line 38
    iget-object v0, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18;->contextLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 39
    .local v0, "storage":[Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 40
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    .line 41
    iget-object v1, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18;->contextLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 43
    :cond_0
    return-object v0
.end method

.method protected newInterfaceProxy(Ljava/lang/Object;Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/InterfaceAdapter;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 8
    .param p1, "proxyHelper"    # Ljava/lang/Object;
    .param p2, "cf"    # Lcom/trendmicro/hippo/ContextFactory;
    .param p3, "adapter"    # Lcom/trendmicro/hippo/InterfaceAdapter;
    .param p4, "target"    # Ljava/lang/Object;
    .param p5, "topScope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 98
    move-object v0, p1

    check-cast v0, Ljava/lang/reflect/Constructor;

    .line 100
    .local v0, "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-instance v7, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p4

    move-object v4, p3

    move-object v5, p2

    move-object v6, p5

    invoke-direct/range {v1 .. v6}, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;-><init>(Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18;Ljava/lang/Object;Lcom/trendmicro/hippo/InterfaceAdapter;Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/Scriptable;)V

    .line 131
    .local v1, "handler":Ljava/lang/reflect/InvocationHandler;
    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .local v2, "proxy":Ljava/lang/Object;
    nop

    .line 141
    return-object v2

    .line 137
    .end local v2    # "proxy":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 139
    .local v2, "ex":Ljava/lang/InstantiationException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 134
    .end local v2    # "ex":Ljava/lang/InstantiationException;
    :catch_1
    move-exception v2

    .line 136
    .local v2, "ex":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 132
    .end local v2    # "ex":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v2

    .line 133
    .local v2, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-static {v2}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3
.end method

.method protected setContext(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)V
    .locals 2
    .param p1, "contextHelper"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 56
    move-object v0, p1

    check-cast v0, [Ljava/lang/Object;

    .line 57
    .local v0, "storage":[Ljava/lang/Object;
    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 58
    return-void
.end method

.method protected tryToMakeAccessible(Ljava/lang/reflect/AccessibleObject;)Z
    .locals 2
    .param p1, "accessible"    # Ljava/lang/reflect/AccessibleObject;

    .line 63
    invoke-virtual {p1}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 64
    return v1

    .line 67
    :cond_0
    :try_start_0
    invoke-virtual {p1, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    :goto_0
    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    .line 70
    :goto_1
    invoke-virtual {p1}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    move-result v0

    return v0
.end method
