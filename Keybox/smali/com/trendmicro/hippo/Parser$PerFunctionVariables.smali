.class public Lcom/trendmicro/hippo/Parser$PerFunctionVariables;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "PerFunctionVariables"
.end annotation


# instance fields
.field private savedCurrentScope:Lcom/trendmicro/hippo/ast/Scope;

.field private savedCurrentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

.field private savedEndFlags:I

.field private savedInForInit:Z

.field private savedLabelSet:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/ast/LabeledStatement;",
            ">;"
        }
    .end annotation
.end field

.field private savedLoopAndSwitchSet:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Jump;",
            ">;"
        }
    .end annotation
.end field

.field private savedLoopSet:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Loop;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/trendmicro/hippo/Parser;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/Parser;Lcom/trendmicro/hippo/ast/FunctionNode;)V
    .locals 2
    .param p1, "this$0"    # Lcom/trendmicro/hippo/Parser;
    .param p2, "fnNode"    # Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 3952
    iput-object p1, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->this$0:Lcom/trendmicro/hippo/Parser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3953
    iget-object v0, p1, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedCurrentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 3954
    iput-object p2, p1, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 3956
    iget-object v0, p1, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedCurrentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 3957
    iput-object p2, p1, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 3959
    invoke-static {p1}, Lcom/trendmicro/hippo/Parser;->access$200(Lcom/trendmicro/hippo/Parser;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedLabelSet:Ljava/util/Map;

    .line 3960
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/Parser;->access$202(Lcom/trendmicro/hippo/Parser;Ljava/util/Map;)Ljava/util/Map;

    .line 3962
    invoke-static {p1}, Lcom/trendmicro/hippo/Parser;->access$300(Lcom/trendmicro/hippo/Parser;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedLoopSet:Ljava/util/List;

    .line 3963
    invoke-static {p1, v0}, Lcom/trendmicro/hippo/Parser;->access$302(Lcom/trendmicro/hippo/Parser;Ljava/util/List;)Ljava/util/List;

    .line 3965
    invoke-static {p1}, Lcom/trendmicro/hippo/Parser;->access$400(Lcom/trendmicro/hippo/Parser;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedLoopAndSwitchSet:Ljava/util/List;

    .line 3966
    invoke-static {p1, v0}, Lcom/trendmicro/hippo/Parser;->access$402(Lcom/trendmicro/hippo/Parser;Ljava/util/List;)Ljava/util/List;

    .line 3968
    invoke-static {p1}, Lcom/trendmicro/hippo/Parser;->access$500(Lcom/trendmicro/hippo/Parser;)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedEndFlags:I

    .line 3969
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/Parser;->access$502(Lcom/trendmicro/hippo/Parser;I)I

    .line 3971
    invoke-static {p1}, Lcom/trendmicro/hippo/Parser;->access$600(Lcom/trendmicro/hippo/Parser;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedInForInit:Z

    .line 3972
    invoke-static {p1, v0}, Lcom/trendmicro/hippo/Parser;->access$602(Lcom/trendmicro/hippo/Parser;Z)Z

    .line 3973
    return-void
.end method


# virtual methods
.method restore()V
    .locals 2

    .line 3976
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->this$0:Lcom/trendmicro/hippo/Parser;

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedCurrentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    iput-object v1, v0, Lcom/trendmicro/hippo/Parser;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 3977
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->this$0:Lcom/trendmicro/hippo/Parser;

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedCurrentScope:Lcom/trendmicro/hippo/ast/Scope;

    iput-object v1, v0, Lcom/trendmicro/hippo/Parser;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 3978
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->this$0:Lcom/trendmicro/hippo/Parser;

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedLabelSet:Ljava/util/Map;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/Parser;->access$202(Lcom/trendmicro/hippo/Parser;Ljava/util/Map;)Ljava/util/Map;

    .line 3979
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->this$0:Lcom/trendmicro/hippo/Parser;

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedLoopSet:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/Parser;->access$302(Lcom/trendmicro/hippo/Parser;Ljava/util/List;)Ljava/util/List;

    .line 3980
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->this$0:Lcom/trendmicro/hippo/Parser;

    iget-object v1, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedLoopAndSwitchSet:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/Parser;->access$402(Lcom/trendmicro/hippo/Parser;Ljava/util/List;)Ljava/util/List;

    .line 3981
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->this$0:Lcom/trendmicro/hippo/Parser;

    iget v1, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedEndFlags:I

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/Parser;->access$502(Lcom/trendmicro/hippo/Parser;I)I

    .line 3982
    iget-object v0, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->this$0:Lcom/trendmicro/hippo/Parser;

    iget-boolean v1, p0, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->savedInForInit:Z

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/Parser;->access$602(Lcom/trendmicro/hippo/Parser;Z)Z

    .line 3983
    return-void
.end method
