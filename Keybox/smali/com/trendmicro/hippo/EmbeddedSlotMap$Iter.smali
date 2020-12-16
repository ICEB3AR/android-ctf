.class final Lcom/trendmicro/hippo/EmbeddedSlotMap$Iter;
.super Ljava/lang/Object;
.source "EmbeddedSlotMap.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/EmbeddedSlotMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Iter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/trendmicro/hippo/ScriptableObject$Slot;",
        ">;"
    }
.end annotation


# instance fields
.field private next:Lcom/trendmicro/hippo/ScriptableObject$Slot;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V
    .locals 0
    .param p1, "slot"    # Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap$Iter;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 41
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap$Iter;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 2

    .line 50
    iget-object v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap$Iter;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 51
    .local v0, "ret":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    iget-object v1, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap$Iter;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    iget-object v1, v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;->orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    iput-object v1, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap$Iter;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 52
    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 34
    invoke-virtual {p0}, Lcom/trendmicro/hippo/EmbeddedSlotMap$Iter;->next()Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    return-object v0
.end method
