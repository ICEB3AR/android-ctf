.class Lcom/trendmicro/hippo/SecureCaller$2;
.super Ljava/lang/Object;
.source "SecureCaller.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/SecureCaller;->callSecurely(Ljava/security/CodeSource;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedExceptionAction<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$classLoader:Ljava/lang/ClassLoader;

.field final synthetic val$codeSource:Ljava/security/CodeSource;


# direct methods
.method constructor <init>(Ljava/lang/ClassLoader;Ljava/security/CodeSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 83
    iput-object p1, p0, Lcom/trendmicro/hippo/SecureCaller$2;->val$classLoader:Ljava/lang/ClassLoader;

    iput-object p2, p0, Lcom/trendmicro/hippo/SecureCaller$2;->val$codeSource:Ljava/security/CodeSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 88
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 89
    .local v0, "thisClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v1, p0, Lcom/trendmicro/hippo/SecureCaller$2;->val$classLoader:Ljava/lang/ClassLoader;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    if-eq v1, v0, :cond_0

    .line 90
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .local v1, "effectiveClassLoader":Ljava/lang/ClassLoader;
    goto :goto_0

    .line 92
    .end local v1    # "effectiveClassLoader":Ljava/lang/ClassLoader;
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/SecureCaller$2;->val$classLoader:Ljava/lang/ClassLoader;

    .line 94
    .restart local v1    # "effectiveClassLoader":Ljava/lang/ClassLoader;
    :goto_0
    new-instance v2, Lcom/trendmicro/hippo/SecureCaller$SecureClassLoaderImpl;

    invoke-direct {v2, v1}, Lcom/trendmicro/hippo/SecureCaller$SecureClassLoaderImpl;-><init>(Ljava/lang/ClassLoader;)V

    .line 96
    .local v2, "secCl":Lcom/trendmicro/hippo/SecureCaller$SecureClassLoaderImpl;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-class v4, Lcom/trendmicro/hippo/SecureCaller;

    .line 97
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "Impl"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 98
    invoke-static {}, Lcom/trendmicro/hippo/SecureCaller;->access$000()[B

    move-result-object v4

    iget-object v5, p0, Lcom/trendmicro/hippo/SecureCaller$2;->val$codeSource:Ljava/security/CodeSource;

    .line 96
    invoke-virtual {v2, v3, v4, v5}, Lcom/trendmicro/hippo/SecureCaller$SecureClassLoaderImpl;->defineAndLinkClass(Ljava/lang/String;[BLjava/security/CodeSource;)Ljava/lang/Class;

    move-result-object v3

    .line 99
    .local v3, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    return-object v4
.end method
