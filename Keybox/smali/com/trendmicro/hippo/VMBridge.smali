.class public abstract Lcom/trendmicro/hippo/VMBridge;
.super Ljava/lang/Object;
.source "VMBridge.java"


# static fields
.field static final instance:Lcom/trendmicro/hippo/VMBridge;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    invoke-static {}, Lcom/trendmicro/hippo/VMBridge;->makeInstance()Lcom/trendmicro/hippo/VMBridge;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static makeInstance()Lcom/trendmicro/hippo/VMBridge;
    .locals 5

    .line 21
    const-string v0, "com.trendmicro.hippo.VMBridge_custom"

    const-string v1, "com.trendmicro.hippo.jdk18.VMBridge_jdk18"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    .line 25
    .local v0, "classNames":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-eq v1, v2, :cond_1

    .line 26
    aget-object v2, v0, v1

    .line 27
    .local v2, "className":Ljava/lang/String;
    invoke-static {v2}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 28
    .local v3, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v3, :cond_0

    .line 29
    invoke-static {v3}, Lcom/trendmicro/hippo/Kit;->newInstanceOrNull(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/VMBridge;

    .line 30
    .local v4, "bridge":Lcom/trendmicro/hippo/VMBridge;
    if-eqz v4, :cond_0

    .line 31
    return-object v4

    .line 25
    .end local v2    # "className":Ljava/lang/String;
    .end local v3    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "bridge":Lcom/trendmicro/hippo/VMBridge;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 35
    .end local v1    # "i":I
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Failed to create VMBridge instance"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method protected abstract getContext(Ljava/lang/Object;)Lcom/trendmicro/hippo/Context;
.end method

.method protected abstract getInterfaceProxyHelper(Lcom/trendmicro/hippo/ContextFactory;[Ljava/lang/Class;)Ljava/lang/Object;
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
.end method

.method protected abstract getThreadContextHelper()Ljava/lang/Object;
.end method

.method protected abstract newInterfaceProxy(Ljava/lang/Object;Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/InterfaceAdapter;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
.end method

.method protected abstract setContext(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)V
.end method

.method protected abstract tryToMakeAccessible(Ljava/lang/reflect/AccessibleObject;)Z
.end method
