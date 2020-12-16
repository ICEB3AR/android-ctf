.class public Lcom/trendmicro/hippo/ast/ParseProblem;
.super Ljava/lang/Object;
.source "ParseProblem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/ast/ParseProblem$Type;
    }
.end annotation


# instance fields
.field private length:I

.field private message:Ljava/lang/String;

.field private offset:I

.field private sourceName:Ljava/lang/String;

.field private type:Lcom/trendmicro/hippo/ast/ParseProblem$Type;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/ast/ParseProblem$Type;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0
    .param p1, "type"    # Lcom/trendmicro/hippo/ast/ParseProblem$Type;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "sourceName"    # Ljava/lang/String;
    .param p4, "offset"    # I
    .param p5, "length"    # I

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ParseProblem;->setType(Lcom/trendmicro/hippo/ast/ParseProblem$Type;)V

    .line 28
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/ParseProblem;->setMessage(Ljava/lang/String;)V

    .line 29
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ast/ParseProblem;->setSourceName(Ljava/lang/String;)V

    .line 30
    invoke-virtual {p0, p4}, Lcom/trendmicro/hippo/ast/ParseProblem;->setFileOffset(I)V

    .line 31
    invoke-virtual {p0, p5}, Lcom/trendmicro/hippo/ast/ParseProblem;->setLength(I)V

    .line 32
    return-void
.end method


# virtual methods
.method public getFileOffset()I
    .locals 1

    .line 59
    iget v0, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->offset:I

    return v0
.end method

.method public getLength()I
    .locals 1

    .line 67
    iget v0, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->length:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getSourceName()Ljava/lang/String;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->sourceName:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lcom/trendmicro/hippo/ast/ParseProblem$Type;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->type:Lcom/trendmicro/hippo/ast/ParseProblem$Type;

    return-object v0
.end method

.method public setFileOffset(I)V
    .locals 0
    .param p1, "offset"    # I

    .line 63
    iput p1, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->offset:I

    .line 64
    return-void
.end method

.method public setLength(I)V
    .locals 0
    .param p1, "length"    # I

    .line 71
    iput p1, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->length:I

    .line 72
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .line 47
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->message:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public setSourceName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 55
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->sourceName:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public setType(Lcom/trendmicro/hippo/ast/ParseProblem$Type;)V
    .locals 0
    .param p1, "type"    # Lcom/trendmicro/hippo/ast/ParseProblem$Type;

    .line 39
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->type:Lcom/trendmicro/hippo/ast/ParseProblem$Type;

    .line 40
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 77
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->sourceName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    const-string v1, "offset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->offset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    const-string v2, "length="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->length:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->type:Lcom/trendmicro/hippo/ast/ParseProblem$Type;

    sget-object v2, Lcom/trendmicro/hippo/ast/ParseProblem$Type;->Error:Lcom/trendmicro/hippo/ast/ParseProblem$Type;

    if-ne v1, v2, :cond_0

    const-string v1, "error: "

    goto :goto_0

    :cond_0
    const-string v1, "warning: "

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ParseProblem;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
