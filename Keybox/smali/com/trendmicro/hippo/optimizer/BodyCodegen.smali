.class Lcom/trendmicro/hippo/optimizer/BodyCodegen;
.super Ljava/lang/Object;
.source "Codegen.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;,
        Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final ECMAERROR_EXCEPTION:I = 0x2

.field private static final EVALUATOR_EXCEPTION:I = 0x1

.field private static final EXCEPTION_MAX:I = 0x5

.field private static final FINALLY_EXCEPTION:I = 0x4

.field static final GENERATOR_START:I = 0x0

.field static final GENERATOR_TERMINATE:I = -0x1

.field static final GENERATOR_YIELD_START:I = 0x1

.field private static final JAVASCRIPT_EXCEPTION:I = 0x0

.field private static final MAX_LOCALS:I = 0x400

.field private static final THROWABLE_EXCEPTION:I = 0x3


# instance fields
.field private argsLocal:S

.field cfw:Lcom/trendmicro/classfile/ClassFileWriter;

.field codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

.field compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

.field private contextLocal:S

.field private enterAreaStartLabel:I

.field private epilogueLabel:I

.field private exceptionManager:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

.field private finallys:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/trendmicro/hippo/Node;",
            "Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;",
            ">;"
        }
    .end annotation
.end field

.field private firstFreeLocal:S

.field private fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

.field private funObjLocal:S

.field private generatorStateLocal:S

.field private generatorSwitch:I

.field private hasVarsInRegs:Z

.field private inDirectCallFunction:Z

.field private inLocalBlock:Z

.field private isGenerator:Z

.field private itsForcedObjectParameters:Z

.field private itsLineNumber:I

.field private itsOneArgArray:S

.field private itsZeroArgArray:S

.field private literals:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/Node;",
            ">;"
        }
    .end annotation
.end field

