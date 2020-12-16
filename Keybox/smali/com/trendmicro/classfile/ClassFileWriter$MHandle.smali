.class public final Lcom/trendmicro/classfile/ClassFileWriter$MHandle;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/classfile/ClassFileWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MHandle"
.end annotation


# instance fields
.field final desc:Ljava/lang/String;

.field final name:Ljava/lang/String;

.field final owner:Ljava/lang/String;

.field final tag:B


# direct methods
.method public constructor <init>(BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "tag"    # B
    .param p2, "owner"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "desc"    # Ljava/lang/String;

    .line 4487
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4488
    iput-byte p1, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->tag:B

    .line 4489
    iput-object p2, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->owner:Ljava/lang/String;

    .line 4490
    iput-object p3, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->name:Ljava/lang/String;

    .line 4491
    iput-object p4, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->desc:Ljava/lang/String;

    .line 4492
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .line 4496
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 4497
    return v0

    .line 4499
    :cond_0
    instance-of v1, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 4500
    return v2

    .line 4502
    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;

    .line 4503
    .local v1, "mh":Lcom/trendmicro/classfile/ClassFileWriter$MHandle;
    iget-byte v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->tag:B

    iget-byte v4, v1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->tag:B

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->owner:Ljava/lang/String;

    iget-object v4, v1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->owner:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->name:Ljava/lang/String;

    iget-object v4, v1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->name:Ljava/lang/String;

    .line 4504
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->desc:Ljava/lang/String;

    iget-object v4, v1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->desc:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    .line 4503
    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 4509
    iget-byte v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->tag:B

    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->owner:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    mul-int/2addr v1, v2

    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->desc:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 4514
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->owner:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->desc:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-byte v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->tag:B

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
