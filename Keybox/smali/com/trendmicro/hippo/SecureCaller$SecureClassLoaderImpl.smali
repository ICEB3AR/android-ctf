.class Lcom/trendmicro/hippo/SecureCaller$SecureClassLoaderImpl;
.super Ljava/security/SecureClassLoader;
.source "SecureCaller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/SecureCaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SecureClassLoaderImpl"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/ClassLoader;)V
    .locals 0
    .param p1, "parent"    # Ljava/lang/ClassLoader;

    .line 117
    invoke-direct {p0, p1}, Ljava/security/SecureClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    .line 118
    return-void
.end method


# virtual methods
.method defineAndLinkClass(Ljava/lang/String;[BLjava/security/CodeSource;)Ljava/lang/Class;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "bytes"    # [B
    .param p3, "cs"    # Ljava/security/CodeSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B",
            "Ljava/security/CodeSource;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 122
    array-length v4, p2

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/SecureCaller$SecureClassLoaderImpl;->defineClass(Ljava/lang/String;[BIILjava/security/CodeSource;)Ljava/lang/Class;

    move-result-object v0

    .line 123
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/SecureCaller$SecureClassLoaderImpl;->resolveClass(Ljava/lang/Class;)V

    .line 124
    return-object v0
.end method
