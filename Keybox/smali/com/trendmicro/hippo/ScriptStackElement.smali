.class public final Lcom/trendmicro/hippo/ScriptStackElement;
.super Ljava/lang/Object;
.source "ScriptStackElement.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x590ca7f9e7020009L


# instance fields
.field public final fileName:Ljava/lang/String;

.field public final functionName:Ljava/lang/String;

.field public final lineNumber:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "functionName"    # Ljava/lang/String;
    .param p3, "lineNumber"    # I

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/trendmicro/hippo/ScriptStackElement;->fileName:Ljava/lang/String;

    .line 25
    iput-object p2, p0, Lcom/trendmicro/hippo/ScriptStackElement;->functionName:Ljava/lang/String;

    .line 26
    iput p3, p0, Lcom/trendmicro/hippo/ScriptStackElement;->lineNumber:I

    .line 27
    return-void
.end method

.method private appendV8Location(Ljava/lang/StringBuilder;)V
    .locals 2
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .line 92
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->fileName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x3a

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 93
    iget v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->lineNumber:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ":0"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    return-void
.end method


# virtual methods
.method public renderJavaStyle(Ljava/lang/StringBuilder;)V
    .locals 2
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .line 43
    const-string v0, "\tat "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->fileName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    iget v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->lineNumber:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    .line 45
    const/16 v0, 0x3a

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->lineNumber:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->functionName:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 48
    const-string v0, " ("

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->functionName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x29

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 50
    :cond_1
    return-void
.end method

.method public renderTrendMicroStyle(Ljava/lang/StringBuilder;)V
    .locals 2
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .line 59
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->functionName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 60
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "()"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    :cond_0
    const/16 v0, 0x40

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->fileName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    iget v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->lineNumber:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_1

    .line 64
    const/16 v0, 0x3a

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->lineNumber:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    :cond_1
    return-void
.end method

.method public renderV8Style(Ljava/lang/StringBuilder;)V
    .locals 2
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .line 77
    const-string v0, "    at "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->functionName:Ljava/lang/String;

    if-eqz v0, :cond_1

    const-string v1, "anonymous"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->functionName:Ljava/lang/String;

    .line 80
    const-string v1, "undefined"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptStackElement;->functionName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " ("

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ScriptStackElement;->appendV8Location(Ljava/lang/StringBuilder;)V

    .line 87
    const/16 v0, 0x29

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 82
    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ScriptStackElement;->appendV8Location(Ljava/lang/StringBuilder;)V

    .line 89
    :goto_1
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ScriptStackElement;->renderTrendMicroStyle(Ljava/lang/StringBuilder;)V

    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
