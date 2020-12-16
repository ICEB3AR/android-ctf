.class final Lcom/trendmicro/classfile/FieldOrMethodRef;
.super Ljava/lang/Object;
.source "FieldOrMethodRef.java"


# instance fields
.field private className:Ljava/lang/String;

.field private hashCode:I

.field private name:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->hashCode:I

    .line 13
    iput-object p1, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->className:Ljava/lang/String;

    .line 14
    iput-object p2, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->name:Ljava/lang/String;

    .line 15
    iput-object p3, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->type:Ljava/lang/String;

    .line 16
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .line 36
    instance-of v0, p1, Lcom/trendmicro/classfile/FieldOrMethodRef;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 37
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/classfile/FieldOrMethodRef;

    .line 38
    .local v0, "x":Lcom/trendmicro/classfile/FieldOrMethodRef;
    iget-object v2, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->className:Ljava/lang/String;

    iget-object v3, v0, Lcom/trendmicro/classfile/FieldOrMethodRef;->className:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->name:Ljava/lang/String;

    iget-object v3, v0, Lcom/trendmicro/classfile/FieldOrMethodRef;->name:Ljava/lang/String;

    .line 39
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->type:Ljava/lang/String;

    iget-object v3, v0, Lcom/trendmicro/classfile/FieldOrMethodRef;->type:Ljava/lang/String;

    .line 40
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    nop

    .line 38
    :goto_0
    return v1
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->type:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 46
    iget v0, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->hashCode:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 47
    iget-object v0, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->className:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 48
    .local v0, "h1":I
    iget-object v1, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    .line 49
    .local v1, "h2":I
    iget-object v2, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->type:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    .line 50
    .local v2, "h3":I
    xor-int v3, v0, v1

    xor-int/2addr v3, v2

    iput v3, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->hashCode:I

    .line 52
    .end local v0    # "h1":I
    .end local v1    # "h2":I
    .end local v2    # "h3":I
    :cond_0
    iget v0, p0, Lcom/trendmicro/classfile/FieldOrMethodRef;->hashCode:I

    return v0
.end method
