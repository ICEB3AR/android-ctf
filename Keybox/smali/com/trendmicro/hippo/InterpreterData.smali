.class final Lcom/trendmicro/hippo/InterpreterData;
.super Ljava/lang/Object;
.source "InterpreterData.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Lcom/trendmicro/hippo/debug/DebuggableScript;


# static fields
.field static final INITIAL_MAX_ICODE_LENGTH:I = 0x400

.field static final INITIAL_NUMBERTABLE_SIZE:I = 0x40

.field static final INITIAL_STRINGTABLE_SIZE:I = 0x40

.field private static final serialVersionUID:J = 0x465401b399c4b69aL


# instance fields
.field argCount:I

.field argIsConst:[Z

.field argNames:[Ljava/lang/String;

.field encodedSource:Ljava/lang/String;

.field encodedSourceEnd:I

.field encodedSourceStart:I

.field evalScriptFlag:Z

.field firstLinePC:I

.field private icodeHashCode:I

.field isStrict:Z

.field itsDoubleTable:[D

.field itsExceptionTable:[I

.field itsFunctionType:I

.field itsICode:[B

.field itsMaxCalleeArgs:I

.field itsMaxFrameArray:I

.field itsMaxLocals:I

.field itsMaxStack:I

.field itsMaxVars:I

.field itsName:Ljava/lang/String;

.field itsNeedsActivation:Z

.field itsNestedFunctions:[Lcom/trendmicro/hippo/InterpreterData;

.field itsRegExpLiterals:[Ljava/lang/Object;

.field itsSourceFile:Ljava/lang/String;

.field itsStringTable:[Ljava/lang/String;

.field languageVersion:I

.field literalIds:[Ljava/lang/Object;

.field longJumps:Lcom/trendmicro/hippo/UintMap;

.field parentData:Lcom/trendmicro/hippo/InterpreterData;

.field topLevel:Z


# direct methods
.method constructor <init>(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "languageVersion"    # I
    .param p2, "sourceFile"    # Ljava/lang/String;
    .param p3, "encodedSource"    # Ljava/lang/String;
    .param p4, "isStrict"    # Z

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/InterpreterData;->firstLinePC:I

    .line 93
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/InterpreterData;->icodeHashCode:I

    .line 25
    iput p1, p0, Lcom/trendmicro/hippo/InterpreterData;->languageVersion:I

    .line 26
    iput-object p2, p0, Lcom/trendmicro/hippo/InterpreterData;->itsSourceFile:Ljava/lang/String;

    .line 27
    iput-object p3, p0, Lcom/trendmicro/hippo/InterpreterData;->encodedSource:Ljava/lang/String;

    .line 28
    iput-boolean p4, p0, Lcom/trendmicro/hippo/InterpreterData;->isStrict:Z

    .line 29
    invoke-direct {p0}, Lcom/trendmicro/hippo/InterpreterData;->init()V

    .line 30
    return-void
.end method

.method constructor <init>(Lcom/trendmicro/hippo/InterpreterData;)V
    .locals 1
    .param p1, "parent"    # Lcom/trendmicro/hippo/InterpreterData;

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/InterpreterData;->firstLinePC:I

    .line 93
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/InterpreterData;->icodeHashCode:I

    .line 34
    iput-object p1, p0, Lcom/trendmicro/hippo/InterpreterData;->parentData:Lcom/trendmicro/hippo/InterpreterData;

    .line 35
    iget v0, p1, Lcom/trendmicro/hippo/InterpreterData;->languageVersion:I

    iput v0, p0, Lcom/trendmicro/hippo/InterpreterData;->languageVersion:I

    .line 36
    iget-object v0, p1, Lcom/trendmicro/hippo/InterpreterData;->itsSourceFile:Ljava/lang/String;

    iput-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->itsSourceFile:Ljava/lang/String;

    .line 37
    iget-object v0, p1, Lcom/trendmicro/hippo/InterpreterData;->encodedSource:Ljava/lang/String;

    iput-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->encodedSource:Ljava/lang/String;

    .line 38
    iget-boolean v0, p1, Lcom/trendmicro/hippo/InterpreterData;->isStrict:Z

    iput-boolean v0, p0, Lcom/trendmicro/hippo/InterpreterData;->isStrict:Z

    .line 39
    invoke-direct {p0}, Lcom/trendmicro/hippo/InterpreterData;->init()V

    .line 40
    return-void
.end method

.method private init()V
    .locals 1

    .line 44
    const/16 v0, 0x400

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    .line 45
    const/16 v0, 0x40

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->itsStringTable:[Ljava/lang/String;

    .line 46
    return-void
.end method


# virtual methods
.method public getFunction(I)Lcom/trendmicro/hippo/debug/DebuggableScript;
    .locals 1
    .param p1, "index"    # I

    .line 163
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->itsNestedFunctions:[Lcom/trendmicro/hippo/InterpreterData;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getFunctionCount()I
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->itsNestedFunctions:[Lcom/trendmicro/hippo/InterpreterData;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    array-length v0, v0

    :goto_0
    return v0
.end method

.method public getFunctionName()Ljava/lang/String;
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->itsName:Ljava/lang/String;

    return-object v0
.end method

.method public getLineNumbers()[I
    .locals 1

    .line 151
    invoke-static {p0}, Lcom/trendmicro/hippo/Interpreter;->getLineNumbers(Lcom/trendmicro/hippo/InterpreterData;)[I

    move-result-object v0

    return-object v0
.end method

.method public getParamAndVarCount()I
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->argNames:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public getParamCount()I
    .locals 1

    .line 116
    iget v0, p0, Lcom/trendmicro/hippo/InterpreterData;->argCount:I

    return v0
.end method

.method public getParamOrVarConst(I)Z
    .locals 1
    .param p1, "index"    # I

    .line 133
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->argIsConst:[Z

    aget-boolean v0, v0, p1

    return v0
.end method

.method public getParamOrVarName(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I

    .line 128
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getParent()Lcom/trendmicro/hippo/debug/DebuggableScript;
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->parentData:Lcom/trendmicro/hippo/InterpreterData;

    return-object v0
.end method

.method public getSourceName()Ljava/lang/String;
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->itsSourceFile:Ljava/lang/String;

    return-object v0
.end method

.method public icodeHashCode()I
    .locals 2

    .line 174
    iget v0, p0, Lcom/trendmicro/hippo/InterpreterData;->icodeHashCode:I

    .line 175
    .local v0, "h":I
    if-nez v0, :cond_0

    .line 176
    iget-object v1, p0, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([B)I

    move-result v1

    move v0, v1

    iput v1, p0, Lcom/trendmicro/hippo/InterpreterData;->icodeHashCode:I

    .line 178
    :cond_0
    return v0
.end method

.method public isFunction()Z
    .locals 1

    .line 104
    iget v0, p0, Lcom/trendmicro/hippo/InterpreterData;->itsFunctionType:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isGeneratedScript()Z
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpreterData;->itsSourceFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->isGeneratedScript(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isTopLevel()Z
    .locals 1

    .line 98
    iget-boolean v0, p0, Lcom/trendmicro/hippo/InterpreterData;->topLevel:Z

    return v0
.end method
