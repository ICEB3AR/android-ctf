.class public interface abstract Lcom/trendmicro/hippo/Scriptable;
.super Ljava/lang/Object;
.source "Scriptable.java"


# static fields
.field public static final NOT_FOUND:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    sget-object v0, Lcom/trendmicro/hippo/UniqueTag;->NOT_FOUND:Lcom/trendmicro/hippo/UniqueTag;

    sput-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public abstract delete(I)V
.end method

.method public abstract delete(Ljava/lang/String;)V
.end method

.method public abstract get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
.end method

.method public abstract get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
.end method

.method public abstract getClassName()Ljava/lang/String;
.end method

.method public abstract getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract getIds()[Ljava/lang/Object;
.end method

.method public abstract getParentScope()Lcom/trendmicro/hippo/Scriptable;
.end method

.method public abstract getPrototype()Lcom/trendmicro/hippo/Scriptable;
.end method

.method public abstract has(ILcom/trendmicro/hippo/Scriptable;)Z
.end method

.method public abstract has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z
.end method

.method public abstract hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
.end method

.method public abstract put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
.end method

.method public abstract put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
.end method

.method public abstract setParentScope(Lcom/trendmicro/hippo/Scriptable;)V
.end method

.method public abstract setPrototype(Lcom/trendmicro/hippo/Scriptable;)V
.end method
