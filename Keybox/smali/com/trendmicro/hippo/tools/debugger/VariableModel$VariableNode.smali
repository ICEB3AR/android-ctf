.class Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
.super Ljava/lang/Object;
.source "SwingGui.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/VariableModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "VariableNode"
.end annotation


# instance fields
.field private children:[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

.field private id:Ljava/lang/Object;

.field private object:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "id"    # Ljava/lang/Object;

    .line 2833
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2834
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->object:Ljava/lang/Object;

    .line 2835
    iput-object p2, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->id:Ljava/lang/Object;

    .line 2836
    return-void
.end method

.method static synthetic access$000(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2812
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->children:[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    return-object v0
.end method

.method static synthetic access$002(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    .param p1, "x1"    # [Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2812
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->children:[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    return-object p1
.end method

.method static synthetic access$100(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2812
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->object:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$200(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2812
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->id:Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 2843
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->id:Ljava/lang/Object;

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 2844
    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->id:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2843
    :goto_0
    return-object v0
.end method
