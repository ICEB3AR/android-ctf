.class public Lcom/trendmicro/hippo/NativeIterator$WrappedJavaIterator;
.super Ljava/lang/Object;
.source "NativeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/NativeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WrappedJavaIterator"
.end annotation


# instance fields
.field private iterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "*>;"
        }
    .end annotation
.end field

.field private scope:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method constructor <init>(Ljava/util/Iterator;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "*>;",
            "Lcom/trendmicro/hippo/Scriptable;",
            ")V"
        }
    .end annotation

    .line 213
    .local p1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeIterator$WrappedJavaIterator;->iterator:Ljava/util/Iterator;

    .line 215
    iput-object p2, p0, Lcom/trendmicro/hippo/NativeIterator$WrappedJavaIterator;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 216
    return-void
.end method


# virtual methods
.method public __iterator__(Z)Ljava/lang/Object;
    .locals 0
    .param p1, "b"    # Z

    .line 228
    return-object p0
.end method

.method public next()Ljava/lang/Object;
    .locals 4

    .line 219
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeIterator$WrappedJavaIterator;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 224
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeIterator$WrappedJavaIterator;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 221
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/JavaScriptException;

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeIterator$WrappedJavaIterator;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 222
    invoke-static {v1}, Lcom/trendmicro/hippo/NativeIterator;->getStopIterationObject(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v0
.end method
