.class Lcom/trendmicro/hippo/Interpreter$CallFrame;
.super Ljava/lang/Object;
.source "Interpreter.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Interpreter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CallFrame"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x27772e38498fb682L


# instance fields
.field final debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

.field final emptyStackTop:I

.field final fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

.field frameIndex:I

.field frozen:Z

.field final idata:Lcom/trendmicro/hippo/InterpreterData;

.field isContinuationsTopFrame:Z

.field final localShift:I

.field parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

.field pc:I

.field pcPrevBranch:I

.field pcSourceLineStart:I

.field result:Ljava/lang/Object;

.field resultDbl:D

.field sDbl:[D

.field savedCallOp:I

.field savedStackTop:I

.field scope:Lcom/trendmicro/hippo/Scriptable;

.field stack:[Ljava/lang/Object;

.field stackAttributes:[I

.field final thisObj:Lcom/trendmicro/hippo/Scriptable;

.field throwable:Ljava/lang/Object;

.field final useActivation:Z

.field final varSource:Lcom/trendmicro/hippo/Interpreter$CallFrame;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/InterpretedFunction;Lcom/trendmicro/hippo/Interpreter$CallFrame;)V
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "fnOrScript"    # Lcom/trendmicro/hippo/InterpretedFunction;
    .param p4, "parentFrame"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iget-object v0, p3, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iput-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    .line 92
    iget-object v0, p1, Lcom/trendmicro/hippo/Context;->debugger:Lcom/trendmicro/hippo/debug/Debugger;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/trendmicro/hippo/Context;->debugger:Lcom/trendmicro/hippo/debug/Debugger;

    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    invoke-interface {v0, p1, v1}, Lcom/trendmicro/hippo/debug/Debugger;->getFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/debug/DebuggableScript;)Lcom/trendmicro/hippo/debug/DebugFrame;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->debuggerFrame:Lcom/trendmicro/hippo/debug/DebugFrame;

    .line 93
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsNeedsActivation:Z

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    move v0, v1

    goto :goto_2

    :cond_2
    :goto_1
    move v0, v2

    :goto_2
    iput-boolean v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->useActivation:Z

    .line 95
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsMaxVars:I

    iget-object v3, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v3, v3, Lcom/trendmicro/hippo/InterpreterData;->itsMaxLocals:I

    add-int/2addr v0, v3

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->emptyStackTop:I

    .line 96
    iput-object p3, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    .line 97
    iput-object p0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->varSource:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 98
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsMaxVars:I

    iput v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->localShift:I

    .line 99
    iput-object p2, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->thisObj:Lcom/trendmicro/hippo/Scriptable;

    .line 101
    iput-object p4, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 102
    if-nez p4, :cond_3

    goto :goto_3

    :cond_3
    iget v0, p4, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frameIndex:I

    add-int/lit8 v1, v0, 0x1

    :goto_3
    iput v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frameIndex:I

    .line 103
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getMaximumInterpreterStackDepth()I

    move-result v0

    if-gt v1, v0, :cond_4

    .line 109
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    iput-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 110
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v0, v0, Lcom/trendmicro/hippo/InterpreterData;->firstLinePC:I

    iput v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pcSourceLineStart:I

    .line 112
    iget v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->emptyStackTop:I

    iput v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->savedStackTop:I

    .line 113
    return-void

    .line 104
    :cond_4
    const-string v0, "Exceeded maximum stack depth"

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method private static equals(Lcom/trendmicro/hippo/Interpreter$CallFrame;Lcom/trendmicro/hippo/Interpreter$CallFrame;Lcom/trendmicro/hippo/EqualObjectGraphs;)Z
    .locals 2
    .param p0, "f1"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p1, "f2"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "equal"    # Lcom/trendmicro/hippo/EqualObjectGraphs;

    .line 267
    :goto_0
    if-ne p0, p1, :cond_0

    .line 268
    const/4 v0, 0x1

    return v0

    .line 269
    :cond_0
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    if-nez p1, :cond_1

    goto :goto_1

    .line 271
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fieldsEqual(Lcom/trendmicro/hippo/Interpreter$CallFrame;Lcom/trendmicro/hippo/EqualObjectGraphs;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 272
    return v0

    .line 274
    :cond_2
    iget-object p0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 275
    iget-object p1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    goto :goto_0

    .line 270
    :cond_3
    :goto_1
    return v0
.end method

.method private equalsInTopScope(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .line 249
    #disallowed odex opcode
    #iput-object-volatile v0, p1, Landroid/app/Notification;->audioAttributes:Landroid/media/AudioAttributes;
    nop

    array-length v0, v0

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/EqualObjectGraphs;->withThreadLocal(Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method private fieldsEqual(Lcom/trendmicro/hippo/Interpreter$CallFrame;Lcom/trendmicro/hippo/EqualObjectGraphs;)Z
    .locals 2
    .param p1, "other"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .param p2, "equal"    # Lcom/trendmicro/hippo/EqualObjectGraphs;

    .line 281
    iget v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frameIndex:I

    iget v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frameIndex:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    iget v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    .line 283
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/Interpreter;->access$200(Lcom/trendmicro/hippo/InterpreterData;Lcom/trendmicro/hippo/InterpreterData;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->varSource:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    iget-object v0, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget-object v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->varSource:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    iget-object v1, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    .line 284
    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->varSource:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    iget-object v0, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    iget-object v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->varSource:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    iget-object v1, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    .line 285
    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([D[D)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->thisObj:Lcom/trendmicro/hippo/Scriptable;

    iget-object v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->thisObj:Lcom/trendmicro/hippo/Scriptable;

    .line 286
    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    iget-object v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    .line 287
    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v1, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 288
    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 281
    :goto_0
    return v0
.end method

.method private isStrictTopFrame()Z
    .locals 3

    .line 253
    move-object v0, p0

    .line 255
    .local v0, "f":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :goto_0
    iget-object v1, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 256
    .local v1, "p":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    if-nez v1, :cond_0

    .line 257
    iget-object v2, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v2, v2, Lcom/trendmicro/hippo/InterpreterData;->isStrict:Z

    return v2

    .line 259
    :cond_0
    move-object v0, v1

    .line 260
    .end local v1    # "p":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    goto :goto_0
.end method

.method private synthetic lambda$equals$0(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;
    .param p2, "c"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 223
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Interpreter$CallFrame;->equalsInTopScope(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method private synthetic lambda$equalsInTopScope$1(Ljava/lang/Object;Lcom/trendmicro/hippo/EqualObjectGraphs;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;
    .param p2, "eq"    # Lcom/trendmicro/hippo/EqualObjectGraphs;

    .line 249
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;

    invoke-static {p0, v0, p2}, Lcom/trendmicro/hippo/Interpreter$CallFrame;->equals(Lcom/trendmicro/hippo/Interpreter$CallFrame;Lcom/trendmicro/hippo/Interpreter$CallFrame;Lcom/trendmicro/hippo/EqualObjectGraphs;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method cloneFrozen()Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .locals 2

    .line 185
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 189
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 192
    .local v0, "copy":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    nop

    .line 197
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    invoke-virtual {v1}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    iput-object v1, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    .line 198
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stackAttributes:[I

    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stackAttributes:[I

    .line 199
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    invoke-virtual {v1}, [D->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [D

    iput-object v1, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    .line 201
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    .line 202
    return-object v0

    .line 190
    .end local v0    # "copy":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    :catch_0
    move-exception v0

    .line 191
    .local v0, "ex":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "other"    # Ljava/lang/Object;

    .line 211
    instance-of v0, p1, Lcom/trendmicro/hippo/Interpreter$CallFrame;

    if-eqz v0, :cond_1

    .line 216
    invoke-static {}, Lcom/trendmicro/hippo/Context;->enter()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 218
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    :try_start_0
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->hasTopCall(Lcom/trendmicro/hippo/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 219
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Interpreter$CallFrame;->equalsInTopScope(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 226
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 219
    return v1

    .line 221
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 222
    .local v3, "top":Lcom/trendmicro/hippo/Scriptable;
    #disallowed odex opcode
    #iput-object-volatile v0, v2, Landroid/app/Notification;->actions:[Landroid/app/Notification$Action;
    nop

    float-to-int v0, v0

    move-result-object v1

    sget-object v5, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 224
    invoke-direct {p0}, Lcom/trendmicro/hippo/Interpreter$CallFrame;->isStrictTopFrame()Z

    move-result v6

    .line 222
    move-object v2, v0

    move-object v4, v3

    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/ScriptRuntime;->doTopCall(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 226
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 222
    return v1

    .line 226
    .end local v3    # "top":Lcom/trendmicro/hippo/Scriptable;
    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 227
    throw v1

    .line 229
    .end local v0    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public hashCode()I
    .locals 5

    .line 238
    const/4 v0, 0x0

    .line 239
    .local v0, "depth":I
    move-object v1, p0

    .line 240
    .local v1, "f":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    const/4 v2, 0x0

    .line 242
    .local v2, "h":I
    :goto_0
    mul-int/lit8 v3, v2, 0x1f

    iget v4, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->pc:I

    add-int/2addr v3, v4

    mul-int/lit8 v3, v3, 0x1f

    iget-object v4, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/InterpreterData;->icodeHashCode()I

    move-result v4

    add-int v2, v3, v4

    .line 243
    iget-object v1, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 244
    if-eqz v1, :cond_1

    add-int/lit8 v3, v0, 0x1

    .end local v0    # "depth":I
    .local v3, "depth":I
    const/16 v4, 0x8

    if-lt v0, v4, :cond_0

    move v0, v3

    goto :goto_1

    :cond_0
    move v0, v3

    goto :goto_0

    .line 245
    .end local v3    # "depth":I
    .restart local v0    # "depth":I
    :cond_1
    :goto_1
    return v2
.end method

.method initializeArgs(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;[DII)V
    .locals 6
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "callerScope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "argsDbl"    # [D
    .param p5, "argShift"    # I
    .param p6, "argCount"    # I

    .line 116
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->useActivation:Z

    if-eqz v0, :cond_1

    .line 119
    if-eqz p4, :cond_0

    .line 120
    invoke-static {p3, p4, p5, p6}, Lcom/trendmicro/hippo/Interpreter;->access$000([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object p3

    .line 122
    :cond_0
    const/4 p5, 0x0

    .line 123
    const/4 p4, 0x0

    .line 126
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsFunctionType:I

    if-eqz v0, :cond_3

    .line 127
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/InterpretedFunction;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 129
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->useActivation:Z

    if-eqz v0, :cond_4

    .line 130
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsFunctionType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    .line 131
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v2, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v2, v2, Lcom/trendmicro/hippo/InterpreterData;->isStrict:Z

    invoke-static {v0, v1, p3, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->createArrowFunctionActivation(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    goto :goto_0

    .line 133
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v2, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v2, v2, Lcom/trendmicro/hippo/InterpreterData;->isStrict:Z

    invoke-static {v0, v1, p3, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->createFunctionActivation(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    goto :goto_0

    .line 137
    :cond_3
    iput-object p2, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 138
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->thisObj:Lcom/trendmicro/hippo/Scriptable;

    iget-object v2, v0, Lcom/trendmicro/hippo/InterpretedFunction;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v2, v2, Lcom/trendmicro/hippo/InterpreterData;->evalScriptFlag:Z

    invoke-static {v0, v1, p1, p2, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->initScript(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 142
    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsNestedFunctions:[Lcom/trendmicro/hippo/InterpreterData;

    const/4 v1, 0x1

    if-eqz v0, :cond_7

    .line 143
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsFunctionType:I

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsNeedsActivation:Z

    if-nez v0, :cond_5

    .line 144
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 145
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v2, v2, Lcom/trendmicro/hippo/InterpreterData;->itsNestedFunctions:[Lcom/trendmicro/hippo/InterpreterData;

    array-length v2, v2

    if-ge v0, v2, :cond_7

    .line 146
    iget-object v2, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v2, v2, Lcom/trendmicro/hippo/InterpreterData;->itsNestedFunctions:[Lcom/trendmicro/hippo/InterpreterData;

    aget-object v2, v2, v0

    .line 147
    .local v2, "fdata":Lcom/trendmicro/hippo/InterpreterData;
    iget v3, v2, Lcom/trendmicro/hippo/InterpreterData;->itsFunctionType:I

    if-ne v3, v1, :cond_6

    .line 148
    iget-object v3, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v4, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->fnOrScript:Lcom/trendmicro/hippo/InterpretedFunction;

    invoke-static {p1, v3, v4, v0}, Lcom/trendmicro/hippo/Interpreter;->access$100(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/InterpretedFunction;I)V

    .line 145
    .end local v2    # "fdata":Lcom/trendmicro/hippo/InterpreterData;
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 153
    .end local v0    # "i":I
    :cond_7
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsMaxFrameArray:I

    .line 155
    .local v0, "maxFrameArray":I
    iget v2, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->emptyStackTop:I

    iget-object v3, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v3, v3, Lcom/trendmicro/hippo/InterpreterData;->itsMaxStack:I

    add-int/2addr v2, v3

    add-int/2addr v2, v1

    if-eq v0, v2, :cond_8

    .line 156
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 160
    :cond_8
    new-array v1, v0, [Ljava/lang/Object;

    iput-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    .line 161
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stackAttributes:[I

    .line 162
    new-array v1, v0, [D

    iput-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    .line 164
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/InterpreterData;->getParamAndVarCount()I

    move-result v1

    .line 165
    .local v1, "varCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    if-ge v2, v1, :cond_a

    .line 166
    iget-object v3, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/InterpreterData;->getParamOrVarConst(I)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 167
    iget-object v3, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stackAttributes:[I

    const/16 v4, 0xd

    aput v4, v3, v2

    .line 165
    :cond_9
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 169
    .end local v2    # "i":I
    :cond_a
    iget-object v2, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v2, v2, Lcom/trendmicro/hippo/InterpreterData;->argCount:I

    .line 170
    .local v2, "definedArgs":I
    if-le v2, p6, :cond_b

    move v2, p6

    .line 174
    :cond_b
    iget-object v3, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p3, p5, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 175
    if-eqz p4, :cond_c

    .line 176
    iget-object v3, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->sDbl:[D

    invoke-static {p4, p5, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 178
    :cond_c
    move v3, v2

    .local v3, "i":I
    :goto_3
    iget-object v4, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->idata:Lcom/trendmicro/hippo/InterpreterData;

    iget v4, v4, Lcom/trendmicro/hippo/InterpreterData;->itsMaxVars:I

    if-eq v3, v4, :cond_d

    .line 179
    iget-object v4, p0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    aput-object v5, v4, v3

    .line 178
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 181
    .end local v3    # "i":I
    :cond_d
    return-void
.end method
