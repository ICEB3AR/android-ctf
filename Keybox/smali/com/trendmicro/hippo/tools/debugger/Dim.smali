.class public Lcom/trendmicro/hippo/tools/debugger/Dim;
.super Ljava/lang/Object;
.source "Dim.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;,
        Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;,
        Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;,
        Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;,
        Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    }
.end annotation


# static fields
.field public static final BREAK:I = 0x4

.field public static final EXIT:I = 0x5

.field public static final GO:I = 0x3

.field private static final IPROXY_COMPILE_SCRIPT:I = 0x2

.field private static final IPROXY_DEBUG:I = 0x0

.field private static final IPROXY_EVAL_SCRIPT:I = 0x3

.field private static final IPROXY_LISTEN:I = 0x1

.field private static final IPROXY_OBJECT_IDS:I = 0x7

.field private static final IPROXY_OBJECT_PROPERTY:I = 0x6

.field private static final IPROXY_OBJECT_TO_STRING:I = 0x5

.field private static final IPROXY_STRING_IS_COMPILABLE:I = 0x4

.field public static final STEP_INTO:I = 0x1

.field public static final STEP_OUT:I = 0x2

.field public static final STEP_OVER:I


# instance fields
.field private breakFlag:Z

.field private breakOnEnter:Z

.field private breakOnExceptions:Z

.field private breakOnReturn:Z

.field private callback:Lcom/trendmicro/hippo/tools/debugger/GuiCallback;

.field private contextFactory:Lcom/trendmicro/hippo/ContextFactory;

.field private evalFrame:Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

.field private evalRequest:Ljava/lang/String;

.field private evalResult:Ljava/lang/String;

.field private eventThreadMonitor:Ljava/lang/Object;

.field private frameIndex:I

.field private final functionNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;",
            ">;"
        }
    .end annotation
.end field

.field private final functionToSource:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/trendmicro/hippo/debug/DebuggableScript;",
            "Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;",
            ">;"
        }
    .end annotation
.end field

.field private insideInterruptLoop:Z

.field private volatile interruptedContextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

.field private listener:Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

.field private monitor:Ljava/lang/Object;

.field private volatile returnValue:I

.field private scopeProvider:Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;

.field private sourceProvider:Lcom/trendmicro/hippo/tools/debugger/SourceProvider;

.field private final urlToSourceInfo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->frameIndex:I

    .line 100
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->monitor:Ljava/lang/Object;

    .line 106
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->eventThreadMonitor:Ljava/lang/Object;

    .line 111
    iput v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->returnValue:I

    .line 153
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 154
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->urlToSourceInfo:Ljava/util/Map;

    .line 159
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 160
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionNames:Ljava/util/Map;

    .line 165
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 166
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionToSource:Ljava/util/Map;

    .line 165
    return-void
.end method

