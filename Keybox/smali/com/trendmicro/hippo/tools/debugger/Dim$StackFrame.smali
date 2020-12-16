.class public Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
.super Ljava/lang/Object;
.source "Dim.java"

# interfaces
.implements Lcom/trendmicro/hippo/debug/DebugFrame;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/Dim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StackFrame"
.end annotation


# instance fields
.field private breakpoints:[Z

.field private contextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

.field private dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

.field private fsource:Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

.field private lineNumber:I

.field private scope:Lcom/trendmicro/hippo/Scriptable;

.field private thisObj:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method private constructor <init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "dim"    # Lcom/trendmicro/hippo/tools/debugger/Dim;
    .param p3, "fsource"    # Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    .line 1188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1189
    iput-object p2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    .line 1190
    invoke-static {p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->get(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    .line 1191
    iput-object p3, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->fsource:Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    .line 1192
    invoke-virtual {p3}, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->sourceInfo()Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->access$2500(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)[Z

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->breakpoints:[Z

    .line 1193
    invoke-virtual {p3}, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->firstLine()I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->lineNumber:I

    .line 1194
    return-void
.end method

.method synthetic constructor <init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;Lcom/trendmicro/hippo/tools/debugger/Dim$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trendmicro/hippo/Context;
    .param p2, "x1"    # Lcom/trendmicro/hippo/tools/debugger/Dim;
    .param p3, "x2"    # Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    .param p4, "x3"    # Lcom/trendmicro/hippo/tools/debugger/Dim$1;

    .line 1148
    invoke-direct {p0, p1, p2, p3}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;-><init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    .line 1148
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    .line 1148
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->thisObj:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method


# virtual methods
.method public contextData()Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .locals 1

    .line 1267
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    return-object v0
.end method

.method public getFunctionName()Ljava/lang/String;
    .locals 1

    .line 1302
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->fsource:Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLineNumber()I
    .locals 1

    .line 1295
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->lineNumber:I

    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .line 1288
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->fsource:Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->sourceInfo()Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onDebuggerStatement(Lcom/trendmicro/hippo/Context;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1253
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v0, p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$2800(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Lcom/trendmicro/hippo/Context;)V

    .line 1254
    return-void
.end method

.method public onEnter(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 1201
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$2600(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)V

    .line 1202
    iput-object p2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 1203
    iput-object p3, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->thisObj:Lcom/trendmicro/hippo/Scriptable;

    .line 1204
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$2700(Lcom/trendmicro/hippo/tools/debugger/Dim;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1205
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v0, p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$2800(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Lcom/trendmicro/hippo/Context;)V

    .line 1207
    :cond_0
    return-void
.end method

.method public onExceptionThrown(Lcom/trendmicro/hippo/Context;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "exception"    # Ljava/lang/Throwable;

    .line 1235
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v0, p1, p2, p0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$3000(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/Context;Ljava/lang/Throwable;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)V

    .line 1236
    return-void
.end method

.method public onExit(Lcom/trendmicro/hippo/Context;ZLjava/lang/Object;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "byThrow"    # Z
    .param p3, "resultOrException"    # Ljava/lang/Object;

    .line 1243
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$3100(Lcom/trendmicro/hippo/tools/debugger/Dim;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p2, :cond_0

    .line 1244
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v0, p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$2800(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Lcom/trendmicro/hippo/Context;)V

    .line 1246
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$3200(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;)V

    .line 1247
    return-void
.end method

.method public onLineChange(Lcom/trendmicro/hippo/Context;I)V
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "lineno"    # I

    .line 1213
    iput p2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->lineNumber:I

    .line 1215
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->breakpoints:[Z

    aget-boolean v0, v0, p2

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$2900(Lcom/trendmicro/hippo/tools/debugger/Dim;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1216
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$1400(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;)Z

    move-result v0

    .line 1217
    .local v0, "lineBreak":Z
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    invoke-static {v2}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$1500(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;)I

    move-result v2

    if-ltz v2, :cond_1

    .line 1218
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameCount()I

    move-result v2

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    .line 1219
    invoke-static {v3}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$1500(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;)I

    move-result v3

    if-gt v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    move v0, v2

    .line 1221
    :cond_1
    if-nez v0, :cond_2

    .line 1222
    return-void

    .line 1224
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    const/4 v3, -0x1

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$1502(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;I)I

    .line 1225
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData:Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->access$1402(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;Z)Z

    .line 1228
    .end local v0    # "lineBreak":Z
    :cond_3
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {v0, p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->access$2800(Lcom/trendmicro/hippo/tools/debugger/Dim;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Lcom/trendmicro/hippo/Context;)V

    .line 1229
    return-void
.end method

.method public scope()Ljava/lang/Object;
    .locals 1

    .line 1274
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->scope:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method public sourceInfo()Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    .locals 1

    .line 1260
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->fsource:Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->sourceInfo()Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    move-result-object v0

    return-object v0
.end method

.method public thisObj()Ljava/lang/Object;
    .locals 1

    .line 1281
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->thisObj:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method
