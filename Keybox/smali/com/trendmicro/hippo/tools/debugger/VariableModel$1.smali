.class Lcom/trendmicro/hippo/tools/debugger/VariableModel$1;
.super Ljava/lang/Object;
.source "SwingGui.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/debugger/VariableModel;->children(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/VariableModel;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/VariableModel;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/debugger/VariableModel;

    .line 2771
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/VariableModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 3
    .param p1, "l"    # Ljava/lang/Object;
    .param p2, "r"    # Ljava/lang/Object;

    .line 2775
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 2776
    instance-of v0, p2, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 2777
    const/4 v0, -0x1

    return v0

    .line 2779
    :cond_0
    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    move-object v1, p2

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 2781
    :cond_1
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 2782
    const/4 v0, 0x1

    return v0

    .line 2784
    :cond_2
    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 2785
    .local v0, "lint":I
    move-object v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 2786
    .local v1, "rint":I
    sub-int v2, v0, v1

    return v2
.end method
