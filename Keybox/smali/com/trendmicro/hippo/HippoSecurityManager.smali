.class public Lcom/trendmicro/hippo/HippoSecurityManager;
.super Ljava/lang/SecurityManager;
.source "HippoSecurityManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/SecurityManager;-><init>()V

    return-void
.end method


# virtual methods
.method protected getCurrentScriptClass()Ljava/lang/Class;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 23
    invoke-virtual {p0}, Lcom/trendmicro/hippo/HippoSecurityManager;->getClassContext()[Ljava/lang/Class;

    move-result-object v0

    .line 24
    .local v0, "context":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_3

    aget-object v3, v0, v2

    .line 25
    .local v3, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v4, Lcom/trendmicro/hippo/InterpretedFunction;

    if-eq v3, v4, :cond_0

    const-class v4, Lcom/trendmicro/hippo/NativeFunction;

    invoke-virtual {v4, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-nez v4, :cond_1

    :cond_0
    const-class v4, Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;

    .line 26
    invoke-virtual {v4, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 27
    :cond_1
    return-object v3

    .line 24
    .end local v3    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 30
    :cond_3
    const/4 v1, 0x0

    return-object v1
.end method
