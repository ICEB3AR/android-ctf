.class public Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;
.super Lcom/trendmicro/hippo/ContextFactory;
.source "ShellContextFactory.java"


# instance fields
.field private allowReservedKeywords:Z

.field private characterEncoding:Ljava/lang/String;

.field private errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

.field private generatingDebug:Z

.field private languageVersion:I

.field private optimizationLevel:I

.field private strictMode:Z

.field private warningAsError:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 13
    invoke-direct {p0}, Lcom/trendmicro/hippo/ContextFactory;-><init>()V

    .line 17
    const/16 v0, 0xb4

    iput v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->languageVersion:I

    .line 20
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->allowReservedKeywords:Z

    return-void
.end method


# virtual methods
.method public getCharacterEncoding()Ljava/lang/String;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->characterEncoding:Ljava/lang/String;

    return-object v0
.end method

.method protected hasFeature(Lcom/trendmicro/hippo/Context;I)Z
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "featureIndex"    # I

    .line 27
    const/4 v0, 0x3

    if-eq p2, v0, :cond_0

    packed-switch p2, :pswitch_data_0

    .line 42
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/ContextFactory;->hasFeature(Lcom/trendmicro/hippo/Context;I)Z

    move-result v0

    return v0

    .line 37
    :pswitch_0
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->warningAsError:Z

    return v0

    .line 40
    :pswitch_1
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->generatingDebug:Z

    return v0

    .line 31
    :pswitch_2
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->strictMode:Z

    return v0

    .line 34
    :cond_0
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->allowReservedKeywords:Z

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method protected onContextCreated(Lcom/trendmicro/hippo/Context;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 48
    iget v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->languageVersion:I

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Context;->setLanguageVersion(I)V

    .line 49
    iget v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->optimizationLevel:I

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Context;->setOptimizationLevel(I)V

    .line 50
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    if-eqz v0, :cond_0

    .line 51
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Context;->setErrorReporter(Lcom/trendmicro/hippo/ErrorReporter;)Lcom/trendmicro/hippo/ErrorReporter;

    .line 53
    :cond_0
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->generatingDebug:Z

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Context;->setGeneratingDebug(Z)V

    .line 54
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/ContextFactory;->onContextCreated(Lcom/trendmicro/hippo/Context;)V

    .line 55
    return-void
.end method

.method public setAllowReservedKeywords(Z)V
    .locals 0
    .param p1, "allowReservedKeywords"    # Z

    .line 105
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->allowReservedKeywords:Z

    .line 106
    return-void
.end method

.method public setCharacterEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "characterEncoding"    # Ljava/lang/String;

    .line 101
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->characterEncoding:Ljava/lang/String;

    .line 102
    return-void
.end method

.method public setErrorReporter(Lcom/trendmicro/hippo/ErrorReporter;)V
    .locals 1
    .param p1, "errorReporter"    # Lcom/trendmicro/hippo/ErrorReporter;

    .line 85
    if-eqz p1, :cond_0

    .line 86
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    .line 87
    return-void

    .line 85
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public setGeneratingDebug(Z)V
    .locals 0
    .param p1, "generatingDebug"    # Z

    .line 91
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->generatingDebug:Z

    .line 92
    return-void
.end method

.method public setLanguageVersion(I)V
    .locals 0
    .param p1, "version"    # I

    .line 71
    invoke-static {p1}, Lcom/trendmicro/hippo/Context;->checkLanguageVersion(I)V

    .line 72
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->checkNotSealed()V

    .line 73
    iput p1, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->languageVersion:I

    .line 74
    return-void
.end method

.method public setOptimizationLevel(I)V
    .locals 0
    .param p1, "optimizationLevel"    # I

    .line 78
    invoke-static {p1}, Lcom/trendmicro/hippo/Context;->checkOptimizationLevel(I)V

    .line 79
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->checkNotSealed()V

    .line 80
    iput p1, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->optimizationLevel:I

    .line 81
    return-void
.end method

.method public setStrictMode(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .line 59
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->checkNotSealed()V

    .line 60
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->strictMode:Z

    .line 61
    return-void
.end method

.method public setWarningAsError(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .line 65
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->checkNotSealed()V

    .line 66
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->warningAsError:Z

    .line 67
    return-void
.end method
