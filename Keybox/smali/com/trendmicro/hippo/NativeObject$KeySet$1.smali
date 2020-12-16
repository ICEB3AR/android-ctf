.class Lcom/trendmicro/hippo/NativeObject$KeySet$1;
.super Ljava/lang/Object;
.source "NativeObject.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/NativeObject$KeySet;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
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
.field ids:[Ljava/lang/Object;

.field index:I

.field key:Ljava/lang/Object;

.field final synthetic this$1:Lcom/trendmicro/hippo/NativeObject$KeySet;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/NativeObject$KeySet;)V
    .locals 1
    .param p1, "this$1"    # Lcom/trendmicro/hippo/NativeObject$KeySet;

    .line 694
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->this$1:Lcom/trendmicro/hippo/NativeObject$KeySet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 695
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->this$1:Lcom/trendmicro/hippo/NativeObject$KeySet;

    iget-object v0, v0, Lcom/trendmicro/hippo/NativeObject$KeySet;->this$0:Lcom/trendmicro/hippo/NativeObject;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeObject;->getIds()[Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->ids:[Ljava/lang/Object;

    .line 697
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->index:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 701
    iget v0, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->index:I

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->ids:[Ljava/lang/Object;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 3

    .line 707
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->ids:[Ljava/lang/Object;

    iget v1, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->index:I

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->key:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 708
    :catch_0
    move-exception v0

    .line 709
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->key:Ljava/lang/Object;

    .line 710
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1
.end method

.method public remove()V
    .locals 2

    .line 716
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->key:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 719
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->this$1:Lcom/trendmicro/hippo/NativeObject$KeySet;

    iget-object v0, v0, Lcom/trendmicro/hippo/NativeObject$KeySet;->this$0:Lcom/trendmicro/hippo/NativeObject;

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->key:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/NativeObject;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 720
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;->key:Ljava/lang/Object;

    .line 721
    return-void

    .line 717
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method
