.class final Lcom/trendmicro/hippo/Hashtable$Iter;
.super Ljava/lang/Object;
.source "Hashtable.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Hashtable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Iter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/trendmicro/hippo/Hashtable$Entry;",
        ">;"
    }
.end annotation


# instance fields
.field private pos:Lcom/trendmicro/hippo/Hashtable$Entry;

.field final synthetic this$0:Lcom/trendmicro/hippo/Hashtable;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/Hashtable;Lcom/trendmicro/hippo/Hashtable$Entry;)V
    .locals 0
    .param p2, "start"    # Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 223
    iput-object p1, p0, Lcom/trendmicro/hippo/Hashtable$Iter;->this$0:Lcom/trendmicro/hippo/Hashtable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 225
    invoke-static {p1}, Lcom/trendmicro/hippo/Hashtable;->access$000(Lcom/trendmicro/hippo/Hashtable;)Lcom/trendmicro/hippo/Hashtable$Entry;

    move-result-object p1

    .line 226
    .local p1, "dummy":Lcom/trendmicro/hippo/Hashtable$Entry;
    iput-object p2, p1, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 227
    iput-object p1, p0, Lcom/trendmicro/hippo/Hashtable$Iter;->pos:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 228
    return-void
.end method

.method private skipDeleted()V
    .locals 1

    .line 234
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Iter;->pos:Lcom/trendmicro/hippo/Hashtable$Entry;

    iget-object v0, v0, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Iter;->pos:Lcom/trendmicro/hippo/Hashtable$Entry;

    iget-object v0, v0, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    iget-boolean v0, v0, Lcom/trendmicro/hippo/Hashtable$Entry;->deleted:Z

    if-eqz v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Iter;->pos:Lcom/trendmicro/hippo/Hashtable$Entry;

    iget-object v0, v0, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    iput-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Iter;->pos:Lcom/trendmicro/hippo/Hashtable$Entry;

    goto :goto_0

    .line 237
    :cond_0
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 241
    invoke-direct {p0}, Lcom/trendmicro/hippo/Hashtable$Iter;->skipDeleted()V

    .line 242
    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Iter;->pos:Lcom/trendmicro/hippo/Hashtable$Entry;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Lcom/trendmicro/hippo/Hashtable$Entry;
    .locals 2

    .line 247
    invoke-direct {p0}, Lcom/trendmicro/hippo/Hashtable$Iter;->skipDeleted()V

    .line 248
    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Iter;->pos:Lcom/trendmicro/hippo/Hashtable$Entry;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    if-eqz v0, :cond_0

    .line 251
    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Iter;->pos:Lcom/trendmicro/hippo/Hashtable$Entry;

    iget-object v0, v0, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 252
    .local v0, "e":Lcom/trendmicro/hippo/Hashtable$Entry;
    iget-object v1, p0, Lcom/trendmicro/hippo/Hashtable$Iter;->pos:Lcom/trendmicro/hippo/Hashtable$Entry;

    iget-object v1, v1, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    iput-object v1, p0, Lcom/trendmicro/hippo/Hashtable$Iter;->pos:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 253
    return-object v0

    .line 249
    .end local v0    # "e":Lcom/trendmicro/hippo/Hashtable$Entry;
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 218
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Hashtable$Iter;->next()Lcom/trendmicro/hippo/Hashtable$Entry;

    move-result-object v0

    return-object v0
.end method
