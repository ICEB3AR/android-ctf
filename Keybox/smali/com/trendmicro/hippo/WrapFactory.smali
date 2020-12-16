.class public Lcom/trendmicro/hippo/WrapFactory;
.super Ljava/lang/Object;
.source "WrapFactory.java"


# instance fields
.field private javaPrimitiveWrap:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 170
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/WrapFactory;->javaPrimitiveWrap:Z

    return-void
.end method


# virtual methods
.method public final isJavaPrimitiveWrap()Z
    .locals 1

    .line 155
    iget-boolean v0, p0, Lcom/trendmicro/hippo/WrapFactory;->javaPrimitiveWrap:Z

    return v0
.end method

.method public final setJavaPrimitiveWrap(Z)V
    .locals 2
    .param p1, "value"    # Z

    .line 163
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 164
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->isSealed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 165
    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 167
    :cond_0
    iput-boolean p1, p0, Lcom/trendmicro/hippo/WrapFactory;->javaPrimitiveWrap:Z

    .line 168
    return-void
.end method

.method public wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Context;",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 47
    .local p4, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p3, :cond_8

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq p3, v0, :cond_8

    instance-of v0, p3, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    goto :goto_1

    .line 52
    :cond_0
    if-eqz p4, :cond_3

    invoke-virtual {p4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 53
    sget-object v0, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne p4, v0, :cond_1

    .line 54
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 55
    :cond_1
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p4, v0, :cond_2

    .line 56
    move-object v0, p3

    check-cast v0, Ljava/lang/Character;

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 57
    :cond_2
    return-object p3

    .line 59
    :cond_3
    invoke-virtual {p0}, Lcom/trendmicro/hippo/WrapFactory;->isJavaPrimitiveWrap()Z

    move-result v0

    if-nez v0, :cond_6

    .line 60
    instance-of v0, p3, Ljava/lang/String;

    if-nez v0, :cond_5

    instance-of v0, p3, Ljava/lang/Boolean;

    if-nez v0, :cond_5

    instance-of v0, p3, Ljava/lang/Integer;

    if-nez v0, :cond_5

    instance-of v0, p3, Ljava/lang/Short;

    if-nez v0, :cond_5

    instance-of v0, p3, Ljava/lang/Long;

    if-nez v0, :cond_5

    instance-of v0, p3, Ljava/lang/Float;

    if-nez v0, :cond_5

    instance-of v0, p3, Ljava/lang/Double;

    if-eqz v0, :cond_4

    goto :goto_0

    .line 69
    :cond_4
    instance-of v0, p3, Ljava/lang/Character;

    if-eqz v0, :cond_6

    .line 70
    move-object v0, p3

    check-cast v0, Ljava/lang/Character;

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 68
    :cond_5
    :goto_0
    return-object p3

    .line 73
    :cond_6
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 74
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 75
    invoke-static {p2, p3}, Lcom/trendmicro/hippo/NativeJavaArray;->wrap(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeJavaArray;

    move-result-object v1

    return-object v1

    .line 77
    :cond_7
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/WrapFactory;->wrapAsJavaObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1

    .line 50
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_8
    :goto_1
    return-object p3
.end method

.method public wrapAsJavaObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "javaObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Context;",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/trendmicro/hippo/Scriptable;"
        }
    .end annotation

    .line 120
    .local p4, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/trendmicro/hippo/NativeJavaObject;

    invoke-direct {v0, p2, p3, p4}, Lcom/trendmicro/hippo/NativeJavaObject;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)V

    return-object v0
.end method

.method public wrapJavaClass(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Context;",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/trendmicro/hippo/Scriptable;"
        }
    .end annotation

    .line 139
    .local p3, "javaClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/trendmicro/hippo/NativeJavaClass;

    invoke-direct {v0, p2, p3}, Lcom/trendmicro/hippo/NativeJavaClass;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;)V

    return-object v0
.end method

.method public wrapNewObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "obj"    # Ljava/lang/Object;

    .line 89
    instance-of v0, p3, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    .line 90
    move-object v0, p3

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    return-object v0

    .line 92
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 93
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 94
    invoke-static {p2, p3}, Lcom/trendmicro/hippo/NativeJavaArray;->wrap(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeJavaArray;

    move-result-object v1

    return-object v1

    .line 96
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/trendmicro/hippo/WrapFactory;->wrapAsJavaObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1
.end method
