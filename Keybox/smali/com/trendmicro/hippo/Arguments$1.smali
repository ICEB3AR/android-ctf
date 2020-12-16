.class Lcom/trendmicro/hippo/Arguments$1;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "Arguments.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Arguments;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 406
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 414
    new-instance v0, Lcom/trendmicro/hippo/NativeArrayIterator;

    sget-object v1, Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;->VALUES:Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;

    invoke-direct {v0, p2, p3, v1}, Lcom/trendmicro/hippo/NativeArrayIterator;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;)V

    return-object v0
.end method
