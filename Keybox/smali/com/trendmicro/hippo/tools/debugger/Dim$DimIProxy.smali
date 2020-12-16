.class Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;
.super Ljava/lang/Object;
.source "Dim.java"

# interfaces
.implements Lcom/trendmicro/hippo/ContextAction;
.implements Lcom/trendmicro/hippo/ContextFactory$Listener;
.implements Lcom/trendmicro/hippo/debug/Debugger;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/Dim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DimIProxy"
.end annotation


# instance fields
.field private booleanResult:Z

.field private dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

.field private id:Ljava/lang/Object;

.field private object:Ljava/lang/Object;

.field private objectArrayResult:[Ljava/lang/Object;

.field private objectResult:Ljava/lang/Object;

.field private stringResult:Ljava/lang/String;

.field private text:Ljava/lang/String;

.field private type:I

.field private url:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/trendmicro/hippo/tools/debugger/Dim;I)V
    .locals 0
    .param p1, "dim"    # Lcom/trendmicro/hippo/tools/debugger/Dim;
    .param p2, "type"    # I

    .line 958
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 959
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    .line 960
    iput p2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->type:I

    .line 961
    return-void
.end method

.method synthetic constructor <init>(Lcom/trendmicro/hippo/tools/debugger/Dim;ILcom/trendmicro/hippo/tools/debugger/Dim$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/trendmicro/hippo/tools/debugger/Dim$1;

    .line 901
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim;I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)Z
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    .line 901
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->booleanResult:Z

    return v0
.end method

.method static synthetic access$1102(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;
    .param p1, "x1"    # Ljava/lang/Object;

    .line 901
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->id:Ljava/lang/Object;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    .line 901
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->objectResult:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)[Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    .line 901
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->objectArrayResult:[Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$502(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;
    .param p1, "x1"    # Ljava/lang/String;

    .line 901
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->url:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$602(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;
    .param p1, "x1"    # Ljava/lang/String;

    .line 901
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->text:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$700(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)V
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    .line 901
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->withContext()V

    return-void
.end method

.method static synthetic access$802(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;
    .param p1, "x1"    # Ljava/lang/Object;

    .line 901
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->object:Ljava/lang/Object;

    return-object p1
.end method

.method static synthetic access$900(Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    .line 901
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->stringResult:Ljava/lang/String;

    return-object v0
.end method

.method private withContext()V
    .locals 1

    .line 1022
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$2100(Lcom/trendmicro/hippo/tools/debugger/Dim;)Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/ContextFactory;->call(Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;

    .line 1023
    return-void
.end method


# virtual methods
.method public contextCreated(Lcom/trendmicro/hippo/Context;)V
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1031
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->type:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1032
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    invoke-direct {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;-><init>()V

    .line 1033
    .local v0, "contextData":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    new-instance v2, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim;I)V

    .line 1034
    .local v2, "debugger":Lcom/trendmicro/hippo/debug/Debugger;
    invoke-virtual {p1, v2, v0}, Lcom/trendmicro/hippo/Context;->setDebugger(Lcom/trendmicro/hippo/debug/Debugger;Ljava/lang/Object;)V

    .line 1035
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/Context;->setGeneratingDebug(Z)V

    .line 1036
    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/Context;->setOptimizationLevel(I)V

    .line 1037
    return-void
.end method

.method public contextReleased(Lcom/trendmicro/hippo/Context;)V
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1043
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->type:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1044
    :cond_0
    return-void
.end method

.method public getFrame(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/debug/DebuggableScript;)Lcom/trendmicro/hippo/debug/DebugFrame;
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "fnOrScript"    # Lcom/trendmicro/hippo/debug/DebuggableScript;

    .line 1052
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->type:I

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1054
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v0, p2}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$2200(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/debug/DebuggableScript;)Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    move-result-object v0

    .line 1055
    .local v0, "item":Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 1057
    return-object v1

    .line 1059
    :cond_1
    new-instance v2, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-direct {v2, p1, v3, v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;-><init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;Lcom/trendmicro/hippo/tools/debugger/Dim$1;)V

    return-object v2
.end method

.method public handleCompilationDone(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "fnOrScript"    # Lcom/trendmicro/hippo/debug/DebuggableScript;
    .param p3, "source"    # Ljava/lang/String;

    .line 1068
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->type:I

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1070
    :cond_0
    invoke-interface {p2}, Lcom/trendmicro/hippo/debug/DebuggableScript;->isTopLevel()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1071
    return-void

    .line 1073
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v0, p2, p3}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$2400(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;)V

    .line 1074
    return-void
.end method

.method public run(Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 8
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 969
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->type:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    .line 1012
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 1008
    :pswitch_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->object:Ljava/lang/Object;

    invoke-static {v0, p1, v2}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$2000(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->objectArrayResult:[Ljava/lang/Object;

    .line 1009
    goto/16 :goto_0

    .line 1004
    :pswitch_1
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->object:Ljava/lang/Object;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->id:Ljava/lang/Object;

    invoke-static {v0, p1, v2, v3}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$1900(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->objectResult:Ljava/lang/Object;

    .line 1005
    goto :goto_0

    .line 992
    :pswitch_2
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->object:Ljava/lang/Object;

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v2, :cond_0

    .line 993
    const-string v0, "undefined"

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->stringResult:Ljava/lang/String;

    goto :goto_0

    .line 994
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->object:Ljava/lang/Object;

    if-nez v0, :cond_1

    .line 995
    const-string v0, "null"

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->stringResult:Ljava/lang/String;

    goto :goto_0

    .line 996
    :cond_1
    instance-of v2, v0, Lcom/trendmicro/hippo/NativeCall;

    if-eqz v2, :cond_2

    .line 997
    const-string v0, "[object Call]"

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->stringResult:Ljava/lang/String;

    goto :goto_0

    .line 999
    :cond_2
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->stringResult:Ljava/lang/String;

    .line 1001
    goto :goto_0

    .line 988
    :pswitch_3
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Context;->stringIsCompilableUnit(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->booleanResult:Z

    .line 989
    goto :goto_0

    .line 976
    :pswitch_4
    const/4 v0, 0x0

    .line 977
    .local v0, "scope":Lcom/trendmicro/hippo/Scriptable;
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v2}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$1800(Lcom/trendmicro/hippo/tools/debugger/Dim;)Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 978
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v2}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$1800(Lcom/trendmicro/hippo/tools/debugger/Dim;)Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;->getScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 980
    :cond_3
    if-nez v0, :cond_4

    .line 981
    new-instance v2, Lcom/trendmicro/hippo/ImporterTopLevel;

    invoke-direct {v2, p1}, Lcom/trendmicro/hippo/ImporterTopLevel;-><init>(Lcom/trendmicro/hippo/Context;)V

    move-object v0, v2

    .line 983
    :cond_4
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->text:Ljava/lang/String;

    iget-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->url:Ljava/lang/String;

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v2, p1

    move-object v3, v0

    invoke-virtual/range {v2 .. v7}, Lcom/trendmicro/hippo/Context;->evaluateString(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;

    .line 985
    .end local v0    # "scope":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_0

    .line 971
    :pswitch_5
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->text:Ljava/lang/String;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$DimIProxy;->url:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-virtual {p1, v0, v2, v3, v1}, Lcom/trendmicro/hippo/Context;->compileString(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    .line 972
    nop

    .line 1014
    :goto_0
    return-object v1

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
