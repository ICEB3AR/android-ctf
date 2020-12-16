.class Lcom/trendmicro/hippo/NativeObject$KeySet;
.super Ljava/util/AbstractSet;
.source "NativeObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/NativeObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "KeySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/NativeObject;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/NativeObject;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/NativeObject;

    .line 685
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeObject$KeySet;->this$0:Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 689
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeObject$KeySet;->this$0:Lcom/trendmicro/hippo/NativeObject;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/NativeObject;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 694
    new-instance v0, Lcom/trendmicro/hippo/NativeObject$KeySet$1;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/NativeObject$KeySet$1;-><init>(Lcom/trendmicro/hippo/NativeObject$KeySet;)V

    return-object v0
.end method

.method public size()I
    .locals 1

    .line 727
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeObject$KeySet;->this$0:Lcom/trendmicro/hippo/NativeObject;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeObject;->size()I

    move-result v0

    return v0
.end method
