.class public final Lcom/trendmicro/hippo/NativeArrayIterator;
.super Lcom/trendmicro/hippo/ES6Iterator;
.source "NativeArrayIterator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;
    }
.end annotation


# static fields
.field private static final ITERATOR_TAG:Ljava/lang/String; = "ArrayIterator"

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private arrayLike:Lcom/trendmicro/hippo/Scriptable;

.field private index:I

.field private type:Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/trendmicro/hippo/ES6Iterator;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;)V
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "arrayLike"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "type"    # Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;

    .line 33
    const-string v0, "ArrayIterator"

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ES6Iterator;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V

    .line 34
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->index:I

    .line 35
    iput-object p2, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->arrayLike:Lcom/trendmicro/hippo/Scriptable;

    .line 36
    iput-object p3, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->type:Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;

    .line 37
    return-void
.end method

.method static init(Lcom/trendmicro/hippo/ScriptableObject;Z)V
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p1, "sealed"    # Z

    .line 22
    new-instance v0, Lcom/trendmicro/hippo/NativeArrayIterator;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeArrayIterator;-><init>()V

    const-string v1, "ArrayIterator"

    invoke-static {p0, p1, v0, v1}, Lcom/trendmicro/hippo/ES6Iterator;->init(Lcom/trendmicro/hippo/ScriptableObject;ZLcom/trendmicro/hippo/IdScriptableObject;Ljava/lang/String;)V

    .line 23
    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 41
    const-string v0, "Array Iterator"

    return-object v0
.end method

.method protected getTag()Ljava/lang/String;
    .locals 1

    .line 70
    const-string v0, "ArrayIterator"

    return-object v0
.end method

.method protected isDone(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 6
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 46
    iget v0, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->index:I

    int-to-long v0, v0

    iget-object v2, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->arrayLike:Lcom/trendmicro/hippo/Scriptable;

    const/4 v3, 0x0

    invoke-static {p1, v2, v3}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v4

    cmp-long v0, v0, v4

    if-ltz v0, :cond_0

    const/4 v3, 0x1

    :cond_0
    return v3
.end method

.method protected nextValue(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 51
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->type:Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;

    sget-object v1, Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;->KEYS:Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;

    if-ne v0, v1, :cond_0

    .line 52
    iget v0, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->index:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->index:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->arrayLike:Lcom/trendmicro/hippo/Scriptable;

    iget v1, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->index:I

    invoke-interface {v0, v1, v0}, Lcom/trendmicro/hippo/Scriptable;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 56
    .local v0, "value":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    .line 57
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 60
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->type:Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;

    sget-object v2, Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;->ENTRIES:Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;

    const/4 v3, 0x1

    if-ne v1, v2, :cond_2

    .line 61
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v4, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->index:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v2

    aput-object v0, v1, v3

    invoke-virtual {p1, p2, v1}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 64
    :cond_2
    iget v1, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->index:I

    add-int/2addr v1, v3

    iput v1, p0, Lcom/trendmicro/hippo/NativeArrayIterator;->index:I

    .line 65
    return-object v0
.end method
