.class public Lcom/trendmicro/hippo/tools/ToolErrorReporter;
.super Ljava/lang/Object;
.source "ToolErrorReporter.java"

# interfaces
.implements Lcom/trendmicro/hippo/ErrorReporter;


# static fields
.field private static final messagePrefix:Ljava/lang/String; = "js: "


# instance fields
.field private err:Ljava/io/PrintStream;

.field private hasReportedErrorFlag:Z

.field private reportWarnings:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 1
    .param p1, "reportWarnings"    # Z

    .line 31
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;-><init>(ZLjava/io/PrintStream;)V

    .line 32
    return-void
.end method

.method public constructor <init>(ZLjava/io/PrintStream;)V
    .locals 0
    .param p1, "reportWarnings"    # Z
    .param p2, "err"    # Ljava/io/PrintStream;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportWarnings:Z

    .line 36
    iput-object p2, p0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->err:Ljava/io/PrintStream;

    .line 37
    return-void
.end method

.method private buildIndicator(I)Ljava/lang/String;
    .locals 3
    .param p1, "offset"    # I

    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 190
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    add-int/lit8 v2, p1, -0x1

    if-ge v1, v2, :cond_0

    .line 191
    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 192
    .end local v1    # "i":I
    :cond_0
    const-string v1, "^"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getExceptionMessage(Lcom/trendmicro/hippo/HippoException;)Ljava/lang/String;
    .locals 2
    .param p0, "ex"    # Lcom/trendmicro/hippo/HippoException;

    .line 86
    instance-of v0, p0, Lcom/trendmicro/hippo/JavaScriptException;

    if-eqz v0, :cond_0

    .line 87
    invoke-virtual {p0}, Lcom/trendmicro/hippo/HippoException;->details()Ljava/lang/String;

    move-result-object v0

    const-string v1, "msg.uncaughtJSException"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, "msg":Ljava/lang/String;
    goto :goto_0

    .line 88
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    instance-of v0, p0, Lcom/trendmicro/hippo/EcmaError;

    if-eqz v0, :cond_1

    .line 89
    invoke-virtual {p0}, Lcom/trendmicro/hippo/HippoException;->details()Ljava/lang/String;

    move-result-object v0

    const-string v1, "msg.uncaughtEcmaError"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "msg":Ljava/lang/String;
    goto :goto_0

    .line 90
    .end local v0    # "msg":Ljava/lang/String;
    :cond_1
    instance-of v0, p0, Lcom/trendmicro/hippo/EvaluatorException;

    if-eqz v0, :cond_2

    .line 91
    invoke-virtual {p0}, Lcom/trendmicro/hippo/HippoException;->details()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "msg":Ljava/lang/String;
    goto :goto_0

    .line 93
    .end local v0    # "msg":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/HippoException;->toString()Ljava/lang/String;

    move-result-object v0

    .line 95
    .restart local v0    # "msg":Ljava/lang/String;
    :goto_0
    return-object v0
.end method

