.class final Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/classfile/ClassFileWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "BootstrapEntry"
.end annotation


# instance fields
.field final code:[B

.field final synthetic this$0:Lcom/trendmicro/classfile/ClassFileWriter;


# direct methods
.method varargs constructor <init>(Lcom/trendmicro/classfile/ClassFileWriter;Lcom/trendmicro/classfile/ClassFileWriter$MHandle;[Ljava/lang/Object;)V
    .locals 5
    .param p1, "this$0"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p2, "bsm"    # Lcom/trendmicro/classfile/ClassFileWriter$MHandle;
    .param p3, "bsmArgs"    # [Ljava/lang/Object;

    .line 4458
    iput-object p1, p0, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4459
    array-length v0, p3

    const/4 v1, 0x2

    mul-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x4

    .line 4460
    .local v0, "length":I
    new-array v2, v0, [B

    iput-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;->code:[B

    .line 4461
    invoke-static {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/trendmicro/classfile/ConstantPool;->addMethodHandle(Lcom/trendmicro/classfile/ClassFileWriter$MHandle;)S

    move-result v2

    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;->code:[B

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    .line 4462
    array-length v2, p3

    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;->code:[B

    invoke-static {v2, v3, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    .line 4463
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p3

    if-ge v1, v2, :cond_0

    .line 4464
    invoke-static {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v2

    aget-object v3, p3, v1

    invoke-virtual {v2, v3}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(Ljava/lang/Object;)I

    move-result v2

    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;->code:[B

    mul-int/lit8 v4, v1, 0x2

    add-int/lit8 v4, v4, 0x4

    invoke-static {v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    .line 4463
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 4466
    .end local v1    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .line 4470
    instance-of v0, p1, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;->code:[B

    move-object v1, p1

    check-cast v1, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;

    iget-object v1, v1, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;->code:[B

    .line 4471
    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 4470
    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 4476
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;->code:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    not-int v0, v0

    return v0
.end method
