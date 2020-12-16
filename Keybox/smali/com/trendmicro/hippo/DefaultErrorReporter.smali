.class Lcom/trendmicro/hippo/DefaultErrorReporter;
.super Ljava/lang/Object;
.source "DefaultErrorReporter.java"

# interfaces
.implements Lcom/trendmicro/hippo/ErrorReporter;


# static fields
.field static final instance:Lcom/trendmicro/hippo/DefaultErrorReporter;


# instance fields
.field private chainedReporter:Lcom/trendmicro/hippo/ErrorReporter;

.field private forEval:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 16
    new-instance v0, Lcom/trendmicro/hippo/DefaultErrorReporter;

    invoke-direct {v0}, Lcom/trendmicro/hippo/DefaultErrorReporter;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/DefaultErrorReporter;->instance:Lcom/trendmicro/hippo/DefaultErrorReporter;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static forEval(Lcom/trendmicro/hippo/ErrorReporter;)Lcom/trendmicro/hippo/ErrorReporter;
    .locals 2
    .param p0, "reporter"    # Lcom/trendmicro/hippo/ErrorReporter;

    .line 25
    new-instance v0, Lcom/trendmicro/hippo/DefaultErrorReporter;

    invoke-direct {v0}, Lcom/trendmicro/hippo/DefaultErrorReporter;-><init>()V

    .line 26
    .local v0, "r":Lcom/trendmicro/hippo/DefaultErrorReporter;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/trendmicro/hippo/DefaultErrorReporter;->forEval:Z

    .line 27
    iput-object p0, v0, Lcom/trendmicro/hippo/DefaultErrorReporter;->chainedReporter:Lcom/trendmicro/hippo/ErrorReporter;

    .line 28
    return-object v0
.end method


# virtual methods
.method public error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V
    .locals 12
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceURI"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineText"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I

    .line 47
    move-object v0, p0

    move-object v7, p1

    iget-boolean v1, v0, Lcom/trendmicro/hippo/DefaultErrorReporter;->forEval:Z

    if-eqz v1, :cond_1

    .line 51
    const-string v1, "SyntaxError"

    .line 52
    .local v1, "error":Ljava/lang/String;
    const-string v2, "TypeError"

    .line 53
    .local v2, "TYPE_ERROR_NAME":Ljava/lang/String;
    const-string v3, ": "

    .line 54
    .local v3, "DELIMETER":Ljava/lang/String;
    const-string v4, "TypeError: "

    .line 55
    .local v4, "prefix":Ljava/lang/String;
    const-string v5, "TypeError: "

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 56
    const-string v1, "TypeError"

    .line 57
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .end local p1    # "message":Ljava/lang/String;
    .local v5, "message":Ljava/lang/String;
    goto :goto_0

    .line 55
    .end local v5    # "message":Ljava/lang/String;
    .restart local p1    # "message":Ljava/lang/String;
    :cond_0
    move-object v5, v7

    .line 59
    .end local p1    # "message":Ljava/lang/String;
    .restart local v5    # "message":Ljava/lang/String;
    :goto_0
    move-object v6, v1

    move-object v7, v5

    move-object v8, p2

    move v9, p3

    move-object/from16 v10, p4

    move/from16 v11, p5

    invoke-static/range {v6 .. v11}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v6

    throw v6

    .line 62
    .end local v1    # "error":Ljava/lang/String;
    .end local v2    # "TYPE_ERROR_NAME":Ljava/lang/String;
    .end local v3    # "DELIMETER":Ljava/lang/String;
    .end local v4    # "prefix":Ljava/lang/String;
    .end local v5    # "message":Ljava/lang/String;
    .restart local p1    # "message":Ljava/lang/String;
    :cond_1
    iget-object v1, v0, Lcom/trendmicro/hippo/DefaultErrorReporter;->chainedReporter:Lcom/trendmicro/hippo/ErrorReporter;

    if-eqz v1, :cond_2

    .line 63
    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object/from16 v5, p4

    move/from16 v6, p5

    invoke-interface/range {v1 .. v6}, Lcom/trendmicro/hippo/ErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 69
    return-void

    .line 66
    :cond_2
    invoke-virtual/range {p0 .. p5}, Lcom/trendmicro/hippo/DefaultErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1
.end method

.method public runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;
    .locals 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceURI"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineText"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I

    .line 76
    iget-object v0, p0, Lcom/trendmicro/hippo/DefaultErrorReporter;->chainedReporter:Lcom/trendmicro/hippo/ErrorReporter;

    if-eqz v0, :cond_0

    .line 77
    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/trendmicro/hippo/ErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    return-object v0

    .line 79
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/EvaluatorException;

    move-object v1, v0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v1 .. v6}, Lcom/trendmicro/hippo/EvaluatorException;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    return-object v0
.end method

.method public warning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V
    .locals 6
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceURI"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineText"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I

    .line 35
    iget-object v0, p0, Lcom/trendmicro/hippo/DefaultErrorReporter;->chainedReporter:Lcom/trendmicro/hippo/ErrorReporter;

    if-eqz v0, :cond_0

    .line 36
    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/trendmicro/hippo/ErrorReporter;->warning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 41
    :cond_0
    return-void
.end method
