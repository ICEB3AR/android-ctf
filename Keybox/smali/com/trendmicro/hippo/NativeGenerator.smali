.class public final Lcom/trendmicro/hippo/NativeGenerator;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeGenerator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/NativeGenerator$GeneratorClosedException;
    }
.end annotation


# static fields
.field public static final GENERATOR_CLOSE:I = 0x2

.field public static final GENERATOR_SEND:I = 0x0

.field private static final GENERATOR_TAG:Ljava/lang/Object;

.field public static final GENERATOR_THROW:I = 0x1

.field private static final Id___iterator__:I = 0x5

.field private static final Id_close:I = 0x1

.field private static final Id_next:I = 0x2

.field private static final Id_send:I = 0x3

.field private static final Id_throw:I = 0x4

.field private static final MAX_PROTOTYPE_ID:I = 0x5

.field private static final serialVersionUID:J = 0x16d762746ec522c9L


# instance fields
.field private firstTime:Z

.field private function:Lcom/trendmicro/hippo/NativeFunction;

.field private lineNumber:I

.field private lineSource:Ljava/lang/String;

.field private locked:Z

.field private savedState:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    const-string v0, "Generator"

    sput-object v0, Lcom/trendmicro/hippo/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 49
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 220
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/NativeGenerator;->firstTime:Z

    .line 49
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeFunction;Ljava/lang/Object;)V
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "function"    # Lcom/trendmicro/hippo/NativeFunction;
    .param p3, "savedState"    # Ljava/lang/Object;

    .line 53
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 220
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/NativeGenerator;->firstTime:Z

    .line 54
    iput-object p2, p0, Lcom/trendmicro/hippo/NativeGenerator;->function:Lcom/trendmicro/hippo/NativeFunction;

    .line 55
    iput-object p3, p0, Lcom/trendmicro/hippo/NativeGenerator;->savedState:Ljava/lang/Object;

    .line 59
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 60
    .local v0, "top":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/NativeGenerator;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 61
    sget-object v1, Lcom/trendmicro/hippo/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    .line 62
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopScopeValue(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/NativeGenerator;

    .line 63
    .local v1, "prototype":Lcom/trendmicro/hippo/NativeGenerator;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/NativeGenerator;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 64
    return-void
.end method

.method static init(Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/NativeGenerator;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p1, "sealed"    # Z

    .line 25
    new-instance v0, Lcom/trendmicro/hippo/NativeGenerator;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeGenerator;-><init>()V

    .line 26
    .local v0, "prototype":Lcom/trendmicro/hippo/NativeGenerator;
    if-eqz p0, :cond_0

    .line 27
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/NativeGenerator;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 28
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeGenerator;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/NativeGenerator;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 30
    :cond_0
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/NativeGenerator;->activatePrototypeMap(I)V

    .line 31
    if-eqz p1, :cond_1

    .line 32
    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeGenerator;->sealObject()V

    .line 39
    :cond_1
    if-eqz p0, :cond_2

    .line 40
    sget-object v1, Lcom/trendmicro/hippo/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    :cond_2
    return-object v0
.end method

.method private resume(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 11
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "operation"    # I
    .param p4, "value"    # Ljava/lang/Object;

    .line 140
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeGenerator;->savedState:Ljava/lang/Object;

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-nez v0, :cond_2

    .line 141
    if-ne p3, v2, :cond_0

    .line 142
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 144
    :cond_0
    if-ne p3, v1, :cond_1

    .line 145
    move-object v0, p4

    .local v0, "thrown":Ljava/lang/Object;
    goto :goto_0

    .line 147
    .end local v0    # "thrown":Ljava/lang/Object;
    :cond_1
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeIterator;->getStopIterationObject(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 149
    .restart local v0    # "thrown":Ljava/lang/Object;
    :goto_0
    new-instance v1, Lcom/trendmicro/hippo/JavaScriptException;

    iget-object v2, p0, Lcom/trendmicro/hippo/NativeGenerator;->lineSource:Ljava/lang/String;

    iget v3, p0, Lcom/trendmicro/hippo/NativeGenerator;->lineNumber:I

    invoke-direct {v1, v0, v2, v3}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v1

    .line 152
    .end local v0    # "thrown":Ljava/lang/Object;
    :cond_2
    const/4 v0, 0x0

    const/4 v3, 0x0

    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Lcom/trendmicro/hippo/NativeGenerator$GeneratorClosedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 156
    :try_start_1
    iget-boolean v4, p0, Lcom/trendmicro/hippo/NativeGenerator;->locked:Z

    if-nez v4, :cond_4

    .line 158
    iput-boolean v1, p0, Lcom/trendmicro/hippo/NativeGenerator;->locked:Z

    .line 159
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 160
    :try_start_2
    iget-object v5, p0, Lcom/trendmicro/hippo/NativeGenerator;->function:Lcom/trendmicro/hippo/NativeFunction;

    iget-object v9, p0, Lcom/trendmicro/hippo/NativeGenerator;->savedState:Ljava/lang/Object;

    move-object v6, p1

    move-object v7, p2

    move v8, p3

    move-object v10, p4

    invoke-virtual/range {v5 .. v10}, Lcom/trendmicro/hippo/NativeFunction;->resumeGenerator(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_2
    .catch Lcom/trendmicro/hippo/NativeGenerator$GeneratorClosedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 173
    monitor-enter p0

    .line 174
    :try_start_3
    iput-boolean v0, p0, Lcom/trendmicro/hippo/NativeGenerator;->locked:Z

    .line 175
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 176
    if-ne p3, v2, :cond_3

    .line 177
    iput-object v3, p0, Lcom/trendmicro/hippo/NativeGenerator;->savedState:Ljava/lang/Object;

    .line 160
    :cond_3
    return-object v1

    .line 175
    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0

    .line 157
    :cond_4
    :try_start_5
    const-string v1, "msg.already.exec.gen"

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    .end local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p2    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local p3    # "operation":I
    .end local p4    # "value":Ljava/lang/Object;
    throw v1

    .line 159
    .restart local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p2    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .restart local p3    # "operation":I
    .restart local p4    # "value":Ljava/lang/Object;
    :catchall_1
    move-exception v1

    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .end local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p2    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local p3    # "operation":I
    .end local p4    # "value":Ljava/lang/Object;
    :try_start_6
    throw v1
    :try_end_6
    .catch Lcom/trendmicro/hippo/NativeGenerator$GeneratorClosedException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 173
    .restart local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p2    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .restart local p3    # "operation":I
    .restart local p4    # "value":Ljava/lang/Object;
    :catchall_2
    move-exception v1

    goto :goto_1

    .line 167
    :catch_0
    move-exception v1

    .line 168
    .local v1, "e":Lcom/trendmicro/hippo/HippoException;
    :try_start_7
    invoke-virtual {v1}, Lcom/trendmicro/hippo/HippoException;->lineNumber()I

    move-result v4

    iput v4, p0, Lcom/trendmicro/hippo/NativeGenerator;->lineNumber:I

    .line 169
    invoke-virtual {v1}, Lcom/trendmicro/hippo/HippoException;->lineSource()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/trendmicro/hippo/NativeGenerator;->lineSource:Ljava/lang/String;

    .line 170
    iput-object v3, p0, Lcom/trendmicro/hippo/NativeGenerator;->savedState:Ljava/lang/Object;

    .line 171
    nop

    .end local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p2    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local p3    # "operation":I
    .end local p4    # "value":Ljava/lang/Object;
    throw v1

    .line 162
    .end local v1    # "e":Lcom/trendmicro/hippo/HippoException;
    .restart local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p2    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .restart local p3    # "operation":I
    .restart local p4    # "value":Ljava/lang/Object;
    :catch_1
    move-exception v1

    .line 166
    .local v1, "e":Lcom/trendmicro/hippo/NativeGenerator$GeneratorClosedException;
    sget-object v4, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 173
    monitor-enter p0

    .line 174
    :try_start_8
    iput-boolean v0, p0, Lcom/trendmicro/hippo/NativeGenerator;->locked:Z

    .line 175
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 176
    if-ne p3, v2, :cond_5

    .line 177
    iput-object v3, p0, Lcom/trendmicro/hippo/NativeGenerator;->savedState:Ljava/lang/Object;

    .line 166
    :cond_5
    return-object v4

    .line 175
    :catchall_3
    move-exception v0

    :try_start_9
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    throw v0

    .line 173
    .end local v1    # "e":Lcom/trendmicro/hippo/NativeGenerator$GeneratorClosedException;
    :goto_1
    monitor-enter p0

    .line 174
    :try_start_a
    iput-boolean v0, p0, Lcom/trendmicro/hippo/NativeGenerator;->locked:Z

    .line 175
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 176
    if-ne p3, v2, :cond_6

    .line 177
    iput-object v3, p0, Lcom/trendmicro/hippo/NativeGenerator;->savedState:Ljava/lang/Object;

    .line 178
    :cond_6
    throw v1

    .line 175
    :catchall_4
    move-exception v0

    :try_start_b
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    throw v0
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 94
    sget-object v0, Lcom/trendmicro/hippo/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 95
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 97
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 99
    .local v0, "id":I
    instance-of v1, p4, Lcom/trendmicro/hippo/NativeGenerator;

    if-eqz v1, :cond_a

    .line 102
    move-object v1, p4

    check-cast v1, Lcom/trendmicro/hippo/NativeGenerator;

    .line 104
    .local v1, "generator":Lcom/trendmicro/hippo/NativeGenerator;
    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v0, v3, :cond_9

    const/4 v4, 0x0

    if-eq v0, v2, :cond_8

    const/4 v2, 0x3

    if-eq v0, v2, :cond_4

    const/4 v2, 0x4

    if-eq v0, v2, :cond_2

    const/4 v2, 0x5

    if-ne v0, v2, :cond_1

    .line 130
    return-object p4

    .line 133
    :cond_1
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 126
    :cond_2
    nop

    .line 127
    array-length v2, p5

    if-lez v2, :cond_3

    aget-object v2, p5, v4

    goto :goto_0

    :cond_3
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 126
    :goto_0
    invoke-direct {v1, p2, p3, v3, v2}, Lcom/trendmicro/hippo/NativeGenerator;->resume(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 118
    :cond_4
    array-length v2, p5

    if-lez v2, :cond_5

    aget-object v2, p5, v4

    goto :goto_1

    :cond_5
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 119
    .local v2, "arg":Ljava/lang/Object;
    :goto_1
    iget-boolean v3, v1, Lcom/trendmicro/hippo/NativeGenerator;->firstTime:Z

    if-eqz v3, :cond_7

    sget-object v3, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_2

    .line 120
    :cond_6
    const-string v3, "msg.send.newborn"

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v3

    throw v3

    .line 122
    :cond_7
    :goto_2
    invoke-direct {v1, p2, p3, v4, v2}, Lcom/trendmicro/hippo/NativeGenerator;->resume(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 113
    .end local v2    # "arg":Ljava/lang/Object;
    :cond_8
    iput-boolean v4, v1, Lcom/trendmicro/hippo/NativeGenerator;->firstTime:Z

    .line 114
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-direct {v1, p2, p3, v4, v2}, Lcom/trendmicro/hippo/NativeGenerator;->resume(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 108
    :cond_9
    new-instance v3, Lcom/trendmicro/hippo/NativeGenerator$GeneratorClosedException;

    invoke-direct {v3}, Lcom/trendmicro/hippo/NativeGenerator$GeneratorClosedException;-><init>()V

    invoke-direct {v1, p2, p3, v2, v3}, Lcom/trendmicro/hippo/NativeGenerator;->resume(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 100
    .end local v1    # "generator":Lcom/trendmicro/hippo/NativeGenerator;
    :cond_a
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeGenerator;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .line 187
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 188
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 189
    .local v2, "s_length":I
    const/4 v3, 0x0

    const/4 v4, 0x4

    if-ne v2, v4, :cond_1

    .line 190
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 191
    .local v3, "c":I
    const/16 v4, 0x6e

    if-ne v3, v4, :cond_0

    const-string v1, "next"

    const/4 v0, 0x2

    goto :goto_0

    .line 192
    :cond_0
    const/16 v4, 0x73

    if-ne v3, v4, :cond_4

    const-string v1, "send"

    const/4 v0, 0x3

    goto :goto_0

    .line 194
    .end local v3    # "c":I
    :cond_1
    const/4 v4, 0x5

    if-ne v2, v4, :cond_3

    .line 195
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 196
    .restart local v3    # "c":I
    const/16 v4, 0x63

    if-ne v3, v4, :cond_2

    const-string v1, "close"

    const/4 v0, 0x1

    goto :goto_0

    .line 197
    :cond_2
    const/16 v4, 0x74

    if-ne v3, v4, :cond_4

    const-string v1, "throw"

    const/4 v0, 0x4

    goto :goto_0

    .line 199
    .end local v3    # "c":I
    :cond_3
    const/16 v3, 0xc

    if-ne v2, v3, :cond_4

    const-string v1, "__iterator__"

    const/4 v0, 0x5

    .line 200
    :cond_4
    :goto_0
    if-eqz v1, :cond_5

    if-eq v1, p1, :cond_5

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    const/4 v0, 0x0

    .line 204
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_5
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 72
    const-string v0, "Generator"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 79
    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-ne p1, v0, :cond_0

    .line 84
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "__iterator__"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 85
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "throw"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 82
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "send"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 81
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_3
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "next"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 80
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_4
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "close"

    .line 87
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeGenerator;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 88
    return-void
.end method
