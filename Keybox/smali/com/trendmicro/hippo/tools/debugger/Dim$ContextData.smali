.class public Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
.super Ljava/lang/Object;
.source "Dim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/Dim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ContextData"
.end annotation


# instance fields
.field private breakNextLine:Z

.field private eventThreadFlag:Z

.field private frameStack:Lcom/trendmicro/hippo/ObjArray;

.field private lastProcessedException:Ljava/lang/Throwable;

.field private stopAtFrameDepth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1080
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1085
    new-instance v0, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameStack:Lcom/trendmicro/hippo/ObjArray;

    .line 1096
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->stopAtFrameDepth:I

    return-void
.end method

.method static synthetic access$1400(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;)Z
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    .line 1080
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->breakNextLine:Z

    return v0
.end method

.method static synthetic access$1402(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .param p1, "x1"    # Z

    .line 1080
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->breakNextLine:Z

    return p1
.end method

.method static synthetic access$1500(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;)I
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    .line 1080
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->stopAtFrameDepth:I

    return v0
.end method

.method static synthetic access$1502(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;I)I
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .param p1, "x1"    # I

    .line 1080
    iput p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->stopAtFrameDepth:I

    return p1
.end method

.method static synthetic access$2600(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)V
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .param p1, "x1"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    .line 1080
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->pushFrame(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)V

    return-void
.end method

.method static synthetic access$300(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;)Ljava/lang/Throwable;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    .line 1080
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->lastProcessedException:Ljava/lang/Throwable;

    return-object v0
.end method

.method static synthetic access$302(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .param p1, "x1"    # Ljava/lang/Throwable;

    .line 1080
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->lastProcessedException:Ljava/lang/Throwable;

    return-object p1
.end method

.method static synthetic access$3200(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;)V
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    .line 1080
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->popFrame()V

    return-void
.end method

.method static synthetic access$400(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;)Z
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    .line 1080
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->eventThreadFlag:Z

    return v0
.end method

.method static synthetic access$402(Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .param p1, "x1"    # Z

    .line 1080
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->eventThreadFlag:Z

    return p1
.end method

.method public static get(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1112
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getDebuggerContextData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    return-object v0
.end method

.method private popFrame()V
    .locals 1

    .line 1141
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameStack:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ObjArray;->pop()Ljava/lang/Object;

    .line 1142
    return-void
.end method

.method private pushFrame(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)V
    .locals 1
    .param p1, "frame"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    .line 1134
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameStack:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ObjArray;->push(Ljava/lang/Object;)V

    .line 1135
    return-void
.end method


# virtual methods
.method public frameCount()I
    .locals 1

    .line 1119
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameStack:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v0

    return v0
.end method

.method public getFrame(I)Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .locals 2
    .param p1, "frameNumber"    # I

    .line 1126
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameStack:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v0

    sub-int/2addr v0, p1

    add-int/lit8 v0, v0, -0x1

    .line 1127
    .local v0, "num":I
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameStack:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    return-object v1
.end method
