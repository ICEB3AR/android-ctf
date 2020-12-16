.class Lcom/trendmicro/hippo/Node$PropListItem;
.super Ljava/lang/Object;
.source "Node.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Node;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PropListItem"
.end annotation


# instance fields
.field intValue:I

.field next:Lcom/trendmicro/hippo/Node$PropListItem;

.field objectValue:Ljava/lang/Object;

.field type:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/trendmicro/hippo/Node$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trendmicro/hippo/Node$1;

    .line 90
    invoke-direct {p0}, Lcom/trendmicro/hippo/Node$PropListItem;-><init>()V

    return-void
.end method
