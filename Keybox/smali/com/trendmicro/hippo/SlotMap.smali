.class public interface abstract Lcom/trendmicro/hippo/SlotMap;
.super Ljava/lang/Object;
.source "SlotMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/trendmicro/hippo/ScriptableObject$Slot;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract addSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V
.end method

.method public abstract get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;
.end method

.method public abstract isEmpty()Z
.end method

.method public abstract query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;
.end method

.method public abstract remove(Ljava/lang/Object;I)V
.end method

.method public abstract size()I
.end method
