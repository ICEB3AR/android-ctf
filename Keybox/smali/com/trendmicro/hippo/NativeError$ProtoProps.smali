.class final Lcom/trendmicro/hippo/NativeError$ProtoProps;
.super Ljava/lang/Object;
.source "NativeError.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/NativeError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ProtoProps"
.end annotation


# static fields
.field static final GET_PREPARE_STACK:Ljava/lang/reflect/Method;

.field static final GET_STACK_LIMIT:Ljava/lang/reflect/Method;

.field static final KEY:Ljava/lang/String; = "_ErrorPrototypeProps"

.field static final SET_PREPARE_STACK:Ljava/lang/reflect/Method;

.field static final SET_STACK_LIMIT:Ljava/lang/reflect/Method;

.field private static final serialVersionUID:J = 0x1a77aa91307f85d3L


# instance fields
.field private prepareStackTrace:Lcom/trendmicro/hippo/Function;

.field private stackTraceLimit:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 368
    const-class v0, Lcom/trendmicro/hippo/NativeError$ProtoProps;

    :try_start_0
    const-string v1, "getStackTraceLimit"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Lcom/trendmicro/hippo/Scriptable;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/trendmicro/hippo/NativeError$ProtoProps;->GET_STACK_LIMIT:Ljava/lang/reflect/Method;

    .line 369
    const-string v1, "setStackTraceLimit"

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    const-class v6, Lcom/trendmicro/hippo/Scriptable;

    aput-object v6, v4, v5

    const-class v6, Ljava/lang/Object;

    aput-object v6, v4, v2

    invoke-virtual {v0, v1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/trendmicro/hippo/NativeError$ProtoProps;->SET_STACK_LIMIT:Ljava/lang/reflect/Method;

    .line 370
    const-string v1, "getPrepareStackTrace"

    new-array v4, v2, [Ljava/lang/Class;

    const-class v6, Lcom/trendmicro/hippo/Scriptable;

    aput-object v6, v4, v5

    invoke-virtual {v0, v1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/trendmicro/hippo/NativeError$ProtoProps;->GET_PREPARE_STACK:Ljava/lang/reflect/Method;

    .line 371
    const-string v1, "setPrepareStackTrace"

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Lcom/trendmicro/hippo/Scriptable;

    aput-object v4, v3, v5

    const-class v4, Ljava/lang/Object;

    aput-object v4, v3, v2

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/NativeError$ProtoProps;->SET_PREPARE_STACK:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 374
    nop

    .line 375
    return-void

    .line 372
    :catch_0
    move-exception v0

    .line 373
    .local v0, "nsm":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private constructor <init>()V
    .locals 1

    .line 356
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 379
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/NativeError$ProtoProps;->stackTraceLimit:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/trendmicro/hippo/NativeError$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trendmicro/hippo/NativeError$1;

    .line 356
    invoke-direct {p0}, Lcom/trendmicro/hippo/NativeError$ProtoProps;-><init>()V

    return-void
.end method


# virtual methods
.method public getPrepareStackTrace()Lcom/trendmicro/hippo/Function;
    .locals 1

    .line 409
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeError$ProtoProps;->prepareStackTrace:Lcom/trendmicro/hippo/Function;

    return-object v0
.end method

.method public getPrepareStackTrace(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 404
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeError$ProtoProps;->getPrepareStackTrace()Lcom/trendmicro/hippo/Function;

    move-result-object v0

    .line 405
    .local v0, "ps":Ljava/lang/Object;
    if-nez v0, :cond_0

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1
.end method

.method public getStackTraceLimit()I
    .locals 1

    .line 390
    iget v0, p0, Lcom/trendmicro/hippo/NativeError$ProtoProps;->stackTraceLimit:I

    return v0
.end method

.method public getStackTraceLimit(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 383
    iget v0, p0, Lcom/trendmicro/hippo/NativeError$ProtoProps;->stackTraceLimit:I

    if-ltz v0, :cond_0

    .line 384
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 386
    :cond_0
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public setPrepareStackTrace(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "value"    # Ljava/lang/Object;

    .line 413
    if-eqz p2, :cond_1

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 415
    :cond_0
    instance-of v0, p2, Lcom/trendmicro/hippo/Function;

    if-eqz v0, :cond_2

    .line 416
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/Function;

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeError$ProtoProps;->prepareStackTrace:Lcom/trendmicro/hippo/Function;

    goto :goto_1

    .line 414
    :cond_1
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeError$ProtoProps;->prepareStackTrace:Lcom/trendmicro/hippo/Function;

    .line 418
    :cond_2
    :goto_1
    return-void
.end method

.method public setStackTraceLimit(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 3
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "value"    # Ljava/lang/Object;

    .line 394
    invoke-static {p2}, Lcom/trendmicro/hippo/Context;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 395
    .local v0, "limit":D
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-static {v0, v1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 398
    :cond_0
    double-to-int v2, v0

    iput v2, p0, Lcom/trendmicro/hippo/NativeError$ProtoProps;->stackTraceLimit:I

    goto :goto_1

    .line 396
    :cond_1
    :goto_0
    const/4 v2, -0x1

    iput v2, p0, Lcom/trendmicro/hippo/NativeError$ProtoProps;->stackTraceLimit:I

    .line 400
    :goto_1
    return-void
.end method
