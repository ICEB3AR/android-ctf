.class Lcom/trendmicro/hippo/NativeJSON$StringifyState;
.super Ljava/lang/Object;
.source "NativeJSON.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/NativeJSON;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StringifyState"
.end annotation


# instance fields
.field cx:Lcom/trendmicro/hippo/Context;

.field gap:Ljava/lang/String;

.field indent:Ljava/lang/String;

.field propertyList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field replacer:Lcom/trendmicro/hippo/Callable;

.field scope:Lcom/trendmicro/hippo/Scriptable;

.field space:Ljava/lang/Object;

.field stack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/trendmicro/hippo/Scriptable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;Lcom/trendmicro/hippo/Callable;Ljava/util/List;Ljava/lang/Object;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "indent"    # Ljava/lang/String;
    .param p4, "gap"    # Ljava/lang/String;
    .param p5, "replacer"    # Lcom/trendmicro/hippo/Callable;
    .param p7, "space"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Context;",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/Callable;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 190
    .local p6, "propertyList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 201
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->stack:Ljava/util/Stack;

    .line 191
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->cx:Lcom/trendmicro/hippo/Context;

    .line 192
    iput-object p2, p0, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 194
    iput-object p3, p0, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    .line 195
    iput-object p4, p0, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->gap:Ljava/lang/String;

    .line 196
    iput-object p5, p0, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->replacer:Lcom/trendmicro/hippo/Callable;

    .line 197
    iput-object p6, p0, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->propertyList:Ljava/util/List;

    .line 198
    iput-object p7, p0, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->space:Ljava/lang/Object;

    .line 199
    return-void
.end method
