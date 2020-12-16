.class public Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
.super Ljava/lang/Object;
.source "Dim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/Dim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SourceInfo"
.end annotation


# static fields
.field private static final EMPTY_BOOLEAN_ARRAY:[Z


# instance fields
.field private breakableLines:[Z

.field private breakpoints:[Z

.field private functionSources:[Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

.field private source:Ljava/lang/String;

.field private url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1368
    const/4 v0, 0x0

    new-array v0, v0, [Z

    sput-object v0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->EMPTY_BOOLEAN_ARRAY:[Z

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;[Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;)V
    .locals 12
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "functions"    # [Lcom/trendmicro/hippo/debug/DebuggableScript;
    .param p3, "normilizedUrl"    # Ljava/lang/String;

    .line 1399
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1400
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->source:Ljava/lang/String;

    .line 1401
    iput-object p3, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->url:Ljava/lang/String;

    .line 1403
    array-length v0, p2

    .line 1404
    .local v0, "N":I
    new-array v1, v0, [[I

    .line 1405
    .local v1, "lineArrays":[[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, v0, :cond_0

    .line 1406
    aget-object v3, p2, v2

    invoke-interface {v3}, Lcom/trendmicro/hippo/debug/DebuggableScript;->getLineNumbers()[I

    move-result-object v3

    aput-object v3, v1, v2

    .line 1405
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1409
    .end local v2    # "i":I
    :cond_0
    const/4 v2, 0x0

    .local v2, "minAll":I
    const/4 v3, -0x1

    .line 1410
    .local v3, "maxAll":I
    new-array v4, v0, [I

    .line 1411
    .local v4, "firstLines":[I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-eq v5, v0, :cond_9

    .line 1412
    aget-object v6, v1, v5

    .line 1413
    .local v6, "lines":[I
    if-eqz v6, :cond_7

    array-length v7, v6

    if-nez v7, :cond_1

    goto :goto_4

    .line 1417
    :cond_1
    const/4 v7, 0x0

    aget v7, v6, v7

    move v8, v7

    .line 1418
    .local v7, "min":I
    .local v8, "max":I
    const/4 v9, 0x1

    .local v9, "j":I
    :goto_2
    array-length v10, v6

    if-eq v9, v10, :cond_4

    .line 1419
    aget v10, v6, v9

    .line 1420
    .local v10, "line":I
    if-ge v10, v7, :cond_2

    .line 1421
    move v7, v10

    goto :goto_3

    .line 1422
    :cond_2
    if-le v10, v8, :cond_3

    .line 1423
    move v8, v10

    .line 1418
    .end local v10    # "line":I
    :cond_3
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 1426
    .end local v9    # "j":I
    :cond_4
    aput v7, v4, v5

    .line 1427
    if-le v2, v3, :cond_5

    .line 1428
    move v2, v7

    .line 1429
    move v3, v8

    goto :goto_5

    .line 1431
    :cond_5
    if-ge v7, v2, :cond_6

    .line 1432
    move v2, v7

    .line 1434
    :cond_6
    if-le v8, v3, :cond_8

    .line 1435
    move v3, v8

    goto :goto_5

    .line 1414
    .end local v7    # "min":I
    .end local v8    # "max":I
    :cond_7
    :goto_4
    const/4 v7, -0x1

    aput v7, v4, v5

    .line 1411
    .end local v6    # "lines":[I
    :cond_8
    :goto_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1441
    .end local v5    # "i":I
    :cond_9
    if-le v2, v3, :cond_a

    .line 1443
    sget-object v5, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->EMPTY_BOOLEAN_ARRAY:[Z

    iput-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakableLines:[Z

    .line 1444
    iput-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    goto :goto_8

    .line 1446
    :cond_a
    if-ltz v2, :cond_f

    .line 1450
    add-int/lit8 v5, v3, 0x1

    .line 1451
    .local v5, "linesTop":I
    new-array v6, v5, [Z

    iput-object v6, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakableLines:[Z

    .line 1452
    new-array v6, v5, [Z

    iput-object v6, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    .line 1453
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_6
    if-eq v6, v0, :cond_c

    .line 1454
    aget-object v7, v1, v6

    .line 1455
    .local v7, "lines":[I
    if-eqz v7, :cond_b

    array-length v8, v7

    if-eqz v8, :cond_b

    .line 1456
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_7
    array-length v9, v7

    if-eq v8, v9, :cond_b

    .line 1457
    aget v9, v7, v8

    .line 1458
    .local v9, "line":I
    iget-object v10, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakableLines:[Z

    const/4 v11, 0x1

    aput-boolean v11, v10, v9

    .line 1456
    .end local v9    # "line":I
    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    .line 1453
    .end local v7    # "lines":[I
    .end local v8    # "j":I
    :cond_b
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 1463
    .end local v5    # "linesTop":I
    .end local v6    # "i":I
    :cond_c
    :goto_8
    new-array v5, v0, [Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    iput-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->functionSources:[Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    .line 1464
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_9
    if-eq v5, v0, :cond_e

    .line 1465
    aget-object v6, p2, v5

    invoke-interface {v6}, Lcom/trendmicro/hippo/debug/DebuggableScript;->getFunctionName()Ljava/lang/String;

    move-result-object v6

    .line 1466
    .local v6, "name":Ljava/lang/String;
    if-nez v6, :cond_d

    .line 1467
    const-string v6, ""

    .line 1469
    :cond_d
    iget-object v7, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->functionSources:[Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    new-instance v8, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    aget v9, v4, v5

    const/4 v10, 0x0

    invoke-direct {v8, p0, v9, v6, v10}, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;ILjava/lang/String;Lcom/trendmicro/hippo/tools/debugger/Dim$1;)V

    aput-object v8, v7, v5

    .line 1464
    .end local v6    # "name":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    .line 1472
    .end local v5    # "i":I
    :cond_e
    return-void

    .line 1448
    :cond_f
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method synthetic constructor <init>(Ljava/lang/String;[Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;Lcom/trendmicro/hippo/tools/debugger/Dim$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # [Lcom/trendmicro/hippo/debug/DebuggableScript;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Lcom/trendmicro/hippo/tools/debugger/Dim$1;

    .line 1363
    invoke-direct {p0, p1, p2, p3}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;-><init>(Ljava/lang/String;[Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    .param p1, "x1"    # Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 1363
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->copyBreakpointsFrom(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)V

    return-void
.end method

.method static synthetic access$2500(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)[Z
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 1363
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    return-object v0
.end method

.method private copyBreakpointsFrom(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)V
    .locals 4
    .param p1, "old"    # Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 1507
    iget-object v0, p1, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    array-length v0, v0

    .line 1508
    .local v0, "end":I
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    array-length v2, v1

    if-le v0, v2, :cond_0

    .line 1509
    array-length v0, v1

    .line 1511
    :cond_0
    const/4 v1, 0x0

    .local v1, "line":I
    :goto_0
    if-eq v1, v0, :cond_2

    .line 1512
    iget-object v2, p1, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_1

    .line 1513
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    const/4 v3, 0x1

    aput-boolean v3, v2, v1

    .line 1511
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1516
    .end local v1    # "line":I
    :cond_2
    return-void
.end method


# virtual methods
.method public breakableLine(I)Z
    .locals 2
    .param p1, "line"    # I

    .line 1523
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakableLines:[Z

    array-length v1, v0

    if-ge p1, v1, :cond_0

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public breakpoint(I)Z
    .locals 2
    .param p1, "line"    # I

    .line 1531
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakableLine(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1534
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    array-length v1, v0

    if-ge p1, v1, :cond_0

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 1532
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public breakpoint(IZ)Z
    .locals 2
    .param p1, "line"    # I
    .param p2, "value"    # Z

    .line 1541
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakableLine(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1545
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    monitor-enter v0

    .line 1546
    :try_start_0
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    aget-boolean v1, v1, p1

    if-eq v1, p2, :cond_0

    .line 1547
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    aput-boolean p2, v1, p1

    .line 1548
    const/4 v1, 0x1

    .local v1, "changed":Z
    goto :goto_0

    .line 1550
    .end local v1    # "changed":Z
    :cond_0
    const/4 v1, 0x0

    .line 1552
    .restart local v1    # "changed":Z
    :goto_0
    monitor-exit v0

    .line 1553
    return v1

    .line 1552
    .end local v1    # "changed":Z
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1542
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public functionSource(I)Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    .locals 1
    .param p1, "i"    # I

    .line 1499
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->functionSources:[Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public functionSourcesTop()I
    .locals 1

    .line 1492
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->functionSources:[Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    array-length v0, v0

    return v0
.end method

.method public removeAllBreakpoints()V
    .locals 4

    .line 1560
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    monitor-enter v0

    .line 1561
    const/4 v1, 0x0

    .local v1, "line":I
    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    array-length v2, v2

    if-eq v1, v2, :cond_0

    .line 1562
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoints:[Z

    const/4 v3, 0x0

    aput-boolean v3, v2, v1

    .line 1561
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1564
    .end local v1    # "line":I
    :cond_0
    monitor-exit v0

    .line 1565
    return-void

    .line 1564
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public source()Ljava/lang/String;
    .locals 1

    .line 1478
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->source:Ljava/lang/String;

    return-object v0
.end method

.method public url()Ljava/lang/String;
    .locals 1

    .line 1485
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->url:Ljava/lang/String;

    return-object v0
.end method
