.class public Lcom/trendmicro/hippo/NativeCollectionIterator;
.super Lcom/trendmicro/hippo/ES6Iterator;
.source "NativeCollectionIterator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/NativeCollectionIterator$Type;
    }
.end annotation


# instance fields
.field private className:Ljava/lang/String;

.field private transient iterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Lcom/trendmicro/hippo/Hashtable$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private type:Lcom/trendmicro/hippo/NativeCollectionIterator$Type;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/NativeCollectionIterator$Type;Ljava/util/Iterator;)V
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "type"    # Lcom/trendmicro/hippo/NativeCollectionIterator$Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/NativeCollectionIterator$Type;",
            "Ljava/util/Iterator<",
            "Lcom/trendmicro/hippo/Hashtable$Entry;",
            ">;)V"
        }
    .end annotation

    .line 33
    .local p4, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/trendmicro/hippo/Hashtable$Entry;>;"
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ES6Iterator;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V

    .line 14
    invoke-static {}, Ljava/util/Collections;->emptyIterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->iterator:Ljava/util/Iterator;

    .line 34
    iput-object p2, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->className:Ljava/lang/String;

    .line 35
    iput-object p4, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->iterator:Ljava/util/Iterator;

    .line 36
    iput-object p3, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->type:Lcom/trendmicro/hippo/NativeCollectionIterator$Type;

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/String;

    .line 23
    invoke-direct {p0}, Lcom/trendmicro/hippo/ES6Iterator;-><init>()V

    .line 14
    invoke-static {}, Ljava/util/Collections;->emptyIterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->iterator:Ljava/util/Iterator;

    .line 24
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->className:Ljava/lang/String;

    .line 25
    invoke-static {}, Ljava/util/Collections;->emptyIterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->iterator:Ljava/util/Iterator;

    .line 26
    sget-object v0, Lcom/trendmicro/hippo/NativeCollectionIterator$Type;->BOTH:Lcom/trendmicro/hippo/NativeCollectionIterator$Type;

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->type:Lcom/trendmicro/hippo/NativeCollectionIterator$Type;

    .line 27
    return-void
.end method

.method static init(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Z)V
    .locals 1
    .param p0, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "sealed"    # Z

    .line 19
    new-instance v0, Lcom/trendmicro/hippo/NativeCollectionIterator;

    invoke-direct {v0, p1}, Lcom/trendmicro/hippo/NativeCollectionIterator;-><init>(Ljava/lang/String;)V

    invoke-static {p0, p2, v0, p1}, Lcom/trendmicro/hippo/ES6Iterator;->init(Lcom/trendmicro/hippo/ScriptableObject;ZLcom/trendmicro/hippo/IdScriptableObject;Ljava/lang/String;)V

    .line 20
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .param p1, "stream"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 67
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 68
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->className:Ljava/lang/String;

    .line 69
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/NativeCollectionIterator$Type;

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->type:Lcom/trendmicro/hippo/NativeCollectionIterator$Type;

    .line 70
    invoke-static {}, Ljava/util/Collections;->emptyIterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->iterator:Ljava/util/Iterator;

    .line 71
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .param p1, "stream"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 76
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 77
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->className:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 78
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->type:Lcom/trendmicro/hippo/NativeCollectionIterator$Type;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 79
    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->className:Ljava/lang/String;

    return-object v0
.end method

.method protected isDone(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 46
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method protected nextValue(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 51
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 52
    .local v0, "e":Lcom/trendmicro/hippo/Hashtable$Entry;
    sget-object v1, Lcom/trendmicro/hippo/NativeCollectionIterator$1;->$SwitchMap$com$trendmicro$hippo$NativeCollectionIterator$Type:[I

    iget-object v2, p0, Lcom/trendmicro/hippo/NativeCollectionIterator;->type:Lcom/trendmicro/hippo/NativeCollectionIterator$Type;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/NativeCollectionIterator$Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    const/4 v3, 0x2

    if-eq v1, v3, :cond_1

    const/4 v4, 0x3

    if-ne v1, v4, :cond_0

    .line 58
    new-array v1, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, v0, Lcom/trendmicro/hippo/Hashtable$Entry;->key:Ljava/lang/Object;

    aput-object v4, v1, v3

    iget-object v3, v0, Lcom/trendmicro/hippo/Hashtable$Entry;->value:Ljava/lang/Object;

    aput-object v3, v1, v2

    invoke-virtual {p1, p2, v1}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1

    .line 60
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 56
    :cond_1
    iget-object v1, v0, Lcom/trendmicro/hippo/Hashtable$Entry;->value:Ljava/lang/Object;

    return-object v1

    .line 54
    :cond_2
    iget-object v1, v0, Lcom/trendmicro/hippo/Hashtable$Entry;->key:Ljava/lang/Object;

    return-object v1
.end method
