.class public Lcom/trendmicro/hippo/DefiningClassLoader;
.super Ljava/lang/ClassLoader;
.source "DefiningClassLoader.java"

# interfaces
.implements Lcom/trendmicro/hippo/GeneratedClassLoader;


# instance fields
.field private final parentLoader:Ljava/lang/ClassLoader;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/ClassLoader;-><init>()V

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/DefiningClassLoader;->parentLoader:Ljava/lang/ClassLoader;

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;)V
    .locals 0
    .param p1, "parentLoader"    # Ljava/lang/ClassLoader;

    .line 19
    invoke-direct {p0}, Ljava/lang/ClassLoader;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/trendmicro/hippo/DefiningClassLoader;->parentLoader:Ljava/lang/ClassLoader;

    .line 21
    return-void
.end method


# virtual methods
.method public defineClass(Ljava/lang/String;[B)Ljava/lang/Class;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 28
    array-length v4, p2

    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/SecurityUtilities;->getProtectionDomain(Ljava/lang/Class;)Ljava/security/ProtectionDomain;

    move-result-object v5

    .line 28
    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-super/range {v0 .. v5}, Ljava/lang/ClassLoader;->defineClass(Ljava/lang/String;[BIILjava/security/ProtectionDomain;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public linkClass(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 34
    .local p1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/DefiningClassLoader;->resolveClass(Ljava/lang/Class;)V

    .line 35
    return-void
.end method

.method public loadClass(Ljava/lang/String;Z)Ljava/lang/Class;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "resolve"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 41
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/DefiningClassLoader;->findLoadedClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 42
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v0, :cond_1

    .line 43
    iget-object v1, p0, Lcom/trendmicro/hippo/DefiningClassLoader;->parentLoader:Ljava/lang/ClassLoader;

    if-eqz v1, :cond_0

    .line 44
    invoke-virtual {v1, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 46
    :cond_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/DefiningClassLoader;->findSystemClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 49
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 50
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/DefiningClassLoader;->resolveClass(Ljava/lang/Class;)V

    .line 52
    :cond_2
    return-object v0
.end method
