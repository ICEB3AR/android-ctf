.class public Lcom/trendmicro/hippo/IdFunctionObjectES6;
.super Lcom/trendmicro/hippo/IdFunctionObject;
.source "IdFunctionObjectES6.java"


# static fields
.field private static final Id_length:I = 0x1

.field private static final Id_name:I = 0x3


# instance fields
.field private myLength:Z

.field private myName:Z


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "idcall"    # Lcom/trendmicro/hippo/IdFunctionCall;
    .param p2, "tag"    # Ljava/lang/Object;
    .param p3, "id"    # I
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "arity"    # I
    .param p6, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 6
    invoke-direct/range {p0 .. p6}, Lcom/trendmicro/hippo/IdFunctionObject;-><init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)V

    .line 13
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/IdFunctionObjectES6;->myLength:Z

    .line 14
    iput-boolean v0, p0, Lcom/trendmicro/hippo/IdFunctionObjectES6;->myName:Z

    .line 7
    return-void
.end method


# virtual methods
.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 18
    const-string v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x3

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/IdFunctionObjectES6;->instanceIdInfo(II)I

    move-result v0

    return v0

    .line 19
    :cond_0
    const-string v0, "name"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {v1, v1}, Lcom/trendmicro/hippo/IdFunctionObjectES6;->instanceIdInfo(II)I

    move-result v0

    return v0

    .line 20
    :cond_1
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdFunctionObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # I

    .line 25
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-boolean v0, p0, Lcom/trendmicro/hippo/IdFunctionObjectES6;->myLength:Z

    if-nez v0, :cond_0

    .line 26
    sget-object v0, Lcom/trendmicro/hippo/IdFunctionObjectES6;->NOT_FOUND:Ljava/lang/Object;

    return-object v0

    .line 27
    :cond_0
    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    iget-boolean v0, p0, Lcom/trendmicro/hippo/IdFunctionObjectES6;->myName:Z

    if-nez v0, :cond_1

    .line 28
    sget-object v0, Lcom/trendmicro/hippo/IdFunctionObjectES6;->NOT_FOUND:Ljava/lang/Object;

    return-object v0

    .line 30
    :cond_1
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdFunctionObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 35
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    sget-object v1, Lcom/trendmicro/hippo/IdFunctionObjectES6;->NOT_FOUND:Ljava/lang/Object;

    if-ne p2, v1, :cond_0

    .line 36
    iput-boolean v0, p0, Lcom/trendmicro/hippo/IdFunctionObjectES6;->myLength:Z

    .line 37
    return-void

    .line 38
    :cond_0
    const/4 v1, 0x3

    if-ne p1, v1, :cond_1

    sget-object v1, Lcom/trendmicro/hippo/IdFunctionObjectES6;->NOT_FOUND:Ljava/lang/Object;

    if-ne p2, v1, :cond_1

    .line 39
    iput-boolean v0, p0, Lcom/trendmicro/hippo/IdFunctionObjectES6;->myName:Z

    .line 40
    return-void

    .line 42
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdFunctionObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 43
    return-void
.end method
