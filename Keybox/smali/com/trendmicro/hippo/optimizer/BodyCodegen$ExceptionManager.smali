.class Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;
.super Ljava/lang/Object;
.source "Codegen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/optimizer/BodyCodegen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExceptionManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    }
.end annotation


# instance fields
.field private exceptionInfo:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/trendmicro/hippo/optimizer/BodyCodegen;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/optimizer/BodyCodegen;)V
    .locals 0

    .line 3987
    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->this$0:Lcom/trendmicro/hippo/optimizer/BodyCodegen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3988
    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    .line 3989
    return-void
.end method

.method private endCatch(Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;II)V
    .locals 7
    .param p1, "ei"    # Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    .param p2, "exceptionType"    # I
    .param p3, "catchEnd"    # I

    .line 4148
    iget-object v0, p1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    aget v0, v0, p2

    if-eqz v0, :cond_1

    .line 4152
    iget-object v0, p1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    aget v0, v0, p2

    .line 4153
    .local v0, "currentStart":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->this$0:Lcom/trendmicro/hippo/optimizer/BodyCodegen;

    iget-object v1, v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v1

    .line 4154
    .local v1, "currentStartPC":I
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->this$0:Lcom/trendmicro/hippo/optimizer/BodyCodegen;

    iget-object v2, v2, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v2

    .line 4155
    .local v2, "catchEndPC":I
    if-eq v1, v2, :cond_0

    .line 4156
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->this$0:Lcom/trendmicro/hippo/optimizer/BodyCodegen;

    iget-object v3, v3, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v4, p1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    aget v4, v4, p2

    iget-object v5, p1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aget v5, v5, p2

    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->this$0:Lcom/trendmicro/hippo/optimizer/BodyCodegen;

    .line 4159
    invoke-static {v6, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->access$100(Lcom/trendmicro/hippo/optimizer/BodyCodegen;I)Ljava/lang/String;

    move-result-object v6

    .line 4156
    invoke-virtual {v3, v4, p3, v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addExceptionHandler(IIILjava/lang/String;)V

    .line 4161
    :cond_0
    return-void

    .line 4149
    .end local v0    # "currentStart":I
    .end local v1    # "currentStartPC":I
    .end local v2    # "catchEndPC":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "bad exception start"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private getTop()Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    .locals 1

    .line 4165
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    return-object v0
.end method


# virtual methods
.method addHandler(III)V
    .locals 2
    .param p1, "exceptionType"    # I
    .param p2, "handlerLabel"    # I
    .param p3, "startLabel"    # I

    .line 4015
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->getTop()Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    move-result-object v0

    .line 4016
    .local v0, "top":Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    iget-object v1, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aput p2, v1, p1

    .line 4017
    iget-object v1, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    aput p3, v1, p1

    .line 4018
    return-void
.end method

.method markInlineFinallyEnd(Lcom/trendmicro/hippo/Node;I)V
    .locals 4
    .param p1, "finallyBlock"    # Lcom/trendmicro/hippo/Node;
    .param p2, "finallyEnd"    # I

    .line 4122
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    .line 4123
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    .line 4124
    .local v0, "iter":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 4125
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    .line 4126
    .local v1, "ei":Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    const/4 v3, 0x5

    if-ge v2, v3, :cond_1

    .line 4127
    iget-object v3, v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aget v3, v3, v2

    if-eqz v3, :cond_0

    iget-object v3, v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->currentFinally:Lcom/trendmicro/hippo/Node;

    if-ne v3, p1, :cond_0

    .line 4129
    iget-object v3, v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    aput p2, v3, v2

    .line 4130
    const/4 v3, 0x0

    iput-object v3, v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->currentFinally:Lcom/trendmicro/hippo/Node;

    .line 4126
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 4133
    .end local v2    # "i":I
    :cond_1
    iget-object v2, v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->finallyBlock:Lcom/trendmicro/hippo/Node;

    if-ne v2, p1, :cond_2

    .line 4134
    goto :goto_2

    .line 4136
    .end local v1    # "ei":Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    :cond_2
    goto :goto_0

    .line 4137
    :cond_3
    :goto_2
    return-void
.end method

.method markInlineFinallyStart(Lcom/trendmicro/hippo/Node;I)V
    .locals 5
    .param p1, "finallyBlock"    # Lcom/trendmicro/hippo/Node;
    .param p2, "finallyStart"    # I

    .line 4093
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    .line 4094
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    .line 4095
    .local v0, "iter":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 4096
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    .line 4097
    .local v1, "ei":Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    const/4 v3, 0x5

    if-ge v2, v3, :cond_1

    .line 4098
    iget-object v3, v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aget v3, v3, v2

    if-eqz v3, :cond_0

    iget-object v3, v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->currentFinally:Lcom/trendmicro/hippo/Node;

    if-nez v3, :cond_0

    .line 4099
    invoke-direct {p0, v1, v2, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->endCatch(Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;II)V

    .line 4100
    iget-object v3, v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    const/4 v4, 0x0

    aput v4, v3, v2

    .line 4101
    iput-object p1, v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->currentFinally:Lcom/trendmicro/hippo/Node;

    .line 4097
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 4104
    .end local v2    # "i":I
    :cond_1
    iget-object v2, v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->finallyBlock:Lcom/trendmicro/hippo/Node;

    if-ne v2, p1, :cond_2

    .line 4105
    goto :goto_2

    .line 4107
    .end local v1    # "ei":Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    :cond_2
    goto :goto_0

    .line 4108
    :cond_3
    :goto_2
    return-void
.end method

.method popExceptionInfo()V
    .locals 1

    .line 4066
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 4067
    return-void
.end method

.method pushExceptionInfo(Lcom/trendmicro/hippo/ast/Jump;)V
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/Jump;

    .line 3999
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->this$0:Lcom/trendmicro/hippo/optimizer/BodyCodegen;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Jump;->getFinally()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->access$000(Lcom/trendmicro/hippo/optimizer/BodyCodegen;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 4000
    .local v0, "fBlock":Lcom/trendmicro/hippo/Node;
    new-instance v1, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    invoke-direct {v1, p0, p1, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;-><init>(Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;Lcom/trendmicro/hippo/ast/Jump;Lcom/trendmicro/hippo/Node;)V

    .line 4001
    .local v1, "ei":Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    invoke-virtual {v2, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 4002
    return-void
.end method

.method removeHandler(II)I
    .locals 4
    .param p1, "exceptionType"    # I
    .param p2, "endLabel"    # I

    .line 4051
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->getTop()Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    move-result-object v0

    .line 4052
    .local v0, "top":Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    iget-object v1, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aget v1, v1, p1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 4053
    iget-object v1, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aget v1, v1, p1

    .line 4054
    .local v1, "handlerLabel":I
    invoke-direct {p0, v0, p1, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->endCatch(Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;II)V

    .line 4055
    iget-object v3, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aput v2, v3, p1

    .line 4056
    return v1

    .line 4058
    .end local v1    # "handlerLabel":I
    :cond_0
    return v2
.end method

.method setHandlers([II)V
    .locals 2
    .param p1, "handlerLabels"    # [I
    .param p2, "startLabel"    # I

    .line 4032
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 4033
    aget v1, p1, v0

    if-eqz v1, :cond_0

    .line 4034
    aget v1, p1, v0

    invoke-virtual {p0, v0, v1, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->addHandler(III)V

    .line 4032
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 4037
    .end local v0    # "i":I
    :cond_1
    return-void
.end method