.method static synthetic access$1800(Lcom/trendmicro/hippo/tools/debugger/Dim;)Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim;

    .line 39
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->scopeProvider:Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim;
    .param p1, "x1"    # Lcom/trendmicro/hippo/Context;
    .param p2, "x2"    # Ljava/lang/Object;
    .param p3, "x3"    # Ljava/lang/Object;

    .line 39
    invoke-direct {p0, p1, p2, p3}, Lcom/trendmicro/hippo/tools/debugger/Dim;->getObjectPropertyImpl(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2000(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim;
    .param p1, "x1"    # Lcom/trendmicro/hippo/Context;
    .param p2, "x2"    # Ljava/lang/Object;

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/tools/debugger/Dim;->getObjectIdsImpl(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2100(Lcom/trendmicro/hippo/tools/debugger/Dim;)Lcom/trendmicro/hippo/ContextFactory;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim;

    .line 39
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->contextFactory:Lcom/trendmicro/hippo/ContextFactory;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/debug/DebuggableScript;)Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim;
    .param p1, "x1"    # Lcom/trendmicro/hippo/debug/DebuggableScript;

    .line 39
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->getFunctionSource(Lcom/trendmicro/hippo/debug/DebuggableScript;)Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2400(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim;
    .param p1, "x1"    # Lcom/trendmicro/hippo/debug/DebuggableScript;
    .param p2, "x2"    # Ljava/lang/String;

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/tools/debugger/Dim;->registerTopScript(Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2700(Lcom/trendmicro/hippo/tools/debugger/Dim;)Z
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim;

    .line 39
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->breakOnEnter:Z

    return v0
.end method

.method static synthetic access$2800(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Lcom/trendmicro/hippo/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim;
    .param p1, "x1"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .param p2, "x2"    # Lcom/trendmicro/hippo/Context;

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/tools/debugger/Dim;->handleBreakpointHit(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Lcom/trendmicro/hippo/Context;)V

    return-void
.end method

.method static synthetic access$2900(Lcom/trendmicro/hippo/tools/debugger/Dim;)Z
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim;

    .line 39
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->breakFlag:Z

    return v0
.end method

.method static synthetic access$3000(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/Context;Ljava/lang/Throwable;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)V
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim;
    .param p1, "x1"    # Lcom/trendmicro/hippo/Context;
    .param p2, "x2"    # Ljava/lang/Throwable;
    .param p3, "x3"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    .line 39
    invoke-direct {p0, p1, p2, p3}, Lcom/trendmicro/hippo/tools/debugger/Dim;->handleExceptionThrown(Lcom/trendmicro/hippo/Context;Ljava/lang/Throwable;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)V

    return-void
.end method

.method static synthetic access$3100(Lcom/trendmicro/hippo/tools/debugger/Dim;)Z
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim;

    .line 39
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->breakOnReturn:Z

    return v0
.end method

.method private static collectFunctions_r(Lcom/trendmicro/hippo/debug/DebuggableScript;Lcom/trendmicro/hippo/ObjArray;)V
    .locals 2
    .param p0, "function"    # Lcom/trendmicro/hippo/debug/DebuggableScript;
    .param p1, "array"    # Lcom/trendmicro/hippo/ObjArray;

    .line 490
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 491
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p0}, Lcom/trendmicro/hippo/debug/DebuggableScript;->getFunctionCount()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 492
    invoke-interface {p0, v0}, Lcom/trendmicro/hippo/debug/DebuggableScript;->getFunction(I)Lcom/trendmicro/hippo/debug/DebuggableScript;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->collectFunctions_r(Lcom/trendmicro/hippo/debug/DebuggableScript;Lcom/trendmicro/hippo/ObjArray;)V

    .line 491
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 494
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private static do_eval(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "frame"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .param p2, "expr"    # Ljava/lang/String;

    .line 868
    const-string v0, ""

    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getDebugger()Lcom/trendmicro/hippo/debug/Debugger;

    move-result-object v1

    .line 869
    .local v1, "saved_debugger":Lcom/trendmicro/hippo/debug/Debugger;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getDebuggerContextData()Ljava/lang/Object;

    move-result-object v2

    .line 870
    .local v2, "saved_data":Ljava/lang/Object;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getOptimizationLevel()I

    move-result v3

    .line 872
    .local v3, "saved_level":I
    const/4 v4, 0x0

    invoke-virtual {p0, v4, v4}, Lcom/trendmicro/hippo/Context;->setDebugger(Lcom/trendmicro/hippo/debug/Debugger;Ljava/lang/Object;)V

    .line 873
    const/4 v5, -0x1

    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/Context;->setOptimizationLevel(I)V

    .line 874
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/Context;->setGeneratingDebug(Z)V

    .line 876
    const/4 v6, 0x1

    :try_start_0
    invoke-virtual {p0, p2, v0, v5, v4}, Lcom/trendmicro/hippo/Context;->compileString(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/Callable;

    .line 877
    .local v4, "script":Lcom/trendmicro/hippo/Callable;
    invoke-static {p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->access$1600(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    invoke-static {p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->access$1700(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v7

    sget-object v8, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v4, p0, v5, v7, v8}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 879
    .local v5, "result":Ljava/lang/Object;
    sget-object v7, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v5, v7, :cond_0

    .line 880
    nop

    .local v0, "resultString":Ljava/lang/String;
    goto :goto_0

    .line 882
    .end local v0    # "resultString":Ljava/lang/String;
    :cond_0
    invoke-static {v5}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .restart local v0    # "resultString":Ljava/lang/String;
    goto :goto_0

    .line 887
    .end local v0    # "resultString":Ljava/lang/String;
    .end local v4    # "script":Lcom/trendmicro/hippo/Callable;
    .end local v5    # "result":Ljava/lang/Object;
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 884
    :catch_0
    move-exception v0

    .line 885
    .local v0, "exc":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v0, v4

    .line 887
    .local v0, "resultString":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/Context;->setGeneratingDebug(Z)V

    .line 888
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/Context;->setOptimizationLevel(I)V

    .line 889
    invoke-virtual {p0, v1, v2}, Lcom/trendmicro/hippo/Context;->setDebugger(Lcom/trendmicro/hippo/debug/Debugger;Ljava/lang/Object;)V

    .line 890
    nop

    .line 891
    if-nez v0, :cond_1

    .line 892
    const-string v0, "null"

    .line 894
    :cond_1
    return-object v0

    .line 887
    .end local v0    # "resultString":Ljava/lang/String;
    :goto_1
    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/Context;->setGeneratingDebug(Z)V

    .line 888
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/Context;->setOptimizationLevel(I)V

    .line 889
    invoke-virtual {p0, v1, v2}, Lcom/trendmicro/hippo/Context;->setDebugger(Lcom/trendmicro/hippo/debug/Debugger;Ljava/lang/Object;)V

    .line 890
    throw v0
.end method

.method private functionSource(Lcom/trendmicro/hippo/debug/DebuggableScript;)Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    .locals 1
    .param p1, "fnOrScript"    # Lcom/trendmicro/hippo/debug/DebuggableScript;

    .line 392
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionToSource:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    return-object v0
.end method

.method private static getAllFunctions(Lcom/trendmicro/hippo/debug/DebuggableScript;)[Lcom/trendmicro/hippo/debug/DebuggableScript;
    .locals 2
    .param p0, "function"    # Lcom/trendmicro/hippo/debug/DebuggableScript;

    .line 478
    new-instance v0, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    .line 479
    .local v0, "functions":Lcom/trendmicro/hippo/ObjArray;
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->collectFunctions_r(Lcom/trendmicro/hippo/debug/DebuggableScript;Lcom/trendmicro/hippo/ObjArray;)V

    .line 480
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v1

    new-array v1, v1, [Lcom/trendmicro/hippo/debug/DebuggableScript;

    .line 481
    .local v1, "result":[Lcom/trendmicro/hippo/debug/DebuggableScript;
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ObjArray;->toArray([Ljava/lang/Object;)V

    .line 482
    return-object v1
.end method

.method private getFunctionSource(Lcom/trendmicro/hippo/debug/DebuggableScript;)Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    .locals 6
    .param p1, "fnOrScript"    # Lcom/trendmicro/hippo/debug/DebuggableScript;

    .line 261
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionSource(Lcom/trendmicro/hippo/debug/DebuggableScript;)Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    move-result-object v0

    .line 262
    .local v0, "fsource":Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    if-nez v0, :cond_1

    .line 263
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->getNormalizedUrl(Lcom/trendmicro/hippo/debug/DebuggableScript;)Ljava/lang/String;

    move-result-object v1

    .line 264
    .local v1, "url":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->sourceInfo(Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    move-result-object v2

    .line 265
    .local v2, "si":Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    if-nez v2, :cond_1

    .line 266
    invoke-interface {p1}, Lcom/trendmicro/hippo/debug/DebuggableScript;->isGeneratedScript()Z

    move-result v3

    if-nez v3, :cond_1

    .line 268
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->loadSource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 269
    .local v3, "source":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 270
    move-object v4, p1

    .line 272
    .local v4, "top":Lcom/trendmicro/hippo/debug/DebuggableScript;
    :goto_0
    invoke-interface {v4}, Lcom/trendmicro/hippo/debug/DebuggableScript;->getParent()Lcom/trendmicro/hippo/debug/DebuggableScript;

    move-result-object v5

    .line 273
    .local v5, "parent":Lcom/trendmicro/hippo/debug/DebuggableScript;
    if-nez v5, :cond_0

    .line 274
    nop

    .line 278
    .end local v5    # "parent":Lcom/trendmicro/hippo/debug/DebuggableScript;
    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/tools/debugger/Dim;->registerTopScript(Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;)V

    .line 279
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionSource(Lcom/trendmicro/hippo/debug/DebuggableScript;)Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    move-result-object v0

    goto :goto_1

    .line 276
    .restart local v5    # "parent":Lcom/trendmicro/hippo/debug/DebuggableScript;
    :cond_0
    move-object v4, v5

    .line 277
    .end local v5    # "parent":Lcom/trendmicro/hippo/debug/DebuggableScript;
    goto :goto_0

    .line 284
    .end local v1    # "url":Ljava/lang/String;
    .end local v2    # "si":Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    .end local v3    # "source":Ljava/lang/String;
    .end local v4    # "top":Lcom/trendmicro/hippo/debug/DebuggableScript;
    :cond_1
    :goto_1
    return-object v0
.end method

.method private getNormalizedUrl(Lcom/trendmicro/hippo/debug/DebuggableScript;)Ljava/lang/String;
    .locals 11
    .param p1, "fnOrScript"    # Lcom/trendmicro/hippo/debug/DebuggableScript;

    .line 422
    invoke-interface {p1}, Lcom/trendmicro/hippo/debug/DebuggableScript;->getSourceName()Ljava/lang/String;

    move-result-object v0

    .line 423
    .local v0, "url":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string v0, "<stdin>"

    goto :goto_4

    .line 429
    :cond_0
    const/16 v1, 0x23

    .line 430
    .local v1, "evalSeparator":C
    const/4 v2, 0x0

    .line 431
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    .line 432
    .local v3, "urlLength":I
    const/4 v4, 0x0

    .line 434
    .local v4, "cursor":I
    :goto_0
    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 435
    .local v5, "searchStart":I
    if-gez v5, :cond_1

    .line 436
    goto :goto_3

    .line 438
    :cond_1
    const/4 v6, 0x0

    .line 439
    .local v6, "replace":Ljava/lang/String;
    add-int/lit8 v7, v5, 0x1

    .line 440
    .local v7, "i":I
    :goto_1
    if-eq v7, v3, :cond_3

    .line 441
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 442
    .local v8, "c":I
    const/16 v9, 0x30

    if-gt v9, v8, :cond_3

    const/16 v9, 0x39

    if-le v8, v9, :cond_2

    .line 443
    goto :goto_2

    .line 445
    :cond_2
    nop

    .end local v8    # "c":I
    add-int/lit8 v7, v7, 0x1

    .line 446
    goto :goto_1

    .line 447
    :cond_3
    :goto_2
    add-int/lit8 v8, v5, 0x1

    const/4 v9, 0x0

    if-eq v7, v8, :cond_4

    .line 449
    const-string v8, "(eval)"

    const/4 v10, 0x6

    invoke-virtual {v8, v9, v0, v7, v10}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 450
    add-int/lit8 v4, v7, 0x6

    .line 451
    const-string v6, "(eval)"

    .line 454
    :cond_4
    if-nez v6, :cond_7

    .line 455
    nop

    .line 463
    .end local v5    # "searchStart":I
    .end local v6    # "replace":Ljava/lang/String;
    .end local v7    # "i":I
    :goto_3
    if-eqz v2, :cond_6

    .line 464
    if-eq v4, v3, :cond_5

    .line 465
    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 467
    :cond_5
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 470
    .end local v1    # "evalSeparator":C
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    .end local v3    # "urlLength":I
    .end local v4    # "cursor":I
    :cond_6
    :goto_4
    return-object v0

    .line 457
    .restart local v1    # "evalSeparator":C
    .restart local v2    # "sb":Ljava/lang/StringBuilder;
    .restart local v3    # "urlLength":I
    .restart local v4    # "cursor":I
    .restart local v5    # "searchStart":I
    .restart local v6    # "replace":Ljava/lang/String;
    .restart local v7    # "i":I
    :cond_7
    if-nez v2, :cond_8

    .line 458
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    move-object v2, v8

    .line 459
    invoke-virtual {v0, v9, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    :cond_8
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 462
    .end local v5    # "searchStart":I
    .end local v6    # "replace":Ljava/lang/String;
    .end local v7    # "i":I
    goto :goto_0
.end method

.method private getObjectIdsImpl(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 8
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "object"    # Ljava/lang/Object;

    .line 687
    instance-of v0, p2, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_6

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p2, v0, :cond_0

    goto :goto_1

    .line 692
    :cond_0
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    .line 693
    .local v0, "scriptable":Lcom/trendmicro/hippo/Scriptable;
    instance-of v1, v0, Lcom/trendmicro/hippo/debug/DebuggableObject;

    if-eqz v1, :cond_1

    .line 694
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/debug/DebuggableObject;

    invoke-interface {v1}, Lcom/trendmicro/hippo/debug/DebuggableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v1

    .local v1, "ids":[Ljava/lang/Object;
    goto :goto_0

    .line 696
    .end local v1    # "ids":[Ljava/lang/Object;
    :cond_1
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v1

    .line 699
    .restart local v1    # "ids":[Ljava/lang/Object;
    :goto_0
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 700
    .local v2, "proto":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 701
    .local v3, "parent":Lcom/trendmicro/hippo/Scriptable;
    const/4 v4, 0x0

    .line 702
    .local v4, "extra":I
    if-eqz v2, :cond_2

    .line 703
    add-int/lit8 v4, v4, 0x1

    .line 705
    :cond_2
    if-eqz v3, :cond_3

    .line 706
    add-int/lit8 v4, v4, 0x1

    .line 708
    :cond_3
    if-eqz v4, :cond_5

    .line 709
    array-length v5, v1

    add-int/2addr v5, v4

    new-array v5, v5, [Ljava/lang/Object;

    .line 710
    .local v5, "tmp":[Ljava/lang/Object;
    const/4 v6, 0x0

    array-length v7, v1

    invoke-static {v1, v6, v5, v4, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 711
    move-object v1, v5

    .line 712
    const/4 v4, 0x0

    .line 713
    if-eqz v2, :cond_4

    .line 714
    add-int/lit8 v6, v4, 0x1

    .end local v4    # "extra":I
    .local v6, "extra":I
    const-string v7, "__proto__"

    aput-object v7, v1, v4

    move v4, v6

    .line 716
    .end local v6    # "extra":I
    .restart local v4    # "extra":I
    :cond_4
    if-eqz v3, :cond_5

    .line 717
    add-int/lit8 v6, v4, 0x1

    .end local v4    # "extra":I
    .restart local v6    # "extra":I
    const-string v7, "__parent__"

    aput-object v7, v1, v4

    move v4, v6

    .line 721
    .end local v5    # "tmp":[Ljava/lang/Object;
    .end local v6    # "extra":I
    .restart local v4    # "extra":I
    :cond_5
    return-object v1

    .line 688
    .end local v0    # "scriptable":Lcom/trendmicro/hippo/Scriptable;
    .end local v1    # "ids":[Ljava/lang/Object;
    .end local v2    # "proto":Lcom/trendmicro/hippo/Scriptable;
    .end local v3    # "parent":Lcom/trendmicro/hippo/Scriptable;
    .end local v4    # "extra":I
    :cond_6
    :goto_1
    sget-object v0, Lcom/trendmicro/hippo/Context;->emptyArgs:[Ljava/lang/Object;

    return-object v0
.end method

.method private getObjectPropertyImpl(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "id"    # Ljava/lang/Object;

    .line 657
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    .line 659
    .local v0, "scriptable":Lcom/trendmicro/hippo/Scriptable;
    instance-of v1, p3, Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 660
    move-object v1, p3

    check-cast v1, Ljava/lang/String;

    .line 661
    .local v1, "name":Ljava/lang/String;
    const-string v2, "this"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 662
    move-object v2, v0

    .local v2, "result":Ljava/lang/Object;
    goto :goto_0

    .line 663
    .end local v2    # "result":Ljava/lang/Object;
    :cond_0
    const-string v2, "__proto__"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 664
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .restart local v2    # "result":Ljava/lang/Object;
    goto :goto_0

    .line 665
    .end local v2    # "result":Ljava/lang/Object;
    :cond_1
    const-string v2, "__parent__"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 666
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .restart local v2    # "result":Ljava/lang/Object;
    goto :goto_0

    .line 668
    .end local v2    # "result":Ljava/lang/Object;
    :cond_2
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 669
    .restart local v2    # "result":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-ne v2, v3, :cond_3

    .line 670
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 673
    .end local v1    # "name":Ljava/lang/String;
    :cond_3
    :goto_0
    goto :goto_1

    .line 674
    .end local v2    # "result":Ljava/lang/Object;
    :cond_4
    move-object v1, p3

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 675
    .local v1, "index":I
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v2

    .line 676
    .restart local v2    # "result":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-ne v2, v3, :cond_5

    .line 677
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 680
    .end local v1    # "index":I
    :cond_5
    :goto_1
    return-object v2
.end method

.method private handleBreakpointHit(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Lcom/trendmicro/hippo/Context;)V
    .locals 1
    .param p1, "frame"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 509
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->breakFlag:Z

    .line 510
    const/4 v0, 0x0

    invoke-direct {p0, p2, p1, v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->interrupted(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/Throwable;)V

    .line 511
    return-void
.end method

.method private handleExceptionThrown(Lcom/trendmicro/hippo/Context;Ljava/lang/Throwable;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)V
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "ex"    # Ljava/lang/Throwable;
    .param p3, "frame"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    .line 518
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->breakOnExceptions:Z

    if-eqz v0, :cond_0

    .line 519
    invoke-virtual {p3}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData()Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    move-result-object v0

    .line 520
    .local v0, "cd":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$300(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;)Ljava/lang/Throwable;

    move-result-object v1

    if-eq v1, p2, :cond_0

    .line 521
    invoke-direct {p0, p1, p3, p2}, Lcom/trendmicro/hippo/tools/debugger/Dim;->interrupted(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/Throwable;)V

    .line 522
    invoke-static {v0, p2}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$302(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 525
    .end local v0    # "cd":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    :cond_0
    return-void
.end method

.method private interrupted(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/Throwable;)V
    .locals 16
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "frame"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .param p3, "scriptException"    # Ljava/lang/Throwable;

    .line 729
    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData()Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    move-result-object v3

    .line 730
    .local v3, "contextData":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->callback:Lcom/trendmicro/hippo/tools/debugger/GuiCallback;

    invoke-interface {v0}, Lcom/trendmicro/hippo/tools/debugger/GuiCallback;->isGuiEventThread()Z

    move-result v4

    .line 731
    .local v4, "eventThreadFlag":Z
    invoke-static {v3, v4}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$402(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;Z)Z

    .line 733
    const/4 v5, 0x0

    .line 736
    .local v5, "recursiveEventThreadCall":Z
    iget-object v6, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->eventThreadMonitor:Ljava/lang/Object;

    monitor-enter v6

    .line 737
    if-eqz v4, :cond_0

    .line 738
    :try_start_0
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->interruptedContextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    if-eqz v0, :cond_1

    .line 739
    const/4 v5, 0x1

    .line 740
    monitor-exit v6

    move v7, v5

    goto :goto_1

    .line 743
    :cond_0
    :goto_0
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->interruptedContextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_a

    if-eqz v0, :cond_1

    .line 745
    :try_start_1
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->eventThreadMonitor:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_a

    .line 748
    goto :goto_0

    .line 746
    :catch_0
    move-exception v0

    .line 747
    .local v0, "exc":Ljava/lang/InterruptedException;
    :try_start_2
    monitor-exit v6

    return-void

    .line 751
    .end local v0    # "exc":Ljava/lang/InterruptedException;
    :cond_1
    iput-object v3, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->interruptedContextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    .line 752
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_a

    move v7, v5

    .line 754
    .end local v5    # "recursiveEventThreadCall":Z
    .local v7, "recursiveEventThreadCall":Z
    :goto_1
    if-eqz v7, :cond_2

    .line 769
    return-void

    .line 772
    :cond_2
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->interruptedContextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    if-nez v0, :cond_3

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 776
    :cond_3
    const/4 v5, 0x0

    :try_start_3
    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameCount()I

    move-result v0

    move v6, v0

    .line 777
    .local v6, "frameCount":I
    add-int/lit8 v0, v6, -0x1

    iput v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->frameIndex:I

    .line 779
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v8, v0

    .line 781
    .local v8, "threadTitle":Ljava/lang/String;
    if-nez p3, :cond_4

    .line 782
    const/4 v0, 0x0

    move-object v9, v0

    .local v0, "alertMessage":Ljava/lang/String;
    goto :goto_2

    .line 784
    .end local v0    # "alertMessage":Ljava/lang/String;
    :cond_4
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v9, v0

    .line 787
    .local v9, "alertMessage":Ljava/lang/String;
    :goto_2
    const/4 v10, -0x1

    .line 788
    .local v10, "returnValue":I
    const/4 v11, -0x1

    const/4 v12, 0x1

    if-nez v4, :cond_8

    .line 789
    iget-object v13, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->monitor:Ljava/lang/Object;

    monitor-enter v13
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_8

    .line 790
    :try_start_4
    iget-boolean v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->insideInterruptLoop:Z

    if-eqz v0, :cond_5

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 791
    :cond_5
    iput-boolean v12, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->insideInterruptLoop:Z

    .line 792
    iput-object v5, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalRequest:Ljava/lang/String;

    .line 793
    iput v11, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->returnValue:I

    .line 794
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->callback:Lcom/trendmicro/hippo/tools/debugger/GuiCallback;

    invoke-interface {v0, v2, v8, v9}, Lcom/trendmicro/hippo/tools/debugger/GuiCallback;->enterInterrupt(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 799
    :goto_3
    const/4 v14, 0x0

    :try_start_5
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->monitor:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 803
    nop

    .line 804
    :try_start_6
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalRequest:Ljava/lang/String;

    if-eqz v0, :cond_6

    .line 805
    iput-object v5, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalResult:Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 807
    :try_start_7
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalFrame:Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    iget-object v15, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalRequest:Ljava/lang/String;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    move-object/from16 v12, p1

    :try_start_8
    invoke-static {v12, v0, v15}, Lcom/trendmicro/hippo/tools/debugger/Dim;->do_eval(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalResult:Ljava/lang/String;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 810
    :try_start_9
    iput-object v5, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalRequest:Ljava/lang/String;

    .line 811
    iput-object v5, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalFrame:Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    .line 812
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->monitor:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 813
    nop

    .line 814
    const/4 v12, 0x1

    goto :goto_3

    .line 810
    :catchall_0
    move-exception v0

    goto :goto_4

    :catchall_1
    move-exception v0

    move-object/from16 v12, p1

    :goto_4
    iput-object v5, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalRequest:Ljava/lang/String;

    .line 811
    iput-object v5, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalFrame:Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    .line 812
    iget-object v11, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->monitor:Ljava/lang/Object;

    invoke-virtual {v11}, Ljava/lang/Object;->notify()V

    .line 813
    nop

    .end local v3    # "contextData":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .end local v4    # "eventThreadFlag":Z
    .end local v6    # "frameCount":I
    .end local v7    # "recursiveEventThreadCall":Z
    .end local v8    # "threadTitle":Ljava/lang/String;
    .end local v9    # "alertMessage":Ljava/lang/String;
    .end local v10    # "returnValue":I
    .end local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p2    # "frame":Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .end local p3    # "scriptException":Ljava/lang/Throwable;
    throw v0

    .line 816
    .restart local v3    # "contextData":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .restart local v4    # "eventThreadFlag":Z
    .restart local v6    # "frameCount":I
    .restart local v7    # "recursiveEventThreadCall":Z
    .restart local v8    # "threadTitle":Ljava/lang/String;
    .restart local v9    # "alertMessage":Ljava/lang/String;
    .restart local v10    # "returnValue":I
    .restart local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p2    # "frame":Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .restart local p3    # "scriptException":Ljava/lang/Throwable;
    :cond_6
    move-object/from16 v12, p1

    iget v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->returnValue:I

    if-eq v0, v11, :cond_7

    .line 817
    iget v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->returnValue:I

    .line 818
    .end local v10    # "returnValue":I
    .local v0, "returnValue":I
    move v10, v0

    goto :goto_5

    .line 816
    .end local v0    # "returnValue":I
    .restart local v10    # "returnValue":I
    :cond_7
    const/4 v12, 0x1

    goto :goto_3

    .line 822
    :catchall_2
    move-exception v0

    move-object/from16 v12, p1

    goto :goto_6

    .line 800
    :catch_1
    move-exception v0

    move-object/from16 v12, p1

    .line 801
    .local v0, "exc":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Thread;->interrupt()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 802
    nop

    .line 822
    .end local v0    # "exc":Ljava/lang/InterruptedException;
    :goto_5
    :try_start_a
    iput-boolean v14, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->insideInterruptLoop:Z

    .line 823
    nop

    .line 824
    monitor-exit v13

    goto :goto_a

    .line 822
    :catchall_3
    move-exception v0

    :goto_6
    iput-boolean v14, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->insideInterruptLoop:Z

    .line 823
    nop

    .end local v3    # "contextData":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .end local v4    # "eventThreadFlag":Z
    .end local v6    # "frameCount":I
    .end local v7    # "recursiveEventThreadCall":Z
    .end local v8    # "threadTitle":Ljava/lang/String;
    .end local v9    # "alertMessage":Ljava/lang/String;
    .end local v10    # "returnValue":I
    .end local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p2    # "frame":Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .end local p3    # "scriptException":Ljava/lang/Throwable;
    throw v0

    .line 824
    .restart local v3    # "contextData":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .restart local v4    # "eventThreadFlag":Z
    .restart local v6    # "frameCount":I
    .restart local v7    # "recursiveEventThreadCall":Z
    .restart local v8    # "threadTitle":Ljava/lang/String;
    .restart local v9    # "alertMessage":Ljava/lang/String;
    .restart local v10    # "returnValue":I
    .restart local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p2    # "frame":Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .restart local p3    # "scriptException":Ljava/lang/Throwable;
    :catchall_4
    move-exception v0

    move-object/from16 v12, p1

    :goto_7
    monitor-exit v13
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    .end local v3    # "contextData":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .end local v4    # "eventThreadFlag":Z
    .end local v7    # "recursiveEventThreadCall":Z
    .end local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p2    # "frame":Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .end local p3    # "scriptException":Ljava/lang/Throwable;
    :try_start_b
    throw v0

    .restart local v3    # "contextData":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .restart local v4    # "eventThreadFlag":Z
    .restart local v7    # "recursiveEventThreadCall":Z
    .restart local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p2    # "frame":Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .restart local p3    # "scriptException":Ljava/lang/Throwable;
    :catchall_5
    move-exception v0

    goto :goto_7

    .line 826
    :cond_8
    move-object/from16 v12, p1

    iput v11, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->returnValue:I

    .line 827
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->callback:Lcom/trendmicro/hippo/tools/debugger/GuiCallback;

    invoke-interface {v0, v2, v8, v9}, Lcom/trendmicro/hippo/tools/debugger/GuiCallback;->enterInterrupt(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/String;Ljava/lang/String;)V

    .line 828
    :goto_8
    iget v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->returnValue:I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    if-ne v0, v11, :cond_9

    .line 830
    :try_start_c
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->callback:Lcom/trendmicro/hippo/tools/debugger/GuiCallback;

    invoke-interface {v0}, Lcom/trendmicro/hippo/tools/debugger/GuiCallback;->dispatchNextGuiEvent()V
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_7

    goto :goto_9

    .line 831
    :catch_2
    move-exception v0

    .line 832
    :goto_9
    goto :goto_8

    .line 834
    :cond_9
    :try_start_d
    iget v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->returnValue:I

    move v10, v0

    .line 836
    :goto_a
    if-eqz v10, :cond_c

    const/4 v13, 0x1

    if-eq v10, v13, :cond_b

    const/4 v0, 0x2

    if-eq v10, v0, :cond_a

    goto :goto_b

    .line 846
    :cond_a
    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameCount()I

    move-result v0

    if-le v0, v13, :cond_d

    .line 847
    invoke-static {v3, v13}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$1402(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;Z)Z

    .line 848
    nop

    .line 849
    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameCount()I

    move-result v0

    sub-int/2addr v0, v13

    .line 848
    invoke-static {v3, v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$1502(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;I)I

    goto :goto_b

    .line 842
    :cond_b
    const/4 v13, 0x1

    invoke-static {v3, v13}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$1402(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;Z)Z

    .line 843
    invoke-static {v3, v11}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$1502(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;I)I

    .line 844
    goto :goto_b

    .line 838
    :cond_c
    const/4 v11, 0x1

    invoke-static {v3, v11}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$1402(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;Z)Z

    .line 839
    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameCount()I

    move-result v0

    invoke-static {v3, v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$1502(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;I)I
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 840
    nop

    .line 855
    .end local v6    # "frameCount":I
    .end local v8    # "threadTitle":Ljava/lang/String;
    .end local v9    # "alertMessage":Ljava/lang/String;
    .end local v10    # "returnValue":I
    :cond_d
    :goto_b
    iget-object v6, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->eventThreadMonitor:Ljava/lang/Object;

    monitor-enter v6

    .line 856
    :try_start_e
    iput-object v5, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->interruptedContextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    .line 857
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->eventThreadMonitor:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 858
    monitor-exit v6

    .line 859
    nop

    .line 861
    return-void

    .line 858
    :catchall_6
    move-exception v0

    monitor-exit v6
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    throw v0

    .line 855
    :catchall_7
    move-exception v0

    goto :goto_c

    :catchall_8
    move-exception v0

    move-object/from16 v12, p1

    :goto_c
    iget-object v8, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->eventThreadMonitor:Ljava/lang/Object;

    monitor-enter v8

    .line 856
    :try_start_f
    iput-object v5, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->interruptedContextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    .line 857
    iget-object v5, v1, Lcom/trendmicro/hippo/tools/debugger/Dim;->eventThreadMonitor:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->notifyAll()V

    .line 858
    monitor-exit v8
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    .line 859
    throw v0

    .line 858
    :catchall_9
    move-exception v0

    :try_start_10
    monitor-exit v8
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_9

    throw v0

    .line 752
    .end local v7    # "recursiveEventThreadCall":Z
    .restart local v5    # "recursiveEventThreadCall":Z
    :catchall_a
    move-exception v0

    move-object/from16 v12, p1

    :goto_d
    :try_start_11
    monitor-exit v6
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_b

    throw v0

    :catchall_b
    move-exception v0

    goto :goto_d
.end method

.method private loadSource(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "sourceUrl"    # Ljava/lang/String;

    .line 291
    const/4 v0, 0x0

    .line 292
    .local v0, "source":Ljava/lang/String;
    const/16 v1, 0x23

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 293
    .local v1, "hash":I
    if-ltz v1, :cond_0

    .line 294
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 300
    :cond_0
    const/16 v2, 0x3a

    :try_start_0
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    if-gez v2, :cond_5

    .line 303
    :try_start_1
    const-string v2, "~/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 304
    const-string v2, "user.home"

    invoke-static {v2}, Lcom/trendmicro/hippo/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 305
    .local v2, "home":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 306
    const/4 v3, 0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 307
    .local v3, "pathFromHome":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v5, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 308
    .local v4, "f":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 309
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 310
    .local v5, "is":Ljava/io/InputStream;
    goto :goto_2

    .line 314
    .end local v2    # "home":Ljava/lang/String;
    .end local v3    # "pathFromHome":Ljava/lang/String;
    .end local v4    # "f":Ljava/io/File;
    .end local v5    # "is":Ljava/io/InputStream;
    :cond_1
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 315
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 316
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v5, v3

    .line 317
    .restart local v5    # "is":Ljava/io/InputStream;
    goto :goto_2

    .line 315
    .end local v2    # "f":Ljava/io/File;
    .end local v5    # "is":Ljava/io/InputStream;
    :cond_2
    goto :goto_0

    .line 319
    :catch_0
    move-exception v2

    :goto_0
    nop

    .line 321
    :try_start_2
    const-string v2, "//"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 322
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object p1, v2

    goto :goto_1

    .line 323
    :cond_3
    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 324
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://127.0.0.1"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object p1, v2

    goto :goto_1

    .line 326
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object p1, v2

    .line 330
    :cond_5
    :goto_1
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    move-object v5, v2

    .line 334
    .restart local v5    # "is":Ljava/io/InputStream;
    :goto_2
    :try_start_3
    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-static {v2}, Lcom/trendmicro/hippo/Kit;->readReader(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v0, v2

    .line 336
    :try_start_4
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 337
    nop

    .line 341
    .end local v5    # "is":Ljava/io/InputStream;
    goto :goto_3

    .line 336
    .restart local v5    # "is":Ljava/io/InputStream;
    :catchall_0
    move-exception v2

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 337
    nop

    .end local v0    # "source":Ljava/lang/String;
    .end local v1    # "hash":I
    .end local p1    # "sourceUrl":Ljava/lang/String;
    throw v2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 338
    .end local v5    # "is":Ljava/io/InputStream;
    .restart local v0    # "source":Ljava/lang/String;
    .restart local v1    # "hash":I
    .restart local p1    # "sourceUrl":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 339
    .local v2, "ex":Ljava/io/IOException;
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to load source from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 340
    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 342
    .end local v2    # "ex":Ljava/io/IOException;
    :goto_3
    return-object v0
.end method

.method private registerTopScript(Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;)V
    .locals 9
    .param p1, "topScript"    # Lcom/trendmicro/hippo/debug/DebuggableScript;
    .param p2, "source"    # Ljava/lang/String;

    .line 349
    invoke-interface {p1}, Lcom/trendmicro/hippo/debug/DebuggableScript;->isTopLevel()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 352
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->getNormalizedUrl(Lcom/trendmicro/hippo/debug/DebuggableScript;)Ljava/lang/String;

    move-result-object v0

    .line 353
    .local v0, "url":Ljava/lang/String;
    invoke-static {p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->getAllFunctions(Lcom/trendmicro/hippo/debug/DebuggableScript;)[Lcom/trendmicro/hippo/debug/DebuggableScript;

    move-result-object v1

    .line 354
    .local v1, "functions":[Lcom/trendmicro/hippo/debug/DebuggableScript;
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->sourceProvider:Lcom/trendmicro/hippo/tools/debugger/SourceProvider;

    if-eqz v2, :cond_0

    .line 355
    invoke-interface {v2, p1}, Lcom/trendmicro/hippo/tools/debugger/SourceProvider;->getSource(Lcom/trendmicro/hippo/debug/DebuggableScript;)Ljava/lang/String;

    move-result-object v2

    .line 356
    .local v2, "providedSource":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 357
    move-object p2, v2

    goto :goto_0

    .line 361
    .end local v2    # "providedSource":Ljava/lang/String;
    :cond_0
    move-object v2, p2

    .end local p2    # "source":Ljava/lang/String;
    .local v2, "source":Ljava/lang/String;
    :goto_0
    new-instance p2, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    const/4 v3, 0x0

    invoke-direct {p2, v2, v1, v0, v3}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;-><init>(Ljava/lang/String;[Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;Lcom/trendmicro/hippo/tools/debugger/Dim$1;)V

    move-object v3, p2

    .line 363
    .local v3, "sourceInfo":Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->urlToSourceInfo:Ljava/util/Map;

    monitor-enter v4

    .line 364
    :try_start_0
    iget-object p2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->urlToSourceInfo:Ljava/util/Map;

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 365
    .local p2, "old":Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    if-eqz p2, :cond_1

    .line 366
    invoke-static {v3, p2}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->access$200(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)V

    .line 368
    :cond_1
    iget-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->urlToSourceInfo:Ljava/util/Map;

    invoke-interface {v5, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->functionSourcesTop()I

    move-result v6

    if-eq v5, v6, :cond_3

    .line 370
    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->functionSource(I)Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    move-result-object v6

    .line 371
    .local v6, "fsource":Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    invoke-virtual {v6}, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->name()Ljava/lang/String;

    move-result-object v7

    .line 372
    .local v7, "name":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_2

    .line 373
    iget-object v8, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionNames:Ljava/util/Map;

    invoke-interface {v8, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    .end local v6    # "fsource":Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    .end local v7    # "name":Ljava/lang/String;
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 376
    .end local v5    # "i":I
    .end local p2    # "old":Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    :cond_3
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 378
    iget-object p2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionToSource:Ljava/util/Map;

    monitor-enter p2

    .line 379
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    :try_start_1
    array-length v5, v1

    if-eq v4, v5, :cond_4

    .line 380
    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->functionSource(I)Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    move-result-object v5

    .line 381
    .local v5, "fsource":Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    iget-object v6, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionToSource:Ljava/util/Map;

    aget-object v7, v1, v4

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    nop

    .end local v5    # "fsource":Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 383
    .end local v4    # "i":I
    :cond_4
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 385
    iget-object p2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->callback:Lcom/trendmicro/hippo/tools/debugger/GuiCallback;

    invoke-interface {p2, v3}, Lcom/trendmicro/hippo/tools/debugger/GuiCallback;->updateSourceText(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)V

    .line 386
    return-void

    .line 383
    :catchall_0
    move-exception v4

    :try_start_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 376
    :catchall_1
    move-exception p2

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p2

    .line 350
    .end local v0    # "url":Ljava/lang/String;
    .end local v1    # "functions":[Lcom/trendmicro/hippo/debug/DebuggableScript;
    .end local v2    # "source":Ljava/lang/String;
    .end local v3    # "sourceInfo":Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    .local p2, "source":Ljava/lang/String;
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method public attachTo(Lcom/trendmicro/hippo/ContextFactory;)V
    .locals 3
    .param p1, "factory"    # Lcom/trendmicro/hippo/ContextFactory;

    .line 233
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->detach()V

    .line 234
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->contextFactory:Lcom/trendmicro/hippo/ContextFactory;

    .line 235
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim;ILcom/trendmicro/hippo/tools/debugger/Dim$1;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->listener:Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    .line 236
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ContextFactory;->addListener(Lcom/trendmicro/hippo/ContextFactory$Listener;)V

    .line 237
    return-void
.end method

.method public clearAllBreakpoints()V
    .locals 2

    .line 500
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->urlToSourceInfo:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 501
    .local v1, "si":Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->removeAllBreakpoints()V

    .line 502
    .end local v1    # "si":Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    goto :goto_0

    .line 503
    :cond_0
    return-void
.end method

.method public compileScript(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;

    .line 595
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim;ILcom/trendmicro/hippo/tools/debugger/Dim$1;)V

    .line 596
    .local v0, "action":Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;
    invoke-static {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$502(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/String;)Ljava/lang/String;

    .line 597
    invoke-static {v0, p2}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$602(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/String;)Ljava/lang/String;

    .line 598
    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$700(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)V

    .line 599
    return-void
.end method

.method public contextSwitch(I)V
    .locals 0
    .param p1, "frameIndex"    # I

    .line 205
    iput p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->frameIndex:I

    .line 206
    return-void
.end method

.method public currentContextData()Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .locals 1

    .line 531
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->interruptedContextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    return-object v0
.end method

.method public detach()V
    .locals 2

    .line 243
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->listener:Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    if-eqz v0, :cond_0

    .line 244
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->contextFactory:Lcom/trendmicro/hippo/ContextFactory;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/ContextFactory;->removeListener(Lcom/trendmicro/hippo/ContextFactory$Listener;)V

    .line 245
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->contextFactory:Lcom/trendmicro/hippo/ContextFactory;

    .line 246
    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->listener:Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    .line 248
    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 0

    .line 254
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->detach()V

    .line 255
    return-void
.end method

.method public eval(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "expr"    # Ljava/lang/String;

    .line 558
    const-string v0, "undefined"

    .line 559
    .local v0, "result":Ljava/lang/String;
    if-nez p1, :cond_0

    .line 560
    return-object v0

    .line 562
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->currentContextData()Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    move-result-object v1

    .line 563
    .local v1, "contextData":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    if-eqz v1, :cond_5

    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->frameIndex:I

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameCount()I

    move-result v3

    if-lt v2, v3, :cond_1

    goto :goto_2

    .line 566
    :cond_1
    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->frameIndex:I

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->getFrame(I)Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    move-result-object v2

    .line 567
    .local v2, "frame":Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    invoke-static {v1}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$400(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 568
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v3

    .line 569
    .local v3, "cx":Lcom/trendmicro/hippo/Context;
    invoke-static {v3, v2, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->do_eval(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 570
    .end local v3    # "cx":Lcom/trendmicro/hippo/Context;
    goto :goto_1

    .line 571
    :cond_2
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->monitor:Ljava/lang/Object;

    monitor-enter v3

    .line 572
    :try_start_0
    iget-boolean v4, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->insideInterruptLoop:Z

    if-eqz v4, :cond_4

    .line 573
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalRequest:Ljava/lang/String;

    .line 574
    iput-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalFrame:Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    .line 575
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->monitor:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 578
    :cond_3
    :try_start_1
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->monitor:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 582
    nop

    .line 583
    :try_start_2
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalRequest:Ljava/lang/String;

    if-nez v4, :cond_3

    goto :goto_0

    .line 579
    :catch_0
    move-exception v4

    .line 580
    .local v4, "exc":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->interrupt()V

    .line 581
    nop

    .line 584
    .end local v4    # "exc":Ljava/lang/InterruptedException;
    :goto_0
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalResult:Ljava/lang/String;

    move-object v0, v4

    .line 586
    :cond_4
    monitor-exit v3

    .line 588
    :goto_1
    return-object v0

    .line 586
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 564
    .end local v2    # "frame":Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    :cond_5
    :goto_2
    return-object v0
.end method

.method public evalScript(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;

    .line 605
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim;ILcom/trendmicro/hippo/tools/debugger/Dim$1;)V

    .line 606
    .local v0, "action":Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;
    invoke-static {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$502(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/String;)Ljava/lang/String;

    .line 607
    invoke-static {v0, p2}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$602(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/String;)Ljava/lang/String;

    .line 608
    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$700(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)V

    .line 609
    return-void
.end method

.method public functionNames()[Ljava/lang/String;
    .locals 3

    .line 399
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->urlToSourceInfo:Ljava/util/Map;

    monitor-enter v0

    .line 400
    :try_start_0
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionNames:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionNames:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    monitor-exit v0

    return-object v1

    .line 401
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public functionSourceByName(Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    .locals 1
    .param p1, "functionName"    # Ljava/lang/String;

    .line 408
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionNames:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    return-object v0
.end method

.method public getObjectIds(Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 3
    .param p1, "object"    # Ljava/lang/Object;

    .line 646
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    const/4 v1, 0x7

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim;ILcom/trendmicro/hippo/tools/debugger/Dim$1;)V

    .line 647
    .local v0, "action":Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;
    invoke-static {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$802(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/Object;)Ljava/lang/Object;

    .line 648
    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$700(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)V

    .line 649
    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$1300(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getObjectProperty(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "id"    # Ljava/lang/Object;

    .line 635
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    const/4 v1, 0x6

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim;ILcom/trendmicro/hippo/tools/debugger/Dim$1;)V

    .line 636
    .local v0, "action":Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;
    invoke-static {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$802(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/Object;)Ljava/lang/Object;

    .line 637
    invoke-static {v0, p2}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$1102(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/Object;)Ljava/lang/Object;

    .line 638
    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$700(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)V

    .line 639
    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$1200(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public go()V
    .locals 2

    .line 548
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->monitor:Ljava/lang/Object;

    monitor-enter v0

    .line 549
    const/4 v1, 0x3

    :try_start_0
    iput v1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->returnValue:I

    .line 550
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->monitor:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 551
    monitor-exit v0

    .line 552
    return-void

    .line 551
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public objectToString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 3
    .param p1, "object"    # Ljava/lang/Object;

    .line 615
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    const/4 v1, 0x5

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim;ILcom/trendmicro/hippo/tools/debugger/Dim$1;)V

    .line 616
    .local v0, "action":Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;
    invoke-static {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$802(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/Object;)Ljava/lang/Object;

    .line 617
    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$700(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)V

    .line 618
    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$900(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public setBreak()V
    .locals 1

    .line 184
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->breakFlag:Z

    .line 185
    return-void
.end method

.method public setBreakOnEnter(Z)V
    .locals 0
    .param p1, "breakOnEnter"    # Z

    .line 219
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->breakOnEnter:Z

    .line 220
    return-void
.end method

.method public setBreakOnExceptions(Z)V
    .locals 0
    .param p1, "breakOnExceptions"    # Z

    .line 212
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->breakOnExceptions:Z

    .line 213
    return-void
.end method

.method public setBreakOnReturn(Z)V
    .locals 0
    .param p1, "breakOnReturn"    # Z

    .line 226
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->breakOnReturn:Z

    .line 227
    return-void
.end method

.method public setGuiCallback(Lcom/trendmicro/hippo/tools/debugger/GuiCallback;)V
    .locals 0
    .param p1, "callback"    # Lcom/trendmicro/hippo/tools/debugger/GuiCallback;

    .line 177
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->callback:Lcom/trendmicro/hippo/tools/debugger/GuiCallback;

    .line 178
    return-void
.end method

.method public setReturnValue(I)V
    .locals 2
    .param p1, "returnValue"    # I

    .line 538
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->monitor:Ljava/lang/Object;

    monitor-enter v0

    .line 539
    :try_start_0
    iput p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->returnValue:I

    .line 540
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->monitor:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 541
    monitor-exit v0

    .line 542
    return-void

    .line 541
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setScopeProvider(Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;)V
    .locals 0
    .param p1, "scopeProvider"    # Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;

    .line 191
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->scopeProvider:Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;

    .line 192
    return-void
.end method

.method public setSourceProvider(Lcom/trendmicro/hippo/tools/debugger/SourceProvider;)V
    .locals 0
    .param p1, "sourceProvider"    # Lcom/trendmicro/hippo/tools/debugger/SourceProvider;

    .line 198
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->sourceProvider:Lcom/trendmicro/hippo/tools/debugger/SourceProvider;

    .line 199
    return-void
.end method

.method public sourceInfo(Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .line 415
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim;->urlToSourceInfo:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    return-object v0
.end method

.method public stringIsCompilableUnit(Ljava/lang/String;)Z
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .line 625
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    const/4 v1, 0x4

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim;ILcom/trendmicro/hippo/tools/debugger/Dim$1;)V

    .line 626
    .local v0, "action":Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;
    invoke-static {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$602(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/String;)Ljava/lang/String;

    .line 627
    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$700(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)V

    .line 628
    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->access$1000(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)Z

    move-result v1

    return v1
.end method
