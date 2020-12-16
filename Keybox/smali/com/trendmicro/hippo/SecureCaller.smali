.class public abstract Lcom/trendmicro/hippo/SecureCaller;
.super Ljava/lang/Object;
.source "SecureCaller.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/SecureCaller$SecureClassLoaderImpl;
    }
.end annotation


# static fields
.field private static final callers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/security/CodeSource;",
            "Ljava/util/Map<",
            "Ljava/lang/ClassLoader;",
            "Ljava/lang/ref/SoftReference<",
            "Lcom/trendmicro/hippo/SecureCaller;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private static final secureCallerImplBytecode:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    invoke-static {}, Lcom/trendmicro/hippo/SecureCaller;->loadBytecode()[B

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/SecureCaller;->secureCallerImplBytecode:[B

    .line 34
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/SecureCaller;->callers:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()[B
    .locals 1

    .line 25
    sget-object v0, Lcom/trendmicro/hippo/SecureCaller;->secureCallerImplBytecode:[B

    return-object v0
.end method

.method static synthetic access$100()[B
    .locals 1

    .line 25
    invoke-static {}, Lcom/trendmicro/hippo/SecureCaller;->loadBytecodePrivileged()[B

    move-result-object v0

    return-object v0
.end method

.method static callSecurely(Ljava/security/CodeSource;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .param p0, "codeSource"    # Ljava/security/CodeSource;
    .param p1, "callable"    # Lcom/trendmicro/hippo/Callable;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 47
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 50
    .local v0, "thread":Ljava/lang/Thread;
    new-instance v1, Lcom/trendmicro/hippo/SecureCaller$1;

    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/SecureCaller$1;-><init>(Ljava/lang/Thread;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ClassLoader;

    .line 58
    .local v1, "classLoader":Ljava/lang/ClassLoader;
    sget-object v2, Lcom/trendmicro/hippo/SecureCaller;->callers:Ljava/util/Map;

    monitor-enter v2

    .line 60
    :try_start_0
    sget-object v3, Lcom/trendmicro/hippo/SecureCaller;->callers:Ljava/util/Map;

    invoke-interface {v3, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 61
    .local v3, "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/SecureCaller;>;>;"
    if-nez v3, :cond_0

    .line 63
    new-instance v4, Ljava/util/WeakHashMap;

    invoke-direct {v4}, Ljava/util/WeakHashMap;-><init>()V

    move-object v3, v4

    .line 64
    sget-object v4, Lcom/trendmicro/hippo/SecureCaller;->callers:Ljava/util/Map;

    invoke-interface {v4, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 68
    monitor-enter v3

    .line 70
    :try_start_1
    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/SoftReference;

    .line 71
    .local v2, "ref":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/SecureCaller;>;"
    if-eqz v2, :cond_1

    .line 72
    invoke-virtual {v2}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/SecureCaller;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .local v4, "caller":Lcom/trendmicro/hippo/SecureCaller;
    goto :goto_0

    .line 74
    .end local v4    # "caller":Lcom/trendmicro/hippo/SecureCaller;
    :cond_1
    const/4 v4, 0x0

    .line 76
    .restart local v4    # "caller":Lcom/trendmicro/hippo/SecureCaller;
    :goto_0
    if-nez v4, :cond_2

    .line 81
    :try_start_2
    new-instance v5, Lcom/trendmicro/hippo/SecureCaller$2;

    invoke-direct {v5, v1, p0}, Lcom/trendmicro/hippo/SecureCaller$2;-><init>(Ljava/lang/ClassLoader;Ljava/security/CodeSource;)V

    invoke-static {v5}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/SecureCaller;

    move-object v4, v5

    .line 102
    new-instance v5, Ljava/lang/ref/SoftReference;

    invoke-direct {v5, v4}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v3, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/security/PrivilegedActionException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 107
    move-object v2, v4

    goto :goto_1

    .line 104
    :catch_0
    move-exception v5

    .line 106
    .local v5, "ex":Ljava/security/PrivilegedActionException;
    :try_start_3
    new-instance v6, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-virtual {v5}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    .end local v0    # "thread":Ljava/lang/Thread;
    .end local v1    # "classLoader":Ljava/lang/ClassLoader;
    .end local v3    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/SecureCaller;>;>;"
    .end local p0    # "codeSource":Ljava/security/CodeSource;
    .end local p1    # "callable":Lcom/trendmicro/hippo/Callable;
    .end local p2    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p3    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local p4    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local p5    # "args":[Ljava/lang/Object;
    throw v6

    .line 76
    .end local v5    # "ex":Ljava/security/PrivilegedActionException;
    .restart local v0    # "thread":Ljava/lang/Thread;
    .restart local v1    # "classLoader":Ljava/lang/ClassLoader;
    .restart local v3    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/SecureCaller;>;>;"
    .restart local p0    # "codeSource":Ljava/security/CodeSource;
    .restart local p1    # "callable":Lcom/trendmicro/hippo/Callable;
    .restart local p2    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p3    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .restart local p4    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local p5    # "args":[Ljava/lang/Object;
    :cond_2
    move-object v2, v4

    .line 109
    .end local v4    # "caller":Lcom/trendmicro/hippo/SecureCaller;
    .local v2, "caller":Lcom/trendmicro/hippo/SecureCaller;
    :goto_1
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 110
    move-object v4, v2

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    move-object v8, p4

    move-object v9, p5

    invoke-virtual/range {v4 .. v9}, Lcom/trendmicro/hippo/SecureCaller;->call(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    return-object v4

    .line 109
    .end local v2    # "caller":Lcom/trendmicro/hippo/SecureCaller;
    :catchall_0
    move-exception v2

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v2

    .line 66
    .end local v3    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/SecureCaller;>;>;"
    :catchall_1
    move-exception v3

    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v3
.end method

.method private static loadBytecode()[B
    .locals 1

    .line 130
    new-instance v0, Lcom/trendmicro/hippo/SecureCaller$3;

    invoke-direct {v0}, Lcom/trendmicro/hippo/SecureCaller$3;-><init>()V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method private static loadBytecodePrivileged()[B
    .locals 5

    .line 142
    const-class v0, Lcom/trendmicro/hippo/SecureCaller;

    const-string v1, "SecureCallerImpl.clazz"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 145
    .local v0, "url":Ljava/net/URL;
    :try_start_0
    invoke-virtual {v0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    .local v1, "in":Ljava/io/InputStream;
    :try_start_1
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 151
    .local v2, "bout":Ljava/io/ByteArrayOutputStream;
    :goto_0
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 152
    .local v3, "r":I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    .line 154
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 161
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 154
    return-object v4

    .line 156
    :cond_0
    :try_start_3
    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 157
    .end local v3    # "r":I
    goto :goto_0

    .line 161
    .end local v2    # "bout":Ljava/io/ByteArrayOutputStream;
    :catchall_0
    move-exception v2

    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 162
    nop

    .end local v0    # "url":Ljava/net/URL;
    throw v2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 164
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v0    # "url":Ljava/net/URL;
    :catch_0
    move-exception v1

    .line 166
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-direct {v2, v1}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public abstract call(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
.end method
