.class public final Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;
.super Ljava/lang/Object;
.source "IteratorLikeIterable.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/IteratorLikeIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Itr"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private nextVal:Ljava/lang/Object;

.field final synthetic this$0:Lcom/trendmicro/hippo/IteratorLikeIterable;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/IteratorLikeIterable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/IteratorLikeIterable;

    .line 58
    iput-object p1, p0, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;->this$0:Lcom/trendmicro/hippo/IteratorLikeIterable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 5

    .line 65
    iget-object v0, p0, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;->this$0:Lcom/trendmicro/hippo/IteratorLikeIterable;

    invoke-static {v0}, Lcom/trendmicro/hippo/IteratorLikeIterable;->access$300(Lcom/trendmicro/hippo/IteratorLikeIterable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v0

    iget-object v1, p0, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;->this$0:Lcom/trendmicro/hippo/IteratorLikeIterable;

    invoke-static {v1}, Lcom/trendmicro/hippo/IteratorLikeIterable;->access$000(Lcom/trendmicro/hippo/IteratorLikeIterable;)Lcom/trendmicro/hippo/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;->this$0:Lcom/trendmicro/hippo/IteratorLikeIterable;

    invoke-static {v2}, Lcom/trendmicro/hippo/IteratorLikeIterable;->access$100(Lcom/trendmicro/hippo/IteratorLikeIterable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    iget-object v3, p0, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;->this$0:Lcom/trendmicro/hippo/IteratorLikeIterable;

    invoke-static {v3}, Lcom/trendmicro/hippo/IteratorLikeIterable;->access$200(Lcom/trendmicro/hippo/IteratorLikeIterable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    sget-object v4, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 66
    .local v0, "val":Ljava/lang/Object;
    iget-object v1, p0, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;->this$0:Lcom/trendmicro/hippo/IteratorLikeIterable;

    invoke-static {v1}, Lcom/trendmicro/hippo/IteratorLikeIterable;->access$000(Lcom/trendmicro/hippo/IteratorLikeIterable;)Lcom/trendmicro/hippo/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;->this$0:Lcom/trendmicro/hippo/IteratorLikeIterable;

    invoke-static {v2}, Lcom/trendmicro/hippo/IteratorLikeIterable;->access$100(Lcom/trendmicro/hippo/IteratorLikeIterable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    const-string v3, "done"

    invoke-static {v0, v3, v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectProp(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 67
    .local v1, "doneval":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 70
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 71
    const/4 v2, 0x0

    return v2

    .line 73
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;->this$0:Lcom/trendmicro/hippo/IteratorLikeIterable;

    invoke-static {v2}, Lcom/trendmicro/hippo/IteratorLikeIterable;->access$000(Lcom/trendmicro/hippo/IteratorLikeIterable;)Lcom/trendmicro/hippo/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;->this$0:Lcom/trendmicro/hippo/IteratorLikeIterable;

    invoke-static {v3}, Lcom/trendmicro/hippo/IteratorLikeIterable;->access$100(Lcom/trendmicro/hippo/IteratorLikeIterable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    const-string v4, "value"

    invoke-static {v0, v4, v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectProp(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;->nextVal:Ljava/lang/Object;

    .line 74
    const/4 v2, 0x1

    return v2

    .line 68
    :cond_1
    invoke-static {v0, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2
.end method

.method public next()Ljava/lang/Object;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;->nextVal:Ljava/lang/Object;

    return-object v0
.end method
