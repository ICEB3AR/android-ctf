.class public Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
.super Ljava/lang/Object;
.source "Dim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/Dim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FunctionSource"
.end annotation


# instance fields
.field private firstLine:I

.field private name:Ljava/lang/String;

.field private sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;


# direct methods
.method private constructor <init>(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;ILjava/lang/String;)V
    .locals 1
    .param p1, "sourceInfo"    # Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    .param p2, "firstLine"    # I
    .param p3, "name"    # Ljava/lang/String;

    .line 1330
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1331
    if-eqz p3, :cond_0

    .line 1332
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 1333
    iput p2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->firstLine:I

    .line 1334
    iput-object p3, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->name:Ljava/lang/String;

    .line 1335
    return-void

    .line 1331
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method synthetic constructor <init>(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;ILjava/lang/String;Lcom/trendmicro/hippo/tools/debugger/Dim$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    .param p2, "x1"    # I
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Lcom/trendmicro/hippo/tools/debugger/Dim$1;

    .line 1309
    invoke-direct {p0, p1, p2, p3}, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public firstLine()I
    .locals 1

    .line 1349
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->firstLine:I

    return v0
.end method

.method public name()Ljava/lang/String;
    .locals 1

    .line 1356
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->name:Ljava/lang/String;

    return-object v0
.end method

.method public sourceInfo()Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    .locals 1

    .line 1342
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    return-object v0
.end method
