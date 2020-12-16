.class public Lcom/trendmicro/hippo/CompilerEnvirons;
.super Ljava/lang/Object;
.source "CompilerEnvirons.java"


# instance fields
.field activationNames:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private allowMemberExprAsFunctionName:Z

.field private allowSharpComments:Z

.field private errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

.field private generateDebugInfo:Z

.field private generateObserverCount:Z

.field private generatingSource:Z

.field private ideMode:Z

.field private languageVersion:I

.field private optimizationLevel:I

.field private recordingComments:Z

.field private recordingLocalJsDocComments:Z

.field private recoverFromErrors:Z

.field private reservedKeywordAsIdentifier:Z

.field private strictMode:Z

.field private warnTrailingComma:Z

.field private warningAsError:Z

.field private xmlAvailable:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    sget-object v0, Lcom/trendmicro/hippo/DefaultErrorReporter;->instance:Lcom/trendmicro/hippo/DefaultErrorReporter;

    iput-object v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    .line 18
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->languageVersion:I

    .line 19
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->generateDebugInfo:Z

    .line 20
    iput-boolean v1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->reservedKeywordAsIdentifier:Z

    .line 21
    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->allowMemberExprAsFunctionName:Z

    .line 22
    iput-boolean v1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->xmlAvailable:Z

    .line 23
    iput v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->optimizationLevel:I

    .line 24
    iput-boolean v1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->generatingSource:Z

    .line 25
    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->strictMode:Z

    .line 26
    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->warningAsError:Z

    .line 27
    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->generateObserverCount:Z

    .line 28
    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->allowSharpComments:Z

    .line 29
    return-void
.end method

