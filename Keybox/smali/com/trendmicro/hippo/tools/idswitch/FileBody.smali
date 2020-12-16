.class public Lcom/trendmicro/hippo/tools/idswitch/FileBody;
.super Ljava/lang/Object;
.source "FileBody.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;
    }
.end annotation


# instance fields
.field private buffer:[C

.field private bufferEnd:I

.field firstReplace:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

.field lastReplace:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

.field private lineBegin:I

.field private lineEnd:I

.field private lineNumber:I

.field private nextLineStart:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/16 v0, 0x4000

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->buffer:[C

    return-void
.end method

.method private static equals(Ljava/lang/String;[CII)Z
    .locals 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "array"    # [C
    .param p2, "begin"    # I
    .param p3, "end"    # I

    .line 148
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int v1, p3, p2

    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    .line 149
    move v0, p2

    .local v0, "i":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    if-eq v0, p3, :cond_1

    .line 150
    aget-char v3, p1, v0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v3, v4, :cond_0

    return v2

    .line 149
    :cond_0
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 152
    .end local v0    # "i":I
    .end local v1    # "j":I
    :cond_1
    const/4 v0, 0x1

    return v0

    .line 154
    :cond_2
    return v2
.end method


# virtual methods
.method public getBuffer()[C
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->buffer:[C

    return-object v0
.end method

.method public getLineBegin()I
    .locals 1

    .line 113
    iget v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lineBegin:I

    return v0
.end method

.method public getLineEnd()I
    .locals 1

    .line 115
    iget v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lineEnd:I

    return v0
.end method

.method public getLineNumber()I
    .locals 1

    .line 111
    iget v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lineNumber:I

    return v0
.end method

.method public nextLine()Z
    .locals 5

    .line 123
    iget v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->nextLineStart:I

    iget v1, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->bufferEnd:I

    if-ne v0, v1, :cond_0

    .line 124
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lineNumber:I

    return v0

    .line 126
    :cond_0
    const/4 v0, 0x0

    .line 127
    .local v0, "c":I
    iget v1, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->nextLineStart:I

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->bufferEnd:I

    const/16 v3, 0xd

    const/16 v4, 0xa

    if-eq v1, v2, :cond_2

    .line 128
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->buffer:[C

    aget-char v0, v2, v1

    .line 129
    if-eq v0, v4, :cond_2

    if-ne v0, v3, :cond_1

    goto :goto_1

    .line 127
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 131
    :cond_2
    :goto_1
    iget v2, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->nextLineStart:I

    iput v2, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lineBegin:I

    .line 132
    iput v1, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lineEnd:I

    .line 133
    iget v2, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->bufferEnd:I

    if-ne v1, v2, :cond_3

    .line 134
    iput v1, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->nextLineStart:I

    goto :goto_2

    .line 136
    :cond_3
    if-ne v0, v3, :cond_4

    add-int/lit8 v3, v1, 0x1

    if-eq v3, v2, :cond_4

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->buffer:[C

    add-int/lit8 v3, v1, 0x1

    aget-char v2, v2, v3

    if-ne v2, v4, :cond_4

    .line 137
    add-int/lit8 v2, v1, 0x2

    iput v2, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->nextLineStart:I

    goto :goto_2

    .line 140
    :cond_4
    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->nextLineStart:I

    .line 142
    :goto_2
    iget v2, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lineNumber:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lineNumber:I

    .line 143
    return v3
.end method

.method public readData(Ljava/io/Reader;)V
    .locals 6
    .param p1, "r"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->buffer:[C

    array-length v0, v0

    .line 43
    .local v0, "capacity":I
    const/4 v1, 0x0

    .line 45
    .local v1, "offset":I
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->buffer:[C

    sub-int v3, v0, v1

    invoke-virtual {p1, v2, v1, v3}, Ljava/io/Reader;->read([CII)I

    move-result v2

    .line 46
    .local v2, "n_read":I
    if-gez v2, :cond_0

    .line 55
    .end local v2    # "n_read":I
    iput v1, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->bufferEnd:I

    .line 56
    return-void

    .line 47
    .restart local v2    # "n_read":I
    :cond_0
    add-int/2addr v1, v2

    .line 48
    if-ne v0, v1, :cond_1

    .line 49
    mul-int/lit8 v0, v0, 0x2

    .line 50
    new-array v3, v0, [C

    .line 51
    .local v3, "tmp":[C
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->buffer:[C

    const/4 v5, 0x0

    invoke-static {v4, v5, v3, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 52
    iput-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->buffer:[C

    .line 54
    .end local v2    # "n_read":I
    .end local v3    # "tmp":[C
    :cond_1
    goto :goto_0
.end method

.method public setReplacement(IILjava/lang/String;)Z
    .locals 4
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "text"    # Ljava/lang/String;

    .line 81
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->buffer:[C

    invoke-static {p3, v0, p1, p2}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->equals(Ljava/lang/String;[CII)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 83
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    invoke-direct {v0, p1, p2, p3}, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;-><init>(IILjava/lang/String;)V

    .line 84
    .local v0, "item":Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->firstReplace:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    if-nez v1, :cond_1

    .line 85
    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lastReplace:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->firstReplace:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    goto :goto_2

    .line 87
    :cond_1
    iget v1, v1, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;->begin:I

    if-ge p1, v1, :cond_2

    .line 88
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->firstReplace:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    iput-object v1, v0, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;->next:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    .line 89
    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->firstReplace:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    goto :goto_2

    .line 92
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->firstReplace:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    .line 93
    .local v1, "cursor":Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;
    iget-object v2, v1, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;->next:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    .line 94
    .local v2, "next":Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;
    :goto_0
    if-eqz v2, :cond_4

    .line 95
    iget v3, v2, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;->begin:I

    if-ge p1, v3, :cond_3

    .line 96
    iput-object v2, v0, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;->next:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    .line 97
    iput-object v0, v1, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;->next:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    .line 98
    goto :goto_1

    .line 100
    :cond_3
    move-object v1, v2

    .line 101
    iget-object v2, v2, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;->next:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    goto :goto_0

    .line 103
    :cond_4
    :goto_1
    if-nez v2, :cond_5

    .line 104
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lastReplace:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    iput-object v0, v3, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;->next:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    .line 108
    .end local v1    # "cursor":Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;
    .end local v2    # "next":Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;
    :cond_5
    :goto_2
    const/4 v1, 0x1

    return v1
.end method

.method public startLineLoop()V
    .locals 1

    .line 118
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lineNumber:I

    .line 119
    iput v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->nextLineStart:I

    iput v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lineEnd:I

    iput v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->lineBegin:I

    .line 120
    return-void
.end method

.method public wasModified()Z
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->firstReplace:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public writeData(Ljava/io/Writer;)V
    .locals 4
    .param p1, "w"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    const/4 v0, 0x0

    .line 64
    .local v0, "offset":I
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->firstReplace:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    .local v1, "x":Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;
    :goto_0
    if-eqz v1, :cond_1

    .line 65
    iget v2, v1, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;->begin:I

    sub-int/2addr v2, v0

    .line 66
    .local v2, "before_replace":I
    if-lez v2, :cond_0

    .line 67
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->buffer:[C

    invoke-virtual {p1, v3, v0, v2}, Ljava/io/Writer;->write([CII)V

    .line 69
    :cond_0
    iget-object v3, v1, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;->replacement:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 70
    iget v0, v1, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;->end:I

    .line 64
    .end local v2    # "before_replace":I
    iget-object v1, v1, Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;->next:Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;

    goto :goto_0

    .line 72
    .end local v1    # "x":Lcom/trendmicro/hippo/tools/idswitch/FileBody$ReplaceItem;
    :cond_1
    iget v1, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->bufferEnd:I

    sub-int/2addr v1, v0

    .line 73
    .local v1, "tail":I
    if-eqz v1, :cond_2

    .line 74
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->buffer:[C

    invoke-virtual {p1, v2, v0, v1}, Ljava/io/Writer;->write([CII)V

    .line 76
    :cond_2
    return-void
.end method

.method public writeInitialData(Ljava/io/Writer;)V
    .locals 3
    .param p1, "w"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->buffer:[C

    iget v1, p0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->bufferEnd:I

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/Writer;->write([CII)V

    .line 60
    return-void
.end method