.field private locals:[I

.field private localsMax:S

.field private maxLocals:I

.field private maxStack:I

.field private operationLocal:S

.field private popvLocal:S

.field private savedCodeOffset:I

.field scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

.field public scriptOrFnIndex:I

.field private thisObjLocal:S

.field private varRegisters:[S

.field private variableObjectLocal:S


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1265
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 1265
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4190
    new-instance v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;-><init>(Lcom/trendmicro/hippo/optimizer/BodyCodegen;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->exceptionManager:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

    .line 5527
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->maxLocals:I

    .line 5528
    iput v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->maxStack:I

    return-void
.end method

.method static synthetic access$000(Lcom/trendmicro/hippo/optimizer/BodyCodegen;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/optimizer/BodyCodegen;
    .param p1, "x1"    # Lcom/trendmicro/hippo/Node;

    .line 1265
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getFinallyAtTarget(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/trendmicro/hippo/optimizer/BodyCodegen;I)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/optimizer/BodyCodegen;
    .param p1, "x1"    # I

    .line 1265
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->exceptionTypeToName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private addDoubleWrap()V
    .locals 2

    .line 5394
    const-string v0, "wrapDouble"

    const-string v1, "(D)Ljava/lang/Double;"

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5395
    return-void
.end method

.method private addGoto(Lcom/trendmicro/hippo/Node;I)V
    .locals 2
    .param p1, "target"    # Lcom/trendmicro/hippo/Node;
    .param p2, "jumpcode"    # I

    .line 5335
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getTargetLabel(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 5336
    .local v0, "targetLabel":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, p2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5337
    return-void
.end method

.method private addGotoWithReturn(Lcom/trendmicro/hippo/Node;)V
    .locals 4
    .param p1, "target"    # Lcom/trendmicro/hippo/Node;

    .line 3056
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;

    .line 3057
    .local v0, "ret":Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v2, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;->jsrPoints:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 3058
    const/16 v1, 0xa7

    invoke-direct {p0, p1, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addGoto(Lcom/trendmicro/hippo/Node;I)V

    .line 3060
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x57

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3061
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v1

    .line 3062
    .local v1, "retLabel":I
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 3063
    iget-object v2, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;->jsrPoints:Ljava/util/List;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3064
    return-void
.end method

.method private addInstructionCount()V
    .locals 2

    .line 4387
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->getCurrentCodeOffset()I

    move-result v0

    iget v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->savedCodeOffset:I

    sub-int/2addr v0, v1

    .line 4391
    .local v0, "count":I
    const/4 v1, 0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addInstructionCount(I)V

    .line 4392
    return-void
.end method

.method private addInstructionCount(I)V
    .locals 2
    .param p1, "count"    # I

    .line 4403
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4404
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 4405
    const-string v0, "addInstructionCount"

    const-string v1, "(Lcom/trendmicro/hippo/Context;I)V"

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4408
    return-void
.end method

.method private addJumpedBooleanWrap(II)V
    .locals 6
    .param p1, "trueLabel"    # I
    .param p2, "falseLabel"    # I

    .line 5380
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 5381
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 5382
    .local v0, "skip":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0xb2

    const-string v3, "java/lang/Boolean"

    const-string v4, "FALSE"

    const-string v5, "Ljava/lang/Boolean;"

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5384
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v4, 0xa7

    invoke-virtual {v1, v4, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5385
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 5386
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const-string v4, "TRUE"

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5388
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 5389
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->adjustStackTop(I)V

    .line 5390
    return-void
.end method

.method private addLoadPropertyIds([Ljava/lang/Object;I)V
    .locals 4
    .param p1, "properties"    # [Ljava/lang/Object;
    .param p2, "count"    # I

    .line 3175
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addNewObjectArray(I)V

    .line 3176
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-eq v0, p2, :cond_1

    .line 3177
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x59

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3178
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3179
    aget-object v1, p1, v0

    .line 3180
    .local v1, "id":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 3181
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    move-object v3, v1

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    goto :goto_1

    .line 3183
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    move-object v3, v1

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3184
    const-string v2, "wrapInt"

    const-string v3, "(I)Ljava/lang/Integer;"

    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3186
    :goto_1
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x53

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3176
    .end local v1    # "id":Ljava/lang/Object;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3188
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private addLoadPropertyValues(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)V
    .locals 8
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;
    .param p3, "count"    # I

    .line 3192
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    const/16 v1, 0xa4

    const/16 v2, 0x53

    const/16 v3, 0x99

    const/16 v4, 0x98

    if-eqz v0, :cond_4

    .line 3194
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-eq v0, p3, :cond_2

    .line 3195
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    .line 3196
    .local v5, "childType":I
    if-eq v5, v4, :cond_1

    if-eq v5, v3, :cond_1

    if-ne v5, v1, :cond_0

    goto :goto_1

    .line 3199
    :cond_0
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    goto :goto_2

    .line 3197
    :cond_1
    :goto_1
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    invoke-direct {p0, v6, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3201
    :goto_2
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p2

    .line 3194
    .end local v5    # "childType":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3203
    .end local v0    # "i":I
    :cond_2
    invoke-direct {p0, p3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addNewObjectArray(I)V

    .line 3204
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_3
    if-eq v0, p3, :cond_3

    .line 3205
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x5a

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3206
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x5f

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3207
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    sub-int v4, p3, v0

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3208
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3209
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3204
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .end local v0    # "i":I
    :cond_3
    goto :goto_7

    .line 3212
    :cond_4
    invoke-direct {p0, p3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addNewObjectArray(I)V

    .line 3213
    move-object v0, p2

    .line 3214
    .local v0, "child2":Lcom/trendmicro/hippo/Node;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_4
    if-eq v5, p3, :cond_7

    .line 3215
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v7, 0x59

    invoke-virtual {v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3216
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3217
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v6

    .line 3218
    .local v6, "childType":I
    if-eq v6, v4, :cond_6

    if-eq v6, v3, :cond_6

    if-ne v6, v1, :cond_5

    goto :goto_5

    .line 3221
    :cond_5
    invoke-direct {p0, v0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    goto :goto_6

    .line 3219
    :cond_6
    :goto_5
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v7

    invoke-direct {p0, v7, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3223
    :goto_6
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3224
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 3214
    .end local v6    # "childType":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 3227
    .end local v0    # "child2":Lcom/trendmicro/hippo/Node;
    .end local v5    # "i":I
    :cond_7
    :goto_7
    return-void
.end method

.method private addNewObjectArray(I)V
    .locals 5
    .param p1, "size"    # I

    .line 5346
    if-nez p1, :cond_1

    .line 5347
    iget-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsZeroArgArray:S

    if-ltz v0, :cond_0

    .line 5348
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    goto :goto_0

    .line 5350
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb2

    const-string v2, "com/trendmicro/hippo/ScriptRuntime"

    const-string v3, "emptyArgs"

    const-string v4, "[Ljava/lang/Object;"

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 5355
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 5356
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xbd

    const-string v2, "java/lang/Object"

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 5358
    :goto_0
    return-void
.end method

.method private addObjectToDouble()V
    .locals 2

    .line 5341
    const-string v0, "toNumber"

    const-string v1, "(Ljava/lang/Object;)D"

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5342
    return-void
.end method

.method private addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "methodSignature"    # Ljava/lang/String;

    .line 5372
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb8

    const-string v2, "com/trendmicro/hippo/optimizer/OptRuntime"

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5376
    return-void
.end method

.method private addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "methodSignature"    # Ljava/lang/String;

    .line 5363
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb8

    const-string v2, "com.trendmicro.hippo.ScriptRuntime"

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5367
    return-void
.end method

.method private dcpLoadAsNumber(I)V
    .locals 5
    .param p1, "dcp_register"    # I

    .line 5297
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5298
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb2

    const-string v2, "java/lang/Void"

    const-string v3, "TYPE"

    const-string v4, "Ljava/lang/Class;"

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5302
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 5303
    .local v0, "isNumberLabel":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0xa5

    invoke-virtual {v1, v2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5304
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v1

    .line 5305
    .local v1, "stack":S
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5306
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 5307
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v2

    .line 5308
    .local v2, "beyond":I
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v4, 0xa7

    invoke-virtual {v3, v4, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5309
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(IS)V

    .line 5310
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int/lit8 v4, p1, 0x1

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    .line 5311
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 5312
    return-void
.end method

.method private dcpLoadAsObject(I)V
    .locals 5
    .param p1, "dcp_register"    # I

    .line 5316
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5317
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb2

    const-string v2, "java/lang/Void"

    const-string v3, "TYPE"

    const-string v4, "Ljava/lang/Class;"

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5321
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 5322
    .local v0, "isNumberLabel":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0xa5

    invoke-virtual {v1, v2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5323
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v1

    .line 5324
    .local v1, "stack":S
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5325
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v2

    .line 5326
    .local v2, "beyond":I
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v4, 0xa7

    invoke-virtual {v3, v4, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5327
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(IS)V

    .line 5328
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int/lit8 v4, p1, 0x1

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    .line 5329
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 5330
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 5331
    return-void
.end method

.method private decReferenceWordLocal(S)V
    .locals 2
    .param p1, "local"    # S

    .line 5473
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->locals:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, -0x1

    aput v1, v0, p1

    .line 5474
    return-void
.end method

.method private exceptionTypeToName(I)Ljava/lang/String;
    .locals 1
    .param p1, "exceptionType"    # I

    .line 3946
    if-nez p1, :cond_0

    .line 3947
    const-string v0, "com/trendmicro/hippo/JavaScriptException"

    return-object v0

    .line 3948
    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 3949
    const-string v0, "com/trendmicro/hippo/EvaluatorException"

    return-object v0

    .line 3950
    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 3951
    const-string v0, "com/trendmicro/hippo/EcmaError"

    return-object v0

    .line 3952
    :cond_2
    const/4 v0, 0x3

    if-ne p1, v0, :cond_3

    .line 3953
    const-string v0, "java/lang/Throwable"

    return-object v0

    .line 3954
    :cond_3
    const/4 v0, 0x4

    if-ne p1, v0, :cond_4

    .line 3955
    const/4 v0, 0x0

    return-object v0

    .line 3957
    :cond_4
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private genSimpleCompare(III)V
    .locals 3
    .param p1, "type"    # I
    .param p2, "trueGOTO"    # I
    .param p3, "falseGOTO"    # I

    .line 4681
    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    .line 4682
    const/16 v1, 0x97

    const/16 v2, 0x98

    packed-switch p1, :pswitch_data_0

    .line 4700
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 4688
    :pswitch_0
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4689
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x9c

    invoke-virtual {v1, v2, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4690
    goto :goto_0

    .line 4696
    :pswitch_1
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4697
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x9d

    invoke-virtual {v1, v2, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4698
    goto :goto_0

    .line 4684
    :pswitch_2
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4685
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x9e

    invoke-virtual {v1, v2, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4686
    goto :goto_0

    .line 4692
    :pswitch_3
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4693
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x9b

    invoke-virtual {v1, v2, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4694
    nop

    .line 4703
    :goto_0
    if-eq p3, v0, :cond_0

    .line 4704
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4705
    :cond_0
    return-void

    .line 4681
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private generateActivationExit()V
    .locals 2

    .line 1853
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v0, :cond_0

    .line 1854
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1855
    const-string v0, "exitActivationFunction"

    const-string v1, "(Lcom/trendmicro/hippo/Context;)V"

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1857
    return-void

    .line 1853
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private generateArrayLiteralFactory(Lcom/trendmicro/hippo/Node;I)V
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "count"    # I

    .line 3067
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_literal"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3068
    .local v0, "methodName":Ljava/lang/String;
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->initBodyGeneration()V

    .line 3069
    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    add-int/lit8 v2, v1, 0x1

    int-to-short v2, v2

    iput-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    .line 3070
    iput-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    .line 3071
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const-string v2, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;"

    const/4 v3, 0x2

    invoke-virtual {v1, v0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 3077
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, p1, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitArrayLiteral(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    .line 3078
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0xb0

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3079
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    add-int/2addr v3, v2

    int-to-short v2, v3

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 3080
    return-void
.end method

.method private generateCallArgArray(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V
    .locals 7
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "argChild"    # Lcom/trendmicro/hippo/Node;
    .param p3, "directCall"    # Z

    .line 3607
    const/4 v0, 0x0

    .line 3608
    .local v0, "argCount":I
    move-object v1, p2

    .local v1, "child":Lcom/trendmicro/hippo/Node;
    :goto_0
    if-eqz v1, :cond_0

    .line 3609
    add-int/lit8 v0, v0, 0x1

    .line 3608
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    goto :goto_0

    .line 3612
    .end local v1    # "child":Lcom/trendmicro/hippo/Node;
    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsOneArgArray:S

    if-ltz v1, :cond_1

    .line 3613
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    goto :goto_1

    .line 3615
    :cond_1
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addNewObjectArray(I)V

    .line 3618
    :goto_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    if-eq v1, v0, :cond_7

    .line 3622
    iget-boolean v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    const/16 v3, 0x59

    if-nez v2, :cond_2

    .line 3623
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3624
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3627
    :cond_2
    if-nez p3, :cond_3

    .line 3628
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    goto :goto_3

    .line 3635
    :cond_3
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->nodeIsDirectCallParameter(Lcom/trendmicro/hippo/Node;)I

    move-result v2

    .line 3636
    .local v2, "dcp_register":I
    if-ltz v2, :cond_4

    .line 3637
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->dcpLoadAsObject(I)V

    goto :goto_3

    .line 3639
    :cond_4
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3640
    const/16 v4, 0x8

    const/4 v5, -0x1

    .line 3641
    invoke-virtual {p2, v4, v5}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v4

    .line 3642
    .local v4, "childNumberFlag":I
    if-nez v4, :cond_5

    .line 3643
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 3651
    .end local v2    # "dcp_register":I
    .end local v4    # "childNumberFlag":I
    :cond_5
    :goto_3
    iget-boolean v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v2, :cond_6

    .line 3652
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v2

    .line 3653
    .local v2, "tempLocal":S
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 3654
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0xc0

    const-string v6, "[Ljava/lang/Object;"

    invoke-virtual {v4, v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 3655
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3656
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3657
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3658
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 3661
    .end local v2    # "tempLocal":S
    :cond_6
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x53

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3663
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p2

    .line 3618
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 3665
    .end local v1    # "i":I
    :cond_7
    return-void
.end method

.method private generateCatchBlock(ISIII)V
    .locals 2
    .param p1, "exceptionType"    # I
    .param p2, "savedVariableObject"    # S
    .param p3, "catchLabel"    # I
    .param p4, "exceptionLocal"    # I
    .param p5, "handler"    # I

    .line 3929
    if-nez p5, :cond_0

    .line 3930
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result p5

    .line 3932
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, p5}, Lcom/trendmicro/classfile/ClassFileWriter;->markHandler(I)V

    .line 3935
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, p4}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 3938
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3939
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 3941
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 3942
    return-void
.end method

.method private generateCheckForThrowOrClose(IZI)V
    .locals 5
    .param p1, "label"    # I
    .param p2, "hasLocals"    # Z
    .param p3, "nextState"    # I

    .line 2893
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 2894
    .local v0, "throwLabel":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v1

    .line 2897
    .local v1, "closeLabel":I
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 2898
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2899
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateThrowJavaScriptException()V

    .line 2902
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 2903
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2904
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0xc0

    const-string v4, "java/lang/Throwable"

    invoke-virtual {v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 2905
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0xbf

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2909
    const/4 v2, -0x1

    if-eq p1, v2, :cond_0

    .line 2910
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 2911
    :cond_0
    if-nez p2, :cond_1

    .line 2913
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generatorSwitch:I

    invoke-virtual {v2, v3, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchCase(II)V

    .line 2917
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->operationLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addILoad(I)V

    .line 2918
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 2919
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x9f

    invoke-virtual {v2, v3, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 2920
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->operationLocal:S

    invoke-virtual {v2, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addILoad(I)V

    .line 2921
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 2922
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v3, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 2923
    return-void
.end method

.method private generateEpilogue()V
    .locals 10

    .line 1741
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1742
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addInstructionCount()V

    .line 1743
    :cond_0
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v0, :cond_5

    .line 1745
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    check-cast v0, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getLiveLocals()Ljava/util/Map;

    move-result-object v0

    .line 1746
    .local v0, "liveLocals":Ljava/util/Map;, "Ljava/util/Map<Lcom/trendmicro/hippo/Node;[I>;"
    const/16 v1, 0xa7

    if-eqz v0, :cond_3

    .line 1747
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    check-cast v2, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/FunctionNode;->getResumptionPoints()Ljava/util/List;

    move-result-object v2

    .line 1748
    .local v2, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/Node;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 1749
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/Node;

    .line 1750
    .local v4, "node":Lcom/trendmicro/hippo/Node;
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [I

    .line 1751
    .local v5, "live":[I
    if-eqz v5, :cond_2

    .line 1752
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generatorSwitch:I

    .line 1753
    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNextGeneratorState(Lcom/trendmicro/hippo/Node;)I

    move-result v8

    .line 1752
    invoke-virtual {v6, v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchCase(II)V

    .line 1754
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateGetGeneratorLocalsState()V

    .line 1755
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_1
    array-length v7, v5

    if-ge v6, v7, :cond_1

    .line 1756
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0x59

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1757
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 1758
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0x32

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1759
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    aget v8, v5, v6

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1755
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 1761
    .end local v6    # "j":I
    :cond_1
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v7, 0x57

    invoke-virtual {v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1762
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getTargetLabel(Lcom/trendmicro/hippo/Node;)I

    move-result v7

    invoke-virtual {v6, v1, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 1748
    .end local v4    # "node":Lcom/trendmicro/hippo/Node;
    .end local v5    # "live":[I
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1768
    .end local v2    # "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/Node;>;"
    .end local v3    # "i":I
    :cond_3
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    if-eqz v2, :cond_5

    .line 1769
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/Node;

    .line 1770
    .local v3, "n":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v4

    const/16 v5, 0x7e

    if-ne v4, v5, :cond_4

    .line 1771
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;

    .line 1773
    .local v4, "ret":Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v6, v4, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;->tableLabel:I

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(IS)V

    .line 1776
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v6, 0x0

    iget-object v8, v4, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;->jsrPoints:Ljava/util/List;

    .line 1777
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v8, v7

    .line 1776
    invoke-virtual {v5, v6, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v5

    .line 1778
    .local v5, "startSwitch":I
    const/4 v6, 0x0

    .line 1779
    .local v6, "c":I
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 1780
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_3
    iget-object v8, v4, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;->jsrPoints:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_4

    .line 1782
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchCase(II)V

    .line 1783
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v9, v4, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;->jsrPoints:Ljava/util/List;

    .line 1784
    invoke-interface {v9, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 1783
    invoke-virtual {v8, v1, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 1785
    add-int/lit8 v6, v6, 0x1

    .line 1780
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 1788
    .end local v3    # "n":Lcom/trendmicro/hippo/Node;
    .end local v4    # "ret":Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;
    .end local v5    # "startSwitch":I
    .end local v6    # "c":I
    .end local v7    # "i":I
    :cond_4
    goto :goto_2

    .line 1792
    .end local v0    # "liveLocals":Ljava/util/Map;, "Ljava/util/Map<Lcom/trendmicro/hippo/Node;[I>;"
    :cond_5
    iget v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->epilogueLabel:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    .line 1793
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 1796
    :cond_6
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    const/16 v2, 0xb0

    if-eqz v0, :cond_7

    .line 1797
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1798
    return-void

    .line 1799
    :cond_7
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v0, :cond_9

    .line 1800
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    check-cast v0, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getResumptionPoints()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 1801
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generatorSwitch:I

    invoke-virtual {v0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 1805
    :cond_8
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateSetGeneratorResumptionPoint(I)V

    .line 1808
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1809
    const-string v0, "throwStopIteration"

    const-string v1, "(Ljava/lang/Object;)V"

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1812
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v0}, Lcom/trendmicro/hippo/optimizer/Codegen;->pushUndefined(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 1813
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_4

    .line 1815
    :cond_9
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    if-nez v0, :cond_a

    .line 1816
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->popvLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1817
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_4

    .line 1819
    :cond_a
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateActivationExit()V

    .line 1820
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1825
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 1826
    .local v0, "finallyHandler":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->markHandler(I)V

    .line 1827
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v1

    .line 1828
    .local v1, "exceptionObject":S
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1832
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateActivationExit()V

    .line 1834
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1835
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 1837
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0xbf

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1840
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->enterAreaStartLabel:I

    iget v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->epilogueLabel:I

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v0, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addExceptionHandler(IIILjava/lang/String;)V

    .line 1843
    .end local v0    # "finallyHandler":I
    .end local v1    # "exceptionObject":S
    :goto_4
    return-void
.end method

.method private generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 16
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "parent"    # Lcom/trendmicro/hippo/Node;

    .line 2189
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v3

    .line 2190
    .local v3, "type":I
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 2191
    .local v4, "child":Lcom/trendmicro/hippo/Node;
    const/16 v5, 0x5a

    const/16 v6, 0x57

    if-eq v3, v5, :cond_1f

    const-string v5, "(Ljava/lang/Object;)Z"

    const-string v7, "toBoolean"

    const/16 v9, 0x67

    if-eq v3, v9, :cond_1e

    const/16 v10, 0x6e

    const/4 v13, 0x1

    if-eq v3, v10, :cond_1a

    const/16 v10, 0x7f

    if-eq v3, v10, :cond_19

    const-string v10, "refGet"

    const/16 v14, 0x8f

    const-string v15, "(Lcom/trendmicro/hippo/Ref;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;"

    if-eq v3, v14, :cond_17

    const/16 v14, 0x93

    if-eq v3, v14, :cond_16

    const/16 v14, 0xa0

    if-eq v3, v14, :cond_15

    const/16 v14, 0x96

    if-eq v3, v14, :cond_12

    const/16 v14, 0x97

    if-eq v3, v14, :cond_11

    const-string v14, "TRUE"

    const-string v8, "FALSE"

    const-string v9, "Ljava/lang/Boolean;"

    const-string v12, "java/lang/Boolean"

    const/4 v11, 0x0

    packed-switch v3, :pswitch_data_0

    packed-switch v3, :pswitch_data_1

    const-string v8, "(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;"

    packed-switch v3, :pswitch_data_2

    const-string v9, "(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/String;"

    packed-switch v3, :pswitch_data_3

    packed-switch v3, :pswitch_data_4

    packed-switch v3, :pswitch_data_5

    packed-switch v3, :pswitch_data_6

    .line 2832
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected node type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 2824
    :pswitch_0
    move-object v5, v4

    .line 2825
    .local v5, "initStmt":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 2826
    .local v6, "expr":Lcom/trendmicro/hippo/Node;
    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateStatement(Lcom/trendmicro/hippo/Node;)V

    .line 2827
    invoke-direct {v0, v6, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2828
    goto/16 :goto_b

    .line 2616
    .end local v5    # "initStmt":Lcom/trendmicro/hippo/Node;
    .end local v6    # "expr":Lcom/trendmicro/hippo/Node;
    :pswitch_1
    invoke-direct {v0, v1, v4, v13}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitSetConstVar(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    .line 2617
    goto/16 :goto_b

    .line 2612
    :pswitch_2
    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitSetConst(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2613
    goto/16 :goto_b

    .line 2193
    :pswitch_3
    goto/16 :goto_b

    .line 2395
    :pswitch_4
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitTypeofname(Lcom/trendmicro/hippo/Node;)V

    .line 2396
    goto/16 :goto_b

    .line 2400
    :pswitch_5
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitIncDec(Lcom/trendmicro/hippo/Node;)V

    .line 2401
    goto/16 :goto_b

    .line 2405
    :pswitch_6
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2406
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v9, 0x59

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2407
    invoke-direct {v0, v7, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2409
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v5

    .line 2410
    .local v5, "falseTarget":I
    const/16 v7, 0x6a

    if-ne v3, v7, :cond_0

    .line 2411
    iget-object v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0x99

    invoke-virtual {v7, v8, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    goto :goto_0

    .line 2413
    :cond_0
    iget-object v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0x9a

    invoke-virtual {v7, v8, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 2414
    :goto_0
    iget-object v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2415
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    invoke-direct {v0, v6, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2416
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 2418
    .end local v5    # "falseTarget":I
    goto/16 :goto_b

    .line 2724
    :pswitch_7
    const/16 v5, 0x10

    .line 2725
    invoke-virtual {v1, v5, v11}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v5

    .line 2728
    .local v5, "memberTypeFlags":I
    :cond_1
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2729
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 2730
    if-nez v4, :cond_1

    .line 2731
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2733
    packed-switch v3, :pswitch_data_7

    .line 2771
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6

    .line 2761
    :pswitch_8
    const-string v6, "nameRef"

    .line 2762
    .local v6, "methodName":Ljava/lang/String;
    const-string v7, "(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Ref;"

    .line 2768
    .local v7, "signature":Ljava/lang/String;
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v9, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2769
    goto :goto_1

    .line 2752
    .end local v6    # "methodName":Ljava/lang/String;
    .end local v7    # "signature":Ljava/lang/String;
    :pswitch_9
    const-string v6, "nameRef"

    .line 2753
    .restart local v6    # "methodName":Ljava/lang/String;
    const-string v7, "(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Ref;"

    .line 2758
    .restart local v7    # "signature":Ljava/lang/String;
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v9, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2759
    goto :goto_1

    .line 2743
    .end local v6    # "methodName":Ljava/lang/String;
    .end local v7    # "signature":Ljava/lang/String;
    :pswitch_a
    const-string v6, "memberRef"

    .line 2744
    .restart local v6    # "methodName":Ljava/lang/String;
    const-string v7, "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;I)Lcom/trendmicro/hippo/Ref;"

    .line 2750
    .restart local v7    # "signature":Ljava/lang/String;
    goto :goto_1

    .line 2735
    .end local v6    # "methodName":Ljava/lang/String;
    .end local v7    # "signature":Ljava/lang/String;
    :pswitch_b
    const-string v6, "memberRef"

    .line 2736
    .restart local v6    # "methodName":Ljava/lang/String;
    const-string v7, "(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;I)Lcom/trendmicro/hippo/Ref;"

    .line 2741
    .restart local v7    # "signature":Ljava/lang/String;
    nop

    .line 2773
    :goto_1
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 2774
    invoke-direct {v0, v6, v7}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2776
    .end local v5    # "memberTypeFlags":I
    .end local v6    # "methodName":Ljava/lang/String;
    .end local v7    # "signature":Ljava/lang/String;
    goto/16 :goto_b

    .line 2792
    :pswitch_c
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2793
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2794
    const-string v5, "escapeTextValue"

    invoke-direct {v0, v5, v9}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2798
    goto/16 :goto_b

    .line 2783
    :pswitch_d
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2784
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2785
    const-string v5, "escapeAttributeValue"

    invoke-direct {v0, v5, v9}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2789
    goto/16 :goto_b

    .line 2801
    :pswitch_e
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2802
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2803
    const-string v5, "setDefaultNamespace"

    invoke-direct {v0, v5, v8}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2807
    goto/16 :goto_b

    .line 2608
    :pswitch_f
    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitStrictSetName(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2609
    goto/16 :goto_b

    .line 2810
    :pswitch_10
    invoke-direct {v0, v1, v13}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateYieldPoint(Lcom/trendmicro/hippo/Node;Z)V

    .line 2811
    goto/16 :goto_b

    .line 2704
    :pswitch_11
    const/16 v5, 0x11

    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 2705
    .local v5, "special":Ljava/lang/String;
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2706
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 2707
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2708
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2709
    const-string v6, "specialRef"

    const-string v7, "(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Ref;"

    invoke-direct {v0, v6, v7}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2717
    .end local v5    # "special":Ljava/lang/String;
    goto/16 :goto_b

    .line 2247
    :pswitch_12
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateFunctionAndThisObj(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2249
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 2250
    invoke-direct {v0, v1, v4, v11}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateCallArgArray(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    .line 2251
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2252
    const-string v5, "callRef"

    const-string v6, "(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Ref;"

    invoke-direct {v0, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2259
    goto/16 :goto_b

    .line 2657
    :pswitch_13
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2658
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2659
    const-string v5, "refDel"

    invoke-direct {v0, v5, v15}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2663
    goto/16 :goto_b

    .line 2586
    :pswitch_14
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2587
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2588
    invoke-direct {v0, v10, v15}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2593
    goto/16 :goto_b

    .line 2351
    :pswitch_15
    invoke-direct {v0, v1, v4, v11}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitObjectLiteral(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    .line 2352
    goto/16 :goto_b

    .line 2347
    :pswitch_16
    invoke-direct {v0, v1, v4, v11}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitArrayLiteral(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    .line 2348
    goto/16 :goto_b

    .line 2281
    :pswitch_17
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v6, 0x2a

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2282
    goto/16 :goto_b

    .line 2331
    :pswitch_18
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getLocalBlockRegister(Lcom/trendmicro/hippo/Node;)I

    move-result v5

    .line 2332
    .local v5, "local":I
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2333
    const/16 v6, 0x3e

    if-ne v3, v6, :cond_2

    .line 2334
    const-string v6, "enumNext"

    const-string v7, "(Ljava/lang/Object;)Ljava/lang/Boolean;"

    invoke-direct {v0, v6, v7}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_b

    .line 2337
    :cond_2
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2338
    const-string v6, "enumId"

    invoke-direct {v0, v6, v8}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2343
    goto/16 :goto_b

    .line 2600
    .end local v5    # "local":I
    :pswitch_19
    invoke-direct {v0, v1, v4, v13}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitSetVar(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    .line 2601
    goto/16 :goto_b

    .line 2596
    :pswitch_1a
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitGetVar(Lcom/trendmicro/hippo/Node;)V

    .line 2597
    goto/16 :goto_b

    .line 2699
    :pswitch_1b
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getLocalBlockRegister(Lcom/trendmicro/hippo/Node;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2700
    goto/16 :goto_b

    .line 2681
    :goto_2
    :pswitch_1c
    if-eqz v4, :cond_3

    .line 2682
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2683
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    goto :goto_2

    .line 2686
    :cond_3
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2687
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2688
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 2689
    const-string v5, "bind"

    const-string v6, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {v0, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2696
    goto/16 :goto_b

    .line 2301
    :pswitch_1d
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2302
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2303
    const/4 v5, 0x4

    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/Node;->getExistingIntProp(I)I

    move-result v5

    .line 2304
    .local v5, "i":I
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v7, v7, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v9, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 2305
    invoke-virtual {v8, v9, v5}, Lcom/trendmicro/hippo/optimizer/Codegen;->getCompiledRegexpName(Lcom/trendmicro/hippo/ast/ScriptNode;I)Ljava/lang/String;

    move-result-object v8

    .line 2304
    const-string v9, "Ljava/lang/Object;"

    const/16 v10, 0xb2

    invoke-virtual {v6, v10, v7, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2307
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v7, 0xb8

    const-string v8, "com/trendmicro/hippo/ScriptRuntime"

    const-string v9, "wrapRegExp"

    const-string v10, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {v6, v7, v8, v9, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2315
    .end local v5    # "i":I
    goto/16 :goto_b

    .line 2289
    :pswitch_1e
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v6, 0xb2

    invoke-virtual {v5, v6, v12, v14, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2291
    goto/16 :goto_b

    .line 2294
    :pswitch_1f
    const/16 v6, 0xb2

    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v6, v12, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2296
    goto/16 :goto_b

    .line 2277
    :pswitch_20
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2278
    goto/16 :goto_b

    .line 2285
    :pswitch_21
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2286
    goto/16 :goto_b

    .line 2273
    :pswitch_22
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 2274
    goto/16 :goto_b

    .line 2263
    :pswitch_23
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v5

    .line 2264
    .local v5, "num":D
    const/16 v7, 0x8

    const/4 v8, -0x1

    invoke-virtual {v1, v7, v8}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v7

    if-eq v7, v8, :cond_4

    .line 2265
    iget-object v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(D)V

    goto :goto_3

    .line 2267
    :cond_4
    iget-object v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v8, v5, v6}, Lcom/trendmicro/hippo/optimizer/Codegen;->pushNumberAsObject(Lcom/trendmicro/classfile/ClassFileWriter;D)V

    .line 2270
    .end local v5    # "num":D
    :goto_3
    goto/16 :goto_b

    .line 2211
    :pswitch_24
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2212
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2213
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 2214
    const-string v5, "name"

    const-string v6, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;"

    invoke-direct {v0, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2221
    goto/16 :goto_b

    .line 2626
    :pswitch_25
    invoke-direct {v0, v3, v1, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitSetElem(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2627
    goto/16 :goto_b

    .line 2563
    :pswitch_26
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2564
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    invoke-direct {v0, v5, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2565
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2566
    const/16 v5, 0x8

    const/4 v6, -0x1

    invoke-virtual {v1, v5, v6}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v5

    if-eq v5, v6, :cond_5

    .line 2567
    const-string v5, "getObjectIndex"

    const-string v6, "(Ljava/lang/Object;DLcom/trendmicro/hippo/Context;)Ljava/lang/Object;"

    invoke-direct {v0, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_b

    .line 2574
    :cond_5
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2575
    const-string v5, "getObjectElem"

    const-string v6, "(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    invoke-direct {v0, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2583
    goto/16 :goto_b

    .line 2621
    :pswitch_27
    invoke-direct {v0, v3, v1, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitSetProp(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2622
    goto/16 :goto_b

    .line 2559
    :pswitch_28
    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitGetProp(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2560
    goto/16 :goto_b

    .line 2388
    :pswitch_29
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2389
    const-string v5, "typeof"

    const-string v6, "(Ljava/lang/Object;)Ljava/lang/String;"

    invoke-direct {v0, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2392
    goto/16 :goto_b

    .line 2666
    :pswitch_2a
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    const/16 v6, 0x31

    if-ne v5, v6, :cond_6

    goto :goto_4

    :cond_6
    move v13, v11

    :goto_4
    move v5, v13

    .line 2667
    .local v5, "isName":Z
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2668
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 2669
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2670
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2671
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Z)V

    .line 2672
    const-string v6, "delete"

    const-string v7, "(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Z)Ljava/lang/Object;"

    invoke-direct {v0, v6, v7}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2677
    goto/16 :goto_b

    .line 2226
    .end local v5    # "isName":Z
    :pswitch_2b
    const/16 v5, 0xa

    invoke-virtual {v1, v5, v11}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v5

    .line 2228
    .local v5, "specialType":I
    if-nez v5, :cond_9

    .line 2230
    const/16 v6, 0x9

    invoke-virtual {v1, v6}, Lcom/trendmicro/hippo/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 2233
    .local v6, "target":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    if-eqz v6, :cond_7

    .line 2234
    invoke-direct {v0, v1, v6, v3, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitOptimizedCall(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/optimizer/OptFunctionNode;ILcom/trendmicro/hippo/Node;)V

    goto :goto_5

    .line 2235
    :cond_7
    const/16 v7, 0x26

    if-ne v3, v7, :cond_8

    .line 2236
    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitStandardCall(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    goto :goto_5

    .line 2238
    :cond_8
    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitStandardNew(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2240
    .end local v6    # "target":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    :goto_5
    goto :goto_6

    .line 2241
    :cond_9
    invoke-direct {v0, v1, v3, v5, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitSpecialCall(Lcom/trendmicro/hippo/Node;IILcom/trendmicro/hippo/Node;)V

    .line 2244
    .end local v5    # "specialType":I
    :goto_6
    goto/16 :goto_b

    .line 2502
    :pswitch_2c
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2503
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 2504
    const/16 v5, 0x1d

    if-ne v3, v5, :cond_a

    .line 2505
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v6, 0x77

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2507
    :cond_a
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 2508
    goto/16 :goto_b

    .line 2373
    :pswitch_2d
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2374
    const-string v5, "toInt32"

    const-string v6, "(Ljava/lang/Object;)I"

    invoke-direct {v0, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2375
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 2376
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v6, 0x82

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2377
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v6, 0x87

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2378
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 2379
    goto/16 :goto_b

    .line 2355
    :pswitch_2e
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v5

    .line 2356
    .local v5, "trueTarget":I
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v6

    .line 2357
    .local v6, "falseTarget":I
    iget-object v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v7

    .line 2358
    .local v7, "beyond":I
    invoke-direct {v0, v4, v1, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateIfJump(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V

    .line 2360
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 2361
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v11, 0xb2

    invoke-virtual {v10, v11, v12, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2363
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v10, 0xa7

    invoke-virtual {v8, v10, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 2364
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 2365
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v11, v12, v14, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2367
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 2368
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v9, -0x1

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->adjustStackTop(I)V

    .line 2369
    goto/16 :goto_b

    .line 2486
    .end local v5    # "trueTarget":I
    .end local v6    # "falseTarget":I
    .end local v7    # "beyond":I
    :pswitch_2f
    const/16 v5, 0x18

    if-ne v3, v5, :cond_b

    .line 2487
    const/16 v5, 0x6f

    goto :goto_7

    .line 2488
    :cond_b
    const/16 v5, 0x73

    .line 2486
    :goto_7
    invoke-direct {v0, v1, v5, v4, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitArithmetic(Lcom/trendmicro/hippo/Node;ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2489
    goto/16 :goto_b

    .line 2477
    :pswitch_30
    const/16 v5, 0x6b

    invoke-direct {v0, v1, v5, v4, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitArithmetic(Lcom/trendmicro/hippo/Node;ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2478
    goto/16 :goto_b

    .line 2481
    :pswitch_31
    const/16 v5, 0x67

    invoke-direct {v0, v1, v5, v4, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitArithmetic(Lcom/trendmicro/hippo/Node;ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2482
    goto/16 :goto_b

    .line 2439
    :pswitch_32
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2440
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    invoke-direct {v0, v5, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2441
    const/16 v5, 0x8

    const/4 v6, -0x1

    invoke-virtual {v1, v5, v6}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v5

    if-eqz v5, :cond_10

    const-string v6, "add"

    if-eq v5, v13, :cond_f

    const/4 v7, 0x2

    if-eq v5, v7, :cond_e

    .line 2454
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    const/16 v7, 0x29

    if-ne v5, v7, :cond_c

    .line 2455
    const-string v5, "(Ljava/lang/CharSequence;Ljava/lang/Object;)Ljava/lang/CharSequence;"

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_b

    .line 2459
    :cond_c
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    const/16 v7, 0x29

    if-ne v5, v7, :cond_d

    .line 2460
    const-string v5, "(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;"

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_b

    .line 2465
    :cond_d
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2466
    const-string v5, "(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;"

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2474
    goto/16 :goto_b

    .line 2450
    :cond_e
    const-string v5, "(Ljava/lang/Object;D)Ljava/lang/Object;"

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2452
    goto/16 :goto_b

    .line 2446
    :cond_f
    const-string v5, "(DLjava/lang/Object;)Ljava/lang/Object;"

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2448
    goto/16 :goto_b

    .line 2443
    :cond_10
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v6, 0x63

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2444
    goto/16 :goto_b

    .line 2539
    :pswitch_33
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v5

    .line 2540
    .local v5, "trueGOTO":I
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v6

    .line 2541
    .local v6, "falseGOTO":I
    invoke-direct {v0, v1, v4, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitIfJumpRelOp(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V

    .line 2542
    invoke-direct {v0, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addJumpedBooleanWrap(II)V

    .line 2543
    goto/16 :goto_b

    .line 2550
    .end local v5    # "trueGOTO":I
    .end local v6    # "falseGOTO":I
    :pswitch_34
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v5

    .line 2551
    .restart local v5    # "trueGOTO":I
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v6

    .line 2552
    .restart local v6    # "falseGOTO":I
    invoke-direct {v0, v1, v4, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitIfJumpEqOp(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V

    .line 2553
    invoke-direct {v0, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addJumpedBooleanWrap(II)V

    .line 2554
    goto/16 :goto_b

    .line 2497
    .end local v5    # "trueGOTO":I
    .end local v6    # "falseGOTO":I
    :pswitch_35
    invoke-direct {v0, v1, v3, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitBitOp(Lcom/trendmicro/hippo/Node;ILcom/trendmicro/hippo/Node;)V

    .line 2498
    goto/16 :goto_b

    .line 2604
    :pswitch_36
    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitSetName(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2605
    goto/16 :goto_b

    .line 2512
    :cond_11
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2513
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 2514
    goto/16 :goto_b

    .line 2518
    :cond_12
    const/4 v5, -0x1

    .line 2519
    .local v5, "prop":I
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v6

    const/16 v7, 0x28

    if-ne v6, v7, :cond_13

    .line 2520
    const/16 v6, 0x8

    const/4 v7, -0x1

    invoke-virtual {v4, v6, v7}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v5

    goto :goto_8

    .line 2519
    :cond_13
    const/16 v6, 0x8

    const/4 v7, -0x1

    .line 2522
    :goto_8
    if-eq v5, v7, :cond_14

    .line 2523
    invoke-virtual {v4, v6}, Lcom/trendmicro/hippo/Node;->removeProp(I)V

    .line 2524
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2525
    invoke-virtual {v4, v6, v5}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    goto/16 :goto_b

    .line 2527
    :cond_14
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2528
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 2530
    goto/16 :goto_b

    .line 2814
    .end local v5    # "prop":I
    :cond_15
    move-object v5, v4

    .line 2815
    .local v5, "enterWith":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 2816
    .local v6, "with":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v6}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v7

    .line 2817
    .local v7, "leaveWith":Lcom/trendmicro/hippo/Node;
    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateStatement(Lcom/trendmicro/hippo/Node;)V

    .line 2818
    invoke-virtual {v6}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v8

    invoke-direct {v0, v8, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2819
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateStatement(Lcom/trendmicro/hippo/Node;)V

    .line 2820
    goto/16 :goto_b

    .line 2779
    .end local v5    # "enterWith":Lcom/trendmicro/hippo/Node;
    .end local v6    # "with":Lcom/trendmicro/hippo/Node;
    .end local v7    # "leaveWith":Lcom/trendmicro/hippo/Node;
    :cond_16
    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitDotQuery(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2780
    goto/16 :goto_b

    .line 2632
    :cond_17
    :pswitch_37
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2633
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 2634
    const/16 v5, 0x8f

    if-ne v3, v5, :cond_18

    .line 2635
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v6, 0x59

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2636
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2637
    invoke-direct {v0, v10, v15}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2643
    :cond_18
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2644
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2645
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2646
    const-string v5, "refSet"

    const-string v6, "(Lcom/trendmicro/hippo/Ref;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    invoke-direct {v0, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2654
    goto/16 :goto_b

    .line 2382
    :cond_19
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2383
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2384
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v5}, Lcom/trendmicro/hippo/optimizer/Codegen;->pushUndefined(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 2385
    goto/16 :goto_b

    .line 2196
    :cond_1a
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    if-nez v5, :cond_1b

    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    const/16 v6, 0x89

    if-eq v5, v6, :cond_21

    .line 2197
    :cond_1b
    invoke-virtual {v1, v13}, Lcom/trendmicro/hippo/Node;->getExistingIntProp(I)I

    move-result v5

    .line 2198
    .local v5, "fnIndex":I
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-static {v6, v5}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->get(Lcom/trendmicro/hippo/ast/ScriptNode;I)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    move-result-object v6

    .line 2200
    .local v6, "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    iget-object v7, v6, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v7

    .line 2201
    .local v7, "t":I
    const/4 v8, 0x2

    if-eq v7, v8, :cond_1d

    const/4 v8, 0x4

    if-ne v7, v8, :cond_1c

    goto :goto_9

    .line 2203
    :cond_1c
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v8

    throw v8

    .line 2205
    :cond_1d
    :goto_9
    invoke-direct {v0, v6, v7}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitFunction(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;I)V

    .line 2206
    .end local v5    # "fnIndex":I
    .end local v6    # "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .end local v7    # "t":I
    goto :goto_b

    .line 2421
    :cond_1e
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 2422
    .local v6, "ifThen":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v6}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v8

    .line 2423
    .local v8, "ifElse":Lcom/trendmicro/hippo/Node;
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2424
    invoke-direct {v0, v7, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2426
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v5

    .line 2427
    .local v5, "elseTarget":I
    iget-object v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v9, 0x99

    invoke-virtual {v7, v9, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 2428
    iget-object v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v7

    .line 2429
    .local v7, "stack":S
    invoke-direct {v0, v6, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2430
    iget-object v9, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v9}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v9

    .line 2431
    .local v9, "afterHook":I
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v11, 0xa7

    invoke-virtual {v10, v11, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 2432
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10, v5, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(IS)V

    .line 2433
    invoke-direct {v0, v8, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2434
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 2436
    .end local v5    # "elseTarget":I
    .end local v6    # "ifThen":Lcom/trendmicro/hippo/Node;
    .end local v7    # "stack":S
    .end local v8    # "ifElse":Lcom/trendmicro/hippo/Node;
    .end local v9    # "afterHook":I
    goto :goto_b

    .line 2318
    :cond_1f
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 2319
    .local v5, "next":Lcom/trendmicro/hippo/Node;
    :goto_a
    if-eqz v5, :cond_20

    .line 2320
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2321
    iget-object v7, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2322
    move-object v4, v5

    .line 2323
    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    goto :goto_a

    .line 2325
    :cond_20
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2326
    nop

    .line 2835
    .end local v5    # "next":Lcom/trendmicro/hippo/Node;
    :cond_21
    :goto_b
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_36
        :pswitch_35
        :pswitch_35
        :pswitch_35
        :pswitch_34
        :pswitch_34
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_35
        :pswitch_35
        :pswitch_35
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_2b
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_34
        :pswitch_34
        :pswitch_1d
        :pswitch_1c
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x34
        :pswitch_33
        :pswitch_33
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x3e
        :pswitch_18
        :pswitch_18
        :pswitch_17
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x42
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_37
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x69
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_5
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x8a
        :pswitch_4
        :pswitch_3
        :pswitch_27
        :pswitch_25
    .end packed-switch

    :pswitch_data_6
    .packed-switch 0x9c
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_7
    .packed-switch 0x4e
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method

.method private generateFunctionAndThisObj(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 6
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "parent"    # Lcom/trendmicro/hippo/Node;

    .line 3670
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    .line 3671
    .local v0, "type":I
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    const/16 v2, 0x21

    if-eq v1, v2, :cond_2

    const/16 v3, 0x22

    if-eq v1, v3, :cond_1

    const/16 v3, 0x24

    if-eq v1, v3, :cond_2

    const/16 v2, 0x27

    if-eq v1, v2, :cond_0

    .line 3724
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3725
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3726
    const-string v1, "getValueFunctionAndThis"

    const-string v2, "(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Callable;"

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 3710
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v1

    .line 3711
    .local v1, "name":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3712
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3713
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3714
    const-string v2, "getNameFunctionAndThis"

    const-string v3, "(Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;"

    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3720
    goto :goto_0

    .line 3673
    .end local v1    # "name":Ljava/lang/String;
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 3677
    :cond_2
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 3678
    .local v1, "target":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3679
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 3680
    .local v3, "id":Lcom/trendmicro/hippo/Node;
    if-ne v0, v2, :cond_3

    .line 3681
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v2

    .line 3682
    .local v2, "property":Ljava/lang/String;
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3683
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3684
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3685
    const-string v4, "getPropFunctionAndThis"

    const-string v5, "(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;"

    invoke-direct {p0, v4, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3692
    .end local v2    # "property":Ljava/lang/String;
    goto :goto_0

    .line 3693
    :cond_3
    invoke-direct {p0, v3, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3694
    const/16 v2, 0x8

    const/4 v4, -0x1

    invoke-virtual {p1, v2, v4}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v2

    if-eq v2, v4, :cond_4

    .line 3695
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 3696
    :cond_4
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3697
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3698
    const-string v2, "getElemFunctionAndThis"

    const-string v4, "(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;"

    invoke-direct {p0, v2, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3706
    nop

    .line 3734
    .end local v1    # "target":Lcom/trendmicro/hippo/Node;
    .end local v3    # "id":Lcom/trendmicro/hippo/Node;
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3735
    const-string v1, "lastStoredScriptable"

    const-string v2, "(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3739
    return-void
.end method

.method private generateGenerator()V
    .locals 5

    .line 1335
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 1336
    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodSignature(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v2

    .line 1335
    const/16 v3, 0xa

    invoke-virtual {v0, v1, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 1339
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->initBodyGeneration()V

    .line 1340
    iget-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    add-int/lit8 v1, v0, 0x1

    int-to-short v1, v1

    iput-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    .line 1341
    iput-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    .line 1344
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    if-eqz v0, :cond_0

    .line 1348
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->funObjLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1349
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb9

    const-string v2, "com/trendmicro/hippo/Scriptable"

    const-string v3, "getParentScope"

    const-string v4, "()Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1353
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1357
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->funObjLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1358
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1359
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1360
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->isInStrictMode()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Z)V

    .line 1361
    const-string v0, "createFunctionActivation"

    const-string v1, "(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1367
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1370
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xbb

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v2, v2, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 1372
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0x59

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1373
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1374
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1375
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFnIndex:I

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 1376
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb7

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v2, v2, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v3, "<init>"

    const-string v4, "(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Context;I)V"

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1379
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateNestedFunctionInits()V

    .line 1382
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1383
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1384
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->maxLocals:I

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 1385
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->maxStack:I

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 1386
    const-string v0, "createNativeGenerator"

    const-string v1, "(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;II)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1392
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1393
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    add-int/lit8 v1, v1, 0x1

    int-to-short v1, v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 1394
    return-void
.end method

.method private generateGetGeneratorLocalsState()V
    .locals 2

    .line 1846
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generatorStateLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1847
    const-string v0, "getGeneratorLocalsState"

    const-string v1, "(Ljava/lang/Object;)[Ljava/lang/Object;"

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1849
    return-void
.end method

.method private generateGetGeneratorResumptionPoint()V
    .locals 5

    .line 1715
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generatorStateLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1716
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb4

    const-string v2, "com/trendmicro/hippo/optimizer/OptRuntime$GeneratorState"

    const-string v3, "resumptionPoint"

    const-string v4, "I"

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1720
    return-void
.end method

.method private generateGetGeneratorStackState()V
    .locals 2

    .line 1734
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generatorStateLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1735
    const-string v0, "getGeneratorStackState"

    const-string v1, "(Ljava/lang/Object;)[Ljava/lang/Object;"

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1737
    return-void
.end method

.method private generateIfJump(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "parent"    # Lcom/trendmicro/hippo/Node;
    .param p3, "trueLabel"    # I
    .param p4, "falseLabel"    # I

    .line 2930
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    .line 2931
    .local v0, "type":I
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 2933
    .local v1, "child":Lcom/trendmicro/hippo/Node;
    const/16 v2, 0x1a

    if-eq v0, v2, :cond_4

    const/16 v2, 0x2e

    if-eq v0, v2, :cond_3

    const/16 v2, 0x2f

    if-eq v0, v2, :cond_3

    const/16 v2, 0x34

    if-eq v0, v2, :cond_2

    const/16 v2, 0x35

    if-eq v0, v2, :cond_2

    const/16 v2, 0x69

    const/16 v3, 0x6a

    if-eq v0, v2, :cond_0

    if-eq v0, v3, :cond_0

    packed-switch v0, :pswitch_data_0

    .line 2971
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2972
    const-string v2, "toBoolean"

    const-string v3, "(Ljava/lang/Object;)Z"

    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2973
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x9a

    invoke-virtual {v2, v3, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 2974
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0xa7

    invoke-virtual {v2, v3, p4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    goto :goto_1

    .line 2940
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v2

    .line 2941
    .local v2, "interLabel":I
    if-ne v0, v3, :cond_1

    .line 2942
    invoke-direct {p0, v1, p1, v2, p4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateIfJump(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V

    goto :goto_0

    .line 2945
    :cond_1
    invoke-direct {p0, v1, p1, p3, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateIfJump(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V

    .line 2947
    :goto_0
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 2948
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 2949
    invoke-direct {p0, v1, p1, p3, p4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateIfJump(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V

    .line 2950
    goto :goto_1

    .line 2959
    .end local v2    # "interLabel":I
    :cond_2
    :pswitch_0
    invoke-direct {p0, p1, v1, p3, p4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitIfJumpRelOp(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V

    .line 2960
    goto :goto_1

    .line 2966
    :cond_3
    :pswitch_1
    invoke-direct {p0, p1, v1, p3, p4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitIfJumpEqOp(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V

    .line 2967
    goto :goto_1

    .line 2935
    :cond_4
    invoke-direct {p0, v1, p1, p4, p3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateIfJump(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V

    .line 2936
    nop

    .line 2976
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private generateIntegerUnwrap()V
    .locals 5

    .line 2159
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb6

    const-string v2, "java/lang/Integer"

    const-string v3, "intValue"

    const-string v4, "()I"

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2161
    return-void
.end method

.method private generateIntegerWrap()V
    .locals 5

    .line 2152
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb8

    const-string v2, "java/lang/Integer"

    const-string v3, "valueOf"

    const-string v4, "(I)Ljava/lang/Integer;"

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2154
    return-void
.end method

.method private generateNestedFunctionInits()V
    .locals 5

    .line 1398
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionCount()I

    move-result v0

    .line 1399
    .local v0, "functionCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_1

    .line 1400
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->get(Lcom/trendmicro/hippo/ast/ScriptNode;I)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    move-result-object v2

    .line 1401
    .local v2, "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    iget-object v3, v2, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 1404
    invoke-direct {p0, v2, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitFunction(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;I)V

    .line 1399
    .end local v2    # "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1407
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method private generateObjectLiteralFactory(Lcom/trendmicro/hippo/Node;I)V
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "count"    # I

    .line 3083
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_literal"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3084
    .local v0, "methodName":Ljava/lang/String;
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->initBodyGeneration()V

    .line 3085
    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    add-int/lit8 v2, v1, 0x1

    int-to-short v2, v2

    iput-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    .line 3086
    iput-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    .line 3087
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const-string v2, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;"

    const/4 v3, 0x2

    invoke-virtual {v1, v0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 3093
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, p1, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitObjectLiteral(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    .line 3094
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0xb0

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3095
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    add-int/2addr v3, v2

    int-to-short v2, v3

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 3096
    return-void
.end method

.method private generatePrologue()V
    .locals 14

    .line 1452
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inDirectCallFunction:Z

    const/16 v1, 0xb2

    const/4 v2, 0x4

    const/4 v3, 0x1

    if-eqz v0, :cond_2

    .line 1453
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamCount()I

    move-result v0

    .line 1458
    .local v0, "directParameterCount":I
    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    if-eq v4, v2, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1459
    :cond_0
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-eq v4, v0, :cond_1

    .line 1460
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    iget-short v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    aput-short v6, v5, v4

    .line 1462
    add-int/lit8 v6, v6, 0x3

    int-to-short v5, v6

    iput-short v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    .line 1459
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1464
    .end local v4    # "i":I
    :cond_1
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getParameterNumberContext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1466
    iput-boolean v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsForcedObjectParameters:Z

    .line 1467
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_1
    if-eq v4, v0, :cond_2

    .line 1468
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v5, v5, v4

    .line 1469
    .local v5, "reg":S
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1470
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const-string v7, "java/lang/Void"

    const-string v8, "TYPE"

    const-string v9, "Ljava/lang/Class;"

    invoke-virtual {v6, v1, v7, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1474
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v6

    .line 1475
    .local v6, "isObjectLabel":I
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0xa6

    invoke-virtual {v7, v8, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 1476
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int/lit8 v8, v5, 0x1

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    .line 1477
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 1478
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1479
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 1467
    .end local v5    # "reg":S
    .end local v6    # "isObjectLabel":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1484
    .end local v0    # "directParameterCount":I
    .end local v4    # "i":I
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    if-eqz v0, :cond_3

    .line 1486
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->funObjLocal:S

    invoke-virtual {v0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1487
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v4, 0xb9

    const-string v5, "com/trendmicro/hippo/Scriptable"

    const-string v6, "getParentScope"

    const-string v7, "()Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {v0, v4, v5, v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1491
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1495
    :cond_3
    iget-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    add-int/lit8 v4, v0, 0x1

    int-to-short v4, v4

    iput-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    .line 1496
    iput-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    .line 1499
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    const-string v5, "Lcom/trendmicro/hippo/Scriptable;"

    const/4 v6, -0x1

    const/4 v7, 0x0

    if-eqz v0, :cond_5

    .line 1502
    add-int/lit8 v0, v4, 0x1

    int-to-short v0, v0

    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->operationLocal:S

    .line 1503
    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    .line 1509
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1510
    iget-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    add-int/lit8 v4, v0, 0x1

    int-to-short v4, v4

    iput-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generatorStateLocal:S

    .line 1511
    iput-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    .line 1512
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v4, 0xc0

    const-string v8, "com/trendmicro/hippo/optimizer/OptRuntime$GeneratorState"

    invoke-virtual {v0, v4, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 1513
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v4, 0x59

    invoke-virtual {v0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1514
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generatorStateLocal:S

    invoke-virtual {v0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1515
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v4, 0xb4

    const-string v9, "thisObj"

    invoke-virtual {v0, v4, v8, v9, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1519
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1521
    iget v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->epilogueLabel:I

    if-ne v0, v6, :cond_4

    .line 1522
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->epilogueLabel:I

    .line 1525
    :cond_4
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    check-cast v0, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getResumptionPoints()Ljava/util/List;

    move-result-object v0

    .line 1526
    .local v0, "targets":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/Node;>;"
    if-eqz v0, :cond_5

    .line 1528
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateGetGeneratorResumptionPoint()V

    .line 1531
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 1532
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v8

    add-int/2addr v8, v7

    .line 1531
    invoke-virtual {v4, v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v4

    iput v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generatorSwitch:I

    .line 1533
    invoke-direct {p0, v6, v7, v7}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateCheckForThrowOrClose(IZI)V

    .line 1539
    .end local v0    # "targets":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/Node;>;"
    :cond_5
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getRegexpCount()I

    move-result v0

    if-eqz v0, :cond_6

    .line 1540
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1541
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v4, 0xb8

    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v8, v8, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v9, "_reInit"

    const-string v10, "(Lcom/trendmicro/hippo/Context;)V"

    invoke-virtual {v0, v4, v8, v9, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1546
    :cond_6
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1547
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->saveCurrentCodeOffset()V

    .line 1549
    :cond_7
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-eqz v0, :cond_14

    .line 1551
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamCount()I

    move-result v0

    .line 1552
    .local v0, "parmCount":I
    if-lez v0, :cond_8

    iget-boolean v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inDirectCallFunction:Z

    if-nez v1, :cond_8

    .line 1555
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1556
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0xbe

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1557
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 1558
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v1

    .line 1559
    .local v1, "label":I
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v4, 0xa2

    invoke-virtual {v2, v4, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 1560
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v2, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1561
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 1562
    const-string v2, "padArguments"

    const-string v4, "([Ljava/lang/Object;I)[Ljava/lang/Object;"

    invoke-direct {p0, v2, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1565
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v2, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1566
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 1569
    .end local v1    # "label":I
    :cond_8
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    iget-object v1, v1, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamCount()I

    move-result v1

    .line 1570
    .local v1, "paramCount":I
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    iget-object v2, v2, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamAndVarCount()I

    move-result v2

    .line 1571
    .local v2, "varCount":I
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    iget-object v4, v4, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamAndVarConst()[Z

    move-result-object v4

    .line 1575
    .local v4, "constDeclarations":[Z
    const/4 v5, -0x1

    .line 1576
    .local v5, "firstUndefVar":S
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2
    if-eq v8, v2, :cond_13

    .line 1577
    const/4 v9, -0x1

    .line 1578
    .local v9, "reg":S
    if-ge v8, v1, :cond_9

    .line 1579
    iget-boolean v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inDirectCallFunction:Z

    if-nez v10, :cond_c

    .line 1580
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v9

    .line 1581
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v11, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v10, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1582
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 1583
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v11, 0x32

    invoke-virtual {v10, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1584
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    goto :goto_4

    .line 1586
    :cond_9
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v10, v8}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 1587
    aget-boolean v10, v4, v8

    invoke-direct {p0, v10}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordPairLocal(Z)S

    move-result v9

    .line 1588
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const-wide/16 v11, 0x0

    invoke-virtual {v10, v11, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(D)V

    .line 1589
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addDStore(I)V

    goto :goto_4

    .line 1591
    :cond_a
    aget-boolean v10, v4, v8

    invoke-direct {p0, v10}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal(Z)S

    move-result v9

    .line 1592
    if-ne v5, v6, :cond_b

    .line 1593
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v10}, Lcom/trendmicro/hippo/optimizer/Codegen;->pushUndefined(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 1594
    move v5, v9

    goto :goto_3

    .line 1596
    :cond_b
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1598
    :goto_3
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1600
    :cond_c
    :goto_4
    if-ltz v9, :cond_f

    .line 1601
    aget-boolean v10, v4, v8

    if-eqz v10, :cond_e

    .line 1602
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 1603
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v11, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v11, v8}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v11

    if-eqz v11, :cond_d

    const/4 v11, 0x2

    goto :goto_5

    :cond_d
    move v11, v3

    :goto_5
    add-int/2addr v11, v9

    invoke-virtual {v10, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->addIStore(I)V

    .line 1605
    :cond_e
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    aput-short v9, v10, v8

    .line 1609
    :cond_f
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v10}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateDebugInfo()Z

    move-result v10

    if-eqz v10, :cond_12

    .line 1610
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    iget-object v10, v10, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v10, v8}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v10

    .line 1611
    .local v10, "name":Ljava/lang/String;
    iget-object v11, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v11, v8}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v11

    if-eqz v11, :cond_10

    .line 1612
    const-string v11, "D"

    goto :goto_6

    :cond_10
    const-string v11, "Ljava/lang/Object;"

    .line 1613
    .local v11, "type":Ljava/lang/String;
    :goto_6
    iget-object v12, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v12}, Lcom/trendmicro/classfile/ClassFileWriter;->getCurrentCodeOffset()I

    move-result v12

    .line 1614
    .local v12, "startPC":I
    if-gez v9, :cond_11

    .line 1615
    iget-object v13, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v9, v13, v8

    .line 1617
    :cond_11
    iget-object v13, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v13, v10, v11, v12, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addVariableDescriptor(Ljava/lang/String;Ljava/lang/String;II)V

    .line 1576
    .end local v9    # "reg":S
    .end local v10    # "name":Ljava/lang/String;
    .end local v11    # "type":Ljava/lang/String;
    .end local v12    # "startPC":I
    :cond_12
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_2

    .line 1622
    .end local v8    # "i":I
    :cond_13
    return-void

    .line 1628
    .end local v0    # "parmCount":I
    .end local v1    # "paramCount":I
    .end local v2    # "varCount":I
    .end local v4    # "constDeclarations":[Z
    .end local v5    # "firstUndefVar":S
    :cond_14
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v0, :cond_15

    .line 1629
    return-void

    .line 1633
    :cond_15
    const/4 v0, 0x0

    .line 1634
    .local v0, "isArrow":Z
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    instance-of v8, v4, Lcom/trendmicro/hippo/ast/FunctionNode;

    if-eqz v8, :cond_17

    .line 1635
    check-cast v4, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v4

    if-ne v4, v2, :cond_16

    move v2, v3

    goto :goto_7

    :cond_16
    move v2, v7

    :goto_7
    move v0, v2

    .line 1637
    :cond_17
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    if-eqz v2, :cond_19

    .line 1638
    const-string v2, "activation"

    .line 1639
    .local v2, "debugVariableName":Ljava/lang/String;
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->funObjLocal:S

    invoke-virtual {v4, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1640
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v4, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1641
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v4, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1642
    if-eqz v0, :cond_18

    const-string v4, "createArrowFunctionActivation"

    goto :goto_8

    :cond_18
    const-string v4, "createFunctionActivation"

    .line 1643
    .local v4, "methodName":Ljava/lang/String;
    :goto_8
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v8}, Lcom/trendmicro/hippo/ast/ScriptNode;->isInStrictMode()Z

    move-result v8

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Z)V

    .line 1644
    const-string v7, "(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {p0, v4, v7}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1650
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1651
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1652
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1653
    const-string v7, "enterActivationFunction"

    const-string v8, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V"

    invoke-direct {p0, v7, v8}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1657
    .end local v4    # "methodName":Ljava/lang/String;
    goto :goto_9

    .line 1658
    .end local v2    # "debugVariableName":Ljava/lang/String;
    :cond_19
    const-string v2, "global"

    .line 1659
    .restart local v2    # "debugVariableName":Ljava/lang/String;
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->funObjLocal:S

    invoke-virtual {v4, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1660
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v4, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1661
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v4, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1662
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v4, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1663
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 1664
    const-string v4, "initScript"

    const-string v7, "(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V"

    invoke-direct {p0, v4, v7}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1673
    :goto_9
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v4

    iput v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->enterAreaStartLabel:I

    .line 1674
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v4

    iput v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->epilogueLabel:I

    .line 1675
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->enterAreaStartLabel:I

    invoke-virtual {v4, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 1677
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateNestedFunctionInits()V

    .line 1680
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateDebugInfo()Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 1681
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 1683
    invoke-virtual {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->getCurrentCodeOffset()I

    move-result v7

    iget-short v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    .line 1681
    invoke-virtual {v4, v2, v5, v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addVariableDescriptor(Ljava/lang/String;Ljava/lang/String;II)V

    .line 1686
    :cond_1a
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    if-nez v4, :cond_1c

    .line 1688
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v1

    iput-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->popvLocal:S

    .line 1689
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v1}, Lcom/trendmicro/hippo/optimizer/Codegen;->pushUndefined(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 1690
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->popvLocal:S

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1692
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getEndLineno()I

    move-result v1

    .line 1693
    .local v1, "linenum":I
    if-eq v1, v6, :cond_1b

    .line 1694
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    int-to-short v4, v1

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addLineNumberEntry(S)V

    .line 1696
    .end local v1    # "linenum":I
    :cond_1b
    goto :goto_a

    .line 1697
    :cond_1c
    iget-boolean v4, v4, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->itsContainsCalls0:Z

    if-eqz v4, :cond_1d

    .line 1698
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v4

    iput-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsZeroArgArray:S

    .line 1699
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const-string v5, "com/trendmicro/hippo/ScriptRuntime"

    const-string v6, "emptyArgs"

    const-string v7, "[Ljava/lang/Object;"

    invoke-virtual {v4, v1, v5, v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1702
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsZeroArgArray:S

    invoke-virtual {v1, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1704
    :cond_1d
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    iget-boolean v1, v1, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->itsContainsCalls1:Z

    if-eqz v1, :cond_1e

    .line 1705
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v1

    iput-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsOneArgArray:S

    .line 1706
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 1707
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0xbd

    const-string v4, "java/lang/Object"

    invoke-virtual {v1, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 1708
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsOneArgArray:S

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1711
    :cond_1e
    :goto_a
    return-void
.end method

.method private generateSaveLocals(Lcom/trendmicro/hippo/Node;)Z
    .locals 6
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 4261
    const/4 v0, 0x0

    .line 4262
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    if-ge v1, v2, :cond_1

    .line 4263
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->locals:[I

    aget v2, v2, v1

    if-eqz v2, :cond_0

    .line 4264
    add-int/lit8 v0, v0, 0x1

    .line 4262
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 4267
    .end local v1    # "i":I
    :cond_1
    if-nez v0, :cond_2

    .line 4268
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    check-cast v1, Lcom/trendmicro/hippo/ast/FunctionNode;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/trendmicro/hippo/ast/FunctionNode;->addLiveLocals(Lcom/trendmicro/hippo/Node;[I)V

    .line 4269
    const/4 v1, 0x0

    return v1

    .line 4273
    :cond_2
    iget v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->maxLocals:I

    if-le v1, v0, :cond_3

    goto :goto_1

    :cond_3
    move v1, v0

    :goto_1
    iput v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->maxLocals:I

    .line 4276
    new-array v1, v0, [I

    .line 4277
    .local v1, "ls":[I
    const/4 v2, 0x0

    .line 4278
    .local v2, "s":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    if-ge v3, v4, :cond_5

    .line 4279
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->locals:[I

    aget v4, v4, v3

    if-eqz v4, :cond_4

    .line 4280
    aput v3, v1, v2

    .line 4281
    add-int/lit8 v2, v2, 0x1

    .line 4278
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 4286
    .end local v3    # "i":I
    :cond_5
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    check-cast v3, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v3, p1, v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->addLiveLocals(Lcom/trendmicro/hippo/Node;[I)V

    .line 4289
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateGetGeneratorLocalsState()V

    .line 4290
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_3
    if-ge v3, v0, :cond_6

    .line 4291
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0x59

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4292
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 4293
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    aget v5, v1, v3

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4294
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0x53

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4290
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 4297
    .end local v3    # "i":I
    :cond_6
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v4, 0x57

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4299
    const/4 v3, 0x1

    return v3
.end method

.method private generateSetGeneratorResumptionPoint(I)V
    .locals 5
    .param p1, "nextState"    # I

    .line 1724
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generatorStateLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1725
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 1726
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb5

    const-string v2, "com/trendmicro/hippo/optimizer/OptRuntime$GeneratorState"

    const-string v3, "resumptionPoint"

    const-string v4, "I"

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1730
    return-void
.end method

.method private generateStatement(Lcom/trendmicro/hippo/Node;)V
    .locals 10
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 1861
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->updateLineNumber(Lcom/trendmicro/hippo/Node;)V

    .line 1862
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    .line 1863
    .local v0, "type":I
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1864
    .local v1, "child":Lcom/trendmicro/hippo/Node;
    const/16 v2, 0x32

    if-eq v0, v2, :cond_26

    const/16 v2, 0x33

    if-eq v0, v2, :cond_24

    const/16 v2, 0x41

    const/16 v3, 0xa7

    const/4 v4, -0x1

    if-eq v0, v2, :cond_1c

    const/16 v2, 0x52

    if-eq v0, v2, :cond_1b

    const/16 v2, 0x6e

    const/4 v5, 0x1

    if-eq v0, v2, :cond_18

    const/16 v2, 0x73

    if-eq v0, v2, :cond_16

    const/16 v2, 0x7c

    if-eq v0, v2, :cond_14

    const/16 v2, 0x7e

    const/4 v6, 0x0

    if-eq v0, v2, :cond_10

    const/16 v2, 0x8e

    const/4 v7, 0x2

    if-eq v0, v2, :cond_d

    const/16 v2, 0xa1

    if-eq v0, v2, :cond_c

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    .line 2145
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 2067
    :pswitch_0
    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2068
    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->popvLocal:S

    if-gez v2, :cond_0

    .line 2069
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v2

    iput-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->popvLocal:S

    .line 2071
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->popvLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 2072
    goto/16 :goto_7

    .line 2044
    :pswitch_1
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    const/16 v3, 0x38

    if-ne v2, v3, :cond_1

    .line 2047
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    invoke-direct {p0, v1, v2, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitSetVar(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    goto/16 :goto_7

    .line 2049
    :cond_1
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    const/16 v3, 0x9d

    if-ne v2, v3, :cond_2

    .line 2052
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    invoke-direct {p0, v1, v2, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitSetConstVar(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    goto/16 :goto_7

    .line 2054
    :cond_2
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    const/16 v3, 0x49

    if-ne v2, v3, :cond_3

    .line 2055
    invoke-direct {p0, v1, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateYieldPoint(Lcom/trendmicro/hippo/Node;Z)V

    goto/16 :goto_7

    .line 2058
    :cond_3
    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2059
    const/16 v2, 0x8

    invoke-virtual {p1, v2, v4}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v2

    if-eq v2, v4, :cond_4

    .line 2060
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x58

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_7

    .line 2062
    :cond_4
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x57

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2064
    goto/16 :goto_7

    .line 2076
    :pswitch_2
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 2077
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addInstructionCount()V

    .line 2078
    :cond_5
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getTargetLabel(Lcom/trendmicro/hippo/Node;)I

    move-result v2

    .line 2079
    .local v2, "label":I
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 2080
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 2081
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->saveCurrentCodeOffset()V

    .line 2083
    .end local v2    # "label":I
    :cond_6
    goto/16 :goto_7

    .line 2023
    :pswitch_3
    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2024
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2025
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2026
    const/16 v2, 0x3a

    if-ne v0, v2, :cond_7

    .line 2027
    move v5, v6

    goto :goto_0

    .line 2028
    :cond_7
    const/16 v2, 0x3b

    if-ne v0, v2, :cond_8

    .line 2029
    goto :goto_0

    .line 2030
    :cond_8
    const/16 v2, 0x3d

    if-ne v0, v2, :cond_9

    .line 2031
    const/4 v5, 0x6

    goto :goto_0

    .line 2032
    :cond_9
    move v5, v7

    :goto_0
    move v2, v5

    .line 2033
    .local v2, "enumType":I
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 2034
    const-string v3, "enumInit"

    const-string v4, "(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;"

    invoke-direct {p0, v3, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2040
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getLocalBlockRegister(Lcom/trendmicro/hippo/Node;)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 2041
    goto/16 :goto_7

    .line 1923
    .end local v2    # "enumType":I
    :pswitch_4
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->setStackTop(S)V

    .line 1925
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getLocalBlockRegister(Lcom/trendmicro/hippo/Node;)I

    move-result v2

    .line 1926
    .local v2, "local":I
    const/16 v3, 0xe

    .line 1927
    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/Node;->getExistingIntProp(I)I

    move-result v3

    .line 1929
    .local v3, "scopeIndex":I
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v4

    .line 1930
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1931
    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 1932
    if-nez v3, :cond_a

    .line 1933
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_1

    .line 1936
    :cond_a
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1938
    :goto_1
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 1939
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1940
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1942
    const-string v5, "newCatchScope"

    const-string v6, "(Ljava/lang/Throwable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {p0, v5, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 1950
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1952
    .end local v2    # "local":I
    .end local v3    # "scopeIndex":I
    .end local v4    # "name":Ljava/lang/String;
    goto/16 :goto_7

    .line 2089
    :pswitch_5
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 2090
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addInstructionCount()V

    .line 2091
    :cond_b
    move-object v2, p1

    check-cast v2, Lcom/trendmicro/hippo/ast/Jump;

    invoke-direct {p0, v2, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitGoto(Lcom/trendmicro/hippo/ast/Jump;ILcom/trendmicro/hippo/Node;)V

    .line 2092
    goto/16 :goto_7

    .line 2010
    :pswitch_6
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2011
    const-string v2, "leaveWith"

    const-string v3, "(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2015
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 2016
    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->decReferenceWordLocal(S)V

    .line 2017
    goto/16 :goto_7

    .line 1996
    :pswitch_7
    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 1997
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1998
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1999
    const-string v2, "enterWith"

    const-string v3, "(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 2005
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 2006
    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->incReferenceWordLocal(S)V

    .line 2007
    goto/16 :goto_7

    .line 2142
    :cond_c
    goto/16 :goto_7

    .line 1884
    :cond_d
    iget-boolean v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inLocalBlock:Z

    .line 1885
    .local v2, "prevLocal":Z
    iput-boolean v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inLocalBlock:Z

    .line 1886
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v3

    .line 1887
    .local v3, "local":I
    iget-boolean v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v4, :cond_e

    .line 1888
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1889
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 1891
    :cond_e
    invoke-virtual {p1, v7, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 1892
    :goto_2
    if-eqz v1, :cond_f

    .line 1893
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateStatement(Lcom/trendmicro/hippo/Node;)V

    .line 1894
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    goto :goto_2

    .line 1896
    :cond_f
    int-to-short v4, v3

    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 1897
    invoke-virtual {p1, v7}, Lcom/trendmicro/hippo/Node;->removeProp(I)V

    .line 1898
    iput-boolean v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inLocalBlock:Z

    .line 1899
    goto/16 :goto_7

    .line 2101
    .end local v2    # "prevLocal":Z
    .end local v3    # "local":I
    :cond_10
    iget-boolean v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-nez v2, :cond_11

    .line 2102
    goto/16 :goto_7

    .line 2105
    :cond_11
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 2106
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->saveCurrentCodeOffset()V

    .line 2109
    :cond_12
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->setStackTop(S)V

    .line 2112
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v2

    .line 2114
    .local v2, "finallyRegister":I
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v4

    .line 2115
    .local v4, "finallyStart":I
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v5

    .line 2116
    .local v5, "finallyEnd":I
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 2118
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateIntegerWrap()V

    .line 2119
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 2121
    :goto_3
    if-eqz v1, :cond_13

    .line 2122
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateStatement(Lcom/trendmicro/hippo/Node;)V

    .line 2123
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    goto :goto_3

    .line 2126
    :cond_13
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2127
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0xc0

    const-string v9, "java/lang/Integer"

    invoke-virtual {v7, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 2128
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateIntegerUnwrap()V

    .line 2129
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    invoke-interface {v7, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;

    .line 2130
    .local v7, "ret":Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v8

    iput v8, v7, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;->tableLabel:I

    .line 2131
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v9, v7, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;->tableLabel:I

    invoke-virtual {v8, v3, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 2134
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->setStackTop(S)V

    .line 2136
    int-to-short v3, v2

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 2137
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 2139
    .end local v2    # "finallyRegister":I
    .end local v4    # "finallyStart":I
    .end local v5    # "finallyEnd":I
    .end local v7    # "ret":Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;
    goto/16 :goto_7

    .line 1872
    :cond_14
    :pswitch_8
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v2

    if-eqz v2, :cond_15

    .line 1875
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addInstructionCount(I)V

    .line 1877
    :cond_15
    :goto_4
    if-eqz v1, :cond_28

    .line 1878
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateStatement(Lcom/trendmicro/hippo/Node;)V

    .line 1879
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    goto :goto_4

    .line 1990
    :cond_16
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v2

    if-eqz v2, :cond_17

    .line 1991
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addInstructionCount()V

    .line 1992
    :cond_17
    move-object v2, p1

    check-cast v2, Lcom/trendmicro/hippo/ast/Jump;

    invoke-direct {p0, v2, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitSwitch(Lcom/trendmicro/hippo/ast/Jump;Lcom/trendmicro/hippo/Node;)V

    .line 1993
    goto/16 :goto_7

    .line 1903
    :cond_18
    invoke-virtual {p1, v5}, Lcom/trendmicro/hippo/Node;->getExistingIntProp(I)I

    move-result v2

    .line 1904
    .local v2, "fnIndex":I
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-static {v3, v2}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->get(Lcom/trendmicro/hippo/ast/ScriptNode;I)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    move-result-object v3

    .line 1905
    .local v3, "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    iget-object v4, v3, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v4

    .line 1906
    .local v4, "t":I
    const/4 v6, 0x3

    if-ne v4, v6, :cond_19

    .line 1907
    invoke-direct {p0, v3, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitFunction(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;I)V

    goto/16 :goto_7

    .line 1909
    :cond_19
    if-ne v4, v5, :cond_1a

    goto/16 :goto_7

    .line 1910
    :cond_1a
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 1917
    .end local v2    # "fnIndex":I
    .end local v3    # "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .end local v4    # "t":I
    :cond_1b
    move-object v2, p1

    check-cast v2, Lcom/trendmicro/hippo/ast/Jump;

    invoke-direct {p0, v2, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->visitTryCatchFinally(Lcom/trendmicro/hippo/ast/Jump;Lcom/trendmicro/hippo/Node;)V

    .line 1918
    goto/16 :goto_7

    .line 1970
    :cond_1c
    :pswitch_9
    iget-boolean v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-nez v2, :cond_20

    .line 1971
    if-eqz v1, :cond_1d

    .line 1972
    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    goto :goto_5

    .line 1973
    :cond_1d
    const/4 v2, 0x4

    if-ne v0, v2, :cond_1e

    .line 1974
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v2}, Lcom/trendmicro/hippo/optimizer/Codegen;->pushUndefined(Lcom/trendmicro/classfile/ClassFileWriter;)V

    goto :goto_5

    .line 1976
    :cond_1e
    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->popvLocal:S

    if-ltz v2, :cond_1f

    .line 1977
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    goto :goto_5

    .line 1976
    :cond_1f
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1980
    :cond_20
    :goto_5
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 1981
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addInstructionCount()V

    .line 1982
    :cond_21
    iget v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->epilogueLabel:I

    if-ne v2, v4, :cond_23

    .line 1983
    iget-boolean v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-eqz v2, :cond_22

    .line 1984
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v2

    iput v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->epilogueLabel:I

    goto :goto_6

    .line 1983
    :cond_22
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1986
    :cond_23
    :goto_6
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->epilogueLabel:I

    invoke-virtual {v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 1987
    goto :goto_7

    .line 1962
    :cond_24
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 1963
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addInstructionCount()V

    .line 1964
    :cond_25
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getLocalBlockRegister(Lcom/trendmicro/hippo/Node;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1965
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0xbf

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1966
    goto :goto_7

    .line 1955
    :cond_26
    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 1956
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateObserverCount()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 1957
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addInstructionCount()V

    .line 1958
    :cond_27
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateThrowJavaScriptException()V

    .line 1959
    nop

    .line 2148
    :cond_28
    :goto_7
    return-void

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_7
        :pswitch_6
        :pswitch_9
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x39
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x81
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_2
        :pswitch_8
        :pswitch_1
        :pswitch_0
        :pswitch_5
        :pswitch_8
    .end packed-switch
.end method

.method private generateThrowJavaScriptException()V
    .locals 5

    .line 2166
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xbb

    const-string v2, "com/trendmicro/hippo/JavaScriptException"

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 2168
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0x5a

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2169
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0x5f

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2170
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 2171
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsLineNumber:I

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 2172
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xb7

    const-string v3, "<init>"

    const-string v4, "(Ljava/lang/Object;Ljava/lang/String;I)V"

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2177
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v1, 0xbf

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2178
    return-void
.end method

.method private generateYieldPoint(Lcom/trendmicro/hippo/Node;Z)V
    .locals 9
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "exprContext"    # Z

    .line 2839
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v0

    .line 2840
    .local v0, "top":I
    iget v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->maxStack:I

    if-le v1, v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    iput v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->maxStack:I

    .line 2841
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v1

    const/16 v2, 0x57

    const/16 v3, 0x5f

    if-eqz v1, :cond_2

    .line 2842
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateGetGeneratorStackState()V

    .line 2843
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_1

    .line 2844
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0x5a

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2845
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2846
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 2847
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2848
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0x53

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2843
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2851
    .end local v1    # "i":I
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2855
    :cond_2
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 2856
    .local v1, "child":Lcom/trendmicro/hippo/Node;
    if-eqz v1, :cond_3

    .line 2857
    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    goto :goto_2

    .line 2859
    :cond_3
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v4}, Lcom/trendmicro/hippo/optimizer/Codegen;->pushUndefined(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 2862
    :goto_2
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNextGeneratorState(Lcom/trendmicro/hippo/Node;)I

    move-result v4

    .line 2863
    .local v4, "nextState":I
    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateSetGeneratorResumptionPoint(I)V

    .line 2865
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateSaveLocals(Lcom/trendmicro/hippo/Node;)Z

    move-result v5

    .line 2867
    .local v5, "hasLocals":Z
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v7, 0xb0

    invoke-virtual {v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2869
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getTargetLabel(Lcom/trendmicro/hippo/Node;)I

    move-result v6

    invoke-direct {p0, v6, v5, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateCheckForThrowOrClose(IZI)V

    .line 2873
    if-eqz v0, :cond_5

    .line 2874
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateGetGeneratorStackState()V

    .line 2875
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3
    if-ge v6, v0, :cond_4

    .line 2876
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0x59

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2877
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    sub-int v8, v0, v6

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 2878
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0x32

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2879
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2875
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 2881
    .end local v6    # "i":I
    :cond_4
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2885
    :cond_5
    if-eqz p2, :cond_6

    .line 2886
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2888
    :cond_6
    return-void
.end method

.method private getFinallyAtTarget(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 4244
    if-nez p1, :cond_0

    .line 4245
    const/4 v0, 0x0

    return-object v0

    .line 4247
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x7e

    if-ne v0, v1, :cond_1

    .line 4248
    return-object p1

    .line 4250
    :cond_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v2, 0x84

    if-ne v0, v2, :cond_2

    .line 4251
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 4252
    .local v0, "fBlock":Lcom/trendmicro/hippo/Node;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    if-ne v2, v1, :cond_2

    .line 4253
    return-object v0

    .line 4256
    .end local v0    # "fBlock":Lcom/trendmicro/hippo/Node;
    :cond_2
    const-string v0, "bad finally target"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->codeBug(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private getLocalBlockRegister(Lcom/trendmicro/hippo/Node;)I
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 5290
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Node;

    .line 5291
    .local v0, "localBlock":Lcom/trendmicro/hippo/Node;
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Node;->getExistingIntProp(I)I

    move-result v1

    .line 5292
    .local v1, "localSlot":I
    return v1
.end method

.method private getNewWordIntern(I)S
    .locals 7
    .param p1, "count"    # I

    .line 5420
    nop

    .line 5422
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->locals:[I

    .line 5423
    .local v0, "locals":[I
    const/4 v1, -0x1

    .line 5424
    .local v1, "result":I
    const/16 v2, 0x400

    const/4 v3, 0x1

    if-le p1, v3, :cond_3

    .line 5426
    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    .local v4, "i":I
    :goto_0
    add-int v5, v4, p1

    if-gt v5, v2, :cond_2

    .line 5427
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1
    if-ge v5, p1, :cond_1

    .line 5428
    add-int v6, v4, v5

    aget v6, v0, v6

    if-eqz v6, :cond_0

    .line 5429
    add-int/lit8 v6, v5, 0x1

    add-int/2addr v4, v6

    .line 5430
    goto :goto_0

    .line 5427
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 5433
    .end local v5    # "j":I
    :cond_1
    move v1, v4

    .line 5434
    .end local v4    # "i":I
    :cond_2
    goto :goto_2

    .line 5437
    :cond_3
    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    .line 5440
    :goto_2
    const/4 v4, -0x1

    if-eq v1, v4, :cond_a

    .line 5441
    aput v3, v0, v1

    .line 5442
    if-le p1, v3, :cond_4

    .line 5443
    add-int/lit8 v4, v1, 0x1

    aput v3, v0, v4

    .line 5444
    :cond_4
    const/4 v4, 0x2

    if-le p1, v4, :cond_5

    .line 5445
    add-int/lit8 v4, v1, 0x2

    aput v3, v0, v4

    .line 5447
    :cond_5
    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    if-ne v1, v3, :cond_9

    .line 5448
    add-int v3, v1, p1

    .local v3, "i":I
    :goto_3
    if-ge v3, v2, :cond_8

    .line 5449
    aget v4, v0, v3

    if-nez v4, :cond_7

    .line 5450
    int-to-short v2, v3

    iput-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    .line 5451
    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    if-ge v4, v2, :cond_6

    .line 5452
    iput-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    .line 5453
    :cond_6
    int-to-short v2, v1

    return v2

    .line 5448
    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .end local v3    # "i":I
    :cond_8
    goto :goto_4

    .line 5457
    :cond_9
    int-to-short v2, v1

    return v2

    .line 5461
    :cond_a
    :goto_4
    const-string v2, "Program too complex (out of locals)"

    invoke-static {v2}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    throw v2
.end method

.method private getNewWordLocal()S
    .locals 1

    .line 5415
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordIntern(I)S

    move-result v0

    return v0
.end method

.method private getNewWordLocal(Z)S
    .locals 1
    .param p1, "isConst"    # Z

    .line 5410
    if-eqz p1, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordIntern(I)S

    move-result v0

    return v0
.end method

.method private getNewWordPairLocal(Z)S
    .locals 1
    .param p1, "isConst"    # Z

    .line 5405
    if-eqz p1, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordIntern(I)S

    move-result v0

    return v0
.end method

.method private getNextGeneratorState(Lcom/trendmicro/hippo/Node;)I
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 2182
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    check-cast v0, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getResumptionPoints()Ljava/util/List;

    move-result-object v0

    .line 2183
    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 2184
    .local v0, "nodeIndex":I
    add-int/lit8 v1, v0, 0x1

    return v1
.end method

.method private getTargetLabel(Lcom/trendmicro/hippo/Node;)I
    .locals 2
    .param p1, "target"    # Lcom/trendmicro/hippo/Node;

    .line 3021
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->labelId()I

    move-result v0

    .line 3022
    .local v0, "labelId":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 3023
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 3024
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Node;->labelId(I)V

    .line 3026
    :cond_0
    return v0
.end method

.method private incReferenceWordLocal(S)V
    .locals 2
    .param p1, "local"    # S

    .line 5467
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->locals:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, p1

    .line 5468
    return-void
.end method

.method private initBodyGeneration()V
    .locals 5

    .line 1411
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    .line 1412
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/16 v4, 0x6e

    if-ne v1, v4, :cond_1

    .line 1413
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-static {v0}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->get(Lcom/trendmicro/hippo/ast/ScriptNode;)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 1414
    iget-object v0, v0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->requiresActivation()Z

    move-result v0

    xor-int/2addr v0, v2

    iput-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    .line 1415
    if-eqz v0, :cond_0

    .line 1416
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    iget-object v0, v0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamAndVarCount()I

    move-result v0

    .line 1417
    .local v0, "n":I
    if-eqz v0, :cond_0

    .line 1418
    new-array v1, v0, [S

    iput-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    .line 1421
    .end local v0    # "n":I
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isTargetOfDirectCall()Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inDirectCallFunction:Z

    .line 1422
    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v0, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    goto :goto_0

    .line 1424
    :cond_1
    iput-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 1425
    iput-boolean v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    .line 1426
    iput-boolean v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inDirectCallFunction:Z

    .line 1429
    :cond_2
    :goto_0
    const/16 v0, 0x400

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->locals:[I

    .line 1431
    iput-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->funObjLocal:S

    .line 1432
    iput-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    .line 1433
    const/4 v0, 0x2

    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    .line 1434
    const/4 v0, 0x3

    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->thisObjLocal:S

    .line 1435
    const/4 v0, 0x4

    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    .line 1436
    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    .line 1438
    const/4 v0, -0x1

    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->popvLocal:S

    .line 1439
    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    .line 1440
    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsZeroArgArray:S

    .line 1441
    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsOneArgArray:S

    .line 1442
    iput v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->epilogueLabel:I

    .line 1443
    iput v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->enterAreaStartLabel:I

    .line 1444
    iput-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generatorStateLocal:S

    .line 1445
    return-void
.end method

.method private inlineFinally(Lcom/trendmicro/hippo/Node;)V
    .locals 3
    .param p1, "finallyTarget"    # Lcom/trendmicro/hippo/Node;

    .line 4230
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 4231
    .local v0, "finallyStart":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v1

    .line 4232
    .local v1, "finallyEnd":I
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 4233
    invoke-direct {p0, p1, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inlineFinally(Lcom/trendmicro/hippo/Node;II)V

    .line 4234
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 4235
    return-void
.end method

.method private inlineFinally(Lcom/trendmicro/hippo/Node;II)V
    .locals 3
    .param p1, "finallyTarget"    # Lcom/trendmicro/hippo/Node;
    .param p2, "finallyStart"    # I
    .param p3, "finallyEnd"    # I

    .line 4218
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getFinallyAtTarget(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 4219
    .local v0, "fBlock":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->resetTargets()V

    .line 4220
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 4221
    .local v1, "child":Lcom/trendmicro/hippo/Node;
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->exceptionManager:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

    invoke-virtual {v2, v0, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->markInlineFinallyStart(Lcom/trendmicro/hippo/Node;I)V

    .line 4222
    :goto_0
    if-eqz v1, :cond_0

    .line 4223
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateStatement(Lcom/trendmicro/hippo/Node;)V

    .line 4224
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    goto :goto_0

    .line 4226
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->exceptionManager:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

    invoke-virtual {v2, v0, p3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->markInlineFinallyEnd(Lcom/trendmicro/hippo/Node;I)V

    .line 4227
    return-void
.end method

.method private static isArithmeticNode(Lcom/trendmicro/hippo/Node;)Z
    .locals 2
    .param p0, "node"    # Lcom/trendmicro/hippo/Node;

    .line 4573
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    .line 4574
    .local v0, "type":I
    const/16 v1, 0x16

    if-eq v0, v1, :cond_1

    const/16 v1, 0x19

    if-eq v0, v1, :cond_1

    const/16 v1, 0x18

    if-eq v0, v1, :cond_1

    const/16 v1, 0x17

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method private nodeIsDirectCallParameter(Lcom/trendmicro/hippo/Node;)I
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 4662
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x37

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inDirectCallFunction:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsForcedObjectParameters:Z

    if-nez v0, :cond_0

    .line 4665
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 4666
    .local v0, "varIndex":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isParameter(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4667
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v1, v1, v0

    return v1

    .line 4670
    .end local v0    # "varIndex":I
    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method private releaseWordLocal(S)V
    .locals 2
    .param p1, "local"    # S

    .line 5478
    iget-short v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    if-ge p1, v0, :cond_0

    .line 5479
    iput-short p1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->firstFreeLocal:S

    .line 5480
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->locals:[I

    const/4 v1, 0x0

    aput v1, v0, p1

    .line 5481
    return-void
.end method

.method private saveCurrentCodeOffset()V
    .locals 1

    .line 4377
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->getCurrentCodeOffset()I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->savedCodeOffset:I

    .line 4378
    return-void
.end method

.method private updateLineNumber(Lcom/trendmicro/hippo/Node;)V
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 3743
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getLineno()I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsLineNumber:I

    .line 3744
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 3745
    return-void

    .line 3746
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    int-to-short v0, v0

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addLineNumberEntry(S)V

    .line 3747
    return-void
.end method

.method private varIsDirectCallParameter(I)Z
    .locals 1
    .param p1, "varIndex"    # I

    .line 4675
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isParameter(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inDirectCallFunction:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsForcedObjectParameters:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private visitArithmetic(Lcom/trendmicro/hippo/Node;ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "opCode"    # I
    .param p3, "child"    # Lcom/trendmicro/hippo/Node;
    .param p4, "parent"    # Lcom/trendmicro/hippo/Node;

    .line 4583
    const/16 v0, 0x8

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v0

    .line 4584
    .local v0, "childNumberFlag":I
    if-eq v0, v1, :cond_0

    .line 4585
    invoke-direct {p0, p3, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4586
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4587
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 4590
    :cond_0
    invoke-static {p4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isArithmeticNode(Lcom/trendmicro/hippo/Node;)Z

    move-result v1

    .line 4591
    .local v1, "childOfArithmetic":Z
    invoke-direct {p0, p3, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4592
    invoke-static {p3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isArithmeticNode(Lcom/trendmicro/hippo/Node;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 4593
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4594
    :cond_1
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    invoke-direct {p0, v2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4595
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    invoke-static {v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isArithmeticNode(Lcom/trendmicro/hippo/Node;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 4596
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4597
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4598
    if-nez v1, :cond_3

    .line 4599
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 4602
    .end local v1    # "childOfArithmetic":Z
    :cond_3
    :goto_0
    return-void
.end method

.method private visitArrayLiteral(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V
    .locals 7
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;
    .param p3, "topLevel"    # Z

    .line 3101
    const/4 v0, 0x0

    .line 3102
    .local v0, "count":I
    move-object v1, p2

    .local v1, "cursor":Lcom/trendmicro/hippo/Node;
    :goto_0
    if-eqz v1, :cond_0

    .line 3103
    add-int/lit8 v0, v0, 0x1

    .line 3102
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    goto :goto_0

    .line 3107
    .end local v1    # "cursor":Lcom/trendmicro/hippo/Node;
    :cond_0
    if-nez p3, :cond_3

    const/16 v1, 0xa

    if-gt v0, v1, :cond_1

    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->getCurrentCodeOffset()I

    move-result v1

    const/16 v2, 0x7530

    if-le v1, v2, :cond_3

    :cond_1
    iget-boolean v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v1, :cond_3

    iget-boolean v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-nez v1, :cond_3

    iget-boolean v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inLocalBlock:Z

    if-nez v1, :cond_3

    .line 3109
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->literals:Ljava/util/List;

    if-nez v1, :cond_2

    .line 3110
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->literals:Ljava/util/List;

    .line 3112
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->literals:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3113
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_literal"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->literals:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 3114
    .local v1, "methodName":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->funObjLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3115
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3116
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3117
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3118
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3119
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0xb6

    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v4, v4, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v5, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {v2, v3, v4, v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3125
    return-void

    .line 3129
    .end local v1    # "methodName":Ljava/lang/String;
    :cond_3
    iget-boolean v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    const/16 v2, 0x53

    const/4 v3, 0x1

    if-eqz v1, :cond_6

    .line 3132
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-eq v1, v0, :cond_4

    .line 3133
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3134
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p2

    .line 3132
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3136
    .end local v1    # "i":I
    :cond_4
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addNewObjectArray(I)V

    .line 3137
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_2
    if-eq v1, v0, :cond_5

    .line 3138
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0x5a

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3139
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0x5f

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3140
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    sub-int v6, v0, v1

    sub-int/2addr v6, v3

    invoke-virtual {v4, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3141
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3142
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3137
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .end local v1    # "i":I
    :cond_5
    goto :goto_4

    .line 3145
    :cond_6
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addNewObjectArray(I)V

    .line 3146
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3
    if-eq v1, v0, :cond_7

    .line 3147
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0x59

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3148
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3149
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3150
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3151
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p2

    .line 3146
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 3154
    .end local v1    # "i":I
    :cond_7
    :goto_4
    const/16 v1, 0xb

    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    .line 3155
    .local v1, "skipIndexes":[I
    if-nez v1, :cond_8

    .line 3156
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3157
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_5

    .line 3159
    :cond_8
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v1}, Lcom/trendmicro/hippo/optimizer/OptRuntime;->encodeIntArray([I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3160
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    array-length v3, v1

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3162
    :goto_5
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3163
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3164
    const-string v2, "newArrayLiteral"

    const-string v3, "([Ljava/lang/Object;Ljava/lang/String;ILcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3171
    return-void
.end method

.method private visitBitOp(Lcom/trendmicro/hippo/Node;ILcom/trendmicro/hippo/Node;)V
    .locals 6
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "type"    # I
    .param p3, "child"    # Lcom/trendmicro/hippo/Node;

    .line 4606
    const/16 v0, 0x8

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v0

    .line 4607
    .local v0, "childNumberFlag":I
    invoke-direct {p0, p3, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4612
    const/16 v2, 0x7e

    const-string v3, "(Ljava/lang/Object;)I"

    const-string v4, "toInt32"

    const/16 v5, 0x14

    if-ne p2, v5, :cond_0

    .line 4613
    const-string v1, "toUint32"

    const-string v5, "(Ljava/lang/Object;)J"

    invoke-direct {p0, v1, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4614
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4615
    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4618
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x1f

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 4619
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4620
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x7d

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4621
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x8a

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4622
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 4623
    return-void

    .line 4625
    :cond_0
    if-ne v0, v1, :cond_1

    .line 4626
    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4627
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    invoke-direct {p0, v5, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4628
    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 4631
    :cond_1
    const-string v3, "(D)I"

    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4632
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    invoke-direct {p0, v5, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4633
    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4635
    :goto_0
    const/16 v3, 0x12

    if-eq p2, v3, :cond_3

    const/16 v3, 0x13

    if-eq p2, v3, :cond_2

    packed-switch p2, :pswitch_data_0

    .line 4652
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 4643
    :pswitch_0
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4644
    goto :goto_1

    .line 4640
    :pswitch_1
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x82

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4641
    goto :goto_1

    .line 4637
    :pswitch_2
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x80

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4638
    goto :goto_1

    .line 4646
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x7a

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4647
    goto :goto_1

    .line 4649
    :cond_3
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x78

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4650
    nop

    .line 4654
    :goto_1
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x87

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4655
    if-ne v0, v1, :cond_4

    .line 4656
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 4658
    :cond_4
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private visitDotQuery(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 5254
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->updateLineNumber(Lcom/trendmicro/hippo/Node;)V

    .line 5255
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 5256
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5257
    const-string v0, "enterDotQuery"

    const-string v1, "(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5261
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 5266
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5267
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 5268
    .local v0, "queryLoopStart":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 5269
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x57

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5271
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 5272
    const-string v1, "toBoolean"

    const-string v2, "(Ljava/lang/Object;)Z"

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5273
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5274
    const-string v1, "updateDotQuery"

    const-string v2, "(ZLcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5278
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x59

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5279
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0xc6

    invoke-virtual {v1, v2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5281
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5282
    const-string v1, "leaveDotQuery"

    const-string v2, "(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5285
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 5286
    return-void
.end method

.method private visitFunction(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;I)V
    .locals 6
    .param p1, "ofn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .param p2, "functionType"    # I

    .line 2980
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v1, p1, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/optimizer/Codegen;->getIndex(Lcom/trendmicro/hippo/ast/ScriptNode;)I

    move-result v0

    .line 2981
    .local v0, "fnIndex":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v2, v2, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const/16 v3, 0xbb

    invoke-virtual {v1, v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 2983
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x59

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 2984
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2985
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2986
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 2987
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v2, v2, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const/16 v3, 0xb7

    const-string v4, "<init>"

    const-string v5, "(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Context;I)V"

    invoke-virtual {v1, v3, v2, v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2990
    const/4 v1, 0x4

    if-ne p2, v1, :cond_0

    .line 2991
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2992
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2993
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 2994
    const-string v2, "bindThis"

    const-string v3, "(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Function;"

    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3002
    :cond_0
    const/4 v2, 0x2

    if-eq p2, v2, :cond_2

    if-ne p2, v1, :cond_1

    goto :goto_0

    .line 3008
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3009
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3010
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3011
    const-string v1, "initFunction"

    const-string v2, "(Lcom/trendmicro/hippo/NativeFunction;ILcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Context;)V"

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3017
    return-void

    .line 3006
    :cond_2
    :goto_0
    return-void
.end method

.method private visitGetProp(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 6
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 5098
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 5099
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 5100
    .local v0, "nameChild":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 5101
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    const-string v2, "(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    const/16 v3, 0x22

    if-ne v1, v3, :cond_0

    .line 5102
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5103
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5104
    const-string v1, "getObjectPropNoWarn"

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5111
    return-void

    .line 5117
    :cond_0
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    .line 5118
    .local v1, "childType":I
    const/16 v3, 0x2b

    const-string v4, "getObjectProp"

    if-ne v1, v3, :cond_1

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v3

    const/16 v5, 0x29

    if-ne v3, v5, :cond_1

    .line 5119
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5120
    const-string v2, "(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;"

    invoke-direct {p0, v4, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 5127
    :cond_1
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v3, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5128
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v3, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5129
    invoke-direct {p0, v4, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5137
    :goto_0
    return-void
.end method

.method private visitGetVar(Lcom/trendmicro/hippo/Node;)V
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 4972
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 4973
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 4974
    .local v0, "varIndex":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v1, v1, v0

    .line 4975
    .local v1, "reg":S
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 4980
    const/16 v2, 0x8

    const/4 v3, -0x1

    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v2

    if-eq v2, v3, :cond_1

    .line 4981
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->dcpLoadAsNumber(I)V

    goto :goto_0

    .line 4983
    :cond_1
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->dcpLoadAsObject(I)V

    goto :goto_0

    .line 4985
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v2, v0}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 4986
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    goto :goto_0

    .line 4988
    :cond_3
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4990
    :goto_0
    return-void
.end method

.method private visitGoto(Lcom/trendmicro/hippo/ast/Jump;ILcom/trendmicro/hippo/Node;)V
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/Jump;
    .param p2, "type"    # I
    .param p3, "child"    # Lcom/trendmicro/hippo/Node;

    .line 3031
    iget-object v0, p1, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 3032
    .local v0, "target":Lcom/trendmicro/hippo/Node;
    const/4 v1, 0x6

    if-eq p2, v1, :cond_3

    const/4 v2, 0x7

    if-ne p2, v2, :cond_0

    goto :goto_0

    .line 3042
    :cond_0
    const/16 v1, 0x88

    if-ne p2, v1, :cond_2

    .line 3043
    iget-boolean v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v1, :cond_1

    .line 3044
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addGotoWithReturn(Lcom/trendmicro/hippo/Node;)V

    goto :goto_2

    .line 3047
    :cond_1
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inlineFinally(Lcom/trendmicro/hippo/Node;)V

    goto :goto_2

    .line 3050
    :cond_2
    const/16 v1, 0xa7

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addGoto(Lcom/trendmicro/hippo/Node;I)V

    goto :goto_2

    .line 3033
    :cond_3
    :goto_0
    if-eqz p3, :cond_5

    .line 3034
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getTargetLabel(Lcom/trendmicro/hippo/Node;)I

    move-result v2

    .line 3035
    .local v2, "targetLabel":I
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v3

    .line 3036
    .local v3, "fallThruLabel":I
    if-ne p2, v1, :cond_4

    .line 3037
    invoke-direct {p0, p3, p1, v2, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateIfJump(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V

    goto :goto_1

    .line 3039
    :cond_4
    invoke-direct {p0, p3, p1, v3, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateIfJump(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V

    .line 3040
    :goto_1
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 3041
    .end local v2    # "targetLabel":I
    .end local v3    # "fallThruLabel":I
    nop

    .line 3053
    :goto_2
    return-void

    .line 3033
    :cond_5
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method private visitIfJumpEqOp(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V
    .locals 16
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;
    .param p3, "trueGOTO"    # I
    .param p4, "falseGOTO"    # I

    .line 4814
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    const/4 v5, -0x1

    if-eq v3, v5, :cond_f

    if-eq v4, v5, :cond_f

    .line 4816
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v6

    .line 4817
    .local v6, "stackInitial":S
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v7

    .line 4818
    .local v7, "type":I
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v8

    .line 4821
    .local v8, "rChild":Lcom/trendmicro/hippo/Node;
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v9

    const/16 v12, 0xc

    const/16 v14, 0x2a

    if-eq v9, v14, :cond_7

    invoke-virtual {v8}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v9

    if-ne v9, v14, :cond_0

    goto/16 :goto_2

    .line 4851
    :cond_0
    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->nodeIsDirectCallParameter(Lcom/trendmicro/hippo/Node;)I

    move-result v9

    .line 4852
    .local v9, "child_dcp_register":I
    if-eq v9, v5, :cond_2

    .line 4853
    invoke-virtual {v8}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    const/16 v14, 0x96

    if-ne v5, v14, :cond_2

    .line 4855
    invoke-virtual {v8}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 4856
    .local v5, "convertChild":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v14

    const/16 v11, 0x28

    if-ne v14, v11, :cond_2

    .line 4857
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v11, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4858
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v14, 0xb2

    const-string v13, "java/lang/Void"

    const-string v10, "TYPE"

    const-string v15, "Ljava/lang/Class;"

    invoke-virtual {v11, v14, v13, v10, v15}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4862
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v10

    .line 4863
    .local v10, "notNumbersLabel":I
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v13, 0xa6

    invoke-virtual {v11, v13, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4864
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int/lit8 v13, v9, 0x1

    invoke-virtual {v11, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    .line 4865
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v13

    invoke-virtual {v11, v13, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(D)V

    .line 4866
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v13, 0x97

    invoke-virtual {v11, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4867
    if-ne v7, v12, :cond_1

    .line 4868
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v13, 0x99

    invoke-virtual {v11, v13, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    goto :goto_0

    .line 4870
    :cond_1
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v13, 0x9a

    invoke-virtual {v11, v13, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4871
    :goto_0
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v13, 0xa7

    invoke-virtual {v11, v13, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4872
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v11, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 4877
    .end local v5    # "convertChild":Lcom/trendmicro/hippo/Node;
    .end local v10    # "notNumbersLabel":I
    :cond_2
    invoke-direct {v0, v2, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4878
    invoke-direct {v0, v8, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4882
    if-eq v7, v12, :cond_6

    const/16 v5, 0xd

    if-eq v7, v5, :cond_5

    const/16 v5, 0x2e

    if-eq v7, v5, :cond_4

    const/16 v5, 0x2f

    if-ne v7, v5, :cond_3

    .line 4896
    const-string v5, "shallowEq"

    .line 4897
    .local v5, "name":Ljava/lang/String;
    const/16 v10, 0x99

    .line 4898
    .local v10, "testCode":I
    goto :goto_1

    .line 4900
    .end local v5    # "name":Ljava/lang/String;
    .end local v10    # "testCode":I
    :cond_3
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 4892
    :cond_4
    const-string v5, "shallowEq"

    .line 4893
    .restart local v5    # "name":Ljava/lang/String;
    const/16 v10, 0x9a

    .line 4894
    .restart local v10    # "testCode":I
    goto :goto_1

    .line 4888
    .end local v5    # "name":Ljava/lang/String;
    .end local v10    # "testCode":I
    :cond_5
    const-string v5, "eq"

    .line 4889
    .restart local v5    # "name":Ljava/lang/String;
    const/16 v10, 0x99

    .line 4890
    .restart local v10    # "testCode":I
    goto :goto_1

    .line 4884
    .end local v5    # "name":Ljava/lang/String;
    .end local v10    # "testCode":I
    :cond_6
    const-string v5, "eq"

    .line 4885
    .restart local v5    # "name":Ljava/lang/String;
    const/16 v10, 0x9a

    .line 4886
    .restart local v10    # "testCode":I
    nop

    .line 4902
    :goto_1
    const-string v11, "(Ljava/lang/Object;Ljava/lang/Object;)Z"

    invoke-direct {v0, v5, v11}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4906
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v11, v10, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4907
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v12, 0xa7

    invoke-virtual {v11, v12, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    goto/16 :goto_7

    .line 4823
    .end local v5    # "name":Ljava/lang/String;
    .end local v9    # "child_dcp_register":I
    .end local v10    # "testCode":I
    :cond_7
    :goto_2
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    if-ne v5, v14, :cond_8

    .line 4824
    move-object v2, v8

    .line 4826
    .end local p2    # "child":Lcom/trendmicro/hippo/Node;
    .local v2, "child":Lcom/trendmicro/hippo/Node;
    :cond_8
    invoke-direct {v0, v2, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4827
    const/16 v5, 0xc7

    const/16 v9, 0x2e

    if-eq v7, v9, :cond_c

    const/16 v9, 0x2f

    if-ne v7, v9, :cond_9

    goto :goto_4

    .line 4832
    :cond_9
    if-eq v7, v12, :cond_b

    .line 4834
    const/16 v9, 0xd

    if-ne v7, v9, :cond_a

    .line 4835
    move/from16 v9, p3

    .line 4836
    .local v9, "tmp":I
    move/from16 v3, p4

    .line 4837
    .end local p3    # "trueGOTO":I
    .local v3, "trueGOTO":I
    move v4, v9

    .end local p4    # "falseGOTO":I
    .local v4, "falseGOTO":I
    goto :goto_3

    .line 4834
    .end local v3    # "trueGOTO":I
    .end local v4    # "falseGOTO":I
    .end local v9    # "tmp":I
    .restart local p3    # "trueGOTO":I
    .restart local p4    # "falseGOTO":I
    :cond_a
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 4839
    .end local p3    # "trueGOTO":I
    .end local p4    # "falseGOTO":I
    .restart local v3    # "trueGOTO":I
    .restart local v4    # "falseGOTO":I
    :cond_b
    :goto_3
    iget-object v9, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v10, 0x59

    invoke-virtual {v9, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4840
    iget-object v9, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v9}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v9

    .line 4841
    .local v9, "undefCheckLabel":I
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10, v5, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4842
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v5

    .line 4843
    .local v5, "stack":S
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v11, 0x57

    invoke-virtual {v10, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4844
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v11, 0xa7

    invoke-virtual {v10, v11, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4845
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10, v9, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(IS)V

    .line 4846
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v10}, Lcom/trendmicro/hippo/optimizer/Codegen;->pushUndefined(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 4847
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v11, 0xa5

    invoke-virtual {v10, v11, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    goto :goto_6

    .line 4828
    .end local v3    # "trueGOTO":I
    .end local v4    # "falseGOTO":I
    .end local v5    # "stack":S
    .end local v9    # "undefCheckLabel":I
    .restart local p3    # "trueGOTO":I
    .restart local p4    # "falseGOTO":I
    :cond_c
    :goto_4
    const/16 v9, 0x2e

    if-ne v7, v9, :cond_d

    .line 4829
    const/16 v5, 0xc6

    goto :goto_5

    :cond_d
    nop

    .line 4830
    .local v5, "testCode":I
    :goto_5
    iget-object v9, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v9, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4831
    .end local v5    # "testCode":I
    nop

    .line 4849
    .end local p3    # "trueGOTO":I
    .end local p4    # "falseGOTO":I
    .restart local v3    # "trueGOTO":I
    .restart local v4    # "falseGOTO":I
    :goto_6
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v9, 0xa7

    invoke-virtual {v5, v9, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4909
    :goto_7
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v5

    if-ne v6, v5, :cond_e

    .line 4910
    return-void

    .line 4909
    :cond_e
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 4814
    .end local v2    # "child":Lcom/trendmicro/hippo/Node;
    .end local v3    # "trueGOTO":I
    .end local v4    # "falseGOTO":I
    .end local v6    # "stackInitial":S
    .end local v7    # "type":I
    .end local v8    # "rChild":Lcom/trendmicro/hippo/Node;
    .restart local p2    # "child":Lcom/trendmicro/hippo/Node;
    .restart local p3    # "trueGOTO":I
    .restart local p4    # "falseGOTO":I
    :cond_f
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5
.end method

.method private visitIfJumpRelOp(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;II)V
    .locals 18
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;
    .param p3, "trueGOTO"    # I
    .param p4, "falseGOTO"    # I

    .line 4710
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    const/4 v5, -0x1

    if-eq v3, v5, :cond_f

    if-eq v4, v5, :cond_f

    .line 4711
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v6

    .line 4712
    .local v6, "type":I
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v7

    .line 4713
    .local v7, "rChild":Lcom/trendmicro/hippo/Node;
    const/16 v10, 0x35

    if-eq v6, v10, :cond_d

    const/16 v11, 0x34

    if-ne v6, v11, :cond_0

    goto/16 :goto_6

    .line 4727
    :cond_0
    const/16 v10, 0x8

    invoke-virtual {v1, v10, v5}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v10

    .line 4728
    .local v10, "childNumberFlag":I
    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->nodeIsDirectCallParameter(Lcom/trendmicro/hippo/Node;)I

    move-result v11

    .line 4729
    .local v11, "left_dcp_register":I
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->nodeIsDirectCallParameter(Lcom/trendmicro/hippo/Node;)I

    move-result v12

    .line 4730
    .local v12, "right_dcp_register":I
    if-eq v10, v5, :cond_5

    .line 4734
    const/4 v8, 0x2

    if-eq v10, v8, :cond_1

    .line 4736
    invoke-direct {v0, v2, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    goto :goto_0

    .line 4737
    :cond_1
    if-eq v11, v5, :cond_2

    .line 4738
    invoke-direct {v0, v11}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->dcpLoadAsNumber(I)V

    goto :goto_0

    .line 4740
    :cond_2
    invoke-direct {v0, v2, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4741
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4744
    :goto_0
    const/4 v8, 0x1

    if-eq v10, v8, :cond_3

    .line 4746
    invoke-direct {v0, v7, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    goto :goto_1

    .line 4747
    :cond_3
    if-eq v12, v5, :cond_4

    .line 4748
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->dcpLoadAsNumber(I)V

    goto :goto_1

    .line 4750
    :cond_4
    invoke-direct {v0, v7, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4751
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4754
    :goto_1
    invoke-direct {v0, v6, v3, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->genSimpleCompare(III)V

    move/from16 v16, v10

    goto/16 :goto_5

    .line 4757
    :cond_5
    if-eq v11, v5, :cond_8

    if-eq v12, v5, :cond_8

    .line 4760
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v5

    .line 4761
    .local v5, "stack":S
    iget-object v13, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v13}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v13

    .line 4762
    .local v13, "leftIsNotNumber":I
    iget-object v14, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v14, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4763
    iget-object v14, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v15, 0xb2

    const-string v8, "java/lang/Void"

    const-string v9, "TYPE"

    move/from16 v16, v10

    .end local v10    # "childNumberFlag":I
    .local v16, "childNumberFlag":I
    const-string v10, "Ljava/lang/Class;"

    invoke-virtual {v14, v15, v8, v9, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4767
    iget-object v14, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v15, 0xa6

    invoke-virtual {v14, v15, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4768
    iget-object v14, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int/lit8 v15, v11, 0x1

    invoke-virtual {v14, v15}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    .line 4769
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->dcpLoadAsNumber(I)V

    .line 4770
    invoke-direct {v0, v6, v3, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->genSimpleCompare(III)V

    .line 4771
    iget-object v14, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v14}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v14

    if-ne v5, v14, :cond_7

    .line 4773
    iget-object v14, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v14, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 4774
    iget-object v14, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v14}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v14

    .line 4775
    .local v14, "rightIsNotNumber":I
    iget-object v15, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v15, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4776
    iget-object v15, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    move/from16 v17, v13

    const/16 v13, 0xb2

    .end local v13    # "leftIsNotNumber":I
    .local v17, "leftIsNotNumber":I
    invoke-virtual {v15, v13, v8, v9, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4780
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v9, 0xa6

    invoke-virtual {v8, v9, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4781
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4782
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4783
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int/lit8 v9, v12, 0x1

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    .line 4784
    invoke-direct {v0, v6, v3, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->genSimpleCompare(III)V

    .line 4785
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v8

    if-ne v5, v8, :cond_6

    .line 4787
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 4789
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4790
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4792
    .end local v5    # "stack":S
    .end local v14    # "rightIsNotNumber":I
    .end local v17    # "leftIsNotNumber":I
    goto :goto_2

    .line 4785
    .restart local v5    # "stack":S
    .restart local v14    # "rightIsNotNumber":I
    .restart local v17    # "leftIsNotNumber":I
    :cond_6
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v8

    throw v8

    .line 4771
    .end local v14    # "rightIsNotNumber":I
    .end local v17    # "leftIsNotNumber":I
    .restart local v13    # "leftIsNotNumber":I
    :cond_7
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v8

    throw v8

    .line 4757
    .end local v5    # "stack":S
    .end local v13    # "leftIsNotNumber":I
    .end local v16    # "childNumberFlag":I
    .restart local v10    # "childNumberFlag":I
    :cond_8
    move/from16 v16, v10

    .line 4793
    .end local v10    # "childNumberFlag":I
    .restart local v16    # "childNumberFlag":I
    invoke-direct {v0, v2, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4794
    invoke-direct {v0, v7, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4797
    :goto_2
    const/16 v5, 0x11

    const/16 v8, 0x10

    if-eq v6, v5, :cond_9

    if-ne v6, v8, :cond_a

    .line 4798
    :cond_9
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v9, 0x5f

    invoke-virtual {v5, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4800
    :cond_a
    const/16 v5, 0xe

    if-eq v6, v5, :cond_c

    if-ne v6, v8, :cond_b

    goto :goto_3

    .line 4801
    :cond_b
    const-string v5, "cmp_LE"

    goto :goto_4

    :cond_c
    :goto_3
    const-string v5, "cmp_LT"

    .line 4802
    .local v5, "routine":Ljava/lang/String;
    :goto_4
    const-string v8, "(Ljava/lang/Object;Ljava/lang/Object;)Z"

    invoke-direct {v0, v5, v8}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4806
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v9, 0x9a

    invoke-virtual {v8, v9, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4807
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v9, 0xa7

    invoke-virtual {v8, v9, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4809
    .end local v5    # "routine":Ljava/lang/String;
    :goto_5
    return-void

    .line 4714
    .end local v11    # "left_dcp_register":I
    .end local v12    # "right_dcp_register":I
    .end local v16    # "childNumberFlag":I
    :cond_d
    :goto_6
    invoke-direct {v0, v2, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4715
    invoke-direct {v0, v7, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4716
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v5, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4717
    nop

    .line 4718
    if-ne v6, v10, :cond_e

    const-string v5, "instanceOf"

    goto :goto_7

    :cond_e
    const-string v5, "in"

    .line 4717
    :goto_7
    const-string v8, "(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Z"

    invoke-direct {v0, v5, v8}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4723
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0x9a

    invoke-virtual {v5, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4724
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0xa7

    invoke-virtual {v5, v8, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4725
    return-void

    .line 4710
    .end local v6    # "type":I
    .end local v7    # "rChild":Lcom/trendmicro/hippo/Node;
    :cond_f
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5
.end method

.method private visitIncDec(Lcom/trendmicro/hippo/Node;)V
    .locals 14
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 4412
    const/16 v0, 0xd

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Node;->getExistingIntProp(I)I

    move-result v0

    .line 4413
    .local v0, "incrDecrMask":I
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 4414
    .local v1, "child":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    const/16 v3, 0x21

    if-eq v2, v3, :cond_17

    const/16 v3, 0x22

    if-eq v2, v3, :cond_16

    const/16 v3, 0x24

    const/16 v4, 0x8

    const/4 v5, -0x1

    if-eq v2, v3, :cond_14

    const/16 v3, 0x27

    if-eq v2, v3, :cond_13

    const/16 v3, 0x37

    if-eq v2, v3, :cond_1

    const/16 v3, 0x44

    if-eq v2, v3, :cond_0

    .line 4567
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    goto/16 :goto_7

    .line 4553
    :cond_0
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 4554
    .local v2, "refChild":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4555
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4556
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4557
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 4558
    const-string v3, "refIncrDecr"

    const-string v4, "(Lcom/trendmicro/hippo/Ref;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;"

    invoke-direct {p0, v3, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4564
    goto/16 :goto_7

    .line 4416
    .end local v2    # "refChild":Lcom/trendmicro/hippo/Node;
    :cond_1
    iget-boolean v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v2, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 4417
    :cond_2
    and-int/lit8 v2, v0, 0x2

    if-eqz v2, :cond_3

    const/4 v2, 0x1

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    .line 4418
    .local v2, "post":Z
    :goto_0
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v3

    .line 4419
    .local v3, "varIndex":I
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v6, v6, v3

    .line 4420
    .local v6, "reg":S
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    iget-object v7, v7, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamAndVarConst()[Z

    move-result-object v7

    .line 4421
    .local v7, "constDeclarations":[Z
    aget-boolean v8, v7, v3

    const/16 v9, 0x59

    const/16 v10, 0x63

    const/16 v11, 0x67

    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    if-eqz v8, :cond_a

    .line 4422
    invoke-virtual {p1, v4, v5}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v4

    if-eq v4, v5, :cond_6

    .line 4423
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v4

    .line 4424
    .local v4, "offset":I
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int v8, v6, v4

    invoke-virtual {v5, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    .line 4425
    if-nez v2, :cond_5

    .line 4426
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v12, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(D)V

    .line 4427
    and-int/lit8 v5, v0, 0x1

    if-nez v5, :cond_4

    .line 4428
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_1

    .line 4430
    :cond_4
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4433
    .end local v4    # "offset":I
    :cond_5
    :goto_1
    goto/16 :goto_7

    .line 4434
    :cond_6
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 4435
    invoke-direct {p0, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->dcpLoadAsObject(I)V

    goto :goto_2

    .line 4437
    :cond_7
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4439
    :goto_2
    if-eqz v2, :cond_8

    .line 4440
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4441
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4442
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0x58

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_7

    .line 4444
    :cond_8
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4445
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v12, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(D)V

    .line 4446
    and-int/lit8 v4, v0, 0x1

    if-nez v4, :cond_9

    .line 4447
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_3

    .line 4449
    :cond_9
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4451
    :goto_3
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 4454
    goto/16 :goto_7

    .line 4456
    :cond_a
    invoke-virtual {p1, v4, v5}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v4

    const/16 v8, 0x5c

    if-eq v4, v5, :cond_e

    .line 4457
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v4

    .line 4458
    .restart local v4    # "offset":I
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int v9, v6, v4

    invoke-virtual {v5, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    .line 4459
    if-eqz v2, :cond_b

    .line 4460
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4462
    :cond_b
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v12, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(D)V

    .line 4463
    and-int/lit8 v5, v0, 0x1

    if-nez v5, :cond_c

    .line 4464
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_4

    .line 4466
    :cond_c
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4468
    :goto_4
    if-nez v2, :cond_d

    .line 4469
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4471
    :cond_d
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int v8, v6, v4

    invoke-virtual {v5, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addDStore(I)V

    .line 4472
    .end local v4    # "offset":I
    goto/16 :goto_7

    .line 4473
    :cond_e
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 4474
    invoke-direct {p0, v6}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->dcpLoadAsObject(I)V

    goto :goto_5

    .line 4476
    :cond_f
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4478
    :goto_5
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addObjectToDouble()V

    .line 4479
    if-eqz v2, :cond_10

    .line 4480
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4482
    :cond_10
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v12, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(D)V

    .line 4483
    and-int/lit8 v4, v0, 0x1

    if-nez v4, :cond_11

    .line 4484
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_6

    .line 4486
    :cond_11
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4488
    :goto_6
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 4489
    if-nez v2, :cond_12

    .line 4490
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 4492
    :cond_12
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 4493
    if-eqz v2, :cond_18

    .line 4494
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    goto/16 :goto_7

    .line 4499
    .end local v2    # "post":Z
    .end local v3    # "varIndex":I
    .end local v6    # "reg":S
    .end local v7    # "constDeclarations":[Z
    :cond_13
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4500
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4501
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4502
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 4503
    const-string v2, "nameIncrDecr"

    const-string v3, "(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;"

    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4508
    goto :goto_7

    .line 4527
    :cond_14
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 4528
    .local v2, "elemChild":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4529
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4530
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v3, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4531
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v3, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4532
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 4533
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-virtual {v3, v4, v5}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v3

    const-string v4, "elemIncrDecr"

    if-eq v3, v5, :cond_15

    .line 4534
    const-string v3, "(Ljava/lang/Object;DLcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;"

    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    .line 4542
    :cond_15
    const-string v3, "(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;"

    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4550
    goto :goto_7

    .line 4510
    .end local v2    # "elemChild":Lcom/trendmicro/hippo/Node;
    :cond_16
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 4512
    :cond_17
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 4513
    .local v2, "getPropChild":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4514
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4515
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4516
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4517
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 4518
    const-string v3, "propIncrDecr"

    const-string v4, "(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;"

    invoke-direct {p0, v3, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4524
    nop

    .line 4569
    .end local v2    # "getPropChild":Lcom/trendmicro/hippo/Node;
    :cond_18
    :goto_7
    return-void
.end method

.method private visitObjectLiteral(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V
    .locals 10
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;
    .param p3, "topLevel"    # Z

    .line 3231
    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 3232
    .local v0, "properties":[Ljava/lang/Object;
    array-length v1, v0

    .line 3235
    .local v1, "count":I
    const/16 v2, 0xa

    if-nez p3, :cond_2

    if-gt v1, v2, :cond_0

    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->getCurrentCodeOffset()I

    move-result v3

    const/16 v4, 0x7530

    if-le v3, v4, :cond_2

    :cond_0
    iget-boolean v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v3, :cond_2

    iget-boolean v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-nez v3, :cond_2

    iget-boolean v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inLocalBlock:Z

    if-nez v3, :cond_2

    .line 3237
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->literals:Ljava/util/List;

    if-nez v2, :cond_1

    .line 3238
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->literals:Ljava/util/List;

    .line 3240
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->literals:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3241
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_literal"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->literals:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3242
    .local v2, "methodName":Ljava/lang/String;
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->funObjLocal:S

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3243
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3244
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3245
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3246
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->argsLocal:S

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3247
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v4, 0xb6

    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v5, v5, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v6, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {v3, v4, v5, v2, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3253
    return-void

    .line 3256
    .end local v2    # "methodName":Ljava/lang/String;
    :cond_2
    iget-boolean v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v3, :cond_3

    .line 3259
    invoke-direct {p0, p1, p2, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addLoadPropertyValues(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)V

    .line 3260
    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addLoadPropertyIds([Ljava/lang/Object;I)V

    .line 3262
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v4, 0x5f

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 3264
    :cond_3
    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addLoadPropertyIds([Ljava/lang/Object;I)V

    .line 3265
    invoke-direct {p0, p1, p2, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addLoadPropertyValues(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)V

    .line 3269
    :goto_0
    const/4 v3, 0x0

    .line 3270
    .local v3, "hasGetterSetters":Z
    move-object v4, p2

    .line 3271
    .local v4, "child2":Lcom/trendmicro/hippo/Node;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    const/16 v6, 0x99

    const/16 v7, 0x98

    if-eq v5, v1, :cond_6

    .line 3272
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v8

    .line 3273
    .local v8, "childType":I
    if-eq v8, v7, :cond_5

    if-ne v8, v6, :cond_4

    goto :goto_2

    .line 3277
    :cond_4
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 3271
    .end local v8    # "childType":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 3274
    .restart local v8    # "childType":I
    :cond_5
    :goto_2
    const/4 v3, 0x1

    .line 3280
    .end local v5    # "i":I
    .end local v8    # "childType":I
    :cond_6
    if-eqz v3, :cond_a

    .line 3281
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3282
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0xbc

    invoke-virtual {v5, v8, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 3283
    move-object v2, p2

    .line 3284
    .end local v4    # "child2":Lcom/trendmicro/hippo/Node;
    .local v2, "child2":Lcom/trendmicro/hippo/Node;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3
    if-eq v4, v1, :cond_9

    .line 3285
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0x59

    invoke-virtual {v5, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3286
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3287
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    .line 3288
    .local v5, "childType":I
    if-ne v5, v7, :cond_7

    .line 3289
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v9, 0x2

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_4

    .line 3290
    :cond_7
    if-ne v5, v6, :cond_8

    .line 3291
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v9, 0x4

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_4

    .line 3293
    :cond_8
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v9, 0x3

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3295
    :goto_4
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v9, 0x4f

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3296
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 3284
    .end local v5    # "childType":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_9
    move-object v4, v2

    .end local v4    # "i":I
    goto :goto_5

    .line 3299
    .end local v2    # "child2":Lcom/trendmicro/hippo/Node;
    .local v4, "child2":Lcom/trendmicro/hippo/Node;
    :cond_a
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3302
    :goto_5
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v2, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3303
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3304
    const-string v2, "newObjectLiteral"

    const-string v5, "([Ljava/lang/Object;[Ljava/lang/Object;[ILcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {p0, v2, v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3311
    return-void
.end method

.method private visitOptimizedCall(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/optimizer/OptFunctionNode;ILcom/trendmicro/hippo/Node;)V
    .locals 16
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "target"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .param p3, "type"    # I
    .param p4, "child"    # Lcom/trendmicro/hippo/Node;

    .line 3493
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    invoke-virtual/range {p4 .. p4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 3494
    .local v5, "firstArgChild":Lcom/trendmicro/hippo/Node;
    iget-object v6, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v6, v6, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    .line 3496
    .local v6, "className":Ljava/lang/String;
    const/4 v7, 0x0

    .line 3497
    .local v7, "thisObjLocal":S
    const/16 v8, 0x1e

    if-ne v3, v8, :cond_0

    .line 3498
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    goto :goto_0

    .line 3500
    :cond_0
    invoke-direct {v0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateFunctionAndThisObj(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3501
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v7

    .line 3502
    iget-object v9, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v9, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 3506
    :goto_0
    iget-object v9, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v9}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v9

    .line 3507
    .local v9, "beyond":I
    iget-object v10, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v10}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v10

    .line 3509
    .local v10, "regularCall":I
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v12, 0x59

    invoke-virtual {v11, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3510
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v13, 0xc1

    invoke-virtual {v11, v13, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 3511
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v13, 0x99

    invoke-virtual {v11, v13, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 3512
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v13, 0xc0

    invoke-virtual {v11, v13, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 3513
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v11, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3514
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v12, 0xb4

    const-string v13, "_id"

    const-string v14, "I"

    invoke-virtual {v11, v12, v6, v13, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3515
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v12, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v13, v2, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v12, v13}, Lcom/trendmicro/hippo/optimizer/Codegen;->getIndex(Lcom/trendmicro/hippo/ast/ScriptNode;)I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3516
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v12, 0xa0

    invoke-virtual {v11, v12, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 3519
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v12, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v11, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3520
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v12, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v11, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3523
    const/4 v11, 0x1

    if-ne v3, v8, :cond_1

    .line 3524
    iget-object v12, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v12, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_1

    .line 3526
    :cond_1
    iget-object v12, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v12, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3536
    :goto_1
    move-object v12, v5

    .line 3537
    .local v12, "argChild":Lcom/trendmicro/hippo/Node;
    :goto_2
    const/16 v13, 0xb2

    if-eqz v12, :cond_4

    .line 3538
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->nodeIsDirectCallParameter(Lcom/trendmicro/hippo/Node;)I

    move-result v14

    .line 3539
    .local v14, "dcp_register":I
    if-ltz v14, :cond_2

    .line 3540
    iget-object v13, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v13, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3541
    iget-object v13, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int/lit8 v15, v14, 0x1

    invoke-virtual {v13, v15}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    move v8, v14

    goto :goto_3

    .line 3542
    :cond_2
    const/16 v15, 0x8

    const/4 v11, -0x1

    invoke-virtual {v12, v15, v11}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v11

    if-nez v11, :cond_3

    .line 3545
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const-string v15, "java/lang/Void"

    const-string v8, "TYPE"

    const-string v4, "Ljava/lang/Class;"

    invoke-virtual {v11, v13, v15, v8, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3549
    invoke-direct {v0, v12, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move v8, v14

    goto :goto_3

    .line 3551
    :cond_3
    invoke-direct {v0, v12, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3552
    iget-object v4, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    move v8, v14

    .end local v14    # "dcp_register":I
    .local v8, "dcp_register":I
    const-wide/16 v13, 0x0

    invoke-virtual {v4, v13, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(D)V

    .line 3554
    :goto_3
    invoke-virtual {v12}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v12

    .line 3555
    .end local v8    # "dcp_register":I
    move-object/from16 v4, p4

    const/16 v8, 0x1e

    const/4 v11, 0x1

    goto :goto_2

    .line 3557
    :cond_4
    iget-object v4, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const-string v8, "com/trendmicro/hippo/ScriptRuntime"

    const-string v11, "emptyArgs"

    const-string v14, "[Ljava/lang/Object;"

    invoke-virtual {v4, v13, v8, v11, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3560
    iget-object v4, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0xb8

    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v11, v11, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    .line 3562
    const/16 v13, 0x1e

    if-ne v3, v13, :cond_5

    .line 3563
    iget-object v13, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v14, v2, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v13, v14}, Lcom/trendmicro/hippo/optimizer/Codegen;->getDirectCtorName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v13

    goto :goto_4

    .line 3564
    :cond_5
    iget-object v13, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v14, v2, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v13, v14}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v13

    :goto_4
    iget-object v14, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v15, v2, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 3565
    invoke-virtual {v14, v15}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodSignature(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v14

    .line 3560
    invoke-virtual {v4, v8, v11, v13, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3567
    iget-object v4, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0xa7

    invoke-virtual {v4, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 3569
    iget-object v4, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 3571
    iget-object v4, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v4, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3572
    iget-object v4, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v8, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v4, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3574
    const/16 v4, 0x1e

    if-eq v3, v4, :cond_6

    .line 3575
    iget-object v4, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3576
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 3581
    :cond_6
    const/4 v4, 0x1

    invoke-direct {v0, v1, v5, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateCallArgArray(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    .line 3583
    const/16 v4, 0x1e

    if-ne v3, v4, :cond_7

    .line 3584
    const-string v4, "newObject"

    const-string v8, "(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {v0, v4, v8}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    .line 3592
    :cond_7
    iget-object v4, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0xb9

    const-string v11, "com/trendmicro/hippo/Callable"

    const-string v13, "call"

    const-string v14, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;"

    invoke-virtual {v4, v8, v11, v13, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3602
    :goto_5
    iget-object v4, v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 3603
    return-void
.end method

.method private visitSetConst(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 4954
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v0

    .line 4955
    .local v0, "name":Ljava/lang/String;
    :goto_0
    if-eqz p2, :cond_0

    .line 4956
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4957
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p2

    goto :goto_0

    .line 4959
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4960
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4961
    const-string v1, "setConst"

    const-string v2, "(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4968
    return-void
.end method

.method private visitSetConstVar(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V
    .locals 10
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;
    .param p3, "needValue"    # Z

    .line 5054
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 5055
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 5056
    .local v0, "varIndex":I
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 5057
    const/16 v1, 0x8

    const/4 v2, -0x1

    invoke-virtual {p1, v1, v2}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v1

    const/4 v3, 0x1

    if-eq v1, v2, :cond_1

    move v1, v3

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 5058
    .local v1, "isNumber":Z
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v2, v2, v0

    .line 5059
    .local v2, "reg":S
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v4

    .line 5060
    .local v4, "beyond":I
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v5

    .line 5061
    .local v5, "noAssign":I
    const/16 v6, 0xa7

    const/16 v7, 0x9a

    if-eqz v1, :cond_3

    .line 5062
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int/lit8 v9, v2, 0x2

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addILoad(I)V

    .line 5063
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v7, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5064
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v7

    .line 5065
    .local v7, "stack":S
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 5066
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int/lit8 v8, v2, 0x2

    invoke-virtual {v3, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addIStore(I)V

    .line 5067
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addDStore(I)V

    .line 5068
    if-eqz p3, :cond_2

    .line 5069
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    .line 5070
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v5, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(IS)V

    goto :goto_1

    .line 5072
    :cond_2
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v6, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5073
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v5, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(IS)V

    .line 5074
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v6, 0x58

    invoke-virtual {v3, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5076
    .end local v7    # "stack":S
    :goto_1
    goto :goto_2

    .line 5078
    :cond_3
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int/lit8 v9, v2, 0x1

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addILoad(I)V

    .line 5079
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v7, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5080
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v7

    .line 5081
    .restart local v7    # "stack":S
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 5082
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v3, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addIStore(I)V

    .line 5083
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 5084
    if-eqz p3, :cond_4

    .line 5085
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5086
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v5, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(IS)V

    goto :goto_2

    .line 5088
    :cond_4
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v6, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5089
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v5, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(IS)V

    .line 5090
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v6, 0x57

    invoke-virtual {v3, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5093
    .end local v7    # "stack":S
    :goto_2
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 5094
    return-void
.end method

.method private visitSetElem(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 3
    .param p1, "type"    # I
    .param p2, "node"    # Lcom/trendmicro/hippo/Node;
    .param p3, "child"    # Lcom/trendmicro/hippo/Node;

    .line 5192
    invoke-direct {p0, p3, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 5193
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p3

    .line 5194
    const/16 v0, 0x8d

    if-ne p1, v0, :cond_0

    .line 5195
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x59

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5197
    :cond_0
    invoke-direct {p0, p3, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 5198
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p3

    .line 5199
    const/16 v1, 0x8

    const/4 v2, -0x1

    invoke-virtual {p2, v1, v2}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v1

    if-eq v1, v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 5200
    .local v1, "indexIsNumber":Z
    :goto_0
    if-ne p1, v0, :cond_3

    .line 5201
    if-eqz v1, :cond_2

    .line 5204
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x5d

    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5205
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5206
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5207
    const-string v0, "getObjectIndex"

    const-string v2, "(Ljava/lang/Object;DLcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v0, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 5216
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0x5a

    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5217
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5218
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5219
    const-string v0, "getObjectElem"

    const-string v2, "(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v0, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5228
    :cond_3
    :goto_1
    invoke-direct {p0, p3, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 5229
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5230
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5231
    if-eqz v1, :cond_4

    .line 5232
    const-string v0, "setObjectIndex"

    const-string v2, "(Ljava/lang/Object;DLjava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v0, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 5241
    :cond_4
    const-string v0, "setObjectElem"

    const-string v2, "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v0, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5250
    :goto_2
    return-void
.end method

.method private visitSetName(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 4914
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v0

    .line 4915
    .local v0, "name":Ljava/lang/String;
    :goto_0
    if-eqz p2, :cond_0

    .line 4916
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4917
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p2

    goto :goto_0

    .line 4919
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4920
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4921
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4922
    const-string v1, "setName"

    const-string v2, "(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4930
    return-void
.end method

.method private visitSetProp(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 5
    .param p1, "type"    # I
    .param p2, "node"    # Lcom/trendmicro/hippo/Node;
    .param p3, "child"    # Lcom/trendmicro/hippo/Node;

    .line 5141
    move-object v0, p3

    .line 5142
    .local v0, "objectChild":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, p3, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 5143
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p3

    .line 5144
    const/16 v1, 0x8c

    if-ne p1, v1, :cond_0

    .line 5145
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x59

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5147
    :cond_0
    move-object v2, p3

    .line 5148
    .local v2, "nameChild":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, p3, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 5149
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p3

    .line 5150
    if-ne p1, v1, :cond_2

    .line 5152
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v3, 0x5a

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5155
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    const/16 v3, 0x2b

    const-string v4, "getObjectProp"

    if-ne v1, v3, :cond_1

    .line 5156
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    const/16 v3, 0x29

    if-ne v1, v3, :cond_1

    .line 5158
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5159
    const-string v1, "(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;"

    invoke-direct {p0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 5166
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5167
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5168
    const-string v1, "(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5177
    :cond_2
    :goto_0
    invoke-direct {p0, p3, p2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 5178
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5179
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5180
    const-string v1, "setObjectProp"

    const-string v3, "(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 5188
    return-void
.end method

.method private visitSetVar(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V
    .locals 9
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;
    .param p3, "needValue"    # Z

    .line 4994
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 4995
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 4996
    .local v0, "varIndex":I
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4997
    const/16 v1, 0x8

    const/4 v2, -0x1

    invoke-virtual {p1, v1, v2}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v1

    if-eq v1, v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 4998
    .local v1, "isNumber":Z
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v2, v2, v0

    .line 4999
    .local v2, "reg":S
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    iget-object v3, v3, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamAndVarConst()[Z

    move-result-object v3

    .line 5000
    .local v3, "constDeclarations":[Z
    aget-boolean v4, v3, v0

    if-eqz v4, :cond_3

    .line 5001
    if-nez p3, :cond_c

    .line 5002
    if-eqz v1, :cond_2

    .line 5003
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0x58

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_1

    .line 5005
    :cond_2
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0x57

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_1

    .line 5008
    :cond_3
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v4

    const/16 v5, 0x5c

    if-eqz v4, :cond_7

    .line 5009
    if-eqz v1, :cond_5

    .line 5010
    if-eqz p3, :cond_4

    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5011
    :cond_4
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5012
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0xb2

    const-string v6, "java/lang/Void"

    const-string v7, "TYPE"

    const-string v8, "Ljava/lang/Class;"

    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5016
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v4

    .line 5017
    .local v4, "isNumberLabel":I
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v5

    .line 5018
    .local v5, "beyond":I
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v7, 0xa5

    invoke-virtual {v6, v7, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5019
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v6

    .line 5020
    .local v6, "stack":S
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 5021
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 5022
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v8, 0xa7

    invoke-virtual {v7, v8, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 5023
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v4, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(IS)V

    .line 5024
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addDStore(I)V

    .line 5025
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 5026
    .end local v4    # "isNumberLabel":I
    .end local v5    # "beyond":I
    .end local v6    # "stack":S
    goto :goto_1

    .line 5028
    :cond_5
    if-eqz p3, :cond_6

    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0x59

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5029
    :cond_6
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    goto :goto_1

    .line 5032
    :cond_7
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v4, v0}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v4

    .line 5033
    .local v4, "isNumberVar":Z
    if-eqz v1, :cond_a

    .line 5034
    if-eqz v4, :cond_8

    .line 5035
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addDStore(I)V

    .line 5036
    if-eqz p3, :cond_c

    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    goto :goto_1

    .line 5038
    :cond_8
    if-eqz p3, :cond_9

    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 5041
    :cond_9
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addDoubleWrap()V

    .line 5042
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    goto :goto_1

    .line 5045
    :cond_a
    if-eqz v4, :cond_b

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 5046
    :cond_b
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 5047
    if-eqz p3, :cond_c

    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 5050
    .end local v4    # "isNumberVar":Z
    :cond_c
    :goto_1
    return-void
.end method

.method private visitSpecialCall(Lcom/trendmicro/hippo/Node;IILcom/trendmicro/hippo/Node;)V
    .locals 5
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "type"    # I
    .param p3, "specialType"    # I
    .param p4, "child"    # Lcom/trendmicro/hippo/Node;

    .line 3316
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3318
    const/16 v0, 0x1e

    if-ne p2, v0, :cond_0

    .line 3319
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    goto :goto_0

    .line 3322
    :cond_0
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateFunctionAndThisObj(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3325
    :goto_0
    invoke-virtual {p4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p4

    .line 3327
    const/4 v1, 0x0

    invoke-direct {p0, p1, p4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateCallArgArray(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    .line 3332
    if-ne p2, v0, :cond_1

    .line 3333
    const-string v0, "newObjectSpecial"

    .line 3334
    .local v0, "methodName":Ljava/lang/String;
    const-string v1, "(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;[Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;"

    .line 3341
    .local v1, "callSignature":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3342
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3343
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    goto :goto_2

    .line 3345
    .end local v0    # "methodName":Ljava/lang/String;
    .end local v1    # "callSignature":Ljava/lang/String;
    :cond_1
    const-string v0, "callSpecial"

    .line 3346
    .restart local v0    # "methodName":Ljava/lang/String;
    const-string v1, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/String;I)Ljava/lang/Object;"

    .line 3355
    .restart local v1    # "callSignature":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3356
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->thisObjLocal:S

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3357
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3358
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v2

    .line 3359
    .local v2, "sourceName":Ljava/lang/String;
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    if-nez v2, :cond_2

    const-string v4, ""

    goto :goto_1

    :cond_2
    move-object v4, v2

    :goto_1
    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3360
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->itsLineNumber:I

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 3363
    .end local v2    # "sourceName":Ljava/lang/String;
    :goto_2
    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3364
    return-void
.end method

.method private visitStandardCall(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 6
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 3368
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x26

    if-ne v0, v1, :cond_8

    .line 3370
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 3371
    .local v0, "firstArgChild":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    .line 3376
    .local v1, "childType":I
    const/16 v2, 0x27

    if-nez v0, :cond_3

    .line 3377
    if-ne v1, v2, :cond_0

    .line 3379
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v2

    .line 3380
    .local v2, "name":Ljava/lang/String;
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3381
    const-string v3, "callName0"

    .line 3382
    .local v3, "methodName":Ljava/lang/String;
    const-string v2, "(Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    .line 3386
    .local v2, "signature":Ljava/lang/String;
    goto/16 :goto_1

    .end local v2    # "signature":Ljava/lang/String;
    .end local v3    # "methodName":Ljava/lang/String;
    :cond_0
    const/16 v2, 0x21

    if-ne v1, v2, :cond_1

    .line 3388
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 3389
    .local v2, "propTarget":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3390
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 3391
    .local v3, "id":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v4

    .line 3392
    .local v4, "property":Ljava/lang/String;
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3393
    const-string v5, "callProp0"

    .line 3394
    .local v5, "methodName":Ljava/lang/String;
    const-string v2, "(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    .line 3399
    .end local v3    # "id":Lcom/trendmicro/hippo/Node;
    .end local v4    # "property":Ljava/lang/String;
    .local v2, "signature":Ljava/lang/String;
    move-object v3, v5

    goto :goto_1

    .end local v2    # "signature":Ljava/lang/String;
    .end local v5    # "methodName":Ljava/lang/String;
    :cond_1
    const/16 v2, 0x22

    if-eq v1, v2, :cond_2

    .line 3402
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateFunctionAndThisObj(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3403
    const-string v3, "call0"

    .line 3404
    .local v3, "methodName":Ljava/lang/String;
    const-string v2, "(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    .restart local v2    # "signature":Ljava/lang/String;
    goto :goto_1

    .line 3400
    .end local v2    # "signature":Ljava/lang/String;
    .end local v3    # "methodName":Ljava/lang/String;
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 3411
    :cond_3
    const/4 v3, 0x0

    if-ne v1, v2, :cond_4

    .line 3416
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v2

    .line 3417
    .local v2, "name":Ljava/lang/String;
    invoke-direct {p0, p1, v0, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateCallArgArray(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    .line 3418
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 3419
    const-string v3, "callName"

    .line 3420
    .restart local v3    # "methodName":Ljava/lang/String;
    const-string v2, "([Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    .line 3425
    .local v2, "signature":Ljava/lang/String;
    goto :goto_1

    .line 3426
    .end local v2    # "signature":Ljava/lang/String;
    .end local v3    # "methodName":Ljava/lang/String;
    :cond_4
    const/4 v2, 0x0

    .line 3427
    .local v2, "argCount":I
    move-object v4, v0

    .local v4, "arg":Lcom/trendmicro/hippo/Node;
    :goto_0
    if-eqz v4, :cond_5

    .line 3428
    add-int/lit8 v2, v2, 0x1

    .line 3427
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    goto :goto_0

    .line 3430
    .end local v4    # "arg":Lcom/trendmicro/hippo/Node;
    :cond_5
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateFunctionAndThisObj(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3432
    const/4 v4, 0x1

    if-ne v2, v4, :cond_6

    .line 3433
    invoke-direct {p0, v0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3434
    const-string v3, "call1"

    .line 3435
    .restart local v3    # "methodName":Ljava/lang/String;
    const-string v4, "(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    move-object v2, v4

    .local v4, "signature":Ljava/lang/String;
    goto :goto_1

    .line 3441
    .end local v3    # "methodName":Ljava/lang/String;
    .end local v4    # "signature":Ljava/lang/String;
    :cond_6
    const/4 v4, 0x2

    if-ne v2, v4, :cond_7

    .line 3442
    invoke-direct {p0, v0, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3443
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3444
    const-string v3, "call2"

    .line 3445
    .restart local v3    # "methodName":Ljava/lang/String;
    const-string v4, "(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    move-object v2, v4

    .restart local v4    # "signature":Ljava/lang/String;
    goto :goto_1

    .line 3453
    .end local v3    # "methodName":Ljava/lang/String;
    .end local v4    # "signature":Ljava/lang/String;
    :cond_7
    invoke-direct {p0, p1, v0, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateCallArgArray(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    .line 3454
    const-string v3, "callN"

    .line 3455
    .restart local v3    # "methodName":Ljava/lang/String;
    const-string v4, "(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    move-object v2, v4

    .line 3464
    .local v2, "signature":Ljava/lang/String;
    :goto_1
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3465
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3466
    invoke-direct {p0, v3, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addOptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3467
    return-void

    .line 3368
    .end local v0    # "firstArgChild":Lcom/trendmicro/hippo/Node;
    .end local v1    # "childType":I
    .end local v2    # "signature":Ljava/lang/String;
    .end local v3    # "methodName":Ljava/lang/String;
    :cond_8
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private visitStandardNew(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 3471
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x1e

    if-ne v0, v1, :cond_0

    .line 3473
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 3475
    .local v0, "firstArgChild":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 3477
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3478
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3480
    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateCallArgArray(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Z)V

    .line 3481
    const-string v1, "newObject"

    const-string v2, "(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 3488
    return-void

    .line 3471
    .end local v0    # "firstArgChild":Lcom/trendmicro/hippo/Node;
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private visitStrictSetName(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 4934
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v0

    .line 4935
    .local v0, "name":Ljava/lang/String;
    :goto_0
    if-eqz p2, :cond_0

    .line 4936
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4937
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p2

    goto :goto_0

    .line 4939
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->contextLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4940
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4941
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4942
    const-string v1, "strictSetName"

    const-string v2, "(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;"

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4950
    return-void
.end method

.method private visitSwitch(Lcom/trendmicro/hippo/ast/Jump;Lcom/trendmicro/hippo/Node;)V
    .locals 5
    .param p1, "switchNode"    # Lcom/trendmicro/hippo/ast/Jump;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 4307
    invoke-direct {p0, p2, p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4309
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v0

    .line 4310
    .local v0, "selector":S
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 4312
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/Jump;

    .line 4313
    .local v1, "caseNode":Lcom/trendmicro/hippo/ast/Jump;
    :goto_0
    if-eqz v1, :cond_1

    .line 4316
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Jump;->getType()I

    move-result v2

    const/16 v3, 0x74

    if-ne v2, v3, :cond_0

    .line 4318
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Jump;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 4319
    .local v2, "test":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v2, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateExpression(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4320
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4321
    const-string v3, "shallowEq"

    const-string v4, "(Ljava/lang/Object;Ljava/lang/Object;)Z"

    invoke-direct {p0, v3, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4325
    iget-object v3, v1, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    const/16 v4, 0x9a

    invoke-direct {p0, v3, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addGoto(Lcom/trendmicro/hippo/Node;I)V

    .line 4314
    .end local v2    # "test":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Jump;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    move-object v1, v2

    check-cast v1, Lcom/trendmicro/hippo/ast/Jump;

    goto :goto_0

    .line 4317
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 4327
    .end local v1    # "caseNode":Lcom/trendmicro/hippo/ast/Jump;
    :cond_1
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 4328
    return-void
.end method

.method private visitTryCatchFinally(Lcom/trendmicro/hippo/ast/Jump;Lcom/trendmicro/hippo/Node;)V
    .locals 22
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/Jump;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 3763
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getNewWordLocal()S

    move-result v8

    .line 3764
    .local v8, "savedVariableObject":S
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3765
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 3772
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v9

    .line 3773
    .local v9, "startLabel":I
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v1, 0x0

    invoke-virtual {v0, v9, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(IS)V

    .line 3775
    iget-object v10, v7, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 3776
    .local v10, "catchTarget":Lcom/trendmicro/hippo/Node;
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/Jump;->getFinally()Lcom/trendmicro/hippo/Node;

    move-result-object v11

    .line 3777
    .local v11, "finallyTarget":Lcom/trendmicro/hippo/Node;
    const/4 v0, 0x5

    new-array v12, v0, [I

    .line 3779
    .local v12, "handlerLabels":[I
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->exceptionManager:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

    invoke-virtual {v0, v7}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->pushExceptionInfo(Lcom/trendmicro/hippo/ast/Jump;)V

    .line 3780
    const/16 v13, 0xd

    const/4 v14, 0x3

    const/4 v15, 0x2

    const/4 v5, 0x1

    if-eqz v10, :cond_0

    .line 3781
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    aput v0, v12, v1

    .line 3782
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    aput v0, v12, v5

    .line 3783
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    aput v0, v12, v15

    .line 3784
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 3785
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_0

    .line 3786
    invoke-virtual {v0, v13}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3787
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v2

    aput v2, v12, v14

    .line 3790
    .end local v0    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_0
    const/16 v16, 0x4

    if-eqz v11, :cond_1

    .line 3791
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    aput v0, v12, v16

    .line 3793
    :cond_1
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->exceptionManager:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

    invoke-virtual {v0, v12, v9}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->setHandlers([II)V

    .line 3796
    iget-boolean v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v0, :cond_3

    if-eqz v11, :cond_3

    .line 3797
    new-instance v0, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;

    invoke-direct {v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;-><init>()V

    .line 3798
    .local v0, "ret":Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    if-nez v2, :cond_2

    .line 3799
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    .line 3802
    :cond_2
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    invoke-interface {v2, v11, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3804
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->finallys:Ljava/util/Map;

    invoke-virtual {v11}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3807
    .end local v0    # "ret":Lcom/trendmicro/hippo/optimizer/BodyCodegen$FinallyReturnPoint;
    :cond_3
    move-object/from16 v4, p2

    .end local p2    # "child":Lcom/trendmicro/hippo/Node;
    .local v4, "child":Lcom/trendmicro/hippo/Node;
    :goto_0
    if-eqz v4, :cond_5

    .line 3808
    if-ne v4, v10, :cond_4

    .line 3809
    invoke-direct {v6, v10}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getTargetLabel(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 3810
    .local v0, "catchLabel":I
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->exceptionManager:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

    invoke-virtual {v2, v1, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->removeHandler(II)I

    .line 3812
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->exceptionManager:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

    invoke-virtual {v2, v5, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->removeHandler(II)I

    .line 3814
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->exceptionManager:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

    invoke-virtual {v2, v15, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->removeHandler(II)I

    .line 3816
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->exceptionManager:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

    invoke-virtual {v2, v14, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->removeHandler(II)I

    .line 3819
    .end local v0    # "catchLabel":I
    :cond_4
    invoke-direct {v6, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateStatement(Lcom/trendmicro/hippo/Node;)V

    .line 3820
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    goto :goto_0

    .line 3824
    :cond_5
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v3

    .line 3825
    .local v3, "realEnd":I
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v2, 0xa7

    invoke-virtual {v0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 3827
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->getLocalBlockRegister(Lcom/trendmicro/hippo/Node;)I

    move-result v2

    .line 3830
    .local v2, "exceptionLocal":I
    if-eqz v10, :cond_6

    .line 3832
    invoke-virtual {v10}, Lcom/trendmicro/hippo/Node;->labelId()I

    move-result v17

    .line 3839
    .local v17, "catchLabel":I
    const/16 v18, 0x0

    aget v19, v12, v1

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 p2, v2

    .end local v2    # "exceptionLocal":I
    .local p2, "exceptionLocal":I
    move v2, v8

    move/from16 v20, v3

    .end local v3    # "realEnd":I
    .local v20, "realEnd":I
    move/from16 v3, v17

    move-object/from16 v18, v4

    .end local v4    # "child":Lcom/trendmicro/hippo/Node;
    .local v18, "child":Lcom/trendmicro/hippo/Node;
    move/from16 v4, p2

    move/from16 v21, v5

    move/from16 v5, v19

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateCatchBlock(ISIII)V

    .line 3846
    const/4 v1, 0x1

    aget v5, v12, v21

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateCatchBlock(ISIII)V

    .line 3854
    const/4 v1, 0x2

    aget v5, v12, v15

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateCatchBlock(ISIII)V

    .line 3858
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v15

    .line 3859
    .local v15, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v15, :cond_7

    .line 3860
    invoke-virtual {v15, v13}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 3862
    const/4 v1, 0x3

    aget v5, v12, v14

    move-object/from16 v0, p0

    move v2, v8

    move/from16 v3, v17

    move/from16 v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateCatchBlock(ISIII)V

    goto :goto_1

    .line 3830
    .end local v15    # "cx":Lcom/trendmicro/hippo/Context;
    .end local v17    # "catchLabel":I
    .end local v18    # "child":Lcom/trendmicro/hippo/Node;
    .end local v20    # "realEnd":I
    .end local p2    # "exceptionLocal":I
    .restart local v2    # "exceptionLocal":I
    .restart local v3    # "realEnd":I
    .restart local v4    # "child":Lcom/trendmicro/hippo/Node;
    :cond_6
    move/from16 p2, v2

    move/from16 v20, v3

    move-object/from16 v18, v4

    .line 3870
    .end local v2    # "exceptionLocal":I
    .end local v3    # "realEnd":I
    .end local v4    # "child":Lcom/trendmicro/hippo/Node;
    .restart local v18    # "child":Lcom/trendmicro/hippo/Node;
    .restart local v20    # "realEnd":I
    .restart local p2    # "exceptionLocal":I
    :cond_7
    :goto_1
    if-eqz v11, :cond_b

    .line 3871
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v0

    .line 3872
    .local v0, "finallyHandler":I
    iget-object v1, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v1

    .line 3873
    .local v1, "finallyEnd":I
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->markHandler(I)V

    .line 3874
    iget-boolean v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-nez v2, :cond_8

    .line 3875
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    aget v3, v12, v16

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 3877
    :cond_8
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    move/from16 v3, p2

    .end local p2    # "exceptionLocal":I
    .local v3, "exceptionLocal":I
    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 3880
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3881
    iget-object v2, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v4, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v2, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 3884
    invoke-virtual {v11}, Lcom/trendmicro/hippo/Node;->labelId()I

    move-result v2

    .line 3885
    .local v2, "finallyLabel":I
    iget-boolean v4, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v4, :cond_9

    .line 3886
    invoke-direct {v6, v11}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addGotoWithReturn(Lcom/trendmicro/hippo/Node;)V

    goto :goto_2

    .line 3888
    :cond_9
    aget v4, v12, v16

    invoke-direct {v6, v11, v4, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->inlineFinally(Lcom/trendmicro/hippo/Node;II)V

    .line 3893
    :goto_2
    iget-object v4, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 3894
    iget-boolean v4, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v4, :cond_a

    .line 3895
    iget-object v4, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0xc0

    const-string v13, "java/lang/Throwable"

    invoke-virtual {v4, v5, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 3896
    :cond_a
    iget-object v4, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v5, 0xbf

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 3898
    iget-object v4, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 3900
    iget-boolean v4, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v4, :cond_c

    .line 3901
    iget-object v4, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/4 v5, 0x0

    invoke-virtual {v4, v9, v2, v0, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addExceptionHandler(IIILjava/lang/String;)V

    goto :goto_3

    .line 3870
    .end local v0    # "finallyHandler":I
    .end local v1    # "finallyEnd":I
    .end local v2    # "finallyLabel":I
    .end local v3    # "exceptionLocal":I
    .restart local p2    # "exceptionLocal":I
    :cond_b
    move/from16 v3, p2

    .line 3905
    .end local p2    # "exceptionLocal":I
    .restart local v3    # "exceptionLocal":I
    :cond_c
    :goto_3
    invoke-direct {v6, v8}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->releaseWordLocal(S)V

    .line 3906
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    move/from16 v1, v20

    .end local v20    # "realEnd":I
    .local v1, "realEnd":I
    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 3908
    iget-boolean v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-nez v0, :cond_d

    .line 3909
    iget-object v0, v6, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->exceptionManager:Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen$ExceptionManager;->popExceptionInfo()V

    .line 3911
    :cond_d
    return-void
.end method

.method private visitTypeofname(Lcom/trendmicro/hippo/Node;)V
    .locals 10
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 4332
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->hasVarsInRegs:Z

    if-eqz v0, :cond_2

    .line 4333
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    iget-object v0, v0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getIndexForNameNode(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 4334
    .local v0, "varIndex":I
    if-ltz v0, :cond_2

    .line 4335
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v1

    const-string v2, "number"

    if-eqz v1, :cond_0

    .line 4336
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    goto :goto_0

    .line 4337
    :cond_0
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varIsDirectCallParameter(I)Z

    move-result v1

    const-string v3, "(Ljava/lang/Object;)Ljava/lang/String;"

    const-string v4, "typeof"

    if-eqz v1, :cond_1

    .line 4338
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v1, v1, v0

    .line 4339
    .local v1, "dcp_register":I
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4340
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v6, 0xb2

    const-string v7, "java/lang/Void"

    const-string v8, "TYPE"

    const-string v9, "Ljava/lang/Class;"

    invoke-virtual {v5, v6, v7, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4342
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v5

    .line 4343
    .local v5, "isNumberLabel":I
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v7, 0xa5

    invoke-virtual {v6, v7, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4344
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v6}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v6

    .line 4345
    .local v6, "stack":S
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v7, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4346
    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4349
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v3

    .line 4350
    .local v3, "beyond":I
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    const/16 v7, 0xa7

    invoke-virtual {v4, v7, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 4351
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(IS)V

    .line 4352
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v4, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4353
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 4354
    .end local v1    # "dcp_register":I
    .end local v3    # "beyond":I
    .end local v5    # "isNumberLabel":I
    .end local v6    # "stack":S
    goto :goto_0

    .line 4355
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->varRegisters:[S

    aget-short v2, v2, v0

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4356
    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4360
    :goto_0
    return-void

    .line 4363
    .end local v0    # "varIndex":I
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->variableObjectLocal:S

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 4364
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 4365
    const-string v0, "typeofName"

    const-string v1, "(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/String;"

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->addScriptRuntimeInvoke(Ljava/lang/String;Ljava/lang/String;)V

    .line 4369
    return-void
.end method


# virtual methods
.method generateBodyCode()V
    .locals 6

    .line 1269
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-static {v0}, Lcom/trendmicro/hippo/optimizer/Codegen;->isGenerator(Lcom/trendmicro/hippo/ast/ScriptNode;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    .line 1272
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->initBodyGeneration()V

    .line 1274
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    const/16 v1, 0xa

    if-eqz v0, :cond_0

    .line 1278
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v2, v2, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassSignature:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1284
    .local v0, "type":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "_gen"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 1287
    .end local v0    # "type":Ljava/lang/String;
    goto :goto_0

    .line 1288
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 1289
    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodSignature(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v3

    .line 1288
    invoke-virtual {v0, v2, v3, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 1293
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generatePrologue()V

    .line 1295
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->fnCurrent:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    if-eqz v0, :cond_1

    .line 1296
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .local v0, "treeTop":Lcom/trendmicro/hippo/Node;
    goto :goto_1

    .line 1298
    .end local v0    # "treeTop":Lcom/trendmicro/hippo/Node;
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 1300
    .restart local v0    # "treeTop":Lcom/trendmicro/hippo/Node;
    :goto_1
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateStatement(Lcom/trendmicro/hippo/Node;)V

    .line 1301
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateEpilogue()V

    .line 1303
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    iget-short v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->localsMax:S

    add-int/lit8 v2, v2, 0x1

    int-to-short v2, v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 1305
    iget-boolean v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->isGenerator:Z

    if-eqz v1, :cond_2

    .line 1308
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateGenerator()V

    .line 1311
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->literals:Ljava/util/List;

    if-eqz v1, :cond_5

    .line 1313
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->literals:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 1314
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->literals:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/Node;

    .line 1315
    .local v2, "node":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v3

    .line 1316
    .local v3, "type":I
    const/16 v4, 0x42

    if-eq v3, v4, :cond_4

    const/16 v4, 0x43

    if-eq v3, v4, :cond_3

    .line 1324
    invoke-static {v3}, Lcom/trendmicro/hippo/Token;->typeToName(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/trendmicro/hippo/Kit;->codeBug(Ljava/lang/String;)Ljava/lang/RuntimeException;

    goto :goto_3

    .line 1318
    :cond_3
    add-int/lit8 v4, v1, 0x1

    invoke-direct {p0, v2, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateObjectLiteralFactory(Lcom/trendmicro/hippo/Node;I)V

    .line 1319
    goto :goto_3

    .line 1321
    :cond_4
    add-int/lit8 v4, v1, 0x1

    invoke-direct {p0, v2, v4}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateArrayLiteralFactory(Lcom/trendmicro/hippo/Node;I)V

    .line 1322
    nop

    .line 1313
    .end local v2    # "node":Lcom/trendmicro/hippo/Node;
    .end local v3    # "type":I
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1329
    .end local v1    # "i":I
    :cond_5
    return-void
.end method
