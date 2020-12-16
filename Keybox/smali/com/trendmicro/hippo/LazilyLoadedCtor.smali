.class public final Lcom/trendmicro/hippo/LazilyLoadedCtor;
.super Ljava/lang/Object;
.source "LazilyLoadedCtor.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final STATE_BEFORE_INIT:I = 0x0

.field private static final STATE_INITIALIZING:I = 0x1

.field private static final STATE_WITH_VALUE:I = 0x2

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final className:Ljava/lang/String;

.field private initializedValue:Ljava/lang/Object;

.field private final privileged:Z

.field private final propertyName:Ljava/lang/String;

.field private final scope:Lcom/trendmicro/hippo/ScriptableObject;

.field private final sealed:Z

.field private state:I


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6
    .param p1, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p2, "propertyName"    # Ljava/lang/String;
    .param p3, "className"    # Ljava/lang/String;
    .param p4, "sealed"    # Z

    .line 36
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 37
    return-void
.end method

.method constructor <init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p2, "propertyName"    # Ljava/lang/String;
    .param p3, "className"    # Ljava/lang/String;
    .param p4, "sealed"    # Z
    .param p5, "privileged"    # Z

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->scope:Lcom/trendmicro/hippo/ScriptableObject;

    .line 44
    iput-object p2, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->propertyName:Ljava/lang/String;

    .line 45
    iput-object p3, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->className:Ljava/lang/String;

    .line 46
    iput-boolean p4, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->sealed:Z

    .line 47
    iput-boolean p5, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->privileged:Z

    .line 48
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->state:I

    .line 50
    const/4 v1, 0x2

    invoke-virtual {p1, p2, v0, p0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->addLazilyInitializedValue(Ljava/lang/String;ILcom/trendmicro/hippo/LazilyLoadedCtor;I)V

    .line 52
    return-void
.end method

.method static synthetic access$000(Lcom/trendmicro/hippo/LazilyLoadedCtor;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/LazilyLoadedCtor;

    .line 18
    invoke-direct {p0}, Lcom/trendmicro/hippo/LazilyLoadedCtor;->buildValue0()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private buildValue()Ljava/lang/Object;
    .locals 1

    .line 84
    iget-boolean v0, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->privileged:Z

    if-eqz v0, :cond_0

    .line 86
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor$1;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/LazilyLoadedCtor$1;-><init>(Lcom/trendmicro/hippo/LazilyLoadedCtor;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 95
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/LazilyLoadedCtor;->buildValue0()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private buildValue0()Ljava/lang/Object;
    .locals 5

    .line 100
    iget-object v0, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->className:Ljava/lang/String;

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/LazilyLoadedCtor;->cast(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    .line 101
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/trendmicro/hippo/Scriptable;>;"
    if-eqz v0, :cond_3

    .line 103
    :try_start_0
    iget-object v1, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->scope:Lcom/trendmicro/hippo/ScriptableObject;

    iget-boolean v2, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->sealed:Z

    const/4 v3, 0x0

    invoke-static {v1, v0, v2, v3}, Lcom/trendmicro/hippo/ScriptableObject;->buildClassCtor(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;ZZ)Lcom/trendmicro/hippo/BaseFunction;

    move-result-object v1

    .line 105
    .local v1, "value":Ljava/lang/Object;
    if-eqz v1, :cond_0

    .line 106
    return-object v1

    .line 110
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->scope:Lcom/trendmicro/hippo/ScriptableObject;

    iget-object v3, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->propertyName:Ljava/lang/String;

    iget-object v4, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->scope:Lcom/trendmicro/hippo/ScriptableObject;

    invoke-virtual {v2, v3, v4}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    move-object v1, v2

    .line 111
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    if-eq v1, v2, :cond_1

    .line 112
    return-object v1

    .line 111
    .end local v1    # "value":Ljava/lang/Object;
    :cond_1
    goto :goto_0

    .line 121
    :catch_0
    move-exception v1

    goto :goto_1

    .line 120
    :catch_1
    move-exception v1

    goto :goto_0

    .line 119
    :catch_2
    move-exception v1

    goto :goto_0

    .line 118
    :catch_3
    move-exception v1

    .line 122
    :goto_0
    goto :goto_1

    .line 113
    :catch_4
    move-exception v1

    .line 114
    .local v1, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v2

    .line 115
    .local v2, "target":Ljava/lang/Throwable;
    instance-of v3, v2, Ljava/lang/RuntimeException;

    if-nez v3, :cond_2

    .end local v1    # "ex":Ljava/lang/reflect/InvocationTargetException;
    .end local v2    # "target":Ljava/lang/Throwable;
    goto :goto_0

    .line 116
    .restart local v1    # "ex":Ljava/lang/reflect/InvocationTargetException;
    .restart local v2    # "target":Ljava/lang/Throwable;
    :cond_2
    move-object v3, v2

    check-cast v3, Ljava/lang/RuntimeException;

    throw v3

    .line 124
    .end local v1    # "ex":Ljava/lang/reflect/InvocationTargetException;
    .end local v2    # "target":Ljava/lang/Throwable;
    :cond_3
    :goto_1
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v1
.end method

.method private cast(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Class<",
            "+",
            "Lcom/trendmicro/hippo/Scriptable;",
            ">;"
        }
    .end annotation

    .line 129
    .local p1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    return-object p1
.end method


# virtual methods
.method getValue()Ljava/lang/Object;
    .locals 2

    .line 77
    iget v0, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->state:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 79
    iget-object v0, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->initializedValue:Ljava/lang/Object;

    return-object v0

    .line 78
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    iget-object v1, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->propertyName:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method init()V
    .locals 3

    .line 56
    monitor-enter p0

    .line 57
    :try_start_0
    iget v0, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->state:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 60
    iget v0, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->state:I

    if-nez v0, :cond_0

    .line 61
    iput v1, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->state:I

    .line 64
    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 66
    .local v0, "value":Ljava/lang/Object;
    const/4 v1, 0x2

    :try_start_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/LazilyLoadedCtor;->buildValue()Ljava/lang/Object;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v0, v2

    .line 68
    :try_start_2
    iput-object v0, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->initializedValue:Ljava/lang/Object;

    .line 69
    iput v1, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->state:I

    .line 70
    goto :goto_0

    .line 68
    :catchall_0
    move-exception v2

    iput-object v0, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->initializedValue:Ljava/lang/Object;

    .line 69
    iput v1, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->state:I

    .line 70
    throw v2

    .line 72
    .end local v0    # "value":Ljava/lang/Object;
    :cond_0
    :goto_0
    monitor-exit p0

    .line 73
    return-void

    .line 58
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Recursive initialization for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor;->propertyName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :catchall_1
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method
