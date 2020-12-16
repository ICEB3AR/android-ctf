.class public Lcom/trendmicro/hippo/tools/jsc/Main;
.super Ljava/lang/Object;
.source "Main.java"


# instance fields
.field private characterEncoding:Ljava/lang/String;

.field private compiler:Lcom/trendmicro/hippo/optimizer/ClassCompiler;

.field private compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

.field private destinationDir:Ljava/lang/String;

.field private printHelp:Z

.field private reporter:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

.field private targetName:Ljava/lang/String;

.field private targetPackage:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;-><init>(Z)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->reporter:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    .line 52
    new-instance v0, Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-direct {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 53
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->reporter:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->setErrorReporter(Lcom/trendmicro/hippo/ErrorReporter;)V

    .line 54
    new-instance v0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/optimizer/ClassCompiler;-><init>(Lcom/trendmicro/hippo/CompilerEnvirons;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compiler:Lcom/trendmicro/hippo/optimizer/ClassCompiler;

    .line 55
    return-void
.end method

.method private addError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/String;

    .line 347
    if-nez p2, :cond_0

    .line 348
    invoke-static {p1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, "msg":Ljava/lang/String;
    goto :goto_0

    .line 350
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 352
    .restart local v0    # "msg":Ljava/lang/String;
    :goto_0
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/tools/jsc/Main;->addFormatedError(Ljava/lang/String;)V

    .line 353
    return-void
.end method

.method private addFormatedError(Ljava/lang/String;)V
    .locals 6
    .param p1, "message"    # Ljava/lang/String;

    .line 357
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->reporter:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v4, 0x0

    const/4 v5, -0x1

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 358
    return-void
.end method

.method private static badUsage(Ljava/lang/String;)V
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .line 218
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-class v1, Lcom/trendmicro/hippo/tools/jsc/Main;

    .line 219
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 218
    const-string v2, "msg.jsc.bad.usage"

    invoke-static {v2, v1, p0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 220
    return-void
.end method

.method private getOutputFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 5
    .param p1, "parentDir"    # Ljava/io/File;
    .param p2, "className"    # Ljava/lang/String;

    .line 302
    sget-char v0, Ljava/io/File;->separatorChar:C

    const/16 v1, 0x2e

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 303
    .local v0, "path":Ljava/lang/String;
    const-string v1, ".class"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 304
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 305
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    .line 306
    .local v2, "dirPath":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 307
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 308
    .local v3, "dir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 309
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 312
    .end local v3    # "dir":Ljava/io/File;
    :cond_0
    return-object v1
.end method

.method public static main([Ljava/lang/String;)V
    .locals 4
    .param p0, "args"    # [Ljava/lang/String;

    .line 34
    new-instance v0, Lcom/trendmicro/hippo/tools/jsc/Main;

    invoke-direct {v0}, Lcom/trendmicro/hippo/tools/jsc/Main;-><init>()V

    .line 35
    .local v0, "main":Lcom/trendmicro/hippo/tools/jsc/Main;
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/tools/jsc/Main;->processOptions([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    iget-boolean v1, v0, Lcom/trendmicro/hippo/tools/jsc/Main;->printHelp:Z

    if-eqz v1, :cond_0

    .line 38
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-class v2, Lcom/trendmicro/hippo/tools/jsc/Main;

    .line 39
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 38
    const-string v3, "msg.jsc.usage"

    invoke-static {v3, v2}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 40
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 42
    :cond_0
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 44
    :cond_1
    iget-object v1, v0, Lcom/trendmicro/hippo/tools/jsc/Main;->reporter:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->hasReportedError()Z

    move-result v1

    if-nez v1, :cond_2

    .line 45
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/tools/jsc/Main;->processSource([Ljava/lang/String;)V

    .line 47
    :cond_2
    return-void
.end method

.method private static p(Ljava/lang/String;)V
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .line 341
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 342
    return-void
.end method

.method private readSource(Ljava/io/File;)Ljava/lang/String;
    .locals 4
    .param p1, "f"    # Ljava/io/File;

    .line 284
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 285
    .local v0, "absPath":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 286
    const-string v1, "msg.jsfile.not.found"

    invoke-direct {p0, v1, v0}, Lcom/trendmicro/hippo/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    return-object v2

    .line 290
    :cond_0
    const/4 v1, 0x1

    :try_start_0
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->characterEncoding:Ljava/lang/String;

    invoke-static {v0, v1, v3}, Lcom/trendmicro/hippo/tools/SourceReader;->readFileOrUrl(Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 294
    :catch_0
    move-exception v1

    .line 295
    .local v1, "ioe":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/tools/jsc/Main;->addFormatedError(Ljava/lang/String;)V

    goto :goto_0

    .line 292
    .end local v1    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 293
    .local v1, "ex":Ljava/io/FileNotFoundException;
    const-string v3, "msg.couldnt.open"

    invoke-direct {p0, v3, v0}, Lcom/trendmicro/hippo/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    .end local v1    # "ex":Ljava/io/FileNotFoundException;
    nop

    .line 297
    :goto_0
    return-object v2
.end method


# virtual methods
.method getClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;

    .line 322
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [C

    .line 324
    .local v0, "s":[C
    const/4 v1, 0x0

    .line 326
    .local v1, "j":I
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v2

    const/16 v3, 0x5f

    if-nez v2, :cond_0

    .line 327
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "j":I
    .local v2, "j":I
    aput-char v3, v0, v1

    move v1, v2

    .line 329
    .end local v2    # "j":I
    .restart local v1    # "j":I
    :cond_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_2

    .line 330
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 331
    .local v4, "c":C
    invoke-static {v4}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 332
    aput-char v4, v0, v1

    goto :goto_1

    .line 334
    :cond_1
    aput-char v3, v0, v1

    .line 329
    :goto_1
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 337
    .end local v2    # "i":I
    .end local v4    # "c":C
    :cond_2
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public processOptions([Ljava/lang/String;)[Ljava/lang/String;
    .locals 11
    .param p1, "args"    # [Ljava/lang/String;

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->targetPackage:Ljava/lang/String;

    .line 64
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->setGenerateDebugInfo(Z)V

    .line 65
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    const/4 v3, 0x0

    if-ge v0, v2, :cond_1e

    .line 66
    aget-object v2, p1, v0

    .line 67
    .local v2, "arg":Ljava/lang/String;
    const-string v4, "-"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x1

    if-nez v4, :cond_2

    .line 68
    array-length v1, p1

    sub-int/2addr v1, v0

    .line 69
    .local v1, "tail":I
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->targetName:Ljava/lang/String;

    if-eqz v4, :cond_0

    if-le v1, v5, :cond_0

    .line 70
    const-string v5, "msg.multiple.js.to.file"

    invoke-direct {p0, v5, v4}, Lcom/trendmicro/hippo/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    return-object v3

    .line 73
    :cond_0
    new-array v3, v1, [Ljava/lang/String;

    .line 74
    .local v3, "result":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1
    if-eq v4, v1, :cond_1

    .line 75
    add-int v5, v0, v4

    aget-object v5, p1, v5

    aput-object v5, v3, v4

    .line 74
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 77
    .end local v4    # "j":I
    :cond_1
    return-object v3

    .line 79
    .end local v1    # "tail":I
    .end local v3    # "result":[Ljava/lang/String;
    :cond_2
    const-string v4, "-help"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1d

    const-string v4, "-h"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1d

    .line 80
    const-string v4, "--help"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    goto/16 :goto_a

    .line 87
    :cond_3
    :try_start_0
    const-string v4, "-version"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    add-int/lit8 v0, v0, 0x1

    array-length v4, p1

    if-ge v0, v4, :cond_4

    .line 88
    aget-object v4, p1, v0

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 89
    .local v4, "version":I
    iget-object v6, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v6, v4}, Lcom/trendmicro/hippo/CompilerEnvirons;->setLanguageVersion(I)V

    .line 90
    goto/16 :goto_9

    .line 92
    .end local v4    # "version":I
    :cond_4
    const-string v4, "-opt"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    const-string v4, "-O"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    :cond_5
    add-int/lit8 v0, v0, 0x1

    array-length v4, p1

    if-ge v0, v4, :cond_6

    .line 95
    aget-object v4, p1, v0

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 96
    .local v4, "optLevel":I
    iget-object v6, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v6, v4}, Lcom/trendmicro/hippo/CompilerEnvirons;->setOptimizationLevel(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_2

    .line 97
    goto/16 :goto_9

    .line 103
    .end local v4    # "optLevel":I
    :cond_6
    nop

    .line 104
    const-string v4, "-nosource"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 105
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->setGeneratingSource(Z)V

    .line 106
    goto/16 :goto_9

    .line 108
    :cond_7
    const-string v4, "-debug"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1c

    const-string v4, "-g"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    goto/16 :goto_8

    .line 112
    :cond_8
    const-string v4, "-main-method-class"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    add-int/lit8 v0, v0, 0x1

    array-length v4, p1

    if-ge v0, v4, :cond_9

    .line 113
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compiler:Lcom/trendmicro/hippo/optimizer/ClassCompiler;

    aget-object v4, p1, v0

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->setMainMethodClass(Ljava/lang/String;)V

    .line 114
    goto/16 :goto_9

    .line 116
    :cond_9
    const-string v4, "-encoding"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    add-int/lit8 v0, v0, 0x1

    array-length v4, p1

    if-ge v0, v4, :cond_a

    .line 117
    aget-object v3, p1, v0

    iput-object v3, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->characterEncoding:Ljava/lang/String;

    .line 118
    goto/16 :goto_9

    .line 120
    :cond_a
    const-string v4, "-o"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/16 v6, 0x2e

    if-eqz v4, :cond_10

    add-int/lit8 v0, v0, 0x1

    array-length v4, p1

    if-ge v0, v4, :cond_10

    .line 121
    aget-object v3, p1, v0

    .line 122
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    .line 123
    .local v4, "end":I
    const-string v7, "msg.invalid.classfile.name"

    if-eqz v4, :cond_f

    .line 124
    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v8

    if-nez v8, :cond_b

    goto :goto_4

    .line 129
    :cond_b
    const/4 v8, 0x1

    .local v8, "j":I
    :goto_2
    if-ge v8, v4, :cond_e

    .line 130
    invoke-virtual {v3, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 131
    .local v9, "c":C
    invoke-static {v9}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v10

    if-nez v10, :cond_d

    .line 132
    if-ne v9, v6, :cond_c

    .line 134
    add-int/lit8 v6, v4, -0x6

    if-ne v8, v6, :cond_c

    const-string v6, ".class"

    invoke-virtual {v3, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 135
    invoke-virtual {v3, v1, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 136
    goto :goto_3

    .line 139
    :cond_c
    invoke-direct {p0, v7, v3}, Lcom/trendmicro/hippo/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    goto :goto_3

    .line 129
    .end local v9    # "c":C
    :cond_d
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 143
    .end local v8    # "j":I
    :cond_e
    :goto_3
    iput-object v3, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->targetName:Ljava/lang/String;

    .line 144
    goto/16 :goto_9

    .line 126
    :cond_f
    :goto_4
    invoke-direct {p0, v7, v3}, Lcom/trendmicro/hippo/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    goto/16 :goto_9

    .line 146
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "end":I
    :cond_10
    const-string v4, "-observe-instruction-count"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 147
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/CompilerEnvirons;->setGenerateObserverCount(Z)V

    .line 149
    :cond_11
    const-string v4, "-package"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_17

    add-int/lit8 v0, v0, 0x1

    array-length v4, p1

    if-ge v0, v4, :cond_17

    .line 150
    aget-object v4, p1, v0

    .line 151
    .local v4, "pkg":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    .line 152
    .local v7, "end":I
    const/4 v8, 0x0

    .restart local v8    # "j":I
    :goto_5
    if-eq v8, v7, :cond_16

    .line 153
    invoke-virtual {v4, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 154
    .restart local v9    # "c":C
    invoke-static {v9}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v10

    if-eqz v10, :cond_15

    .line 155
    :cond_12
    add-int/lit8 v8, v8, 0x1

    if-eq v8, v7, :cond_13

    .line 156
    invoke-virtual {v4, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 157
    invoke-static {v9}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v10

    if-nez v10, :cond_12

    .line 161
    :cond_13
    if-ne v8, v7, :cond_14

    .line 162
    goto :goto_6

    .line 164
    :cond_14
    if-ne v9, v6, :cond_15

    add-int/lit8 v10, v7, -0x1

    if-eq v8, v10, :cond_15

    .line 165
    nop

    .line 152
    .end local v9    # "c":C
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 168
    .restart local v9    # "c":C
    :cond_15
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->targetPackage:Ljava/lang/String;

    const-string v5, "msg.package.name"

    invoke-direct {p0, v5, v1}, Lcom/trendmicro/hippo/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    return-object v3

    .line 171
    .end local v8    # "j":I
    .end local v9    # "c":C
    :cond_16
    :goto_6
    iput-object v4, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->targetPackage:Ljava/lang/String;

    .line 172
    goto/16 :goto_9

    .line 174
    .end local v4    # "pkg":Ljava/lang/String;
    .end local v7    # "end":I
    :cond_17
    const-string v4, "-extends"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_18

    add-int/lit8 v0, v0, 0x1

    array-length v4, p1

    if-ge v0, v4, :cond_18

    .line 175
    aget-object v3, p1, v0

    .line 178
    .local v3, "targetExtends":Ljava/lang/String;
    :try_start_1
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 181
    .local v4, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    nop

    .line 182
    iget-object v6, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compiler:Lcom/trendmicro/hippo/optimizer/ClassCompiler;

    invoke-virtual {v6, v4}, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->setTargetExtends(Ljava/lang/Class;)V

    .line 183
    goto/16 :goto_9

    .line 179
    .end local v4    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v1

    .line 180
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    new-instance v4, Ljava/lang/Error;

    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v4

    .line 185
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    .end local v3    # "targetExtends":Ljava/lang/String;
    :cond_18
    const-string v4, "-implements"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a

    add-int/lit8 v0, v0, 0x1

    array-length v4, p1

    if-ge v0, v4, :cond_1a

    .line 187
    aget-object v3, p1, v0

    .line 188
    .local v3, "targetImplements":Ljava/lang/String;
    new-instance v4, Ljava/util/StringTokenizer;

    const-string v6, ","

    invoke-direct {v4, v3, v6}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .local v4, "st":Ljava/util/StringTokenizer;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 191
    .local v6, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    :goto_7
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v7

    if-eqz v7, :cond_19

    .line 192
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v7

    .line 194
    .local v7, "className":Ljava/lang/String;
    :try_start_2
    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    .line 197
    nop

    .line 198
    .end local v7    # "className":Ljava/lang/String;
    goto :goto_7

    .line 195
    .restart local v7    # "className":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 196
    .restart local v1    # "e":Ljava/lang/ClassNotFoundException;
    new-instance v5, Ljava/lang/Error;

    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v5

    .line 199
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    .end local v7    # "className":Ljava/lang/String;
    :cond_19
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/Class;

    invoke-interface {v6, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/Class;

    .line 200
    .local v7, "implementsClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    iget-object v8, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compiler:Lcom/trendmicro/hippo/optimizer/ClassCompiler;

    invoke-virtual {v8, v7}, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->setTargetImplements([Ljava/lang/Class;)V

    .line 201
    goto :goto_9

    .line 203
    .end local v3    # "targetImplements":Ljava/lang/String;
    .end local v4    # "st":Ljava/util/StringTokenizer;
    .end local v6    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    .end local v7    # "implementsClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_1a
    const-string v4, "-d"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    add-int/lit8 v0, v0, 0x1

    array-length v4, p1

    if-ge v0, v4, :cond_1b

    .line 204
    aget-object v3, p1, v0

    iput-object v3, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->destinationDir:Ljava/lang/String;

    .line 205
    goto :goto_9

    .line 207
    :cond_1b
    invoke-static {v2}, Lcom/trendmicro/hippo/tools/jsc/Main;->badUsage(Ljava/lang/String;)V

    .line 208
    return-object v3

    .line 109
    :cond_1c
    :goto_8
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/CompilerEnvirons;->setGenerateDebugInfo(Z)V

    .line 110
    nop

    .line 65
    .end local v2    # "arg":Ljava/lang/String;
    :goto_9
    add-int/2addr v0, v5

    goto/16 :goto_0

    .line 100
    .restart local v2    # "arg":Ljava/lang/String;
    :catch_2
    move-exception v1

    .line 101
    .local v1, "e":Ljava/lang/NumberFormatException;
    aget-object v4, p1, v0

    invoke-static {v4}, Lcom/trendmicro/hippo/tools/jsc/Main;->badUsage(Ljava/lang/String;)V

    .line 102
    return-object v3

    .line 82
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_1d
    :goto_a
    iput-boolean v5, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->printHelp:Z

    .line 83
    return-object v3

    .line 211
    .end local v0    # "i":I
    .end local v2    # "arg":Ljava/lang/String;
    :cond_1e
    const-string v0, "msg.no.file"

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/jsc/Main;->p(Ljava/lang/String;)V

    .line 212
    return-object v3
.end method

.method public processSource([Ljava/lang/String;)V
    .locals 13
    .param p1, "filenames"    # [Ljava/lang/String;

    .line 228
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-eq v0, v1, :cond_9

    .line 229
    aget-object v1, p1, v0

    .line 230
    .local v1, "filename":Ljava/lang/String;
    const-string v2, ".js"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 231
    const-string v2, "msg.extension.not.js"

    invoke-direct {p0, v2, v1}, Lcom/trendmicro/hippo/tools/jsc/Main;->addError(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    return-void

    .line 234
    :cond_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 235
    .local v2, "f":Ljava/io/File;
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/tools/jsc/Main;->readSource(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    .line 236
    .local v3, "source":Ljava/lang/String;
    if-nez v3, :cond_1

    return-void

    .line 238
    :cond_1
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->targetName:Ljava/lang/String;

    .line 239
    .local v4, "mainClassName":Ljava/lang/String;
    if-nez v4, :cond_2

    .line 240
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    .line 241
    .local v5, "name":Ljava/lang/String;
    const/4 v6, 0x0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x3

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 242
    .local v6, "nojs":Ljava/lang/String;
    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/tools/jsc/Main;->getClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 244
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "nojs":Ljava/lang/String;
    :cond_2
    iget-object v5, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->targetPackage:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_3

    .line 245
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->targetPackage:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 248
    :cond_3
    iget-object v5, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->compiler:Lcom/trendmicro/hippo/optimizer/ClassCompiler;

    .line 249
    const/4 v6, 0x1

    invoke-virtual {v5, v3, v1, v6, v4}, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->compileToClassFiles(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)[Ljava/lang/Object;

    move-result-object v5

    .line 251
    .local v5, "compiled":[Ljava/lang/Object;
    if-eqz v5, :cond_8

    array-length v6, v5

    if-nez v6, :cond_4

    goto :goto_4

    .line 255
    :cond_4
    const/4 v6, 0x0

    .line 256
    .local v6, "targetTopDir":Ljava/io/File;
    iget-object v7, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->destinationDir:Ljava/lang/String;

    if-eqz v7, :cond_5

    .line 257
    new-instance v7, Ljava/io/File;

    iget-object v8, p0, Lcom/trendmicro/hippo/tools/jsc/Main;->destinationDir:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v6, v7

    goto :goto_1

    .line 259
    :cond_5
    invoke-virtual {v2}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v7

    .line 260
    .local v7, "parent":Ljava/lang/String;
    if-eqz v7, :cond_6

    .line 261
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v6, v8

    .line 264
    .end local v7    # "parent":Ljava/lang/String;
    :cond_6
    :goto_1
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_2
    array-length v8, v5

    if-eq v7, v8, :cond_7

    .line 265
    aget-object v8, v5, v7

    check-cast v8, Ljava/lang/String;

    .line 266
    .local v8, "className":Ljava/lang/String;
    add-int/lit8 v9, v7, 0x1

    aget-object v9, v5, v9

    check-cast v9, [B

    .line 267
    .local v9, "bytes":[B
    invoke-direct {p0, v6, v8}, Lcom/trendmicro/hippo/tools/jsc/Main;->getOutputFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    .line 269
    .local v10, "outfile":Ljava/io/File;
    :try_start_0
    new-instance v11, Ljava/io/FileOutputStream;

    invoke-direct {v11, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 271
    .local v11, "os":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-virtual {v11, v9}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 273
    :try_start_2
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V

    .line 274
    nop

    .line 277
    .end local v11    # "os":Ljava/io/FileOutputStream;
    goto :goto_3

    .line 273
    .restart local v11    # "os":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v12

    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V

    .line 274
    nop

    .end local v0    # "i":I
    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "source":Ljava/lang/String;
    .end local v4    # "mainClassName":Ljava/lang/String;
    .end local v5    # "compiled":[Ljava/lang/Object;
    .end local v6    # "targetTopDir":Ljava/io/File;
    .end local v7    # "j":I
    .end local v8    # "className":Ljava/lang/String;
    .end local v9    # "bytes":[B
    .end local v10    # "outfile":Ljava/io/File;
    .end local p1    # "filenames":[Ljava/lang/String;
    throw v12
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 275
    .end local v11    # "os":Ljava/io/FileOutputStream;
    .restart local v0    # "i":I
    .restart local v1    # "filename":Ljava/lang/String;
    .restart local v2    # "f":Ljava/io/File;
    .restart local v3    # "source":Ljava/lang/String;
    .restart local v4    # "mainClassName":Ljava/lang/String;
    .restart local v5    # "compiled":[Ljava/lang/Object;
    .restart local v6    # "targetTopDir":Ljava/io/File;
    .restart local v7    # "j":I
    .restart local v8    # "className":Ljava/lang/String;
    .restart local v9    # "bytes":[B
    .restart local v10    # "outfile":Ljava/io/File;
    .restart local p1    # "filenames":[Ljava/lang/String;
    :catch_0
    move-exception v11

    .line 276
    .local v11, "ioe":Ljava/io/IOException;
    invoke-virtual {v11}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {p0, v12}, Lcom/trendmicro/hippo/tools/jsc/Main;->addFormatedError(Ljava/lang/String;)V

    .line 264
    .end local v8    # "className":Ljava/lang/String;
    .end local v9    # "bytes":[B
    .end local v10    # "outfile":Ljava/io/File;
    .end local v11    # "ioe":Ljava/io/IOException;
    :goto_3
    add-int/lit8 v7, v7, 0x2

    goto :goto_2

    .line 228
    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "source":Ljava/lang/String;
    .end local v4    # "mainClassName":Ljava/lang/String;
    .end local v5    # "compiled":[Ljava/lang/Object;
    .end local v6    # "targetTopDir":Ljava/io/File;
    .end local v7    # "j":I
    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 252
    .restart local v1    # "filename":Ljava/lang/String;
    .restart local v2    # "f":Ljava/io/File;
    .restart local v3    # "source":Ljava/lang/String;
    .restart local v4    # "mainClassName":Ljava/lang/String;
    .restart local v5    # "compiled":[Ljava/lang/Object;
    :cond_8
    :goto_4
    return-void

    .line 280
    .end local v0    # "i":I
    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "source":Ljava/lang/String;
    .end local v4    # "mainClassName":Ljava/lang/String;
    .end local v5    # "compiled":[Ljava/lang/Object;
    :cond_9
    return-void
.end method
