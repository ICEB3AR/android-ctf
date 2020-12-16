.class public Lcom/trendmicro/hippo/JavaScriptException;
.super Lcom/trendmicro/hippo/HippoException;
.source "JavaScriptException.java"


# static fields
.field private static final serialVersionUID:J = -0x6a639115d68db9edL


# instance fields
.field private value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 29
    const-string v0, ""

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;I)V
    .locals 3
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "lineNumber"    # I

    .line 38
    invoke-direct {p0}, Lcom/trendmicro/hippo/HippoException;-><init>()V

    .line 39
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p2, p3, v0, v1}, Lcom/trendmicro/hippo/JavaScriptException;->recordErrorOrigin(Ljava/lang/String;ILjava/lang/String;I)V

    .line 40
    iput-object p1, p0, Lcom/trendmicro/hippo/JavaScriptException;->value:Ljava/lang/Object;

    .line 43
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeError;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    const/16 v1, 0xa

    .line 44
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 45
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeError;

    .line 46
    .local v0, "error":Lcom/trendmicro/hippo/NativeError;
    const-string v1, "fileName"

    invoke-virtual {v0, v1, v0}, Lcom/trendmicro/hippo/NativeError;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 47
    invoke-virtual {v0, v1, v0, p2}, Lcom/trendmicro/hippo/NativeError;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 49
    :cond_0
    const-string v1, "lineNumber"

    invoke-virtual {v0, v1, v0}, Lcom/trendmicro/hippo/NativeError;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 50
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v0, v2}, Lcom/trendmicro/hippo/NativeError;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 53
    :cond_1
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/NativeError;->setStackProvider(Lcom/trendmicro/hippo/HippoException;)V

    .line 55
    .end local v0    # "error":Lcom/trendmicro/hippo/NativeError;
    :cond_2
    return-void
.end method


# virtual methods
.method public details()Ljava/lang/String;
    .locals 3

    .line 60
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaScriptException;->value:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 61
    const-string v0, "null"

    return-object v0

    .line 62
    :cond_0
    instance-of v1, v0, Lcom/trendmicro/hippo/NativeError;

    if-eqz v1, :cond_1

    .line 63
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 66
    :cond_1
    :try_start_0
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 67
    :catch_0
    move-exception v0

    .line 69
    .local v0, "rte":Ljava/lang/RuntimeException;
    iget-object v1, p0, Lcom/trendmicro/hippo/JavaScriptException;->value:Ljava/lang/Object;

    instance-of v2, v1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_2

    .line 70
    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->defaultObjectToString(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 72
    :cond_2
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getLineNumber()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 99
    invoke-virtual {p0}, Lcom/trendmicro/hippo/JavaScriptException;->lineNumber()I

    move-result v0

    return v0
.end method

.method public getSourceName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 90
    invoke-virtual {p0}, Lcom/trendmicro/hippo/JavaScriptException;->sourceName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaScriptException;->value:Ljava/lang/Object;

    return-object v0
.end method
