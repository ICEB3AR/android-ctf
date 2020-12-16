.class Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
.super Ljava/lang/Object;
.source "Codegen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExceptionInfo"
.end annotation


# instance fields
.field currentFinally:Lcom/trendmicro/hippo/Node;

.field exceptionStarts:[I

.field finallyBlock:Lcom/trendmicro/hippo/Node;

.field handlerLabels:[I

.field final synthetic this$1:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;Lcom/trendmicro/hippo/ast/Jump;Lcom/trendmicro/hippo/Node;)V
    .locals 1
    .param p2, "node"    # Lcom/trendmicro/hippo/ast/Jump;
    .param p3, "finallyBlock"    # Lcom/trendmicro/hippo/Node;

    .line 4171
    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->this$1:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4172
    iput-object p3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->finallyBlock:Lcom/trendmicro/hippo/Node;

    .line 4173
    const/4 p1, 0x5

    new-array v0, p1, [I

    iput-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    .line 4174
    new-array p1, p1, [I

    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    .line 4175
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->currentFinally:Lcom/trendmicro/hippo/Node;

    .line 4176
    return-void
.end method
