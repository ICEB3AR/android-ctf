.class public Lcom/trendmicro/hippo/ast/FunctionNode;
.super Lcom/trendmicro/hippo/ast/ScriptNode;
.source "FunctionNode.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/ast/FunctionNode$Form;
    }
.end annotation


# static fields
.field public static final ARROW_FUNCTION:I = 0x4

.field public static final FUNCTION_EXPRESSION:I = 0x2

.field public static final FUNCTION_EXPRESSION_STATEMENT:I = 0x3

.field public static final FUNCTION_STATEMENT:I = 0x1

.field private static final NO_PARAMS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private body:Lcom/trendmicro/hippo/ast/AstNode;

.field private functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

.field private functionName:Lcom/trendmicro/hippo/ast/Name;

.field private functionType:I

.field private generatorResumePoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/Node;",
            ">;"
        }
    .end annotation
.end field

.field private isExpressionClosure:Z

.field private isGenerator:Z

.field private liveLocals:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/trendmicro/hippo/Node;",
            "[I>;"
        }
    .end annotation
.end field

.field private lp:I

.field private memberExprNode:Lcom/trendmicro/hippo/ast/AstNode;

.field private needsActivation:Z

.field private params:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation
.end field

.field private rp:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 71
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ast/FunctionNode;->NO_PARAMS:Ljava/util/List;

    .line 70
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 93
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/ScriptNode;-><init>()V

    .line 77
    sget-object v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->FUNCTION:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    .line 78
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->lp:I

    .line 79
    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->rp:I

    .line 90
    const/16 v0, 0x6e

    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->type:I

    .line 94
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 97
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/ScriptNode;-><init>(I)V

    .line 77
    sget-object v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->FUNCTION:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    .line 78
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->lp:I

    .line 79
    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->rp:I

    .line 90
    const/16 v0, 0x6e

    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->type:I

    .line 98
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/ast/Name;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "name"    # Lcom/trendmicro/hippo/ast/Name;

    .line 101
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/ScriptNode;-><init>(I)V

    .line 77
    sget-object v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->FUNCTION:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    .line 78
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->lp:I

    .line 79
    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->rp:I

    .line 90
    const/16 v0, 0x6e

    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->type:I

    .line 102
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/FunctionNode;->setFunctionName(Lcom/trendmicro/hippo/ast/Name;)V

    .line 103
    return-void
.end method


# virtual methods
.method public addFunction(Lcom/trendmicro/hippo/ast/FunctionNode;)I
    .locals 2
    .param p1, "fnNode"    # Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 311
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->addFunction(Lcom/trendmicro/hippo/ast/FunctionNode;)I

    move-result v0

    .line 312
    .local v0, "result":I
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionCount()I

    move-result v1

    if-lez v1, :cond_0

    .line 313
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->needsActivation:Z

    .line 315
    :cond_0
    return v0
.end method

.method public addLiveLocals(Lcom/trendmicro/hippo/Node;[I)V
    .locals 1
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "locals"    # [I

    .line 304
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->liveLocals:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 305
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->liveLocals:Ljava/util/Map;

    .line 306
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->liveLocals:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    return-void
.end method

.method public addParam(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "param"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 163
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->assertNotNull(Ljava/lang/Object;)V

    .line 164
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->params:Ljava/util/List;

    if-nez v0, :cond_0

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->params:Ljava/util/List;

    .line 167
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->params:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 169
    return-void
.end method

.method public addResumptionPoint(Lcom/trendmicro/hippo/Node;)V
    .locals 1
    .param p1, "target"    # Lcom/trendmicro/hippo/Node;

    .line 290
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->generatorResumePoints:Ljava/util/List;

    if-nez v0, :cond_0

    .line 291
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->generatorResumePoints:Ljava/util/List;

    .line 292
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->generatorResumePoints:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    return-void
.end method

.method public getBody()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->body:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getFunctionName()Lcom/trendmicro/hippo/ast/Name;
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionName:Lcom/trendmicro/hippo/ast/Name;

    return-object v0
.end method

.method public getFunctionType()I
    .locals 1

    .line 322
    iget v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionType:I

    return v0
.end method

.method public getLiveLocals()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/trendmicro/hippo/Node;",
            "[I>;"
        }
    .end annotation

    .line 300
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->liveLocals:Ljava/util/Map;

    return-object v0
.end method

.method public getLp()I
    .locals 1

    .line 217
    iget v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->lp:I

    return v0
.end method

.method public getMemberExprNode()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 374
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->memberExprNode:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionName:Lcom/trendmicro/hippo/ast/Name;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public getParams()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation

    .line 137
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->params:Ljava/util/List;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ast/FunctionNode;->NO_PARAMS:Ljava/util/List;

    :goto_0
    return-object v0
.end method

.method public getResumptionPoints()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/Node;",
            ">;"
        }
    .end annotation

    .line 296
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->generatorResumePoints:Ljava/util/List;

    return-object v0
