.class public Lcom/trendmicro/hippo/NativeJavaPackage;
.super Lcom/trendmicro/hippo/ScriptableObject;
.source "NativeJavaPackage.java"


# static fields
.field private static final serialVersionUID:J = 0x67522583d936a423L


# instance fields
.field private transient classLoader:Ljava/lang/ClassLoader;

.field private negativeCache:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private packageName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 53
    nop

    .line 54
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getApplicationClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 53
    const/4 v1, 0x0

    invoke-direct {p0, v1, p1, v0}, Lcom/trendmicro/hippo/NativeJavaPackage;-><init>(ZLjava/lang/String;Ljava/lang/ClassLoader;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 44
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lcom/trendmicro/hippo/NativeJavaPackage;-><init>(ZLjava/lang/String;Ljava/lang/ClassLoader;)V

    .line 45
    return-void
.end method

.method constructor <init>(ZLjava/lang/String;Ljava/lang/ClassLoader;)V
    .locals 1
    .param p1, "internalUsage"    # Z
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "classLoader"    # Ljava/lang/ClassLoader;

    .line 33
    invoke-direct {p0}, Lcom/trendmicro/hippo/ScriptableObject;-><init>()V

    .line 192
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->negativeCache:Ljava/util/Set;

    .line 34
    iput-object p2, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->packageName:Ljava/lang/String;

    .line 35
    iput-object p3, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->classLoader:Ljava/lang/ClassLoader;

    .line 36
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 165
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 166
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getApplicationClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->classLoader:Ljava/lang/ClassLoader;

    .line 167
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .line 176
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeJavaPackage;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 177
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeJavaPackage;

    .line 178
    .local v0, "njp":Lcom/trendmicro/hippo/NativeJavaPackage;
    iget-object v2, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->packageName:Ljava/lang/String;

    iget-object v3, v0, Lcom/trendmicro/hippo/NativeJavaPackage;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->classLoader:Ljava/lang/ClassLoader;

    iget-object v3, v0, Lcom/trendmicro/hippo/NativeJavaPackage;->classLoader:Ljava/lang/ClassLoader;

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 181
    .end local v0    # "njp":Lcom/trendmicro/hippo/NativeJavaPackage;
    :cond_1
    return v1
.end method

.method forcePackage(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/NativeJavaPackage;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 96
    invoke-super {p0, p1, p0}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 97
    .local v0, "cached":Ljava/lang/Object;
    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/trendmicro/hippo/NativeJavaPackage;

    if-eqz v1, :cond_0

    .line 98
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/NativeJavaPackage;

    return-object v1

    .line 100
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->packageName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 101
    move-object v1, p1

    goto :goto_0

    .line 102
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    nop

    .line 103
    .local v1, "newPackage":Ljava/lang/String;
    new-instance v2, Lcom/trendmicro/hippo/NativeJavaPackage;

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->classLoader:Ljava/lang/ClassLoader;

    invoke-direct {v2, v3, v1, v4}, Lcom/trendmicro/hippo/NativeJavaPackage;-><init>(ZLjava/lang/String;Ljava/lang/ClassLoader;)V

    .line 104
    .local v2, "pkg":Lcom/trendmicro/hippo/NativeJavaPackage;
    invoke-static {v2, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;)V

    .line 105
    invoke-super {p0, p1, p0, v2}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 106
    return-object v2
.end method

.method public get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 89
    sget-object v0, Lcom/trendmicro/hippo/NativeJavaPackage;->NOT_FOUND:Ljava/lang/Object;

    return-object v0
.end method

.method public get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 84
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/trendmicro/hippo/NativeJavaPackage;->getPkgProperty(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 59
    const-string v0, "JavaPackage"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 161
    .local p1, "ignored":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaPackage;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method declared-synchronized getPkgProperty(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Z)Ljava/lang/Object;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "createPkg"    # Z

    monitor-enter p0

    .line 112
    :try_start_0
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 113
    .local v0, "cached":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/NativeJavaPackage;->NOT_FOUND:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eq v0, v1, :cond_0

    .line 114
    monitor-exit p0

    return-object v0

    .line 115
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->negativeCache:Ljava/util/Set;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->negativeCache:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_1

    .line 117
    const/4 v1, 0x0

    monitor-exit p0

    return-object v1

    .line 120
    .end local p0    # "this":Lcom/trendmicro/hippo/NativeJavaPackage;
    :cond_1
    :try_start_2
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->packageName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    .line 121
    move-object v1, p1

    goto :goto_0

    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 122
    .local v1, "className":Ljava/lang/String;
    :goto_0
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v2

    .line 123
    .local v2, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Context;->getClassShutter()Lcom/trendmicro/hippo/ClassShutter;

    move-result-object v3

    .line 124
    .local v3, "shutter":Lcom/trendmicro/hippo/ClassShutter;
    const/4 v4, 0x0

    .line 125
    .local v4, "newValue":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v3, :cond_3

    invoke-interface {v3, v1}, Lcom/trendmicro/hippo/ClassShutter;->visibleToScripts(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 126
    :cond_3
    const/4 v5, 0x0

    .line 127
    .local v5, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v6, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->classLoader:Ljava/lang/ClassLoader;

    if-eqz v6, :cond_4

    .line 128
    iget-object v6, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->classLoader:Ljava/lang/ClassLoader;

    invoke-static {v6, v1}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    move-object v5, v6

    goto :goto_1

    .line 130
    :cond_4
    invoke-static {v1}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    move-object v5, v6

    .line 132
    :goto_1
    if-eqz v5, :cond_5

    .line 133
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v6

    .line 134
    .local v6, "wrapFactory":Lcom/trendmicro/hippo/WrapFactory;
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeJavaPackage;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v7

    invoke-virtual {v6, v2, v7, v5}, Lcom/trendmicro/hippo/WrapFactory;->wrapJavaClass(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v7

    move-object v4, v7

    .line 135
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaPackage;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v7

    invoke-interface {v4, v7}, Lcom/trendmicro/hippo/Scriptable;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 138
    .end local v5    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "wrapFactory":Lcom/trendmicro/hippo/WrapFactory;
    :cond_5
    if-nez v4, :cond_8

    .line 139
    if-eqz p3, :cond_6

    .line 141
    new-instance v5, Lcom/trendmicro/hippo/NativeJavaPackage;

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->classLoader:Ljava/lang/ClassLoader;

    invoke-direct {v5, v6, v1, v7}, Lcom/trendmicro/hippo/NativeJavaPackage;-><init>(ZLjava/lang/String;Ljava/lang/ClassLoader;)V

    .line 142
    .local v5, "pkg":Lcom/trendmicro/hippo/NativeJavaPackage;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaPackage;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;)V

    .line 143
    move-object v4, v5

    .line 144
    .end local v5    # "pkg":Lcom/trendmicro/hippo/NativeJavaPackage;
    goto :goto_2

    .line 146
    :cond_6
    iget-object v5, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->negativeCache:Ljava/util/Set;

    if-nez v5, :cond_7

    .line 147
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    iput-object v5, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->negativeCache:Ljava/util/Set;

    .line 148
    :cond_7
    iget-object v5, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->negativeCache:Ljava/util/Set;

    invoke-interface {v5, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 151
    :cond_8
    :goto_2
    if-eqz v4, :cond_9

    .line 154
    invoke-super {p0, p1, p2, v4}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 156
    :cond_9
    monitor-exit p0

    return-object v4

    .line 111
    .end local v0    # "cached":Ljava/lang/Object;
    .end local v1    # "className":Ljava/lang/String;
    .end local v2    # "cx":Lcom/trendmicro/hippo/Context;
    .end local v3    # "shutter":Lcom/trendmicro/hippo/ClassShutter;
    .end local v4    # "newValue":Lcom/trendmicro/hippo/Scriptable;
    .end local p1    # "name":Ljava/lang/String;
    .end local p2    # "start":Lcom/trendmicro/hippo/Scriptable;
    .end local p3    # "createPkg":Z
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public has(ILcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 69
    const/4 v0, 0x0

    return v0
.end method

.method public has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 64
    const/4 v0, 0x1

    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 186
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->packageName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 187
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->classLoader:Ljava/lang/ClassLoader;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    xor-int/2addr v0, v1

    .line 186
    return v0
.end method

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 79
    const-string v0, "msg.pkg.int"

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 75
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[JavaPackage "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaPackage;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
