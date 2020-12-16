.class final Lcom/trendmicro/hippo/InterpretedFunction;
.super Lcom/trendmicro/hippo/NativeFunction;
.source "InterpretedFunction.java"

# interfaces
.implements Lcom/trendmicro/hippo/Script;


# static fields
.field private static final serialVersionUID:J = 0x783b5432cd0d5acL


# instance fields
.field idata:Lcom/trendmicro/hippo/InterpreterData;

.field securityController:Lcom/trendmicro/hippo/SecurityController;

.field securityDomain:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Lcom/trendmicro/hippo/InterpretedFunction;I)V
    .locals 1
    .param p1, "parent"    # Lcom/trendmicro/hippo/InterpretedFunction;
    .param p2, "index"    # I

    .line 44
    invoke-direct {p0}, Lcom/trendmicro/hippo/NativeFunction;-><init>()V

    .line 45
    iget-object v0, p1, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsNestedFunctions:[Lcom/trendmicro/hippo/InterpreterData;

    aget-object v0, v0, p2

    iput-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    .line 46
    iget-object v0, p1, Lcom/trendmicro/hippo/InterpretedFunction;->securityController:Lcom/trendmicro/hippo/SecurityController;

    iput-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->securityController:Lcom/trendmicro/hippo/SecurityController;

    .line 47
    iget-object v0, p1, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    iput-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    .line 48
    return-void
.end method

.method private constructor <init>(Lcom/trendmicro/hippo/InterpreterData;Ljava/lang/Object;)V
    .locals 3
    .param p1, "idata"    # Lcom/trendmicro/hippo/InterpreterData;
    .param p2, "staticSecurityDomain"    # Ljava/lang/Object;

    .line 21
    invoke-direct {p0}, Lcom/trendmicro/hippo/NativeFunction;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    .line 27
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 28
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getSecurityController()Lcom/trendmicro/hippo/SecurityController;

    move-result-object v1

    .line 30
    .local v1, "sc":Lcom/trendmicro/hippo/SecurityController;
    if-eqz v1, :cond_0

    .line 31
    invoke-virtual {v1, p2}, Lcom/trendmicro/hippo/SecurityController;->getDynamicSecurityDomain(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .local v2, "dynamicDomain":Ljava/lang/Object;
    goto :goto_0

    .line 33
    .end local v2    # "dynamicDomain":Ljava/lang/Object;
    :cond_0
    if-nez p2, :cond_1

    .line 36
    const/4 v2, 0x0

    .line 39
    .restart local v2    # "dynamicDomain":Ljava/lang/Object;
    :goto_0
    iput-object v1, p0, Lcom/trendmicro/hippo/InterpretedFunction;->securityController:Lcom/trendmicro/hippo/SecurityController;

    .line 40
    iput-object v2, p0, Lcom/trendmicro/hippo/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    .line 41
    return-void

    .line 34
    .end local v2    # "dynamicDomain":Ljava/lang/Object;
    :cond_1
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v2
.end method

.method static createFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/InterpretedFunction;I)Lcom/trendmicro/hippo/InterpretedFunction;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "parent"    # Lcom/trendmicro/hippo/InterpretedFunction;
    .param p3, "index"    # I

    .line 81
    new-instance v0, Lcom/trendmicro/hippo/InterpretedFunction;

    invoke-direct {v0, p2, p3}, Lcom/trendmicro/hippo/InterpretedFunction;-><init>(Lcom/trendmicro/hippo/InterpretedFunction;I)V

    .line 82
    .local v0, "f":Lcom/trendmicro/hippo/InterpretedFunction;
    invoke-virtual {v0, p0, p1}, Lcom/trendmicro/hippo/InterpretedFunction;->initScriptFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V

    .line 83
    return-object v0
.end method

.method static createFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/InterpreterData;Ljava/lang/Object;)Lcom/trendmicro/hippo/InterpretedFunction;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "idata"    # Lcom/trendmicro/hippo/InterpreterData;
    .param p3, "staticSecurityDomain"    # Ljava/lang/Object;

    .line 69
    new-instance v0, Lcom/trendmicro/hippo/InterpretedFunction;

    invoke-direct {v0, p2, p3}, Lcom/trendmicro/hippo/InterpretedFunction;-><init>(Lcom/trendmicro/hippo/InterpreterData;Ljava/lang/Object;)V

    .line 70
    .local v0, "f":Lcom/trendmicro/hippo/InterpretedFunction;
    invoke-virtual {v0, p0, p1}, Lcom/trendmicro/hippo/InterpretedFunction;->initScriptFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V

    .line 71
    return-object v0
.end method

.method static createScript(Lcom/trendmicro/hippo/InterpreterData;Ljava/lang/Object;)Lcom/trendmicro/hippo/InterpretedFunction;
    .locals 1
    .param p0, "idata"    # Lcom/trendmicro/hippo/InterpreterData;
    .param p1, "staticSecurityDomain"    # Ljava/lang/Object;

    .line 57
    new-instance v0, Lcom/trendmicro/hippo/InterpretedFunction;

    invoke-direct {v0, p0, p1}, Lcom/trendmicro/hippo/InterpretedFunction;-><init>(Lcom/trendmicro/hippo/InterpreterData;Ljava/lang/Object;)V

    .line 58
    .local v0, "f":Lcom/trendmicro/hippo/InterpretedFunction;
    return-object v0
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 106
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->hasTopCall(Lcom/trendmicro/hippo/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 107
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v6, v0, Lcom/trendmicro/hippo/InterpreterData;->isStrict:Z

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/ScriptRuntime;->doTopCall(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 109
    :cond_0
    invoke-static {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/Interpreter;->interpret(Lcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 7
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 115
    invoke-virtual {p0}, Lcom/trendmicro/hippo/InterpretedFunction;->isScript()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 119
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->hasTopCall(Lcom/trendmicro/hippo/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 121
    sget-object v5, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    iget-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v6, v0, Lcom/trendmicro/hippo/InterpreterData;->isStrict:Z

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p2

    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/ScriptRuntime;->doTopCall(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 124
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-static {p0, p1, p2, p2, v0}, Lcom/trendmicro/hippo/Interpreter;->interpret(Lcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 117
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public getDebuggableView()Lcom/trendmicro/hippo/debug/DebuggableScript;
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    return-object v0
.end method

.method public getEncodedSource()Ljava/lang/String;
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    invoke-static {v0}, Lcom/trendmicro/hippo/Interpreter;->getEncodedSource(Lcom/trendmicro/hippo/InterpreterData;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFunctionName()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsName:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsName:Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method protected getLanguageVersion()I
    .locals 1

    .line 154
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v0, v0, Lcom/trendmicro/hippo/InterpreterData;->languageVersion:I

    return v0
.end method

.method protected getParamAndVarCount()I
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->argNames:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method protected getParamCount()I
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v0, v0, Lcom/trendmicro/hippo/InterpreterData;->argCount:I

    return v0
.end method

.method protected getParamOrVarConst(I)Z
    .locals 1
    .param p1, "index"    # I

    .line 178
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->argIsConst:[Z

    aget-boolean v0, v0, p1

    return v0
.end method

.method protected getParamOrVarName(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I

    .line 172
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public isScript()Z
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsFunctionType:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public resumeGenerator(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "operation"    # I
    .param p4, "state"    # Ljava/lang/Object;
    .param p5, "value"    # Ljava/lang/Object;

    .line 148
    invoke-static {p1, p2, p3, p4, p5}, Lcom/trendmicro/hippo/Interpreter;->resumeGenerator(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