.method public static getMessage(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "messageId"    # Ljava/lang/String;

    .line 45
    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;

    .line 55
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    .line 56
    .local v0, "args":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "argument"    # Ljava/lang/String;

    .line 49
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 50
    .local v0, "args":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 7
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .line 60
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 61
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getLocale()Ljava/util/Locale;

    move-result-object v1

    .line 64
    .local v1, "locale":Ljava/util/Locale;
    :goto_0
    nop

    .line 65
    const-string v2, "com.trendmicro.hippo.tools.resources.Messages"

    invoke-static {v2, v1}, Ljava/util/ResourceBundle;->getBundle(Ljava/lang/String;Ljava/util/Locale;)Ljava/util/ResourceBundle;

    move-result-object v2

    .line 69
    .local v2, "rb":Ljava/util/ResourceBundle;
    :try_start_0
    invoke-virtual {v2, p0}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Ljava/util/MissingResourceException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .local v3, "formatString":Ljava/lang/String;
    nop

    .line 75
    if-nez p1, :cond_1

    .line 76
    return-object v3

    .line 78
    :cond_1
    new-instance v4, Ljava/text/MessageFormat;

    invoke-direct {v4, v3}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    .line 79
    .local v4, "formatter":Ljava/text/MessageFormat;
    invoke-virtual {v4, p1}, Ljava/text/MessageFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 70
    .end local v3    # "formatString":Ljava/lang/String;
    .end local v4    # "formatter":Ljava/text/MessageFormat;
    :catch_0
    move-exception v3

    .line 71
    .local v3, "mre":Ljava/util/MissingResourceException;
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "no message resource found for message property "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private reportErrorMessage(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)V
    .locals 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I
    .param p6, "justWarning"    # Z

    .line 165
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-lez p3, :cond_1

    .line 166
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 167
    .local v2, "lineStr":Ljava/lang/String;
    const/4 v3, 0x2

    if-eqz p2, :cond_0

    .line 168
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p2, v4, v0

    aput-object v2, v4, v1

    aput-object p1, v4, v3

    move-object v0, v4

    .line 169
    .local v0, "args":[Ljava/lang/Object;
    const-string v1, "msg.format3"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 170
    .end local v0    # "args":[Ljava/lang/Object;
    goto :goto_0

    .line 171
    :cond_0
    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, v0

    aput-object p1, v3, v1

    move-object v0, v3

    .line 172
    .restart local v0    # "args":[Ljava/lang/Object;
    const-string v1, "msg.format2"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 174
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v2    # "lineStr":Ljava/lang/String;
    :goto_0
    goto :goto_1

    .line 175
    :cond_1
    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v0

    move-object v0, v1

    .line 176
    .restart local v0    # "args":[Ljava/lang/Object;
    const-string v1, "msg.format1"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 178
    .end local v0    # "args":[Ljava/lang/Object;
    :goto_1
    if-eqz p6, :cond_2

    .line 179
    const-string v0, "msg.warning"

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 181
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "js: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 182
    if-eqz p4, :cond_3

    .line 183
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 184
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p5}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->buildIndicator(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 186
    :cond_3
    return-void
.end method

.method public static reportException(Lcom/trendmicro/hippo/ErrorReporter;Lcom/trendmicro/hippo/HippoException;)V
    .locals 7
    .param p0, "er"    # Lcom/trendmicro/hippo/ErrorReporter;
    .param p1, "ex"    # Lcom/trendmicro/hippo/HippoException;

    .line 137
    instance-of v0, p0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    if-eqz v0, :cond_0

    .line 138
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportException(Lcom/trendmicro/hippo/HippoException;)V

    goto :goto_0

    .line 140
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getExceptionMessage(Lcom/trendmicro/hippo/HippoException;)Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "msg":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/HippoException;->sourceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/trendmicro/hippo/HippoException;->lineNumber()I

    move-result v4

    .line 142
    invoke-virtual {p1}, Lcom/trendmicro/hippo/HippoException;->lineSource()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/trendmicro/hippo/HippoException;->columnNumber()I

    move-result v6

    .line 141
    move-object v1, p0

    move-object v2, v0

    invoke-interface/range {v1 .. v6}, Lcom/trendmicro/hippo/ErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 144
    .end local v0    # "msg":Ljava/lang/String;
    :goto_0
    return-void
.end method


# virtual methods
.method public error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V
    .locals 8
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I

    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->hasReportedErrorFlag:Z

    .line 111
    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v1 .. v7}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportErrorMessage(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)V

    .line 113
    return-void
.end method

.method public hasReportedError()Z
    .locals 1

    .line 124
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->hasReportedErrorFlag:Z

    return v0
.end method

.method public isReportingWarnings()Z
    .locals 1

    .line 128
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportWarnings:Z

    return v0
.end method

.method public reportException(Lcom/trendmicro/hippo/HippoException;)V
    .locals 10
    .param p1, "ex"    # Lcom/trendmicro/hippo/HippoException;

    .line 148
    instance-of v0, p1, Lcom/trendmicro/hippo/WrappedException;

    if-eqz v0, :cond_0

    .line 149
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/WrappedException;

    .line 150
    .local v0, "we":Lcom/trendmicro/hippo/WrappedException;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/WrappedException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 151
    .end local v0    # "we":Lcom/trendmicro/hippo/WrappedException;
    goto :goto_0

    .line 152
    :cond_0
    nop

    .line 153
    const-string v0, "line.separator"

    invoke-static {v0}, Lcom/trendmicro/hippo/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, "lineSeparator":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getExceptionMessage(Lcom/trendmicro/hippo/HippoException;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    invoke-virtual {p1}, Lcom/trendmicro/hippo/HippoException;->getScriptStackTrace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 156
    .local v1, "msg":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/HippoException;->sourceName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/trendmicro/hippo/HippoException;->lineNumber()I

    move-result v6

    .line 157
    invoke-virtual {p1}, Lcom/trendmicro/hippo/HippoException;->lineSource()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Lcom/trendmicro/hippo/HippoException;->columnNumber()I

    move-result v8

    const/4 v9, 0x0

    .line 156
    move-object v3, p0

    move-object v4, v1

    invoke-direct/range {v3 .. v9}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportErrorMessage(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)V

    .line 159
    .end local v0    # "lineSeparator":Ljava/lang/String;
    .end local v1    # "msg":Ljava/lang/String;
    :goto_0
    return-void
.end method

.method public runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;
    .locals 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I

    .line 119
    new-instance v6, Lcom/trendmicro/hippo/EvaluatorException;

    move-object v0, v6

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/EvaluatorException;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    return-object v6
.end method

.method public setIsReportingWarnings(Z)V
    .locals 0
    .param p1, "reportWarnings"    # Z

    .line 132
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportWarnings:Z

    .line 133
    return-void
.end method

.method public warning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V
    .locals 8
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I

    .line 101
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportWarnings:Z

    if-nez v0, :cond_0

    .line 102
    return-void

    .line 103
    :cond_0
    const/4 v7, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v1 .. v7}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportErrorMessage(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)V

    .line 105
    return-void
.end method
