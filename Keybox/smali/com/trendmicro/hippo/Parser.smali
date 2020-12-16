.class public Lcom/trendmicro/hippo/Parser;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/Parser$ParserException;,
        Lcom/trendmicro/hippo/Parser$PerFunctionVariables;,
        Lcom/trendmicro/hippo/Parser$ConditionData;
    }
.end annotation


# static fields
.field public static final ARGC_LIMIT:I = 0x10000

.field static final CLEAR_TI_MASK:I = 0xffff

.field private static final GET_ENTRY:I = 0x2

.field private static final METHOD_ENTRY:I = 0x8

.field private static final PROP_ENTRY:I = 0x1

.field private static final SET_ENTRY:I = 0x4

.field static final TI_AFTER_EOL:I = 0x10000

.field static final TI_CHECK_LABEL:I = 0x20000


# instance fields
.field calledByCompileFunction:Z

.field compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

.field private currentFlaggedToken:I

.field private currentJsDocComment:Lcom/trendmicro/hippo/ast/Comment;

.field private currentLabel:Lcom/trendmicro/hippo/ast/LabeledStatement;

.field currentScope:Lcom/trendmicro/hippo/ast/Scope;

.field currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

.field private currentToken:I

.field private defaultUseStrictDirective:Z

.field private endFlags:I

.field private errorCollector:Lcom/trendmicro/hippo/ast/IdeErrorReporter;

.field private errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

.field private inDestructuringAssignment:Z

.field private inForInit:Z

.field protected inUseStrictDirective:Z

.field private labelSet:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/ast/LabeledStatement;",
            ">;"
        }
    .end annotation
.end field

.field private loopAndSwitchSet:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Jump;",
            ">;"
        }
    .end annotation
.end field

.field private loopSet:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Loop;",
            ">;"
        }
    .end annotation
.end field

.field protected nestingOfFunction:I

.field private parseFinished:Z

.field private prevNameTokenLineno:I

.field private prevNameTokenStart:I

.field private prevNameTokenString:Ljava/lang/String;

.field private scannedComments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Comment;",
            ">;"
        }
    .end annotation
.end field

.field private sourceChars:[C

.field private sourceURI:Ljava/lang/String;

.field private syntaxErrorCount:I

.field private ts:Lcom/trendmicro/hippo/TokenStream;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 168
    new-instance v0, Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-direct {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;-><init>()V

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Parser;-><init>(Lcom/trendmicro/hippo/CompilerEnvirons;)V

    .line 169
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/CompilerEnvirons;)V
    .locals 1
    .param p1, "compilerEnv"    # Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 172
    invoke-virtual {p1}, Lcom/trendmicro/hippo/CompilerEnvirons;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/Parser;-><init>(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ErrorReporter;)V

    .line 173
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ErrorReporter;)V
    .locals 1
    .param p1, "compilerEnv"    # Lcom/trendmicro/hippo/CompilerEnvirons;
    .param p2, "errorReporter"    # Lcom/trendmicro/hippo/ErrorReporter;

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    .line 156
    const-string v0, ""

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser;->prevNameTokenString:Ljava/lang/String;

    .line 176
    iput-object p1, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 177
    iput-object p2, p0, Lcom/trendmicro/hippo/Parser;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    .line 178
    instance-of v0, p2, Lcom/trendmicro/hippo/ast/IdeErrorReporter;

    if-eqz v0, :cond_0

    .line 179
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/ast/IdeErrorReporter;

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser;->errorCollector:Lcom/trendmicro/hippo/ast/IdeErrorReporter;

    .line 181
    :cond_0
    return-void
.end method

