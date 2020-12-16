.class public abstract Lcom/trendmicro/hippo/xml/XMLObject;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "XMLObject.java"


# static fields
.field private static final serialVersionUID:J = 0x7556c007dcee0974L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 26
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "prototype"    # Lcom/trendmicro/hippo/Scriptable;

    .line 30
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V

    .line 31
    return-void
.end method


# virtual methods
.method public addValues(Lcom/trendmicro/hippo/Context;ZLjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "thisIsLeft"    # Z
    .param p3, "value"    # Ljava/lang/Object;

    .line 102
    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v0
.end method

.method public abstract delete(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z
.end method

.method public abstract enterDotQuery(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/NativeWith;
.end method

.method public abstract enterWith(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/NativeWith;
.end method

.method public abstract get(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public abstract getExtraMethodSource(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;
.end method

.method public abstract getFunctionProperty(Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;
.end method

.method public abstract getFunctionProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public getTypeOf()Ljava/lang/String;
    .locals 1

    .line 113
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xml/XMLObject;->avoidObjectDetection()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "undefined"

    goto :goto_0

    :cond_0
    const-string v0, "xml"

    :goto_0
    return-object v0
.end method

.method public abstract has(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z
.end method

.method public abstract memberRef(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;I)Lcom/trendmicro/hippo/Ref;
.end method

.method public abstract memberRef(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;I)Lcom/trendmicro/hippo/Ref;
.end method

.method public abstract put(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)V
.end method
