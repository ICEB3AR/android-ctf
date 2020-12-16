.class public abstract Lcom/trendmicro/hippo/HippoException;
.super Ljava/lang/RuntimeException;
.source "HippoException.java"


# static fields
.field private static final JAVA_STACK_PATTERN:Ljava/util/regex/Pattern;

.field private static final serialVersionUID:J = 0x1a2389d850259671L

.field private static stackStyle:Lcom/trendmicro/hippo/StackStyle;


# instance fields
.field private columnNumber:I

.field interpreterLineData:[I

.field interpreterStackInfo:Ljava/lang/Object;

.field private lineNumber:I

.field private lineSource:Ljava/lang/String;

.field private sourceName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 24
    const-string v0, "_c_(.*)_\\d+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/HippoException;->JAVA_STACK_PATTERN:Ljava/util/regex/Pattern;

    .line 422
    sget-object v0, Lcom/trendmicro/hippo/StackStyle;->HIPPO:Lcom/trendmicro/hippo/StackStyle;

    sput-object v0, Lcom/trendmicro/hippo/HippoException;->stackStyle:Lcom/trendmicro/hippo/StackStyle;

    .line 434
    const-string v0, "hippo.stack.style"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 435
    .local v0, "style":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 436
    const-string v1, "Hippo"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 437
    sget-object v1, Lcom/trendmicro/hippo/StackStyle;->HIPPO:Lcom/trendmicro/hippo/StackStyle;

    sput-object v1, Lcom/trendmicro/hippo/HippoException;->stackStyle:Lcom/trendmicro/hippo/StackStyle;

    goto :goto_0

    .line 438
    :cond_0
    const-string v1, "TrendMicro"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 439
    sget-object v1, Lcom/trendmicro/hippo/StackStyle;->TRENDMICRO:Lcom/trendmicro/hippo/StackStyle;

    sput-object v1, Lcom/trendmicro/hippo/HippoException;->stackStyle:Lcom/trendmicro/hippo/StackStyle;

    goto :goto_0

    .line 440
    :cond_1
    const-string v1, "V8"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 441
    sget-object v1, Lcom/trendmicro/hippo/StackStyle;->V8:Lcom/trendmicro/hippo/StackStyle;

    sput-object v1, Lcom/trendmicro/hippo/HippoException;->stackStyle:Lcom/trendmicro/hippo/StackStyle;

    .line 444
    .end local v0    # "style":Ljava/lang/String;
    :cond_2
    :goto_0
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 28
    invoke-static {}, Lcom/trendmicro/hippo/Context;->createInterpreter()Lcom/trendmicro/hippo/Evaluator;

    move-result-object v0

    .line 29
    .local v0, "e":Lcom/trendmicro/hippo/Evaluator;
    if-eqz v0, :cond_0

    .line 30
    invoke-interface {v0, p0}, Lcom/trendmicro/hippo/Evaluator;->captureStackInfo(Lcom/trendmicro/hippo/HippoException;)V

    .line 31
    :cond_0
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "details"    # Ljava/lang/String;

    .line 35
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 36
    invoke-static {}, Lcom/trendmicro/hippo/Context;->createInterpreter()Lcom/trendmicro/hippo/Evaluator;

    move-result-object v0

    .line 37
    .local v0, "e":Lcom/trendmicro/hippo/Evaluator;
    if-eqz v0, :cond_0

    .line 38
    invoke-interface {v0, p0}, Lcom/trendmicro/hippo/Evaluator;->captureStackInfo(Lcom/trendmicro/hippo/HippoException;)V

    .line 39
    :cond_0
    return-void
.end method

.method static formatStackTrace([Lcom/trendmicro/hippo/ScriptStackElement;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "stack"    # [Lcom/trendmicro/hippo/ScriptStackElement;
    .param p1, "message"    # Ljava/lang/String;

    .line 229
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 230
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "line.separator"

    invoke-static {v1}, Lcom/trendmicro/hippo/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 232
    .local v1, "lineSeparator":Ljava/lang/String;
    sget-object v2, Lcom/trendmicro/hippo/HippoException;->stackStyle:Lcom/trendmicro/hippo/StackStyle;

    sget-object v3, Lcom/trendmicro/hippo/StackStyle;->V8:Lcom/trendmicro/hippo/StackStyle;

    if-ne v2, v3, :cond_0

    const-string v2, "null"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 234
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    :cond_0
    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_4

    aget-object v4, p0, v3

    .line 239
    .local v4, "elem":Lcom/trendmicro/hippo/ScriptStackElement;
    sget-object v5, Lcom/trendmicro/hippo/HippoException$1;->$SwitchMap$com$trendmicro$hippo$StackStyle:[I

    sget-object v6, Lcom/trendmicro/hippo/HippoException;->stackStyle:Lcom/trendmicro/hippo/StackStyle;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/StackStyle;->ordinal()I

    move-result v6

    aget v5, v5, v6

    const/4 v6, 0x1

    if-eq v5, v6, :cond_3

    const/4 v6, 0x2

    if-eq v5, v6, :cond_2

    const/4 v6, 0x3

    if-eq v5, v6, :cond_1

    goto :goto_1

    .line 247
    :cond_1
    invoke-virtual {v4, v0}, Lcom/trendmicro/hippo/ScriptStackElement;->renderJavaStyle(Ljava/lang/StringBuilder;)V

    goto :goto_1

    .line 244
    :cond_2
    invoke-virtual {v4, v0}, Lcom/trendmicro/hippo/ScriptStackElement;->renderV8Style(Ljava/lang/StringBuilder;)V

    .line 245
    goto :goto_1

    .line 241
    :cond_3
    invoke-virtual {v4, v0}, Lcom/trendmicro/hippo/ScriptStackElement;->renderTrendMicroStyle(Ljava/lang/StringBuilder;)V

    .line 242
    nop

    .line 250
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .end local v4    # "elem":Lcom/trendmicro/hippo/ScriptStackElement;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 252
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private generateStackTrace()Ljava/lang/String;
    .locals 4

    .line 185
    new-instance v0, Ljava/io/CharArrayWriter;

    invoke-direct {v0}, Ljava/io/CharArrayWriter;-><init>()V

    .line 186
    .local v0, "writer":Ljava/io/CharArrayWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-super {p0, v1}, Ljava/lang/RuntimeException;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 187
    invoke-virtual {v0}, Ljava/io/CharArrayWriter;->toString()Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "origStackTrace":Ljava/lang/String;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->createInterpreter()Lcom/trendmicro/hippo/Evaluator;

    move-result-object v2

    .line 189
    .local v2, "e":Lcom/trendmicro/hippo/Evaluator;
    if-eqz v2, :cond_0

    .line 190
    invoke-interface {v2, p0, v1}, Lcom/trendmicro/hippo/Evaluator;->getPatchedStack(Lcom/trendmicro/hippo/HippoException;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 191
    :cond_0
    const/4 v3, 0x0

    return-object v3
.end method

.method public static getStackStyle()Lcom/trendmicro/hippo/StackStyle;
    .locals 1

    .line 416
    sget-object v0, Lcom/trendmicro/hippo/HippoException;->stackStyle:Lcom/trendmicro/hippo/StackStyle;

    return-object v0
.end method

.method public static setStackStyle(Lcom/trendmicro/hippo/StackStyle;)V
    .locals 0
    .param p0, "style"    # Lcom/trendmicro/hippo/StackStyle;

    .line 408
    sput-object p0, Lcom/trendmicro/hippo/HippoException;->stackStyle:Lcom/trendmicro/hippo/StackStyle;

    .line 409
    return-void
.end method

.method public static useTrendMicroStackStyle(Z)V
    .locals 1
    .param p0, "flag"    # Z

    .line 397
    if-eqz p0, :cond_0

    sget-object v0, Lcom/trendmicro/hippo/StackStyle;->TRENDMICRO:Lcom/trendmicro/hippo/StackStyle;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/StackStyle;->HIPPO:Lcom/trendmicro/hippo/StackStyle;

    :goto_0
    sput-object v0, Lcom/trendmicro/hippo/HippoException;->stackStyle:Lcom/trendmicro/hippo/StackStyle;

    .line 398
    return-void
.end method

.method public static usesTrendMicroStackStyle()Z
    .locals 2

    .line 382
    sget-object v0, Lcom/trendmicro/hippo/HippoException;->stackStyle:Lcom/trendmicro/hippo/StackStyle;

    sget-object v1, Lcom/trendmicro/hippo/StackStyle;->TRENDMICRO:Lcom/trendmicro/hippo/StackStyle;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public final columnNumber()I
    .locals 1

    .line 119
    iget v0, p0, Lcom/trendmicro/hippo/HippoException;->columnNumber:I

    return v0
.end method

.method public details()Ljava/lang/String;
    .locals 1

    .line 63
    invoke-super {p0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getMessage()Ljava/lang/String;
    .locals 3

    .line 44
    invoke-virtual {p0}, Lcom/trendmicro/hippo/HippoException;->details()Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "details":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/HippoException;->sourceName:Ljava/lang/String;

    if-eqz v1, :cond_3

    iget v1, p0, Lcom/trendmicro/hippo/HippoException;->lineNumber:I

    if-gtz v1, :cond_0

    goto :goto_0

    .line 48
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .local v1, "buf":Ljava/lang/StringBuilder;
    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    iget-object v2, p0, Lcom/trendmicro/hippo/HippoException;->sourceName:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    :cond_1
    iget v2, p0, Lcom/trendmicro/hippo/HippoException;->lineNumber:I

    if-lez v2, :cond_2

    .line 54
    const/16 v2, 0x23

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 55
    iget v2, p0, Lcom/trendmicro/hippo/HippoException;->lineNumber:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    :cond_2
    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 46
    .end local v1    # "buf":Ljava/lang/StringBuilder;
    :cond_3
    :goto_0
    return-object v0
.end method

.method public getScriptStack()[Lcom/trendmicro/hippo/ScriptStackElement;
    .locals 2

    .line 280
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/HippoException;->getScriptStack(ILjava/lang/String;)[Lcom/trendmicro/hippo/ScriptStackElement;

    move-result-object v0

    return-object v0
.end method

.method public getScriptStack(ILjava/lang/String;)[Lcom/trendmicro/hippo/ScriptStackElement;
    .locals 18
    .param p1, "limit"    # I
    .param p2, "hideFunction"    # Ljava/lang/String;

    .line 296
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 297
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ScriptStackElement;>;"
    const/4 v4, 0x0

    .line 298
    .local v4, "interpreterStack":[[Lcom/trendmicro/hippo/ScriptStackElement;
    iget-object v5, v0, Lcom/trendmicro/hippo/HippoException;->interpreterStackInfo:Ljava/lang/Object;

    if-eqz v5, :cond_0

    .line 299
    invoke-static {}, Lcom/trendmicro/hippo/Context;->createInterpreter()Lcom/trendmicro/hippo/Evaluator;

    move-result-object v5

    .line 300
    .local v5, "interpreter":Lcom/trendmicro/hippo/Evaluator;
    instance-of v6, v5, Lcom/trendmicro/hippo/Interpreter;

    if-eqz v6, :cond_0

    .line 301
    move-object v6, v5

    check-cast v6, Lcom/trendmicro/hippo/Interpreter;

    invoke-virtual {v6, v0}, Lcom/trendmicro/hippo/Interpreter;->getScriptStackElements(Lcom/trendmicro/hippo/HippoException;)[[Lcom/trendmicro/hippo/ScriptStackElement;

    move-result-object v4

    .line 304
    .end local v5    # "interpreter":Lcom/trendmicro/hippo/Evaluator;
    :cond_0
    const/4 v5, 0x0

    .line 305
    .local v5, "interpreterStackIndex":I
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/HippoException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v6

    .line 306
    .local v6, "stack":[Ljava/lang/StackTraceElement;
    const/4 v7, 0x0

    .line 307
    .local v7, "count":I
    if-nez v2, :cond_1

    const/4 v10, 0x1

    goto :goto_0

    :cond_1
    const/4 v10, 0x0

    .line 312
    .local v10, "printStarted":Z
    :goto_0
    array-length v11, v6

    const/4 v12, 0x0

    :goto_1
    if-ge v12, v11, :cond_d

    aget-object v13, v6, v12

    .line 313
    .local v13, "e":Ljava/lang/StackTraceElement;
    invoke-virtual {v13}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v14

    .line 314
    .local v14, "fileName":Ljava/lang/String;
    invoke-virtual {v13}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v15

    const-string v8, "_c_"

    invoke-virtual {v15, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 315
    invoke-virtual {v13}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v8

    const/4 v15, -0x1

    if-le v8, v15, :cond_6

    if-eqz v14, :cond_6

    .line 317
    const-string v8, ".java"

    invoke-virtual {v14, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_6

    .line 318
    invoke-virtual {v13}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v8

    .line 319
    .local v8, "methodName":Ljava/lang/String;
    sget-object v15, Lcom/trendmicro/hippo/HippoException;->JAVA_STACK_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v15, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v15

    .line 322
    .local v15, "match":Ljava/util/regex/Matcher;
    const-string v9, "_c_script_0"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    invoke-virtual {v15}, Ljava/util/regex/Matcher;->find()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 323
    const/4 v9, 0x1

    invoke-virtual {v15, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v16

    goto :goto_2

    .line 322
    :cond_2
    const/4 v9, 0x1

    .line 323
    const/16 v16, 0x0

    :goto_2
    move-object/from16 v8, v16

    .line 325
    if-nez v10, :cond_3

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_3

    .line 326
    const/4 v10, 0x1

    goto :goto_3

    .line 327
    :cond_3
    if-eqz v10, :cond_5

    if-ltz v1, :cond_4

    if-ge v7, v1, :cond_5

    .line 328
    :cond_4
    new-instance v9, Lcom/trendmicro/hippo/ScriptStackElement;

    invoke-virtual {v13}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v0

    invoke-direct {v9, v14, v8, v0}, Lcom/trendmicro/hippo/ScriptStackElement;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 329
    add-int/lit8 v7, v7, 0x1

    .line 332
    .end local v8    # "methodName":Ljava/lang/String;
    .end local v15    # "match":Ljava/util/regex/Matcher;
    :cond_5
    :goto_3
    goto :goto_6

    :cond_6
    invoke-virtual {v13}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v8, "com.trendmicro.hippo.Interpreter"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 333
    invoke-virtual {v13}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    const-string v8, "interpretLoop"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    if-eqz v4, :cond_c

    array-length v0, v4

    if-le v0, v5, :cond_c

    .line 337
    add-int/lit8 v0, v5, 0x1

    .end local v5    # "interpreterStackIndex":I
    .local v0, "interpreterStackIndex":I
    aget-object v5, v4, v5

    array-length v8, v5

    const/4 v9, 0x0

    :goto_4
    if-ge v9, v8, :cond_b

    aget-object v15, v5, v9

    .line 338
    .local v15, "elem":Lcom/trendmicro/hippo/ScriptStackElement;
    if-nez v10, :cond_7

    move/from16 v17, v0

    .end local v0    # "interpreterStackIndex":I
    .local v17, "interpreterStackIndex":I
    iget-object v0, v15, Lcom/trendmicro/hippo/ScriptStackElement;->functionName:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 339
    const/4 v0, 0x1

    move v10, v0

    .end local v10    # "printStarted":Z
    .local v0, "printStarted":Z
    goto :goto_5

    .line 338
    .end local v17    # "interpreterStackIndex":I
    .local v0, "interpreterStackIndex":I
    .restart local v10    # "printStarted":Z
    :cond_7
    move/from16 v17, v0

    .line 340
    .end local v0    # "interpreterStackIndex":I
    .restart local v17    # "interpreterStackIndex":I
    :cond_8
    if-eqz v10, :cond_a

    if-ltz v1, :cond_9

    if-ge v7, v1, :cond_a

    .line 341
    :cond_9
    invoke-interface {v3, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 342
    add-int/lit8 v7, v7, 0x1

    .line 337
    .end local v15    # "elem":Lcom/trendmicro/hippo/ScriptStackElement;
    :cond_a
    :goto_5
    add-int/lit8 v9, v9, 0x1

    move/from16 v0, v17

    goto :goto_4

    .end local v17    # "interpreterStackIndex":I
    .restart local v0    # "interpreterStackIndex":I
    :cond_b
    move/from16 v17, v0

    .end local v0    # "interpreterStackIndex":I
    .restart local v17    # "interpreterStackIndex":I
    move/from16 v5, v17

    .line 312
    .end local v13    # "e":Ljava/lang/StackTraceElement;
    .end local v14    # "fileName":Ljava/lang/String;
    .end local v17    # "interpreterStackIndex":I
    .restart local v5    # "interpreterStackIndex":I
    :cond_c
    :goto_6
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    goto/16 :goto_1

    .line 347
    :cond_d
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/trendmicro/hippo/ScriptStackElement;

    invoke-interface {v3, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/trendmicro/hippo/ScriptStackElement;

    return-object v0
.end method

.method public getScriptStackTrace()Ljava/lang/String;
    .locals 2

    .line 204
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/HippoException;->getScriptStackTrace(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getScriptStackTrace(ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "limit"    # I
    .param p2, "functionName"    # Ljava/lang/String;

    .line 223
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/HippoException;->getScriptStack(ILjava/lang/String;)[Lcom/trendmicro/hippo/ScriptStackElement;

    move-result-object v0

    .line 224
    .local v0, "stack":[Lcom/trendmicro/hippo/ScriptStackElement;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/HippoException;->details()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/HippoException;->formatStackTrace([Lcom/trendmicro/hippo/ScriptStackElement;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getScriptStackTrace(Ljava/io/FilenameFilter;)Ljava/lang/String;
    .locals 1
    .param p1, "filter"    # Ljava/io/FilenameFilter;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 267
    invoke-virtual {p0}, Lcom/trendmicro/hippo/HippoException;->getScriptStackTrace()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final initColumnNumber(I)V
    .locals 2
    .param p1, "columnNumber"    # I

    .line 132
    if-lez p1, :cond_1

    .line 133
    iget v0, p0, Lcom/trendmicro/hippo/HippoException;->columnNumber:I

    if-gtz v0, :cond_0

    .line 134
    iput p1, p0, Lcom/trendmicro/hippo/HippoException;->columnNumber:I

    .line 135
    return-void

    .line 133
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 132
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final initLineNumber(I)V
    .locals 2
    .param p1, "lineNumber"    # I

    .line 109
    if-lez p1, :cond_1

    .line 110
    iget v0, p0, Lcom/trendmicro/hippo/HippoException;->lineNumber:I

    if-gtz v0, :cond_0

    .line 111
    iput p1, p0, Lcom/trendmicro/hippo/HippoException;->lineNumber:I

    .line 112
    return-void

    .line 110
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 109
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final initLineSource(Ljava/lang/String;)V
    .locals 1
    .param p1, "lineSource"    # Ljava/lang/String;

    .line 155
    if-eqz p1, :cond_1

    .line 156
    iget-object v0, p0, Lcom/trendmicro/hippo/HippoException;->lineSource:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 157
    iput-object p1, p0, Lcom/trendmicro/hippo/HippoException;->lineSource:Ljava/lang/String;

    .line 158
    return-void

    .line 156
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 155
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public final initSourceName(Ljava/lang/String;)V
    .locals 1
    .param p1, "sourceName"    # Ljava/lang/String;

    .line 85
    if-eqz p1, :cond_1

    .line 86
    iget-object v0, p0, Lcom/trendmicro/hippo/HippoException;->sourceName:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 87
    iput-object p1, p0, Lcom/trendmicro/hippo/HippoException;->sourceName:Ljava/lang/String;

    .line 88
    return-void

    .line 86
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 85
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public final lineNumber()I
    .locals 1

    .line 96
    iget v0, p0, Lcom/trendmicro/hippo/HippoException;->lineNumber:I

    return v0
.end method

.method public final lineSource()Ljava/lang/String;
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/trendmicro/hippo/HippoException;->lineSource:Ljava/lang/String;

    return-object v0
.end method

.method public printStackTrace(Ljava/io/PrintStream;)V
    .locals 1
    .param p1, "s"    # Ljava/io/PrintStream;

    .line 364
    iget-object v0, p0, Lcom/trendmicro/hippo/HippoException;->interpreterStackInfo:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 365
    invoke-super {p0, p1}, Ljava/lang/RuntimeException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0

    .line 367
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/HippoException;->generateStackTrace()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 369
    :goto_0
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "s"    # Ljava/io/PrintWriter;

    .line 354
    iget-object v0, p0, Lcom/trendmicro/hippo/HippoException;->interpreterStackInfo:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 355
    invoke-super {p0, p1}, Ljava/lang/RuntimeException;->printStackTrace(Ljava/io/PrintWriter;)V

    goto :goto_0

    .line 357
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/HippoException;->generateStackTrace()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 359
    :goto_0
    return-void
.end method

.method final recordErrorOrigin(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 1
    .param p1, "sourceName"    # Ljava/lang/String;
    .param p2, "lineNumber"    # I
    .param p3, "lineSource"    # Ljava/lang/String;
    .param p4, "columnNumber"    # I

    .line 164
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 165
    const/4 p2, 0x0

    .line 168
    :cond_0
    if-eqz p1, :cond_1

    .line 169
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/HippoException;->initSourceName(Ljava/lang/String;)V

    .line 171
    :cond_1
    if-eqz p2, :cond_2

    .line 172
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/HippoException;->initLineNumber(I)V

    .line 174
    :cond_2
    if-eqz p3, :cond_3

    .line 175
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/HippoException;->initLineSource(Ljava/lang/String;)V

    .line 177
    :cond_3
    if-eqz p4, :cond_4

    .line 178
    invoke-virtual {p0, p4}, Lcom/trendmicro/hippo/HippoException;->initColumnNumber(I)V

    .line 180
    :cond_4
    return-void
.end method

.method public final sourceName()Ljava/lang/String;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/trendmicro/hippo/HippoException;->sourceName:Ljava/lang/String;

    return-object v0
.end method