.method public static ideEnvirons()Lcom/trendmicro/hippo/CompilerEnvirons;
    .locals 3

    .line 264
    new-instance v0, Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-direct {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;-><init>()V

    .line 265
    .local v0, "env":Lcom/trendmicro/hippo/CompilerEnvirons;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->setRecoverFromErrors(Z)V

    .line 266
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->setRecordingComments(Z)V

    .line 267
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->setStrictMode(Z)V

    .line 268
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->setWarnTrailingComma(Z)V

    .line 269
    const/16 v2, 0xaa

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->setLanguageVersion(I)V

    .line 270
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->setReservedKeywordAsIdentifier(Z)V

    .line 271
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->setIdeMode(Z)V

    .line 272
    new-instance v1, Lcom/trendmicro/hippo/ast/ErrorCollector;

    invoke-direct {v1}, Lcom/trendmicro/hippo/ast/ErrorCollector;-><init>()V

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/CompilerEnvirons;->setErrorReporter(Lcom/trendmicro/hippo/ErrorReporter;)V

    .line 273
    return-object v0
.end method


# virtual methods
.method public getActivationNames()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 240
    iget-object v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->activationNames:Ljava/util/Set;

    return-object v0
.end method

.method public getAllowSharpComments()Z
    .locals 1

    .line 255
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->allowSharpComments:Z

    return v0
.end method

.method public final getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    return-object v0
.end method

.method public final getLanguageVersion()I
    .locals 1

    .line 69
    iget v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->languageVersion:I

    return v0
.end method

.method public final getOptimizationLevel()I
    .locals 1

    .line 124
    iget v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->optimizationLevel:I

    return v0
.end method

.method public getWarnTrailingComma()Z
    .locals 1

    .line 139
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->warnTrailingComma:Z

    return v0
.end method

.method public initFromContext(Lcom/trendmicro/hippo/Context;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 33
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->setErrorReporter(Lcom/trendmicro/hippo/ErrorReporter;)V

    .line 34
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->languageVersion:I

    .line 35
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->isGeneratingDebugChanged()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 36
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->isGeneratingDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->generateDebugInfo:Z

    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->reservedKeywordAsIdentifier:Z

    .line 39
    const/4 v0, 0x2

    .line 40
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->allowMemberExprAsFunctionName:Z

    .line 41
    const/16 v0, 0xb

    .line 42
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->strictMode:Z

    .line 43
    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->warningAsError:Z

    .line 44
    const/4 v0, 0x6

    .line 45
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->xmlAvailable:Z

    .line 47
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getOptimizationLevel()I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->optimizationLevel:I

    .line 49
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->isGeneratingSource()Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->generatingSource:Z

    .line 50
    iget-object v0, p1, Lcom/trendmicro/hippo/Context;->activationNames:Ljava/util/Set;

    iput-object v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->activationNames:Ljava/util/Set;

    .line 53
    iget-boolean v0, p1, Lcom/trendmicro/hippo/Context;->generateObserverCount:Z

    iput-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->generateObserverCount:Z

    .line 54
    return-void
.end method

.method public final isAllowMemberExprAsFunctionName()Z
    .locals 1

    .line 104
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->allowMemberExprAsFunctionName:Z

    return v0
.end method

.method public final isGenerateDebugInfo()Z
    .locals 1

    .line 80
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->generateDebugInfo:Z

    return v0
.end method

.method public isGenerateObserverCount()Z
    .locals 1

    .line 180
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->generateObserverCount:Z

    return v0
.end method

.method public final isGeneratingSource()Z
    .locals 1

    .line 135
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->generatingSource:Z

    return v0
.end method

.method public isIdeMode()Z
    .locals 1

    .line 236
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->ideMode:Z

    return v0
.end method

.method public isRecordingComments()Z
    .locals 1

    .line 199
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->recordingComments:Z

    return v0
.end method

.method public isRecordingLocalJsDocComments()Z
    .locals 1

    .line 207
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->recordingLocalJsDocComments:Z

    return v0
.end method

.method public final isReservedKeywordAsIdentifier()Z
    .locals 1

    .line 90
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->reservedKeywordAsIdentifier:Z

    return v0
.end method

.method public final isStrictMode()Z
    .locals 1

    .line 148
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->strictMode:Z

    return v0
.end method

.method public final isXmlAvailable()Z
    .locals 1

    .line 114
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->xmlAvailable:Z

    return v0
.end method

.method public recoverFromErrors()Z
    .locals 1

    .line 224
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->recoverFromErrors:Z

    return v0
.end method

.method public final reportWarningAsError()Z
    .locals 1

    .line 158
    iget-boolean v0, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->warningAsError:Z

    return v0
.end method

.method public setActivationNames(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 244
    .local p1, "activationNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->activationNames:Ljava/util/Set;

    .line 245
    return-void
.end method

.method public setAllowMemberExprAsFunctionName(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .line 109
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->allowMemberExprAsFunctionName:Z

    .line 110
    return-void
.end method

.method public setAllowSharpComments(Z)V
    .locals 0
    .param p1, "allow"    # Z

    .line 251
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->allowSharpComments:Z

    .line 252
    return-void
.end method

.method public setErrorReporter(Lcom/trendmicro/hippo/ErrorReporter;)V
    .locals 1
    .param p1, "errorReporter"    # Lcom/trendmicro/hippo/ErrorReporter;

    .line 63
    if-eqz p1, :cond_0

    .line 64
    iput-object p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    .line 65
    return-void

    .line 63
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public setGenerateDebugInfo(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .line 85
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->generateDebugInfo:Z

    .line 86
    return-void
.end method

.method public setGenerateObserverCount(Z)V
    .locals 0
    .param p1, "generateObserverCount"    # Z

    .line 195
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->generateObserverCount:Z

    .line 196
    return-void
.end method

.method public setGeneratingSource(Z)V
    .locals 0
    .param p1, "generatingSource"    # Z

    .line 172
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->generatingSource:Z

    .line 173
    return-void
.end method

.method public setIdeMode(Z)V
    .locals 0
    .param p1, "ide"    # Z

    .line 232
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->ideMode:Z

    .line 233
    return-void
.end method

.method public setLanguageVersion(I)V
    .locals 0
    .param p1, "languageVersion"    # I

    .line 74
    invoke-static {p1}, Lcom/trendmicro/hippo/Context;->checkLanguageVersion(I)V

    .line 75
    iput p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->languageVersion:I

    .line 76
    return-void
.end method

.method public setOptimizationLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .line 129
    invoke-static {p1}, Lcom/trendmicro/hippo/Context;->checkOptimizationLevel(I)V

    .line 130
    iput p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->optimizationLevel:I

    .line 131
    return-void
.end method

.method public setRecordingComments(Z)V
    .locals 0
    .param p1, "record"    # Z

    .line 203
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->recordingComments:Z

    .line 204
    return-void
.end method

.method public setRecordingLocalJsDocComments(Z)V
    .locals 0
    .param p1, "record"    # Z

    .line 211
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->recordingLocalJsDocComments:Z

    .line 212
    return-void
.end method

.method public setRecoverFromErrors(Z)V
    .locals 0
    .param p1, "recover"    # Z

    .line 220
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->recoverFromErrors:Z

    .line 221
    return-void
.end method

.method public setReservedKeywordAsIdentifier(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .line 95
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->reservedKeywordAsIdentifier:Z

    .line 96
    return-void
.end method

.method public setStrictMode(Z)V
    .locals 0
    .param p1, "strict"    # Z

    .line 153
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->strictMode:Z

    .line 154
    return-void
.end method

.method public setWarnTrailingComma(Z)V
    .locals 0
    .param p1, "warn"    # Z

    .line 143
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->warnTrailingComma:Z

    .line 144
    return-void
.end method

.method public setXmlAvailable(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .line 119
    iput-boolean p1, p0, Lcom/trendmicro/hippo/CompilerEnvirons;->xmlAvailable:Z

    .line 120
    return-void
.end method
