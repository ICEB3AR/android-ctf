.class public final Lcom/trendmicro/hippo/NativeStringIterator;
.super Lcom/trendmicro/hippo/ES6Iterator;
.source "NativeStringIterator.java"


# static fields
.field private static final ITERATOR_TAG:Ljava/lang/String; = "StringIterator"

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private index:I

.field private string:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/trendmicro/hippo/ES6Iterator;-><init>()V

    .line 22
    return-void
.end method

.method constructor <init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "stringLike"    # Lcom/trendmicro/hippo/Scriptable;

    .line 25
    const-string v0, "StringIterator"

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ES6Iterator;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V

    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/NativeStringIterator;->index:I

    .line 27
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeStringIterator;->string:Ljava/lang/String;

    .line 28
    return-void
.end method

.method static init(Lcom/trendmicro/hippo/ScriptableObject;Z)V
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p1, "sealed"    # Z

    .line 14
    new-instance v0, Lcom/trendmicro/hippo/NativeStringIterator;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeStringIterator;-><init>()V

    const-string v1, "StringIterator"

    invoke-static {p0, p1, v0, v1}, Lcom/trendmicro/hippo/ES6Iterator;->init(Lcom/trendmicro/hippo/ScriptableObject;ZLcom/trendmicro/hippo/IdScriptableObject;Ljava/lang/String;)V

    .line 15
    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 32
    const-string v0, "String Iterator"

    return-object v0
.end method

.method protected getTag()Ljava/lang/String;
    .locals 1

    .line 50
    const-string v0, "StringIterator"

    return-object v0
.end method

.method protected isDone(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 37
    iget v0, p0, Lcom/trendmicro/hippo/NativeStringIterator;->index:I

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeStringIterator;->string:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected nextValue(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 42
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeStringIterator;->string:Ljava/lang/String;

    iget v1, p0, Lcom/trendmicro/hippo/NativeStringIterator;->index:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->offsetByCodePoints(II)I

    move-result v0

    .line 43
    .local v0, "newIndex":I
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeStringIterator;->string:Ljava/lang/String;

    iget v2, p0, Lcom/trendmicro/hippo/NativeStringIterator;->index:I

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 44
    .local v1, "value":Ljava/lang/Object;
    iput v0, p0, Lcom/trendmicro/hippo/NativeStringIterator;->index:I

    .line 45
    return-object v1
.end method
