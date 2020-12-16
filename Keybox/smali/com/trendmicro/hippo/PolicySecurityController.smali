.class public Lcom/trendmicro/hippo/PolicySecurityController;
.super Lcom/trendmicro/hippo/SecurityController;
.source "PolicySecurityController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/PolicySecurityController$Loader;,
        Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;
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
            "Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private static final secureCallerImplBytecode:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    invoke-static {}, Lcom/trendmicro/hippo/PolicySecurityController;->loadBytecode()[B

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/PolicySecurityController;->secureCallerImplBytecode:[B

    .line 42
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/PolicySecurityController;->callers:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/trendmicro/hippo/SecurityController;-><init>()V

    return-void
.end method

.method static synthetic access$000()[B
    .locals 1

    .line 33
    sget-object v0, Lcom/trendmicro/hippo/PolicySecurityController;->secureCallerImplBytecode:[B

    return-object v0
.end method

.method private static loadBytecode()[B
    .locals 8

    .line 168
    const-class v0, Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 169
    .local v0, "secureCallerClassName":Ljava/lang/String;
    new-instance v1, Lcom/trendmicro/classfile/ClassFileWriter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "Impl"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "<generated>"

    invoke-direct {v1, v2, v0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .local v1, "cfw":Lcom/trendmicro/classfile/ClassFileWriter;
    const-string v2, "<init>"

    const-string v3, "()V"

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 173
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 174
    const/16 v5, 0xb7

    invoke-virtual {v1, v5, v0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    const/16 v2, 0xb1

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 177
    invoke-virtual {v1, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 178
    const-string v2, "Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;"

    .line 184
    .local v2, "callableCallSig":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "(Lcom/trendmicro/hippo/Callable;"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "call"

    const/16 v5, 0x11

    invoke-virtual {v1, v4, v3, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 188
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    const/4 v5, 0x6

    if-ge v3, v5, :cond_0

    .line 189
    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 188
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 191
    .end local v3    # "i":I
    :cond_0
    const/16 v3, 0xb9

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "com/trendmicro/hippo/Callable"

    invoke-virtual {v1, v3, v7, v4, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    const/16 v3, 0xb0

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 195
    invoke-virtual {v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 196
    invoke-virtual {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public callWithDomain(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p1, "securityDomain"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "callable"    # Lcom/trendmicro/hippo/Callable;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p6, "args"    # [Ljava/lang/Object;

    .line 104
    move-object v1, p0

    new-instance v0, Lcom/trendmicro/hippo/PolicySecurityController$2;

    move-object v8, p2

    invoke-direct {v0, p0, p2}, Lcom/trendmicro/hippo/PolicySecurityController$2;-><init>(Lcom/trendmicro/hippo/PolicySecurityController;Lcom/trendmicro/hippo/Context;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Ljava/lang/ClassLoader;

    .line 111
    .local v9, "classLoader":Ljava/lang/ClassLoader;
    move-object v10, p1

    check-cast v10, Ljava/security/CodeSource;

    .line 113
    .local v10, "codeSource":Ljava/security/CodeSource;
    sget-object v2, Lcom/trendmicro/hippo/PolicySecurityController;->callers:Ljava/util/Map;

    monitor-enter v2

    .line 114
    :try_start_0
    sget-object v0, Lcom/trendmicro/hippo/PolicySecurityController;->callers:Ljava/util/Map;

    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 115
    .local v0, "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;>;>;"
    if-nez v0, :cond_0

    .line 116
    new-instance v3, Ljava/util/WeakHashMap;

    invoke-direct {v3}, Ljava/util/WeakHashMap;-><init>()V

    move-object v0, v3

    .line 117
    sget-object v3, Lcom/trendmicro/hippo/PolicySecurityController;->callers:Ljava/util/Map;

    invoke-interface {v3, v10, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v11, v0

    goto :goto_0

    .line 115
    :cond_0
    move-object v11, v0

    .line 119
    .end local v0    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;>;>;"
    .local v11, "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;>;>;"
    :goto_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 121
    monitor-enter v11

    .line 122
    :try_start_1
    invoke-interface {v11, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/SoftReference;

    move-object v2, v0

    .line 123
    .local v2, "ref":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;>;"
    if-eqz v2, :cond_1

    .line 124
    invoke-virtual {v2}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v3, v0

    .local v0, "caller":Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;
    goto :goto_1

    .line 126
    .end local v0    # "caller":Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;
    :cond_1
    const/4 v0, 0x0

    move-object v3, v0

    .line 128
    .local v3, "caller":Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;
    :goto_1
    if-nez v3, :cond_2

    .line 134
    :try_start_2
    new-instance v0, Lcom/trendmicro/hippo/PolicySecurityController$3;

    invoke-direct {v0, p0, v9, v10}, Lcom/trendmicro/hippo/PolicySecurityController$3;-><init>(Lcom/trendmicro/hippo/PolicySecurityController;Ljava/lang/ClassLoader;Ljava/security/CodeSource;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;

    move-object v3, v0

    .line 148
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, v3}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v11, v9, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/security/PrivilegedActionException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 153
    move-object v0, v3

    goto :goto_2

    .line 150
    :catch_0
    move-exception v0

    .line 152
    .local v0, "ex":Ljava/security/PrivilegedActionException;
    :try_start_3
    new-instance v4, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    .end local v9    # "classLoader":Ljava/lang/ClassLoader;
    .end local v10    # "codeSource":Ljava/security/CodeSource;
    .end local v11    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;>;>;"
    .end local p1    # "securityDomain":Ljava/lang/Object;
    .end local p2    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p3    # "callable":Lcom/trendmicro/hippo/Callable;
    .end local p4    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local p5    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .end local p6    # "args":[Ljava/lang/Object;
    throw v4

    .line 128
    .end local v0    # "ex":Ljava/security/PrivilegedActionException;
    .restart local v9    # "classLoader":Ljava/lang/ClassLoader;
    .restart local v10    # "codeSource":Ljava/security/CodeSource;
    .restart local v11    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;>;>;"
    .restart local p1    # "securityDomain":Ljava/lang/Object;
    .restart local p2    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p3    # "callable":Lcom/trendmicro/hippo/Callable;
    .restart local p4    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .restart local p5    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .restart local p6    # "args":[Ljava/lang/Object;
    :cond_2
    move-object v0, v3

    .line 155
    .end local v2    # "ref":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;>;"
    .end local v3    # "caller":Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;
    .local v0, "caller":Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;
    :goto_2
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 156
    move-object v2, v0

    move-object v3, p3

    move-object v4, p2

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    invoke-virtual/range {v2 .. v7}, Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;->call(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 155
    .end local v0    # "caller":Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;
    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0

    .line 119
    .end local v11    # "classLoaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/ClassLoader;Ljava/lang/ref/SoftReference<Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;>;>;"
    :catchall_1
    move-exception v0

    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v0
.end method

.method public createClassLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lcom/trendmicro/hippo/GeneratedClassLoader;
    .locals 1
    .param p1, "parent"    # Ljava/lang/ClassLoader;
    .param p2, "securityDomain"    # Ljava/lang/Object;

    .line 78
    new-instance v0, Lcom/trendmicro/hippo/PolicySecurityController$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/trendmicro/hippo/PolicySecurityController$1;-><init>(Lcom/trendmicro/hippo/PolicySecurityController;Ljava/lang/ClassLoader;Ljava/lang/Object;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/PolicySecurityController$Loader;

    return-object v0
.end method

.method public getDynamicSecurityDomain(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p1, "securityDomain"    # Ljava/lang/Object;

    .line 94
    return-object p1
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

    .line 47
    const-class v0, Ljava/security/CodeSource;

    return-object v0
.end method
