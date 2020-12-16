.class public Lcom/trendmicro/hippo/IdFunctionObject;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "IdFunctionObject.java"


# static fields
.field private static final serialVersionUID:J = -0x4a002e39945f012bL


# instance fields
.field private arity:I

.field private functionName:Ljava/lang/String;

.field private final idcall:Lcom/trendmicro/hippo/IdFunctionCall;

.field private final methodId:I

.field private final tag:Ljava/lang/Object;

.field private useCallAsConstructor:Z


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;II)V
    .locals 1
    .param p1, "idcall"    # Lcom/trendmicro/hippo/IdFunctionCall;
    .param p2, "tag"    # Ljava/lang/Object;
    .param p3, "id"    # I
    .param p4, "arity"    # I

    .line 17
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 18
    if-ltz p4, :cond_0

    .line 21
    iput-object p1, p0, Lcom/trendmicro/hippo/IdFunctionObject;->idcall:Lcom/trendmicro/hippo/IdFunctionCall;

    .line 22
    iput-object p2, p0, Lcom/trendmicro/hippo/IdFunctionObject;->tag:Ljava/lang/Object;

    .line 23
    iput p3, p0, Lcom/trendmicro/hippo/IdFunctionObject;->methodId:I

    .line 24
    iput p4, p0, Lcom/trendmicro/hippo/IdFunctionObject;->arity:I

    .line 25
    return-void

    .line 19
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "idcall"    # Lcom/trendmicro/hippo/IdFunctionCall;
    .param p2, "tag"    # Ljava/lang/Object;
    .param p3, "id"    # I
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "arity"    # I
    .param p6, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 30
    const/4 v0, 0x0

    invoke-direct {p0, p6, v0}, Lcom/trendmicro/hippo/BaseFunction;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V

    .line 32
    if-ltz p5, :cond_1

    .line 34
    if-eqz p4, :cond_0

    .line 37
    iput-object p1, p0, Lcom/trendmicro/hippo/IdFunctionObject;->idcall:Lcom/trendmicro/hippo/IdFunctionCall;

    .line 38
    iput-object p2, p0, Lcom/trendmicro/hippo/IdFunctionObject;->tag:Ljava/lang/Object;

    .line 39
    iput p3, p0, Lcom/trendmicro/hippo/IdFunctionObject;->methodId:I

    .line 40
    iput p5, p0, Lcom/trendmicro/hippo/IdFunctionObject;->arity:I

    .line 41
    iput-object p4, p0, Lcom/trendmicro/hippo/IdFunctionObject;->functionName:Ljava/lang/String;

    .line 42
    return-void

    .line 35
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 33
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method static equalObjectGraphs(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/EqualObjectGraphs;)Z
    .locals 2
    .param p0, "f1"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p1, "f2"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "eq"    # Lcom/trendmicro/hippo/EqualObjectGraphs;

    .line 162
    iget v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;->methodId:I

    iget v1, p1, Lcom/trendmicro/hippo/IdFunctionObject;->methodId:I

    if-ne v0, v1, :cond_0

    iget-object v0, p1, Lcom/trendmicro/hippo/IdFunctionObject;->tag:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;->idcall:Lcom/trendmicro/hippo/IdFunctionCall;

    iget-object v1, p1, Lcom/trendmicro/hippo/IdFunctionObject;->idcall:Lcom/trendmicro/hippo/IdFunctionCall;

    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public final addAsProperty(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 2
    .param p1, "target"    # Lcom/trendmicro/hippo/Scriptable;

    .line 74
    iget-object v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;->functionName:Ljava/lang/String;

    const/4 v1, 0x2

    invoke-static {p1, v0, p0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 76
    return-void
.end method

.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 100
    iget-object v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;->idcall:Lcom/trendmicro/hippo/IdFunctionCall;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-interface/range {v0 .. v5}, Lcom/trendmicro/hippo/IdFunctionCall;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public createObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 106
    iget-boolean v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;->useCallAsConstructor:Z

    if-eqz v0, :cond_0

    .line 107
    const/4 v0, 0x0

    return-object v0

    .line 113
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;->functionName:Ljava/lang/String;

    const-string v1, "msg.not.ctor"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method decompile(II)Ljava/lang/String;
    .locals 4
    .param p1, "indent"    # I
    .param p2, "flags"    # I

    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .local v0, "sb":Ljava/lang/StringBuilder;
    and-int/lit8 v1, p2, 0x1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 121
    .local v1, "justbody":Z
    :goto_0
    if-nez v1, :cond_1

    .line 122
    const-string v2, "function "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    const-string v2, "() { "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    :cond_1
    const-string v2, "[native code for "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    iget-object v2, p0, Lcom/trendmicro/hippo/IdFunctionObject;->idcall:Lcom/trendmicro/hippo/IdFunctionCall;

    instance-of v3, v2, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v3, :cond_2

    .line 128
    check-cast v2, Lcom/trendmicro/hippo/Scriptable;

    .line 129
    .local v2, "sobj":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v2}, Lcom/trendmicro/hippo/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    const/16 v3, 0x2e

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 132
    .end local v2    # "sobj":Lcom/trendmicro/hippo/Scriptable;
    :cond_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    const-string v2, ", arity="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getArity()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    if-eqz v1, :cond_3

    const-string v2, "]\n"

    goto :goto_1

    :cond_3
    const-string v2, "] }\n"

    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public exportAsScopeProperty()V
    .locals 1

    .line 80
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->addAsProperty(Lcom/trendmicro/hippo/Scriptable;)V

    .line 81
    return-void
.end method

.method public getArity()I
    .locals 1

    .line 142
    iget v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;->arity:I

    return v0
.end method

.method public getFunctionName()Ljava/lang/String;
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;->functionName:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    :cond_0
    return-object v0
.end method

.method public getLength()I
    .locals 1

    .line 146
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getArity()I

    move-result v0

    return v0
.end method

.method public getPrototype()Lcom/trendmicro/hippo/Scriptable;
    .locals 2

    .line 88
    invoke-super {p0}, Lcom/trendmicro/hippo/BaseFunction;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 89
    .local v0, "proto":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_0

    .line 90
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/IdFunctionObject;->getFunctionPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 91
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 93
    :cond_0
    return-object v0
.end method

.method public getTag()Ljava/lang/Object;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;->tag:Ljava/lang/Object;

    return-object v0
.end method

.method public final hasTag(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "tag"    # Ljava/lang/Object;

    .line 54
    iget-object v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;->tag:Ljava/lang/Object;

    if-nez p1, :cond_1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method public initFunction(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 46
    if-eqz p1, :cond_1

    .line 47
    if-eqz p2, :cond_0

    .line 48
    iput-object p1, p0, Lcom/trendmicro/hippo/IdFunctionObject;->functionName:Ljava/lang/String;

    .line 49
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/IdFunctionObject;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 50
    return-void

    .line 47
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 46
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public final markAsConstructor(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "prototypeProperty"    # Lcom/trendmicro/hippo/Scriptable;

    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;->useCallAsConstructor:Z

    .line 69
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdFunctionObject;->setImmunePrototypeProperty(Ljava/lang/Object;)V

    .line 70
    return-void
.end method

.method public final methodId()I
    .locals 1

    .line 63
    iget v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;->methodId:I

    return v0
.end method

.method public final unknown()Ljava/lang/RuntimeException;
    .locals 3

    .line 157
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BAD FUNCTION ID="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/trendmicro/hippo/IdFunctionObject;->methodId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " MASTER="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/trendmicro/hippo/IdFunctionObject;->idcall:Lcom/trendmicro/hippo/IdFunctionCall;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
