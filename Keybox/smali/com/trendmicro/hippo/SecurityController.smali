.class public abstract Lcom/trendmicro/hippo/SecurityController;
.super Ljava/lang/Object;
.source "SecurityController.java"


# static fields
.field private static global:Lcom/trendmicro/hippo/SecurityController;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lcom/trendmicro/hippo/GeneratedClassLoader;
    .locals 4
    .param p0, "parent"    # Ljava/lang/ClassLoader;
    .param p1, "staticDomain"    # Ljava/lang/Object;

    .line 103
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 104
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-nez p0, :cond_0

    .line 105
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getApplicationClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    .line 107
    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getSecurityController()Lcom/trendmicro/hippo/SecurityController;

    move-result-object v1

    .line 109
    .local v1, "sc":Lcom/trendmicro/hippo/SecurityController;
    if-nez v1, :cond_1

    .line 110
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/Context;->createClassLoader(Ljava/lang/ClassLoader;)Lcom/trendmicro/hippo/GeneratedClassLoader;

    move-result-object v2

    .local v2, "loader":Lcom/trendmicro/hippo/GeneratedClassLoader;
    goto :goto_0

    .line 112
    .end local v2    # "loader":Lcom/trendmicro/hippo/GeneratedClassLoader;
    :cond_1
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/SecurityController;->getDynamicSecurityDomain(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 113
    .local v2, "dynamicDomain":Ljava/lang/Object;
    invoke-virtual {v1, p0, v2}, Lcom/trendmicro/hippo/SecurityController;->createClassLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lcom/trendmicro/hippo/GeneratedClassLoader;

    move-result-object v3

    move-object v2, v3

    .line 115
    .local v2, "loader":Lcom/trendmicro/hippo/GeneratedClassLoader;
    :goto_0
    return-object v2
.end method

.method public static getStaticSecurityDomainClass()Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 119
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getSecurityController()Lcom/trendmicro/hippo/SecurityController;

    move-result-object v0

    .line 120
    .local v0, "sc":Lcom/trendmicro/hippo/SecurityController;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/SecurityController;->getStaticSecurityDomainClassInternal()Ljava/lang/Class;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method static global()Lcom/trendmicro/hippo/SecurityController;
    .locals 1

    .line 42
    sget-object v0, Lcom/trendmicro/hippo/SecurityController;->global:Lcom/trendmicro/hippo/SecurityController;

    return-object v0
.end method

.method public static hasGlobal()Z
    .locals 1

    .line 51
    sget-object v0, Lcom/trendmicro/hippo/SecurityController;->global:Lcom/trendmicro/hippo/SecurityController;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static initGlobal(Lcom/trendmicro/hippo/SecurityController;)V
    .locals 2
    .param p0, "controller"    # Lcom/trendmicro/hippo/SecurityController;

    .line 68
    if-eqz p0, :cond_1

    .line 69
    sget-object v0, Lcom/trendmicro/hippo/SecurityController;->global:Lcom/trendmicro/hippo/SecurityController;

    if-nez v0, :cond_0

    .line 72
    sput-object p0, Lcom/trendmicro/hippo/SecurityController;->global:Lcom/trendmicro/hippo/SecurityController;

    .line 73
    return-void

    .line 70
    :cond_0
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "Cannot overwrite already installed global SecurityController"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 68
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method public callWithDomain(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "securityDomain"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "callable"    # Lcom/trendmicro/hippo/Callable;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p6, "args"    # [Ljava/lang/Object;

    .line 156
    new-instance v0, Lcom/trendmicro/hippo/SecurityController$1;

    invoke-direct {v0, p0, p3, p5, p6}, Lcom/trendmicro/hippo/SecurityController$1;-><init>(Lcom/trendmicro/hippo/SecurityController;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)V

    invoke-virtual {p0, p2, p4, v0, p1}, Lcom/trendmicro/hippo/SecurityController;->execWithDomain(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Script;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public abstract createClassLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lcom/trendmicro/hippo/GeneratedClassLoader;
.end method

.method public execWithDomain(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Script;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "script"    # Lcom/trendmicro/hippo/Script;
    .param p4, "securityDomain"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 176
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "callWithDomain should be overridden"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public abstract getDynamicSecurityDomain(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public getStaticSecurityDomainClassInternal()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 125
    const/4 v0, 0x0

    return-object v0
.end method
