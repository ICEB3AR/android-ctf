.class public Lcom/trendmicro/hippo/WrappedException;
.super Lcom/trendmicro/hippo/EvaluatorException;
.source "WrappedException.java"


# static fields
.field private static final serialVersionUID:J = -0x1589bce006140f48L


# instance fields
.field private exception:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "exception"    # Ljava/lang/Throwable;

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Wrapped "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/EvaluatorException;-><init>(Ljava/lang/String;)V

    .line 27
    iput-object p1, p0, Lcom/trendmicro/hippo/WrappedException;->exception:Ljava/lang/Throwable;

    .line 28
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/WrappedException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 30
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput v1, v0, v1

    .line 31
    .local v0, "linep":[I
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v2

    .line 32
    .local v2, "sourceName":Ljava/lang/String;
    aget v1, v0, v1

    .line 33
    .local v1, "lineNumber":I
    if-eqz v2, :cond_0

    .line 34
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/WrappedException;->initSourceName(Ljava/lang/String;)V

    .line 36
    :cond_0
    if-eqz v1, :cond_1

    .line 37
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/WrappedException;->initLineNumber(I)V

    .line 39
    :cond_1
    return-void
.end method


# virtual methods
.method public getWrappedException()Ljava/lang/Throwable;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/trendmicro/hippo/WrappedException;->exception:Ljava/lang/Throwable;

    return-object v0
.end method

.method public unwrap()Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 58
    invoke-virtual {p0}, Lcom/trendmicro/hippo/WrappedException;->getWrappedException()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method