.method static synthetic access$200(Lcom/trendmicro/hippo/Parser;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/Parser;

    .line 104
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->labelSet:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$202(Lcom/trendmicro/hippo/Parser;Ljava/util/Map;)Ljava/util/Map;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/Parser;
    .param p1, "x1"    # Ljava/util/Map;

    .line 104
    iput-object p1, p0, Lcom/trendmicro/hippo/Parser;->labelSet:Ljava/util/Map;

    return-object p1
.end method

.method static synthetic access$300(Lcom/trendmicro/hippo/Parser;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/Parser;

    .line 104
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopSet:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$302(Lcom/trendmicro/hippo/Parser;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/Parser;
    .param p1, "x1"    # Ljava/util/List;

    .line 104
    iput-object p1, p0, Lcom/trendmicro/hippo/Parser;->loopSet:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$400(Lcom/trendmicro/hippo/Parser;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/Parser;

    .line 104
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopAndSwitchSet:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$402(Lcom/trendmicro/hippo/Parser;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/Parser;
    .param p1, "x1"    # Ljava/util/List;

    .line 104
    iput-object p1, p0, Lcom/trendmicro/hippo/Parser;->loopAndSwitchSet:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$500(Lcom/trendmicro/hippo/Parser;)I
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/Parser;

    .line 104
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->endFlags:I

    return v0
.end method

.method static synthetic access$502(Lcom/trendmicro/hippo/Parser;I)I
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/Parser;
    .param p1, "x1"    # I

    .line 104
    iput p1, p0, Lcom/trendmicro/hippo/Parser;->endFlags:I

    return p1
.end method

.method static synthetic access$600(Lcom/trendmicro/hippo/Parser;)Z
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/Parser;

    .line 104
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    return v0
.end method

.method static synthetic access$602(Lcom/trendmicro/hippo/Parser;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/Parser;
    .param p1, "x1"    # Z

    .line 104
    iput-boolean p1, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    return p1
.end method

.method private addError(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I)V
    .locals 7
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I
    .param p5, "line"    # I
    .param p6, "lineSource"    # Ljava/lang/String;
    .param p7, "lineOffset"    # I

    .line 287
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->syntaxErrorCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/trendmicro/hippo/Parser;->syntaxErrorCount:I

    .line 288
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/Parser;->lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 289
    .local v0, "message":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->errorCollector:Lcom/trendmicro/hippo/ast/IdeErrorReporter;

    if-eqz v1, :cond_0

    .line 290
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    invoke-interface {v1, v0, v2, p3, p4}, Lcom/trendmicro/hippo/ast/IdeErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_0

    .line 292
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    move-object v2, v0

    move v4, p5

    move-object v5, p6

    move v6, p7

    invoke-interface/range {v1 .. v6}, Lcom/trendmicro/hippo/ErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 294
    :goto_0
    return-void
.end method

.method private addExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2539
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->mulExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 2541
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v1

    .local v1, "tt":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2542
    .local v2, "opPos":I
    const/16 v3, 0x15

    if-eq v1, v3, :cond_1

    const/16 v3, 0x16

    if-ne v1, v3, :cond_0

    goto :goto_1

    .line 2549
    .end local v1    # "tt":I
    .end local v2    # "opPos":I
    :cond_0
    return-object v0

    .line 2543
    .restart local v1    # "tt":I
    .restart local v2    # "opPos":I
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2544
    new-instance v3, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->mulExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v3, v1, v0, v4, v2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    move-object v0, v3

    .line 2545
    goto :goto_0
.end method

.method private addStrictWarning(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I
    .param p5, "line"    # I
    .param p6, "lineSource"    # Ljava/lang/String;
    .param p7, "lineOffset"    # I

    .line 266
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->isStrictMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 267
    invoke-direct/range {p0 .. p7}, Lcom/trendmicro/hippo/Parser;->addWarning(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I)V

    .line 269
    :cond_0
    return-void
.end method

.method private addWarning(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I)V
    .locals 7
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I
    .param p5, "line"    # I
    .param p6, "lineSource"    # Ljava/lang/String;
    .param p7, "lineOffset"    # I

    .line 274
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/Parser;->lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 275
    .local v6, "message":Ljava/lang/String;
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->reportWarningAsError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 276
    invoke-direct/range {p0 .. p7}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I)V

    goto :goto_0

    .line 277
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->errorCollector:Lcom/trendmicro/hippo/ast/IdeErrorReporter;

    if-eqz v0, :cond_1

    .line 278
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    invoke-interface {v0, v6, v1, p3, p4}, Lcom/trendmicro/hippo/ast/IdeErrorReporter;->warning(Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_0

    .line 280
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    move-object v1, v6

    move v3, p5

    move-object v4, p6

    move v5, p7

    invoke-interface/range {v0 .. v5}, Lcom/trendmicro/hippo/ErrorReporter;->warning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 282
    :goto_0
    return-void
.end method

.method private andExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2423
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->bitOrExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 2424
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v1, 0x6a

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2425
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2426
    .local v2, "opPos":I
    new-instance v3, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->andExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v3, v1, v0, v4, v2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    move-object v0, v3

    .line 2428
    .end local v2    # "opPos":I
    :cond_0
    return-object v0
.end method

.method private argumentList()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2692
    const/16 v0, 0x59

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2693
    const/4 v0, 0x0

    return-object v0

    .line 2695
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 2696
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    iget-boolean v3, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 2697
    .local v3, "wasInForInit":Z
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 2700
    :cond_1
    :try_start_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v5

    if-ne v5, v0, :cond_2

    .line 2702
    goto :goto_2

    .line 2704
    :cond_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v5

    const/16 v6, 0x49

    if-ne v5, v6, :cond_3

    .line 2705
    const-string v5, "msg.yield.parenthesized"

    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2707
    :cond_3
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->assignExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    .line 2708
    .local v5, "en":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v7, 0x78

    if-ne v6, v7, :cond_4

    .line 2710
    :try_start_1
    invoke-direct {p0, v5, v4, v1}, Lcom/trendmicro/hippo/Parser;->generatorExpression(Lcom/trendmicro/hippo/ast/AstNode;IZ)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2712
    :catch_0
    move-exception v6

    .line 2714
    :goto_0
    goto :goto_1

    .line 2717
    :cond_4
    :try_start_2
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2719
    .end local v5    # "en":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_1
    const/16 v5, 0x5a

    invoke-direct {p0, v5, v1}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v5, :cond_1

    .line 2721
    :goto_2
    iput-boolean v3, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 2722
    nop

    .line 2724
    const-string v4, "msg.no.paren.arg"

    invoke-direct {p0, v0, v4, v1}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 2725
    return-object v2

    .line 2721
    :catchall_0
    move-exception v0

    iput-boolean v3, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 2722
    throw v0
.end method

.method private arrayComprehension(Lcom/trendmicro/hippo/ast/AstNode;I)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 6
    .param p1, "result"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3328
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3330
    .local v0, "loops":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;>;"
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v1

    const/16 v2, 0x78

    if-ne v1, v2, :cond_0

    .line 3331
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->arrayComprehensionLoop()Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 3333
    :cond_0
    const/4 v1, -0x1

    .line 3334
    .local v1, "ifPos":I
    const/4 v2, 0x0

    .line 3335
    .local v2, "data":Lcom/trendmicro/hippo/Parser$ConditionData;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v3

    const/16 v4, 0x71

    if-ne v3, v4, :cond_1

    .line 3336
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3337
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v1, v3, p2

    .line 3338
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->condition()Lcom/trendmicro/hippo/Parser$ConditionData;

    move-result-object v2

    .line 3340
    :cond_1
    const/16 v3, 0x55

    const/4 v4, 0x1

    const-string v5, "msg.no.bracket.arg"

    invoke-direct {p0, v3, v5, v4}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 3341
    new-instance v3, Lcom/trendmicro/hippo/ast/ArrayComprehension;

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v4, p2

    invoke-direct {v3, p2, v4}, Lcom/trendmicro/hippo/ast/ArrayComprehension;-><init>(II)V

    .line 3342
    .local v3, "pn":Lcom/trendmicro/hippo/ast/ArrayComprehension;
    invoke-virtual {v3, p1}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->setResult(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3343
    invoke-virtual {v3, v0}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->setLoops(Ljava/util/List;)V

    .line 3344
    if-eqz v2, :cond_2

    .line 3345
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->setIfPosition(I)V

    .line 3346
    iget-object v4, v2, Lcom/trendmicro/hippo/Parser$ConditionData;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->setFilter(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3347
    iget v4, v2, Lcom/trendmicro/hippo/Parser$ConditionData;->lp:I

    sub-int/2addr v4, p2

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->setFilterLp(I)V

    .line 3348
    iget v4, v2, Lcom/trendmicro/hippo/Parser$ConditionData;->rp:I

    sub-int/2addr v4, p2

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->setFilterRp(I)V

    .line 3350
    :cond_2
    return-object v3
.end method

.method private arrayComprehensionLoop()Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3356
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->nextToken()I

    move-result v0

    const/16 v1, 0x78

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 3357
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 3358
    .local v0, "pos":I
    const/4 v1, -0x1

    .local v1, "eachPos":I
    const/4 v2, -0x1

    .local v2, "lp":I
    const/4 v3, -0x1

    .local v3, "rp":I
    const/4 v4, -0x1

    .line 3359
    .local v4, "inPos":I
    const/4 v5, 0x0

    .line 3360
    .local v5, "isForOf":Z
    new-instance v6, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;

    invoke-direct {v6, v0}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;-><init>(I)V

    .line 3362
    .local v6, "pn":Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/Parser;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 3364
    const/16 v7, 0x27

    const/4 v8, 0x1

    :try_start_0
    invoke-direct {p0, v7, v8}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v10, "msg.no.paren.for"

    if-eqz v9, :cond_2

    .line 3365
    :try_start_1
    iget-object v9, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v9}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v9

    const-string v11, "each"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 3366
    iget-object v9, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v9, v9, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v1, v9, v0

    goto :goto_0

    .line 3368
    :cond_1
    invoke-virtual {p0, v10}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3371
    :cond_2
    :goto_0
    const/16 v9, 0x58

    invoke-direct {p0, v9, v10, v8}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 3372
    iget-object v9, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v9, v9, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v2, v9, v0

    .line 3375
    :cond_3
    const/4 v9, 0x0

    .line 3376
    .local v9, "iter":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v10

    if-eq v10, v7, :cond_5

    const/16 v11, 0x54

    if-eq v10, v11, :cond_4

    const/16 v11, 0x56

    if-eq v10, v11, :cond_4

    .line 3388
    const-string v10, "msg.bad.var"

    invoke-virtual {p0, v10}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    goto :goto_1

    .line 3380
    :cond_4
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->destructuringPrimaryExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v10

    move-object v9, v10

    .line 3381
    invoke-virtual {p0, v9}, Lcom/trendmicro/hippo/Parser;->markDestructuring(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3382
    goto :goto_1

    .line 3384
    :cond_5
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3385
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->createNameNode()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v10

    move-object v9, v10

    .line 3386
    nop

    .line 3393
    :goto_1
    invoke-virtual {v9}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v10

    if-ne v10, v7, :cond_6

    .line 3394
    const/16 v10, 0x9a

    iget-object v11, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v11}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v10, v11, v8}, Lcom/trendmicro/hippo/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 3397
    :cond_6
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->nextToken()I

    move-result v10

    const/4 v11, -0x1

    if-eq v10, v7, :cond_8

    const/16 v7, 0x34

    if-eq v10, v7, :cond_7

    goto :goto_2

    .line 3399
    :cond_7
    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v7, v7, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v4, v7, v0

    .line 3400
    goto :goto_3

    .line 3402
    :cond_8
    const-string v7, "of"

    iget-object v10, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v10}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 3403
    if-eq v1, v11, :cond_9

    .line 3404
    const-string v7, "msg.invalid.for.each"

    invoke-virtual {p0, v7}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3406
    :cond_9
    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v7, v7, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v4, v7, v0

    .line 3407
    const/4 v5, 0x1

    .line 3408
    goto :goto_3

    .line 3412
    :cond_a
    :goto_2
    const-string v7, "msg.in.after.for.name"

    invoke-virtual {p0, v7}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3414
    :goto_3
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v7

    .line 3415
    .local v7, "obj":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v10, 0x59

    const-string v12, "msg.no.paren.for.ctrl"

    invoke-direct {p0, v10, v12, v8}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_b

    .line 3416
    iget-object v10, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v10, v10, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v3, v10, v0

    .line 3418
    :cond_b
    iget-object v10, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v10, v10, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v10, v0

    invoke-virtual {v6, v10}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->setLength(I)V

    .line 3419
    invoke-virtual {v6, v9}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->setIterator(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3420
    invoke-virtual {v6, v7}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->setIteratedObject(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3421
    invoke-virtual {v6, v4}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->setInPosition(I)V

    .line 3422
    invoke-virtual {v6, v1}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->setEachPosition(I)V

    .line 3423
    if-eq v1, v11, :cond_c

    goto :goto_4

    :cond_c
    const/4 v8, 0x0

    :goto_4
    invoke-virtual {v6, v8}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->setIsForEach(Z)V

    .line 3424
    invoke-virtual {v6, v2, v3}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->setParens(II)V

    .line 3425
    invoke-virtual {v6, v5}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->setIsForOf(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3426
    nop

    .line 3428
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 3426
    return-object v6

    .line 3428
    .end local v7    # "obj":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v9    # "iter":Lcom/trendmicro/hippo/ast/AstNode;
    :catchall_0
    move-exception v7

    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 3429
    throw v7
.end method

.method private arrayLiteral()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3265
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x54

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 3266
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v0, "pos":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 3267
    .local v1, "end":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3268
    .local v2, "elements":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    new-instance v3, Lcom/trendmicro/hippo/ast/ArrayLiteral;

    invoke-direct {v3, v0}, Lcom/trendmicro/hippo/ast/ArrayLiteral;-><init>(I)V

    .line 3269
    .local v3, "pn":Lcom/trendmicro/hippo/ast/ArrayLiteral;
    const/4 v4, 0x1

    .line 3270
    .local v4, "after_lb_or_comma":Z
    const/4 v5, -0x1

    .line 3271
    .local v5, "afterComma":I
    const/4 v6, 0x0

    .line 3273
    .local v6, "skipCount":I
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v7

    .line 3274
    .local v7, "tt":I
    const/16 v8, 0x5a

    const/4 v9, 0x1

    if-ne v7, v8, :cond_2

    .line 3275
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3276
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v8, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 3277
    if-nez v4, :cond_1

    .line 3278
    const/4 v4, 0x1

    goto/16 :goto_3

    .line 3280
    :cond_1
    new-instance v8, Lcom/trendmicro/hippo/ast/EmptyExpression;

    iget-object v10, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v10, v10, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-direct {v8, v10, v9}, Lcom/trendmicro/hippo/ast/EmptyExpression;-><init>(II)V

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3281
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 3283
    :cond_2
    const/16 v8, 0x55

    if-ne v7, v8, :cond_3

    .line 3284
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3290
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v8, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 3291
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v8

    .line 3292
    add-int/2addr v8, v4

    .line 3291
    invoke-virtual {v3, v8}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->setDestructuringLength(I)V

    .line 3293
    invoke-virtual {v3, v6}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->setSkipCount(I)V

    .line 3294
    const/4 v8, -0x1

    if-eq v5, v8, :cond_5

    .line 3295
    invoke-direct {p0, v0, v2, v5}, Lcom/trendmicro/hippo/Parser;->warnTrailingComma(ILjava/util/List;I)V

    goto :goto_1

    .line 3297
    :cond_3
    const/16 v8, 0x78

    if-ne v7, v8, :cond_4

    if-nez v4, :cond_4

    .line 3298
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v8

    if-ne v8, v9, :cond_4

    .line 3299
    const/4 v8, 0x0

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-direct {p0, v8, v0}, Lcom/trendmicro/hippo/Parser;->arrayComprehension(Lcom/trendmicro/hippo/ast/AstNode;I)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v8

    return-object v8

    .line 3300
    :cond_4
    const-string v8, "msg.no.bracket.arg"

    if-nez v7, :cond_7

    .line 3301
    invoke-virtual {p0, v8}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3302
    nop

    .line 3312
    .end local v7    # "tt":I
    :cond_5
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/trendmicro/hippo/ast/AstNode;

    .line 3313
    .local v8, "e":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v3, v8}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->addElement(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3314
    .end local v8    # "e":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_2

    .line 3315
    :cond_6
    sub-int v7, v1, v0

    invoke-virtual {v3, v7}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->setLength(I)V

    .line 3316
    return-object v3

    .line 3304
    .restart local v7    # "tt":I
    :cond_7
    if-nez v4, :cond_8

    .line 3305
    invoke-virtual {p0, v8}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3307
    :cond_8
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->assignExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v8

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3308
    const/4 v4, 0x0

    .line 3309
    const/4 v5, -0x1

    .line 3311
    .end local v7    # "tt":I
    :goto_3
    goto/16 :goto_0
.end method

.method private arrowFunction(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 13
    .param p1, "params"    # Lcom/trendmicro/hippo/ast/AstNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 976
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 977
    .local v0, "baseLineno":I
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, -0x1

    .line 979
    .local v1, "functionSourceStart":I
    :goto_0
    new-instance v2, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-direct {v2, v1}, Lcom/trendmicro/hippo/ast/FunctionNode;-><init>(I)V

    .line 980
    .local v2, "fnNode":Lcom/trendmicro/hippo/ast/FunctionNode;
    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->setFunctionType(I)V

    .line 981
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/ast/FunctionNode;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    .line 985
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 986
    .local v4, "destructuring":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Node;>;"
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 988
    .local v5, "paramNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v6, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;

    invoke-direct {v6, p0, v2}, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;-><init>(Lcom/trendmicro/hippo/Parser;Lcom/trendmicro/hippo/ast/FunctionNode;)V

    .line 990
    .local v6, "savedVars":Lcom/trendmicro/hippo/Parser$PerFunctionVariables;
    :try_start_0
    instance-of v7, p1, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;

    if-eqz v7, :cond_2

    .line 991
    const/4 v7, 0x0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v8

    invoke-virtual {v2, v7, v8}, Lcom/trendmicro/hippo/ast/FunctionNode;->setParens(II)V

    .line 992
    move-object v7, p1

    check-cast v7, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v7

    .line 993
    .local v7, "p":Lcom/trendmicro/hippo/ast/AstNode;
    instance-of v8, v7, Lcom/trendmicro/hippo/ast/EmptyExpression;

    if-nez v8, :cond_1

    .line 994
    invoke-direct {p0, v2, v7, v4, v5}, Lcom/trendmicro/hippo/Parser;->arrowFunctionParams(Lcom/trendmicro/hippo/ast/FunctionNode;Lcom/trendmicro/hippo/ast/AstNode;Ljava/util/Map;Ljava/util/Set;)V

    .line 996
    .end local v7    # "p":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_1
    goto :goto_1

    .line 997
    :cond_2
    invoke-direct {p0, v2, p1, v4, v5}, Lcom/trendmicro/hippo/Parser;->arrowFunctionParams(Lcom/trendmicro/hippo/ast/FunctionNode;Lcom/trendmicro/hippo/ast/AstNode;Ljava/util/Map;Ljava/util/Set;)V

    .line 1000
    :goto_1
    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4

    .line 1001
    new-instance v7, Lcom/trendmicro/hippo/Node;

    const/16 v8, 0x5a

    invoke-direct {v7, v8}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 1003
    .local v7, "destructuringNode":Lcom/trendmicro/hippo/Node;
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 1004
    .local v9, "param":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/trendmicro/hippo/Node;>;"
    const/16 v10, 0x7b

    .line 1005
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/trendmicro/hippo/Node;

    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {p0, v12}, Lcom/trendmicro/hippo/Parser;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v12

    .line 1004
    invoke-virtual {p0, v10, v11, v12}, Lcom/trendmicro/hippo/Parser;->createDestructuringAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v10

    .line 1006
    .local v10, "assign":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v7, v10}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1008
    .end local v9    # "param":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/trendmicro/hippo/Node;>;"
    .end local v10    # "assign":Lcom/trendmicro/hippo/Node;
    goto :goto_2

    .line 1009
    :cond_3
    const/16 v8, 0x17

    invoke-virtual {v2, v8, v7}, Lcom/trendmicro/hippo/ast/FunctionNode;->putProp(ILjava/lang/Object;)V

    .line 1012
    .end local v7    # "destructuringNode":Lcom/trendmicro/hippo/Node;
    :cond_4
    invoke-direct {p0, v3, v2}, Lcom/trendmicro/hippo/Parser;->parseFunctionBody(ILcom/trendmicro/hippo/ast/FunctionNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->setBody(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1013
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    invoke-virtual {v2, v1, v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->setEncodedSourceBounds(II)V

    .line 1014
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v3, v1

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->setLength(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1016
    invoke-virtual {v6}, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->restore()V

    .line 1017
    nop

    .line 1019
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/FunctionNode;->isGenerator()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1020
    const-string v3, "msg.arrowfunction.generator"

    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1021
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;

    move-result-object v3

    return-object v3

    .line 1024
    :cond_5
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->setSourceName(Ljava/lang/String;)V

    .line 1025
    invoke-virtual {v2, v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->setBaseLineno(I)V

    .line 1026
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->setEndLineno(I)V

    .line 1028
    return-object v2

    .line 1016
    :catchall_0
    move-exception v3

    invoke-virtual {v6}, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->restore()V

    .line 1017
    throw v3
.end method

.method private arrowFunctionParams(Lcom/trendmicro/hippo/ast/FunctionNode;Lcom/trendmicro/hippo/ast/AstNode;Ljava/util/Map;Ljava/util/Set;)V
    .locals 3
    .param p1, "fnNode"    # Lcom/trendmicro/hippo/ast/FunctionNode;
    .param p2, "params"    # Lcom/trendmicro/hippo/ast/AstNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/ast/FunctionNode;",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/Node;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1032
    .local p3, "destructuring":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Node;>;"
    .local p4, "paramNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    instance-of v0, p2, Lcom/trendmicro/hippo/ast/ArrayLiteral;

    const/16 v1, 0x58

    if-nez v0, :cond_7

    instance-of v0, p2, Lcom/trendmicro/hippo/ast/ObjectLiteral;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1038
    :cond_0
    instance-of v0, p2, Lcom/trendmicro/hippo/ast/InfixExpression;

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v0

    const/16 v2, 0x5a

    if-ne v0, v2, :cond_1

    .line 1039
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/InfixExpression;->getLeft()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3, p4}, Lcom/trendmicro/hippo/Parser;->arrowFunctionParams(Lcom/trendmicro/hippo/ast/FunctionNode;Lcom/trendmicro/hippo/ast/AstNode;Ljava/util/Map;Ljava/util/Set;)V

    .line 1040
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/InfixExpression;->getRight()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3, p4}, Lcom/trendmicro/hippo/Parser;->arrowFunctionParams(Lcom/trendmicro/hippo/ast/FunctionNode;Lcom/trendmicro/hippo/ast/AstNode;Ljava/util/Map;Ljava/util/Set;)V

    goto :goto_1

    .line 1041
    :cond_1
    instance-of v0, p2, Lcom/trendmicro/hippo/ast/Name;

    if-eqz v0, :cond_6

    .line 1042
    invoke-virtual {p1, p2}, Lcom/trendmicro/hippo/ast/FunctionNode;->addParam(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1043
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    .line 1044
    .local v0, "paramName":Ljava/lang/String;
    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/Parser;->defineSymbol(ILjava/lang/String;)V

    .line 1046
    iget-boolean v1, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    if-eqz v1, :cond_5

    .line 1047
    const-string v1, "eval"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1048
    const-string v1, "arguments"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1050
    :cond_2
    const-string v1, "msg.bad.id.strict"

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1052
    :cond_3
    invoke-interface {p4, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1053
    const-string v1, "msg.dup.param.strict"

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1054
    :cond_4
    invoke-interface {p4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1056
    .end local v0    # "paramName":Ljava/lang/String;
    :cond_5
    goto :goto_1

    .line 1057
    :cond_6
    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v0

    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v1

    const-string v2, "msg.no.parm"

    invoke-virtual {p0, v2, v0, v1}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;II)V

    .line 1058
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->addParam(Lcom/trendmicro/hippo/ast/AstNode;)V

    goto :goto_1

    .line 1033
    :cond_7
    :goto_0
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/Parser;->markDestructuring(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1034
    invoke-virtual {p1, p2}, Lcom/trendmicro/hippo/ast/FunctionNode;->addParam(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1035
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v0

    .line 1036
    .local v0, "pname":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Lcom/trendmicro/hippo/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 1037
    invoke-interface {p3, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1038
    .end local v0    # "pname":Ljava/lang/String;
    nop

    .line 1060
    :goto_1
    return-void
.end method

.method private assignExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2328
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0

    .line 2329
    .local v0, "tt":I
    const/4 v1, 0x1

    const/16 v2, 0x49

    if-ne v0, v2, :cond_0

    .line 2330
    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/Parser;->returnOrYield(IZ)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    return-object v1

    .line 2332
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->condExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 2333
    .local v2, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v3, 0x0

    .line 2334
    .local v3, "hasEOL":Z
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekTokenOrEOL()I

    move-result v0

    .line 2335
    if-ne v0, v1, :cond_1

    .line 2336
    const/4 v3, 0x1

    .line 2337
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0

    .line 2339
    :cond_1
    const/16 v1, 0x5b

    if-gt v1, v0, :cond_4

    const/16 v1, 0x66

    if-gt v0, v1, :cond_4

    .line 2340
    iget-boolean v1, p0, Lcom/trendmicro/hippo/Parser;->inDestructuringAssignment:Z

    if-eqz v1, :cond_2

    .line 2344
    const-string v1, "msg.destruct.default.vals"

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2347
    :cond_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2350
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v1

    .line 2352
    .local v1, "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/Parser;->markDestructuring(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2353
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2355
    .local v4, "opPos":I
    new-instance v5, Lcom/trendmicro/hippo/ast/Assignment;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->assignExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v6

    invoke-direct {v5, v0, v2, v6, v4}, Lcom/trendmicro/hippo/ast/Assignment;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    move-object v2, v5

    .line 2357
    if-eqz v1, :cond_3

    .line 2358
    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ast/AstNode;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    .line 2360
    .end local v1    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .end local v4    # "opPos":I
    :cond_3
    goto :goto_0

    :cond_4
    const/16 v1, 0x53

    if-ne v0, v1, :cond_5

    .line 2363
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->currentJsDocComment:Lcom/trendmicro/hippo/ast/Comment;

    if-eqz v1, :cond_6

    .line 2364
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ast/AstNode;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    goto :goto_0

    .line 2366
    :cond_5
    if-nez v3, :cond_6

    const/16 v1, 0xa5

    if-ne v0, v1, :cond_6

    .line 2367
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2368
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Parser;->arrowFunction(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 2370
    :cond_6
    :goto_0
    return-object v2
.end method

.method private attributeAccess()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2981
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->nextToken()I

    move-result v0

    .local v0, "tt":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2983
    .local v1, "atPos":I
    const/16 v2, 0x17

    const/4 v3, 0x0

    if-eq v0, v2, :cond_2

    const/16 v2, 0x27

    if-eq v0, v2, :cond_1

    const/16 v2, 0x54

    if-eq v0, v2, :cond_0

    .line 2998
    const-string v2, "msg.no.name.after.xmlAttr"

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2999
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;

    move-result-object v2

    return-object v2

    .line 2995
    :cond_0
    const/4 v2, 0x0

    const/4 v3, -0x1

    invoke-direct {p0, v1, v2, v3}, Lcom/trendmicro/hippo/Parser;->xmlElemRef(ILcom/trendmicro/hippo/ast/Name;I)Lcom/trendmicro/hippo/ast/XmlElemRef;

    move-result-object v2

    return-object v2

    .line 2986
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2, v3}, Lcom/trendmicro/hippo/Parser;->propertyName(ILjava/lang/String;I)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    return-object v2

    .line 2990
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    const-string v5, "*"

    invoke-direct {p0, v2, v5, v4}, Lcom/trendmicro/hippo/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 2991
    invoke-direct {p0, v1, v5, v3}, Lcom/trendmicro/hippo/Parser;->propertyName(ILjava/lang/String;I)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    return-object v2
.end method

.method private autoInsertSemicolon(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 4
    .param p1, "pn"    # Lcom/trendmicro/hippo/ast/AstNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1280
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekFlaggedToken()I

    move-result v0

    .line 1281
    .local v0, "ttFlagged":I
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v1

    .line 1282
    .local v1, "pos":I
    const v2, 0xffff

    and-int/2addr v2, v0

    const/4 v3, -0x1

    if-eq v2, v3, :cond_2

    if-eqz v2, :cond_2

    const/16 v3, 0x53

    if-eq v2, v3, :cond_1

    const/16 v3, 0x57

    if-eq v2, v3, :cond_2

    .line 1298
    const/high16 v2, 0x10000

    and-int/2addr v2, v0

    if-nez v2, :cond_0

    .line 1300
    const-string v2, "msg.no.semi.stmt"

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    goto :goto_0

    .line 1302
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Parser;->nodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/Parser;->warnMissingSemi(II)V

    goto :goto_0

    .line 1285
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1287
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v2, v1

    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->setLength(I)V

    .line 1288
    goto :goto_0

    .line 1295
    :cond_2
    add-int/lit8 v2, v1, 0x1

    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Parser;->nodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/Parser;->warnMissingSemi(II)V

    .line 1296
    nop

    .line 1306
    :goto_0
    return-void
.end method

.method private bitAndExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2456
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->eqExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 2457
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    const/4 v1, 0x1

    const/16 v2, 0xb

    invoke-direct {p0, v2, v1}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2458
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2459
    .local v1, "opPos":I
    new-instance v3, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->eqExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v3, v2, v0, v4, v1}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    move-object v0, v3

    .line 2460
    .end local v1    # "opPos":I
    goto :goto_0

    .line 2461
    :cond_0
    return-object v0
.end method

.method private bitOrExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2434
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->bitXorExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 2435
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    const/4 v1, 0x1

    const/16 v2, 0x9

    invoke-direct {p0, v2, v1}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2436
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2437
    .local v1, "opPos":I
    new-instance v3, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->bitXorExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v3, v2, v0, v4, v1}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    move-object v0, v3

    .line 2438
    .end local v1    # "opPos":I
    goto :goto_0

    .line 2439
    :cond_0
    return-object v0
.end method

.method private bitXorExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2445
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->bitAndExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 2446
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    const/4 v1, 0x1

    const/16 v2, 0xa

    invoke-direct {p0, v2, v1}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2447
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2448
    .local v1, "opPos":I
    new-instance v3, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->bitAndExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v3, v2, v0, v4, v1}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    move-object v0, v3

    .line 2449
    .end local v1    # "opPos":I
    goto :goto_0

    .line 2450
    :cond_0
    return-object v0
.end method

.method private block()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1976
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x56

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1977
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1978
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1979
    .local v0, "pos":I
    new-instance v1, Lcom/trendmicro/hippo/ast/Scope;

    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/ast/Scope;-><init>(I)V

    .line 1980
    .local v1, "block":Lcom/trendmicro/hippo/ast/Scope;
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/Scope;->setLineno(I)V

    .line 1981
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/Parser;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 1983
    :try_start_0
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/Parser;->statements(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    .line 1984
    const/16 v2, 0x57

    const-string v3, "msg.no.brace.block"

    const/4 v4, 0x1

    invoke-direct {p0, v2, v3, v4}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 1985
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/Scope;->setLength(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1986
    nop

    .line 1988
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 1986
    return-object v1

    .line 1988
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 1989
    throw v2
.end method

.method private breakStatement()Lcom/trendmicro/hippo/ast/BreakStatement;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1791
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x79

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1792
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1793
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .local v0, "lineno":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v1, "pos":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 1794
    .local v2, "end":I
    const/4 v3, 0x0

    .line 1795
    .local v3, "breakLabel":Lcom/trendmicro/hippo/ast/Name;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekTokenOrEOL()I

    move-result v4

    const/16 v5, 0x27

    if-ne v4, v5, :cond_1

    .line 1796
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->createNameNode()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v3

    .line 1797
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v2

    .line 1801
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->matchJumpLabelName()Lcom/trendmicro/hippo/ast/LabeledStatement;

    move-result-object v4

    .line 1803
    .local v4, "labels":Lcom/trendmicro/hippo/ast/LabeledStatement;
    if-nez v4, :cond_2

    const/4 v5, 0x0

    goto :goto_0

    :cond_2
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getFirstLabel()Lcom/trendmicro/hippo/ast/Label;

    move-result-object v5

    .line 1805
    .local v5, "breakTarget":Lcom/trendmicro/hippo/ast/Jump;
    :goto_0
    if-nez v5, :cond_5

    if-nez v3, :cond_5

    .line 1806
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->loopAndSwitchSet:Ljava/util/List;

    if-eqz v6, :cond_4

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-nez v6, :cond_3

    goto :goto_1

    .line 1809
    :cond_3
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->loopAndSwitchSet:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object v5, v6

    check-cast v5, Lcom/trendmicro/hippo/ast/Jump;

    goto :goto_2

    .line 1807
    :cond_4
    :goto_1
    sub-int v6, v2, v1

    const-string v7, "msg.bad.break"

    invoke-virtual {p0, v7, v1, v6}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;II)V

    .line 1813
    :cond_5
    :goto_2
    new-instance v6, Lcom/trendmicro/hippo/ast/BreakStatement;

    sub-int v7, v2, v1

    invoke-direct {v6, v1, v7}, Lcom/trendmicro/hippo/ast/BreakStatement;-><init>(II)V

    .line 1814
    .local v6, "pn":Lcom/trendmicro/hippo/ast/BreakStatement;
    invoke-virtual {v6, v3}, Lcom/trendmicro/hippo/ast/BreakStatement;->setBreakLabel(Lcom/trendmicro/hippo/ast/Name;)V

    .line 1816
    if-eqz v5, :cond_6

    .line 1817
    invoke-virtual {v6, v5}, Lcom/trendmicro/hippo/ast/BreakStatement;->setBreakTarget(Lcom/trendmicro/hippo/ast/Jump;)V

    .line 1818
    :cond_6
    invoke-virtual {v6, v0}, Lcom/trendmicro/hippo/ast/BreakStatement;->setLineno(I)V

    .line 1819
    return-object v6
.end method

.method private checkBadIncDec(Lcom/trendmicro/hippo/ast/UnaryExpression;)V
    .locals 4
    .param p1, "expr"    # Lcom/trendmicro/hippo/ast/UnaryExpression;

    .line 3832
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/UnaryExpression;->getOperand()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Parser;->removeParens(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 3833
    .local v0, "op":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v1

    .line 3834
    .local v1, "tt":I
    const/16 v2, 0x27

    if-eq v1, v2, :cond_1

    const/16 v2, 0x21

    if-eq v1, v2, :cond_1

    const/16 v2, 0x24

    if-eq v1, v2, :cond_1

    const/16 v2, 0x44

    if-eq v1, v2, :cond_1

    const/16 v2, 0x26

    if-eq v1, v2, :cond_1

    .line 3839
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/UnaryExpression;->getType()I

    move-result v2

    const/16 v3, 0x6b

    if-ne v2, v3, :cond_0

    .line 3840
    const-string v2, "msg.bad.incr"

    goto :goto_0

    .line 3841
    :cond_0
    const-string v2, "msg.bad.decr"

    .line 3839
    :goto_0
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3842
    :cond_1
    return-void
.end method

.method private checkCallRequiresActivation(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 3
    .param p1, "pn"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 3818
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v0

    const-string v1, "eval"

    const/16 v2, 0x27

    if-ne v0, v2, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/Name;

    .line 3819
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 3820
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v0

    const/16 v2, 0x21

    if-ne v0, v2, :cond_2

    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/PropertyGet;

    .line 3821
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/PropertyGet;->getProperty()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3822
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->setRequiresActivation()V

    .line 3823
    :cond_2
    return-void
.end method

.method private codeBug()Ljava/lang/RuntimeException;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 4288
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ts.cursor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", ts.tokenBeg="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", currentToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->codeBug(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private condExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2376
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->orExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 2377
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v1, 0x67

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2378
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 2379
    .local v1, "line":I
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v3, "qmarkPos":I
    const/4 v4, -0x1

    .line 2385
    .local v4, "colonPos":I
    iget-boolean v5, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 2386
    .local v5, "wasInForInit":Z
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 2389
    :try_start_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->assignExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2391
    .local v6, "ifTrue":Lcom/trendmicro/hippo/ast/AstNode;
    iput-boolean v5, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 2392
    nop

    .line 2393
    const/16 v7, 0x68

    const-string v8, "msg.no.colon.cond"

    invoke-direct {p0, v7, v8, v2}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2394
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2395
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->assignExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 2396
    .local v2, "ifFalse":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v7

    .local v7, "beg":I
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v8

    sub-int/2addr v8, v7

    .line 2397
    .local v8, "len":I
    new-instance v9, Lcom/trendmicro/hippo/ast/ConditionalExpression;

    invoke-direct {v9, v7, v8}, Lcom/trendmicro/hippo/ast/ConditionalExpression;-><init>(II)V

    .line 2398
    .local v9, "ce":Lcom/trendmicro/hippo/ast/ConditionalExpression;
    invoke-virtual {v9, v1}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->setLineno(I)V

    .line 2399
    invoke-virtual {v9, v0}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->setTestExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2400
    invoke-virtual {v9, v6}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->setTrueExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2401
    invoke-virtual {v9, v2}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->setFalseExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2402
    sub-int v10, v3, v7

    invoke-virtual {v9, v10}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->setQuestionMarkPosition(I)V

    .line 2403
    sub-int v10, v4, v7

    invoke-virtual {v9, v10}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->setColonPosition(I)V

    .line 2404
    move-object v0, v9

    goto :goto_0

    .line 2391
    .end local v2    # "ifFalse":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v6    # "ifTrue":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v7    # "beg":I
    .end local v8    # "len":I
    .end local v9    # "ce":Lcom/trendmicro/hippo/ast/ConditionalExpression;
    :catchall_0
    move-exception v2

    iput-boolean v5, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 2392
    throw v2

    .line 2406
    .end local v1    # "line":I
    .end local v3    # "qmarkPos":I
    .end local v4    # "colonPos":I
    .end local v5    # "wasInForInit":Z
    :cond_1
    :goto_0
    return-object v0
.end method

.method private condition()Lcom/trendmicro/hippo/Parser$ConditionData;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1099
    new-instance v0, Lcom/trendmicro/hippo/Parser$ConditionData;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/Parser$ConditionData;-><init>(Lcom/trendmicro/hippo/Parser$1;)V

    .line 1101
    .local v0, "data":Lcom/trendmicro/hippo/Parser$ConditionData;
    const/16 v1, 0x58

    const-string v2, "msg.no.paren.cond"

    const/4 v3, 0x1

    invoke-direct {p0, v1, v2, v3}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1102
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iput v1, v0, Lcom/trendmicro/hippo/Parser$ConditionData;->lp:I

    .line 1104
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    iput-object v1, v0, Lcom/trendmicro/hippo/Parser$ConditionData;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    .line 1106
    const/16 v1, 0x59

    const-string v2, "msg.no.paren.after.cond"

    invoke-direct {p0, v1, v2, v3}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1107
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iput v1, v0, Lcom/trendmicro/hippo/Parser$ConditionData;->rp:I

    .line 1111
    :cond_1
    iget-object v1, v0, Lcom/trendmicro/hippo/Parser$ConditionData;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    instance-of v1, v1, Lcom/trendmicro/hippo/ast/Assignment;

    if-eqz v1, :cond_2

    .line 1112
    iget-object v1, v0, Lcom/trendmicro/hippo/Parser$ConditionData;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    .line 1113
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v1

    iget-object v2, v0, Lcom/trendmicro/hippo/Parser$ConditionData;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    .line 1114
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v2

    .line 1112
    const-string v3, "msg.equal.as.assign"

    const-string v4, ""

    invoke-virtual {p0, v3, v4, v1, v2}, Lcom/trendmicro/hippo/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 1116
    :cond_2
    return-object v0
.end method

.method private consumeToken()V
    .locals 1

    .line 439
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    .line 440
    return-void
.end method

.method private continueStatement()Lcom/trendmicro/hippo/ast/ContinueStatement;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1825
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x7a

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1826
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1827
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .local v0, "lineno":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v1, "pos":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 1828
    .local v2, "end":I
    const/4 v3, 0x0

    .line 1829
    .local v3, "label":Lcom/trendmicro/hippo/ast/Name;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekTokenOrEOL()I

    move-result v4

    const/16 v5, 0x27

    if-ne v4, v5, :cond_1

    .line 1830
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->createNameNode()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v3

    .line 1831
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v2

    .line 1835
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->matchJumpLabelName()Lcom/trendmicro/hippo/ast/LabeledStatement;

    move-result-object v4

    .line 1836
    .local v4, "labels":Lcom/trendmicro/hippo/ast/LabeledStatement;
    const/4 v5, 0x0

    .line 1837
    .local v5, "target":Lcom/trendmicro/hippo/ast/Loop;
    if-nez v4, :cond_4

    if-nez v3, :cond_4

    .line 1838
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->loopSet:Ljava/util/List;

    if-eqz v6, :cond_3

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-nez v6, :cond_2

    goto :goto_0

    .line 1841
    :cond_2
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->loopSet:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object v5, v6

    check-cast v5, Lcom/trendmicro/hippo/ast/Loop;

    goto :goto_2

    .line 1839
    :cond_3
    :goto_0
    const-string v6, "msg.continue.outside"

    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    goto :goto_2

    .line 1844
    :cond_4
    if-eqz v4, :cond_5

    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getStatement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v6

    instance-of v6, v6, Lcom/trendmicro/hippo/ast/Loop;

    if-nez v6, :cond_6

    .line 1845
    :cond_5
    sub-int v6, v2, v1

    const-string v7, "msg.continue.nonloop"

    invoke-virtual {p0, v7, v1, v6}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;II)V

    .line 1847
    :cond_6
    if-nez v4, :cond_7

    const/4 v6, 0x0

    goto :goto_1

    :cond_7
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getStatement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v6

    check-cast v6, Lcom/trendmicro/hippo/ast/Loop;

    :goto_1
    move-object v5, v6

    .line 1850
    :goto_2
    new-instance v6, Lcom/trendmicro/hippo/ast/ContinueStatement;

    sub-int v7, v2, v1

    invoke-direct {v6, v1, v7}, Lcom/trendmicro/hippo/ast/ContinueStatement;-><init>(II)V

    .line 1851
    .local v6, "pn":Lcom/trendmicro/hippo/ast/ContinueStatement;
    if-eqz v5, :cond_8

    .line 1852
    invoke-virtual {v6, v5}, Lcom/trendmicro/hippo/ast/ContinueStatement;->setTarget(Lcom/trendmicro/hippo/ast/Loop;)V

    .line 1853
    :cond_8
    invoke-virtual {v6, v3}, Lcom/trendmicro/hippo/ast/ContinueStatement;->setLabel(Lcom/trendmicro/hippo/ast/Name;)V

    .line 1854
    invoke-virtual {v6, v0}, Lcom/trendmicro/hippo/ast/ContinueStatement;->setLineno(I)V

    .line 1855
    return-object v6
.end method

.method private createNameNode()Lcom/trendmicro/hippo/ast/Name;
    .locals 2

    .line 3740
    const/4 v0, 0x0

    const/16 v1, 0x27

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/Parser;->createNameNode(ZI)Lcom/trendmicro/hippo/ast/Name;

    move-result-object v0

    return-object v0
.end method

.method private createNameNode(ZI)Lcom/trendmicro/hippo/ast/Name;
    .locals 5
    .param p1, "checkActivation"    # Z
    .param p2, "token"    # I

    .line 3751
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 3752
    .local v0, "beg":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v1

    .line 3753
    .local v1, "s":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 3754
    .local v2, "lineno":I
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->prevNameTokenString:Ljava/lang/String;

    const-string v4, ""

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 3755
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->prevNameTokenStart:I

    .line 3756
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->prevNameTokenString:Ljava/lang/String;

    .line 3757
    iget v2, p0, Lcom/trendmicro/hippo/Parser;->prevNameTokenLineno:I

    .line 3758
    const/4 v3, 0x0

    iput v3, p0, Lcom/trendmicro/hippo/Parser;->prevNameTokenStart:I

    .line 3759
    iput-object v4, p0, Lcom/trendmicro/hippo/Parser;->prevNameTokenString:Ljava/lang/String;

    .line 3760
    iput v3, p0, Lcom/trendmicro/hippo/Parser;->prevNameTokenLineno:I

    .line 3762
    :cond_0
    if-nez v1, :cond_2

    .line 3763
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/CompilerEnvirons;->isIdeMode()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 3764
    const-string v1, ""

    goto :goto_0

    .line 3766
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 3769
    :cond_2
    :goto_0
    new-instance v3, Lcom/trendmicro/hippo/ast/Name;

    invoke-direct {v3, v0, v1}, Lcom/trendmicro/hippo/ast/Name;-><init>(ILjava/lang/String;)V

    .line 3770
    .local v3, "name":Lcom/trendmicro/hippo/ast/Name;
    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ast/Name;->setLineno(I)V

    .line 3771
    if-eqz p1, :cond_3

    .line 3772
    invoke-virtual {p0, v1, p2}, Lcom/trendmicro/hippo/Parser;->checkActivationName(Ljava/lang/String;I)V

    .line 3774
    :cond_3
    return-object v3
.end method

.method private createStringLiteral()Lcom/trendmicro/hippo/ast/StringLiteral;
    .locals 4

    .line 3778
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v0, "pos":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 3779
    .local v1, "end":I
    new-instance v2, Lcom/trendmicro/hippo/ast/StringLiteral;

    sub-int v3, v1, v0

    invoke-direct {v2, v0, v3}, Lcom/trendmicro/hippo/ast/StringLiteral;-><init>(II)V

    .line 3780
    .local v2, "s":Lcom/trendmicro/hippo/ast/StringLiteral;
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ast/StringLiteral;->setLineno(I)V

    .line 3781
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ast/StringLiteral;->setValue(Ljava/lang/String;)V

    .line 3782
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->getQuoteChar()C

    move-result v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ast/StringLiteral;->setQuoteCharacter(C)V

    .line 3783
    return-object v2
.end method

.method private defaultXmlNamespace()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1995
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x75

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1996
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1997
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->mustHaveXML()V

    .line 1998
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->setRequiresActivation()V

    .line 1999
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .local v0, "lineno":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2001
    .local v1, "pos":I
    const/16 v2, 0x27

    const/4 v3, 0x1

    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v4

    const-string v5, "msg.bad.namespace"

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v4

    const-string v6, "xml"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 2002
    :cond_1
    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2004
    :cond_2
    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "namespace"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 2005
    :cond_3
    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2007
    :cond_4
    const/16 v2, 0x5b

    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v2

    if-nez v2, :cond_5

    .line 2008
    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2011
    :cond_5
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 2012
    .local v2, "e":Lcom/trendmicro/hippo/ast/AstNode;
    new-instance v4, Lcom/trendmicro/hippo/ast/UnaryExpression;

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v5

    sub-int/2addr v5, v1

    invoke-direct {v4, v1, v5}, Lcom/trendmicro/hippo/ast/UnaryExpression;-><init>(II)V

    .line 2013
    .local v4, "dxmln":Lcom/trendmicro/hippo/ast/UnaryExpression;
    const/16 v5, 0x4b

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/ast/UnaryExpression;->setOperator(I)V

    .line 2014
    invoke-virtual {v4, v2}, Lcom/trendmicro/hippo/ast/UnaryExpression;->setOperand(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2015
    invoke-virtual {v4, v0}, Lcom/trendmicro/hippo/ast/UnaryExpression;->setLineno(I)V

    .line 2017
    new-instance v5, Lcom/trendmicro/hippo/ast/ExpressionStatement;

    invoke-direct {v5, v4, v3}, Lcom/trendmicro/hippo/ast/ExpressionStatement;-><init>(Lcom/trendmicro/hippo/ast/AstNode;Z)V

    move-object v3, v5

    .line 2018
    .local v3, "es":Lcom/trendmicro/hippo/ast/ExpressionStatement;
    return-object v3
.end method

.method private destructuringPrimaryExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/trendmicro/hippo/Parser$ParserException;
        }
    .end annotation

    .line 3092
    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->inDestructuringAssignment:Z

    .line 3093
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->primaryExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3095
    iput-boolean v1, p0, Lcom/trendmicro/hippo/Parser;->inDestructuringAssignment:Z

    .line 3093
    return-object v0

    .line 3095
    :catchall_0
    move-exception v0

    iput-boolean v1, p0, Lcom/trendmicro/hippo/Parser;->inDestructuringAssignment:Z

    .line 3096
    throw v0
.end method

.method private doLoop()Lcom/trendmicro/hippo/ast/DoLoop;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1448
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x77

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1449
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1450
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1451
    .local v0, "pos":I
    new-instance v1, Lcom/trendmicro/hippo/ast/DoLoop;

    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/ast/DoLoop;-><init>(I)V

    .line 1452
    .local v1, "pn":Lcom/trendmicro/hippo/ast/DoLoop;
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/DoLoop;->setLineno(I)V

    .line 1453
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/Parser;->enterLoop(Lcom/trendmicro/hippo/ast/Loop;)V

    .line 1455
    :try_start_0
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/Parser;->getNextStatementAfterInlineComments(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 1456
    .local v2, "body":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v3, 0x76

    const-string v4, "msg.no.while.do"

    const/4 v5, 0x1

    invoke-direct {p0, v3, v4, v5}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 1457
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v3, v0

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ast/DoLoop;->setWhilePosition(I)V

    .line 1458
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->condition()Lcom/trendmicro/hippo/Parser$ConditionData;

    move-result-object v3

    .line 1459
    .local v3, "data":Lcom/trendmicro/hippo/Parser$ConditionData;
    iget-object v4, v3, Lcom/trendmicro/hippo/Parser$ConditionData;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/ast/DoLoop;->setCondition(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1460
    iget v4, v3, Lcom/trendmicro/hippo/Parser$ConditionData;->lp:I

    sub-int/2addr v4, v0

    iget v6, v3, Lcom/trendmicro/hippo/Parser$ConditionData;->rp:I

    sub-int/2addr v6, v0

    invoke-virtual {v1, v4, v6}, Lcom/trendmicro/hippo/ast/DoLoop;->setParens(II)V

    .line 1461
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v4

    .line 1462
    .local v4, "end":I
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/DoLoop;->setBody(Lcom/trendmicro/hippo/ast/AstNode;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1464
    .end local v2    # "body":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v3    # "data":Lcom/trendmicro/hippo/Parser$ConditionData;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->exitLoop()V

    .line 1465
    nop

    .line 1469
    const/16 v2, 0x53

    invoke-direct {p0, v2, v5}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1470
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v2, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 1472
    :cond_1
    sub-int v2, v4, v0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/DoLoop;->setLength(I)V

    .line 1473
    return-object v1

    .line 1464
    .end local v4    # "end":I
    :catchall_0
    move-exception v2

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->exitLoop()V

    .line 1465
    throw v2
.end method

.method private enterLoop(Lcom/trendmicro/hippo/ast/Loop;)V
    .locals 1
    .param p1, "loop"    # Lcom/trendmicro/hippo/ast/Loop;

    .line 539
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopSet:Ljava/util/List;

    if-nez v0, :cond_0

    .line 540
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopSet:Ljava/util/List;

    .line 541
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopSet:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 542
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopAndSwitchSet:Ljava/util/List;

    if-nez v0, :cond_1

    .line 543
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopAndSwitchSet:Ljava/util/List;

    .line 544
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopAndSwitchSet:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 545
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/Parser;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 546
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentLabel:Lcom/trendmicro/hippo/ast/LabeledStatement;

    if-eqz v0, :cond_2

    .line 547
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/LabeledStatement;->setStatement(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 548
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentLabel:Lcom/trendmicro/hippo/ast/LabeledStatement;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getFirstLabel()Lcom/trendmicro/hippo/ast/Label;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Label;->setLoop(Lcom/trendmicro/hippo/ast/Jump;)V

    .line 553
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentLabel:Lcom/trendmicro/hippo/ast/LabeledStatement;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getPosition()I

    move-result v0

    neg-int v0, v0

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ast/Loop;->setRelative(I)V

    .line 555
    :cond_2
    return-void
.end method

.method private enterSwitch(Lcom/trendmicro/hippo/ast/SwitchStatement;)V
    .locals 1
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/SwitchStatement;

    .line 567
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopAndSwitchSet:Ljava/util/List;

    if-nez v0, :cond_0

    .line 568
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopAndSwitchSet:Ljava/util/List;

    .line 569
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopAndSwitchSet:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 570
    return-void
.end method

.method private eqExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2467
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->relExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 2469
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v1

    .local v1, "tt":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2470
    .local v2, "opPos":I
    const/16 v3, 0xd

    const/16 v4, 0xc

    if-eq v1, v4, :cond_0

    if-eq v1, v3, :cond_0

    const/16 v5, 0x2e

    if-eq v1, v5, :cond_0

    const/16 v5, 0x2f

    if-eq v1, v5, :cond_0

    .line 2487
    nop

    .line 2489
    .end local v1    # "tt":I
    .end local v2    # "opPos":I
    return-object v0

    .line 2475
    .restart local v1    # "tt":I
    .restart local v2    # "opPos":I
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2476
    move v5, v1

    .line 2477
    .local v5, "parseToken":I
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v6

    const/16 v7, 0x78

    if-ne v6, v7, :cond_2

    .line 2479
    if-ne v1, v4, :cond_1

    .line 2480
    const/16 v5, 0x2e

    goto :goto_1

    .line 2481
    :cond_1
    if-ne v1, v3, :cond_2

    .line 2482
    const/16 v5, 0x2f

    .line 2484
    :cond_2
    :goto_1
    new-instance v3, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->relExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v3, v5, v0, v4, v2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    move-object v0, v3

    .line 2485
    goto :goto_0
.end method

.method private exitLoop()V
    .locals 3

    .line 558
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopSet:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/Loop;

    .line 559
    .local v0, "loop":Lcom/trendmicro/hippo/ast/Loop;
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->loopAndSwitchSet:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 560
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Loop;->getParent()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 561
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Loop;->getParent()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/Loop;->setRelative(I)V

    .line 563
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 564
    return-void
.end method

.method private exitSwitch()V
    .locals 2

    .line 573
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->loopAndSwitchSet:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 574
    return-void
.end method

.method private expr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2311
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->assignExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 2312
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v1

    .line 2313
    .local v1, "pos":I
    :goto_0
    const/4 v2, 0x1

    const/16 v3, 0x5a

    invoke-direct {p0, v3, v2}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2314
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2315
    .local v2, "opPos":I
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/CompilerEnvirons;->isStrictMode()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->hasSideEffects()Z

    move-result v4

    if-nez v4, :cond_0

    .line 2316
    nop

    .line 2317
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Parser;->nodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v4

    sub-int/2addr v4, v1

    .line 2316
    const-string v5, "msg.no.side.effects"

    const-string v6, ""

    invoke-virtual {p0, v5, v6, v1, v4}, Lcom/trendmicro/hippo/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 2318
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v4

    const/16 v5, 0x49

    if-ne v4, v5, :cond_1

    .line 2319
    const-string v4, "msg.yield.parenthesized"

    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2320
    :cond_1
    new-instance v4, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->assignExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    invoke-direct {v4, v3, v0, v5, v2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    move-object v0, v4

    .line 2321
    .end local v2    # "opPos":I
    goto :goto_0

    .line 2322
    :cond_2
    return-object v0
.end method

.method private forLoop()Lcom/trendmicro/hippo/ast/Loop;
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1501
    move-object/from16 v1, p0

    iget v0, v1, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v2, 0x78

    if-eq v0, v2, :cond_0

    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1502
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1503
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v2, "forPos":I
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 1504
    .local v3, "lineno":I
    const/4 v4, 0x0

    .local v4, "isForEach":Z
    const/4 v5, 0x0

    .local v5, "isForIn":Z
    const/4 v6, 0x0

    .line 1505
    .local v6, "isForOf":Z
    const/4 v7, -0x1

    .local v7, "eachPos":I
    const/4 v8, -0x1

    .local v8, "inPos":I
    const/4 v9, -0x1

    .local v9, "lp":I
    const/4 v10, -0x1

    .line 1506
    .local v10, "rp":I
    const/4 v11, 0x0

    .line 1507
    .local v11, "init":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v12, 0x0

    .line 1508
    .local v12, "cond":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v13, 0x0

    .line 1509
    .local v13, "incr":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v14, 0x0

    .line 1511
    .local v14, "pn":Lcom/trendmicro/hippo/ast/Loop;
    new-instance v0, Lcom/trendmicro/hippo/ast/Scope;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ast/Scope;-><init>()V

    move-object v15, v0

    .line 1512
    .local v15, "tempScope":Lcom/trendmicro/hippo/ast/Scope;
    invoke-virtual {v1, v15}, Lcom/trendmicro/hippo/Parser;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 1515
    const/16 v0, 0x27

    move/from16 v16, v4

    .end local v4    # "isForEach":Z
    .local v16, "isForEach":Z
    const/4 v4, 0x1

    :try_start_0
    invoke-direct {v1, v0, v4}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v17
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_e

    const-string v0, "msg.no.paren.for"

    if-eqz v17, :cond_2

    .line 1516
    :try_start_1
    const-string v4, "each"
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move/from16 v19, v5

    .end local v5    # "isForIn":Z
    .local v19, "isForIn":Z
    :try_start_2
    iget-object v5, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v4, :cond_1

    .line 1517
    const/4 v4, 0x1

    .line 1518
    .end local v16    # "isForEach":Z
    .restart local v4    # "isForEach":Z
    :try_start_3
    iget-object v5, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    sub-int v7, v5, v2

    goto :goto_1

    .line 1604
    :catchall_0
    move-exception v0

    move/from16 v5, v19

    goto/16 :goto_9

    .line 1520
    .end local v4    # "isForEach":Z
    .restart local v16    # "isForEach":Z
    :cond_1
    :try_start_4
    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_0

    .line 1604
    :catchall_1
    move-exception v0

    move/from16 v4, v16

    move/from16 v5, v19

    goto/16 :goto_9

    .end local v19    # "isForIn":Z
    .restart local v5    # "isForIn":Z
    :catchall_2
    move-exception v0

    move/from16 v19, v5

    move/from16 v4, v16

    .end local v5    # "isForIn":Z
    .restart local v19    # "isForIn":Z
    goto/16 :goto_9

    .line 1515
    .end local v19    # "isForIn":Z
    .restart local v5    # "isForIn":Z
    :cond_2
    move/from16 v19, v5

    .line 1524
    .end local v5    # "isForIn":Z
    .restart local v19    # "isForIn":Z
    :goto_0
    move/from16 v4, v16

    .end local v16    # "isForEach":Z
    .restart local v4    # "isForEach":Z
    :goto_1
    const/16 v5, 0x58

    move/from16 v20, v6

    const/4 v6, 0x1

    .end local v6    # "isForOf":Z
    .local v20, "isForOf":Z
    :try_start_5
    invoke-direct {v1, v5, v0, v6}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_d

    if-eqz v0, :cond_3

    .line 1525
    :try_start_6
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    sub-int v9, v0, v2

    goto :goto_2

    .line 1604
    :catchall_3
    move-exception v0

    move/from16 v5, v19

    move/from16 v6, v20

    goto/16 :goto_9

    .line 1526
    :cond_3
    :goto_2
    :try_start_7
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0

    move v5, v0

    .line 1528
    .local v5, "tt":I
    invoke-direct {v1, v5}, Lcom/trendmicro/hippo/Parser;->forLoopInit(I)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    move-object v11, v0

    .line 1529
    const/16 v0, 0x34

    const/4 v6, 0x1

    invoke-direct {v1, v0, v6}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_d

    if-eqz v0, :cond_4

    .line 1530
    const/16 v16, 0x1

    .line 1531
    .end local v19    # "isForIn":Z
    .local v16, "isForIn":Z
    :try_start_8
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v8, v0, v2

    .line 1532
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    move-object v12, v0

    move/from16 v18, v5

    move/from16 v5, v16

    move/from16 v6, v20

    .end local v12    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    .local v0, "cond":Lcom/trendmicro/hippo/ast/AstNode;
    goto/16 :goto_4

    .line 1604
    .end local v0    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v5    # "tt":I
    .restart local v12    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    :catchall_4
    move-exception v0

    move/from16 v5, v16

    move/from16 v6, v20

    goto/16 :goto_9

    .line 1533
    .end local v16    # "isForIn":Z
    .restart local v5    # "tt":I
    .restart local v19    # "isForIn":Z
    :cond_4
    :try_start_9
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_d

    const/16 v6, 0xc8

    if-lt v0, v6, :cond_5

    .line 1534
    const/16 v0, 0x27

    const/4 v6, 0x1

    :try_start_a
    invoke-direct {v1, v0, v6}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "of"

    iget-object v6, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    if-eqz v0, :cond_5

    .line 1535
    const/4 v6, 0x1

    .line 1536
    .end local v20    # "isForOf":Z
    .restart local v6    # "isForOf":Z
    :try_start_b
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v8, v0, v2

    .line 1537
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    move-object v12, v0

    move/from16 v18, v5

    move/from16 v5, v19

    .end local v12    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v0    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_4

    .line 1539
    .end local v0    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v6    # "isForOf":Z
    .restart local v12    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v20    # "isForOf":Z
    :cond_5
    :try_start_c
    const-string v0, "msg.no.semi.for"

    const/16 v6, 0x53

    move/from16 v18, v5

    const/4 v5, 0x1

    .end local v5    # "tt":I
    .local v18, "tt":I
    invoke-direct {v1, v6, v0, v5}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 1540
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_d

    if-ne v0, v6, :cond_6

    .line 1542
    :try_start_d
    new-instance v0, Lcom/trendmicro/hippo/ast/EmptyExpression;

    iget-object v5, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    const/4 v6, 0x1

    invoke-direct {v0, v5, v6}, Lcom/trendmicro/hippo/ast/EmptyExpression;-><init>(II)V

    move-object v12, v0

    .line 1543
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v12, v0}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    goto :goto_3

    .line 1545
    :cond_6
    :try_start_e
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .end local v12    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v0    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    move-object v12, v0

    .line 1548
    .end local v0    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v12    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_3
    const-string v0, "msg.no.semi.for.cond"

    const/16 v5, 0x53

    const/4 v6, 0x1

    invoke-direct {v1, v5, v0, v6}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 1549
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 1550
    .local v0, "tmpPos":I
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v5
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_d

    const/16 v6, 0x59

    if-ne v5, v6, :cond_7

    .line 1551
    :try_start_f
    new-instance v5, Lcom/trendmicro/hippo/ast/EmptyExpression;

    const/4 v6, 0x1

    invoke-direct {v5, v0, v6}, Lcom/trendmicro/hippo/ast/EmptyExpression;-><init>(II)V

    move-object v13, v5

    .line 1552
    iget-object v5, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v13, v5}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    move/from16 v5, v19

    move/from16 v6, v20

    goto :goto_4

    .line 1554
    :cond_7
    :try_start_10
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_d

    move-object v13, v5

    move/from16 v5, v19

    move/from16 v6, v20

    .line 1558
    .end local v0    # "tmpPos":I
    .end local v19    # "isForIn":Z
    .end local v20    # "isForOf":Z
    .local v5, "isForIn":Z
    .restart local v6    # "isForOf":Z
    :goto_4
    :try_start_11
    const-string v0, "msg.no.paren.for.ctrl"
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_c

    move/from16 v21, v10

    move-object/from16 v22, v14

    const/16 v10, 0x59

    const/4 v14, 0x1

    .end local v10    # "rp":I
    .end local v14    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .local v21, "rp":I
    .local v22, "pn":Lcom/trendmicro/hippo/ast/Loop;
    :try_start_12
    invoke-direct {v1, v10, v0, v14}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_b

    if-eqz v0, :cond_8

    .line 1559
    :try_start_13
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    sub-int v10, v0, v2

    .end local v21    # "rp":I
    .restart local v10    # "rp":I
    goto :goto_5

    .line 1604
    .end local v10    # "rp":I
    .end local v18    # "tt":I
    .restart local v21    # "rp":I
    :catchall_5
    move-exception v0

    move/from16 v10, v21

    move-object/from16 v14, v22

    goto/16 :goto_9

    .line 1558
    .restart local v18    # "tt":I
    :cond_8
    move/from16 v10, v21

    .line 1561
    .end local v21    # "rp":I
    .restart local v10    # "rp":I
    :goto_5
    if-nez v5, :cond_a

    if-eqz v6, :cond_9

    goto :goto_6

    .line 1580
    :cond_9
    :try_start_14
    new-instance v0, Lcom/trendmicro/hippo/ast/ForLoop;

    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/ast/ForLoop;-><init>(I)V

    .line 1581
    .local v0, "fl":Lcom/trendmicro/hippo/ast/ForLoop;
    invoke-virtual {v0, v11}, Lcom/trendmicro/hippo/ast/ForLoop;->setInitializer(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1582
    invoke-virtual {v0, v12}, Lcom/trendmicro/hippo/ast/ForLoop;->setCondition(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1583
    invoke-virtual {v0, v13}, Lcom/trendmicro/hippo/ast/ForLoop;->setIncrement(Lcom/trendmicro/hippo/ast/AstNode;)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_6

    .line 1584
    move-object v14, v0

    .end local v22    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .restart local v14    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    move/from16 v16, v5

    goto :goto_8

    .line 1604
    .end local v0    # "fl":Lcom/trendmicro/hippo/ast/ForLoop;
    .end local v14    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .end local v18    # "tt":I
    .restart local v22    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    :catchall_6
    move-exception v0

    move-object/from16 v14, v22

    goto/16 :goto_9

    .line 1562
    .restart local v18    # "tt":I
    :cond_a
    :goto_6
    :try_start_15
    new-instance v0, Lcom/trendmicro/hippo/ast/ForInLoop;

    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/ast/ForInLoop;-><init>(I)V

    .line 1563
    .local v0, "fis":Lcom/trendmicro/hippo/ast/ForInLoop;
    instance-of v14, v11, Lcom/trendmicro/hippo/ast/VariableDeclaration;

    if-eqz v14, :cond_b

    .line 1565
    move-object v14, v11

    check-cast v14, Lcom/trendmicro/hippo/ast/VariableDeclaration;

    invoke-virtual {v14}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->getVariables()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_a

    move/from16 v16, v5

    const/4 v5, 0x1

    .end local v5    # "isForIn":Z
    .restart local v16    # "isForIn":Z
    if-le v14, v5, :cond_c

    .line 1566
    :try_start_16
    const-string v5, "msg.mult.index"

    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    goto :goto_7

    .line 1563
    .end local v16    # "isForIn":Z
    .restart local v5    # "isForIn":Z
    :cond_b
    move/from16 v16, v5

    .line 1569
    .end local v5    # "isForIn":Z
    .restart local v16    # "isForIn":Z
    :cond_c
    :goto_7
    if-eqz v6, :cond_d

    if-eqz v4, :cond_d

    .line 1570
    const-string v5, "msg.invalid.for.each"

    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1572
    :cond_d
    invoke-virtual {v0, v11}, Lcom/trendmicro/hippo/ast/ForInLoop;->setIterator(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1573
    invoke-virtual {v0, v12}, Lcom/trendmicro/hippo/ast/ForInLoop;->setIteratedObject(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1574
    invoke-virtual {v0, v8}, Lcom/trendmicro/hippo/ast/ForInLoop;->setInPosition(I)V

    .line 1575
    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/ast/ForInLoop;->setIsForEach(Z)V

    .line 1576
    invoke-virtual {v0, v7}, Lcom/trendmicro/hippo/ast/ForInLoop;->setEachPosition(I)V

    .line 1577
    invoke-virtual {v0, v6}, Lcom/trendmicro/hippo/ast/ForInLoop;->setIsForOf(Z)V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_9

    .line 1578
    nop

    .line 1579
    .end local v22    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .local v0, "pn":Lcom/trendmicro/hippo/ast/Loop;
    move-object v14, v0

    .line 1588
    .end local v0    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .restart local v14    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    :goto_8
    :try_start_17
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {v0, v14}, Lcom/trendmicro/hippo/ast/Scope;->replaceWith(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 1589
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 1594
    invoke-direct {v1, v14}, Lcom/trendmicro/hippo/Parser;->enterLoop(Lcom/trendmicro/hippo/ast/Loop;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_8

    .line 1596
    :try_start_18
    invoke-direct {v1, v14}, Lcom/trendmicro/hippo/Parser;->getNextStatementAfterInlineComments(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 1597
    .local v0, "body":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v5

    sub-int/2addr v5, v2

    invoke-virtual {v14, v5}, Lcom/trendmicro/hippo/ast/Loop;->setLength(I)V

    .line 1598
    invoke-virtual {v14, v0}, Lcom/trendmicro/hippo/ast/Loop;->setBody(Lcom/trendmicro/hippo/ast/AstNode;)V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_7

    .line 1600
    .end local v0    # "body":Lcom/trendmicro/hippo/ast/AstNode;
    :try_start_19
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->exitLoop()V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_8

    .line 1601
    nop

    .line 1604
    .end local v18    # "tt":I
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    if-ne v0, v15, :cond_e

    .line 1605
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 1608
    :cond_e
    invoke-virtual {v14, v9, v10}, Lcom/trendmicro/hippo/ast/Loop;->setParens(II)V

    .line 1609
    invoke-virtual {v14, v3}, Lcom/trendmicro/hippo/ast/Loop;->setLineno(I)V

    .line 1610
    return-object v14

    .line 1600
    .restart local v18    # "tt":I
    :catchall_7
    move-exception v0

    :try_start_1a
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->exitLoop()V

    .line 1601
    nop

    .end local v2    # "forPos":I
    .end local v3    # "lineno":I
    .end local v4    # "isForEach":Z
    .end local v6    # "isForOf":Z
    .end local v7    # "eachPos":I
    .end local v8    # "inPos":I
    .end local v9    # "lp":I
    .end local v10    # "rp":I
    .end local v11    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v12    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v13    # "incr":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v14    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .end local v15    # "tempScope":Lcom/trendmicro/hippo/ast/Scope;
    .end local v16    # "isForIn":Z
    throw v0
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_8

    .line 1604
    .end local v18    # "tt":I
    .restart local v2    # "forPos":I
    .restart local v3    # "lineno":I
    .restart local v4    # "isForEach":Z
    .restart local v6    # "isForOf":Z
    .restart local v7    # "eachPos":I
    .restart local v8    # "inPos":I
    .restart local v9    # "lp":I
    .restart local v10    # "rp":I
    .restart local v11    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v12    # "cond":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v13    # "incr":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v14    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .restart local v15    # "tempScope":Lcom/trendmicro/hippo/ast/Scope;
    .restart local v16    # "isForIn":Z
    :catchall_8
    move-exception v0

    move/from16 v5, v16

    goto :goto_9

    .end local v14    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .restart local v22    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    :catchall_9
    move-exception v0

    move/from16 v5, v16

    move-object/from16 v14, v22

    goto :goto_9

    .end local v16    # "isForIn":Z
    .restart local v5    # "isForIn":Z
    :catchall_a
    move-exception v0

    move/from16 v16, v5

    move-object/from16 v14, v22

    .end local v5    # "isForIn":Z
    .restart local v16    # "isForIn":Z
    goto :goto_9

    .end local v10    # "rp":I
    .end local v16    # "isForIn":Z
    .restart local v5    # "isForIn":Z
    .restart local v21    # "rp":I
    :catchall_b
    move-exception v0

    move/from16 v16, v5

    move/from16 v10, v21

    move-object/from16 v14, v22

    .end local v5    # "isForIn":Z
    .restart local v16    # "isForIn":Z
    goto :goto_9

    .end local v16    # "isForIn":Z
    .end local v21    # "rp":I
    .end local v22    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .restart local v5    # "isForIn":Z
    .restart local v10    # "rp":I
    .restart local v14    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    :catchall_c
    move-exception v0

    move/from16 v16, v5

    move/from16 v21, v10

    move-object/from16 v22, v14

    .end local v5    # "isForIn":Z
    .end local v10    # "rp":I
    .end local v14    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .restart local v16    # "isForIn":Z
    .restart local v21    # "rp":I
    .restart local v22    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    goto :goto_9

    .end local v6    # "isForOf":Z
    .end local v16    # "isForIn":Z
    .end local v21    # "rp":I
    .end local v22    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .restart local v10    # "rp":I
    .restart local v14    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .restart local v19    # "isForIn":Z
    .restart local v20    # "isForOf":Z
    :catchall_d
    move-exception v0

    move/from16 v21, v10

    move-object/from16 v22, v14

    move/from16 v5, v19

    move/from16 v6, v20

    .end local v10    # "rp":I
    .end local v14    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .restart local v21    # "rp":I
    .restart local v22    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    goto :goto_9

    .end local v4    # "isForEach":Z
    .end local v19    # "isForIn":Z
    .end local v20    # "isForOf":Z
    .end local v21    # "rp":I
    .end local v22    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .restart local v5    # "isForIn":Z
    .restart local v6    # "isForOf":Z
    .restart local v10    # "rp":I
    .restart local v14    # "pn":Lcom/trendmicro/hippo/ast/Loop;
    .local v16, "isForEach":Z
    :catchall_e
    move-exception v0

    move/from16 v19, v5

    move/from16 v20, v6

    move/from16 v21, v10

    move-object/from16 v22, v14

    move/from16 v4, v16

    .end local v16    # "isForEach":Z
    .restart local v4    # "isForEach":Z
    :goto_9
    move/from16 v16, v2

    .end local v2    # "forPos":I
    .local v16, "forPos":I
    iget-object v2, v1, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    if-ne v2, v15, :cond_f

    .line 1605
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 1607
    :cond_f
    throw v0
.end method

.method private forLoopInit(I)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 5
    .param p1, "tt"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1615
    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 1616
    const/4 v2, 0x0

    .line 1617
    .local v2, "init":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v3, 0x53

    if-ne p1, v3, :cond_0

    .line 1618
    new-instance v3, Lcom/trendmicro/hippo/ast/EmptyExpression;

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-direct {v3, v4, v0}, Lcom/trendmicro/hippo/ast/EmptyExpression;-><init>(II)V

    move-object v0, v3

    .line 1619
    .end local v2    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    .local v0, "init":Lcom/trendmicro/hippo/ast/AstNode;
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    goto :goto_1

    .line 1620
    .end local v0    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v2    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_0
    const/16 v0, 0x7b

    if-eq p1, v0, :cond_2

    const/16 v0, 0x9a

    if-ne p1, v0, :cond_1

    goto :goto_0

    .line 1624
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 1625
    .end local v2    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v0    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Parser;->markDestructuring(Lcom/trendmicro/hippo/ast/AstNode;)V

    goto :goto_1

    .line 1621
    .end local v0    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v2    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1622
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-direct {p0, p1, v0, v1}, Lcom/trendmicro/hippo/Parser;->variables(IIZ)Lcom/trendmicro/hippo/ast/VariableDeclaration;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1627
    .end local v2    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v0    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_1
    nop

    .line 1629
    iput-boolean v1, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 1627
    return-object v0

    .line 1629
    .end local v0    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    :catchall_0
    move-exception v0

    iput-boolean v1, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 1630
    throw v0
.end method

.method private function(I)Lcom/trendmicro/hippo/ast/FunctionNode;
    .locals 11
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 876
    move v0, p1

    .line 877
    .local v0, "syntheticType":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 878
    .local v1, "baseLineno":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 879
    .local v2, "functionSourceStart":I
    const/4 v3, 0x0

    .line 880
    .local v3, "name":Lcom/trendmicro/hippo/ast/Name;
    const/4 v4, 0x0

    .line 882
    .local v4, "memberExprNode":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v5, 0x27

    const/4 v6, 0x1

    invoke-direct {p0, v5, v6}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v7

    const/4 v8, 0x0

    const-string v9, "msg.no.paren.parms"

    const/16 v10, 0x58

    if-eqz v7, :cond_3

    .line 883
    invoke-direct {p0, v6, v5}, Lcom/trendmicro/hippo/Parser;->createNameNode(ZI)Lcom/trendmicro/hippo/ast/Name;

    move-result-object v3

    .line 884
    iget-boolean v5, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    if-eqz v5, :cond_1

    .line 885
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    .line 886
    .local v5, "id":Ljava/lang/String;
    const-string v7, "eval"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    const-string v7, "arguments"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 887
    :cond_0
    const-string v7, "msg.bad.id.strict"

    invoke-virtual {p0, v7, v5}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 890
    .end local v5    # "id":Ljava/lang/String;
    :cond_1
    invoke-direct {p0, v10, v6}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v5

    if-nez v5, :cond_6

    .line 891
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/CompilerEnvirons;->isAllowMemberExprAsFunctionName()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 892
    move-object v5, v3

    .line 893
    .local v5, "memberExprHead":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v3, 0x0

    .line 894
    invoke-direct {p0, v8, v5}, Lcom/trendmicro/hippo/Parser;->memberExprTail(ZLcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    .line 896
    .end local v5    # "memberExprHead":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_2
    invoke-direct {p0, v10, v9, v6}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    goto :goto_0

    .line 898
    :cond_3
    invoke-direct {p0, v10, v6}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_0

    .line 901
    :cond_4
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/CompilerEnvirons;->isAllowMemberExprAsFunctionName()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 905
    invoke-direct {p0, v8}, Lcom/trendmicro/hippo/Parser;->memberExpr(Z)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    .line 907
    :cond_5
    invoke-direct {p0, v10, v9, v6}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 909
    :cond_6
    :goto_0
    iget v5, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/4 v6, -0x1

    if-ne v5, v10, :cond_7

    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    goto :goto_1

    :cond_7
    move v5, v6

    .line 911
    .local v5, "lpPos":I
    :goto_1
    if-eqz v4, :cond_8

    .line 912
    const/4 v0, 0x2

    .line 915
    :cond_8
    const/4 v7, 0x2

    if-eq v0, v7, :cond_9

    if-eqz v3, :cond_9

    .line 916
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/Name;->length()I

    move-result v7

    if-lez v7, :cond_9

    .line 918
    const/16 v7, 0x6e

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v7, v8}, Lcom/trendmicro/hippo/Parser;->defineSymbol(ILjava/lang/String;)V

    .line 921
    :cond_9
    new-instance v7, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-direct {v7, v2, v3}, Lcom/trendmicro/hippo/ast/FunctionNode;-><init>(ILcom/trendmicro/hippo/ast/Name;)V

    .line 922
    .local v7, "fnNode":Lcom/trendmicro/hippo/ast/FunctionNode;
    invoke-virtual {v7, p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->setFunctionType(I)V

    .line 923
    if-eq v5, v6, :cond_a

    .line 924
    sub-int v6, v5, v2

    invoke-virtual {v7, v6}, Lcom/trendmicro/hippo/ast/FunctionNode;->setLp(I)V

    .line 926
    :cond_a
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v6

    invoke-virtual {v7, v6}, Lcom/trendmicro/hippo/ast/FunctionNode;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    .line 928
    new-instance v6, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;

    invoke-direct {v6, p0, v7}, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;-><init>(Lcom/trendmicro/hippo/Parser;Lcom/trendmicro/hippo/ast/FunctionNode;)V

    .line 930
    .local v6, "savedVars":Lcom/trendmicro/hippo/Parser$PerFunctionVariables;
    :try_start_0
    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/Parser;->parseFunctionParams(Lcom/trendmicro/hippo/ast/FunctionNode;)V

    .line 931
    invoke-direct {p0, p1, v7}, Lcom/trendmicro/hippo/Parser;->parseFunctionBody(ILcom/trendmicro/hippo/ast/FunctionNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/trendmicro/hippo/ast/FunctionNode;->setBody(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 932
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v8, v8, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    invoke-virtual {v7, v2, v8}, Lcom/trendmicro/hippo/ast/FunctionNode;->setEncodedSourceBounds(II)V

    .line 933
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v8, v8, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v8, v2

    invoke-virtual {v7, v8}, Lcom/trendmicro/hippo/ast/FunctionNode;->setLength(I)V

    .line 935
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v8}, Lcom/trendmicro/hippo/CompilerEnvirons;->isStrictMode()Z

    move-result v8

    if-eqz v8, :cond_d

    .line 936
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/FunctionNode;->getBody()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v8

    invoke-virtual {v8}, Lcom/trendmicro/hippo/ast/AstNode;->hasConsistentReturnUsage()Z

    move-result v8

    if-nez v8, :cond_d

    .line 937
    if-eqz v3, :cond_b

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/Name;->length()I

    move-result v8

    if-lez v8, :cond_b

    .line 938
    const-string v8, "msg.no.return.value"

    goto :goto_2

    .line 939
    :cond_b
    const-string v8, "msg.anon.no.return.value"

    :goto_2
    nop

    .line 940
    .local v8, "msg":Ljava/lang/String;
    if-nez v3, :cond_c

    const-string v9, ""

    goto :goto_3

    :cond_c
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v9

    :goto_3
    invoke-virtual {p0, v8, v9}, Lcom/trendmicro/hippo/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 943
    .end local v8    # "msg":Ljava/lang/String;
    :cond_d
    invoke-virtual {v6}, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->restore()V

    .line 944
    nop

    .line 946
    if-eqz v4, :cond_e

    .line 948
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 949
    invoke-virtual {v7, v4}, Lcom/trendmicro/hippo/ast/FunctionNode;->setMemberExprNode(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 961
    :cond_e
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/trendmicro/hippo/ast/FunctionNode;->setSourceName(Ljava/lang/String;)V

    .line 962
    invoke-virtual {v7, v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->setBaseLineno(I)V

    .line 963
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v8, v8, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v7, v8}, Lcom/trendmicro/hippo/ast/FunctionNode;->setEndLineno(I)V

    .line 969
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v8}, Lcom/trendmicro/hippo/CompilerEnvirons;->isIdeMode()Z

    move-result v8

    if-eqz v8, :cond_f

    .line 970
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {v7, v8}, Lcom/trendmicro/hippo/ast/FunctionNode;->setParentScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 972
    :cond_f
    return-object v7

    .line 943
    :catchall_0
    move-exception v8

    invoke-virtual {v6}, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->restore()V

    .line 944
    throw v8
.end method

.method private generatorExpression(Lcom/trendmicro/hippo/ast/AstNode;I)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1
    .param p1, "result"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3435
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/trendmicro/hippo/Parser;->generatorExpression(Lcom/trendmicro/hippo/ast/AstNode;IZ)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    return-object v0
.end method

.method private generatorExpression(Lcom/trendmicro/hippo/ast/AstNode;IZ)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 6
    .param p1, "result"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "pos"    # I
    .param p3, "inFunctionParams"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3442
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3444
    .local v0, "loops":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;>;"
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v1

    const/16 v2, 0x78

    if-ne v1, v2, :cond_0

    .line 3445
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->generatorExpressionLoop()Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 3447
    :cond_0
    const/4 v1, -0x1

    .line 3448
    .local v1, "ifPos":I
    const/4 v2, 0x0

    .line 3449
    .local v2, "data":Lcom/trendmicro/hippo/Parser$ConditionData;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v3

    const/16 v4, 0x71

    if-ne v3, v4, :cond_1

    .line 3450
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3451
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v1, v3, p2

    .line 3452
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->condition()Lcom/trendmicro/hippo/Parser$ConditionData;

    move-result-object v2

    .line 3454
    :cond_1
    if-nez p3, :cond_2

    .line 3455
    const/16 v3, 0x59

    const/4 v4, 0x1

    const-string v5, "msg.no.paren.let"

    invoke-direct {p0, v3, v5, v4}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 3457
    :cond_2
    new-instance v3, Lcom/trendmicro/hippo/ast/GeneratorExpression;

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v4, p2

    invoke-direct {v3, p2, v4}, Lcom/trendmicro/hippo/ast/GeneratorExpression;-><init>(II)V

    .line 3458
    .local v3, "pn":Lcom/trendmicro/hippo/ast/GeneratorExpression;
    invoke-virtual {v3, p1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->setResult(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3459
    invoke-virtual {v3, v0}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->setLoops(Ljava/util/List;)V

    .line 3460
    if-eqz v2, :cond_3

    .line 3461
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->setIfPosition(I)V

    .line 3462
    iget-object v4, v2, Lcom/trendmicro/hippo/Parser$ConditionData;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->setFilter(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3463
    iget v4, v2, Lcom/trendmicro/hippo/Parser$ConditionData;->lp:I

    sub-int/2addr v4, p2

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->setFilterLp(I)V

    .line 3464
    iget v4, v2, Lcom/trendmicro/hippo/Parser$ConditionData;->rp:I

    sub-int/2addr v4, p2

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->setFilterRp(I)V

    .line 3466
    :cond_3
    return-object v3
.end method

.method private generatorExpressionLoop()Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3472
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->nextToken()I

    move-result v0

    const/16 v1, 0x78

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 3473
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 3474
    .local v0, "pos":I
    const/4 v1, -0x1

    .local v1, "lp":I
    const/4 v2, -0x1

    .local v2, "rp":I
    const/4 v3, -0x1

    .line 3475
    .local v3, "inPos":I
    new-instance v4, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;

    invoke-direct {v4, v0}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;-><init>(I)V

    .line 3477
    .local v4, "pn":Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/Parser;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 3479
    const/16 v5, 0x58

    :try_start_0
    const-string v6, "msg.no.paren.for"

    const/4 v7, 0x1

    invoke-direct {p0, v5, v6, v7}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 3480
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v1, v5, v0

    .line 3483
    :cond_1
    const/4 v5, 0x0

    .line 3484
    .local v5, "iter":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v6

    const/16 v8, 0x27

    if-eq v6, v8, :cond_3

    const/16 v9, 0x54

    if-eq v6, v9, :cond_2

    const/16 v9, 0x56

    if-eq v6, v9, :cond_2

    .line 3496
    const-string v6, "msg.bad.var"

    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    goto :goto_0

    .line 3488
    :cond_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->destructuringPrimaryExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v6

    move-object v5, v6

    .line 3489
    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/Parser;->markDestructuring(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3490
    goto :goto_0

    .line 3492
    :cond_3
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3493
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->createNameNode()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v6

    move-object v5, v6

    .line 3494
    nop

    .line 3501
    :goto_0
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v6

    if-ne v6, v8, :cond_4

    .line 3502
    const/16 v6, 0x9a

    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v8}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v6, v8, v7}, Lcom/trendmicro/hippo/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 3505
    :cond_4
    const/16 v6, 0x34

    const-string v8, "msg.in.after.for.name"

    invoke-direct {p0, v6, v8, v7}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 3506
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v6, v6, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v3, v6, v0

    .line 3507
    :cond_5
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v6

    .line 3508
    .local v6, "obj":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v8, 0x59

    const-string v9, "msg.no.paren.for.ctrl"

    invoke-direct {p0, v8, v9, v7}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 3509
    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v7, v7, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v2, v7, v0

    .line 3511
    :cond_6
    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v7, v7, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v7, v0

    invoke-virtual {v4, v7}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->setLength(I)V

    .line 3512
    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->setIterator(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3513
    invoke-virtual {v4, v6}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->setIteratedObject(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3514
    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->setInPosition(I)V

    .line 3515
    invoke-virtual {v4, v1, v2}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->setParens(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3516
    nop

    .line 3518
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 3516
    return-object v4

    .line 3518
    .end local v5    # "iter":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v6    # "obj":Lcom/trendmicro/hippo/ast/AstNode;
    :catchall_0
    move-exception v5

    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 3519
    throw v5
.end method

.method private getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;
    .locals 2

    .line 363
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentJsDocComment:Lcom/trendmicro/hippo/ast/Comment;

    .line 364
    .local v0, "saved":Lcom/trendmicro/hippo/ast/Comment;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/Parser;->currentJsDocComment:Lcom/trendmicro/hippo/ast/Comment;

    .line 365
    return-object v0
.end method

.method private getDirective(Lcom/trendmicro/hippo/ast/AstNode;)Ljava/lang/String;
    .locals 2
    .param p1, "n"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 795
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/ExpressionStatement;

    if-eqz v0, :cond_0

    .line 796
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ExpressionStatement;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ExpressionStatement;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 797
    .local v0, "e":Lcom/trendmicro/hippo/ast/AstNode;
    instance-of v1, v0, Lcom/trendmicro/hippo/ast/StringLiteral;

    if-eqz v1, :cond_0

    .line 798
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/ast/StringLiteral;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/StringLiteral;->getValue()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 801
    .end local v0    # "e":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private getNextStatementAfterInlineComments(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 3
    .param p1, "pn"    # Lcom/trendmicro/hippo/ast/AstNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1485
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->statement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 1486
    .local v0, "body":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v1

    const/16 v2, 0xa2

    if-ne v2, v1, :cond_1

    .line 1487
    move-object v1, v0

    .line 1488
    .local v1, "commentNode":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->statement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 1489
    if-eqz p1, :cond_0

    .line 1490
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/ast/AstNode;->setInlineComment(Lcom/trendmicro/hippo/ast/AstNode;)V

    goto :goto_0

    .line 1492
    :cond_0
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/AstNode;->setInlineComment(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1495
    .end local v1    # "commentNode":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_1
    :goto_0
    return-object v0
.end method

.method private getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I
    .locals 2
    .param p1, "n"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 338
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private getNumberOfEols(Ljava/lang/String;)I
    .locals 4
    .param p1, "comment"    # Ljava/lang/String;

    .line 370
    const/4 v0, 0x0

    .line 371
    .local v0, "lines":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 372
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    .line 373
    add-int/lit8 v0, v0, 0x1

    .line 371
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 376
    .end local v1    # "i":I
    :cond_1
    return v0
.end method

.method private ifStatement()Lcom/trendmicro/hippo/ast/IfStatement;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1311
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x71

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1312
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1313
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v0, "pos":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .local v1, "lineno":I
    const/4 v2, -0x1

    .line 1314
    .local v2, "elsePos":I
    new-instance v3, Lcom/trendmicro/hippo/ast/IfStatement;

    invoke-direct {v3, v0}, Lcom/trendmicro/hippo/ast/IfStatement;-><init>(I)V

    .line 1315
    .local v3, "pn":Lcom/trendmicro/hippo/ast/IfStatement;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->condition()Lcom/trendmicro/hippo/Parser$ConditionData;

    move-result-object v4

    .line 1316
    .local v4, "data":Lcom/trendmicro/hippo/Parser$ConditionData;
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/Parser;->getNextStatementAfterInlineComments(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    .local v5, "ifTrue":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v6, 0x0

    .line 1317
    .local v6, "ifFalse":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v7, 0x72

    const/4 v8, 0x1

    invoke-direct {p0, v7, v8}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1318
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v7

    .line 1319
    .local v7, "tt":I
    const/16 v9, 0xa2

    if-ne v7, v9, :cond_1

    .line 1320
    iget-object v9, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    sub-int/2addr v10, v8

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v3, v8}, Lcom/trendmicro/hippo/ast/IfStatement;->setElseKeyWordInlineComment(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1321
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1323
    :cond_1
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v8, v8, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v2, v8, v0

    .line 1324
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->statement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v6

    .line 1326
    .end local v7    # "tt":I
    :cond_2
    if-eqz v6, :cond_3

    move-object v7, v6

    goto :goto_0

    :cond_3
    move-object v7, v5

    :goto_0
    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v7

    .line 1327
    .local v7, "end":I
    sub-int v8, v7, v0

    invoke-virtual {v3, v8}, Lcom/trendmicro/hippo/ast/IfStatement;->setLength(I)V

    .line 1328
    iget-object v8, v4, Lcom/trendmicro/hippo/Parser$ConditionData;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v3, v8}, Lcom/trendmicro/hippo/ast/IfStatement;->setCondition(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1329
    iget v8, v4, Lcom/trendmicro/hippo/Parser$ConditionData;->lp:I

    sub-int/2addr v8, v0

    iget v9, v4, Lcom/trendmicro/hippo/Parser$ConditionData;->rp:I

    sub-int/2addr v9, v0

    invoke-virtual {v3, v8, v9}, Lcom/trendmicro/hippo/ast/IfStatement;->setParens(II)V

    .line 1330
    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/ast/IfStatement;->setThenPart(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1331
    invoke-virtual {v3, v6}, Lcom/trendmicro/hippo/ast/IfStatement;->setElsePart(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1332
    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ast/IfStatement;->setElsePosition(I)V

    .line 1333
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/ast/IfStatement;->setLineno(I)V

    .line 1334
    return-object v3
.end method

.method private let(ZI)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 8
    .param p1, "isStatement"    # Z
    .param p2, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2201
    new-instance v0, Lcom/trendmicro/hippo/ast/LetNode;

    invoke-direct {v0, p2}, Lcom/trendmicro/hippo/ast/LetNode;-><init>(I)V

    .line 2202
    .local v0, "pn":Lcom/trendmicro/hippo/ast/LetNode;
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/LetNode;->setLineno(I)V

    .line 2203
    const/16 v1, 0x58

    const-string v2, "msg.no.paren.after.let"

    const/4 v3, 0x1

    invoke-direct {p0, v1, v2, v3}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2204
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v1, p2

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/LetNode;->setLp(I)V

    .line 2205
    :cond_0
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Parser;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 2207
    :try_start_0
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    const/16 v2, 0x9a

    invoke-direct {p0, v2, v1, p1}, Lcom/trendmicro/hippo/Parser;->variables(IIZ)Lcom/trendmicro/hippo/ast/VariableDeclaration;

    move-result-object v1

    .line 2208
    .local v1, "vars":Lcom/trendmicro/hippo/ast/VariableDeclaration;
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/LetNode;->setVariables(Lcom/trendmicro/hippo/ast/VariableDeclaration;)V

    .line 2209
    const/16 v4, 0x59

    const-string v5, "msg.no.paren.let"

    invoke-direct {p0, v4, v5, v3}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2210
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v4, p2

    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/ast/LetNode;->setRp(I)V

    .line 2212
    :cond_1
    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v4

    const/16 v5, 0x56

    if-ne v4, v5, :cond_2

    .line 2214
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2215
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2216
    .local v4, "beg":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->statements()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    .line 2217
    .local v5, "stmt":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v6, 0x57

    const-string v7, "msg.no.curly.let"

    invoke-direct {p0, v6, v7, v3}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 2218
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v3, v4

    invoke-virtual {v5, v3}, Lcom/trendmicro/hippo/ast/AstNode;->setLength(I)V

    .line 2219
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v3, p2

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/ast/LetNode;->setLength(I)V

    .line 2220
    invoke-virtual {v0, v5}, Lcom/trendmicro/hippo/ast/LetNode;->setBody(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2221
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/ast/LetNode;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 2222
    nop

    .end local v4    # "beg":I
    .end local v5    # "stmt":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_1

    .line 2224
    :cond_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 2225
    .local v2, "expr":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v4

    sub-int/2addr v4, p2

    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/ast/LetNode;->setLength(I)V

    .line 2226
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/ast/LetNode;->setBody(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2227
    if-eqz p1, :cond_4

    .line 2229
    new-instance v4, Lcom/trendmicro/hippo/ast/ExpressionStatement;

    .line 2230
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->insideFunction()Z

    move-result v5

    if-nez v5, :cond_3

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    :goto_0
    invoke-direct {v4, v0, v3}, Lcom/trendmicro/hippo/ast/ExpressionStatement;-><init>(Lcom/trendmicro/hippo/ast/AstNode;Z)V

    move-object v3, v4

    .line 2231
    .local v3, "es":Lcom/trendmicro/hippo/ast/ExpressionStatement;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/LetNode;->getLineno()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/ExpressionStatement;->setLineno(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2232
    nop

    .line 2236
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 2232
    return-object v3

    .line 2236
    .end local v1    # "vars":Lcom/trendmicro/hippo/ast/VariableDeclaration;
    .end local v2    # "expr":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v3    # "es":Lcom/trendmicro/hippo/ast/ExpressionStatement;
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 2237
    nop

    .line 2238
    return-object v0

    .line 2236
    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 2237
    throw v1
.end method

.method private letStatement()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1889
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x9a

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1890
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1891
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .local v0, "lineno":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1893
    .local v2, "pos":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v3

    const/16 v4, 0x58

    const/4 v5, 0x1

    if-ne v3, v4, :cond_1

    .line 1894
    invoke-direct {p0, v5, v2}, Lcom/trendmicro/hippo/Parser;->let(ZI)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    .local v1, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 1896
    .end local v1    # "pn":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_1
    invoke-direct {p0, v1, v2, v5}, Lcom/trendmicro/hippo/Parser;->variables(IIZ)Lcom/trendmicro/hippo/ast/VariableDeclaration;

    move-result-object v1

    .line 1898
    .restart local v1    # "pn":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    .line 1899
    return-object v1
.end method

.method private lineBeginningFor(I)I
    .locals 5
    .param p1, "pos"    # I

    .line 3875
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->sourceChars:[C

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 3876
    return v1

    .line 3878
    :cond_0
    const/4 v0, 0x0

    if-gtz p1, :cond_1

    .line 3879
    return v0

    .line 3881
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->sourceChars:[C

    .line 3882
    .local v2, "buf":[C
    array-length v3, v2

    if-lt p1, v3, :cond_2

    .line 3883
    array-length v3, v2

    add-int/lit8 p1, v3, -0x1

    .line 3885
    :cond_2
    :goto_0
    add-int/2addr p1, v1

    if-ltz p1, :cond_4

    .line 3886
    aget-char v3, v2, p1

    .line 3887
    .local v3, "c":C
    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 3888
    add-int/lit8 v0, p1, 0x1

    return v0

    .line 3890
    .end local v3    # "c":C
    :cond_3
    goto :goto_0

    .line 3891
    :cond_4
    return v0
.end method

.method private makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;
    .locals 4

    .line 3845
    new-instance v0, Lcom/trendmicro/hippo/ast/ErrorNode;

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v2, v3

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/ast/ErrorNode;-><init>(II)V

    .line 3846
    .local v0, "pn":Lcom/trendmicro/hippo/ast/ErrorNode;
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/ErrorNode;->setLineno(I)V

    .line 3847
    return-object v0
.end method

.method private matchJumpLabelName()Lcom/trendmicro/hippo/ast/LabeledStatement;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1773
    const/4 v0, 0x0

    .line 1775
    .local v0, "label":Lcom/trendmicro/hippo/ast/LabeledStatement;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekTokenOrEOL()I

    move-result v1

    const/16 v2, 0x27

    if-ne v1, v2, :cond_1

    .line 1776
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1777
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->labelSet:Ljava/util/Map;

    if-eqz v1, :cond_0

    .line 1778
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/trendmicro/hippo/ast/LabeledStatement;

    .line 1780
    :cond_0
    if-nez v0, :cond_1

    .line 1781
    const-string v1, "msg.undef.label"

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1785
    :cond_1
    return-object v0
.end method

.method private matchToken(IZ)Z
    .locals 2
    .param p1, "toMatch"    # I
    .param p2, "ignoreComment"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 462
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0

    .line 463
    .local v0, "tt":I
    :goto_0
    const/16 v1, 0xa2

    if-ne v0, v1, :cond_0

    if-eqz p2, :cond_0

    .line 464
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 465
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0

    goto :goto_0

    .line 467
    :cond_0
    if-eq v0, p1, :cond_1

    .line 468
    const/4 v1, 0x0

    return v1

    .line 470
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 471
    const/4 v1, 0x1

    return v1
.end method

.method private memberExpr(Z)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 12
    .param p1, "allowCallSyntax"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2736
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0

    .local v0, "tt":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 2739
    .local v1, "lineno":I
    const/16 v2, 0x1e

    if-eq v0, v2, :cond_0

    .line 2740
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->primaryExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .local v2, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 2742
    .end local v2    # "pn":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2743
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2744
    .local v2, "pos":I
    new-instance v3, Lcom/trendmicro/hippo/ast/NewExpression;

    invoke-direct {v3, v2}, Lcom/trendmicro/hippo/ast/NewExpression;-><init>(I)V

    .line 2746
    .local v3, "nx":Lcom/trendmicro/hippo/ast/NewExpression;
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/Parser;->memberExpr(Z)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    .line 2747
    .local v4, "target":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v5

    .line 2748
    .local v5, "end":I
    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/NewExpression;->setTarget(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2750
    const/4 v6, -0x1

    .line 2751
    .local v6, "lp":I
    const/16 v7, 0x58

    const/4 v8, 0x1

    invoke-direct {p0, v7, v8}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 2752
    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v6, v7, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2753
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->argumentList()Ljava/util/List;

    move-result-object v7

    .line 2754
    .local v7, "args":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    if-eqz v7, :cond_1

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v9

    const/high16 v10, 0x10000

    if-le v9, v10, :cond_1

    .line 2755
    const-string v9, "msg.too.many.constructor.args"

    invoke-virtual {p0, v9}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2756
    :cond_1
    iget-object v9, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v9, v9, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2757
    .local v9, "rp":I
    iget-object v10, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v10, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 2758
    if-eqz v7, :cond_2

    .line 2759
    invoke-virtual {v3, v7}, Lcom/trendmicro/hippo/ast/NewExpression;->setArguments(Ljava/util/List;)V

    .line 2760
    :cond_2
    sub-int v10, v6, v2

    sub-int v11, v9, v2

    invoke-virtual {v3, v10, v11}, Lcom/trendmicro/hippo/ast/NewExpression;->setParens(II)V

    .line 2767
    .end local v7    # "args":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    .end local v9    # "rp":I
    :cond_3
    const/16 v7, 0x56

    invoke-direct {p0, v7, v8}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 2768
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->objectLiteral()Lcom/trendmicro/hippo/ast/ObjectLiteral;

    move-result-object v7

    .line 2769
    .local v7, "initializer":Lcom/trendmicro/hippo/ast/ObjectLiteral;
    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v5

    .line 2770
    invoke-virtual {v3, v7}, Lcom/trendmicro/hippo/ast/NewExpression;->setInitializer(Lcom/trendmicro/hippo/ast/ObjectLiteral;)V

    .line 2772
    .end local v7    # "initializer":Lcom/trendmicro/hippo/ast/ObjectLiteral;
    :cond_4
    sub-int v7, v5, v2

    invoke-virtual {v3, v7}, Lcom/trendmicro/hippo/ast/NewExpression;->setLength(I)V

    .line 2773
    move-object v7, v3

    move-object v2, v7

    .line 2775
    .end local v3    # "nx":Lcom/trendmicro/hippo/ast/NewExpression;
    .end local v4    # "target":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v5    # "end":I
    .end local v6    # "lp":I
    .local v2, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    .line 2776
    invoke-direct {p0, p1, v2}, Lcom/trendmicro/hippo/Parser;->memberExprTail(ZLcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    .line 2777
    .local v3, "tail":Lcom/trendmicro/hippo/ast/AstNode;
    return-object v3
.end method

.method private memberExprTail(ZLcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 10
    .param p1, "allowCallSyntax"    # Z
    .param p2, "pn"    # Lcom/trendmicro/hippo/ast/AstNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2791
    if-nez p2, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 2792
    :cond_0
    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v0

    .line 2796
    .local v0, "pos":I
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v1

    .line 2797
    .local v1, "tt":I
    const/16 v2, 0x54

    const/4 v3, 0x1

    if-eq v1, v2, :cond_9

    const/16 v2, 0x58

    const/high16 v4, 0x10000

    if-eq v1, v2, :cond_6

    const/16 v2, 0x6d

    if-eq v1, v2, :cond_5

    const/16 v2, 0x90

    if-eq v1, v2, :cond_5

    const/16 v2, 0x93

    if-eq v1, v2, :cond_3

    const/16 v2, 0xa2

    if-eq v1, v2, :cond_1

    .line 2872
    goto :goto_2

    .line 2867
    :cond_1
    iget v2, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    .line 2868
    .local v2, "currentFlagTOken":I
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/Parser;->peekUntilNonComment(I)I

    .line 2869
    iget v3, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    and-int/2addr v4, v3

    if-eqz v4, :cond_2

    goto :goto_1

    :cond_2
    move v3, v2

    :goto_1
    iput v3, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    .line 2870
    goto/16 :goto_3

    .line 2806
    .end local v2    # "currentFlagTOken":I
    :cond_3
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2807
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v2, "opPos":I
    const/4 v4, -0x1

    .line 2808
    .local v4, "rp":I
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 2809
    .local v5, "lineno":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->mustHaveXML()V

    .line 2810
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->setRequiresActivation()V

    .line 2811
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v6

    .line 2812
    .local v6, "filter":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0, v6}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v7

    .line 2813
    .local v7, "end":I
    const/16 v8, 0x59

    const-string v9, "msg.no.paren"

    invoke-direct {p0, v8, v9, v3}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 2814
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2815
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v7, v3, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 2817
    :cond_4
    new-instance v3, Lcom/trendmicro/hippo/ast/XmlDotQuery;

    sub-int v8, v7, v0

    invoke-direct {v3, v0, v8}, Lcom/trendmicro/hippo/ast/XmlDotQuery;-><init>(II)V

    .line 2818
    .local v3, "q":Lcom/trendmicro/hippo/ast/XmlDotQuery;
    invoke-virtual {v3, p2}, Lcom/trendmicro/hippo/ast/XmlDotQuery;->setLeft(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2819
    invoke-virtual {v3, v6}, Lcom/trendmicro/hippo/ast/XmlDotQuery;->setRight(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2820
    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ast/XmlDotQuery;->setOperatorPosition(I)V

    .line 2821
    sub-int v8, v4, v0

    invoke-virtual {v3, v8}, Lcom/trendmicro/hippo/ast/XmlDotQuery;->setRp(I)V

    .line 2822
    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/ast/XmlDotQuery;->setLineno(I)V

    .line 2823
    move-object p2, v3

    .line 2824
    goto/16 :goto_3

    .line 2800
    .end local v2    # "opPos":I
    .end local v3    # "q":Lcom/trendmicro/hippo/ast/XmlDotQuery;
    .end local v4    # "rp":I
    .end local v5    # "lineno":I
    .end local v6    # "filter":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v7    # "end":I
    :cond_5
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 2801
    .local v2, "lineno":I
    invoke-direct {p0, v1, p2}, Lcom/trendmicro/hippo/Parser;->propertyAccess(ILcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object p2

    .line 2802
    invoke-virtual {p2, v2}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    .line 2803
    goto/16 :goto_3

    .line 2845
    .end local v2    # "lineno":I
    :cond_6
    if-nez p1, :cond_7

    .line 2846
    nop

    .line 2875
    .end local v1    # "tt":I
    :goto_2
    return-object p2

    .line 2848
    .restart local v1    # "tt":I
    :cond_7
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 2849
    .restart local v2    # "lineno":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2850
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/Parser;->checkCallRequiresActivation(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2851
    new-instance v3, Lcom/trendmicro/hippo/ast/FunctionCall;

    invoke-direct {v3, v0}, Lcom/trendmicro/hippo/ast/FunctionCall;-><init>(I)V

    .line 2852
    .local v3, "f":Lcom/trendmicro/hippo/ast/FunctionCall;
    invoke-virtual {v3, p2}, Lcom/trendmicro/hippo/ast/FunctionCall;->setTarget(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2855
    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ast/FunctionCall;->setLineno(I)V

    .line 2856
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v5, v0

    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/ast/FunctionCall;->setLp(I)V

    .line 2857
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->argumentList()Ljava/util/List;

    move-result-object v5

    .line 2858
    .local v5, "args":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    if-eqz v5, :cond_8

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-le v6, v4, :cond_8

    .line 2859
    const-string v4, "msg.too.many.function.args"

    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2860
    :cond_8
    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/ast/FunctionCall;->setArguments(Ljava/util/List;)V

    .line 2861
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v4, v0

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/FunctionCall;->setRp(I)V

    .line 2862
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v4, v0

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/FunctionCall;->setLength(I)V

    .line 2863
    move-object p2, v3

    .line 2864
    goto :goto_3

    .line 2827
    .end local v2    # "lineno":I
    .end local v3    # "f":Lcom/trendmicro/hippo/ast/FunctionCall;
    .end local v5    # "args":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    :cond_9
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2828
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v2, "lb":I
    const/4 v4, -0x1

    .line 2829
    .local v4, "rb":I
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 2830
    .local v5, "lineno":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v6

    .line 2831
    .local v6, "expr":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0, v6}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v7

    .line 2832
    .restart local v7    # "end":I
    const/16 v8, 0x55

    const-string v9, "msg.no.bracket.index"

    invoke-direct {p0, v8, v9, v3}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 2833
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2834
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v7, v3, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 2836
    :cond_a
    new-instance v3, Lcom/trendmicro/hippo/ast/ElementGet;

    sub-int v8, v7, v0

    invoke-direct {v3, v0, v8}, Lcom/trendmicro/hippo/ast/ElementGet;-><init>(II)V

    .line 2837
    .local v3, "g":Lcom/trendmicro/hippo/ast/ElementGet;
    invoke-virtual {v3, p2}, Lcom/trendmicro/hippo/ast/ElementGet;->setTarget(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2838
    invoke-virtual {v3, v6}, Lcom/trendmicro/hippo/ast/ElementGet;->setElement(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2839
    invoke-virtual {v3, v2, v4}, Lcom/trendmicro/hippo/ast/ElementGet;->setParens(II)V

    .line 2840
    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/ast/ElementGet;->setLineno(I)V

    .line 2841
    move-object p2, v3

    .line 2842
    nop

    .line 2874
    .end local v1    # "tt":I
    .end local v2    # "lb":I
    .end local v3    # "g":Lcom/trendmicro/hippo/ast/ElementGet;
    .end local v4    # "rb":I
    .end local v5    # "lineno":I
    .end local v6    # "expr":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v7    # "end":I
    :goto_3
    goto/16 :goto_0
.end method

.method private methodDefinition(ILcom/trendmicro/hippo/ast/AstNode;I)Lcom/trendmicro/hippo/ast/ObjectProperty;
    .locals 5
    .param p1, "pos"    # I
    .param p2, "propName"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p3, "entryKind"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3711
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Parser;->function(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v1

    .line 3713
    .local v1, "fn":Lcom/trendmicro/hippo/ast/FunctionNode;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionName()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v2

    .line 3714
    .local v2, "name":Lcom/trendmicro/hippo/ast/Name;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/Name;->length()I

    move-result v3

    if-eqz v3, :cond_0

    .line 3715
    const-string v3, "msg.bad.prop"

    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3717
    :cond_0
    new-instance v3, Lcom/trendmicro/hippo/ast/ObjectProperty;

    invoke-direct {v3, p1}, Lcom/trendmicro/hippo/ast/ObjectProperty;-><init>(I)V

    .line 3718
    .local v3, "pn":Lcom/trendmicro/hippo/ast/ObjectProperty;
    if-eq p3, v0, :cond_3

    const/4 v0, 0x4

    if-eq p3, v0, :cond_2

    const/16 v0, 0x8

    if-eq p3, v0, :cond_1

    goto :goto_0

    .line 3728
    :cond_1
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/ObjectProperty;->setIsNormalMethod()V

    .line 3729
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->setFunctionIsNormalMethod()V

    goto :goto_0

    .line 3724
    :cond_2
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/ObjectProperty;->setIsSetterMethod()V

    .line 3725
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->setFunctionIsSetterMethod()V

    .line 3726
    goto :goto_0

    .line 3720
    :cond_3
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/ObjectProperty;->setIsGetterMethod()V

    .line 3721
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->setFunctionIsGetterMethod()V

    .line 3722
    nop

    .line 3732
    :goto_0
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v0

    .line 3733
    .local v0, "end":I
    invoke-virtual {v3, p2}, Lcom/trendmicro/hippo/ast/ObjectProperty;->setLeft(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3734
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/ast/ObjectProperty;->setRight(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3735
    sub-int v4, v0, p1

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/ObjectProperty;->setLength(I)V

    .line 3736
    return-object v3
.end method

.method private mulExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2555
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->unaryExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 2557
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v1

    .local v1, "tt":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2558
    .local v2, "opPos":I
    packed-switch v1, :pswitch_data_0

    .line 2566
    goto :goto_1

    .line 2562
    :pswitch_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2563
    new-instance v3, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->unaryExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v3, v1, v0, v4, v2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    move-object v0, v3

    .line 2564
    goto :goto_0

    .line 2568
    .end local v1    # "tt":I
    .end local v2    # "opPos":I
    :goto_1
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x17
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private mustHaveXML()V
    .locals 1

    .line 508
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->isXmlAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 509
    const-string v0, "msg.XML.not.available"

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 511
    :cond_0
    return-void
.end method

.method private mustMatchToken(ILjava/lang/String;IIZ)Z
    .locals 1
    .param p1, "toMatch"    # I
    .param p2, "msgId"    # Ljava/lang/String;
    .param p3, "pos"    # I
    .param p4, "len"    # I
    .param p5, "ignoreComment"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 500
    invoke-direct {p0, p1, p5}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 501
    const/4 v0, 0x1

    return v0

    .line 503
    :cond_0
    invoke-virtual {p0, p2, p3, p4}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;II)V

    .line 504
    const/4 v0, 0x0

    return v0
.end method

.method private mustMatchToken(ILjava/lang/String;Z)Z
    .locals 7
    .param p1, "toMatch"    # I
    .param p2, "messageId"    # Ljava/lang/String;
    .param p3, "ignoreComment"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 493
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v5, v0, v1

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;IIZ)Z

    move-result v0

    return v0
.end method

.method private name(II)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 5
    .param p1, "ttFlagged"    # I
    .param p2, "tt"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3238
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v0

    .line 3239
    .local v0, "nameString":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v1, "namePos":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 3240
    .local v2, "nameLineno":I
    const/high16 v3, 0x20000

    and-int/2addr v3, p1

    if-eqz v3, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v3

    const/16 v4, 0x68

    if-ne v3, v4, :cond_0

    .line 3243
    new-instance v3, Lcom/trendmicro/hippo/ast/Label;

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v4, v1

    invoke-direct {v3, v1, v4}, Lcom/trendmicro/hippo/ast/Label;-><init>(II)V

    .line 3244
    .local v3, "label":Lcom/trendmicro/hippo/ast/Label;
    invoke-virtual {v3, v0}, Lcom/trendmicro/hippo/ast/Label;->setName(Ljava/lang/String;)V

    .line 3245
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/Label;->setLineno(I)V

    .line 3246
    return-object v3

    .line 3251
    .end local v3    # "label":Lcom/trendmicro/hippo/ast/Label;
    :cond_0
    invoke-direct {p0, v1, v0, v2}, Lcom/trendmicro/hippo/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 3253
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/CompilerEnvirons;->isXmlAvailable()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 3254
    const/4 v3, -0x1

    const/4 v4, 0x0

    invoke-direct {p0, v3, v0, v4}, Lcom/trendmicro/hippo/Parser;->propertyName(ILjava/lang/String;I)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    return-object v3

    .line 3256
    :cond_1
    const/4 v3, 0x1

    const/16 v4, 0x27

    invoke-direct {p0, v3, v4}, Lcom/trendmicro/hippo/Parser;->createNameNode(ZI)Lcom/trendmicro/hippo/ast/Name;

    move-result-object v3

    return-object v3
.end method

.method private nameOrLabel()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2055
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x27

    if-ne v0, v1, :cond_7

    .line 2056
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2059
    .local v0, "pos":I
    iget v2, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    const/high16 v3, 0x20000

    or-int/2addr v2, v3

    iput v2, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    .line 2060
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 2062
    .local v2, "expr":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v4

    const/16 v5, 0x83

    if-eq v4, v5, :cond_0

    .line 2063
    new-instance v1, Lcom/trendmicro/hippo/ast/ExpressionStatement;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->insideFunction()Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/trendmicro/hippo/ast/ExpressionStatement;-><init>(Lcom/trendmicro/hippo/ast/AstNode;Z)V

    .line 2064
    .local v1, "n":Lcom/trendmicro/hippo/ast/AstNode;
    iget v3, v2, Lcom/trendmicro/hippo/ast/AstNode;->lineno:I

    iput v3, v1, Lcom/trendmicro/hippo/ast/AstNode;->lineno:I

    .line 2065
    return-object v1

    .line 2068
    .end local v1    # "n":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_0
    new-instance v4, Lcom/trendmicro/hippo/ast/LabeledStatement;

    invoke-direct {v4, v0}, Lcom/trendmicro/hippo/ast/LabeledStatement;-><init>(I)V

    .line 2069
    .local v4, "bundle":Lcom/trendmicro/hippo/ast/LabeledStatement;
    move-object v6, v2

    check-cast v6, Lcom/trendmicro/hippo/ast/Label;

    invoke-direct {p0, v6, v4}, Lcom/trendmicro/hippo/Parser;->recordLabel(Lcom/trendmicro/hippo/ast/Label;Lcom/trendmicro/hippo/ast/LabeledStatement;)V

    .line 2070
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v6, v6, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v4, v6}, Lcom/trendmicro/hippo/ast/LabeledStatement;->setLineno(I)V

    .line 2072
    const/4 v6, 0x0

    .line 2073
    .local v6, "stmt":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v7

    if-ne v7, v1, :cond_2

    .line 2074
    iget v7, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    or-int/2addr v7, v3

    iput v7, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    .line 2075
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 2076
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v7

    if-eq v7, v5, :cond_1

    .line 2077
    new-instance v1, Lcom/trendmicro/hippo/ast/ExpressionStatement;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->insideFunction()Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/trendmicro/hippo/ast/ExpressionStatement;-><init>(Lcom/trendmicro/hippo/ast/AstNode;Z)V

    move-object v6, v1

    .line 2078
    invoke-direct {p0, v6}, Lcom/trendmicro/hippo/Parser;->autoInsertSemicolon(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2079
    goto :goto_1

    .line 2081
    :cond_1
    move-object v7, v2

    check-cast v7, Lcom/trendmicro/hippo/ast/Label;

    invoke-direct {p0, v7, v4}, Lcom/trendmicro/hippo/Parser;->recordLabel(Lcom/trendmicro/hippo/ast/Label;Lcom/trendmicro/hippo/ast/LabeledStatement;)V

    goto :goto_0

    .line 2086
    :cond_2
    :goto_1
    const/4 v1, 0x0

    :try_start_0
    iput-object v4, p0, Lcom/trendmicro/hippo/Parser;->currentLabel:Lcom/trendmicro/hippo/ast/LabeledStatement;

    .line 2087
    if-nez v6, :cond_3

    .line 2088
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->statementHelper()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    move-object v6, v3

    .line 2089
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v3

    .line 2090
    .local v3, "ntt":I
    const/16 v5, 0xa2

    if-ne v3, v5, :cond_3

    invoke-virtual {v6}, Lcom/trendmicro/hippo/ast/AstNode;->getLineno()I

    move-result v5

    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trendmicro/hippo/ast/Comment;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/Comment;->getLineno()I

    move-result v7

    if-ne v5, v7, :cond_3

    .line 2091
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v6, v5}, Lcom/trendmicro/hippo/ast/AstNode;->setInlineComment(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2092
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2096
    .end local v3    # "ntt":I
    :cond_3
    iput-object v1, p0, Lcom/trendmicro/hippo/Parser;->currentLabel:Lcom/trendmicro/hippo/ast/LabeledStatement;

    .line 2098
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getLabels()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ast/Label;

    .line 2099
    .local v3, "lb":Lcom/trendmicro/hippo/ast/Label;
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->labelSet:Ljava/util/Map;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/Label;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2100
    .end local v3    # "lb":Lcom/trendmicro/hippo/ast/Label;
    goto :goto_2

    .line 2101
    :cond_4
    nop

    .line 2105
    invoke-virtual {v6}, Lcom/trendmicro/hippo/ast/AstNode;->getParent()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-nez v1, :cond_5

    .line 2106
    invoke-direct {p0, v6}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v1

    sub-int/2addr v1, v0

    goto :goto_3

    .line 2107
    :cond_5
    invoke-direct {p0, v6}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v1

    .line 2105
    :goto_3
    invoke-virtual {v4, v1}, Lcom/trendmicro/hippo/ast/LabeledStatement;->setLength(I)V

    .line 2108
    invoke-virtual {v4, v6}, Lcom/trendmicro/hippo/ast/LabeledStatement;->setStatement(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2109
    return-object v4

    .line 2096
    :catchall_0
    move-exception v3

    iput-object v1, p0, Lcom/trendmicro/hippo/Parser;->currentLabel:Lcom/trendmicro/hippo/ast/LabeledStatement;

    .line 2098
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getLabels()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/ast/Label;

    .line 2099
    .local v5, "lb":Lcom/trendmicro/hippo/ast/Label;
    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->labelSet:Ljava/util/Map;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/Label;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2100
    .end local v5    # "lb":Lcom/trendmicro/hippo/ast/Label;
    goto :goto_4

    .line 2101
    :cond_6
    throw v3

    .line 2055
    .end local v0    # "pos":I
    .end local v2    # "expr":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v4    # "bundle":Lcom/trendmicro/hippo/ast/LabeledStatement;
    .end local v6    # "stmt":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_7
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private nextFlaggedToken()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 453
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    .line 454
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    .line 455
    .local v0, "ttFlagged":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 456
    return v0
.end method

.method private nextToken()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 445
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0

    .line 446
    .local v0, "tt":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 447
    return v0
.end method

.method private nodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 3852
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private static final nowAllSet(III)Z
    .locals 1
    .param p0, "before"    # I
    .param p1, "after"    # I
    .param p2, "mask"    # I

    .line 1911
    and-int v0, p0, p2

    if-eq v0, p2, :cond_0

    and-int v0, p1, p2

    if-ne v0, p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private objectLiteral()Lcom/trendmicro/hippo/ast/ObjectLiteral;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3530
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v1, "pos":I
    iget-object v2, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 3531
    .local v2, "lineno":I
    const/4 v3, -0x1

    .line 3532
    .local v3, "afterComma":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 3533
    .local v4, "elems":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/ObjectProperty;>;"
    const/4 v5, 0x0

    .line 3534
    .local v5, "getterNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v6, 0x0

    .line 3535
    .local v6, "setterNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-boolean v7, v0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    if-eqz v7, :cond_0

    .line 3536
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    move-object v5, v7

    .line 3537
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    move-object v6, v7

    .line 3539
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v7

    .line 3543
    .local v7, "objJsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    :goto_0
    const/4 v8, 0x0

    .line 3544
    .local v8, "propertyName":Ljava/lang/String;
    const/4 v9, 0x1

    .line 3545
    .local v9, "entryKind":I
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v10

    .line 3546
    .local v10, "tt":I
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v11

    .line 3547
    .local v11, "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    const/16 v12, 0xa2

    if-ne v10, v12, :cond_1

    .line 3548
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3549
    invoke-direct {v0, v10}, Lcom/trendmicro/hippo/Parser;->peekUntilNonComment(I)I

    move-result v10

    .line 3551
    :cond_1
    const/16 v13, 0x57

    if-ne v10, v13, :cond_3

    .line 3552
    const/4 v14, -0x1

    if-eq v3, v14, :cond_2

    .line 3553
    invoke-direct {v0, v1, v4, v3}, Lcom/trendmicro/hippo/Parser;->warnTrailingComma(ILjava/util/List;I)V

    move/from16 v16, v3

    const/4 v12, 0x1

    goto/16 :goto_4

    .line 3552
    :cond_2
    move/from16 v16, v3

    const/4 v12, 0x1

    goto/16 :goto_4

    .line 3556
    :cond_3
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->objliteralProperty()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v14

    .line 3557
    .local v14, "pname":Lcom/trendmicro/hippo/ast/AstNode;
    const-string v15, "msg.bad.prop"

    const/16 v12, 0x5a

    if-nez v14, :cond_4

    .line 3558
    invoke-virtual {v0, v15}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    move/from16 v16, v3

    goto/16 :goto_2

    .line 3560
    :cond_4
    iget-object v13, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v13}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v8

    .line 3561
    iget-object v13, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v13, v13, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 3562
    .local v13, "ppos":I
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3572
    move/from16 v16, v3

    .end local v3    # "afterComma":I
    .local v16, "afterComma":I
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v3

    .line 3573
    .local v3, "peeked":I
    if-eq v3, v12, :cond_c

    const/16 v12, 0x68

    if-eq v3, v12, :cond_c

    const/16 v12, 0x57

    if-eq v3, v12, :cond_c

    .line 3577
    const/16 v12, 0x58

    if-ne v3, v12, :cond_5

    .line 3578
    const/16 v9, 0x8

    move/from16 v17, v3

    goto :goto_1

    .line 3579
    :cond_5
    invoke-virtual {v14}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v12

    move/from16 v17, v3

    .end local v3    # "peeked":I
    .local v17, "peeked":I
    const/16 v3, 0x27

    if-ne v12, v3, :cond_7

    .line 3580
    const-string v3, "get"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 3581
    const/4 v9, 0x2

    goto :goto_1

    .line 3582
    :cond_6
    const-string v3, "set"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 3583
    const/4 v9, 0x4

    .line 3586
    :cond_7
    :goto_1
    const/4 v3, 0x2

    if-eq v9, v3, :cond_8

    const/4 v3, 0x4

    if-ne v9, v3, :cond_a

    .line 3587
    :cond_8
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->objliteralProperty()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v14

    .line 3588
    if-nez v14, :cond_9

    .line 3589
    invoke-virtual {v0, v15}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3591
    :cond_9
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3593
    :cond_a
    if-nez v14, :cond_b

    .line 3594
    const/4 v8, 0x0

    goto :goto_2

    .line 3596
    :cond_b
    iget-object v3, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v8

    .line 3597
    invoke-direct {v0, v13, v14, v9}, Lcom/trendmicro/hippo/Parser;->methodDefinition(ILcom/trendmicro/hippo/ast/AstNode;I)Lcom/trendmicro/hippo/ast/ObjectProperty;

    move-result-object v3

    .line 3599
    .local v3, "objectProp":Lcom/trendmicro/hippo/ast/ObjectProperty;
    invoke-virtual {v14, v11}, Lcom/trendmicro/hippo/ast/AstNode;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    .line 3600
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3601
    .end local v3    # "objectProp":Lcom/trendmicro/hippo/ast/ObjectProperty;
    goto :goto_2

    .line 3573
    .end local v17    # "peeked":I
    .local v3, "peeked":I
    :cond_c
    move/from16 v17, v3

    .line 3603
    .end local v3    # "peeked":I
    .restart local v17    # "peeked":I
    invoke-virtual {v14, v11}, Lcom/trendmicro/hippo/ast/AstNode;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    .line 3604
    invoke-direct {v0, v14, v10}, Lcom/trendmicro/hippo/Parser;->plainProperty(Lcom/trendmicro/hippo/ast/AstNode;I)Lcom/trendmicro/hippo/ast/ObjectProperty;

    move-result-object v3

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3608
    .end local v13    # "ppos":I
    .end local v17    # "peeked":I
    :goto_2
    iget-boolean v3, v0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    if-eqz v3, :cond_14

    if-eqz v8, :cond_14

    .line 3609
    const-string v3, "msg.dup.obj.lit.prop.strict"

    const/4 v12, 0x1

    if-eq v9, v12, :cond_11

    const/4 v12, 0x2

    if-eq v9, v12, :cond_f

    const/4 v12, 0x4

    if-eq v9, v12, :cond_d

    const/16 v12, 0x8

    if-eq v9, v12, :cond_11

    goto :goto_3

    .line 3626
    :cond_d
    invoke-interface {v6, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_e

    .line 3627
    invoke-virtual {v0, v3, v8}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 3629
    :cond_e
    invoke-interface {v6, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 3620
    :cond_f
    invoke-interface {v5, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_10

    .line 3621
    invoke-virtual {v0, v3, v8}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 3623
    :cond_10
    invoke-interface {v5, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 3624
    goto :goto_3

    .line 3612
    :cond_11
    invoke-interface {v5, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_12

    .line 3613
    invoke-interface {v6, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_13

    .line 3614
    :cond_12
    invoke-virtual {v0, v3, v8}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 3616
    :cond_13
    invoke-interface {v5, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 3617
    invoke-interface {v6, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 3635
    :cond_14
    :goto_3
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    .line 3637
    const/16 v3, 0x5a

    const/4 v12, 0x1

    invoke-direct {v0, v3, v12}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 3638
    iget-object v3, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 3642
    .end local v8    # "propertyName":Ljava/lang/String;
    .end local v9    # "entryKind":I
    .end local v10    # "tt":I
    .end local v11    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .end local v14    # "pname":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v16    # "afterComma":I
    .local v3, "afterComma":I
    goto/16 :goto_0

    .line 3644
    .end local v3    # "afterComma":I
    .restart local v16    # "afterComma":I
    :cond_15
    :goto_4
    const-string v3, "msg.no.brace.prop"

    const/16 v8, 0x57

    invoke-direct {v0, v8, v3, v12}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 3645
    new-instance v3, Lcom/trendmicro/hippo/ast/ObjectLiteral;

    iget-object v8, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v8, v8, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v8, v1

    invoke-direct {v3, v1, v8}, Lcom/trendmicro/hippo/ast/ObjectLiteral;-><init>(II)V

    .line 3646
    .local v3, "pn":Lcom/trendmicro/hippo/ast/ObjectLiteral;
    if-eqz v7, :cond_16

    .line 3647
    invoke-virtual {v3, v7}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    .line 3649
    :cond_16
    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->setElements(Ljava/util/List;)V

    .line 3650
    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->setLineno(I)V

    .line 3651
    return-object v3
.end method

.method private objliteralProperty()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3656
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0

    .line 3657
    .local v0, "tt":I
    packed-switch v0, :pswitch_data_0

    .line 3672
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->isReservedKeywordAsIdentifier()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    .line 3673
    invoke-virtual {v1}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v2

    iget-boolean v3, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    invoke-static {v1, v2, v3}, Lcom/trendmicro/hippo/TokenStream;->isKeyword(Ljava/lang/String;IZ)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3675
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->createNameNode()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v1

    .line 3676
    .local v1, "pname":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 3663
    .end local v1    # "pname":Lcom/trendmicro/hippo/ast/AstNode;
    :pswitch_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->createStringLiteral()Lcom/trendmicro/hippo/ast/StringLiteral;

    move-result-object v1

    .line 3664
    .restart local v1    # "pname":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 3667
    .end local v1    # "pname":Lcom/trendmicro/hippo/ast/AstNode;
    :pswitch_1
    new-instance v1, Lcom/trendmicro/hippo/ast/NumberLiteral;

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    .line 3668
    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/TokenStream;->getNumber()D

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/trendmicro/hippo/ast/NumberLiteral;-><init>(ILjava/lang/String;D)V

    .line 3669
    .restart local v1    # "pname":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 3659
    .end local v1    # "pname":Lcom/trendmicro/hippo/ast/AstNode;
    :pswitch_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->createNameNode()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v1

    .line 3660
    .restart local v1    # "pname":Lcom/trendmicro/hippo/ast/AstNode;
    nop

    .line 3681
    :goto_0
    return-object v1

    .line 3678
    .end local v1    # "pname":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_0
    const/4 v1, 0x0

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x27
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private orExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2412
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->andExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 2413
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v1, 0x69

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2414
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2415
    .local v2, "opPos":I
    new-instance v3, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->orExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v3, v1, v0, v4, v2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    move-object v0, v3

    .line 2417
    .end local v2    # "opPos":I
    :cond_0
    return-object v0
.end method

.method private parenExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3207
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 3208
    .local v0, "wasInForInit":Z
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 3210
    :try_start_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v1

    .line 3211
    .local v1, "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 3212
    .local v2, "lineno":I
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 3213
    .local v3, "begin":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v4

    const/16 v5, 0x59

    if-ne v4, v5, :cond_0

    new-instance v4, Lcom/trendmicro/hippo/ast/EmptyExpression;

    invoke-direct {v4, v3}, Lcom/trendmicro/hippo/ast/EmptyExpression;-><init>(I)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    .line 3214
    .local v4, "e":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v6

    const/16 v7, 0x78

    if-ne v6, v7, :cond_1

    .line 3215
    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/Parser;->generatorExpression(Lcom/trendmicro/hippo/ast/AstNode;I)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3233
    iput-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 3215
    return-object v5

    .line 3217
    :cond_1
    :try_start_1
    const-string v6, "msg.no.paren"

    const/4 v7, 0x1

    invoke-direct {p0, v5, v6, v7}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 3218
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v5

    const/16 v6, 0x81

    if-ne v5, v6, :cond_2

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v5

    const/16 v6, 0xa5

    if-eq v5, v6, :cond_2

    .line 3219
    const-string v5, "msg.syntax"

    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3220
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;

    move-result-object v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3233
    iput-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 3220
    return-object v5

    .line 3222
    :cond_2
    :try_start_2
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v5, v3

    .line 3223
    .local v5, "length":I
    new-instance v6, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;

    invoke-direct {v6, v3, v5, v4}, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;-><init>(IILcom/trendmicro/hippo/ast/AstNode;)V

    .line 3224
    .local v6, "pn":Lcom/trendmicro/hippo/ast/ParenthesizedExpression;
    invoke-virtual {v6, v2}, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->setLineno(I)V

    .line 3225
    if-nez v1, :cond_3

    .line 3226
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v7

    move-object v1, v7

    .line 3228
    :cond_3
    if-eqz v1, :cond_4

    .line 3229
    invoke-virtual {v6, v1}, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 3231
    :cond_4
    nop

    .line 3233
    iput-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 3231
    return-object v6

    .line 3233
    .end local v1    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .end local v2    # "lineno":I
    .end local v3    # "begin":I
    .end local v4    # "e":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v5    # "length":I
    .end local v6    # "pn":Lcom/trendmicro/hippo/ast/ParenthesizedExpression;
    :catchall_0
    move-exception v1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    .line 3234
    throw v1
.end method

.method private parse()Lcom/trendmicro/hippo/ast/AstRoot;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 625
    const/4 v0, 0x0

    .line 626
    .local v0, "pos":I
    new-instance v1, Lcom/trendmicro/hippo/ast/AstRoot;

    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/ast/AstRoot;-><init>(I)V

    .line 627
    .local v1, "root":Lcom/trendmicro/hippo/ast/AstRoot;
    iput-object v1, p0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    iput-object v1, p0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 629
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 630
    .local v2, "baseLineno":I
    move v3, v0

    .line 632
    .local v3, "end":I
    const/4 v4, 0x1

    .line 633
    .local v4, "inDirectivePrologue":Z
    iget-boolean v9, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    .line 635
    .local v9, "savedStrictMode":Z
    iget-boolean v5, p0, Lcom/trendmicro/hippo/Parser;->defaultUseStrictDirective:Z

    iput-boolean v5, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    .line 636
    const/4 v6, 0x1

    if-eqz v5, :cond_0

    .line 637
    invoke-virtual {v1, v6}, Lcom/trendmicro/hippo/ast/AstRoot;->setInStrictMode(Z)V

    .line 642
    :cond_0
    :goto_0
    :try_start_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v5

    .line 643
    .local v5, "tt":I
    if-gtz v5, :cond_1

    .line 644
    goto :goto_2

    .line 648
    :cond_1
    const/16 v7, 0x6e

    if-ne v5, v7, :cond_3

    .line 649
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V
    :try_end_0
    .catch Ljava/lang/StackOverflowError; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 651
    :try_start_1
    iget-boolean v7, p0, Lcom/trendmicro/hippo/Parser;->calledByCompileFunction:Z

    if-eqz v7, :cond_2

    .line 652
    const/4 v7, 0x2

    goto :goto_1

    .line 653
    :cond_2
    move v7, v6

    .line 651
    :goto_1
    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/Parser;->function(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v7
    :try_end_1
    .catch Lcom/trendmicro/hippo/Parser$ParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/StackOverflowError; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 656
    .local v7, "n":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_3

    .line 654
    .end local v7    # "n":Lcom/trendmicro/hippo/ast/AstNode;
    :catch_0
    move-exception v7

    .line 655
    .local v7, "e":Lcom/trendmicro/hippo/Parser$ParserException;
    nop

    .line 682
    .end local v5    # "tt":I
    .end local v7    # "e":Lcom/trendmicro/hippo/Parser$ParserException;
    :goto_2
    iput-boolean v9, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    .line 683
    move v10, v3

    move v11, v4

    goto :goto_4

    .line 657
    .restart local v5    # "tt":I
    :cond_3
    const/16 v7, 0xa2

    if-ne v5, v7, :cond_4

    .line 658
    :try_start_2
    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v8, v6

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trendmicro/hippo/ast/AstNode;

    .line 659
    .local v7, "n":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    goto :goto_3

    .line 661
    .end local v7    # "n":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_4
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->statement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v7

    .line 662
    .restart local v7    # "n":Lcom/trendmicro/hippo/ast/AstNode;
    if-eqz v4, :cond_6

    .line 663
    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/Parser;->getDirective(Lcom/trendmicro/hippo/ast/AstNode;)Ljava/lang/String;

    move-result-object v8

    .line 664
    .local v8, "directive":Ljava/lang/String;
    if-nez v8, :cond_5

    .line 665
    const/4 v4, 0x0

    goto :goto_3

    .line 666
    :cond_5
    const-string v10, "use strict"

    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 667
    iput-boolean v6, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    .line 668
    invoke-virtual {v1, v6}, Lcom/trendmicro/hippo/ast/AstRoot;->setInStrictMode(Z)V

    .line 672
    .end local v8    # "directive":Ljava/lang/String;
    :cond_6
    :goto_3
    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v8

    move v3, v8

    .line 673
    invoke-virtual {v1, v7}, Lcom/trendmicro/hippo/ast/AstRoot;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 674
    invoke-virtual {v7, v1}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V
    :try_end_2
    .catch Ljava/lang/StackOverflowError; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 675
    .end local v5    # "tt":I
    .end local v7    # "n":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 682
    :catchall_0
    move-exception v5

    goto/16 :goto_7

    .line 676
    :catch_1
    move-exception v5

    .line 677
    .local v5, "ex":Ljava/lang/StackOverflowError;
    :try_start_3
    const-string v7, "msg.too.deep.parser.recursion"

    invoke-virtual {p0, v7}, Lcom/trendmicro/hippo/Parser;->lookupMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 678
    .local v7, "msg":Ljava/lang/String;
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v8}, Lcom/trendmicro/hippo/CompilerEnvirons;->isIdeMode()Z

    move-result v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v8, :cond_a

    .end local v5    # "ex":Ljava/lang/StackOverflowError;
    .end local v7    # "msg":Ljava/lang/String;
    goto :goto_2

    .line 685
    .end local v3    # "end":I
    .end local v4    # "inDirectivePrologue":Z
    .local v10, "end":I
    .local v11, "inDirectivePrologue":Z
    :goto_4
    iget v3, p0, Lcom/trendmicro/hippo/Parser;->syntaxErrorCount:I

    if-eqz v3, :cond_8

    .line 686
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    .line 687
    .local v3, "msg":Ljava/lang/String;
    const-string v4, "msg.got.syntax.errors"

    invoke-virtual {p0, v4, v3}, Lcom/trendmicro/hippo/Parser;->lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 688
    .end local v3    # "msg":Ljava/lang/String;
    .local v12, "msg":Ljava/lang/String;
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/CompilerEnvirons;->isIdeMode()Z

    move-result v3

    if-eqz v3, :cond_7

    goto :goto_5

    .line 689
    :cond_7
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v4, v12

    move v6, v2

    invoke-interface/range {v3 .. v8}, Lcom/trendmicro/hippo/ErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v3

    throw v3

    .line 694
    .end local v12    # "msg":Ljava/lang/String;
    :cond_8
    :goto_5
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    if-eqz v3, :cond_9

    .line 697
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v6

    .line 698
    .local v3, "last":I
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v4

    invoke-static {v10, v4}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 699
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/ast/Comment;

    .line 700
    .local v5, "c":Lcom/trendmicro/hippo/ast/Comment;
    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/ast/AstRoot;->addComment(Lcom/trendmicro/hippo/ast/Comment;)V

    .line 701
    .end local v5    # "c":Lcom/trendmicro/hippo/ast/Comment;
    goto :goto_6

    .line 704
    .end local v3    # "last":I
    :cond_9
    sub-int v3, v10, v0

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ast/AstRoot;->setLength(I)V

    .line 705
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ast/AstRoot;->setSourceName(Ljava/lang/String;)V

    .line 706
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstRoot;->setBaseLineno(I)V

    .line 707
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ast/AstRoot;->setEndLineno(I)V

    .line 708
    return-object v1

    .line 679
    .end local v10    # "end":I
    .end local v11    # "inDirectivePrologue":Z
    .local v3, "end":I
    .restart local v4    # "inDirectivePrologue":Z
    .local v5, "ex":Ljava/lang/StackOverflowError;
    .restart local v7    # "msg":Ljava/lang/String;
    :cond_a
    :try_start_4
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v8, v8, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {v7, v6, v8, v10, v11}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v6

    .end local v0    # "pos":I
    .end local v1    # "root":Lcom/trendmicro/hippo/ast/AstRoot;
    .end local v2    # "baseLineno":I
    .end local v3    # "end":I
    .end local v4    # "inDirectivePrologue":Z
    .end local v9    # "savedStrictMode":Z
    throw v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 682
    .end local v5    # "ex":Ljava/lang/StackOverflowError;
    .end local v7    # "msg":Ljava/lang/String;
    .restart local v0    # "pos":I
    .restart local v1    # "root":Lcom/trendmicro/hippo/ast/AstRoot;
    .restart local v2    # "baseLineno":I
    .restart local v3    # "end":I
    .restart local v4    # "inDirectivePrologue":Z
    .restart local v9    # "savedStrictMode":Z
    :goto_7
    iput-boolean v9, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    .line 683
    throw v5
.end method

.method private parseFunctionBody(ILcom/trendmicro/hippo/ast/FunctionNode;)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 12
    .param p1, "type"    # I
    .param p2, "fnNode"    # Lcom/trendmicro/hippo/ast/FunctionNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 714
    const/4 v0, 0x0

    .line 715
    .local v0, "isExpressionClosure":Z
    const/16 v1, 0x56

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v1

    const/4 v3, 0x4

    if-nez v1, :cond_1

    .line 716
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v1

    const/16 v4, 0xb4

    if-ge v1, v4, :cond_0

    if-eq p1, v3, :cond_0

    .line 717
    const-string v1, "msg.no.brace.body"

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    goto :goto_0

    .line 719
    :cond_0
    const/4 v0, 0x1

    .line 722
    :cond_1
    :goto_0
    if-ne p1, v3, :cond_2

    move v1, v2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    .line 723
    .local v1, "isArrow":Z
    :goto_1
    iget v3, p0, Lcom/trendmicro/hippo/Parser;->nestingOfFunction:I

    add-int/2addr v3, v2

    iput v3, p0, Lcom/trendmicro/hippo/Parser;->nestingOfFunction:I

    .line 724
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 725
    .local v3, "pos":I
    new-instance v4, Lcom/trendmicro/hippo/ast/Block;

    invoke-direct {v4, v3}, Lcom/trendmicro/hippo/ast/Block;-><init>(I)V

    .line 727
    .local v4, "pn":Lcom/trendmicro/hippo/ast/Block;
    const/4 v5, 0x1

    .line 728
    .local v5, "inDirectivePrologue":Z
    iget-boolean v6, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    .line 731
    .local v6, "savedStrictMode":Z
    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v7, v7, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v4, v7}, Lcom/trendmicro/hippo/ast/Block;->setLineno(I)V

    .line 733
    const/16 v7, 0x57

    if-eqz v0, :cond_4

    .line 734
    :try_start_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->assignExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v8

    .line 735
    .local v8, "returnValue":Lcom/trendmicro/hippo/ast/AstNode;
    new-instance v9, Lcom/trendmicro/hippo/ast/ReturnStatement;

    invoke-virtual {v8}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v10

    invoke-virtual {v8}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v11

    invoke-direct {v9, v10, v11, v8}, Lcom/trendmicro/hippo/ast/ReturnStatement;-><init>(IILcom/trendmicro/hippo/ast/AstNode;)V

    .line 737
    .local v9, "n":Lcom/trendmicro/hippo/ast/ReturnStatement;
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v11, 0x19

    invoke-virtual {v9, v11, v10}, Lcom/trendmicro/hippo/ast/ReturnStatement;->putProp(ILjava/lang/Object;)V

    .line 738
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, v11, v10}, Lcom/trendmicro/hippo/ast/Block;->putProp(ILjava/lang/Object;)V

    .line 739
    if-eqz v1, :cond_3

    .line 740
    const/16 v10, 0x1b

    sget-object v11, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v9, v10, v11}, Lcom/trendmicro/hippo/ast/ReturnStatement;->putProp(ILjava/lang/Object;)V

    .line 742
    :cond_3
    invoke-virtual {v4, v9}, Lcom/trendmicro/hippo/ast/Block;->addStatement(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 743
    .end local v8    # "returnValue":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v9    # "n":Lcom/trendmicro/hippo/ast/ReturnStatement;
    goto :goto_4

    .line 746
    :cond_4
    :goto_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v8

    .line 747
    .local v8, "tt":I
    const/4 v9, -0x1

    if-eq v8, v9, :cond_9

    if-eqz v8, :cond_9

    if-eq v8, v7, :cond_9

    const/16 v9, 0x6e

    if-eq v8, v9, :cond_7

    const/16 v9, 0xa2

    if-eq v8, v9, :cond_6

    .line 761
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->statement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v9

    .line 762
    .local v9, "n":Lcom/trendmicro/hippo/ast/AstNode;
    if-eqz v5, :cond_8

    .line 763
    invoke-direct {p0, v9}, Lcom/trendmicro/hippo/Parser;->getDirective(Lcom/trendmicro/hippo/ast/AstNode;)Ljava/lang/String;

    move-result-object v10

    .line 764
    .local v10, "directive":Ljava/lang/String;
    if-nez v10, :cond_5

    .line 765
    const/4 v5, 0x0

    goto :goto_3

    .line 766
    :cond_5
    const-string v11, "use strict"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 767
    iput-boolean v2, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    .line 768
    invoke-virtual {p2, v2}, Lcom/trendmicro/hippo/ast/FunctionNode;->setInStrictMode(Z)V

    .line 769
    if-nez v6, :cond_8

    .line 770
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->setRequiresActivation()V

    goto :goto_3

    .line 753
    .end local v9    # "n":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v10    # "directive":Ljava/lang/String;
    :cond_6
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 754
    iget-object v9, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    iget-object v10, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    sub-int/2addr v10, v2

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/trendmicro/hippo/ast/AstNode;

    .line 755
    .restart local v9    # "n":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_3

    .line 757
    .end local v9    # "n":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_7
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 758
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Parser;->function(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v9

    .line 759
    .restart local v9    # "n":Lcom/trendmicro/hippo/ast/AstNode;
    nop

    .line 776
    :cond_8
    :goto_3
    invoke-virtual {v4, v9}, Lcom/trendmicro/hippo/ast/Block;->addStatement(Lcom/trendmicro/hippo/ast/AstNode;)V
    :try_end_0
    .catch Lcom/trendmicro/hippo/Parser$ParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 777
    .end local v8    # "tt":I
    .end local v9    # "n":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_2

    .line 751
    .restart local v8    # "tt":I
    :cond_9
    goto :goto_4

    .line 782
    .end local v8    # "tt":I
    :catchall_0
    move-exception v7

    iget v8, p0, Lcom/trendmicro/hippo/Parser;->nestingOfFunction:I

    sub-int/2addr v8, v2

    iput v8, p0, Lcom/trendmicro/hippo/Parser;->nestingOfFunction:I

    .line 783
    iput-boolean v6, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    .line 784
    throw v7

    .line 779
    :catch_0
    move-exception v8

    .line 782
    :goto_4
    iget v8, p0, Lcom/trendmicro/hippo/Parser;->nestingOfFunction:I

    sub-int/2addr v8, v2

    iput v8, p0, Lcom/trendmicro/hippo/Parser;->nestingOfFunction:I

    .line 783
    iput-boolean v6, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    .line 784
    nop

    .line 786
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v8, v8, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 787
    .local v8, "end":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    .line 788
    if-nez v0, :cond_a

    const-string v9, "msg.no.brace.after.body"

    invoke-direct {p0, v7, v9, v2}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 789
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v8, v2, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 790
    :cond_a
    sub-int v2, v8, v3

    invoke-virtual {v4, v2}, Lcom/trendmicro/hippo/ast/Block;->setLength(I)V

    .line 791
    return-object v4
.end method

.method private parseFunctionParams(Lcom/trendmicro/hippo/ast/FunctionNode;)V
    .locals 10
    .param p1, "fnNode"    # Lcom/trendmicro/hippo/ast/FunctionNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 807
    const/16 v0, 0x59

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 808
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getPosition()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->setRp(I)V

    .line 809
    return-void

    .line 813
    :cond_0
    const/4 v2, 0x0

    .line 814
    .local v2, "destructuring":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Node;>;"
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 816
    .local v3, "paramNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v4

    .line 817
    .local v4, "tt":I
    const/16 v5, 0x54

    const/16 v6, 0x58

    if-eq v4, v5, :cond_8

    const/16 v5, 0x56

    if-ne v4, v5, :cond_1

    goto :goto_1

    .line 831
    :cond_1
    const/16 v5, 0x27

    const-string v7, "msg.no.parm"

    invoke-direct {p0, v5, v7, v1}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 832
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->createNameNode()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v5

    .line 833
    .local v5, "paramNameNode":Lcom/trendmicro/hippo/ast/Name;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v7

    .line 834
    .local v7, "jsdocNodeForName":Lcom/trendmicro/hippo/ast/Comment;
    if-eqz v7, :cond_2

    .line 835
    invoke-virtual {v5, v7}, Lcom/trendmicro/hippo/ast/Name;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    .line 837
    :cond_2
    invoke-virtual {p1, v5}, Lcom/trendmicro/hippo/ast/FunctionNode;->addParam(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 838
    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v8}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v8

    .line 839
    .local v8, "paramName":Ljava/lang/String;
    invoke-virtual {p0, v6, v8}, Lcom/trendmicro/hippo/Parser;->defineSymbol(ILjava/lang/String;)V

    .line 840
    iget-boolean v6, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    if-eqz v6, :cond_6

    .line 841
    const-string v6, "eval"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 842
    const-string v6, "arguments"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 844
    :cond_3
    const-string v6, "msg.bad.id.strict"

    invoke-virtual {p0, v6, v8}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 846
    :cond_4
    invoke-interface {v3, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 847
    const-string v6, "msg.dup.param.strict"

    invoke-virtual {p0, v6, v8}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 848
    :cond_5
    invoke-interface {v3, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 850
    .end local v5    # "paramNameNode":Lcom/trendmicro/hippo/ast/Name;
    .end local v7    # "jsdocNodeForName":Lcom/trendmicro/hippo/ast/Comment;
    .end local v8    # "paramName":Ljava/lang/String;
    :cond_6
    goto :goto_2

    .line 851
    :cond_7
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/trendmicro/hippo/ast/FunctionNode;->addParam(Lcom/trendmicro/hippo/ast/AstNode;)V

    goto :goto_2

    .line 818
    :cond_8
    :goto_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->destructuringPrimaryExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    .line 819
    .local v5, "expr":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/Parser;->markDestructuring(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 820
    invoke-virtual {p1, v5}, Lcom/trendmicro/hippo/ast/FunctionNode;->addParam(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 824
    if-nez v2, :cond_9

    .line 825
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    move-object v2, v7

    .line 827
    :cond_9
    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v7

    .line 828
    .local v7, "pname":Ljava/lang/String;
    const/4 v8, 0x0

    invoke-virtual {p0, v6, v7, v8}, Lcom/trendmicro/hippo/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 829
    invoke-interface {v2, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 830
    .end local v5    # "expr":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v7    # "pname":Ljava/lang/String;
    nop

    .line 854
    .end local v4    # "tt":I
    :goto_2
    const/16 v4, 0x5a

    invoke-direct {p0, v4, v1}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v5

    if-nez v5, :cond_d

    .line 856
    if-eqz v2, :cond_b

    .line 857
    new-instance v5, Lcom/trendmicro/hippo/Node;

    invoke-direct {v5, v4}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v4, v5

    .line 859
    .local v4, "destructuringNode":Lcom/trendmicro/hippo/Node;
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 860
    .local v6, "param":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/trendmicro/hippo/Node;>;"
    const/16 v7, 0x7b

    .line 861
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/trendmicro/hippo/Node;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {p0, v9}, Lcom/trendmicro/hippo/Parser;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v9

    .line 860
    invoke-virtual {p0, v7, v8, v9}, Lcom/trendmicro/hippo/Parser;->createDestructuringAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v7

    .line 862
    .local v7, "assign":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v4, v7}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 864
    .end local v6    # "param":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/trendmicro/hippo/Node;>;"
    .end local v7    # "assign":Lcom/trendmicro/hippo/Node;
    goto :goto_3

    .line 865
    :cond_a
    const/16 v5, 0x17

    invoke-virtual {p1, v5, v4}, Lcom/trendmicro/hippo/ast/FunctionNode;->putProp(ILjava/lang/Object;)V

    .line 868
    .end local v4    # "destructuringNode":Lcom/trendmicro/hippo/Node;
    :cond_b
    const-string v4, "msg.no.paren.after.parms"

    invoke-direct {p0, v0, v4, v1}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 869
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getPosition()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->setRp(I)V

    .line 871
    :cond_c
    return-void

    .line 854
    :cond_d
    goto/16 :goto_0
.end method

.method private peekFlaggedToken()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 434
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    .line 435
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    return v0
.end method

.method private peekToken()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 400
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    if-eqz v0, :cond_0

    .line 401
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    return v0

    .line 404
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/TokenStream;->getLineno()I

    move-result v0

    .line 405
    .local v0, "lineno":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/TokenStream;->getToken()I

    move-result v1

    .line 406
    .local v1, "tt":I
    const/4 v2, 0x0

    .line 409
    .local v2, "sawEOL":Z
    :goto_0
    const/4 v3, 0x1

    if-eq v1, v3, :cond_1

    const/16 v4, 0xa2

    if-ne v1, v4, :cond_3

    .line 410
    :cond_1
    if-ne v1, v3, :cond_2

    .line 411
    add-int/lit8 v0, v0, 0x1

    .line 412
    const/4 v2, 0x1

    .line 413
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->getToken()I

    move-result v1

    goto :goto_0

    .line 415
    :cond_2
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/CompilerEnvirons;->isRecordingComments()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 416
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->getAndResetCurrentComment()Ljava/lang/String;

    move-result-object v3

    .line 417
    .local v3, "comment":Ljava/lang/String;
    invoke-direct {p0, v0, v3}, Lcom/trendmicro/hippo/Parser;->recordComment(ILjava/lang/String;)V

    .line 420
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/Parser;->getNumberOfEols(Ljava/lang/String;)I

    move-result v4

    add-int/2addr v0, v4

    .line 421
    nop

    .line 426
    .end local v3    # "comment":Ljava/lang/String;
    :cond_3
    iput v1, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    .line 427
    if-eqz v2, :cond_4

    const/high16 v3, 0x10000

    goto :goto_1

    :cond_4
    const/4 v3, 0x0

    :goto_1
    or-int/2addr v3, v1

    iput v3, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    .line 428
    iget v3, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    return v3

    .line 422
    :cond_5
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->getToken()I

    move-result v1

    goto :goto_0
.end method

.method private peekTokenOrEOL()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 482
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0

    .line 484
    .local v0, "tt":I
    iget v1, p0, Lcom/trendmicro/hippo/Parser;->currentFlaggedToken:I

    const/high16 v2, 0x10000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    .line 485
    const/4 v0, 0x1

    .line 487
    :cond_0
    return v0
.end method

.method private peekUntilNonComment(I)I
    .locals 1
    .param p1, "tt"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1477
    :goto_0
    const/16 v0, 0xa2

    if-ne p1, v0, :cond_0

    .line 1478
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1479
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result p1

    goto :goto_0

    .line 1481
    :cond_0
    return p1
.end method

.method private plainProperty(Lcom/trendmicro/hippo/ast/AstNode;I)Lcom/trendmicro/hippo/ast/ObjectProperty;
    .locals 5
    .param p1, "property"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "ptt"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3689
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0

    .line 3690
    .local v0, "tt":I
    const/16 v1, 0x5a

    if-eq v0, v1, :cond_0

    const/16 v1, 0x57

    if-ne v0, v1, :cond_2

    :cond_0
    const/16 v1, 0x27

    if-ne p2, v1, :cond_2

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 3691
    invoke-virtual {v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v1

    const/16 v2, 0xb4

    if-lt v1, v2, :cond_2

    .line 3692
    iget-boolean v1, p0, Lcom/trendmicro/hippo/Parser;->inDestructuringAssignment:Z

    if-nez v1, :cond_1

    .line 3693
    const-string v1, "msg.bad.object.init"

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3695
    :cond_1
    new-instance v1, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v2

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/trendmicro/hippo/ast/Name;-><init>(ILjava/lang/String;)V

    .line 3696
    .local v1, "nn":Lcom/trendmicro/hippo/ast/AstNode;
    new-instance v2, Lcom/trendmicro/hippo/ast/ObjectProperty;

    invoke-direct {v2}, Lcom/trendmicro/hippo/ast/ObjectProperty;-><init>()V

    .line 3697
    .local v2, "pn":Lcom/trendmicro/hippo/ast/ObjectProperty;
    const/16 v3, 0x1a

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v3, v4}, Lcom/trendmicro/hippo/ast/ObjectProperty;->putProp(ILjava/lang/Object;)V

    .line 3698
    invoke-virtual {v2, p1, v1}, Lcom/trendmicro/hippo/ast/ObjectProperty;->setLeftAndRight(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3699
    return-object v2

    .line 3701
    .end local v1    # "nn":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v2    # "pn":Lcom/trendmicro/hippo/ast/ObjectProperty;
    :cond_2
    const/16 v1, 0x68

    const/4 v2, 0x1

    const-string v3, "msg.no.colon.prop"

    invoke-direct {p0, v1, v3, v2}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 3702
    new-instance v1, Lcom/trendmicro/hippo/ast/ObjectProperty;

    invoke-direct {v1}, Lcom/trendmicro/hippo/ast/ObjectProperty;-><init>()V

    .line 3703
    .local v1, "pn":Lcom/trendmicro/hippo/ast/ObjectProperty;
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/ObjectProperty;->setOperatorPosition(I)V

    .line 3704
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->assignExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lcom/trendmicro/hippo/ast/ObjectProperty;->setLeftAndRight(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3705
    return-object v1
.end method

.method private primaryExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3102
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekFlaggedToken()I

    move-result v0

    .line 3103
    .local v0, "ttFlagged":I
    const v1, 0xffff

    and-int/2addr v1, v0

    .line 3105
    .local v1, "tt":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_e

    if-eqz v1, :cond_d

    const/16 v2, 0x18

    if-eq v1, v2, :cond_c

    const/16 v2, 0x54

    if-eq v1, v2, :cond_b

    const/16 v2, 0x56

    if-eq v1, v2, :cond_a

    const/16 v2, 0x58

    if-eq v1, v2, :cond_9

    const/16 v2, 0x65

    if-eq v1, v2, :cond_c

    const/16 v2, 0x6e

    if-eq v1, v2, :cond_8

    const/16 v2, 0x80

    if-eq v1, v2, :cond_7

    const/16 v2, 0x94

    if-eq v1, v2, :cond_6

    const/16 v2, 0x9a

    if-eq v1, v2, :cond_5

    packed-switch v1, :pswitch_data_0

    .line 3197
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3198
    const-string v2, "msg.syntax"

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 3177
    :pswitch_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3178
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v2, "pos":I
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 3179
    .local v3, "end":I
    new-instance v4, Lcom/trendmicro/hippo/ast/KeywordLiteral;

    sub-int v5, v3, v2

    invoke-direct {v4, v2, v5, v1}, Lcom/trendmicro/hippo/ast/KeywordLiteral;-><init>(III)V

    return-object v4

    .line 3159
    .end local v2    # "pos":I
    .end local v3    # "end":I
    :pswitch_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3160
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->createStringLiteral()Lcom/trendmicro/hippo/ast/StringLiteral;

    move-result-object v2

    return-object v2

    .line 3136
    :pswitch_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3137
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v2

    .line 3138
    .local v2, "s":Ljava/lang/String;
    iget-boolean v3, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->isNumberOldOctal()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 3139
    const-string v3, "msg.no.old.octal.strict"

    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3141
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->isNumberBinary()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 3142
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "0b"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3144
    :cond_1
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->isNumberOldOctal()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 3145
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3147
    :cond_2
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->isNumberOctal()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 3148
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "0o"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3150
    :cond_3
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->isNumberHex()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 3151
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "0x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3153
    :cond_4
    new-instance v3, Lcom/trendmicro/hippo/ast/NumberLiteral;

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    .line 3155
    invoke-virtual {v5}, Lcom/trendmicro/hippo/TokenStream;->getNumber()D

    move-result-wide v5

    invoke-direct {v3, v4, v2, v5, v6}, Lcom/trendmicro/hippo/ast/NumberLiteral;-><init>(ILjava/lang/String;D)V

    .line 3153
    return-object v3

    .line 3132
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_3
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3133
    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/Parser;->name(II)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    return-object v2

    .line 3119
    :cond_5
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3120
    const/4 v2, 0x0

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/Parser;->let(ZI)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    return-object v2

    .line 3127
    :cond_6
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3128
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->mustHaveXML()V

    .line 3129
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->attributeAccess()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    return-object v2

    .line 3182
    :cond_7
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3183
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "msg.reserved.id"

    invoke-virtual {p0, v3, v2}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 3184
    goto :goto_0

    .line 3107
    :cond_8
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3108
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Parser;->function(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v2

    return-object v2

    .line 3123
    :cond_9
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3124
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->parenExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    return-object v2

    .line 3115
    :cond_a
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3116
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->objectLiteral()Lcom/trendmicro/hippo/ast/ObjectLiteral;

    move-result-object v2

    return-object v2

    .line 3111
    :cond_b
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3112
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->arrayLiteral()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    return-object v2

    .line 3164
    :cond_c
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3166
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/TokenStream;->readRegExp(I)V

    .line 3167
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v2, "pos":I
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 3168
    .restart local v3    # "end":I
    new-instance v4, Lcom/trendmicro/hippo/ast/RegExpLiteral;

    sub-int v5, v3, v2

    invoke-direct {v4, v2, v5}, Lcom/trendmicro/hippo/ast/RegExpLiteral;-><init>(II)V

    .line 3169
    .local v4, "re":Lcom/trendmicro/hippo/ast/RegExpLiteral;
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/ast/RegExpLiteral;->setValue(Ljava/lang/String;)V

    .line 3170
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/TokenStream;->readAndClearRegExpFlags()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/ast/RegExpLiteral;->setFlags(Ljava/lang/String;)V

    .line 3171
    return-object v4

    .line 3192
    .end local v2    # "pos":I
    .end local v3    # "end":I
    .end local v4    # "re":Lcom/trendmicro/hippo/ast/RegExpLiteral;
    :cond_d
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3193
    const-string v2, "msg.unexpected.eof"

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3194
    goto :goto_0

    .line 3187
    :cond_e
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3189
    nop

    .line 3202
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 3203
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;

    move-result-object v2

    return-object v2

    :pswitch_data_0
    .packed-switch 0x27
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private propertyAccess(ILcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 9
    .param p1, "tt"    # I
    .param p2, "pn"    # Lcom/trendmicro/hippo/ast/AstNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2886
    if-nez p2, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 2887
    :cond_0
    const/4 v0, 0x0

    .local v0, "memberTypeFlags":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .local v1, "lineno":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2888
    .local v2, "dotPos":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2890
    const/16 v3, 0x90

    if-ne p1, v3, :cond_1

    .line 2891
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->mustHaveXML()V

    .line 2892
    const/4 v0, 0x4

    .line 2895
    :cond_1
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/CompilerEnvirons;->isXmlAvailable()Z

    move-result v3

    const-string v4, "msg.no.name.after.dot"

    const/16 v5, 0x27

    if-nez v3, :cond_4

    .line 2896
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->nextToken()I

    move-result v3

    .line 2897
    .local v3, "maybeName":I
    if-eq v3, v5, :cond_3

    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 2898
    invoke-virtual {v5}, Lcom/trendmicro/hippo/CompilerEnvirons;->isReservedKeywordAsIdentifier()Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    .line 2899
    invoke-virtual {v5}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v6

    iget-boolean v7, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    invoke-static {v5, v6, v7}, Lcom/trendmicro/hippo/TokenStream;->isKeyword(Ljava/lang/String;IZ)Z

    move-result v5

    if-nez v5, :cond_3

    .line 2900
    :cond_2
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2903
    :cond_3
    const/4 v4, 0x1

    const/16 v5, 0x21

    invoke-direct {p0, v4, v5}, Lcom/trendmicro/hippo/Parser;->createNameNode(ZI)Lcom/trendmicro/hippo/ast/Name;

    move-result-object v4

    .line 2904
    .local v4, "name":Lcom/trendmicro/hippo/ast/Name;
    new-instance v5, Lcom/trendmicro/hippo/ast/PropertyGet;

    invoke-direct {v5, p2, v4, v2}, Lcom/trendmicro/hippo/ast/PropertyGet;-><init>(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/Name;I)V

    .line 2905
    .local v5, "pg":Lcom/trendmicro/hippo/ast/PropertyGet;
    invoke-virtual {v5, v1}, Lcom/trendmicro/hippo/ast/PropertyGet;->setLineno(I)V

    .line 2906
    return-object v5

    .line 2909
    .end local v3    # "maybeName":I
    .end local v4    # "name":Lcom/trendmicro/hippo/ast/Name;
    .end local v5    # "pg":Lcom/trendmicro/hippo/ast/PropertyGet;
    :cond_4
    const/4 v3, 0x0

    .line 2911
    .local v3, "ref":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->nextToken()I

    move-result v6

    .line 2912
    .local v6, "token":I
    const/16 v7, 0x17

    const/4 v8, -0x1

    if-eq v6, v7, :cond_a

    if-eq v6, v5, :cond_9

    const/16 v5, 0x32

    if-eq v6, v5, :cond_8

    const/16 v5, 0x80

    if-eq v6, v5, :cond_7

    const/16 v5, 0x94

    if-eq v6, v5, :cond_6

    .line 2944
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/CompilerEnvirons;->isReservedKeywordAsIdentifier()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 2946
    invoke-static {v6}, Lcom/trendmicro/hippo/Token;->keywordToName(I)Ljava/lang/String;

    move-result-object v5

    .line 2947
    .local v5, "name":Ljava/lang/String;
    if-eqz v5, :cond_5

    .line 2948
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v7, v7, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-direct {p0, v4, v5, v7}, Lcom/trendmicro/hippo/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 2949
    invoke-direct {p0, v8, v5, v0}, Lcom/trendmicro/hippo/Parser;->propertyName(ILjava/lang/String;I)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    .line 2950
    goto :goto_0

    .line 2953
    .end local v5    # "name":Ljava/lang/String;
    :cond_5
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2954
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;

    move-result-object v4

    return-object v4

    .line 2933
    :cond_6
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->attributeAccess()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    .line 2934
    goto :goto_0

    .line 2937
    :cond_7
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v4

    .line 2938
    .local v4, "name":Ljava/lang/String;
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v7, v7, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-direct {p0, v5, v4, v7}, Lcom/trendmicro/hippo/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 2939
    invoke-direct {p0, v8, v4, v0}, Lcom/trendmicro/hippo/Parser;->propertyName(ILjava/lang/String;I)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    .line 2940
    goto :goto_0

    .line 2915
    .end local v4    # "name":Ljava/lang/String;
    :cond_8
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    const-string v7, "throw"

    invoke-direct {p0, v4, v7, v5}, Lcom/trendmicro/hippo/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 2916
    invoke-direct {p0, v8, v7, v0}, Lcom/trendmicro/hippo/Parser;->propertyName(ILjava/lang/String;I)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    .line 2917
    goto :goto_0

    .line 2921
    :cond_9
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v8, v4, v0}, Lcom/trendmicro/hippo/Parser;->propertyName(ILjava/lang/String;I)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    .line 2922
    goto :goto_0

    .line 2926
    :cond_a
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    const-string v7, "*"

    invoke-direct {p0, v4, v7, v5}, Lcom/trendmicro/hippo/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 2927
    invoke-direct {p0, v8, v7, v0}, Lcom/trendmicro/hippo/Parser;->propertyName(ILjava/lang/String;I)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    .line 2928
    nop

    .line 2957
    :goto_0
    instance-of v4, v3, Lcom/trendmicro/hippo/ast/XmlRef;

    .line 2958
    .local v4, "xml":Z
    if-eqz v4, :cond_b

    new-instance v5, Lcom/trendmicro/hippo/ast/XmlMemberGet;

    invoke-direct {v5}, Lcom/trendmicro/hippo/ast/XmlMemberGet;-><init>()V

    goto :goto_1

    :cond_b
    new-instance v5, Lcom/trendmicro/hippo/ast/PropertyGet;

    invoke-direct {v5}, Lcom/trendmicro/hippo/ast/PropertyGet;-><init>()V

    .line 2959
    .local v5, "result":Lcom/trendmicro/hippo/ast/InfixExpression;
    :goto_1
    if-eqz v4, :cond_c

    const/16 v7, 0x6d

    if-ne p1, v7, :cond_c

    .line 2960
    invoke-virtual {v5, v7}, Lcom/trendmicro/hippo/ast/InfixExpression;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 2961
    :cond_c
    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v7

    .line 2962
    .local v7, "pos":I
    invoke-virtual {v5, v7}, Lcom/trendmicro/hippo/ast/InfixExpression;->setPosition(I)V

    .line 2963
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v8

    sub-int/2addr v8, v7

    invoke-virtual {v5, v8}, Lcom/trendmicro/hippo/ast/InfixExpression;->setLength(I)V

    .line 2964
    sub-int v8, v2, v7

    invoke-virtual {v5, v8}, Lcom/trendmicro/hippo/ast/InfixExpression;->setOperatorPosition(I)V

    .line 2965
    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/AstNode;->getLineno()I

    move-result v8

    invoke-virtual {v5, v8}, Lcom/trendmicro/hippo/ast/InfixExpression;->setLineno(I)V

    .line 2966
    invoke-virtual {v5, p2}, Lcom/trendmicro/hippo/ast/InfixExpression;->setLeft(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2967
    invoke-virtual {v5, v3}, Lcom/trendmicro/hippo/ast/InfixExpression;->setRight(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2968
    return-object v5
.end method

.method private propertyName(ILjava/lang/String;I)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 9
    .param p1, "atPos"    # I
    .param p2, "s"    # Ljava/lang/String;
    .param p3, "memberTypeFlags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3021
    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    move v1, p1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v1, "pos":I
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 3022
    .local v2, "lineno":I
    const/4 v3, -0x1

    .line 3023
    .local v3, "colonPos":I
    iget v4, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/4 v5, 0x1

    invoke-direct {p0, v5, v4}, Lcom/trendmicro/hippo/Parser;->createNameNode(ZI)Lcom/trendmicro/hippo/ast/Name;

    move-result-object v4

    .line 3024
    .local v4, "name":Lcom/trendmicro/hippo/ast/Name;
    const/4 v6, 0x0

    .line 3026
    .local v6, "ns":Lcom/trendmicro/hippo/ast/Name;
    const/16 v7, 0x91

    invoke-direct {p0, v7, v5}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 3027
    move-object v6, v4

    .line 3028
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v5, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 3030
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->nextToken()I

    move-result v5

    const/16 v7, 0x17

    if-eq v5, v7, :cond_3

    const/16 v7, 0x27

    if-eq v5, v7, :cond_2

    const/16 v0, 0x54

    if-eq v5, v0, :cond_1

    .line 3047
    const-string v0, "msg.no.name.after.coloncolon"

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 3048
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;

    move-result-object v0

    return-object v0

    .line 3044
    :cond_1
    invoke-direct {p0, p1, v6, v3}, Lcom/trendmicro/hippo/Parser;->xmlElemRef(ILcom/trendmicro/hippo/ast/Name;I)Lcom/trendmicro/hippo/ast/XmlElemRef;

    move-result-object v0

    return-object v0

    .line 3033
    :cond_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->createNameNode()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v4

    .line 3034
    goto :goto_1

    .line 3038
    :cond_3
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v7, v7, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    const-string v8, "*"

    invoke-direct {p0, v5, v8, v7}, Lcom/trendmicro/hippo/Parser;->saveNameTokenData(ILjava/lang/String;I)V

    .line 3039
    const/4 v5, 0x0

    invoke-direct {p0, v5, v0}, Lcom/trendmicro/hippo/Parser;->createNameNode(ZI)Lcom/trendmicro/hippo/ast/Name;

    move-result-object v4

    .line 3052
    :cond_4
    :goto_1
    if-nez v6, :cond_5

    if-nez p3, :cond_5

    if-ne p1, v0, :cond_5

    .line 3053
    return-object v4

    .line 3056
    :cond_5
    new-instance v0, Lcom/trendmicro/hippo/ast/XmlPropRef;

    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v5

    sub-int/2addr v5, v1

    invoke-direct {v0, v1, v5}, Lcom/trendmicro/hippo/ast/XmlPropRef;-><init>(II)V

    .line 3057
    .local v0, "ref":Lcom/trendmicro/hippo/ast/XmlPropRef;
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/XmlPropRef;->setAtPos(I)V

    .line 3058
    invoke-virtual {v0, v6}, Lcom/trendmicro/hippo/ast/XmlPropRef;->setNamespace(Lcom/trendmicro/hippo/ast/Name;)V

    .line 3059
    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/ast/XmlPropRef;->setColonPos(I)V

    .line 3060
    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/ast/XmlPropRef;->setPropName(Lcom/trendmicro/hippo/ast/Name;)V

    .line 3061
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/ast/XmlPropRef;->setLineno(I)V

    .line 3062
    return-object v0
.end method

.method private readFully(Ljava/io/Reader;)Ljava/lang/String;
    .locals 8
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3930
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 3931
    .local v0, "in":Ljava/io/BufferedReader;
    const/16 v1, 0x400

    :try_start_0
    new-array v2, v1, [C

    .line 3932
    .local v2, "cbuf":[C
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 3934
    .local v3, "sb":Ljava/lang/StringBuilder;
    :goto_0
    const/4 v4, 0x0

    invoke-virtual {v0, v2, v4, v1}, Ljava/io/BufferedReader;->read([CII)I

    move-result v5

    move v6, v5

    .local v6, "bytes_read":I
    const/4 v7, -0x1

    if-eq v5, v7, :cond_0

    .line 3935
    invoke-virtual {v3, v2, v4, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 3937
    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3938
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 3937
    return-object v1

    .line 3930
    .end local v2    # "cbuf":[C
    .end local v3    # "sb":Ljava/lang/StringBuilder;
    .end local v6    # "bytes_read":I
    :catchall_0
    move-exception v1

    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v1
.end method

.method private recordComment(ILjava/lang/String;)V
    .locals 5
    .param p1, "lineno"    # I
    .param p2, "comment"    # Ljava/lang/String;

    .line 342
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    if-nez v0, :cond_0

    .line 343
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    .line 345
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/ast/Comment;

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    .line 346
    invoke-virtual {v2}, Lcom/trendmicro/hippo/TokenStream;->getTokenLength()I

    move-result v2

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget-object v3, v3, Lcom/trendmicro/hippo/TokenStream;->commentType:Lcom/trendmicro/hippo/Token$CommentType;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/trendmicro/hippo/ast/Comment;-><init>(IILcom/trendmicro/hippo/Token$CommentType;Ljava/lang/String;)V

    .line 349
    .local v0, "commentNode":Lcom/trendmicro/hippo/ast/Comment;
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget-object v1, v1, Lcom/trendmicro/hippo/TokenStream;->commentType:Lcom/trendmicro/hippo/Token$CommentType;

    sget-object v2, Lcom/trendmicro/hippo/Token$CommentType;->JSDOC:Lcom/trendmicro/hippo/Token$CommentType;

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 350
    invoke-virtual {v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->isRecordingLocalJsDocComments()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 351
    new-instance v1, Lcom/trendmicro/hippo/ast/Comment;

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    .line 352
    invoke-virtual {v3}, Lcom/trendmicro/hippo/TokenStream;->getTokenLength()I

    move-result v3

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget-object v4, v4, Lcom/trendmicro/hippo/TokenStream;->commentType:Lcom/trendmicro/hippo/Token$CommentType;

    invoke-direct {v1, v2, v3, v4, p2}, Lcom/trendmicro/hippo/ast/Comment;-><init>(IILcom/trendmicro/hippo/Token$CommentType;Ljava/lang/String;)V

    .line 355
    .local v1, "jsDocCommentNode":Lcom/trendmicro/hippo/ast/Comment;
    iput-object v1, p0, Lcom/trendmicro/hippo/Parser;->currentJsDocComment:Lcom/trendmicro/hippo/ast/Comment;

    .line 356
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/Comment;->setLineno(I)V

    .line 358
    .end local v1    # "jsDocCommentNode":Lcom/trendmicro/hippo/ast/Comment;
    :cond_1
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Comment;->setLineno(I)V

    .line 359
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 360
    return-void
.end method

.method private recordLabel(Lcom/trendmicro/hippo/ast/Label;Lcom/trendmicro/hippo/ast/LabeledStatement;)V
    .locals 6
    .param p1, "label"    # Lcom/trendmicro/hippo/ast/Label;
    .param p2, "bundle"    # Lcom/trendmicro/hippo/ast/LabeledStatement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2025
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0

    const/16 v1, 0x68

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 2026
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2027
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Label;->getName()Ljava/lang/String;

    move-result-object v0

    .line 2028
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->labelSet:Ljava/util/Map;

    if-nez v1, :cond_1

    .line 2029
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/trendmicro/hippo/Parser;->labelSet:Ljava/util/Map;

    goto :goto_0

    .line 2031
    :cond_1
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/LabeledStatement;

    .line 2032
    .local v1, "ls":Lcom/trendmicro/hippo/ast/LabeledStatement;
    if-eqz v1, :cond_3

    .line 2033
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->isIdeMode()Z

    move-result v2

    const-string v3, "msg.dup.label"

    if-eqz v2, :cond_2

    .line 2034
    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getLabelByName(Ljava/lang/String;)Lcom/trendmicro/hippo/ast/Label;

    move-result-object v2

    .line 2035
    .local v2, "dup":Lcom/trendmicro/hippo/ast/Label;
    nop

    .line 2036
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/Label;->getAbsolutePosition()I

    move-result v4

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/Label;->getLength()I

    move-result v5

    .line 2035
    invoke-virtual {p0, v3, v4, v5}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;II)V

    .line 2038
    .end local v2    # "dup":Lcom/trendmicro/hippo/ast/Label;
    :cond_2
    nop

    .line 2039
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Label;->getPosition()I

    move-result v2

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Label;->getLength()I

    move-result v4

    .line 2038
    invoke-virtual {p0, v3, v2, v4}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;II)V

    .line 2042
    .end local v1    # "ls":Lcom/trendmicro/hippo/ast/LabeledStatement;
    :cond_3
    :goto_0
    invoke-virtual {p2, p1}, Lcom/trendmicro/hippo/ast/LabeledStatement;->addLabel(Lcom/trendmicro/hippo/ast/Label;)V

    .line 2043
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->labelSet:Ljava/util/Map;

    invoke-interface {v1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2044
    return-void
.end method

.method private relExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2495
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->shiftExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 2497
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v1

    .local v1, "tt":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2498
    .local v2, "opPos":I
    const/16 v3, 0x34

    if-eq v1, v3, :cond_0

    const/16 v3, 0x35

    if-eq v1, v3, :cond_1

    packed-switch v1, :pswitch_data_0

    goto :goto_1

    .line 2500
    :cond_0
    iget-boolean v3, p0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    if-eqz v3, :cond_1

    .line 2501
    nop

    .line 2512
    :goto_1
    nop

    .line 2514
    .end local v1    # "tt":I
    .end local v2    # "opPos":I
    return-object v0

    .line 2508
    .restart local v1    # "tt":I
    .restart local v2    # "opPos":I
    :cond_1
    :pswitch_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2509
    new-instance v3, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->shiftExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v3, v1, v0, v4, v2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    move-object v0, v3

    .line 2510
    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private returnOrYield(IZ)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 9
    .param p1, "tt"    # I
    .param p2, "exprContext"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1917
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->insideFunction()Z

    move-result v0

    const-string v1, "msg.bad.yield"

    const/4 v2, 0x4

    if-nez v0, :cond_1

    .line 1918
    if-ne p1, v2, :cond_0

    const-string v0, "msg.bad.return"

    goto :goto_0

    .line 1919
    :cond_0
    move-object v0, v1

    .line 1918
    :goto_0
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1921
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1922
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .local v0, "lineno":I
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v3, "pos":I
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 1924
    .local v4, "end":I
    const/4 v5, 0x0

    .line 1926
    .local v5, "e":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekTokenOrEOL()I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_2

    if-eqz v6, :cond_2

    const/4 v7, 0x1

    if-eq v6, v7, :cond_2

    const/16 v7, 0x49

    if-eq v6, v7, :cond_2

    const/16 v7, 0x53

    if-eq v6, v7, :cond_2

    const/16 v7, 0x55

    if-eq v6, v7, :cond_2

    const/16 v7, 0x57

    if-eq v6, v7, :cond_2

    const/16 v7, 0x59

    if-eq v6, v7, :cond_2

    .line 1931
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    .line 1932
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v4

    goto :goto_1

    .line 1929
    :cond_2
    nop

    .line 1935
    :goto_1
    iget v6, p0, Lcom/trendmicro/hippo/Parser;->endFlags:I

    .line 1938
    .local v6, "before":I
    const-string v7, ""

    if-ne p1, v2, :cond_4

    .line 1939
    iget v1, p0, Lcom/trendmicro/hippo/Parser;->endFlags:I

    if-nez v5, :cond_3

    const/4 v2, 0x2

    :cond_3
    or-int/2addr v1, v2

    iput v1, p0, Lcom/trendmicro/hippo/Parser;->endFlags:I

    .line 1940
    new-instance v1, Lcom/trendmicro/hippo/ast/ReturnStatement;

    sub-int v2, v4, v3

    invoke-direct {v1, v3, v2, v5}, Lcom/trendmicro/hippo/ast/ReturnStatement;-><init>(IILcom/trendmicro/hippo/ast/AstNode;)V

    .line 1943
    .local v1, "ret":Lcom/trendmicro/hippo/ast/AstNode;
    iget v2, p0, Lcom/trendmicro/hippo/Parser;->endFlags:I

    const/4 v8, 0x6

    invoke-static {v6, v2, v8}, Lcom/trendmicro/hippo/Parser;->nowAllSet(III)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1945
    sub-int v2, v4, v3

    const-string v8, "msg.return.inconsistent"

    invoke-virtual {p0, v8, v7, v3, v2}, Lcom/trendmicro/hippo/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_2

    .line 1947
    .end local v1    # "ret":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_4
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->insideFunction()Z

    move-result v2

    if-nez v2, :cond_5

    .line 1948
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1949
    :cond_5
    iget v1, p0, Lcom/trendmicro/hippo/Parser;->endFlags:I

    or-int/lit8 v1, v1, 0x8

    iput v1, p0, Lcom/trendmicro/hippo/Parser;->endFlags:I

    .line 1950
    new-instance v1, Lcom/trendmicro/hippo/ast/Yield;

    sub-int v2, v4, v3

    invoke-direct {v1, v3, v2, v5}, Lcom/trendmicro/hippo/ast/Yield;-><init>(IILcom/trendmicro/hippo/ast/AstNode;)V

    .line 1951
    .restart local v1    # "ret":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->setRequiresActivation()V

    .line 1952
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->setIsGenerator()V

    .line 1953
    if-nez p2, :cond_6

    .line 1954
    new-instance v2, Lcom/trendmicro/hippo/ast/ExpressionStatement;

    invoke-direct {v2, v1}, Lcom/trendmicro/hippo/ast/ExpressionStatement;-><init>(Lcom/trendmicro/hippo/ast/AstNode;)V

    move-object v1, v2

    .line 1959
    :cond_6
    :goto_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->insideFunction()Z

    move-result v2

    if-eqz v2, :cond_9

    iget v2, p0, Lcom/trendmicro/hippo/Parser;->endFlags:I

    const/16 v8, 0xc

    .line 1960
    invoke-static {v6, v2, v8}, Lcom/trendmicro/hippo/Parser;->nowAllSet(III)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 1962
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    check-cast v2, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionName()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v2

    .line 1963
    .local v2, "name":Lcom/trendmicro/hippo/ast/Name;
    if-eqz v2, :cond_8

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/Name;->length()I

    move-result v8

    if-nez v8, :cond_7

    goto :goto_3

    .line 1966
    :cond_7
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v7

    const-string v8, "msg.generator.returns"

    invoke-virtual {p0, v8, v7}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 1964
    :cond_8
    :goto_3
    const-string v8, "msg.anon.generator.returns"

    invoke-virtual {p0, v8, v7}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1969
    .end local v2    # "name":Lcom/trendmicro/hippo/ast/Name;
    :cond_9
    :goto_4
    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    .line 1970
    return-object v1
.end method

.method private saveNameTokenData(ILjava/lang/String;I)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "lineno"    # I

    .line 3856
    iput p1, p0, Lcom/trendmicro/hippo/Parser;->prevNameTokenStart:I

    .line 3857
    iput-object p2, p0, Lcom/trendmicro/hippo/Parser;->prevNameTokenString:Ljava/lang/String;

    .line 3858
    iput p3, p0, Lcom/trendmicro/hippo/Parser;->prevNameTokenLineno:I

    .line 3859
    return-void
.end method

.method private shiftExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2520
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->addExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 2522
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v1

    .local v1, "tt":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2523
    .local v2, "opPos":I
    packed-switch v1, :pswitch_data_0

    .line 2531
    goto :goto_1

    .line 2527
    :pswitch_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2528
    new-instance v3, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->addExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v3, v1, v0, v4, v2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    move-object v0, v3

    .line 2529
    goto :goto_0

    .line 2533
    .end local v1    # "tt":I
    .end local v2    # "opPos":I
    :goto_1
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x12
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private statement()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1122
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1124
    .local v0, "pos":I
    const/4 v1, 0x1

    :try_start_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->statementHelper()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 1125
    .local v2, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    if-eqz v2, :cond_3

    .line 1126
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/CompilerEnvirons;->isStrictMode()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->hasSideEffects()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1127
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v3

    .line 1128
    .local v3, "beg":I
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/Parser;->lineBeginningFor(I)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    move v3, v4

    .line 1129
    instance-of v4, v2, Lcom/trendmicro/hippo/ast/EmptyStatement;

    if-eqz v4, :cond_0

    .line 1130
    const-string v4, "msg.extra.trailing.semi"

    goto :goto_0

    .line 1131
    :cond_0
    const-string v4, "msg.no.side.effects"

    :goto_0
    const-string v5, ""

    .line 1132
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Parser;->nodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v6

    sub-int/2addr v6, v3

    .line 1129
    invoke-virtual {p0, v4, v5, v3, v6}, Lcom/trendmicro/hippo/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 1134
    .end local v3    # "beg":I
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v3

    .line 1135
    .local v3, "ntt":I
    const/16 v4, 0xa2

    if-ne v3, v4, :cond_2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->getLineno()I

    move-result v4

    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    sub-int/2addr v6, v1

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/ast/Comment;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/Comment;->getLineno()I

    move-result v5

    if-ne v4, v5, :cond_2

    .line 1136
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v1

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/ast/AstNode;->setInlineComment(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1137
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V
    :try_end_0
    .catch Lcom/trendmicro/hippo/Parser$ParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1139
    :cond_2
    return-object v2

    .line 1143
    .end local v2    # "pn":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v3    # "ntt":I
    :cond_3
    goto :goto_1

    .line 1141
    :catch_0
    move-exception v2

    .line 1147
    :goto_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekTokenOrEOL()I

    move-result v2

    .line 1148
    .local v2, "tt":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1149
    const/4 v3, -0x1

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_4

    if-eq v2, v1, :cond_4

    const/16 v3, 0x53

    if-eq v2, v3, :cond_4

    .line 1156
    .end local v2    # "tt":I
    goto :goto_1

    .line 1154
    .restart local v2    # "tt":I
    :cond_4
    nop

    .line 1160
    .end local v2    # "tt":I
    new-instance v1, Lcom/trendmicro/hippo/ast/EmptyStatement;

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v2, v0

    invoke-direct {v1, v0, v2}, Lcom/trendmicro/hippo/ast/EmptyStatement;-><init>(II)V

    return-object v1
.end method

.method private statementHelper()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1167
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentLabel:Lcom/trendmicro/hippo/ast/LabeledStatement;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getStatement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1168
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentLabel:Lcom/trendmicro/hippo/ast/LabeledStatement;

    .line 1170
    :cond_0
    const/4 v0, 0x0

    .line 1171
    .local v0, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v1

    .local v1, "tt":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1173
    .local v2, "pos":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_11

    const/4 v3, 0x4

    if-eq v1, v3, :cond_10

    const/16 v3, 0x27

    if-eq v1, v3, :cond_e

    const/16 v3, 0x32

    if-eq v1, v3, :cond_d

    const/16 v3, 0x49

    if-eq v1, v3, :cond_10

    const/16 v3, 0x56

    if-eq v1, v3, :cond_c

    const/16 v3, 0x6e

    if-eq v1, v3, :cond_b

    const/16 v3, 0x71

    if-eq v1, v3, :cond_a

    const/16 v3, 0x73

    if-eq v1, v3, :cond_9

    const/16 v3, 0x52

    if-eq v1, v3, :cond_8

    const/16 v3, 0x53

    if-eq v1, v3, :cond_7

    const/16 v4, 0x9a

    if-eq v1, v4, :cond_5

    const/16 v3, 0x9b

    const/4 v4, 0x1

    if-eq v1, v3, :cond_4

    const/16 v3, 0xa1

    if-eq v1, v3, :cond_3

    const/16 v3, 0xa2

    if-eq v1, v3, :cond_2

    packed-switch v1, :pswitch_data_0

    .line 1269
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 1270
    .local v3, "lineno":I
    new-instance v5, Lcom/trendmicro/hippo/ast/ExpressionStatement;

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v6

    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->insideFunction()Z

    move-result v7

    xor-int/2addr v4, v7

    invoke-direct {v5, v6, v4}, Lcom/trendmicro/hippo/ast/ExpressionStatement;-><init>(Lcom/trendmicro/hippo/ast/AstNode;Z)V

    move-object v0, v5

    .line 1271
    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    goto/16 :goto_0

    .line 1205
    .end local v3    # "lineno":I
    :pswitch_0
    iget-boolean v3, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    if-eqz v3, :cond_1

    .line 1206
    const-string v3, "msg.no.with.strict"

    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1208
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->withStatement()Lcom/trendmicro/hippo/ast/WithStatement;

    move-result-object v3

    return-object v3

    .line 1201
    :pswitch_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->continueStatement()Lcom/trendmicro/hippo/ast/ContinueStatement;

    move-result-object v0

    .line 1202
    goto/16 :goto_0

    .line 1197
    :pswitch_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->breakStatement()Lcom/trendmicro/hippo/ast/BreakStatement;

    move-result-object v0

    .line 1198
    goto/16 :goto_0

    .line 1187
    :pswitch_3
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->forLoop()Lcom/trendmicro/hippo/ast/Loop;

    move-result-object v3

    return-object v3

    .line 1184
    :pswitch_4
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->doLoop()Lcom/trendmicro/hippo/ast/DoLoop;

    move-result-object v3

    return-object v3

    .line 1181
    :pswitch_5
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->whileLoop()Lcom/trendmicro/hippo/ast/WhileLoop;

    move-result-object v3

    return-object v3

    .line 1256
    :pswitch_6
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->defaultXmlNamespace()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 1257
    goto/16 :goto_0

    .line 1266
    :cond_2
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v4

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/trendmicro/hippo/ast/AstNode;

    .line 1267
    return-object v0

    .line 1231
    :cond_3
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1232
    new-instance v3, Lcom/trendmicro/hippo/ast/KeywordLiteral;

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v6, v6, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v5, v6

    invoke-direct {v3, v4, v5, v1}, Lcom/trendmicro/hippo/ast/KeywordLiteral;-><init>(III)V

    move-object v0, v3

    .line 1234
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    .line 1235
    goto/16 :goto_0

    .line 1212
    :cond_4
    :pswitch_7
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1213
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 1214
    .restart local v3    # "lineno":I
    iget v5, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v6, v6, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-direct {p0, v5, v6, v4}, Lcom/trendmicro/hippo/Parser;->variables(IIZ)Lcom/trendmicro/hippo/ast/VariableDeclaration;

    move-result-object v0

    .line 1215
    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    .line 1216
    goto :goto_0

    .line 1219
    .end local v3    # "lineno":I
    :cond_5
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->letStatement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 1220
    instance-of v4, v0, Lcom/trendmicro/hippo/ast/VariableDeclaration;

    if-eqz v4, :cond_6

    .line 1221
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v4

    if-ne v4, v3, :cond_6

    .line 1222
    goto :goto_0

    .line 1223
    :cond_6
    return-object v0

    .line 1245
    :cond_7
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1246
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1247
    new-instance v3, Lcom/trendmicro/hippo/ast/EmptyStatement;

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v4, v2

    invoke-direct {v3, v2, v4}, Lcom/trendmicro/hippo/ast/EmptyStatement;-><init>(II)V

    move-object v0, v3

    .line 1248
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    .line 1249
    return-object v0

    .line 1190
    :cond_8
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->tryStatement()Lcom/trendmicro/hippo/ast/TryStatement;

    move-result-object v3

    return-object v3

    .line 1178
    :cond_9
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->switchStatement()Lcom/trendmicro/hippo/ast/SwitchStatement;

    move-result-object v3

    return-object v3

    .line 1175
    :cond_a
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->ifStatement()Lcom/trendmicro/hippo/ast/IfStatement;

    move-result-object v3

    return-object v3

    .line 1252
    :cond_b
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1253
    const/4 v3, 0x3

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/Parser;->function(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v3

    return-object v3

    .line 1238
    :cond_c
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->block()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    return-object v3

    .line 1193
    :cond_d
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->throwStatement()Lcom/trendmicro/hippo/ast/ThrowStatement;

    move-result-object v0

    .line 1194
    goto :goto_0

    .line 1260
    :cond_e
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->nameOrLabel()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 1261
    instance-of v3, v0, Lcom/trendmicro/hippo/ast/ExpressionStatement;

    if-eqz v3, :cond_f

    .line 1262
    goto :goto_0

    .line 1263
    :cond_f
    return-object v0

    .line 1227
    :cond_10
    const/4 v3, 0x0

    invoke-direct {p0, v1, v3}, Lcom/trendmicro/hippo/Parser;->returnOrYield(IZ)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 1228
    nop

    .line 1275
    :goto_0
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Parser;->autoInsertSemicolon(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1276
    return-object v0

    .line 1241
    :cond_11
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1242
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;

    move-result-object v3

    return-object v3

    :pswitch_data_0
    .packed-switch 0x75
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_7
        :pswitch_0
    .end packed-switch
.end method

.method private statements()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1086
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Parser;->statements(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    return-object v0
.end method

.method private statements(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 4
    .param p1, "parent"    # Lcom/trendmicro/hippo/ast/AstNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1071
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x56

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 1072
    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->isIdeMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1073
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1074
    .local v0, "pos":I
    if-eqz p1, :cond_1

    move-object v1, p1

    goto :goto_0

    :cond_1
    new-instance v1, Lcom/trendmicro/hippo/ast/Block;

    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/ast/Block;-><init>(I)V

    .line 1075
    .local v1, "block":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    .line 1078
    :goto_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v2

    move v3, v2

    .local v3, "tt":I
    if-lez v2, :cond_2

    const/16 v2, 0x57

    if-eq v3, v2, :cond_2

    .line 1079
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->statement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->addChild(Lcom/trendmicro/hippo/ast/AstNode;)V

    goto :goto_1

    .line 1081
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->setLength(I)V

    .line 1082
    return-object v1
.end method

.method private switchStatement()Lcom/trendmicro/hippo/ast/SwitchStatement;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1340
    move-object/from16 v1, p0

    iget v0, v1, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v2, 0x73

    if-eq v0, v2, :cond_0

    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1341
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1342
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1344
    .local v2, "pos":I
    new-instance v0, Lcom/trendmicro/hippo/ast/SwitchStatement;

    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/ast/SwitchStatement;-><init>(I)V

    move-object v3, v0

    .line 1345
    .local v3, "pn":Lcom/trendmicro/hippo/ast/SwitchStatement;
    const/16 v0, 0x58

    const-string v4, "msg.no.paren.switch"

    const/4 v5, 0x1

    invoke-direct {v1, v0, v4, v5}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1346
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v0, v2

    invoke-virtual {v3, v0}, Lcom/trendmicro/hippo/ast/SwitchStatement;->setLp(I)V

    .line 1347
    :cond_1
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v3, v0}, Lcom/trendmicro/hippo/ast/SwitchStatement;->setLineno(I)V

    .line 1349
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    .line 1350
    .local v4, "discriminant":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/SwitchStatement;->setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1351
    invoke-direct {v1, v3}, Lcom/trendmicro/hippo/Parser;->enterSwitch(Lcom/trendmicro/hippo/ast/SwitchStatement;)V

    .line 1354
    const/16 v0, 0x59

    :try_start_0
    const-string v6, "msg.no.paren.after.switch"

    invoke-direct {v1, v0, v6, v5}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1355
    iget-object v0, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v0, v2

    invoke-virtual {v3, v0}, Lcom/trendmicro/hippo/ast/SwitchStatement;->setRp(I)V

    .line 1357
    :cond_2
    const/16 v0, 0x56

    const-string v6, "msg.no.brace.switch"

    invoke-direct {v1, v0, v6, v5}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 1359
    const/4 v0, 0x0

    .line 1362
    .local v0, "hasDefault":Z
    :goto_0
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->nextToken()I

    move-result v6

    .line 1363
    .local v6, "tt":I
    iget-object v7, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v7, v7, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1364
    .local v7, "casePos":I
    iget-object v8, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v8, v8, Lcom/trendmicro/hippo/TokenStream;->lineno:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1365
    .local v8, "caseLineno":I
    const/4 v9, 0x0

    .line 1366
    .local v9, "caseExpression":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v10, 0x57

    if-eq v6, v10, :cond_a

    const/16 v11, 0xa2

    if-eq v6, v11, :cond_9

    const-string v12, "msg.no.colon.case"

    const/16 v13, 0x68

    const/16 v14, 0x75

    const/16 v15, 0x74

    if-eq v6, v15, :cond_5

    if-eq v6, v14, :cond_3

    .line 1388
    :try_start_1
    const-string v5, "msg.bad.switch"

    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1389
    goto/16 :goto_5

    .line 1377
    :cond_3
    if-eqz v0, :cond_4

    .line 1378
    const-string v11, "msg.double.switch.default"

    invoke-virtual {v1, v11}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1380
    :cond_4
    const/4 v0, 0x1

    .line 1381
    invoke-direct {v1, v13, v12, v5}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 1382
    goto :goto_1

    .line 1372
    :cond_5
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v11

    move-object v9, v11

    .line 1373
    invoke-direct {v1, v13, v12, v5}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 1374
    nop

    .line 1392
    :goto_1
    new-instance v11, Lcom/trendmicro/hippo/ast/SwitchCase;

    invoke-direct {v11, v7}, Lcom/trendmicro/hippo/ast/SwitchCase;-><init>(I)V

    .line 1393
    .local v11, "caseNode":Lcom/trendmicro/hippo/ast/SwitchCase;
    invoke-virtual {v11, v9}, Lcom/trendmicro/hippo/ast/SwitchCase;->setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1394
    iget-object v12, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v12, v12, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v12, v2

    invoke-virtual {v11, v12}, Lcom/trendmicro/hippo/ast/SwitchCase;->setLength(I)V

    .line 1395
    invoke-virtual {v11, v8}, Lcom/trendmicro/hippo/ast/SwitchCase;->setLineno(I)V

    .line 1397
    :goto_2
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v12

    move v6, v12

    if-eq v12, v10, :cond_8

    if-eq v6, v15, :cond_8

    if-eq v6, v14, :cond_8

    if-eqz v6, :cond_8

    .line 1402
    const/16 v12, 0xa2

    if-ne v6, v12, :cond_7

    .line 1403
    iget-object v13, v1, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    iget-object v10, v1, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    sub-int/2addr v10, v5

    invoke-interface {v13, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/trendmicro/hippo/ast/Comment;

    .line 1404
    .local v10, "inlineComment":Lcom/trendmicro/hippo/ast/Comment;
    invoke-virtual {v11}, Lcom/trendmicro/hippo/ast/SwitchCase;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v13

    if-nez v13, :cond_6

    invoke-virtual {v10}, Lcom/trendmicro/hippo/ast/Comment;->getLineno()I

    move-result v13

    invoke-virtual {v11}, Lcom/trendmicro/hippo/ast/SwitchCase;->getLineno()I

    move-result v12

    if-ne v13, v12, :cond_6

    .line 1405
    invoke-virtual {v11, v10}, Lcom/trendmicro/hippo/ast/SwitchCase;->setInlineComment(Lcom/trendmicro/hippo/ast/AstNode;)V

    goto :goto_3

    .line 1407
    :cond_6
    invoke-virtual {v11, v10}, Lcom/trendmicro/hippo/ast/SwitchCase;->addStatement(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1409
    :goto_3
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1410
    goto :goto_4

    .line 1412
    .end local v10    # "inlineComment":Lcom/trendmicro/hippo/ast/Comment;
    :cond_7
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->statement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v10

    .line 1413
    .local v10, "nextStmt":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v11, v10}, Lcom/trendmicro/hippo/ast/SwitchCase;->addStatement(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1414
    .end local v10    # "nextStmt":Lcom/trendmicro/hippo/ast/AstNode;
    nop

    .line 1397
    :goto_4
    const/16 v10, 0x57

    goto :goto_2

    .line 1415
    :cond_8
    invoke-virtual {v3, v11}, Lcom/trendmicro/hippo/ast/SwitchStatement;->addCase(Lcom/trendmicro/hippo/ast/SwitchCase;)V

    .line 1416
    .end local v7    # "casePos":I
    .end local v8    # "caseLineno":I
    .end local v9    # "caseExpression":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v11    # "caseNode":Lcom/trendmicro/hippo/ast/SwitchCase;
    goto/16 :goto_0

    .line 1384
    .restart local v7    # "casePos":I
    .restart local v8    # "caseLineno":I
    .restart local v9    # "caseExpression":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_9
    iget-object v10, v1, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    iget-object v11, v1, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    sub-int/2addr v11, v5

    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/trendmicro/hippo/ast/AstNode;

    .line 1385
    .local v10, "n":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v3, v10}, Lcom/trendmicro/hippo/ast/SwitchStatement;->addChild(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1386
    goto/16 :goto_0

    .line 1368
    .end local v10    # "n":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_a
    iget-object v5, v1, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v5, v5, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v5, v2

    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/ast/SwitchStatement;->setLength(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1369
    nop

    .line 1418
    .end local v0    # "hasDefault":Z
    .end local v6    # "tt":I
    .end local v7    # "casePos":I
    .end local v8    # "caseLineno":I
    .end local v9    # "caseExpression":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_5
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->exitSwitch()V

    .line 1419
    nop

    .line 1420
    return-object v3

    .line 1418
    :catchall_0
    move-exception v0

    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->exitSwitch()V

    .line 1419
    throw v0
.end method

.method private throwStatement()Lcom/trendmicro/hippo/ast/ThrowStatement;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1750
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x32

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1751
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1752
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v0, "pos":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 1753
    .local v1, "lineno":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekTokenOrEOL()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 1756
    const-string v2, "msg.bad.throw.eol"

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1758
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 1759
    .local v2, "expr":Lcom/trendmicro/hippo/ast/AstNode;
    new-instance v3, Lcom/trendmicro/hippo/ast/ThrowStatement;

    invoke-direct {v3, v0, v2}, Lcom/trendmicro/hippo/ast/ThrowStatement;-><init>(ILcom/trendmicro/hippo/ast/AstNode;)V

    .line 1760
    .local v3, "pn":Lcom/trendmicro/hippo/ast/ThrowStatement;
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/ast/ThrowStatement;->setLineno(I)V

    .line 1761
    return-object v3
.end method

.method private tryStatement()Lcom/trendmicro/hippo/ast/TryStatement;
    .locals 28
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1636
    move-object/from16 v0, p0

    iget v1, v0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v2, 0x52

    if-eq v1, v2, :cond_0

    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1637
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1640
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v1

    .line 1642
    .local v1, "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    iget-object v2, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v2, "tryPos":I
    iget-object v3, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .local v3, "lineno":I
    const/4 v4, -0x1

    .line 1644
    .local v4, "finallyPos":I
    new-instance v5, Lcom/trendmicro/hippo/ast/TryStatement;

    invoke-direct {v5, v2}, Lcom/trendmicro/hippo/ast/TryStatement;-><init>(I)V

    .line 1646
    .local v5, "pn":Lcom/trendmicro/hippo/ast/TryStatement;
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v6

    .line 1647
    .local v6, "lctt":I
    const/16 v7, 0xa2

    const/4 v8, 0x1

    if-ne v6, v7, :cond_1

    .line 1648
    iget-object v7, v0, Lcom/trendmicro/hippo/Parser;->scannedComments:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v9

    sub-int/2addr v9, v8

    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trendmicro/hippo/ast/Comment;

    .line 1649
    .local v7, "commentNode":Lcom/trendmicro/hippo/ast/Comment;
    invoke-virtual {v5, v7}, Lcom/trendmicro/hippo/ast/TryStatement;->setInlineComment(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1650
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1651
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v6

    .line 1653
    .end local v7    # "commentNode":Lcom/trendmicro/hippo/ast/Comment;
    :cond_1
    const/16 v7, 0x56

    if-eq v6, v7, :cond_2

    .line 1654
    const-string v9, "msg.no.brace.try"

    invoke-virtual {v0, v9}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1656
    :cond_2
    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/Parser;->getNextStatementAfterInlineComments(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v9

    .line 1657
    .local v9, "tryBlock":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {v0, v9}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v10

    .line 1659
    .local v10, "tryEnd":I
    const/4 v11, 0x0

    .line 1661
    .local v11, "clauses":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/CatchClause;>;"
    const/4 v12, 0x0

    .line 1662
    .local v12, "sawDefaultCatch":Z
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v13

    .line 1663
    .local v13, "peek":I
    const/16 v15, 0x7d

    if-ne v13, v15, :cond_e

    .line 1664
    :goto_0
    invoke-direct {v0, v15, v8}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v16

    if-eqz v16, :cond_d

    .line 1665
    iget-object v15, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v15, v15, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 1666
    .local v15, "catchLineNum":I
    if-eqz v12, :cond_3

    .line 1667
    const-string v14, "msg.catch.unreachable"

    invoke-virtual {v0, v14}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1669
    :cond_3
    iget-object v14, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v14, v14, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v14, "catchPos":I
    const/16 v17, -0x1

    .local v17, "lp":I
    const/16 v18, -0x1

    .local v18, "rp":I
    const/16 v19, -0x1

    .line 1670
    .local v19, "guardPos":I
    const/16 v7, 0x58

    move/from16 v20, v4

    .end local v4    # "finallyPos":I
    .local v20, "finallyPos":I
    const-string v4, "msg.no.paren.catch"

    invoke-direct {v0, v7, v4, v8}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1671
    iget-object v4, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .end local v17    # "lp":I
    .local v4, "lp":I
    goto :goto_1

    .line 1670
    .end local v4    # "lp":I
    .restart local v17    # "lp":I
    :cond_4
    move/from16 v4, v17

    .line 1673
    .end local v17    # "lp":I
    .restart local v4    # "lp":I
    :goto_1
    const/16 v7, 0x27

    move/from16 v17, v6

    .end local v6    # "lctt":I
    .local v17, "lctt":I
    const-string v6, "msg.bad.catchcond"

    invoke-direct {v0, v7, v6, v8}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 1675
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->createNameNode()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v7

    .line 1676
    .local v7, "varName":Lcom/trendmicro/hippo/ast/Name;
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v8

    .line 1677
    .local v8, "jsdocNodeForName":Lcom/trendmicro/hippo/ast/Comment;
    if-eqz v8, :cond_5

    .line 1678
    invoke-virtual {v7, v8}, Lcom/trendmicro/hippo/ast/Name;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    .line 1680
    :cond_5
    move-object/from16 v21, v8

    .end local v8    # "jsdocNodeForName":Lcom/trendmicro/hippo/ast/Comment;
    .local v21, "jsdocNodeForName":Lcom/trendmicro/hippo/ast/Comment;
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v8

    .line 1681
    .local v8, "varNameString":Ljava/lang/String;
    move/from16 v22, v10

    .end local v10    # "tryEnd":I
    .local v22, "tryEnd":I
    iget-boolean v10, v0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    if-eqz v10, :cond_7

    .line 1682
    const-string v10, "eval"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6

    .line 1683
    const-string v10, "arguments"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 1685
    :cond_6
    const-string v10, "msg.bad.id.strict"

    invoke-virtual {v0, v10, v8}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1689
    :cond_7
    const/4 v10, 0x0

    .line 1690
    .local v10, "catchCond":Lcom/trendmicro/hippo/ast/AstNode;
    move-object/from16 v23, v8

    .end local v8    # "varNameString":Ljava/lang/String;
    .local v23, "varNameString":Ljava/lang/String;
    const/16 v8, 0x71

    move-object/from16 v24, v10

    const/4 v10, 0x1

    .end local v10    # "catchCond":Lcom/trendmicro/hippo/ast/AstNode;
    .local v24, "catchCond":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {v0, v8, v10}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 1691
    iget-object v8, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v8, v8, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1692
    .end local v19    # "guardPos":I
    .local v8, "guardPos":I
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v10

    .end local v24    # "catchCond":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v10    # "catchCond":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_2

    .line 1694
    .end local v8    # "guardPos":I
    .end local v10    # "catchCond":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v19    # "guardPos":I
    .restart local v24    # "catchCond":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_8
    const/4 v12, 0x1

    move/from16 v8, v19

    move-object/from16 v10, v24

    .line 1697
    .end local v19    # "guardPos":I
    .end local v24    # "catchCond":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v8    # "guardPos":I
    .restart local v10    # "catchCond":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_2
    move/from16 v19, v12

    .end local v12    # "sawDefaultCatch":Z
    .local v19, "sawDefaultCatch":Z
    const/16 v12, 0x59

    move-object/from16 v24, v1

    const/4 v1, 0x1

    .end local v1    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .local v24, "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    invoke-direct {v0, v12, v6, v1}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 1698
    iget-object v6, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v6, v6, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .end local v18    # "rp":I
    .local v6, "rp":I
    goto :goto_3

    .line 1697
    .end local v6    # "rp":I
    .restart local v18    # "rp":I
    :cond_9
    move/from16 v6, v18

    .line 1699
    .end local v18    # "rp":I
    .restart local v6    # "rp":I
    :goto_3
    const-string v12, "msg.no.brace.catchblock"

    move/from16 v18, v3

    const/16 v3, 0x56

    .end local v3    # "lineno":I
    .local v18, "lineno":I
    invoke-direct {v0, v3, v12, v1}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 1701
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->statements()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/Block;

    .line 1702
    .local v1, "catchBlock":Lcom/trendmicro/hippo/ast/Block;
    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v12

    .line 1703
    .end local v22    # "tryEnd":I
    .local v12, "tryEnd":I
    new-instance v3, Lcom/trendmicro/hippo/ast/CatchClause;

    invoke-direct {v3, v14}, Lcom/trendmicro/hippo/ast/CatchClause;-><init>(I)V

    .line 1704
    .local v3, "catchNode":Lcom/trendmicro/hippo/ast/CatchClause;
    invoke-virtual {v3, v7}, Lcom/trendmicro/hippo/ast/CatchClause;->setVarName(Lcom/trendmicro/hippo/ast/Name;)V

    .line 1705
    invoke-virtual {v3, v10}, Lcom/trendmicro/hippo/ast/CatchClause;->setCatchCondition(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1706
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/ast/CatchClause;->setBody(Lcom/trendmicro/hippo/ast/Block;)V

    .line 1707
    move-object/from16 v25, v1

    const/4 v1, -0x1

    .end local v1    # "catchBlock":Lcom/trendmicro/hippo/ast/Block;
    .local v25, "catchBlock":Lcom/trendmicro/hippo/ast/Block;
    if-eq v8, v1, :cond_a

    .line 1708
    sub-int v1, v8, v14

    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/ast/CatchClause;->setIfPosition(I)V

    .line 1710
    :cond_a
    invoke-virtual {v3, v4, v6}, Lcom/trendmicro/hippo/ast/CatchClause;->setParens(II)V

    .line 1711
    invoke-virtual {v3, v15}, Lcom/trendmicro/hippo/ast/CatchClause;->setLineno(I)V

    .line 1713
    const/16 v1, 0x57

    move/from16 v26, v4

    .end local v4    # "lp":I
    .local v26, "lp":I
    const-string v4, "msg.no.brace.after.body"

    move/from16 v27, v6

    const/4 v6, 0x1

    .end local v6    # "rp":I
    .local v27, "rp":I
    invoke-direct {v0, v1, v4, v6}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 1714
    iget-object v1, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .end local v12    # "tryEnd":I
    .local v1, "tryEnd":I
    goto :goto_4

    .line 1713
    .end local v1    # "tryEnd":I
    .restart local v12    # "tryEnd":I
    :cond_b
    move v1, v12

    .line 1715
    .end local v12    # "tryEnd":I
    .restart local v1    # "tryEnd":I
    :goto_4
    sub-int v4, v1, v14

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/CatchClause;->setLength(I)V

    .line 1716
    if-nez v11, :cond_c

    .line 1717
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object v11, v4

    .line 1718
    :cond_c
    invoke-interface {v11, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1719
    .end local v3    # "catchNode":Lcom/trendmicro/hippo/ast/CatchClause;
    .end local v7    # "varName":Lcom/trendmicro/hippo/ast/Name;
    .end local v8    # "guardPos":I
    .end local v10    # "catchCond":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v14    # "catchPos":I
    .end local v15    # "catchLineNum":I
    .end local v21    # "jsdocNodeForName":Lcom/trendmicro/hippo/ast/Comment;
    .end local v23    # "varNameString":Ljava/lang/String;
    .end local v25    # "catchBlock":Lcom/trendmicro/hippo/ast/Block;
    .end local v26    # "lp":I
    .end local v27    # "rp":I
    move v10, v1

    move/from16 v6, v17

    move/from16 v3, v18

    move/from16 v12, v19

    move/from16 v4, v20

    move-object/from16 v1, v24

    const/16 v7, 0x56

    const/4 v8, 0x1

    const/16 v15, 0x7d

    goto/16 :goto_0

    .line 1664
    .end local v17    # "lctt":I
    .end local v18    # "lineno":I
    .end local v19    # "sawDefaultCatch":Z
    .end local v20    # "finallyPos":I
    .end local v24    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .local v1, "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .local v3, "lineno":I
    .local v4, "finallyPos":I
    .local v6, "lctt":I
    .local v10, "tryEnd":I
    .local v12, "sawDefaultCatch":Z
    :cond_d
    move-object/from16 v24, v1

    move/from16 v18, v3

    move/from16 v20, v4

    move/from16 v17, v6

    move/from16 v22, v10

    .end local v1    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .end local v3    # "lineno":I
    .end local v4    # "finallyPos":I
    .end local v6    # "lctt":I
    .end local v10    # "tryEnd":I
    .restart local v17    # "lctt":I
    .restart local v18    # "lineno":I
    .restart local v20    # "finallyPos":I
    .restart local v22    # "tryEnd":I
    .restart local v24    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    const/16 v1, 0x7e

    const/4 v4, 0x1

    goto :goto_5

    .line 1720
    .end local v17    # "lctt":I
    .end local v18    # "lineno":I
    .end local v20    # "finallyPos":I
    .end local v22    # "tryEnd":I
    .end local v24    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .restart local v1    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .restart local v3    # "lineno":I
    .restart local v4    # "finallyPos":I
    .restart local v6    # "lctt":I
    .restart local v10    # "tryEnd":I
    :cond_e
    move-object/from16 v24, v1

    move/from16 v18, v3

    move/from16 v20, v4

    move/from16 v17, v6

    .end local v1    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .end local v3    # "lineno":I
    .end local v4    # "finallyPos":I
    .end local v6    # "lctt":I
    .restart local v17    # "lctt":I
    .restart local v18    # "lineno":I
    .restart local v20    # "finallyPos":I
    .restart local v24    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    const/16 v1, 0x7e

    if-eq v13, v1, :cond_f

    .line 1721
    const-string v3, "msg.try.no.catchfinally"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v3, v4}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    goto :goto_5

    .line 1720
    :cond_f
    const/4 v4, 0x1

    .line 1724
    :goto_5
    const/4 v3, 0x0

    .line 1725
    .local v3, "finallyBlock":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 1726
    iget-object v1, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1727
    .end local v20    # "finallyPos":I
    .restart local v4    # "finallyPos":I
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->statement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    .line 1728
    invoke-direct {v0, v3}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v10

    goto :goto_6

    .line 1725
    .end local v4    # "finallyPos":I
    .restart local v20    # "finallyPos":I
    :cond_10
    move/from16 v4, v20

    .line 1731
    .end local v20    # "finallyPos":I
    .restart local v4    # "finallyPos":I
    :goto_6
    sub-int v1, v10, v2

    invoke-virtual {v5, v1}, Lcom/trendmicro/hippo/ast/TryStatement;->setLength(I)V

    .line 1732
    invoke-virtual {v5, v9}, Lcom/trendmicro/hippo/ast/TryStatement;->setTryBlock(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1733
    invoke-virtual {v5, v11}, Lcom/trendmicro/hippo/ast/TryStatement;->setCatchClauses(Ljava/util/List;)V

    .line 1734
    invoke-virtual {v5, v3}, Lcom/trendmicro/hippo/ast/TryStatement;->setFinallyBlock(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1735
    const/4 v1, -0x1

    if-eq v4, v1, :cond_11

    .line 1736
    sub-int v1, v4, v2

    invoke-virtual {v5, v1}, Lcom/trendmicro/hippo/ast/TryStatement;->setFinallyPosition(I)V

    .line 1738
    :cond_11
    move/from16 v1, v18

    .end local v18    # "lineno":I
    .local v1, "lineno":I
    invoke-virtual {v5, v1}, Lcom/trendmicro/hippo/ast/TryStatement;->setLineno(I)V

    .line 1740
    if-eqz v24, :cond_12

    .line 1741
    move-object/from16 v6, v24

    .end local v24    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .local v6, "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/ast/TryStatement;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    goto :goto_7

    .line 1740
    .end local v6    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .restart local v24    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    :cond_12
    move-object/from16 v6, v24

    .line 1744
    .end local v24    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .restart local v6    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    :goto_7
    return-object v5
.end method

.method private unaryExpr()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2575
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v0

    .line 2576
    .local v0, "tt":I
    const/16 v1, 0xa2

    if-ne v0, v1, :cond_0

    .line 2577
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2578
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Parser;->peekUntilNonComment(I)I

    move-result v0

    .line 2580
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 2582
    .local v1, "line":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_9

    const/16 v2, 0xe

    const/16 v3, 0x6c

    const/16 v4, 0x6b

    const/4 v5, 0x1

    if-eq v0, v2, :cond_6

    const/16 v2, 0x7f

    if-eq v0, v2, :cond_5

    const/16 v2, 0x15

    if-eq v0, v2, :cond_4

    const/16 v2, 0x16

    if-eq v0, v2, :cond_3

    const/16 v2, 0x1a

    if-eq v0, v2, :cond_5

    const/16 v2, 0x1b

    if-eq v0, v2, :cond_5

    const/16 v2, 0x1f

    if-eq v0, v2, :cond_2

    const/16 v2, 0x20

    if-eq v0, v2, :cond_5

    if-eq v0, v4, :cond_1

    if-eq v0, v3, :cond_1

    goto/16 :goto_0

    .line 2608
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2609
    new-instance v2, Lcom/trendmicro/hippo/ast/UnaryExpression;

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2610
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/Parser;->memberExpr(Z)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v2, v0, v3, v4}, Lcom/trendmicro/hippo/ast/UnaryExpression;-><init>(IILcom/trendmicro/hippo/ast/AstNode;)V

    .line 2611
    .local v2, "expr":Lcom/trendmicro/hippo/ast/UnaryExpression;
    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ast/UnaryExpression;->setLineno(I)V

    .line 2612
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Parser;->checkBadIncDec(Lcom/trendmicro/hippo/ast/UnaryExpression;)V

    .line 2613
    return-object v2

    .line 2616
    .end local v2    # "expr":Lcom/trendmicro/hippo/ast/UnaryExpression;
    :cond_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2617
    new-instance v2, Lcom/trendmicro/hippo/ast/UnaryExpression;

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->unaryExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v2, v0, v3, v4}, Lcom/trendmicro/hippo/ast/UnaryExpression;-><init>(IILcom/trendmicro/hippo/ast/AstNode;)V

    .line 2618
    .local v2, "node":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    .line 2619
    return-object v2

    .line 2600
    .end local v2    # "node":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_3
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2602
    new-instance v2, Lcom/trendmicro/hippo/ast/UnaryExpression;

    const/16 v3, 0x1d

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->unaryExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Lcom/trendmicro/hippo/ast/UnaryExpression;-><init>(IILcom/trendmicro/hippo/ast/AstNode;)V

    .line 2603
    .restart local v2    # "node":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    .line 2604
    return-object v2

    .line 2593
    .end local v2    # "node":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_4
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2595
    new-instance v2, Lcom/trendmicro/hippo/ast/UnaryExpression;

    const/16 v3, 0x1c

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->unaryExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Lcom/trendmicro/hippo/ast/UnaryExpression;-><init>(IILcom/trendmicro/hippo/ast/AstNode;)V

    .line 2596
    .restart local v2    # "node":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    .line 2597
    return-object v2

    .line 2587
    .end local v2    # "node":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_5
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2588
    new-instance v2, Lcom/trendmicro/hippo/ast/UnaryExpression;

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->unaryExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-direct {v2, v0, v3, v4}, Lcom/trendmicro/hippo/ast/UnaryExpression;-><init>(IILcom/trendmicro/hippo/ast/AstNode;)V

    .line 2589
    .restart local v2    # "node":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ast/AstNode;->setLineno(I)V

    .line 2590
    return-object v2

    .line 2626
    .end local v2    # "node":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_6
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->isXmlAvailable()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 2627
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2628
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->xmlInitializer()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-direct {p0, v5, v2}, Lcom/trendmicro/hippo/Parser;->memberExprTail(ZLcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    return-object v2

    .line 2634
    :cond_7
    :goto_0
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/Parser;->memberExpr(Z)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 2636
    .local v2, "pn":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekTokenOrEOL()I

    move-result v0

    .line 2637
    if-eq v0, v4, :cond_8

    if-eq v0, v3, :cond_8

    .line 2638
    return-object v2

    .line 2640
    :cond_8
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2641
    new-instance v3, Lcom/trendmicro/hippo/ast/UnaryExpression;

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    invoke-direct {v3, v0, v4, v2, v5}, Lcom/trendmicro/hippo/ast/UnaryExpression;-><init>(IILcom/trendmicro/hippo/ast/AstNode;Z)V

    .line 2643
    .local v3, "uexpr":Lcom/trendmicro/hippo/ast/UnaryExpression;
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/ast/UnaryExpression;->setLineno(I)V

    .line 2644
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/Parser;->checkBadIncDec(Lcom/trendmicro/hippo/ast/UnaryExpression;)V

    .line 2645
    return-object v3

    .line 2622
    .end local v2    # "pn":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v3    # "uexpr":Lcom/trendmicro/hippo/ast/UnaryExpression;
    :cond_9
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 2623
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;

    move-result-object v2

    return-object v2
.end method

.method private variables(IIZ)Lcom/trendmicro/hippo/ast/VariableDeclaration;
    .locals 16
    .param p1, "declType"    # I
    .param p2, "pos"    # I
    .param p3, "isStatement"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2126
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    new-instance v3, Lcom/trendmicro/hippo/ast/VariableDeclaration;

    invoke-direct {v3, v2}, Lcom/trendmicro/hippo/ast/VariableDeclaration;-><init>(I)V

    .line 2127
    .local v3, "pn":Lcom/trendmicro/hippo/ast/VariableDeclaration;
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 2128
    iget-object v4, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v4, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->setLineno(I)V

    .line 2129
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v4

    .line 2130
    .local v4, "varjsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    if-eqz v4, :cond_0

    .line 2131
    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    .line 2137
    :cond_0
    :goto_0
    const/4 v5, 0x0

    .line 2138
    .local v5, "destructuring":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v6, 0x0

    .line 2139
    .local v6, "name":Lcom/trendmicro/hippo/ast/Name;
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v7

    .local v7, "tt":I
    iget-object v8, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v8, v8, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2140
    .local v8, "kidPos":I
    iget-object v9, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v9, v9, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 2142
    .local v9, "end":I
    const/16 v10, 0x54

    const/4 v11, 0x1

    if-eq v7, v10, :cond_4

    const/16 v10, 0x56

    if-ne v7, v10, :cond_1

    goto :goto_1

    .line 2151
    :cond_1
    const/16 v10, 0x27

    const-string v12, "msg.bad.var"

    invoke-direct {v0, v10, v12, v11}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 2152
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->createNameNode()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v6

    .line 2153
    iget-object v10, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v10}, Lcom/trendmicro/hippo/TokenStream;->getLineno()I

    move-result v10

    invoke-virtual {v6, v10}, Lcom/trendmicro/hippo/ast/Name;->setLineno(I)V

    .line 2154
    iget-boolean v10, v0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    if-eqz v10, :cond_3

    .line 2155
    iget-object v10, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v10}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v10

    .line 2156
    .local v10, "id":Ljava/lang/String;
    const-string v12, "eval"

    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2

    iget-object v12, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v12}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "arguments"

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 2158
    :cond_2
    const-string v12, "msg.bad.id.strict"

    invoke-virtual {v0, v12, v10}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 2161
    .end local v10    # "id":Ljava/lang/String;
    :cond_3
    iget-object v10, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v10}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v10

    iget-boolean v12, v0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    invoke-virtual {v0, v1, v10, v12}, Lcom/trendmicro/hippo/Parser;->defineSymbol(ILjava/lang/String;Z)V

    goto :goto_2

    .line 2144
    :cond_4
    :goto_1
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->destructuringPrimaryExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    .line 2145
    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v9

    .line 2146
    instance-of v10, v5, Lcom/trendmicro/hippo/ast/DestructuringForm;

    if-nez v10, :cond_5

    .line 2147
    sub-int v10, v9, v8

    const-string v12, "msg.bad.assign.left"

    invoke-virtual {v0, v12, v8, v10}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;II)V

    .line 2148
    :cond_5
    invoke-virtual {v0, v5}, Lcom/trendmicro/hippo/Parser;->markDestructuring(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2164
    :goto_2
    iget-object v10, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v10, v10, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 2166
    .local v10, "lineno":I
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v12

    .line 2168
    .local v12, "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    const/4 v13, 0x0

    .line 2169
    .local v13, "init":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v14, 0x5b

    invoke-direct {v0, v14, v11}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 2170
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->assignExpr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v13

    .line 2171
    invoke-direct {v0, v13}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v9

    .line 2174
    :cond_6
    new-instance v14, Lcom/trendmicro/hippo/ast/VariableInitializer;

    sub-int v15, v9, v8

    invoke-direct {v14, v8, v15}, Lcom/trendmicro/hippo/ast/VariableInitializer;-><init>(II)V

    .line 2175
    .local v14, "vi":Lcom/trendmicro/hippo/ast/VariableInitializer;
    if-eqz v5, :cond_8

    .line 2176
    if-nez v13, :cond_7

    iget-boolean v15, v0, Lcom/trendmicro/hippo/Parser;->inForInit:Z

    if-nez v15, :cond_7

    .line 2177
    const-string v15, "msg.destruct.assign.no.init"

    invoke-virtual {v0, v15}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2179
    :cond_7
    invoke-virtual {v14, v5}, Lcom/trendmicro/hippo/ast/VariableInitializer;->setTarget(Lcom/trendmicro/hippo/ast/AstNode;)V

    goto :goto_3

    .line 2181
    :cond_8
    invoke-virtual {v14, v6}, Lcom/trendmicro/hippo/ast/VariableInitializer;->setTarget(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2183
    :goto_3
    invoke-virtual {v14, v13}, Lcom/trendmicro/hippo/ast/VariableInitializer;->setInitializer(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2184
    invoke-virtual {v14, v1}, Lcom/trendmicro/hippo/ast/VariableInitializer;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 2185
    invoke-virtual {v14, v12}, Lcom/trendmicro/hippo/ast/VariableInitializer;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    .line 2186
    invoke-virtual {v14, v10}, Lcom/trendmicro/hippo/ast/VariableInitializer;->setLineno(I)V

    .line 2187
    invoke-virtual {v3, v14}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->addVariable(Lcom/trendmicro/hippo/ast/VariableInitializer;)V

    .line 2189
    const/16 v15, 0x5a

    invoke-direct {v0, v15, v11}, Lcom/trendmicro/hippo/Parser;->matchToken(IZ)Z

    move-result v11

    if-nez v11, :cond_9

    .line 2190
    nop

    .line 2192
    .end local v5    # "destructuring":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v6    # "name":Lcom/trendmicro/hippo/ast/Name;
    .end local v7    # "tt":I
    .end local v8    # "kidPos":I
    .end local v10    # "lineno":I
    .end local v12    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .end local v13    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v14    # "vi":Lcom/trendmicro/hippo/ast/VariableInitializer;
    sub-int v5, v9, v2

    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->setLength(I)V

    .line 2193
    move/from16 v11, p3

    invoke-virtual {v3, v11}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->setIsStatement(Z)V

    .line 2194
    return-object v3

    .line 2189
    .restart local v5    # "destructuring":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v6    # "name":Lcom/trendmicro/hippo/ast/Name;
    .restart local v7    # "tt":I
    .restart local v8    # "kidPos":I
    .restart local v10    # "lineno":I
    .restart local v12    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .restart local v13    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v14    # "vi":Lcom/trendmicro/hippo/ast/VariableInitializer;
    :cond_9
    move/from16 v11, p3

    .line 2191
    .end local v5    # "destructuring":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v6    # "name":Lcom/trendmicro/hippo/ast/Name;
    .end local v7    # "tt":I
    .end local v8    # "kidPos":I
    .end local v10    # "lineno":I
    .end local v12    # "jsdocNode":Lcom/trendmicro/hippo/ast/Comment;
    .end local v13    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v14    # "vi":Lcom/trendmicro/hippo/ast/VariableInitializer;
    goto/16 :goto_0
.end method

.method private warnMissingSemi(II)V
    .locals 11
    .param p1, "pos"    # I
    .param p2, "end"    # I

    .line 3898
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->isStrictMode()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3899
    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 3900
    .local v0, "linep":[I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v1, p2, v0}, Lcom/trendmicro/hippo/TokenStream;->getLine(I[I)Ljava/lang/String;

    move-result-object v1

    .line 3904
    .local v1, "line":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->isIdeMode()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 3905
    aget v2, v0, v3

    sub-int v2, p2, v2

    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    goto :goto_0

    .line 3906
    :cond_0
    move v2, p1

    :goto_0
    move v10, v2

    .line 3907
    .local v10, "beg":I
    if-eqz v1, :cond_1

    .line 3908
    sub-int v6, p2, v10

    const/4 v2, 0x0

    aget v7, v0, v2

    aget v9, v0, v3

    const-string v3, "msg.missing.semi"

    const-string v4, ""

    move-object v2, p0

    move v5, v10

    move-object v8, v1

    invoke-direct/range {v2 .. v9}, Lcom/trendmicro/hippo/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I)V

    goto :goto_1

    .line 3912
    :cond_1
    sub-int v2, p2, v10

    const-string v3, "msg.missing.semi"

    const-string v4, ""

    invoke-virtual {p0, v3, v4, v10, v2}, Lcom/trendmicro/hippo/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 3915
    .end local v0    # "linep":[I
    .end local v1    # "line":Ljava/lang/String;
    .end local v10    # "beg":I
    :cond_2
    :goto_1
    return-void
.end method

.method private warnTrailingComma(ILjava/util/List;I)V
    .locals 2
    .param p1, "pos"    # I
    .param p3, "commaPos"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "*>;I)V"
        }
    .end annotation

    .line 3918
    .local p2, "elems":Ljava/util/List;, "Ljava/util/List<*>;"
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->getWarnTrailingComma()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3920
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3921
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result p1

    .line 3923
    :cond_0
    invoke-direct {p0, p3}, Lcom/trendmicro/hippo/Parser;->lineBeginningFor(I)I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 3924
    sub-int v0, p3, p1

    const-string v1, "msg.extra.trailing.comma"

    invoke-virtual {p0, v1, p1, v0}, Lcom/trendmicro/hippo/Parser;->addWarning(Ljava/lang/String;II)V

    .line 3926
    :cond_1
    return-void
.end method

.method private whileLoop()Lcom/trendmicro/hippo/ast/WhileLoop;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1426
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x76

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1427
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1428
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1429
    .local v0, "pos":I
    new-instance v1, Lcom/trendmicro/hippo/ast/WhileLoop;

    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/ast/WhileLoop;-><init>(I)V

    .line 1430
    .local v1, "pn":Lcom/trendmicro/hippo/ast/WhileLoop;
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/WhileLoop;->setLineno(I)V

    .line 1431
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/Parser;->enterLoop(Lcom/trendmicro/hippo/ast/Loop;)V

    .line 1433
    :try_start_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->condition()Lcom/trendmicro/hippo/Parser$ConditionData;

    move-result-object v2

    .line 1434
    .local v2, "data":Lcom/trendmicro/hippo/Parser$ConditionData;
    iget-object v3, v2, Lcom/trendmicro/hippo/Parser$ConditionData;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ast/WhileLoop;->setCondition(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1435
    iget v3, v2, Lcom/trendmicro/hippo/Parser$ConditionData;->lp:I

    sub-int/2addr v3, v0

    iget v4, v2, Lcom/trendmicro/hippo/Parser$ConditionData;->rp:I

    sub-int/2addr v4, v0

    invoke-virtual {v1, v3, v4}, Lcom/trendmicro/hippo/ast/WhileLoop;->setParens(II)V

    .line 1436
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/Parser;->getNextStatementAfterInlineComments(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    .line 1437
    .local v3, "body":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v4

    sub-int/2addr v4, v0

    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/ast/WhileLoop;->setLength(I)V

    .line 1438
    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ast/WhileLoop;->setBody(Lcom/trendmicro/hippo/ast/AstNode;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1440
    .end local v2    # "data":Lcom/trendmicro/hippo/Parser$ConditionData;
    .end local v3    # "body":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->exitLoop()V

    .line 1441
    nop

    .line 1442
    return-object v1

    .line 1440
    :catchall_0
    move-exception v2

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->exitLoop()V

    .line 1441
    throw v2
.end method

.method private withStatement()Lcom/trendmicro/hippo/ast/WithStatement;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1861
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0x7c

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 1862
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->consumeToken()V

    .line 1864
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->getAndResetJsDoc()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v0

    .line 1866
    .local v0, "withComment":Lcom/trendmicro/hippo/ast/Comment;
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .local v1, "lineno":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v2, "pos":I
    const/4 v3, -0x1

    .local v3, "lp":I
    const/4 v4, -0x1

    .line 1867
    .local v4, "rp":I
    const/16 v5, 0x58

    const-string v6, "msg.no.paren.with"

    const/4 v7, 0x1

    invoke-direct {p0, v5, v6, v7}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1868
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v5, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1870
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    .line 1872
    .local v5, "obj":Lcom/trendmicro/hippo/ast/AstNode;
    const/16 v6, 0x59

    const-string v8, "msg.no.paren.after.with"

    invoke-direct {p0, v6, v8, v7}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1873
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v6, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1875
    :cond_2
    new-instance v6, Lcom/trendmicro/hippo/ast/WithStatement;

    invoke-direct {v6, v2}, Lcom/trendmicro/hippo/ast/WithStatement;-><init>(I)V

    .line 1876
    .local v6, "pn":Lcom/trendmicro/hippo/ast/WithStatement;
    invoke-direct {p0, v6}, Lcom/trendmicro/hippo/Parser;->getNextStatementAfterInlineComments(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v7

    .line 1877
    .local v7, "body":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v8

    sub-int/2addr v8, v2

    invoke-virtual {v6, v8}, Lcom/trendmicro/hippo/ast/WithStatement;->setLength(I)V

    .line 1878
    invoke-virtual {v6, v0}, Lcom/trendmicro/hippo/ast/WithStatement;->setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V

    .line 1879
    invoke-virtual {v6, v5}, Lcom/trendmicro/hippo/ast/WithStatement;->setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1880
    invoke-virtual {v6, v7}, Lcom/trendmicro/hippo/ast/WithStatement;->setStatement(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1881
    invoke-virtual {v6, v3, v4}, Lcom/trendmicro/hippo/ast/WithStatement;->setParens(II)V

    .line 1882
    invoke-virtual {v6, v1}, Lcom/trendmicro/hippo/ast/WithStatement;->setLineno(I)V

    .line 1883
    return-object v6
.end method

.method private xmlElemRef(ILcom/trendmicro/hippo/ast/Name;I)Lcom/trendmicro/hippo/ast/XmlElemRef;
    .locals 8
    .param p1, "atPos"    # I
    .param p2, "namespace"    # Lcom/trendmicro/hippo/ast/Name;
    .param p3, "colonPos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3072
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v0, "lb":I
    const/4 v1, -0x1

    .local v1, "rb":I
    const/4 v2, -0x1

    if-eq p1, v2, :cond_0

    move v2, p1

    goto :goto_0

    :cond_0
    move v2, v0

    .line 3073
    .local v2, "pos":I
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    .line 3074
    .local v3, "expr":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/Parser;->getNodeEnd(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result v4

    .line 3075
    .local v4, "end":I
    const/16 v5, 0x55

    const/4 v6, 0x1

    const-string v7, "msg.no.bracket.index"

    invoke-direct {p0, v5, v7, v6}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 3076
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v5, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 3077
    iget-object v5, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v4, v5, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 3079
    :cond_1
    new-instance v5, Lcom/trendmicro/hippo/ast/XmlElemRef;

    sub-int v6, v4, v2

    invoke-direct {v5, v2, v6}, Lcom/trendmicro/hippo/ast/XmlElemRef;-><init>(II)V

    .line 3080
    .local v5, "ref":Lcom/trendmicro/hippo/ast/XmlElemRef;
    invoke-virtual {v5, p2}, Lcom/trendmicro/hippo/ast/XmlElemRef;->setNamespace(Lcom/trendmicro/hippo/ast/Name;)V

    .line 3081
    invoke-virtual {v5, p3}, Lcom/trendmicro/hippo/ast/XmlElemRef;->setColonPos(I)V

    .line 3082
    invoke-virtual {v5, p1}, Lcom/trendmicro/hippo/ast/XmlElemRef;->setAtPos(I)V

    .line 3083
    invoke-virtual {v5, v3}, Lcom/trendmicro/hippo/ast/XmlElemRef;->setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 3084
    invoke-virtual {v5, v0, v1}, Lcom/trendmicro/hippo/ast/XmlElemRef;->setBrackets(II)V

    .line 3085
    return-object v5
.end method

.method private xmlInitializer()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2652
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->currentToken:I

    const/16 v1, 0xe

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 2653
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .local v0, "pos":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/TokenStream;->getFirstXMLToken()I

    move-result v1

    .line 2654
    .local v1, "tt":I
    const/16 v2, 0x95

    const/16 v3, 0x92

    const-string v4, "msg.syntax"

    if-eq v1, v3, :cond_1

    if-eq v1, v2, :cond_1

    .line 2655
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2656
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;

    move-result-object v2

    return-object v2

    .line 2659
    :cond_1
    new-instance v5, Lcom/trendmicro/hippo/ast/XmlLiteral;

    invoke-direct {v5, v0}, Lcom/trendmicro/hippo/ast/XmlLiteral;-><init>(I)V

    .line 2660
    .local v5, "pn":Lcom/trendmicro/hippo/ast/XmlLiteral;
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v6, v6, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/ast/XmlLiteral;->setLineno(I)V

    .line 2663
    :goto_0
    if-eq v1, v3, :cond_3

    if-eq v1, v2, :cond_2

    .line 2683
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 2684
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->makeErrorNode()Lcom/trendmicro/hippo/ast/ErrorNode;

    move-result-object v2

    return-object v2

    .line 2679
    :cond_2
    new-instance v2, Lcom/trendmicro/hippo/ast/XmlString;

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/trendmicro/hippo/ast/XmlString;-><init>(ILjava/lang/String;)V

    invoke-virtual {v5, v2}, Lcom/trendmicro/hippo/ast/XmlLiteral;->addFragment(Lcom/trendmicro/hippo/ast/XmlFragment;)V

    .line 2680
    return-object v5

    .line 2665
    :cond_3
    new-instance v6, Lcom/trendmicro/hippo/ast/XmlString;

    iget-object v7, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v7, v7, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v8}, Lcom/trendmicro/hippo/TokenStream;->getString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lcom/trendmicro/hippo/ast/XmlString;-><init>(ILjava/lang/String;)V

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/ast/XmlLiteral;->addFragment(Lcom/trendmicro/hippo/ast/XmlFragment;)V

    .line 2666
    const/16 v6, 0x56

    const/4 v7, 0x1

    invoke-direct {p0, v6, v4, v7}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 2667
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v6, v6, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 2668
    .local v6, "beg":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->peekToken()I

    move-result v8

    const/16 v9, 0x57

    if-ne v8, v9, :cond_4

    .line 2669
    new-instance v8, Lcom/trendmicro/hippo/ast/EmptyExpression;

    iget-object v10, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v10, v10, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v10, v6

    invoke-direct {v8, v6, v10}, Lcom/trendmicro/hippo/ast/EmptyExpression;-><init>(II)V

    goto :goto_1

    .line 2670
    :cond_4
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->expr()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v8

    :goto_1
    nop

    .line 2671
    .local v8, "expr":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-direct {p0, v9, v4, v7}, Lcom/trendmicro/hippo/Parser;->mustMatchToken(ILjava/lang/String;Z)Z

    .line 2672
    new-instance v7, Lcom/trendmicro/hippo/ast/XmlExpression;

    invoke-direct {v7, v6, v8}, Lcom/trendmicro/hippo/ast/XmlExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;)V

    .line 2673
    .local v7, "xexpr":Lcom/trendmicro/hippo/ast/XmlExpression;
    iget-object v9, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v9}, Lcom/trendmicro/hippo/TokenStream;->isXMLAttribute()Z

    move-result v9

    invoke-virtual {v7, v9}, Lcom/trendmicro/hippo/ast/XmlExpression;->setIsXmlAttribute(Z)V

    .line 2674
    iget-object v9, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v9, v9, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    sub-int/2addr v9, v6

    invoke-virtual {v7, v9}, Lcom/trendmicro/hippo/ast/XmlExpression;->setLength(I)V

    .line 2675
    invoke-virtual {v5, v7}, Lcom/trendmicro/hippo/ast/XmlLiteral;->addFragment(Lcom/trendmicro/hippo/ast/XmlFragment;)V

    .line 2676
    nop

    .line 2662
    .end local v6    # "beg":I
    .end local v7    # "xexpr":Lcom/trendmicro/hippo/ast/XmlExpression;
    .end local v8    # "expr":Lcom/trendmicro/hippo/ast/AstNode;
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/TokenStream;->getNextXMLToken()I

    move-result v1

    goto :goto_0
.end method


# virtual methods
.method addError(Ljava/lang/String;)V
    .locals 3
    .param p1, "messageId"    # Ljava/lang/String;

    .line 227
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v1, v2

    invoke-virtual {p0, p1, v0, v1}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;II)V

    .line 228
    return-void
.end method

.method addError(Ljava/lang/String;I)V
    .locals 4
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "c"    # I

    .line 240
    int-to-char v0, p2

    invoke-static {v0}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "messageArg":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v2, v3

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;II)V

    .line 243
    return-void
.end method

.method addError(Ljava/lang/String;II)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "position"    # I
    .param p3, "length"    # I

    .line 231
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;II)V

    .line 232
    return-void
.end method

.method addError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;

    .line 235
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v1, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;II)V

    .line 237
    return-void
.end method

.method addError(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 10
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I

    .line 247
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->syntaxErrorCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/trendmicro/hippo/Parser;->syntaxErrorCount:I

    .line 248
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/Parser;->lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, "message":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->errorCollector:Lcom/trendmicro/hippo/ast/IdeErrorReporter;

    if-eqz v1, :cond_0

    .line 250
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    invoke-interface {v1, v0, v2, p3, p4}, Lcom/trendmicro/hippo/ast/IdeErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_1

    .line 252
    :cond_0
    const/4 v1, 0x1

    .local v1, "lineno":I
    const/4 v2, 0x1

    .line 253
    .local v2, "offset":I
    const-string v3, ""

    .line 254
    .local v3, "line":Ljava/lang/String;
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    if-eqz v4, :cond_1

    .line 255
    invoke-virtual {v4}, Lcom/trendmicro/hippo/TokenStream;->getLineno()I

    move-result v1

    .line 256
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/TokenStream;->getLine()Ljava/lang/String;

    move-result-object v3

    .line 257
    iget-object v4, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/TokenStream;->getOffset()I

    move-result v2

    move v7, v1

    move v8, v2

    move-object v9, v3

    goto :goto_0

    .line 254
    :cond_1
    move v7, v1

    move v8, v2

    move-object v9, v3

    .line 259
    .end local v1    # "lineno":I
    .end local v2    # "offset":I
    .end local v3    # "line":Ljava/lang/String;
    .local v7, "lineno":I
    .local v8, "offset":I
    .local v9, "line":Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    move-object v2, v0

    move v4, v7

    move-object v5, v9

    move v6, v8

    invoke-interface/range {v1 .. v6}, Lcom/trendmicro/hippo/ErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 261
    .end local v7    # "lineno":I
    .end local v8    # "offset":I
    .end local v9    # "line":Ljava/lang/String;
    :goto_1
    return-void
.end method

.method addStrictWarning(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;

    .line 185
    const/4 v0, -0x1

    .local v0, "beg":I
    const/4 v1, -0x1

    .line 186
    .local v1, "end":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    if-eqz v2, :cond_0

    .line 187
    iget v0, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 188
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v1, v2, v3

    .line 190
    :cond_0
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/trendmicro/hippo/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 191
    return-void
.end method

.method addStrictWarning(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I

    .line 195
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->isStrictMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 196
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/Parser;->addWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 197
    :cond_0
    return-void
.end method

.method addWarning(Ljava/lang/String;II)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "position"    # I
    .param p3, "length"    # I

    .line 209
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/trendmicro/hippo/Parser;->addWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 210
    return-void
.end method

.method addWarning(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;

    .line 200
    const/4 v0, -0x1

    .local v0, "beg":I
    const/4 v1, -0x1

    .line 201
    .local v1, "end":I
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    if-eqz v2, :cond_0

    .line 202
    iget v0, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 203
    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v3, v3, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int v1, v2, v3

    .line 205
    :cond_0
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/trendmicro/hippo/Parser;->addWarning(Ljava/lang/String;Ljava/lang/String;II)V

    .line 206
    return-void
.end method

.method addWarning(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 7
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I

    .line 215
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/Parser;->lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 216
    .local v6, "message":Ljava/lang/String;
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->reportWarningAsError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 217
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_0

    .line 218
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->errorCollector:Lcom/trendmicro/hippo/ast/IdeErrorReporter;

    if-eqz v0, :cond_1

    .line 219
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    invoke-interface {v0, v6, v1, p3, p4}, Lcom/trendmicro/hippo/ast/IdeErrorReporter;->warning(Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_0

    .line 221
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/TokenStream;->getLineno()I

    move-result v3

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    .line 222
    invoke-virtual {v1}, Lcom/trendmicro/hippo/TokenStream;->getLine()Ljava/lang/String;

    move-result-object v4

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/TokenStream;->getOffset()I

    move-result v5

    .line 221
    move-object v1, v6

    invoke-interface/range {v0 .. v5}, Lcom/trendmicro/hippo/ErrorReporter;->warning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 224
    :goto_0
    return-void
.end method

.method protected checkActivationName(Ljava/lang/String;I)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "token"    # I

    .line 3787
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->insideFunction()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3788
    return-void

    .line 3790
    :cond_0
    const/4 v0, 0x0

    .line 3791
    .local v0, "activation":Z
    const-string v1, "arguments"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    check-cast v1, Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 3793
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_1

    .line 3794
    const/4 v0, 0x1

    goto :goto_0

    .line 3795
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->getActivationNames()Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 3796
    invoke-virtual {v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->getActivationNames()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 3797
    const/4 v0, 0x1

    goto :goto_0

    .line 3798
    :cond_2
    const-string v1, "length"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 3799
    const/16 v1, 0x21

    if-ne p2, v1, :cond_3

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 3800
    invoke-virtual {v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v1

    const/16 v2, 0x78

    if-ne v1, v2, :cond_3

    .line 3803
    const/4 v0, 0x1

    .line 3806
    :cond_3
    :goto_0
    if-eqz v0, :cond_4

    .line 3807
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->setRequiresActivation()V

    .line 3809
    :cond_4
    return-void
.end method

.method protected checkMutableReference(Lcom/trendmicro/hippo/Node;)V
    .locals 2
    .param p1, "n"    # Lcom/trendmicro/hippo/Node;

    .line 4262
    const/16 v0, 0x10

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v0

    .line 4263
    .local v0, "memberTypeFlags":I
    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_0

    .line 4264
    const-string v1, "msg.bad.assign.left"

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 4266
    :cond_0
    return-void
.end method

.method createDestructuringAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "type"    # I
    .param p2, "left"    # Lcom/trendmicro/hippo/Node;
    .param p3, "right"    # Lcom/trendmicro/hippo/Node;

    .line 4000
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v0

    .line 4001
    .local v0, "tempName":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/trendmicro/hippo/Parser;->destructuringAssignmentHelper(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 4003
    .local v1, "result":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 4004
    .local v2, "comma":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Parser;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 4005
    return-object v1
.end method

.method protected createName(ILjava/lang/String;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 1
    .param p1, "type"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "child"    # Lcom/trendmicro/hippo/Node;

    .line 4158
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/Parser;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 4159
    .local v0, "result":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 4160
    if-eqz p3, :cond_0

    .line 4161
    invoke-virtual {v0, p3}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 4162
    :cond_0
    return-object v0
.end method

.method protected createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 4153
    const/16 v0, 0x27

    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/Parser;->checkActivationName(Ljava/lang/String;I)V

    .line 4154
    invoke-static {v0, p1}, Lcom/trendmicro/hippo/Node;->newString(ILjava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0
.end method

.method protected createNumber(D)Lcom/trendmicro/hippo/Node;
    .locals 1
    .param p1, "number"    # D

    .line 4166
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/Node;->newNumber(D)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0
.end method

.method protected createScopeNode(II)Lcom/trendmicro/hippo/ast/Scope;
    .locals 1
    .param p1, "token"    # I
    .param p2, "lineno"    # I

    .line 4178
    new-instance v0, Lcom/trendmicro/hippo/ast/Scope;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ast/Scope;-><init>()V

    .line 4179
    .local v0, "scope":Lcom/trendmicro/hippo/ast/Scope;
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Scope;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 4180
    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/ast/Scope;->setLineno(I)V

    .line 4181
    return-object v0
.end method

.method defineSymbol(ILjava/lang/String;)V
    .locals 1
    .param p1, "declType"    # I
    .param p2, "name"    # Ljava/lang/String;

    .line 2242
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/trendmicro/hippo/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 2243
    return-void
.end method

.method defineSymbol(ILjava/lang/String;Z)V
    .locals 9
    .param p1, "declType"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "ignoreNotInBlock"    # Z

    .line 2246
    if-nez p2, :cond_1

    .line 2247
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->isIdeMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2248
    return-void

    .line 2250
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    .line 2252
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/ast/Scope;->getDefiningScope(Ljava/lang/String;)Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v0

    .line 2253
    .local v0, "definingScope":Lcom/trendmicro/hippo/ast/Scope;
    if-eqz v0, :cond_2

    .line 2254
    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/ast/Scope;->getSymbol(Ljava/lang/String;)Lcom/trendmicro/hippo/ast/Symbol;

    move-result-object v1

    goto :goto_0

    .line 2255
    :cond_2
    const/4 v1, 0x0

    :goto_0
    nop

    .line 2256
    .local v1, "symbol":Lcom/trendmicro/hippo/ast/Symbol;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Symbol;->getDeclType()I

    move-result v2

    goto :goto_1

    :cond_3
    const/4 v2, -0x1

    .line 2257
    .local v2, "symDeclType":I
    :goto_1
    const-string v3, "msg.var.redecl"

    const/16 v4, 0x6e

    const/16 v5, 0x9a

    const/16 v6, 0x7b

    const/16 v7, 0x9b

    if-eqz v1, :cond_9

    if-eq v2, v7, :cond_4

    if-eq p1, v7, :cond_4

    iget-object v8, p0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    if-ne v0, v8, :cond_9

    if-ne v2, v5, :cond_9

    .line 2262
    :cond_4
    if-ne v2, v7, :cond_5

    const-string v3, "msg.const.redecl"

    goto :goto_2

    .line 2263
    :cond_5
    if-ne v2, v5, :cond_6

    const-string v3, "msg.let.redecl"

    goto :goto_2

    .line 2264
    :cond_6
    if-ne v2, v6, :cond_7

    goto :goto_2

    .line 2265
    :cond_7
    if-ne v2, v4, :cond_8

    const-string v3, "msg.fn.redecl"

    goto :goto_2

    .line 2266
    :cond_8
    const-string v3, "msg.parm.redecl"

    .line 2262
    :goto_2
    invoke-virtual {p0, v3, p2}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 2267
    return-void

    .line 2269
    :cond_9
    const/16 v8, 0x58

    if-eq p1, v8, :cond_12

    if-eq p1, v4, :cond_e

    if-eq p1, v6, :cond_e

    if-eq p1, v5, :cond_b

    if-ne p1, v7, :cond_a

    goto :goto_3

    .line 2304
    :cond_a
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 2271
    :cond_b
    if-nez p3, :cond_d

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 2272
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/Scope;->getType()I

    move-result v3

    const/16 v4, 0x71

    if-eq v3, v4, :cond_c

    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    instance-of v3, v3, Lcom/trendmicro/hippo/ast/Loop;

    if-eqz v3, :cond_d

    .line 2274
    :cond_c
    const-string v3, "msg.let.decl.not.in.block"

    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 2275
    return-void

    .line 2277
    :cond_d
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    new-instance v4, Lcom/trendmicro/hippo/ast/Symbol;

    invoke-direct {v4, p1, p2}, Lcom/trendmicro/hippo/ast/Symbol;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/Scope;->putSymbol(Lcom/trendmicro/hippo/ast/Symbol;)V

    .line 2278
    return-void

    .line 2283
    :cond_e
    :goto_3
    if-eqz v1, :cond_10

    .line 2284
    if-ne v2, v6, :cond_f

    .line 2285
    invoke-virtual {p0, v3, p2}, Lcom/trendmicro/hippo/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 2286
    :cond_f
    if-ne v2, v8, :cond_11

    .line 2287
    const-string v3, "msg.var.hides.arg"

    invoke-virtual {p0, v3, p2}, Lcom/trendmicro/hippo/Parser;->addStrictWarning(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 2290
    :cond_10
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    new-instance v4, Lcom/trendmicro/hippo/ast/Symbol;

    invoke-direct {v4, p1, p2}, Lcom/trendmicro/hippo/ast/Symbol;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->putSymbol(Lcom/trendmicro/hippo/ast/Symbol;)V

    .line 2292
    :cond_11
    :goto_4
    return-void

    .line 2295
    :cond_12
    if-eqz v1, :cond_13

    .line 2298
    const-string v3, "msg.dup.parms"

    invoke-virtual {p0, v3, p2}, Lcom/trendmicro/hippo/Parser;->addWarning(Ljava/lang/String;Ljava/lang/String;)V

    .line 2300
    :cond_13
    iget-object v3, p0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    new-instance v4, Lcom/trendmicro/hippo/ast/Symbol;

    invoke-direct {v4, p1, p2}, Lcom/trendmicro/hippo/ast/Symbol;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->putSymbol(Lcom/trendmicro/hippo/ast/Symbol;)V

    .line 2301
    return-void
.end method

.method destructuringArray(Lcom/trendmicro/hippo/ast/ArrayLiteral;ILjava/lang/String;Lcom/trendmicro/hippo/Node;Ljava/util/List;)Z
    .locals 10
    .param p1, "array"    # Lcom/trendmicro/hippo/ast/ArrayLiteral;
    .param p2, "variableType"    # I
    .param p3, "tempName"    # Ljava/lang/String;
    .param p4, "parent"    # Lcom/trendmicro/hippo/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/ast/ArrayLiteral;",
            "I",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/Node;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 4062
    .local p5, "destructuringNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x1

    .line 4063
    .local v0, "empty":Z
    const/16 v1, 0x9b

    if-ne p2, v1, :cond_0

    .line 4064
    const/16 v1, 0x9c

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    .line 4065
    .local v1, "setOp":I
    :goto_0
    const/4 v2, 0x0

    .line 4066
    .local v2, "index":I
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->getElements()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/ast/AstNode;

    .line 4067
    .local v4, "n":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v5

    const/16 v6, 0x81

    if-ne v5, v6, :cond_1

    .line 4068
    add-int/lit8 v2, v2, 0x1

    .line 4069
    goto :goto_1

    .line 4071
    :cond_1
    new-instance v5, Lcom/trendmicro/hippo/Node;

    const/16 v6, 0x24

    .line 4072
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/Parser;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v7

    int-to-double v8, v2

    .line 4073
    invoke-virtual {p0, v8, v9}, Lcom/trendmicro/hippo/Parser;->createNumber(D)Lcom/trendmicro/hippo/Node;

    move-result-object v8

    invoke-direct {v5, v6, v7, v8}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4074
    .local v5, "rightElem":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v6

    const/16 v7, 0x27

    if-ne v6, v7, :cond_3

    .line 4075
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/AstNode;->getString()Ljava/lang/String;

    move-result-object v6

    .line 4076
    .local v6, "name":Ljava/lang/String;
    new-instance v7, Lcom/trendmicro/hippo/Node;

    const/16 v8, 0x31

    const/4 v9, 0x0

    .line 4077
    invoke-virtual {p0, v8, v6, v9}, Lcom/trendmicro/hippo/Parser;->createName(ILjava/lang/String;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v8

    invoke-direct {v7, v1, v8, v5}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4076
    invoke-virtual {p4, v7}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 4080
    const/4 v7, -0x1

    if-eq p2, v7, :cond_2

    .line 4081
    const/4 v7, 0x1

    invoke-virtual {p0, p2, v6, v7}, Lcom/trendmicro/hippo/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 4082
    invoke-interface {p5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4084
    .end local v6    # "name":Ljava/lang/String;
    :cond_2
    goto :goto_2

    .line 4085
    :cond_3
    iget-object v6, p0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 4089
    invoke-virtual {v6}, Lcom/trendmicro/hippo/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v6

    .line 4087
    invoke-virtual {p0, p2, v4, v5, v6}, Lcom/trendmicro/hippo/Parser;->destructuringAssignmentHelper(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 4086
    invoke-virtual {p4, v6}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 4091
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 4092
    const/4 v0, 0x0

    .line 4093
    .end local v4    # "n":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v5    # "rightElem":Lcom/trendmicro/hippo/Node;
    goto :goto_1

    .line 4094
    :cond_4
    return v0
.end method

.method destructuringAssignmentHelper(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Ljava/lang/String;)Lcom/trendmicro/hippo/Node;
    .locals 11
    .param p1, "variableType"    # I
    .param p2, "left"    # Lcom/trendmicro/hippo/Node;
    .param p3, "right"    # Lcom/trendmicro/hippo/Node;
    .param p4, "tempName"    # Ljava/lang/String;

    .line 4011
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getLineno()I

    move-result v0

    const/16 v1, 0x9f

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/Parser;->createScopeNode(II)Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v0

    .line 4012
    .local v0, "result":Lcom/trendmicro/hippo/ast/Scope;
    new-instance v1, Lcom/trendmicro/hippo/Node;

    .line 4013
    const/16 v2, 0x27

    invoke-virtual {p0, v2, p4, p3}, Lcom/trendmicro/hippo/Parser;->createName(ILjava/lang/String;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    const/16 v3, 0x9a

    invoke-direct {v1, v3, v2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 4012
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/Scope;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    .line 4015
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Parser;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 4016
    const/4 v1, 0x1

    invoke-virtual {p0, v3, p4, v1}, Lcom/trendmicro/hippo/Parser;->defineSymbol(ILjava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4018
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 4019
    nop

    .line 4020
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x5a

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 4021
    .local v1, "comma":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/Scope;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 4022
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 4023
    .local v2, "destructuringNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v10, 0x1

    .line 4024
    .local v10, "empty":Z
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v4

    const/16 v5, 0x21

    const-string v6, "msg.bad.assign.left"

    if-eq v4, v5, :cond_2

    const/16 v5, 0x24

    if-eq v4, v5, :cond_2

    const/16 v3, 0x42

    if-eq v4, v3, :cond_1

    const/16 v3, 0x43

    if-eq v4, v3, :cond_0

    .line 4046
    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    goto :goto_1

    .line 4031
    :cond_0
    move-object v5, p2

    check-cast v5, Lcom/trendmicro/hippo/ast/ObjectLiteral;

    move-object v4, p0

    move v6, p1

    move-object v7, p4

    move-object v8, v1

    move-object v9, v2

    invoke-virtual/range {v4 .. v9}, Lcom/trendmicro/hippo/Parser;->destructuringObject(Lcom/trendmicro/hippo/ast/ObjectLiteral;ILjava/lang/String;Lcom/trendmicro/hippo/Node;Ljava/util/List;)Z

    move-result v10

    .line 4034
    goto :goto_1

    .line 4026
    :cond_1
    move-object v5, p2

    check-cast v5, Lcom/trendmicro/hippo/ast/ArrayLiteral;

    move-object v4, p0

    move v6, p1

    move-object v7, p4

    move-object v8, v1

    move-object v9, v2

    invoke-virtual/range {v4 .. v9}, Lcom/trendmicro/hippo/Parser;->destructuringArray(Lcom/trendmicro/hippo/ast/ArrayLiteral;ILjava/lang/String;Lcom/trendmicro/hippo/Node;Ljava/util/List;)Z

    move-result v10

    .line 4029
    goto :goto_1

    .line 4037
    :cond_2
    const/16 v4, 0x7b

    if-eq p1, v4, :cond_3

    if-eq p1, v3, :cond_3

    const/16 v3, 0x9b

    if-eq p1, v3, :cond_3

    goto :goto_0

    .line 4041
    :cond_3
    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 4043
    :goto_0
    invoke-virtual {p0, p4}, Lcom/trendmicro/hippo/Parser;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-virtual {p0, p2, v3}, Lcom/trendmicro/hippo/Parser;->simpleAssignment(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 4044
    nop

    .line 4048
    :goto_1
    if-eqz v10, :cond_4

    .line 4050
    const-wide/16 v3, 0x0

    invoke-virtual {p0, v3, v4}, Lcom/trendmicro/hippo/Parser;->createNumber(D)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 4052
    :cond_4
    const/16 v3, 0x16

    invoke-virtual {v0, v3, v2}, Lcom/trendmicro/hippo/ast/Scope;->putProp(ILjava/lang/Object;)V

    .line 4053
    return-object v0

    .line 4018
    .end local v1    # "comma":Lcom/trendmicro/hippo/Node;
    .end local v2    # "destructuringNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "empty":Z
    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->popScope()V

    .line 4019
    throw v1
.end method

.method destructuringObject(Lcom/trendmicro/hippo/ast/ObjectLiteral;ILjava/lang/String;Lcom/trendmicro/hippo/Node;Ljava/util/List;)Z
    .locals 16
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ObjectLiteral;
    .param p2, "variableType"    # I
    .param p3, "tempName"    # Ljava/lang/String;
    .param p4, "parent"    # Lcom/trendmicro/hippo/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/ast/ObjectLiteral;",
            "I",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/Node;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 4103
    .local p5, "destructuringNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    const/4 v4, 0x1

    .line 4104
    .local v4, "empty":Z
    const/16 v5, 0x9b

    if-ne v1, v5, :cond_0

    .line 4105
    const/16 v5, 0x9c

    goto :goto_0

    :cond_0
    const/16 v5, 0x8

    .line 4107
    .local v5, "setOp":I
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->getElements()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trendmicro/hippo/ast/ObjectProperty;

    .line 4108
    .local v7, "prop":Lcom/trendmicro/hippo/ast/ObjectProperty;
    const/4 v8, 0x0

    .line 4112
    .local v8, "lineno":I
    iget-object v9, v0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    if-eqz v9, :cond_1

    .line 4113
    iget v8, v9, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 4115
    :cond_1
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ObjectProperty;->getLeft()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v9

    .line 4116
    .local v9, "id":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v10, 0x0

    .line 4117
    .local v10, "rightElem":Lcom/trendmicro/hippo/Node;
    instance-of v11, v9, Lcom/trendmicro/hippo/ast/Name;

    const/16 v12, 0x21

    if-eqz v11, :cond_2

    .line 4118
    move-object v11, v9

    check-cast v11, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v11}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/trendmicro/hippo/Node;->newString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v11

    .line 4119
    .local v11, "s":Lcom/trendmicro/hippo/Node;
    new-instance v13, Lcom/trendmicro/hippo/Node;

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Parser;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v14

    invoke-direct {v13, v12, v14, v11}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v10, v13

    .line 4120
    .end local v11    # "s":Lcom/trendmicro/hippo/Node;
    goto :goto_2

    :cond_2
    instance-of v11, v9, Lcom/trendmicro/hippo/ast/StringLiteral;

    if-eqz v11, :cond_3

    .line 4121
    move-object v11, v9

    check-cast v11, Lcom/trendmicro/hippo/ast/StringLiteral;

    invoke-virtual {v11}, Lcom/trendmicro/hippo/ast/StringLiteral;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/trendmicro/hippo/Node;->newString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v11

    .line 4122
    .restart local v11    # "s":Lcom/trendmicro/hippo/Node;
    new-instance v13, Lcom/trendmicro/hippo/Node;

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Parser;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v14

    invoke-direct {v13, v12, v14, v11}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v10, v13

    .line 4123
    .end local v11    # "s":Lcom/trendmicro/hippo/Node;
    goto :goto_2

    :cond_3
    instance-of v11, v9, Lcom/trendmicro/hippo/ast/NumberLiteral;

    if-eqz v11, :cond_6

    .line 4124
    move-object v11, v9

    check-cast v11, Lcom/trendmicro/hippo/ast/NumberLiteral;

    invoke-virtual {v11}, Lcom/trendmicro/hippo/ast/NumberLiteral;->getNumber()D

    move-result-wide v11

    double-to-int v11, v11

    int-to-double v11, v11

    invoke-virtual {v0, v11, v12}, Lcom/trendmicro/hippo/Parser;->createNumber(D)Lcom/trendmicro/hippo/Node;

    move-result-object v11

    .line 4125
    .restart local v11    # "s":Lcom/trendmicro/hippo/Node;
    new-instance v12, Lcom/trendmicro/hippo/Node;

    const/16 v13, 0x24

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Parser;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v14

    invoke-direct {v12, v13, v14, v11}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v10, v12

    .line 4126
    .end local v11    # "s":Lcom/trendmicro/hippo/Node;
    nop

    .line 4129
    :goto_2
    invoke-virtual {v10, v8}, Lcom/trendmicro/hippo/Node;->setLineno(I)V

    .line 4130
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ObjectProperty;->getRight()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v11

    .line 4131
    .local v11, "value":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v11}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v12

    const/16 v13, 0x27

    if-ne v12, v13, :cond_5

    .line 4132
    move-object v12, v11

    check-cast v12, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v12}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v12

    .line 4133
    .local v12, "name":Ljava/lang/String;
    new-instance v13, Lcom/trendmicro/hippo/Node;

    const/16 v14, 0x31

    const/4 v15, 0x0

    .line 4134
    invoke-virtual {v0, v14, v12, v15}, Lcom/trendmicro/hippo/Parser;->createName(ILjava/lang/String;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v14

    invoke-direct {v13, v5, v14, v10}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 4133
    invoke-virtual {v3, v13}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 4137
    const/4 v13, -0x1

    if-eq v1, v13, :cond_4

    .line 4138
    const/4 v13, 0x1

    invoke-virtual {v0, v1, v12, v13}, Lcom/trendmicro/hippo/Parser;->defineSymbol(ILjava/lang/String;Z)V

    .line 4139
    move-object/from16 v13, p5

    invoke-interface {v13, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 4137
    :cond_4
    move-object/from16 v13, p5

    .line 4141
    .end local v12    # "name":Ljava/lang/String;
    :goto_3
    goto :goto_4

    .line 4142
    :cond_5
    move-object/from16 v13, p5

    iget-object v12, v0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 4145
    invoke-virtual {v12}, Lcom/trendmicro/hippo/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v12

    .line 4144
    invoke-virtual {v0, v1, v11, v10, v12}, Lcom/trendmicro/hippo/Parser;->destructuringAssignmentHelper(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v12

    .line 4143
    invoke-virtual {v3, v12}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 4147
    :goto_4
    const/4 v4, 0x0

    .line 4148
    .end local v7    # "prop":Lcom/trendmicro/hippo/ast/ObjectProperty;
    .end local v8    # "lineno":I
    .end local v9    # "id":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v10    # "rightElem":Lcom/trendmicro/hippo/Node;
    .end local v11    # "value":Lcom/trendmicro/hippo/ast/AstNode;
    goto/16 :goto_1

    .line 4127
    .restart local v7    # "prop":Lcom/trendmicro/hippo/ast/ObjectProperty;
    .restart local v8    # "lineno":I
    .restart local v9    # "id":Lcom/trendmicro/hippo/ast/AstNode;
    .restart local v10    # "rightElem":Lcom/trendmicro/hippo/Node;
    :cond_6
    move-object/from16 v13, p5

    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6

    .line 4149
    .end local v7    # "prop":Lcom/trendmicro/hippo/ast/ObjectProperty;
    .end local v8    # "lineno":I
    .end local v9    # "id":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v10    # "rightElem":Lcom/trendmicro/hippo/Node;
    :cond_7
    move-object/from16 v13, p5

    return v4
.end method

.method public eof()Z
    .locals 1

    .line 514
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/TokenStream;->eof()Z

    move-result v0

    return v0
.end method

.method public inUseStrictDirective()Z
    .locals 1

    .line 4298
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    return v0
.end method

.method insideFunction()Z
    .locals 1

    .line 518
    iget v0, p0, Lcom/trendmicro/hippo/Parser;->nestingOfFunction:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method lookupMessage(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;

    .line 297
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/Parser;->lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method lookupMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;

    .line 301
    if-nez p2, :cond_0

    .line 302
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 303
    :cond_0
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 301
    :goto_0
    return-object v0
.end method

.method markDestructuring(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 4277
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/DestructuringForm;

    if-eqz v0, :cond_0

    .line 4278
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/DestructuringForm;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/ast/DestructuringForm;->setIsDestructuring(Z)V

    goto :goto_0

    .line 4279
    :cond_0
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;

    if-eqz v0, :cond_1

    .line 4280
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Parser;->markDestructuring(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 4282
    :cond_1
    :goto_0
    return-void
.end method

.method public parse(Ljava/io/Reader;Ljava/lang/String;I)Lcom/trendmicro/hippo/ast/AstRoot;
    .locals 3
    .param p1, "sourceReader"    # Ljava/io/Reader;
    .param p2, "sourceURI"    # Ljava/lang/String;
    .param p3, "lineno"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 610
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->parseFinished:Z

    if-nez v0, :cond_1

    .line 611
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->isIdeMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 612
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Parser;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lcom/trendmicro/hippo/Parser;->parse(Ljava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/ast/AstRoot;

    move-result-object v0

    return-object v0

    .line 615
    :cond_0
    const/4 v0, 0x1

    :try_start_0
    iput-object p2, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    .line 616
    new-instance v1, Lcom/trendmicro/hippo/TokenStream;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2, p3}, Lcom/trendmicro/hippo/TokenStream;-><init>(Lcom/trendmicro/hippo/Parser;Ljava/io/Reader;Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    .line 617
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->parse()Lcom/trendmicro/hippo/ast/AstRoot;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 619
    iput-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->parseFinished:Z

    .line 617
    return-object v1

    .line 619
    :catchall_0
    move-exception v1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->parseFinished:Z

    .line 620
    throw v1

    .line 610
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "parser reused"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public parse(Ljava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/ast/AstRoot;
    .locals 3
    .param p1, "sourceString"    # Ljava/lang/String;
    .param p2, "sourceURI"    # Ljava/lang/String;
    .param p3, "lineno"    # I

    .line 586
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->parseFinished:Z

    if-nez v0, :cond_1

    .line 587
    iput-object p2, p0, Lcom/trendmicro/hippo/Parser;->sourceURI:Ljava/lang/String;

    .line 588
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->isIdeMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 589
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser;->sourceChars:[C

    .line 591
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/TokenStream;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1, p3}, Lcom/trendmicro/hippo/TokenStream;-><init>(Lcom/trendmicro/hippo/Parser;Ljava/io/Reader;Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    .line 593
    const/4 v0, 0x1

    :try_start_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->parse()Lcom/trendmicro/hippo/ast/AstRoot;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 598
    iput-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->parseFinished:Z

    .line 593
    return-object v1

    .line 598
    :catchall_0
    move-exception v1

    goto :goto_0

    .line 594
    :catch_0
    move-exception v1

    .line 596
    .local v1, "iox":Ljava/io/IOException;
    :try_start_1
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    .end local p1    # "sourceString":Ljava/lang/String;
    .end local p2    # "sourceURI":Ljava/lang/String;
    .end local p3    # "lineno":I
    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 598
    .end local v1    # "iox":Ljava/io/IOException;
    .restart local p1    # "sourceString":Ljava/lang/String;
    .restart local p2    # "sourceURI":Ljava/lang/String;
    .restart local p3    # "lineno":I
    :goto_0
    iput-boolean v0, p0, Lcom/trendmicro/hippo/Parser;->parseFinished:Z

    .line 599
    throw v1

    .line 586
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "parser reused"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method popScope()V
    .locals 1

    .line 535
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Scope;->getParentScope()Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 536
    return-void
.end method

.method pushScope(Lcom/trendmicro/hippo/ast/Scope;)V
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/ast/Scope;

    .line 522
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Scope;->getParentScope()Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v0

    .line 525
    .local v0, "parent":Lcom/trendmicro/hippo/ast/Scope;
    if-eqz v0, :cond_0

    .line 526
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    if-eq v0, v1, :cond_1

    .line 527
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_0

    .line 529
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/Scope;->addChildScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 531
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 532
    return-void
.end method

.method protected removeParens(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 4270
    :goto_0
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;

    if-eqz v0, :cond_0

    .line 4271
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object p1

    goto :goto_0

    .line 4273
    :cond_0
    return-object p1
.end method

.method reportError(Ljava/lang/String;)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;

    .line 307
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    return-void
.end method

.method reportError(Ljava/lang/String;II)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "position"    # I
    .param p3, "length"    # I

    .line 321
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;II)V

    .line 322
    return-void
.end method

.method reportError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;

    .line 311
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    if-nez v0, :cond_0

    .line 312
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_0

    .line 314
    :cond_0
    iget v0, v0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v1, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    iget-object v2, p0, Lcom/trendmicro/hippo/Parser;->ts:Lcom/trendmicro/hippo/TokenStream;

    iget v2, v2, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v1, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;II)V

    .line 317
    :goto_0
    return-void
.end method

.method reportError(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 2
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "messageArg"    # Ljava/lang/String;
    .param p3, "position"    # I
    .param p4, "length"    # I

    .line 327
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;Ljava/lang/String;II)V

    .line 329
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->recoverFromErrors()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 332
    return-void

    .line 330
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/Parser$ParserException;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/Parser$ParserException;-><init>(Lcom/trendmicro/hippo/Parser$1;)V

    throw v0
.end method

.method public setDefaultUseStrictDirective(Z)V
    .locals 0
    .param p1, "useStrict"    # Z

    .line 4294
    iput-boolean p1, p0, Lcom/trendmicro/hippo/Parser;->defaultUseStrictDirective:Z

    .line 4295
    return-void
.end method

.method protected setIsGenerator()V
    .locals 1

    .line 3826
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->insideFunction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3827
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    check-cast v0, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->setIsGenerator()V

    .line 3829
    :cond_0
    return-void
.end method

.method protected setRequiresActivation()V
    .locals 1

    .line 3812
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Parser;->insideFunction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3813
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    check-cast v0, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->setRequiresActivation()V

    .line 3815
    :cond_0
    return-void
.end method

.method protected simpleAssignment(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 5
    .param p1, "left"    # Lcom/trendmicro/hippo/Node;
    .param p2, "right"    # Lcom/trendmicro/hippo/Node;

    .line 4207
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    .line 4208
    .local v0, "nodeType":I
    const/16 v1, 0x21

    if-eq v0, v1, :cond_4

    const/16 v2, 0x24

    if-eq v0, v2, :cond_4

    const/16 v1, 0x27

    if-eq v0, v1, :cond_1

    const/16 v1, 0x44

    if-ne v0, v1, :cond_0

    .line 4252
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 4253
    .local v1, "ref":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/Parser;->checkMutableReference(Lcom/trendmicro/hippo/Node;)V

    .line 4254
    new-instance v2, Lcom/trendmicro/hippo/Node;

    const/16 v3, 0x45

    invoke-direct {v2, v3, v1, p2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    return-object v2

    .line 4258
    .end local v1    # "ref":Lcom/trendmicro/hippo/Node;
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 4210
    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    .line 4211
    .local v1, "name":Ljava/lang/String;
    iget-boolean v2, p0, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective:Z

    if-eqz v2, :cond_3

    .line 4212
    const-string v2, "eval"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "arguments"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 4214
    :cond_2
    const-string v2, "msg.bad.id.strict"

    invoke-virtual {p0, v2, v1}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 4216
    :cond_3
    const/16 v2, 0x31

    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 4217
    new-instance v2, Lcom/trendmicro/hippo/Node;

    const/16 v3, 0x8

    invoke-direct {v2, v3, p1, p2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    return-object v2

    .line 4226
    .end local v1    # "name":Ljava/lang/String;
    :cond_4
    instance-of v2, p1, Lcom/trendmicro/hippo/ast/PropertyGet;

    if-eqz v2, :cond_5

    .line 4227
    move-object v2, p1

    check-cast v2, Lcom/trendmicro/hippo/ast/PropertyGet;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/PropertyGet;->getTarget()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 4228
    .local v2, "obj":Lcom/trendmicro/hippo/Node;
    move-object v3, p1

    check-cast v3, Lcom/trendmicro/hippo/ast/PropertyGet;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/PropertyGet;->getProperty()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v3

    .local v3, "id":Lcom/trendmicro/hippo/Node;
    goto :goto_0

    .line 4229
    .end local v2    # "obj":Lcom/trendmicro/hippo/Node;
    .end local v3    # "id":Lcom/trendmicro/hippo/Node;
    :cond_5
    instance-of v2, p1, Lcom/trendmicro/hippo/ast/ElementGet;

    if-eqz v2, :cond_6

    .line 4230
    move-object v2, p1

    check-cast v2, Lcom/trendmicro/hippo/ast/ElementGet;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/ElementGet;->getTarget()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 4231
    .restart local v2    # "obj":Lcom/trendmicro/hippo/Node;
    move-object v3, p1

    check-cast v3, Lcom/trendmicro/hippo/ast/ElementGet;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/ElementGet;->getElement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    .restart local v3    # "id":Lcom/trendmicro/hippo/Node;
    goto :goto_0

    .line 4234
    .end local v2    # "obj":Lcom/trendmicro/hippo/Node;
    .end local v3    # "id":Lcom/trendmicro/hippo/Node;
    :cond_6
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 4235
    .restart local v2    # "obj":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 4238
    .restart local v3    # "id":Lcom/trendmicro/hippo/Node;
    :goto_0
    if-ne v0, v1, :cond_7

    .line 4239
    const/16 v1, 0x23

    .line 4245
    .local v1, "type":I
    const/16 v4, 0x29

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    goto :goto_1

    .line 4247
    .end local v1    # "type":I
    :cond_7
    const/16 v1, 0x25

    .line 4249
    .restart local v1    # "type":I
    :goto_1
    new-instance v4, Lcom/trendmicro/hippo/Node;

    invoke-direct {v4, v1, v2, v3, p2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    return-object v4
.end method
