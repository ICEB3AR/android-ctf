.class public Lcom/trendmicro/hippo/serialize/ScriptableInputStream;
.super Ljava/io/ObjectInputStream;
.source "ScriptableInputStream.java"


# instance fields
.field private classLoader:Ljava/lang/ClassLoader;

.field private scope:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    invoke-direct {p0, p1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 42
    iput-object p2, p0, Lcom/trendmicro/hippo/serialize/ScriptableInputStream;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 43
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/serialize/ScriptableInputStream;->enableResolveObject(Z)Z

    .line 44
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 45
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_0

    .line 46
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getApplicationClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/serialize/ScriptableInputStream;->classLoader:Ljava/lang/ClassLoader;

    .line 48
    :cond_0
    return-void
.end method


# virtual methods
.method protected resolveClass(Ljava/io/ObjectStreamClass;)Ljava/lang/Class;
    .locals 2
    .param p1, "desc"    # Ljava/io/ObjectStreamClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/ObjectStreamClass;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 54
    invoke-virtual {p1}, Ljava/io/ObjectStreamClass;->getName()Ljava/lang/String;

    move-result-object v0

    .line 55
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/serialize/ScriptableInputStream;->classLoader:Ljava/lang/ClassLoader;

    if-eqz v1, :cond_0

    .line 57
    :try_start_0
    invoke-virtual {v1, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 58
    :catch_0
    move-exception v1

    .line 62
    :cond_0
    invoke-super {p0, p1}, Ljava/io/ObjectInputStream;->resolveClass(Ljava/io/ObjectStreamClass;)Ljava/lang/Class;

    move-result-object v1

    return-object v1
.end method

.method protected resolveObject(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    instance-of v0, p1, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream$PendingLookup;

    if-eqz v0, :cond_1

    .line 70
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream$PendingLookup;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream$PendingLookup;->getName()Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/serialize/ScriptableInputStream;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->lookupQualifiedName(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 72
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq p1, v1, :cond_0

    .line 76
    .end local v0    # "name":Ljava/lang/String;
    goto :goto_0

    .line 73
    .restart local v0    # "name":Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Object "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " not found upon deserialization."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 76
    .end local v0    # "name":Ljava/lang/String;
    :cond_1
    instance-of v0, p1, Lcom/trendmicro/hippo/UniqueTag;

    if-eqz v0, :cond_2

    .line 77
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/UniqueTag;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/UniqueTag;->readResolve()Ljava/lang/Object;

    move-result-object p1

    goto :goto_0

    .line 78
    :cond_2
    instance-of v0, p1, Lcom/trendmicro/hippo/Undefined;

    if-eqz v0, :cond_3

    .line 79
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Undefined;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Undefined;->readResolve()Ljava/lang/Object;

    move-result-object p1

    .line 81
    :cond_3
    :goto_0
    return-object p1
.end method