.end method

.method public getRp()I
    .locals 1

    .line 231
    iget v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->rp:I

    return v0
.end method

.method public isExpressionClosure()Z
    .locals 1

    .line 253
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->isExpressionClosure:Z

    return v0
.end method

.method public isGenerator()Z
    .locals 1

    .line 282
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->isGenerator:Z

    return v0
.end method

.method public isGetterMethod()Z
    .locals 2

    .line 334
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    sget-object v1, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->GETTER:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isMethod()Z
    .locals 2

    .line 330
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    sget-object v1, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->GETTER:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    sget-object v1, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->SETTER:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    sget-object v1, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->METHOD:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isNormalMethod()Z
    .locals 2

    .line 342
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    sget-object v1, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->METHOD:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isParam(Lcom/trendmicro/hippo/ast/AstNode;)Z
    .locals 1
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 177
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->params:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method public isSetterMethod()Z
    .locals 2

    .line 338
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    sget-object v1, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->SETTER:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public requiresActivation()Z
    .locals 1

    .line 274
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->needsActivation:Z

    return v0
.end method

.method public setBody(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 2
    .param p1, "body"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 202
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->assertNotNull(Ljava/lang/Object;)V

    .line 203
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->body:Lcom/trendmicro/hippo/ast/AstNode;

    .line 204
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v1, 0x19

    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/ast/AstNode;->getProp(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 205
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->setIsExpressionClosure(Z)V

    .line 207
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v1

    add-int/2addr v0, v1

    .line 208
    .local v0, "absEnd":I
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 209
    iget v1, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->position:I

    sub-int v1, v0, v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->setLength(I)V

    .line 210
    iget v1, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->position:I

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->setEncodedSourceBounds(II)V

    .line 211
    return-void
.end method

.method public setFunctionIsGetterMethod()V
    .locals 1

    .line 346
    sget-object v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->GETTER:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    .line 347
    return-void
.end method

.method public setFunctionIsNormalMethod()V
    .locals 1

    .line 354
    sget-object v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->METHOD:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    .line 355
    return-void
.end method

.method public setFunctionIsSetterMethod()V
    .locals 1

    .line 350
    sget-object v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->SETTER:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionForm:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    .line 351
    return-void
.end method

.method public setFunctionName(Lcom/trendmicro/hippo/ast/Name;)V
    .locals 0
    .param p1, "name"    # Lcom/trendmicro/hippo/ast/Name;

    .line 118
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionName:Lcom/trendmicro/hippo/ast/Name;

    .line 119
    if-eqz p1, :cond_0

    .line 120
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/Name;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 121
    :cond_0
    return-void
.end method

.method public setFunctionType(I)V
    .locals 0
    .param p1, "type"    # I

    .line 326
    iput p1, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionType:I

    .line 327
    return-void
.end method

.method public setIsExpressionClosure(Z)V
    .locals 0
    .param p1, "isExpressionClosure"    # Z

    .line 260
    iput-boolean p1, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->isExpressionClosure:Z

    .line 261
    return-void
.end method

.method public setIsGenerator()V
    .locals 1

    .line 286
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->isGenerator:Z

    .line 287
    return-void
.end method

.method public setLp(I)V
    .locals 0
    .param p1, "lp"    # I

    .line 224
    iput p1, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->lp:I

    .line 225
    return-void
.end method

.method public setMemberExprNode(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 368
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->memberExprNode:Lcom/trendmicro/hippo/ast/AstNode;

    .line 369
    if-eqz p1, :cond_0

    .line 370
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 371
    :cond_0
    return-void
.end method

.method public setParams(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;)V"
        }
    .end annotation

    .line 146
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    if-nez p1, :cond_0

    .line 147
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->params:Ljava/util/List;

    goto :goto_1

    .line 149
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->params:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 150
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 151
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/AstNode;

    .line 152
    .local v1, "param":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->addParam(Lcom/trendmicro/hippo/ast/AstNode;)V

    .end local v1    # "param":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 154
    :cond_2
    :goto_1
    return-void
.end method

.method public setParens(II)V
    .locals 0
    .param p1, "lp"    # I
    .param p2, "rp"    # I

    .line 245
    iput p1, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->lp:I

    .line 246
    iput p2, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->rp:I

    .line 247
    return-void
.end method

.method public setRequiresActivation()V
    .locals 1

    .line 278
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->needsActivation:Z

    .line 279
    return-void
.end method

.method public setRp(I)V
    .locals 0
    .param p1, "rp"    # I

    .line 238
    iput p1, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->rp:I

    .line 239
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 8
    .param p1, "depth"    # I

    .line 379
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 380
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget v1, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionType:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x4

    if-ne v1, v4, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    .line 381
    .local v1, "isArrow":Z
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/FunctionNode;->isMethod()Z

    move-result v4

    if-nez v4, :cond_1

    .line 382
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->makeIndent(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    if-nez v1, :cond_1

    .line 384
    const-string v4, "function"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    :cond_1
    iget-object v4, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionName:Lcom/trendmicro/hippo/ast/Name;

    const-string v5, " "

    if-eqz v4, :cond_2

    .line 388
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    iget-object v4, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionName:Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/ast/Name;->toSource(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    :cond_2
    iget-object v4, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->params:Ljava/util/List;

    if-nez v4, :cond_3

    .line 392
    const-string v4, "() "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 393
    :cond_3
    if-eqz v1, :cond_4

    iget v6, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->lp:I

    const/4 v7, -0x1

    if-ne v6, v7, :cond_4

    .line 395
    invoke-virtual {p0, v4, v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->printList(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 396
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 398
    :cond_4
    const-string v4, "("

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    iget-object v4, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->params:Ljava/util/List;

    invoke-virtual {p0, v4, v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->printList(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 400
    const-string v4, ") "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    :goto_1
    if-eqz v1, :cond_5

    .line 403
    const-string v4, "=> "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    :cond_5
    iget-boolean v4, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->isExpressionClosure:Z

    if-eqz v4, :cond_8

    .line 406
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getBody()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    .line 407
    .local v4, "body":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/AstNode;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    instance-of v6, v6, Lcom/trendmicro/hippo/ast/ReturnStatement;

    if-eqz v6, :cond_6

    .line 409
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/AstNode;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/ast/ReturnStatement;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/ReturnStatement;->getReturnValue()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    .line 410
    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    iget v3, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionType:I

    if-ne v3, v2, :cond_7

    .line 412
    const-string v3, ";"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 416
    :cond_6
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 417
    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 419
    .end local v4    # "body":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_7
    :goto_2
    goto :goto_3

    .line 420
    :cond_8
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getBody()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 422
    :goto_3
    iget v3, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionType:I

    if-eq v3, v2, :cond_9

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/FunctionNode;->isMethod()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 423
    :cond_9
    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    :cond_a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 435
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 436
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->functionName:Lcom/trendmicro/hippo/ast/Name;

    if-eqz v0, :cond_0

    .line 437
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Name;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 439
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParams()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/AstNode;

    .line 440
    .local v1, "param":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 441
    .end local v1    # "param":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 442
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getBody()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 443
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->isExpressionClosure:Z

    if-nez v0, :cond_2

    .line 444
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionNode;->memberExprNode:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_2

    .line 445
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 449
    :cond_2
    return-void
.end method
