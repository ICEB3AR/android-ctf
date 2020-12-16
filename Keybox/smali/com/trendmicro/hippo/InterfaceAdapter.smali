.class public Lcom/trendmicro/hippo/InterfaceAdapter;
.super Ljava/lang/Object;
.source "InterfaceAdapter.java"


# instance fields
.field private final proxyHelper:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Lcom/trendmicro/hippo/ContextFactory;Ljava/lang/Class;)V
    .locals 3
    .param p1, "cf"    # Lcom/trendmicro/hippo/ContextFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/ContextFactory;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 67
    .local p2, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    sget-object v0, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    .line 69
    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/VMBridge;->getInterfaceProxyHelper(Lcom/trendmicro/hippo/ContextFactory;[Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/InterfaceAdapter;->proxyHelper:Ljava/lang/Object;

    .line 71
    return-void
.end method

.method static create(Lcom/trendmicro/hippo/Context;Ljava/lang/Class;Lcom/trendmicro/hippo/ScriptableObject;)Ljava/lang/Object;
    .locals 10
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "object"    # Lcom/trendmicro/hippo/ScriptableObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Context;",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/trendmicro/hippo/ScriptableObject;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 29
    .local p1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 31
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 32
    .local v0, "topScope":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {v0}, Lcom/trendmicro/hippo/ClassCache;->get(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/ClassCache;

    move-result-object v7

    .line 34
    .local v7, "cache":Lcom/trendmicro/hippo/ClassCache;
    invoke-virtual {v7, p1}, Lcom/trendmicro/hippo/ClassCache;->getInterfaceAdapter(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/InterfaceAdapter;

    .line 35
    .local v1, "adapter":Lcom/trendmicro/hippo/InterfaceAdapter;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getFactory()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v8

    .line 36
    .local v8, "cf":Lcom/trendmicro/hippo/ContextFactory;
    if-nez v1, :cond_3

    .line 37
    invoke-virtual {p1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v2

    .line 38
    .local v2, "methods":[Ljava/lang/reflect/Method;
    instance-of v3, p2, Lcom/trendmicro/hippo/Callable;

    if-eqz v3, :cond_2

    .line 43
    array-length v3, v2

    .line 44
    .local v3, "length":I
    if-eqz v3, :cond_1

    .line 48
    const/4 v4, 0x1

    if-le v3, v4, :cond_2

    .line 49
    const/4 v4, 0x0

    aget-object v4, v2, v4

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    .line 50
    .local v4, "methodName":Ljava/lang/String;
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_0
    if-ge v5, v3, :cond_2

    .line 51
    aget-object v6, v2, v5

    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 50
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 52
    :cond_0
    nop

    .line 54
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    .line 52
    const-string v9, "msg.no.function.interface.conversion"

    invoke-static {v9, v6}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v6

    throw v6

    .line 45
    .end local v4    # "methodName":Ljava/lang/String;
    .end local v5    # "i":I
    :cond_1
    nop

    .line 46
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 45
    const-string v5, "msg.no.empty.interface.conversion"

    invoke-static {v5, v4}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v4

    throw v4

    .line 59
    .end local v3    # "length":I
    :cond_2
    new-instance v3, Lcom/trendmicro/hippo/InterfaceAdapter;

    invoke-direct {v3, v8, p1}, Lcom/trendmicro/hippo/InterfaceAdapter;-><init>(Lcom/trendmicro/hippo/ContextFactory;Ljava/lang/Class;)V

    move-object v1, v3

    .line 60
    invoke-virtual {v7, p1, v1}, Lcom/trendmicro/hippo/ClassCache;->cacheInterfaceAdapter(Ljava/lang/Class;Ljava/lang/Object;)V

    move-object v9, v1

    goto :goto_1

    .line 36
    .end local v2    # "methods":[Ljava/lang/reflect/Method;
    :cond_3
    move-object v9, v1

    .line 62
    .end local v1    # "adapter":Lcom/trendmicro/hippo/InterfaceAdapter;
    .local v9, "adapter":Lcom/trendmicro/hippo/InterfaceAdapter;
    :goto_1
    sget-object v1, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    iget-object v2, v9, Lcom/trendmicro/hippo/InterfaceAdapter;->proxyHelper:Ljava/lang/Object;

    move-object v3, v8

    move-object v4, v9

    move-object v5, p2

    move-object v6, v0

    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/hippo/VMBridge;->newInterfaceProxy(Ljava/lang/Object;Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/InterfaceAdapter;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 29
    .end local v0    # "topScope":Lcom/trendmicro/hippo/Scriptable;
    .end local v7    # "cache":Lcom/trendmicro/hippo/ClassCache;
    .end local v8    # "cf":Lcom/trendmicro/hippo/ContextFactory;
    .end local v9    # "adapter":Lcom/trendmicro/hippo/InterfaceAdapter;
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method private synthetic lambda$invoke$0(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 7
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "topScope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObject"    # Ljava/lang/Object;
    .param p4, "method"    # Ljava/lang/reflect/Method;
    .param p5, "args"    # [Ljava/lang/Object;
    .param p6, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 80
    move-object v0, p0

    move-object v1, p6

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/trendmicro/hippo/InterfaceAdapter;->invokeImpl(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public invoke(Lcom/trendmicro/hippo/ContextFactory;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "cf"    # Lcom/trendmicro/hippo/ContextFactory;
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "topScope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObject"    # Ljava/lang/Object;
    .param p5, "method"    # Ljava/lang/reflect/Method;
    .param p6, "args"    # [Ljava/lang/Object;

    .line 80
    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    #disallowed odex opcode
    #sget-object-volatile p0, Landroid/app/Notification;->CREATOR:Landroid/os/Parcelable$Creator;
    nop

    nop

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ContextFactory;->call(Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method invokeImpl(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "topScope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObject"    # Ljava/lang/Object;
    .param p5, "method"    # Ljava/lang/reflect/Method;
    .param p6, "args"    # [Ljava/lang/Object;

    .line 91
    instance-of v0, p2, Lcom/trendmicro/hippo/Callable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 92
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/Callable;

    .local v0, "function":Lcom/trendmicro/hippo/Callable;
    goto :goto_0

    .line 94
    .end local v0    # "function":Lcom/trendmicro/hippo/Callable;
    :cond_0
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    .line 95
    .local v0, "s":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual {p5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    .line 96
    .local v2, "methodName":Ljava/lang/String;
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 97
    .local v3, "value":Ljava/lang/Object;
    sget-object v4, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-ne v3, v4, :cond_2

    .line 101
    const-string v4, "msg.undefined.function.interface"

    invoke-static {v4, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;)V

    .line 103
    invoke-virtual {p5}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    .line 104
    .local v4, "resultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v5, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v4, v5, :cond_1

    .line 105
    return-object v1

    .line 107
    :cond_1
    invoke-static {v1, v4}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 109
    .end local v4    # "resultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    instance-of v4, v3, Lcom/trendmicro/hippo/Callable;

    if-eqz v4, :cond_7

    .line 113
    move-object v4, v3

    check-cast v4, Lcom/trendmicro/hippo/Callable;

    move-object v0, v4

    .line 115
    .end local v2    # "methodName":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/Object;
    .local v0, "function":Lcom/trendmicro/hippo/Callable;
    :goto_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v2

    .line 116
    .local v2, "wf":Lcom/trendmicro/hippo/WrapFactory;
    if-nez p6, :cond_3

    .line 117
    sget-object p6, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    goto :goto_2

    .line 119
    :cond_3
    const/4 v3, 0x0

    .local v3, "i":I
    array-length v4, p6

    .local v4, "N":I
    :goto_1
    if-eq v3, v4, :cond_5

    .line 120
    aget-object v5, p6, v3

    .line 122
    .local v5, "arg":Ljava/lang/Object;
    instance-of v6, v5, Ljava/lang/String;

    if-nez v6, :cond_4

    instance-of v6, v5, Ljava/lang/Number;

    if-nez v6, :cond_4

    instance-of v6, v5, Ljava/lang/Boolean;

    if-nez v6, :cond_4

    .line 124
    invoke-virtual {v2, p1, p3, v5, v1}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, p6, v3

    .line 119
    .end local v5    # "arg":Ljava/lang/Object;
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 128
    .end local v3    # "i":I
    .end local v4    # "N":I
    :cond_5
    :goto_2
    invoke-virtual {v2, p1, p3, p4, v1}, Lcom/trendmicro/hippo/WrapFactory;->wrapAsJavaObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 130
    .local v1, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v0, p1, p3, v1, p6}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 131
    .local v3, "result":Ljava/lang/Object;
    invoke-virtual {p5}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    .line 132
    .local v4, "javaResultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v5, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v4, v5, :cond_6

    .line 133
    const/4 v3, 0x0

    goto :goto_3

    .line 135
    :cond_6
    invoke-static {v3, v4}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    .line 137
    :goto_3
    return-object v3

    .line 110
    .end local v1    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v4    # "javaResultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v0, "s":Lcom/trendmicro/hippo/Scriptable;
    .local v2, "methodName":Ljava/lang/String;
    .local v3, "value":Ljava/lang/Object;
    :cond_7
    const-string v1, "msg.not.function.interface"

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1
.end method
