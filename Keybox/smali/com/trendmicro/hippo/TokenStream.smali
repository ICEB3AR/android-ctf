.class Lcom/trendmicro/hippo/TokenStream;
.super Ljava/lang/Object;
.source "TokenStream.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final BYTE_ORDER_MARK:C = '\ufeff'

.field private static final EOF_CHAR:I = -0x1


# instance fields
.field private allStrings:Lcom/trendmicro/hippo/ObjToIntMap;

.field private commentCursor:I

.field private commentPrefix:Ljava/lang/String;

.field commentType:Lcom/trendmicro/hippo/Token$CommentType;

.field cursor:I

.field private dirtyLine:Z

.field private hitEOF:Z

.field private isBinary:Z

.field private isHex:Z

.field private isOctal:Z

.field private isOldOctal:Z

.field private lineEndChar:I

.field private lineStart:I

.field lineno:I

.field private number:D

.field private parser:Lcom/trendmicro/hippo/Parser;

.field private quoteChar:I

.field regExpFlags:Ljava/lang/String;

.field private sourceBuffer:[C

.field sourceCursor:I

.field private sourceEnd:I

.field private sourceReader:Ljava/io/Reader;

.field private sourceString:Ljava/lang/String;

.field private string:Ljava/lang/String;

.field private stringBuffer:[C

.field private stringBufferTop:I

.field tokenBeg:I

.field tokenEnd:I

.field private final ungetBuffer:[I

.field private ungetCursor:I

.field private xmlIsAttribute:Z

.field private xmlIsTagContent:Z

.field private xmlOpenTagsCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 24
    return-void
.end method

.method constructor <init>(Lcom/trendmicro/hippo/Parser;Ljava/io/Reader;Ljava/lang/String;I)V
    .locals 3
    .param p1, "parser"    # Lcom/trendmicro/hippo/Parser;
    .param p2, "sourceReader"    # Ljava/io/Reader;
    .param p3, "sourceString"    # Ljava/lang/String;
    .param p4, "lineno"    # I

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1793
    const-string v0, ""

    iput-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1803
    const/16 v1, 0x80

    new-array v1, v1, [C

    iput-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->stringBuffer:[C

    .line 1805
    new-instance v1, Lcom/trendmicro/hippo/ObjToIntMap;

    const/16 v2, 0x32

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>(I)V

    iput-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->allStrings:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 1808
    const/4 v1, 0x3

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->ungetBuffer:[I

    .line 1811
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/trendmicro/hippo/TokenStream;->hitEOF:Z

    .line 1813
    iput v1, p0, Lcom/trendmicro/hippo/TokenStream;->lineStart:I

    .line 1814
    const/4 v2, -0x1

    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->lineEndChar:I

    .line 1845
    iput-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->commentPrefix:Ljava/lang/String;

    .line 1846
    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->commentCursor:I

    .line 39
    iput-object p1, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    .line 40
    iput p4, p0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 41
    if-eqz p2, :cond_1

    .line 42
    if-eqz p3, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 43
    :cond_0
    iput-object p2, p0, Lcom/trendmicro/hippo/TokenStream;->sourceReader:Ljava/io/Reader;

    .line 44
    const/16 v0, 0x200

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceBuffer:[C

    .line 45
    iput v1, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    goto :goto_0

    .line 47
    :cond_1
    if-nez p3, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 48
    :cond_2
    iput-object p3, p0, Lcom/trendmicro/hippo/TokenStream;->sourceString:Ljava/lang/String;

    .line 49
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    .line 51
    :goto_0
    iput v1, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    iput v1, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    .line 52
    return-void
.end method

.method private addToString(I)V
    .locals 4
    .param p1, "c"    # I

    .line 1413
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1414
    .local v0, "N":I
    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->stringBuffer:[C

    array-length v2, v1

    if-ne v0, v2, :cond_0

    .line 1415
    array-length v2, v1

    mul-int/lit8 v2, v2, 0x2

    new-array v2, v2, [C

    .line 1416
    .local v2, "tmp":[C
    const/4 v3, 0x0

    invoke-static {v1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1417
    iput-object v2, p0, Lcom/trendmicro/hippo/TokenStream;->stringBuffer:[C

    .line 1419
    .end local v2    # "tmp":[C
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->stringBuffer:[C

    int-to-char v2, p1

    aput-char v2, v1, v0

    .line 1420
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1421
    return-void
.end method

.method private canUngetChar()Z
    .locals 3

    .line 1424
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->ungetCursor:I

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/trendmicro/hippo/TokenStream;->ungetBuffer:[I

    sub-int/2addr v0, v1

    aget v0, v2, v0

    const/16 v2, 0xa

    if-eq v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method private final charAt(I)I
    .locals 3
    .param p1, "index"    # I

    .line 1587
    const/4 v0, -0x1

    if-gez p1, :cond_0

    .line 1588
    return v0

    .line 1590
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->sourceString:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 1591
    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    if-lt p1, v2, :cond_1

    .line 1592
    return v0

    .line 1594
    :cond_1
    invoke-virtual {v1, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0

    .line 1596
    :cond_2
    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    if-lt p1, v1, :cond_4

    .line 1597
    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    .line 1599
    .local v1, "oldSourceCursor":I
    :try_start_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->fillSourceBuffer()Z

    move-result v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v2, :cond_3

    return v0

    .line 1603
    :cond_3
    nop

    .line 1606
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    sub-int v0, v1, v0

    sub-int/2addr p1, v0

    goto :goto_0

    .line 1600
    :catch_0
    move-exception v2

    .line 1602
    .local v2, "ioe":Ljava/io/IOException;
    return v0

    .line 1608
    .end local v1    # "oldSourceCursor":I
    .end local v2    # "ioe":Ljava/io/IOException;
    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceBuffer:[C

    aget-char v0, v0, p1

    return v0
.end method

.method private convertLastCharToHex(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "str"    # Ljava/lang/String;

    .line 1772
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 1773
    .local v0, "lastIndex":I
    new-instance v1, Ljava/lang/StringBuilder;

    .line 1774
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1775
    .local v1, "buf":Ljava/lang/StringBuilder;
    const-string v2, "\\u"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1776
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    .line 1777
    .local v2, "hexCode":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    rsub-int/lit8 v4, v4, 0x4

    if-ge v3, v4, :cond_0

    .line 1778
    const/16 v4, 0x30

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1777
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1780
    .end local v3    # "i":I
    :cond_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1781
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private fillSourceBuffer()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1684
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceString:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1685
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->sourceBuffer:[C

    array-length v1, v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    .line 1686
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->lineStart:I

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->isMarkingComment()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1687
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceBuffer:[C

    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->lineStart:I

    iget v3, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    sub-int/2addr v3, v1

    invoke-static {v0, v1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1689
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->lineStart:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    .line 1690
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    .line 1691
    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->lineStart:I

    goto :goto_0

    .line 1693
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceBuffer:[C

    array-length v1, v0

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [C

    .line 1694
    .local v1, "tmp":[C
    iget v3, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    invoke-static {v0, v2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1695
    iput-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->sourceBuffer:[C

    .line 1698
    .end local v1    # "tmp":[C
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceReader:Ljava/io/Reader;

    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->sourceBuffer:[C

    iget v3, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    array-length v4, v1

    sub-int/2addr v4, v3

    invoke-virtual {v0, v1, v3, v4}, Ljava/io/Reader;->read([CII)I

    move-result v0

    .line 1700
    .local v0, "n":I
    if-gez v0, :cond_3

    .line 1701
    return v2

    .line 1703
    :cond_3
    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    .line 1704
    const/4 v1, 0x1

    return v1
.end method

.method private getChar()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1456
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->getChar(Z)I

    move-result v0

    return v0
.end method

.method private getChar(Z)I
    .locals 6
    .param p1, "skipFormattingChars"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1461
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->ungetCursor:I

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1462
    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    .line 1463
    iget-object v2, p0, Lcom/trendmicro/hippo/TokenStream;->ungetBuffer:[I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->ungetCursor:I

    aget v0, v2, v0

    return v0

    .line 1468
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceString:Ljava/lang/String;

    const/4 v2, -0x1

    if-eqz v0, :cond_2

    .line 1469
    iget v3, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    iget v4, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    if-ne v3, v4, :cond_1

    .line 1470
    iput-boolean v1, p0, Lcom/trendmicro/hippo/TokenStream;->hitEOF:Z

    .line 1471
    return v2

    .line 1473
    :cond_1
    iget v4, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    add-int/2addr v4, v1

    iput v4, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    .line 1474
    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .local v0, "c":I
    goto :goto_1

    .line 1476
    .end local v0    # "c":I
    :cond_2
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    iget v3, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    if-ne v0, v3, :cond_3

    .line 1477
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->fillSourceBuffer()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1478
    iput-boolean v1, p0, Lcom/trendmicro/hippo/TokenStream;->hitEOF:Z

    .line 1479
    return v2

    .line 1482
    :cond_3
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    .line 1483
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceBuffer:[C

    iget v3, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    aget-char v0, v0, v3

    .line 1486
    .restart local v0    # "c":I
    :goto_1
    iget v3, p0, Lcom/trendmicro/hippo/TokenStream;->lineEndChar:I

    const/16 v4, 0xd

    const/16 v5, 0xa

    if-ltz v3, :cond_5

    .line 1487
    if-ne v3, v4, :cond_4

    if-ne v0, v5, :cond_4

    .line 1488
    iput v5, p0, Lcom/trendmicro/hippo/TokenStream;->lineEndChar:I

    .line 1489
    goto :goto_0

    .line 1491
    :cond_4
    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->lineEndChar:I

    .line 1492
    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    sub-int/2addr v2, v1

    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->lineStart:I

    .line 1493
    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    .line 1496
    :cond_5
    const/16 v2, 0x7f

    if-gt v0, v2, :cond_7

    .line 1497
    if-eq v0, v5, :cond_6

    if-ne v0, v4, :cond_a

    .line 1498
    :cond_6
    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->lineEndChar:I

    .line 1499
    const/16 v0, 0xa

    goto :goto_2

    .line 1502
    :cond_7
    const v2, 0xfeff

    if-ne v0, v2, :cond_8

    return v0

    .line 1503
    :cond_8
    if-eqz p1, :cond_9

    invoke-static {v0}, Lcom/trendmicro/hippo/TokenStream;->isJSFormatChar(I)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 1504
    goto :goto_0

    .line 1506
    :cond_9
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 1507
    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->lineEndChar:I

    .line 1508
    const/16 v0, 0xa

    .line 1511
    :cond_a
    :goto_2
    return v0
.end method

.method private getCharIgnoreLineEnd()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1517
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->ungetCursor:I

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1518
    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    .line 1519
    iget-object v2, p0, Lcom/trendmicro/hippo/TokenStream;->ungetBuffer:[I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->ungetCursor:I

    aget v0, v2, v0

    return v0

    .line 1524
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceString:Ljava/lang/String;

    const/4 v2, -0x1

    if-eqz v0, :cond_2

    .line 1525
    iget v3, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    iget v4, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    if-ne v3, v4, :cond_1

    .line 1526
    iput-boolean v1, p0, Lcom/trendmicro/hippo/TokenStream;->hitEOF:Z

    .line 1527
    return v2

    .line 1529
    :cond_1
    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    .line 1530
    add-int/lit8 v2, v3, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .local v0, "c":I
    goto :goto_1

    .line 1532
    .end local v0    # "c":I
    :cond_2
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    iget v3, p0, Lcom/trendmicro/hippo/TokenStream;->sourceEnd:I

    if-ne v0, v3, :cond_3

    .line 1533
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->fillSourceBuffer()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1534
    iput-boolean v1, p0, Lcom/trendmicro/hippo/TokenStream;->hitEOF:Z

    .line 1535
    return v2

    .line 1538
    :cond_3
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    .line 1539
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceBuffer:[C

    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    aget-char v0, v0, v2

    .line 1542
    .restart local v0    # "c":I
    :goto_1
    const/16 v2, 0x7f

    if-gt v0, v2, :cond_5

    .line 1543
    const/16 v1, 0xa

    if-eq v0, v1, :cond_4

    const/16 v1, 0xd

    if-ne v0, v1, :cond_8

    .line 1544
    :cond_4
    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->lineEndChar:I

    .line 1545
    const/16 v0, 0xa

    goto :goto_2

    .line 1548
    :cond_5
    const v2, 0xfeff

    if-ne v0, v2, :cond_6

    return v0

    .line 1549
    :cond_6
    invoke-static {v0}, Lcom/trendmicro/hippo/TokenStream;->isJSFormatChar(I)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1550
    goto :goto_0

    .line 1552
    :cond_7
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1553
    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->lineEndChar:I

    .line 1554
    const/16 v0, 0xa

    .line 1557
    :cond_8
    :goto_2
    return v0
.end method

.method private getStringFromBuffer()Ljava/lang/String;
    .locals 4

    .line 1407
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 1408
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->stringBuffer:[C

    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method private static isAlpha(I)Z
    .locals 3
    .param p0, "c"    # I

    .line 1029
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/16 v2, 0x5a

    if-gt p0, v2, :cond_1

    .line 1030
    const/16 v2, 0x41

    if-gt v2, p0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    return v0

    .line 1032
    :cond_1
    const/16 v2, 0x61

    if-gt v2, p0, :cond_2

    const/16 v2, 0x7a

    if-gt p0, v2, :cond_2

    goto :goto_1

    :cond_2
    move v0, v1

    :goto_1
    return v0
.end method

.method static isDigit(I)Z
    .locals 1
    .param p0, "c"    # I

    .line 1037
    const/16 v0, 0x30

    if-gt v0, p0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isJSFormatChar(I)Z
    .locals 2
    .param p0, "c"    # I

    .line 1055
    const/16 v0, 0x7f

    if-le p0, v0, :cond_0

    int-to-char v0, p0

    invoke-static {v0}, Ljava/lang/Character;->getType(C)I

    move-result v0

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static isJSSpace(I)Z
    .locals 4
    .param p0, "c"    # I

    .line 1046
    const/4 v0, 0x0

    const/16 v1, 0xc

    const/4 v2, 0x1

    const/16 v3, 0x7f

    if-gt p0, v3, :cond_2

    .line 1047
    const/16 v3, 0x20

    if-eq p0, v3, :cond_0

    const/16 v3, 0x9

    if-eq p0, v3, :cond_0

    if-eq p0, v1, :cond_0

    const/16 v1, 0xb

    if-ne p0, v1, :cond_1

    :cond_0
    move v0, v2

    :cond_1
    return v0

    .line 1049
    :cond_2
    const/16 v3, 0xa0

    if-eq p0, v3, :cond_3

    const v3, 0xfeff

    if-eq p0, v3, :cond_3

    int-to-char v3, p0

    .line 1050
    invoke-static {v3}, Ljava/lang/Character;->getType(C)I

    move-result v3

    if-ne v3, v1, :cond_4

    :cond_3
    move v0, v2

    .line 1049
    :cond_4
    return v0
.end method

.method static isKeyword(Ljava/lang/String;IZ)Z
    .locals 1
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "version"    # I
    .param p2, "isStrict"    # Z

    .line 80
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/TokenStream;->stringToKeyword(Ljava/lang/String;IZ)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isMarkingComment()Z
    .locals 2

    .line 1755
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->commentCursor:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private markCommentStart()V
    .locals 1

    .line 1744
    const-string v0, ""

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->markCommentStart(Ljava/lang/String;)V

    .line 1745
    return-void
.end method

.method private markCommentStart(Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;

    .line 1748
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    iget-object v0, v0, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->isRecordingComments()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceReader:Ljava/io/Reader;

    if-eqz v0, :cond_0

    .line 1749
    iput-object p1, p0, Lcom/trendmicro/hippo/TokenStream;->commentPrefix:Ljava/lang/String;

    .line 1750
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->commentCursor:I

    .line 1752
    :cond_0
    return-void
.end method

.method private matchChar(I)Z
    .locals 2
    .param p1, "test"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1438
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getCharIgnoreLineEnd()I

    move-result v0

    .line 1439
    .local v0, "c":I
    if-ne v0, p1, :cond_0

    .line 1440
    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    iput v1, p0, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 1441
    const/4 v1, 0x1

    return v1

    .line 1443
    :cond_0
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->ungetCharIgnoreLineEnd(I)V

    .line 1444
    const/4 v1, 0x0

    return v1
.end method

.method private peekChar()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1449
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 1450
    .local v0, "c":I
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->ungetChar(I)V

    .line 1451
    return v0
.end method

.method private readCDATA()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1339
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .local v0, "c":I
    :cond_0
    :goto_0
    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 1340
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1341
    const/16 v1, 0x5d

    if-ne v0, v1, :cond_1

    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->peekChar()I

    move-result v2

    if-ne v2, v1, :cond_1

    .line 1342
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 1343
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1344
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->peekChar()I

    move-result v1

    const/16 v2, 0x3e

    if-ne v1, v2, :cond_0

    .line 1345
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 1346
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1347
    const/4 v1, 0x1

    return v1

    .line 1351
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    goto :goto_0

    .line 1354
    .end local v0    # "c":I
    :cond_2
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1355
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1356
    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v2, "msg.XML.bad.form"

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 1357
    return v0
.end method

.method private readEntity()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1365
    const/4 v0, 0x1

    .line 1366
    .local v0, "declTags":I
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v1

    .local v1, "c":I
    :goto_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_3

    .line 1367
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1368
    const/16 v2, 0x3c

    if-eq v1, v2, :cond_1

    const/16 v2, 0x3e

    if-eq v1, v2, :cond_0

    goto :goto_1

    .line 1373
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 1374
    if-nez v0, :cond_2

    const/4 v2, 0x1

    return v2

    .line 1370
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 1371
    nop

    .line 1366
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v1

    goto :goto_0

    .line 1379
    .end local v1    # "c":I
    :cond_3
    const/4 v1, 0x0

    iput v1, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1380
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1381
    iget-object v2, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v3, "msg.XML.bad.form"

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 1382
    return v1
.end method

.method private readPI()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1390
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .local v0, "c":I
    :goto_0
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 1391
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1392
    const/16 v1, 0x3f

    if-ne v0, v1, :cond_0

    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->peekChar()I

    move-result v1

    const/16 v2, 0x3e

    if-ne v1, v2, :cond_0

    .line 1393
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 1394
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1395
    const/4 v1, 0x1

    return v1

    .line 1390
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    goto :goto_0

    .line 1399
    .end local v0    # "c":I
    :cond_1
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1400
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1401
    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v2, "msg.XML.bad.form"

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 1402
    return v0
.end method

.method private readQuotedString(I)Z
    .locals 3
    .param p1, "quote"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1297
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .local v0, "c":I
    :goto_0
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 1298
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1299
    if-ne v0, p1, :cond_0

    const/4 v1, 0x1

    return v1

    .line 1297
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    goto :goto_0

    .line 1302
    .end local v0    # "c":I
    :cond_1
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1303
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1304
    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v2, "msg.XML.bad.form"

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 1305
    return v0
.end method

.method private readXmlComment()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1313
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .local v0, "c":I
    :cond_0
    :goto_0
    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 1314
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1315
    const/16 v1, 0x2d

    if-ne v0, v1, :cond_1

    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->peekChar()I

    move-result v2

    if-ne v2, v1, :cond_1

    .line 1316
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 1317
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1318
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->peekChar()I

    move-result v1

    const/16 v2, 0x3e

    if-ne v1, v2, :cond_0

    .line 1319
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 1320
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1321
    const/4 v1, 0x1

    return v1

    .line 1325
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    goto :goto_0

    .line 1328
    .end local v0    # "c":I
    :cond_2
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1329
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1330
    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v2, "msg.XML.bad.form"

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 1331
    return v0
.end method

.method private skipLine()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1571
    :goto_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    move v1, v0

    .local v1, "c":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    const/16 v0, 0xa

    if-eq v1, v0, :cond_0

    goto :goto_0

    .line 1572
    :cond_0
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->ungetChar(I)V

    .line 1573
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 1574
    return-void
.end method

.method private static stringToKeyword(Ljava/lang/String;IZ)I
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "version"    # I
    .param p2, "isStrict"    # Z

    .line 85
    const/16 v0, 0xc8

    if-ge p1, v0, :cond_0

    .line 86
    invoke-static {p0}, Lcom/trendmicro/hippo/TokenStream;->stringToKeywordForJS(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 88
    :cond_0
    invoke-static {p0, p2}, Lcom/trendmicro/hippo/TokenStream;->stringToKeywordForES(Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method private static stringToKeywordForES(Ljava/lang/String;Z)I
    .locals 53
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "isStrict"    # Z

    .line 279
    const/16 v0, 0x79

    .line 280
    .local v0, "Id_break":I
    const/16 v1, 0x74

    .line 281
    .local v1, "Id_case":I
    const/16 v2, 0x7d

    .line 282
    .local v2, "Id_catch":I
    const/16 v3, 0x80

    .line 283
    .local v3, "Id_class":I
    const/16 v4, 0x9b

    .line 284
    .local v4, "Id_const":I
    const/16 v5, 0x7a

    .line 285
    .local v5, "Id_continue":I
    const/16 v6, 0xa1

    .line 286
    .local v6, "Id_debugger":I
    const/16 v7, 0x75

    .line 287
    .local v7, "Id_default":I
    const/16 v8, 0x1f

    .line 288
    .local v8, "Id_delete":I
    const/16 v9, 0x77

    .line 289
    .local v9, "Id_do":I
    const/16 v10, 0x72

    .line 290
    .local v10, "Id_else":I
    const/16 v11, 0x80

    .line 291
    .local v11, "Id_export":I
    const/16 v12, 0x80

    .line 292
    .local v12, "Id_extends":I
    const/16 v13, 0x7e

    .line 293
    .local v13, "Id_finally":I
    const/16 v14, 0x78

    .line 294
    .local v14, "Id_for":I
    const/16 v15, 0x6e

    .line 295
    .local v15, "Id_function":I
    const/16 v16, 0x71

    .line 296
    .local v16, "Id_if":I
    const/16 v17, 0x80

    .line 297
    .local v17, "Id_import":I
    const/16 v18, 0x34

    .line 298
    .local v18, "Id_in":I
    const/16 v19, 0x35

    .line 299
    .local v19, "Id_instanceof":I
    const/16 v20, 0x1e

    .line 300
    .local v20, "Id_new":I
    const/16 v21, 0x4

    .line 301
    .local v21, "Id_return":I
    const/16 v22, 0x80

    .line 302
    .local v22, "Id_super":I
    const/16 v23, 0x73

    .line 303
    .local v23, "Id_switch":I
    const/16 v24, 0x2b

    .line 304
    .local v24, "Id_this":I
    const/16 v25, 0x32

    .line 305
    .local v25, "Id_throw":I
    const/16 v26, 0x52

    .line 306
    .local v26, "Id_try":I
    const/16 v27, 0x20

    .line 307
    .local v27, "Id_typeof":I
    const/16 v28, 0x7b

    .line 308
    .local v28, "Id_var":I
    const/16 v29, 0x7f

    .line 309
    .local v29, "Id_void":I
    const/16 v30, 0x76

    .line 310
    .local v30, "Id_while":I
    const/16 v31, 0x7c

    .line 311
    .local v31, "Id_with":I
    const/16 v32, 0x49

    .line 314
    .local v32, "Id_yield":I
    const/16 v33, 0x80

    .line 315
    .local v33, "Id_await":I
    const/16 v34, 0x80

    .line 318
    .local v34, "Id_enum":I
    const/16 v35, 0x80

    .line 319
    .local v35, "Id_implements":I
    const/16 v36, 0x80

    .line 320
    .local v36, "Id_interface":I
    const/16 v37, 0x80

    .line 321
    .local v37, "Id_package":I
    const/16 v38, 0x80

    .line 322
    .local v38, "Id_private":I
    const/16 v39, 0x80

    .line 323
    .local v39, "Id_protected":I
    const/16 v40, 0x80

    .line 326
    .local v40, "Id_public":I
    const/16 v41, 0x2c

    .line 327
    .local v41, "Id_false":I
    const/16 v42, 0x2a

    .line 328
    .local v42, "Id_null":I
    const/16 v43, 0x2d

    .line 332
    .local v43, "Id_true":I
    const/16 v44, 0x9a

    .line 333
    .local v44, "Id_let":I
    const/16 v45, 0x80

    .line 336
    .local v45, "Id_static":I
    move-object/from16 v46, p0

    .line 338
    .local v46, "s":Ljava/lang/String;
    const/16 v47, 0x0

    .local v47, "id":I
    const/16 v48, 0x0

    .line 339
    .local v48, "X":Ljava/lang/String;
    invoke-virtual/range {v46 .. v46}, Ljava/lang/String;->length()I

    move-result v49

    move/from16 v50, v0

    .end local v0    # "Id_break":I
    .local v50, "Id_break":I
    const/4 v0, 0x1

    packed-switch v49, :pswitch_data_0

    move/from16 v49, v1

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v1, v46

    move/from16 v46, v2

    .end local v2    # "Id_catch":I
    .end local v3    # "Id_class":I
    .end local v4    # "Id_const":I
    .local v1, "s":Ljava/lang/String;
    .local v46, "Id_catch":I
    .local v49, "Id_case":I
    .local v51, "Id_const":I
    .local v52, "Id_class":I
    goto/16 :goto_0

    .line 424
    .end local v49    # "Id_case":I
    .end local v51    # "Id_const":I
    .end local v52    # "Id_class":I
    .local v1, "Id_case":I
    .restart local v2    # "Id_catch":I
    .restart local v3    # "Id_class":I
    .restart local v4    # "Id_const":I
    .local v46, "s":Ljava/lang/String;
    :pswitch_0
    move/from16 v49, v1

    move-object/from16 v1, v46

    .end local v46    # "s":Ljava/lang/String;
    .local v1, "s":Ljava/lang/String;
    .restart local v49    # "Id_case":I
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 425
    .local v0, "c":I
    move/from16 v46, v2

    const/16 v2, 0x6d

    .end local v2    # "Id_catch":I
    .local v46, "Id_catch":I
    if-ne v0, v2, :cond_0

    if-eqz p1, :cond_0

    const-string v48, "implements"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 426
    :cond_0
    const/16 v2, 0x6e

    if-ne v0, v2, :cond_1

    const-string v48, "instanceof"

    const/16 v47, 0x35

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    :cond_1
    move/from16 v52, v3

    move/from16 v51, v4

    goto/16 :goto_0

    .line 420
    .end local v0    # "c":I
    .end local v49    # "Id_case":I
    .local v1, "Id_case":I
    .restart local v2    # "Id_catch":I
    .local v46, "s":Ljava/lang/String;
    :pswitch_1
    move/from16 v49, v1

    move-object/from16 v1, v46

    move/from16 v46, v2

    .end local v2    # "Id_catch":I
    .local v1, "s":Ljava/lang/String;
    .local v46, "Id_catch":I
    .restart local v49    # "Id_case":I
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 421
    .local v2, "c":I
    const/16 v0, 0x69

    if-ne v2, v0, :cond_2

    if-eqz p1, :cond_2

    const-string v48, "interface"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 422
    :cond_2
    const/16 v0, 0x70

    if-ne v2, v0, :cond_3

    if-eqz p1, :cond_3

    const-string v48, "protected"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    :cond_3
    move/from16 v52, v3

    move/from16 v51, v4

    goto/16 :goto_0

    .line 415
    .end local v49    # "Id_case":I
    .local v1, "Id_case":I
    .local v2, "Id_catch":I
    .local v46, "s":Ljava/lang/String;
    :pswitch_2
    move/from16 v49, v1

    move-object/from16 v1, v46

    move/from16 v46, v2

    .end local v2    # "Id_catch":I
    .local v1, "s":Ljava/lang/String;
    .local v46, "Id_catch":I
    .restart local v49    # "Id_case":I
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v0, 0x63

    if-eq v2, v0, :cond_6

    const/16 v0, 0x64

    if-eq v2, v0, :cond_5

    const/16 v0, 0x66

    if-eq v2, v0, :cond_4

    .line 419
    move/from16 v52, v3

    move/from16 v51, v4

    goto/16 :goto_0

    .line 418
    :cond_4
    const-string v48, "function"

    const/16 v47, 0x6e

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 417
    :cond_5
    const-string v48, "debugger"

    const/16 v47, 0xa1

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 416
    :cond_6
    const-string v48, "continue"

    const/16 v47, 0x7a

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 402
    .end local v49    # "Id_case":I
    .local v1, "Id_case":I
    .restart local v2    # "Id_catch":I
    .local v46, "s":Ljava/lang/String;
    :pswitch_3
    move/from16 v49, v1

    move-object/from16 v1, v46

    move/from16 v46, v2

    .end local v2    # "Id_catch":I
    .local v1, "s":Ljava/lang/String;
    .local v46, "Id_catch":I
    .restart local v49    # "Id_case":I
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x61

    if-eq v0, v2, :cond_a

    const/16 v2, 0x65

    if-eq v0, v2, :cond_b

    const/16 v2, 0x69

    if-eq v0, v2, :cond_9

    const/16 v2, 0x72

    if-eq v0, v2, :cond_7

    const/16 v2, 0x78

    if-eq v0, v2, :cond_8

    .line 414
    move/from16 v52, v3

    move/from16 v51, v4

    goto/16 :goto_0

    .line 409
    :cond_7
    if-eqz p1, :cond_8

    .line 410
    const-string v48, "private"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 413
    :cond_8
    const-string v48, "extends"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 408
    :cond_9
    const-string v48, "finally"

    const/16 v47, 0x7e

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 403
    :cond_a
    if-eqz p1, :cond_b

    .line 404
    const-string v48, "package"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 407
    :cond_b
    const-string v48, "default"

    const/16 v47, 0x75

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 384
    .end local v49    # "Id_case":I
    .local v1, "Id_case":I
    .restart local v2    # "Id_catch":I
    .local v46, "s":Ljava/lang/String;
    :pswitch_4
    move/from16 v49, v1

    move-object/from16 v1, v46

    move/from16 v46, v2

    .end local v2    # "Id_catch":I
    .local v1, "s":Ljava/lang/String;
    .local v46, "Id_catch":I
    .restart local v49    # "Id_case":I
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x65

    if-eq v0, v2, :cond_10

    const/16 v2, 0x6d

    if-eq v0, v2, :cond_f

    const/16 v2, 0x74

    if-eq v0, v2, :cond_c

    const/16 v2, 0x75

    if-eq v0, v2, :cond_d

    packed-switch v0, :pswitch_data_1

    .line 401
    move/from16 v52, v3

    move/from16 v51, v4

    goto/16 :goto_0

    .line 400
    :pswitch_5
    const-string v48, "typeof"

    const/16 v47, 0x20

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 399
    :pswitch_6
    const-string v48, "export"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 390
    :cond_c
    if-eqz p1, :cond_d

    .line 391
    const-string v48, "static"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 394
    :cond_d
    if-eqz p1, :cond_e

    .line 395
    const-string v48, "public"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 398
    :cond_e
    :pswitch_7
    const-string v48, "switch"

    const/16 v47, 0x73

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 389
    :cond_f
    const-string v48, "import"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 385
    :cond_10
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 386
    .local v2, "c":I
    const/16 v0, 0x64

    if-ne v2, v0, :cond_11

    const-string v48, "delete"

    const/16 v47, 0x1f

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 387
    :cond_11
    const/16 v0, 0x72

    if-ne v2, v0, :cond_12

    const-string v48, "return"

    const/16 v47, 0x4

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    :cond_12
    move/from16 v52, v3

    move/from16 v51, v4

    goto/16 :goto_0

    .line 368
    .end local v49    # "Id_case":I
    .local v1, "Id_case":I
    .local v2, "Id_catch":I
    .local v46, "s":Ljava/lang/String;
    :pswitch_8
    move/from16 v49, v1

    move-object/from16 v1, v46

    move/from16 v46, v2

    .end local v2    # "Id_catch":I
    .local v1, "s":Ljava/lang/String;
    .local v46, "Id_catch":I
    .restart local v49    # "Id_case":I
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x61

    if-eq v0, v2, :cond_1c

    const/16 v2, 0x65

    if-eq v0, v2, :cond_19

    const/16 v2, 0x69

    if-eq v0, v2, :cond_18

    const/16 v2, 0x6c

    if-eq v0, v2, :cond_17

    const/16 v2, 0x6e

    if-eq v0, v2, :cond_16

    const/16 v2, 0x70

    if-eq v0, v2, :cond_15

    const/16 v2, 0x72

    if-eq v0, v2, :cond_14

    const/16 v2, 0x74

    if-eq v0, v2, :cond_13

    .line 383
    move/from16 v52, v3

    move/from16 v51, v4

    goto/16 :goto_0

    .line 382
    :cond_13
    const-string v48, "catch"

    const/16 v47, 0x7d

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 381
    :cond_14
    const-string v48, "throw"

    const/16 v47, 0x32

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 380
    :cond_15
    const-string v48, "super"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 379
    :cond_16
    const-string v48, "const"

    const/16 v47, 0x9b

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 378
    :cond_17
    const-string v48, "false"

    const/16 v47, 0x2c

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 377
    :cond_18
    const-string v48, "while"

    const/16 v47, 0x76

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 373
    :cond_19
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 374
    .local v2, "c":I
    const/16 v0, 0x62

    if-ne v2, v0, :cond_1a

    const-string v48, "break"

    const/16 v47, 0x79

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 375
    :cond_1a
    const/16 v0, 0x79

    if-ne v2, v0, :cond_1b

    const-string v48, "yield"

    const/16 v47, 0x49

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    :cond_1b
    move/from16 v52, v3

    move/from16 v51, v4

    goto/16 :goto_0

    .line 369
    .end local v2    # "c":I
    :cond_1c
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 370
    .restart local v2    # "c":I
    const/16 v0, 0x63

    if-ne v2, v0, :cond_1d

    const-string v48, "class"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 371
    :cond_1d
    const/16 v0, 0x61

    if-ne v2, v0, :cond_1e

    const-string v48, "await"

    const/16 v47, 0x80

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    :cond_1e
    move/from16 v52, v3

    move/from16 v51, v4

    goto/16 :goto_0

    .line 352
    .end local v49    # "Id_case":I
    .local v1, "Id_case":I
    .local v2, "Id_catch":I
    .local v46, "s":Ljava/lang/String;
    :pswitch_9
    move/from16 v49, v1

    move-object/from16 v1, v46

    move/from16 v46, v2

    .end local v2    # "Id_catch":I
    .local v1, "s":Ljava/lang/String;
    .local v46, "Id_catch":I
    .restart local v49    # "Id_case":I
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x63

    if-eq v0, v2, :cond_2a

    const/16 v2, 0x65

    if-eq v0, v2, :cond_26

    const/16 v2, 0x6e

    if-eq v0, v2, :cond_25

    const/16 v2, 0x74

    if-eq v0, v2, :cond_21

    const/16 v2, 0x76

    if-eq v0, v2, :cond_20

    const/16 v2, 0x77

    if-eq v0, v2, :cond_1f

    .line 367
    move/from16 v52, v3

    move/from16 v51, v4

    goto/16 :goto_0

    .line 366
    :cond_1f
    const-string v48, "with"

    const/16 v47, 0x7c

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 365
    :cond_20
    const-string v48, "void"

    const/16 v47, 0x7f

    move/from16 v52, v3

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 361
    :cond_21
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 362
    .restart local v0    # "c":I
    const/16 v2, 0x65

    if-ne v0, v2, :cond_23

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    move/from16 v52, v3

    const/16 v3, 0x75

    .end local v3    # "Id_class":I
    .restart local v52    # "Id_class":I
    if-ne v2, v3, :cond_22

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x72

    if-ne v2, v3, :cond_22

    const/16 v2, 0x2d

    move/from16 v51, v4

    .end local v47    # "id":I
    .local v2, "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_22
    move/from16 v51, v4

    goto/16 :goto_0

    .line 363
    .end local v52    # "Id_class":I
    .restart local v3    # "Id_class":I
    :cond_23
    move/from16 v52, v3

    .end local v3    # "Id_class":I
    .restart local v52    # "Id_class":I
    const/16 v2, 0x73

    if-ne v0, v2, :cond_24

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x69

    if-ne v2, v3, :cond_24

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x68

    if-ne v2, v3, :cond_24

    const/16 v2, 0x2b

    move/from16 v51, v4

    .end local v47    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_24
    move/from16 v51, v4

    goto/16 :goto_0

    .line 360
    .end local v0    # "c":I
    .end local v52    # "Id_class":I
    .restart local v3    # "Id_class":I
    :cond_25
    move/from16 v52, v3

    .end local v3    # "Id_class":I
    .restart local v52    # "Id_class":I
    const-string v48, "null"

    const/16 v47, 0x2a

    move/from16 v51, v4

    move-object/from16 v0, v48

    goto/16 :goto_1

    .line 356
    .end local v52    # "Id_class":I
    .restart local v3    # "Id_class":I
    :cond_26
    move/from16 v52, v3

    .end local v3    # "Id_class":I
    .restart local v52    # "Id_class":I
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 357
    .restart local v0    # "c":I
    const/16 v2, 0x65

    if-ne v0, v2, :cond_28

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x73

    if-ne v2, v3, :cond_27

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x6c

    if-ne v2, v3, :cond_27

    const/16 v2, 0x72

    move/from16 v51, v4

    .end local v47    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_27
    move/from16 v51, v4

    goto/16 :goto_0

    .line 358
    :cond_28
    const/16 v2, 0x6d

    if-ne v0, v2, :cond_29

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x75

    if-ne v2, v3, :cond_29

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x6e

    if-ne v2, v3, :cond_29

    const/16 v2, 0x80

    move/from16 v51, v4

    .end local v47    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_29
    move/from16 v51, v4

    goto/16 :goto_0

    .line 353
    .end local v0    # "c":I
    .end local v52    # "Id_class":I
    .restart local v3    # "Id_class":I
    :cond_2a
    move/from16 v52, v3

    .end local v3    # "Id_class":I
    .restart local v52    # "Id_class":I
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 354
    .restart local v0    # "c":I
    const/16 v2, 0x65

    if-ne v0, v2, :cond_2b

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x73

    if-ne v2, v3, :cond_2b

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x61

    if-ne v2, v3, :cond_2b

    const/16 v2, 0x74

    move/from16 v51, v4

    .end local v47    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_2b
    move/from16 v51, v4

    goto/16 :goto_0

    .line 345
    .end local v0    # "c":I
    .end local v49    # "Id_case":I
    .end local v52    # "Id_class":I
    .local v1, "Id_case":I
    .local v2, "Id_catch":I
    .restart local v3    # "Id_class":I
    .local v46, "s":Ljava/lang/String;
    :pswitch_a
    move/from16 v49, v1

    move/from16 v52, v3

    move-object/from16 v1, v46

    move/from16 v46, v2

    .end local v2    # "Id_catch":I
    .end local v3    # "Id_class":I
    .local v1, "s":Ljava/lang/String;
    .local v46, "Id_catch":I
    .restart local v49    # "Id_case":I
    .restart local v52    # "Id_class":I
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v0, 0x66

    if-eq v2, v0, :cond_34

    const/16 v0, 0x6c

    if-eq v2, v0, :cond_32

    const/16 v0, 0x6e

    if-eq v2, v0, :cond_30

    const/16 v0, 0x74

    if-eq v2, v0, :cond_2e

    const/16 v0, 0x76

    if-eq v2, v0, :cond_2c

    .line 351
    move/from16 v51, v4

    goto/16 :goto_0

    .line 350
    :cond_2c
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x72

    if-ne v0, v2, :cond_2d

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x61

    if-ne v0, v2, :cond_2d

    const/16 v2, 0x7b

    move/from16 v51, v4

    .end local v47    # "id":I
    .local v2, "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_2d
    move/from16 v51, v4

    goto/16 :goto_0

    .line 349
    :cond_2e
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x79

    if-ne v0, v2, :cond_2f

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x72

    if-ne v0, v2, :cond_2f

    const/16 v2, 0x52

    move/from16 v51, v4

    .end local v47    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_2f
    move/from16 v51, v4

    goto/16 :goto_0

    .line 348
    :cond_30
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x77

    if-ne v0, v2, :cond_31

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x65

    if-ne v0, v2, :cond_31

    const/16 v2, 0x1e

    move/from16 v51, v4

    .end local v47    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_31
    move/from16 v51, v4

    goto/16 :goto_0

    .line 347
    :cond_32
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x74

    if-ne v0, v2, :cond_33

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x65

    if-ne v0, v2, :cond_33

    const/16 v2, 0x9a

    move/from16 v51, v4

    .end local v47    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_33
    move/from16 v51, v4

    goto/16 :goto_0

    .line 346
    :cond_34
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x72

    if-ne v0, v2, :cond_35

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x6f

    if-ne v0, v2, :cond_35

    const/16 v2, 0x78

    move/from16 v51, v4

    .end local v47    # "id":I
    .restart local v2    # "id":I
    goto :goto_2

    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_35
    move/from16 v51, v4

    goto :goto_0

    .line 340
    .end local v49    # "Id_case":I
    .end local v52    # "Id_class":I
    .local v1, "Id_case":I
    .local v2, "Id_catch":I
    .restart local v3    # "Id_class":I
    .local v46, "s":Ljava/lang/String;
    :pswitch_b
    move/from16 v49, v1

    move/from16 v52, v3

    move-object/from16 v1, v46

    move/from16 v46, v2

    .end local v2    # "Id_catch":I
    .end local v3    # "Id_class":I
    .local v1, "s":Ljava/lang/String;
    .local v46, "Id_catch":I
    .restart local v49    # "Id_case":I
    .restart local v52    # "Id_class":I
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 341
    .restart local v0    # "c":I
    const/16 v2, 0x66

    if-ne v0, v2, :cond_37

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v2, 0x69

    if-ne v3, v2, :cond_36

    const/16 v2, 0x71

    move/from16 v51, v4

    .end local v47    # "id":I
    .local v2, "id":I
    goto :goto_2

    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_36
    move/from16 v51, v4

    goto :goto_0

    .line 342
    :cond_37
    const/16 v2, 0x69

    const/16 v3, 0x6e

    if-ne v0, v3, :cond_38

    move/from16 v51, v4

    const/4 v3, 0x0

    .end local v4    # "Id_const":I
    .restart local v51    # "Id_const":I
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v2, :cond_39

    const/16 v2, 0x34

    .end local v47    # "id":I
    .restart local v2    # "id":I
    goto :goto_2

    .line 343
    .end local v2    # "id":I
    .end local v51    # "Id_const":I
    .restart local v4    # "Id_const":I
    .restart local v47    # "id":I
    :cond_38
    move/from16 v51, v4

    const/4 v3, 0x0

    .end local v4    # "Id_const":I
    .restart local v51    # "Id_const":I
    const/16 v2, 0x6f

    if-ne v0, v2, :cond_39

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x64

    if-ne v2, v3, :cond_39

    const/16 v2, 0x77

    .end local v47    # "id":I
    .restart local v2    # "id":I
    goto :goto_2

    .line 429
    .end local v0    # "c":I
    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_39
    :goto_0
    move-object/from16 v0, v48

    .end local v48    # "X":Ljava/lang/String;
    .local v0, "X":Ljava/lang/String;
    :goto_1
    if-eqz v0, :cond_3a

    if-eq v0, v1, :cond_3a

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3a

    const/4 v2, 0x0

    .end local v47    # "id":I
    .restart local v2    # "id":I
    goto :goto_2

    .line 433
    .end local v0    # "X":Ljava/lang/String;
    .end local v2    # "id":I
    .restart local v47    # "id":I
    :cond_3a
    move/from16 v2, v47

    .end local v47    # "id":I
    .restart local v2    # "id":I
    :goto_2
    if-nez v2, :cond_3b

    const/4 v0, 0x0

    return v0

    .line 434
    :cond_3b
    and-int/lit16 v0, v2, 0xff

    return v0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x77
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch
.end method

.method private static stringToKeywordForJS(Ljava/lang/String;)I
    .locals 68
    .param p0, "name"    # Ljava/lang/String;

    .line 99
    const/16 v0, 0x79

    .line 100
    .local v0, "Id_break":I
    const/16 v1, 0x74

    .line 101
    .local v1, "Id_case":I
    const/16 v2, 0x7a

    .line 102
    .local v2, "Id_continue":I
    const/16 v3, 0x75

    .line 103
    .local v3, "Id_default":I
    const/16 v4, 0x1f

    .line 104
    .local v4, "Id_delete":I
    const/16 v5, 0x77

    .line 105
    .local v5, "Id_do":I
    const/16 v6, 0x72

    .line 106
    .local v6, "Id_else":I
    const/16 v7, 0x80

    .line 107
    .local v7, "Id_export":I
    const/16 v8, 0x2c

    .line 108
    .local v8, "Id_false":I
    const/16 v9, 0x78

    .line 109
    .local v9, "Id_for":I
    const/16 v10, 0x6e

    .line 110
    .local v10, "Id_function":I
    const/16 v11, 0x71

    .line 111
    .local v11, "Id_if":I
    const/16 v12, 0x34

    .line 112
    .local v12, "Id_in":I
    const/16 v13, 0x9a

    .line 113
    .local v13, "Id_let":I
    const/16 v14, 0x1e

    .line 114
    .local v14, "Id_new":I
    const/16 v15, 0x2a

    .line 115
    .local v15, "Id_null":I
    const/16 v16, 0x4

    .line 116
    .local v16, "Id_return":I
    const/16 v17, 0x73

    .line 117
    .local v17, "Id_switch":I
    const/16 v18, 0x2b

    .line 118
    .local v18, "Id_this":I
    const/16 v19, 0x2d

    .line 119
    .local v19, "Id_true":I
    const/16 v20, 0x20

    .line 120
    .local v20, "Id_typeof":I
    const/16 v21, 0x7b

    .line 121
    .local v21, "Id_var":I
    const/16 v22, 0x7f

    .line 122
    .local v22, "Id_void":I
    const/16 v23, 0x76

    .line 123
    .local v23, "Id_while":I
    const/16 v24, 0x7c

    .line 124
    .local v24, "Id_with":I
    const/16 v25, 0x49

    .line 127
    .local v25, "Id_yield":I
    const/16 v26, 0x80

    .line 128
    .local v26, "Id_abstract":I
    const/16 v27, 0x80

    .line 129
    .local v27, "Id_boolean":I
    const/16 v28, 0x80

    .line 130
    .local v28, "Id_byte":I
    const/16 v29, 0x7d

    .line 131
    .local v29, "Id_catch":I
    const/16 v30, 0x80

    .line 132
    .local v30, "Id_char":I
    const/16 v31, 0x80

    .line 133
    .local v31, "Id_class":I
    const/16 v32, 0x9b

    .line 134
    .local v32, "Id_const":I
    const/16 v33, 0xa1

    .line 135
    .local v33, "Id_debugger":I
    const/16 v34, 0x80

    .line 136
    .local v34, "Id_double":I
    const/16 v35, 0x80

    .line 137
    .local v35, "Id_enum":I
    const/16 v36, 0x80

    .line 138
    .local v36, "Id_extends":I
    const/16 v37, 0x80

    .line 139
    .local v37, "Id_final":I
    const/16 v38, 0x7e

    .line 140
    .local v38, "Id_finally":I
    const/16 v39, 0x80

    .line 141
    .local v39, "Id_float":I
    const/16 v40, 0x80

    .line 142
    .local v40, "Id_goto":I
    const/16 v41, 0x80

    .line 143
    .local v41, "Id_implements":I
    const/16 v42, 0x80

    .line 144
    .local v42, "Id_import":I
    const/16 v43, 0x35

    .line 145
    .local v43, "Id_instanceof":I
    const/16 v44, 0x80

    .line 146
    .local v44, "Id_int":I
    const/16 v45, 0x80

    .line 147
    .local v45, "Id_interface":I
    const/16 v46, 0x80

    .line 148
    .local v46, "Id_long":I
    const/16 v47, 0x80

    .line 149
    .local v47, "Id_native":I
    const/16 v48, 0x80

    .line 150
    .local v48, "Id_package":I
    const/16 v49, 0x80

    .line 151
    .local v49, "Id_private":I
    const/16 v50, 0x80

    .line 152
    .local v50, "Id_protected":I
    const/16 v51, 0x80

    .line 153
    .local v51, "Id_public":I
    const/16 v52, 0x80

    .line 154
    .local v52, "Id_short":I
    const/16 v53, 0x80

    .line 155
    .local v53, "Id_static":I
    const/16 v54, 0x80

    .line 156
    .local v54, "Id_super":I
    const/16 v55, 0x80

    .line 157
    .local v55, "Id_synchronized":I
    const/16 v56, 0x32

    .line 158
    .local v56, "Id_throw":I
    const/16 v57, 0x80

    .line 159
    .local v57, "Id_throws":I
    const/16 v58, 0x80

    .line 160
    .local v58, "Id_transient":I
    const/16 v59, 0x52

    .line 161
    .local v59, "Id_try":I
    const/16 v60, 0x80

    .line 164
    .local v60, "Id_volatile":I
    move-object/from16 v61, p0

    .line 166
    .local v61, "s":Ljava/lang/String;
    const/16 v62, 0x0

    .local v62, "id":I
    const/16 v63, 0x0

    .line 167
    .local v63, "X":Ljava/lang/String;
    invoke-virtual/range {v61 .. v61}, Ljava/lang/String;->length()I

    move-result v64

    move/from16 v65, v0

    .end local v0    # "Id_break":I
    .local v65, "Id_break":I
    const/4 v0, 0x1

    packed-switch v64, :pswitch_data_0

    :pswitch_0
    move/from16 v64, v1

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v1, v61

    move/from16 v61, v2

    .end local v2    # "Id_continue":I
    .end local v3    # "Id_default":I
    .end local v4    # "Id_delete":I
    .local v1, "s":Ljava/lang/String;
    .local v61, "Id_continue":I
    .local v64, "Id_case":I
    .local v66, "Id_delete":I
    .local v67, "Id_default":I
    goto/16 :goto_0

    .line 260
    .end local v64    # "Id_case":I
    .end local v66    # "Id_delete":I
    .end local v67    # "Id_default":I
    .local v1, "Id_case":I
    .restart local v2    # "Id_continue":I
    .restart local v3    # "Id_default":I
    .restart local v4    # "Id_delete":I
    .local v61, "s":Ljava/lang/String;
    :pswitch_1
    const-string v63, "synchronized"

    const/16 v62, 0x80

    move/from16 v64, v1

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v1, v61

    move-object/from16 v0, v63

    move/from16 v61, v2

    goto/16 :goto_1

    .line 256
    :pswitch_2
    move/from16 v64, v1

    move-object/from16 v1, v61

    .end local v61    # "s":Ljava/lang/String;
    .local v1, "s":Ljava/lang/String;
    .restart local v64    # "Id_case":I
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 257
    .local v0, "c":I
    move/from16 v61, v2

    const/16 v2, 0x6d

    .end local v2    # "Id_continue":I
    .local v61, "Id_continue":I
    if-ne v0, v2, :cond_0

    const-string v63, "implements"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 258
    :cond_0
    const/16 v2, 0x6e

    if-ne v0, v2, :cond_1

    const-string v63, "instanceof"

    const/16 v62, 0x35

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    :cond_1
    move/from16 v67, v3

    move/from16 v66, v4

    goto/16 :goto_0

    .line 251
    .end local v0    # "c":I
    .end local v64    # "Id_case":I
    .local v1, "Id_case":I
    .restart local v2    # "Id_continue":I
    .local v61, "s":Ljava/lang/String;
    :pswitch_3
    move/from16 v64, v1

    move-object/from16 v1, v61

    move/from16 v61, v2

    .end local v2    # "Id_continue":I
    .local v1, "s":Ljava/lang/String;
    .local v61, "Id_continue":I
    .restart local v64    # "Id_case":I
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 252
    .local v2, "c":I
    const/16 v0, 0x69

    if-ne v2, v0, :cond_2

    const-string v63, "interface"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 253
    :cond_2
    const/16 v0, 0x70

    if-ne v2, v0, :cond_3

    const-string v63, "protected"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 254
    :cond_3
    const/16 v0, 0x74

    if-ne v2, v0, :cond_4

    const-string v63, "transient"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    :cond_4
    move/from16 v67, v3

    move/from16 v66, v4

    goto/16 :goto_0

    .line 244
    .end local v64    # "Id_case":I
    .local v1, "Id_case":I
    .local v2, "Id_continue":I
    .local v61, "s":Ljava/lang/String;
    :pswitch_4
    move/from16 v64, v1

    move-object/from16 v1, v61

    move/from16 v61, v2

    .end local v2    # "Id_continue":I
    .local v1, "s":Ljava/lang/String;
    .local v61, "Id_continue":I
    .restart local v64    # "Id_case":I
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v0, 0x61

    if-eq v2, v0, :cond_9

    const/16 v0, 0x66

    if-eq v2, v0, :cond_8

    const/16 v0, 0x76

    if-eq v2, v0, :cond_7

    const/16 v0, 0x63

    if-eq v2, v0, :cond_6

    const/16 v0, 0x64

    if-eq v2, v0, :cond_5

    .line 250
    move/from16 v67, v3

    move/from16 v66, v4

    goto/16 :goto_0

    .line 247
    :cond_5
    const-string v63, "debugger"

    const/16 v62, 0xa1

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 246
    :cond_6
    const-string v63, "continue"

    const/16 v62, 0x7a

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 249
    :cond_7
    const-string v63, "volatile"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 248
    :cond_8
    const-string v63, "function"

    const/16 v62, 0x6e

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 245
    :cond_9
    const-string v63, "abstract"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 236
    .end local v64    # "Id_case":I
    .local v1, "Id_case":I
    .restart local v2    # "Id_continue":I
    .local v61, "s":Ljava/lang/String;
    :pswitch_5
    move/from16 v64, v1

    move-object/from16 v1, v61

    move/from16 v61, v2

    .end local v2    # "Id_continue":I
    .local v1, "s":Ljava/lang/String;
    .local v61, "Id_continue":I
    .restart local v64    # "Id_case":I
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x61

    if-eq v0, v2, :cond_f

    const/16 v2, 0x65

    if-eq v0, v2, :cond_e

    const/16 v2, 0x69

    if-eq v0, v2, :cond_d

    const/16 v2, 0x6f

    if-eq v0, v2, :cond_c

    const/16 v2, 0x72

    if-eq v0, v2, :cond_b

    const/16 v2, 0x78

    if-eq v0, v2, :cond_a

    .line 243
    move/from16 v67, v3

    move/from16 v66, v4

    goto/16 :goto_0

    .line 242
    :cond_a
    const-string v63, "extends"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 241
    :cond_b
    const-string v63, "private"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 240
    :cond_c
    const-string v63, "boolean"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 239
    :cond_d
    const-string v63, "finally"

    const/16 v62, 0x7e

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 238
    :cond_e
    const-string v63, "default"

    const/16 v62, 0x75

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 237
    :cond_f
    const-string v63, "package"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 221
    .end local v64    # "Id_case":I
    .local v1, "Id_case":I
    .restart local v2    # "Id_continue":I
    .local v61, "s":Ljava/lang/String;
    :pswitch_6
    move/from16 v64, v1

    move-object/from16 v1, v61

    move/from16 v61, v2

    .end local v2    # "Id_continue":I
    .local v1, "s":Ljava/lang/String;
    .local v61, "Id_continue":I
    .restart local v64    # "Id_case":I
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x61

    if-eq v0, v2, :cond_18

    const/16 v2, 0x65

    if-eq v0, v2, :cond_15

    const/16 v2, 0x68

    if-eq v0, v2, :cond_14

    const/16 v2, 0x6d

    if-eq v0, v2, :cond_13

    const/16 v2, 0x6f

    if-eq v0, v2, :cond_12

    const/16 v2, 0x74

    if-eq v0, v2, :cond_11

    const/16 v2, 0x75

    if-eq v0, v2, :cond_10

    packed-switch v0, :pswitch_data_1

    .line 235
    move/from16 v67, v3

    move/from16 v66, v4

    goto/16 :goto_0

    .line 234
    :pswitch_7
    const-string v63, "typeof"

    const/16 v62, 0x20

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 233
    :pswitch_8
    const-string v63, "export"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 232
    :pswitch_9
    const-string v63, "switch"

    const/16 v62, 0x73

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 231
    :cond_10
    const-string v63, "public"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 230
    :cond_11
    const-string v63, "static"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 229
    :cond_12
    const-string v63, "double"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 228
    :cond_13
    const-string v63, "import"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 227
    :cond_14
    const-string v63, "throws"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 223
    :cond_15
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 224
    .local v2, "c":I
    const/16 v0, 0x64

    if-ne v2, v0, :cond_16

    const-string v63, "delete"

    const/16 v62, 0x1f

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 225
    :cond_16
    const/16 v0, 0x72

    if-ne v2, v0, :cond_17

    const-string v63, "return"

    const/16 v62, 0x4

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    :cond_17
    move/from16 v67, v3

    move/from16 v66, v4

    goto/16 :goto_0

    .line 222
    .end local v2    # "c":I
    :cond_18
    const-string v63, "native"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 201
    .end local v64    # "Id_case":I
    .local v1, "Id_case":I
    .local v2, "Id_continue":I
    .local v61, "s":Ljava/lang/String;
    :pswitch_a
    move/from16 v64, v1

    move-object/from16 v1, v61

    move/from16 v61, v2

    .end local v2    # "Id_continue":I
    .local v1, "s":Ljava/lang/String;
    .local v61, "Id_continue":I
    .restart local v64    # "Id_case":I
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x61

    if-eq v0, v2, :cond_24

    const/16 v2, 0x65

    if-eq v0, v2, :cond_21

    const/16 v2, 0x69

    if-eq v0, v2, :cond_20

    const/16 v2, 0x6c

    if-eq v0, v2, :cond_1f

    const/16 v2, 0x72

    if-eq v0, v2, :cond_1e

    const/16 v2, 0x74

    if-eq v0, v2, :cond_1d

    packed-switch v0, :pswitch_data_2

    .line 220
    move/from16 v67, v3

    move/from16 v66, v4

    goto/16 :goto_0

    .line 217
    :pswitch_b
    const-string v63, "super"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 213
    :pswitch_c
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 214
    .local v2, "c":I
    const/16 v0, 0x66

    if-ne v2, v0, :cond_19

    const-string v63, "float"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 215
    :cond_19
    const/16 v0, 0x73

    if-ne v2, v0, :cond_1a

    const-string v63, "short"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    :cond_1a
    move/from16 v67, v3

    move/from16 v66, v4

    goto/16 :goto_0

    .line 209
    .end local v2    # "c":I
    :pswitch_d
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 210
    .restart local v2    # "c":I
    const/16 v0, 0x63

    if-ne v2, v0, :cond_1b

    const-string v63, "const"

    const/16 v62, 0x9b

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 211
    :cond_1b
    const/16 v0, 0x66

    if-ne v2, v0, :cond_1c

    const-string v63, "final"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    :cond_1c
    move/from16 v67, v3

    move/from16 v66, v4

    goto/16 :goto_0

    .line 219
    .end local v2    # "c":I
    :cond_1d
    const-string v63, "catch"

    const/16 v62, 0x7d

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 218
    :cond_1e
    const-string v63, "throw"

    const/16 v62, 0x32

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 208
    :cond_1f
    const-string v63, "false"

    const/16 v62, 0x2c

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 207
    :cond_20
    const-string v63, "while"

    const/16 v62, 0x76

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 203
    :cond_21
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 204
    .restart local v2    # "c":I
    const/16 v0, 0x62

    if-ne v2, v0, :cond_22

    const-string v63, "break"

    const/16 v62, 0x79

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 205
    :cond_22
    const/16 v0, 0x79

    if-ne v2, v0, :cond_23

    const-string v63, "yield"

    const/16 v62, 0x49

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    :cond_23
    move/from16 v67, v3

    move/from16 v66, v4

    goto/16 :goto_0

    .line 202
    .end local v2    # "c":I
    :cond_24
    const-string v63, "class"

    const/16 v62, 0x80

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 181
    .end local v64    # "Id_case":I
    .local v1, "Id_case":I
    .local v2, "Id_continue":I
    .local v61, "s":Ljava/lang/String;
    :pswitch_e
    move/from16 v64, v1

    move-object/from16 v1, v61

    move/from16 v61, v2

    .end local v2    # "Id_continue":I
    .local v1, "s":Ljava/lang/String;
    .local v61, "Id_continue":I
    .restart local v64    # "Id_case":I
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x62

    if-eq v0, v2, :cond_36

    const/16 v2, 0x63

    if-eq v0, v2, :cond_32

    const/16 v2, 0x65

    if-eq v0, v2, :cond_2e

    const/16 v2, 0x67

    if-eq v0, v2, :cond_2d

    const/16 v2, 0x6c

    if-eq v0, v2, :cond_2c

    const/16 v2, 0x6e

    if-eq v0, v2, :cond_2b

    const/16 v2, 0x74

    if-eq v0, v2, :cond_27

    const/16 v2, 0x76

    if-eq v0, v2, :cond_26

    const/16 v2, 0x77

    if-eq v0, v2, :cond_25

    .line 200
    move/from16 v67, v3

    move/from16 v66, v4

    goto/16 :goto_0

    .line 199
    :cond_25
    const-string v63, "with"

    const/16 v62, 0x7c

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 198
    :cond_26
    const-string v63, "void"

    const/16 v62, 0x7f

    move/from16 v67, v3

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 194
    :cond_27
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 195
    .restart local v0    # "c":I
    const/16 v2, 0x65

    if-ne v0, v2, :cond_29

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    move/from16 v67, v3

    const/16 v3, 0x75

    .end local v3    # "Id_default":I
    .restart local v67    # "Id_default":I
    if-ne v2, v3, :cond_28

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x72

    if-ne v2, v3, :cond_28

    const/16 v2, 0x2d

    move/from16 v66, v4

    .end local v62    # "id":I
    .local v2, "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_28
    move/from16 v66, v4

    goto/16 :goto_0

    .line 196
    .end local v67    # "Id_default":I
    .restart local v3    # "Id_default":I
    :cond_29
    move/from16 v67, v3

    .end local v3    # "Id_default":I
    .restart local v67    # "Id_default":I
    const/16 v2, 0x73

    if-ne v0, v2, :cond_2a

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x69

    if-ne v2, v3, :cond_2a

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x68

    if-ne v2, v3, :cond_2a

    const/16 v2, 0x2b

    move/from16 v66, v4

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_2a
    move/from16 v66, v4

    goto/16 :goto_0

    .line 193
    .end local v0    # "c":I
    .end local v67    # "Id_default":I
    .restart local v3    # "Id_default":I
    :cond_2b
    move/from16 v67, v3

    .end local v3    # "Id_default":I
    .restart local v67    # "Id_default":I
    const-string v63, "null"

    const/16 v62, 0x2a

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 192
    .end local v67    # "Id_default":I
    .restart local v3    # "Id_default":I
    :cond_2c
    move/from16 v67, v3

    .end local v3    # "Id_default":I
    .restart local v67    # "Id_default":I
    const-string v63, "long"

    const/16 v62, 0x80

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 191
    .end local v67    # "Id_default":I
    .restart local v3    # "Id_default":I
    :cond_2d
    move/from16 v67, v3

    .end local v3    # "Id_default":I
    .restart local v67    # "Id_default":I
    const-string v63, "goto"

    const/16 v62, 0x80

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 187
    .end local v67    # "Id_default":I
    .restart local v3    # "Id_default":I
    :cond_2e
    move/from16 v67, v3

    .end local v3    # "Id_default":I
    .restart local v67    # "Id_default":I
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 188
    .restart local v0    # "c":I
    const/16 v2, 0x65

    if-ne v0, v2, :cond_30

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x73

    if-ne v2, v3, :cond_2f

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x6c

    if-ne v2, v3, :cond_2f

    const/16 v2, 0x72

    move/from16 v66, v4

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_2f
    move/from16 v66, v4

    goto/16 :goto_0

    .line 189
    :cond_30
    const/16 v2, 0x6d

    if-ne v0, v2, :cond_31

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x75

    if-ne v2, v3, :cond_31

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x6e

    if-ne v2, v3, :cond_31

    const/16 v2, 0x80

    move/from16 v66, v4

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_31
    move/from16 v66, v4

    goto/16 :goto_0

    .line 183
    .end local v0    # "c":I
    .end local v67    # "Id_default":I
    .restart local v3    # "Id_default":I
    :cond_32
    move/from16 v67, v3

    .end local v3    # "Id_default":I
    .restart local v67    # "Id_default":I
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 184
    .restart local v0    # "c":I
    const/16 v2, 0x65

    if-ne v0, v2, :cond_34

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x73

    if-ne v2, v3, :cond_33

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x61

    if-ne v2, v3, :cond_33

    const/16 v2, 0x74

    move/from16 v66, v4

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_33
    move/from16 v66, v4

    goto/16 :goto_0

    .line 185
    :cond_34
    const/16 v2, 0x72

    if-ne v0, v2, :cond_35

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x61

    if-ne v2, v3, :cond_35

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x68

    if-ne v2, v3, :cond_35

    const/16 v2, 0x80

    move/from16 v66, v4

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_35
    move/from16 v66, v4

    goto/16 :goto_0

    .line 182
    .end local v0    # "c":I
    .end local v67    # "Id_default":I
    .restart local v3    # "Id_default":I
    :cond_36
    move/from16 v67, v3

    .end local v3    # "Id_default":I
    .restart local v67    # "Id_default":I
    const-string v63, "byte"

    const/16 v62, 0x80

    move/from16 v66, v4

    move-object/from16 v0, v63

    goto/16 :goto_1

    .line 173
    .end local v64    # "Id_case":I
    .end local v67    # "Id_default":I
    .local v1, "Id_case":I
    .local v2, "Id_continue":I
    .restart local v3    # "Id_default":I
    .local v61, "s":Ljava/lang/String;
    :pswitch_f
    move/from16 v64, v1

    move/from16 v67, v3

    move-object/from16 v1, v61

    move/from16 v61, v2

    .end local v2    # "Id_continue":I
    .end local v3    # "Id_default":I
    .local v1, "s":Ljava/lang/String;
    .local v61, "Id_continue":I
    .restart local v64    # "Id_case":I
    .restart local v67    # "Id_default":I
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v0, 0x66

    if-eq v2, v0, :cond_41

    const/16 v0, 0x69

    if-eq v2, v0, :cond_3f

    const/16 v0, 0x6c

    if-eq v2, v0, :cond_3d

    const/16 v0, 0x6e

    if-eq v2, v0, :cond_3b

    const/16 v0, 0x74

    if-eq v2, v0, :cond_39

    const/16 v0, 0x76

    if-eq v2, v0, :cond_37

    .line 180
    move/from16 v66, v4

    goto/16 :goto_0

    .line 179
    :cond_37
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x72

    if-ne v0, v2, :cond_38

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x61

    if-ne v0, v2, :cond_38

    const/16 v2, 0x7b

    move/from16 v66, v4

    .end local v62    # "id":I
    .local v2, "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_38
    move/from16 v66, v4

    goto/16 :goto_0

    .line 178
    :cond_39
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x79

    if-ne v0, v2, :cond_3a

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x72

    if-ne v0, v2, :cond_3a

    const/16 v2, 0x52

    move/from16 v66, v4

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_3a
    move/from16 v66, v4

    goto/16 :goto_0

    .line 177
    :cond_3b
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x77

    if-ne v0, v2, :cond_3c

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x65

    if-ne v0, v2, :cond_3c

    const/16 v2, 0x1e

    move/from16 v66, v4

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_3c
    move/from16 v66, v4

    goto/16 :goto_0

    .line 176
    :cond_3d
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x74

    if-ne v0, v2, :cond_3e

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x65

    if-ne v0, v2, :cond_3e

    const/16 v2, 0x9a

    move/from16 v66, v4

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_3e
    move/from16 v66, v4

    goto/16 :goto_0

    .line 175
    :cond_3f
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x74

    if-ne v0, v2, :cond_40

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x6e

    if-ne v0, v2, :cond_40

    const/16 v2, 0x80

    move/from16 v66, v4

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto/16 :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_40
    move/from16 v66, v4

    goto/16 :goto_0

    .line 174
    :cond_41
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x72

    if-ne v0, v2, :cond_42

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x6f

    if-ne v0, v2, :cond_42

    const/16 v2, 0x78

    move/from16 v66, v4

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_42
    move/from16 v66, v4

    goto :goto_0

    .line 168
    .end local v64    # "Id_case":I
    .end local v67    # "Id_default":I
    .local v1, "Id_case":I
    .local v2, "Id_continue":I
    .restart local v3    # "Id_default":I
    .local v61, "s":Ljava/lang/String;
    :pswitch_10
    move/from16 v64, v1

    move/from16 v67, v3

    move-object/from16 v1, v61

    move/from16 v61, v2

    .end local v2    # "Id_continue":I
    .end local v3    # "Id_default":I
    .local v1, "s":Ljava/lang/String;
    .local v61, "Id_continue":I
    .restart local v64    # "Id_case":I
    .restart local v67    # "Id_default":I
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 169
    .restart local v0    # "c":I
    const/16 v2, 0x66

    if-ne v0, v2, :cond_44

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v2, 0x69

    if-ne v3, v2, :cond_43

    const/16 v2, 0x71

    move/from16 v66, v4

    .end local v62    # "id":I
    .local v2, "id":I
    goto :goto_2

    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_43
    move/from16 v66, v4

    goto :goto_0

    .line 170
    :cond_44
    const/16 v2, 0x69

    const/16 v3, 0x6e

    if-ne v0, v3, :cond_45

    move/from16 v66, v4

    const/4 v3, 0x0

    .end local v4    # "Id_delete":I
    .restart local v66    # "Id_delete":I
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v2, :cond_46

    const/16 v2, 0x34

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto :goto_2

    .line 171
    .end local v2    # "id":I
    .end local v66    # "Id_delete":I
    .restart local v4    # "Id_delete":I
    .restart local v62    # "id":I
    :cond_45
    move/from16 v66, v4

    const/4 v3, 0x0

    .end local v4    # "Id_delete":I
    .restart local v66    # "Id_delete":I
    const/16 v2, 0x6f

    if-ne v0, v2, :cond_46

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x64

    if-ne v2, v3, :cond_46

    const/16 v2, 0x77

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto :goto_2

    .line 262
    .end local v0    # "c":I
    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_46
    :goto_0
    move-object/from16 v0, v63

    .end local v63    # "X":Ljava/lang/String;
    .local v0, "X":Ljava/lang/String;
    :goto_1
    if-eqz v0, :cond_47

    if-eq v0, v1, :cond_47

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_47

    const/4 v2, 0x0

    .end local v62    # "id":I
    .restart local v2    # "id":I
    goto :goto_2

    .line 266
    .end local v0    # "X":Ljava/lang/String;
    .end local v2    # "id":I
    .restart local v62    # "id":I
    :cond_47
    move/from16 v2, v62

    .end local v62    # "id":I
    .restart local v2    # "id":I
    :goto_2
    if-nez v2, :cond_48

    const/4 v0, 0x0

    return v0

    .line 267
    :cond_48
    and-int/lit16 v0, v2, 0xff

    return v0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_a
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x77
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x6e
        :pswitch_d
        :pswitch_c
        :pswitch_b
    .end packed-switch
.end method

.method private final substring(II)Ljava/lang/String;
    .locals 3
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I

    .line 1612
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceString:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1613
    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1615
    :cond_0
    sub-int v0, p2, p1

    .line 1616
    .local v0, "count":I
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/trendmicro/hippo/TokenStream;->sourceBuffer:[C

    invoke-direct {v1, v2, p1, v0}, Ljava/lang/String;-><init>([CII)V

    return-object v1
.end method

.method private ungetChar(I)V
    .locals 3
    .param p1, "c"    # I

    .line 1430
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->ungetCursor:I

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->ungetBuffer:[I

    add-int/lit8 v0, v0, -0x1

    aget v0, v1, v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    .line 1431
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1432
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->ungetBuffer:[I

    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->ungetCursor:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->ungetCursor:I

    aput p1, v0, v1

    .line 1433
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    .line 1434
    return-void
.end method

.method private ungetCharIgnoreLineEnd(I)V
    .locals 3
    .param p1, "c"    # I

    .line 1563
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->ungetBuffer:[I

    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->ungetCursor:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->ungetCursor:I

    aput p1, v0, v1

    .line 1564
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    .line 1565
    return-void
.end method


# virtual methods
.method final eof()Z
    .locals 1

    .line 453
    iget-boolean v0, p0, Lcom/trendmicro/hippo/TokenStream;->hitEOF:Z

    return v0
.end method

.method final getAndResetCurrentComment()Ljava/lang/String;
    .locals 5

    .line 1759
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceString:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 1760
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->isMarkingComment()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1761
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceString:Ljava/lang/String;

    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1763
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->isMarkingComment()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1764
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->commentPrefix:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1765
    .local v0, "comment":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->sourceBuffer:[C

    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->commentCursor:I

    .line 1766
    invoke-virtual {p0}, Lcom/trendmicro/hippo/TokenStream;->getTokenLength()I

    move-result v3

    iget-object v4, p0, Lcom/trendmicro/hippo/TokenStream;->commentPrefix:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    .line 1765
    invoke-virtual {v0, v1, v2, v3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 1767
    const/4 v1, -0x1

    iput v1, p0, Lcom/trendmicro/hippo/TokenStream;->commentCursor:I

    .line 1768
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getCommentType()Lcom/trendmicro/hippo/Token$CommentType;
    .locals 1

    .line 1740
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->commentType:Lcom/trendmicro/hippo/Token$CommentType;

    return-object v0
.end method

.method public getCursor()I
    .locals 1

    .line 1711
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    return v0
.end method

.method getFirstXMLToken()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1131
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->xmlOpenTagsCount:I

    .line 1132
    iput-boolean v0, p0, Lcom/trendmicro/hippo/TokenStream;->xmlIsAttribute:Z

    .line 1133
    iput-boolean v0, p0, Lcom/trendmicro/hippo/TokenStream;->xmlIsTagContent:Z

    .line 1134
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->canUngetChar()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1135
    const/4 v0, -0x1

    return v0

    .line 1136
    :cond_0
    const/16 v0, 0x3c

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/TokenStream;->ungetChar(I)V

    .line 1137
    invoke-virtual {p0}, Lcom/trendmicro/hippo/TokenStream;->getNextXMLToken()I

    move-result v0

    return v0
.end method

.method final getLine()Ljava/lang/String;
    .locals 5

    .line 1620
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    .line 1621
    .local v0, "lineEnd":I
    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->lineEndChar:I

    const/4 v2, -0x1

    if-ltz v1, :cond_0

    .line 1623
    add-int/2addr v0, v2

    .line 1624
    const/16 v2, 0xa

    if-ne v1, v2, :cond_3

    add-int/lit8 v1, v0, -0x1

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->charAt(I)I

    move-result v1

    const/16 v2, 0xd

    if-ne v1, v2, :cond_3

    .line 1625
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 1629
    :cond_0
    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->lineStart:I

    sub-int v1, v0, v1

    .line 1631
    .local v1, "lineLength":I
    :goto_0
    iget v3, p0, Lcom/trendmicro/hippo/TokenStream;->lineStart:I

    add-int/2addr v3, v1

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/TokenStream;->charAt(I)I

    move-result v3

    .line 1632
    .local v3, "c":I
    if-eq v3, v2, :cond_2

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1633
    goto :goto_1

    .line 1630
    .end local v3    # "c":I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1636
    :cond_2
    :goto_1
    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->lineStart:I

    add-int v0, v2, v1

    .line 1638
    .end local v1    # "lineLength":I
    :cond_3
    :goto_2
    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->lineStart:I

    invoke-direct {p0, v1, v0}, Lcom/trendmicro/hippo/TokenStream;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method final getLine(I[I)Ljava/lang/String;
    .locals 10
    .param p1, "position"    # I
    .param p2, "linep"    # [I

    .line 1642
    nop

    .line 1643
    nop

    .line 1644
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->ungetCursor:I

    add-int/2addr v0, v1

    sub-int/2addr v0, p1

    .line 1645
    .local v0, "delta":I
    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    .line 1646
    .local v1, "cur":I
    if-le v0, v1, :cond_0

    .line 1648
    const/4 v2, 0x0

    return-object v2

    .line 1651
    :cond_0
    const/4 v2, 0x0

    .local v2, "end":I
    const/4 v3, 0x0

    .line 1652
    .local v3, "lines":I
    :goto_0
    if-lez v0, :cond_3

    .line 1653
    nop

    .line 1654
    add-int/lit8 v4, v1, -0x1

    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/TokenStream;->charAt(I)I

    move-result v4

    .line 1655
    .local v4, "c":I
    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1656
    const/16 v5, 0xa

    if-ne v4, v5, :cond_1

    add-int/lit8 v5, v1, -0x2

    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/TokenStream;->charAt(I)I

    move-result v5

    const/16 v6, 0xd

    if-ne v5, v6, :cond_1

    .line 1658
    add-int/lit8 v0, v0, -0x1

    .line 1659
    add-int/lit8 v1, v1, -0x1

    .line 1661
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 1662
    add-int/lit8 v2, v1, -0x1

    .line 1652
    .end local v4    # "c":I
    :cond_2
    add-int/lit8 v0, v0, -0x1

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 1666
    :cond_3
    const/4 v4, 0x0

    .local v4, "start":I
    const/4 v5, 0x0

    .line 1667
    .local v5, "offset":I
    :goto_1
    if-lez v1, :cond_5

    .line 1668
    add-int/lit8 v6, v1, -0x1

    invoke-direct {p0, v6}, Lcom/trendmicro/hippo/TokenStream;->charAt(I)I

    move-result v6

    .line 1669
    .local v6, "c":I
    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1670
    move v4, v1

    .line 1671
    goto :goto_2

    .line 1667
    .end local v6    # "c":I
    :cond_4
    add-int/lit8 v1, v1, -0x1

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1674
    :cond_5
    :goto_2
    iget v6, p0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    sub-int/2addr v6, v3

    iget v7, p0, Lcom/trendmicro/hippo/TokenStream;->lineEndChar:I

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-ltz v7, :cond_6

    move v7, v9

    goto :goto_3

    :cond_6
    move v7, v8

    :goto_3
    add-int/2addr v6, v7

    aput v6, p2, v8

    .line 1675
    aput v5, p2, v9

    .line 1676
    if-nez v3, :cond_7

    .line 1677
    invoke-virtual {p0}, Lcom/trendmicro/hippo/TokenStream;->getLine()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 1679
    :cond_7
    invoke-direct {p0, v4, v2}, Lcom/trendmicro/hippo/TokenStream;->substring(II)Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method final getLineno()I
    .locals 1

    .line 439
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->lineno:I

    return v0
.end method

.method getNextXMLToken()I
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1142
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1143
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1145
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v1

    .local v1, "c":I
    :goto_0
    const-string v2, "msg.XML.bad.form"

    const/4 v3, 0x0

    const/4 v4, -0x1

    if-eq v1, v4, :cond_13

    .line 1146
    iget-boolean v5, p0, Lcom/trendmicro/hippo/TokenStream;->xmlIsTagContent:Z

    const/16 v6, 0x92

    const/16 v7, 0x2f

    const/16 v8, 0x7b

    const/4 v9, 0x1

    if-eqz v5, :cond_7

    .line 1147
    const/16 v2, 0x9

    if-eq v1, v2, :cond_5

    const/16 v2, 0xa

    if-eq v1, v2, :cond_5

    const/16 v2, 0xd

    if-eq v1, v2, :cond_5

    const/16 v2, 0x20

    if-eq v1, v2, :cond_5

    const/16 v2, 0x22

    if-eq v1, v2, :cond_4

    const/16 v2, 0x27

    if-eq v1, v2, :cond_4

    const/16 v2, 0x3e

    if-eq v1, v7, :cond_3

    if-eq v1, v8, :cond_2

    const/16 v3, 0x3d

    if-eq v1, v3, :cond_1

    if-eq v1, v2, :cond_0

    .line 1182
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1183
    iput-boolean v0, p0, Lcom/trendmicro/hippo/TokenStream;->xmlIsAttribute:Z

    goto :goto_1

    .line 1149
    :cond_0
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1150
    iput-boolean v0, p0, Lcom/trendmicro/hippo/TokenStream;->xmlIsTagContent:Z

    .line 1151
    iput-boolean v0, p0, Lcom/trendmicro/hippo/TokenStream;->xmlIsAttribute:Z

    .line 1152
    goto :goto_1

    .line 1172
    :cond_1
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1173
    iput-boolean v9, p0, Lcom/trendmicro/hippo/TokenStream;->xmlIsAttribute:Z

    .line 1174
    goto :goto_1

    .line 1163
    :cond_2
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->ungetChar(I)V

    .line 1164
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getStringFromBuffer()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1165
    return v6

    .line 1154
    :cond_3
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1155
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->peekChar()I

    move-result v3

    if-ne v3, v2, :cond_6

    .line 1156
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v1

    .line 1157
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1158
    iput-boolean v0, p0, Lcom/trendmicro/hippo/TokenStream;->xmlIsTagContent:Z

    .line 1159
    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->xmlOpenTagsCount:I

    sub-int/2addr v2, v9

    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->xmlOpenTagsCount:I

    goto :goto_1

    .line 1168
    :cond_4
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1169
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->readQuotedString(I)Z

    move-result v2

    if-nez v2, :cond_6

    return v4

    .line 1179
    :cond_5
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1180
    nop

    .line 1187
    :cond_6
    :goto_1
    iget-boolean v2, p0, Lcom/trendmicro/hippo/TokenStream;->xmlIsTagContent:Z

    if-nez v2, :cond_11

    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->xmlOpenTagsCount:I

    if-nez v2, :cond_11

    .line 1188
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getStringFromBuffer()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1189
    const/16 v0, 0x95

    return v0

    .line 1192
    :cond_7
    const/16 v5, 0x3c

    if-eq v1, v5, :cond_9

    if-eq v1, v8, :cond_8

    .line 1279
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    goto/16 :goto_2

    .line 1275
    :cond_8
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->ungetChar(I)V

    .line 1276
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getStringFromBuffer()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1277
    return v6

    .line 1194
    :cond_9
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1195
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->peekChar()I

    move-result v1

    .line 1196
    const/16 v5, 0x21

    if-eq v1, v5, :cond_d

    if-eq v1, v7, :cond_b

    const/16 v2, 0x3f

    if-eq v1, v2, :cond_a

    .line 1269
    iput-boolean v9, p0, Lcom/trendmicro/hippo/TokenStream;->xmlIsTagContent:Z

    .line 1270
    iget v2, p0, Lcom/trendmicro/hippo/TokenStream;->xmlOpenTagsCount:I

    add-int/2addr v2, v9

    iput v2, p0, Lcom/trendmicro/hippo/TokenStream;->xmlOpenTagsCount:I

    .line 1271
    goto/16 :goto_2

    .line 1249
    :cond_a
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v1

    .line 1250
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1251
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->readPI()Z

    move-result v2

    if-nez v2, :cond_11

    return v4

    .line 1255
    :cond_b
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v1

    .line 1256
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1257
    iget v5, p0, Lcom/trendmicro/hippo/TokenStream;->xmlOpenTagsCount:I

    if-nez v5, :cond_c

    .line 1259
    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1260
    iput-object v3, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1261
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 1262
    return v4

    .line 1264
    :cond_c
    iput-boolean v9, p0, Lcom/trendmicro/hippo/TokenStream;->xmlIsTagContent:Z

    .line 1265
    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lcom/trendmicro/hippo/TokenStream;->xmlOpenTagsCount:I

    .line 1266
    goto/16 :goto_2

    .line 1198
    :cond_d
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v1

    .line 1199
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1200
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->peekChar()I

    move-result v1

    .line 1201
    const/16 v5, 0x2d

    if-eq v1, v5, :cond_10

    const/16 v5, 0x5b

    if-eq v1, v5, :cond_e

    .line 1244
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->readEntity()Z

    move-result v2

    if-nez v2, :cond_11

    return v4

    .line 1218
    :cond_e
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v1

    .line 1219
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1220
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v6

    const/16 v7, 0x43

    if-ne v6, v7, :cond_f

    .line 1221
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v6

    const/16 v8, 0x44

    if-ne v6, v8, :cond_f

    .line 1222
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v6

    const/16 v9, 0x41

    if-ne v6, v9, :cond_f

    .line 1223
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v6

    const/16 v10, 0x54

    if-ne v6, v10, :cond_f

    .line 1224
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v6

    if-ne v6, v9, :cond_f

    .line 1225
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v6

    if-ne v6, v5, :cond_f

    .line 1227
    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1228
    invoke-direct {p0, v8}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1229
    invoke-direct {p0, v9}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1230
    invoke-direct {p0, v10}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1231
    invoke-direct {p0, v9}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1232
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1233
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->readCDATA()Z

    move-result v2

    if-nez v2, :cond_11

    return v4

    .line 1237
    :cond_f
    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1238
    iput-object v3, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1239
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 1240
    return v4

    .line 1203
    :cond_10
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v1

    .line 1204
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1205
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v1

    .line 1206
    if-ne v1, v5, :cond_12

    .line 1207
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1208
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->readXmlComment()Z

    move-result v2

    if-nez v2, :cond_11

    return v4

    .line 1145
    :cond_11
    :goto_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v1

    goto/16 :goto_0

    .line 1211
    :cond_12
    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1212
    iput-object v3, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1213
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 1214
    return v4

    .line 1285
    .end local v1    # "c":I
    :cond_13
    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    iput v1, p0, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 1286
    iput v0, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1287
    iput-object v3, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1288
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 1289
    return v4
.end method

.method final getNumber()D
    .locals 2

    .line 447
    iget-wide v0, p0, Lcom/trendmicro/hippo/TokenStream;->number:D

    return-wide v0
.end method

.method final getOffset()I
    .locals 2

    .line 1581
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceCursor:I

    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->lineStart:I

    sub-int/2addr v0, v1

    .line 1582
    .local v0, "n":I
    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->lineEndChar:I

    if-ltz v1, :cond_0

    add-int/lit8 v0, v0, -0x1

    .line 1583
    :cond_0
    return v0
.end method

.method final getQuoteChar()C
    .locals 1

    .line 444
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->quoteChar:I

    int-to-char v0, v0

    return v0
.end method

.method final getSourceString()Ljava/lang/String;
    .locals 1

    .line 437
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->sourceString:Ljava/lang/String;

    return-object v0
.end method

.method final getString()Ljava/lang/String;
    .locals 1

    .line 441
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    return-object v0
.end method

.method final getToken()I
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    .line 463
    :goto_0
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 464
    .local v0, "c":I
    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    .line 465
    iget v3, v1, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    add-int/lit8 v4, v3, -0x1

    iput v4, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 466
    iput v3, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 467
    return v2

    .line 468
    :cond_0
    const/16 v4, 0xa

    const/4 v5, 0x1

    if-ne v0, v4, :cond_1

    .line 469
    iput-boolean v2, v1, Lcom/trendmicro/hippo/TokenStream;->dirtyLine:Z

    .line 470
    iget v2, v1, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    add-int/lit8 v3, v2, -0x1

    iput v3, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 471
    iput v2, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 472
    return v5

    .line 473
    :cond_1
    invoke-static {v0}, Lcom/trendmicro/hippo/TokenStream;->isJSSpace(I)Z

    move-result v6

    if-nez v6, :cond_73

    .line 474
    const/16 v6, 0x2d

    if-eq v0, v6, :cond_2

    .line 475
    iput-boolean v5, v1, Lcom/trendmicro/hippo/TokenStream;->dirtyLine:Z

    .line 482
    :cond_2
    iget v7, v1, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    add-int/lit8 v8, v7, -0x1

    iput v8, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 483
    iput v7, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 485
    const/16 v7, 0x40

    if-ne v0, v7, :cond_3

    const/16 v2, 0x94

    return v2

    .line 490
    :cond_3
    const/4 v7, 0x0

    .line 491
    .local v7, "isUnicodeEscapeStart":Z
    const/16 v8, 0x75

    const/16 v9, 0x5c

    if-ne v0, v9, :cond_5

    .line 492
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 493
    if-ne v0, v8, :cond_4

    .line 494
    const/4 v10, 0x1

    .line 495
    .local v10, "identifierStart":Z
    const/4 v7, 0x1

    .line 496
    iput v2, v1, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    goto :goto_1

    .line 498
    .end local v10    # "identifierStart":Z
    :cond_4
    const/4 v10, 0x0

    .line 499
    .restart local v10    # "identifierStart":Z
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->ungetChar(I)V

    .line 500
    const/16 v0, 0x5c

    goto :goto_1

    .line 503
    .end local v10    # "identifierStart":Z
    :cond_5
    int-to-char v10, v0

    invoke-static {v10}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v10

    .line 504
    .restart local v10    # "identifierStart":Z
    if-eqz v10, :cond_6

    .line 505
    iput v2, v1, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 506
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 510
    :cond_6
    :goto_1
    const/4 v11, 0x4

    if-eqz v10, :cond_16

    .line 511
    move v2, v7

    .line 513
    .local v2, "containsEscape":Z
    :goto_2
    if-eqz v7, :cond_a

    .line 520
    const/4 v4, 0x0

    .line 521
    .local v4, "escapeVal":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_3
    if-eq v5, v11, :cond_8

    .line 522
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 523
    invoke-static {v0, v4}, Lcom/trendmicro/hippo/Kit;->xDigitToInt(II)I

    move-result v4

    .line 525
    if-gez v4, :cond_7

    goto :goto_4

    .line 521
    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 527
    .end local v5    # "i":I
    :cond_8
    :goto_4
    if-gez v4, :cond_9

    .line 528
    iget-object v5, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v6, "msg.invalid.escape"

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 529
    return v3

    .line 531
    :cond_9
    invoke-direct {v1, v4}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 532
    const/4 v7, 0x0

    .line 533
    .end local v4    # "escapeVal":I
    goto :goto_2

    .line 534
    :cond_a
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 535
    if-ne v0, v9, :cond_c

    .line 536
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 537
    if-ne v0, v8, :cond_b

    .line 538
    const/4 v7, 0x1

    .line 539
    const/4 v2, 0x1

    goto :goto_2

    .line 541
    :cond_b
    iget-object v4, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v5, "msg.illegal.character"

    invoke-virtual {v4, v5, v0}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;I)V

    .line 542
    return v3

    .line 545
    :cond_c
    if-eq v0, v3, :cond_e

    const v4, 0xfeff

    if-eq v0, v4, :cond_e

    int-to-char v4, v0

    .line 546
    invoke-static {v4}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v4

    if-nez v4, :cond_d

    .line 548
    goto :goto_5

    .line 550
    :cond_d
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    goto :goto_2

    .line 554
    :cond_e
    :goto_5
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->ungetChar(I)V

    .line 556
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getStringFromBuffer()Ljava/lang/String;

    move-result-object v3

    .line 557
    .local v3, "str":Ljava/lang/String;
    if-nez v2, :cond_14

    .line 562
    iget-object v4, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    iget-object v4, v4, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v4

    iget-object v5, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective()Z

    move-result v5

    invoke-static {v3, v4, v5}, Lcom/trendmicro/hippo/TokenStream;->stringToKeyword(Ljava/lang/String;IZ)I

    move-result v4

    .line 563
    .local v4, "result":I
    if-eqz v4, :cond_15

    .line 564
    const/16 v5, 0x9a

    if-eq v4, v5, :cond_f

    const/16 v5, 0x49

    if-ne v4, v5, :cond_11

    :cond_f
    iget-object v5, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    iget-object v5, v5, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 565
    invoke-virtual {v5}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v5

    const/16 v6, 0xaa

    if-ge v5, v6, :cond_11

    .line 569
    const/16 v5, 0x9a

    if-ne v4, v5, :cond_10

    const-string v5, "let"

    goto :goto_6

    :cond_10
    const-string v5, "yield"

    :goto_6
    iput-object v5, v1, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 570
    const/16 v4, 0x27

    .line 574
    :cond_11
    iget-object v5, v1, Lcom/trendmicro/hippo/TokenStream;->allStrings:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v5, v3}, Lcom/trendmicro/hippo/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iput-object v5, v1, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 575
    const/16 v5, 0x80

    if-eq v4, v5, :cond_12

    .line 576
    return v4

    .line 577
    :cond_12
    iget-object v5, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    iget-object v5, v5, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v5

    const/16 v6, 0xc8

    if-lt v5, v6, :cond_13

    .line 578
    return v4

    .line 579
    :cond_13
    iget-object v5, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    iget-object v5, v5, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/CompilerEnvirons;->isReservedKeywordAsIdentifier()Z

    move-result v5

    if-nez v5, :cond_15

    .line 580
    return v4

    .line 583
    .end local v4    # "result":I
    :cond_14
    iget-object v4, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    iget-object v4, v4, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v4

    iget-object v5, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/Parser;->inUseStrictDirective()Z

    move-result v5

    invoke-static {v3, v4, v5}, Lcom/trendmicro/hippo/TokenStream;->isKeyword(Ljava/lang/String;IZ)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 586
    invoke-direct {v1, v3}, Lcom/trendmicro/hippo/TokenStream;->convertLastCharToHex(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_7

    .line 583
    :cond_15
    nop

    .line 588
    :goto_7
    iget-object v4, v1, Lcom/trendmicro/hippo/TokenStream;->allStrings:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, v1, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 589
    const/16 v4, 0x27

    return v4

    .line 593
    .end local v2    # "containsEscape":Z
    .end local v3    # "str":Ljava/lang/String;
    :cond_16
    invoke-static {v0}, Lcom/trendmicro/hippo/TokenStream;->isDigit(I)Z

    move-result v12

    const/4 v13, 0x2

    const/16 v14, 0x62

    const/16 v8, 0x2e

    const/16 v15, 0x30

    if-nez v12, :cond_57

    if-ne v0, v8, :cond_17

    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->peekChar()I

    move-result v12

    invoke-static {v12}, Lcom/trendmicro/hippo/TokenStream;->isDigit(I)Z

    move-result v12

    if-eqz v12, :cond_17

    goto/16 :goto_f

    .line 709
    :cond_17
    const/16 v12, 0x22

    if-eq v0, v12, :cond_46

    const/16 v12, 0x27

    if-eq v0, v12, :cond_46

    const/16 v12, 0x60

    if-ne v0, v12, :cond_18

    goto/16 :goto_a

    .line 818
    :cond_18
    const/16 v2, 0x2f

    const/16 v12, 0x21

    const/16 v15, 0x3d

    if-eq v0, v12, :cond_43

    const/16 v4, 0x5b

    if-eq v0, v4, :cond_42

    const/16 v4, 0x25

    if-eq v0, v4, :cond_40

    const/16 v4, 0x26

    if-eq v0, v4, :cond_3d

    const/16 v4, 0x5d

    if-eq v0, v4, :cond_3c

    const/16 v4, 0x5e

    if-eq v0, v4, :cond_3a

    const/16 v4, 0x3e

    const/16 v16, 0xa2

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    .line 1020
    iget-object v2, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v4, "msg.illegal.character"

    invoke-virtual {v2, v4, v0}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;I)V

    .line 1021
    return v3

    .line 987
    :pswitch_0
    const/16 v2, 0x1b

    return v2

    .line 823
    :pswitch_1
    const/16 v2, 0x57

    return v2

    .line 843
    :pswitch_2
    const/16 v2, 0x7c

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_19

    .line 844
    const/16 v2, 0x69

    return v2

    .line 845
    :cond_19
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 846
    return v9

    .line 848
    :cond_1a
    const/16 v2, 0x9

    return v2

    .line 822
    :pswitch_3
    const/16 v2, 0x56

    return v2

    .line 827
    :pswitch_4
    const/16 v2, 0x67

    return v2

    .line 913
    :pswitch_5
    invoke-direct {v1, v4}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 914
    invoke-direct {v1, v4}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 915
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 916
    const/16 v2, 0x61

    return v2

    .line 918
    :cond_1b
    const/16 v2, 0x14

    return v2

    .line 920
    :cond_1c
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 921
    const/16 v2, 0x60

    return v2

    .line 923
    :cond_1d
    const/16 v2, 0x13

    return v2

    .line 925
    :cond_1e
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 926
    const/16 v2, 0x11

    return v2

    .line 928
    :cond_1f
    const/16 v2, 0x10

    return v2

    .line 867
    :pswitch_6
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 868
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 869
    return v8

    .line 871
    :cond_20
    const/16 v2, 0xc

    return v2

    .line 872
    :cond_21
    invoke-direct {v1, v4}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 873
    const/16 v2, 0xa5

    return v2

    .line 875
    :cond_22
    const/16 v2, 0x5b

    return v2

    .line 889
    :pswitch_7
    invoke-direct {v1, v12}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 890
    invoke-direct {v1, v6}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 891
    invoke-direct {v1, v6}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_23

    .line 892
    iget v2, v1, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    sub-int/2addr v2, v11

    iput v2, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 893
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->skipLine()V

    .line 894
    sget-object v2, Lcom/trendmicro/hippo/Token$CommentType;->HTML:Lcom/trendmicro/hippo/Token$CommentType;

    iput-object v2, v1, Lcom/trendmicro/hippo/TokenStream;->commentType:Lcom/trendmicro/hippo/Token$CommentType;

    .line 895
    return v16

    .line 897
    :cond_23
    invoke-direct {v1, v6}, Lcom/trendmicro/hippo/TokenStream;->ungetCharIgnoreLineEnd(I)V

    .line 899
    :cond_24
    invoke-direct {v1, v12}, Lcom/trendmicro/hippo/TokenStream;->ungetCharIgnoreLineEnd(I)V

    .line 901
    :cond_25
    const/16 v2, 0x3c

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 902
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 903
    const/16 v2, 0x5f

    return v2

    .line 905
    :cond_26
    const/16 v2, 0x12

    return v2

    .line 907
    :cond_27
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 908
    const/16 v2, 0xf

    return v2

    .line 910
    :cond_28
    const/16 v2, 0xe

    return v2

    .line 819
    :pswitch_8
    const/16 v2, 0x53

    return v2

    .line 829
    :pswitch_9
    const/16 v2, 0x3a

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 830
    const/16 v2, 0x91

    return v2

    .line 832
    :cond_29
    const/16 v2, 0x68

    return v2

    .line 937
    :pswitch_a
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->markCommentStart()V

    .line 939
    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v4

    if-eqz v4, :cond_2a

    .line 940
    iget v2, v1, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    sub-int/2addr v2, v13

    iput v2, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 941
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->skipLine()V

    .line 942
    sget-object v2, Lcom/trendmicro/hippo/Token$CommentType;->LINE:Lcom/trendmicro/hippo/Token$CommentType;

    iput-object v2, v1, Lcom/trendmicro/hippo/TokenStream;->commentType:Lcom/trendmicro/hippo/Token$CommentType;

    .line 943
    return v16

    .line 946
    :cond_2a
    const/16 v4, 0x2a

    invoke-direct {v1, v4}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v6

    if-eqz v6, :cond_30

    .line 947
    const/4 v6, 0x0

    .line 948
    .local v6, "lookForSlash":Z
    iget v8, v1, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    sub-int/2addr v8, v13

    iput v8, v1, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 949
    invoke-direct {v1, v4}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v8

    if-eqz v8, :cond_2b

    .line 950
    const/4 v6, 0x1

    .line 951
    sget-object v8, Lcom/trendmicro/hippo/Token$CommentType;->JSDOC:Lcom/trendmicro/hippo/Token$CommentType;

    iput-object v8, v1, Lcom/trendmicro/hippo/TokenStream;->commentType:Lcom/trendmicro/hippo/Token$CommentType;

    goto :goto_8

    .line 953
    :cond_2b
    sget-object v8, Lcom/trendmicro/hippo/Token$CommentType;->BLOCK_COMMENT:Lcom/trendmicro/hippo/Token$CommentType;

    iput-object v8, v1, Lcom/trendmicro/hippo/TokenStream;->commentType:Lcom/trendmicro/hippo/Token$CommentType;

    .line 956
    :cond_2c
    :goto_8
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 957
    if-ne v0, v3, :cond_2d

    .line 958
    iget v2, v1, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    sub-int/2addr v2, v5

    iput v2, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 959
    iget-object v2, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v3, "msg.unterminated.comment"

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 960
    return v16

    .line 961
    :cond_2d
    if-ne v0, v4, :cond_2e

    .line 962
    const/4 v6, 0x1

    goto :goto_8

    .line 963
    :cond_2e
    if-ne v0, v2, :cond_2f

    .line 964
    if-eqz v6, :cond_2c

    .line 965
    iget v2, v1, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    iput v2, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 966
    return v16

    .line 969
    :cond_2f
    const/4 v6, 0x0

    .line 970
    iget v8, v1, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    iput v8, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    goto :goto_8

    .line 975
    .end local v6    # "lookForSlash":Z
    :cond_30
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_31

    .line 976
    const/16 v2, 0x65

    return v2

    .line 978
    :cond_31
    const/16 v2, 0x18

    return v2

    .line 834
    :pswitch_b
    invoke-direct {v1, v8}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_32

    .line 835
    const/16 v2, 0x90

    return v2

    .line 836
    :cond_32
    const/16 v2, 0x28

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_33

    .line 837
    const/16 v2, 0x93

    return v2

    .line 839
    :cond_33
    const/16 v2, 0x6d

    return v2

    .line 999
    :pswitch_c
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_34

    .line 1000
    const/16 v0, 0x63

    goto :goto_9

    .line 1001
    :cond_34
    invoke-direct {v1, v6}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_36

    .line 1002
    iget-boolean v2, v1, Lcom/trendmicro/hippo/TokenStream;->dirtyLine:Z

    if-nez v2, :cond_35

    .line 1005
    invoke-direct {v1, v4}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_35

    .line 1006
    const-string v2, "--"

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/TokenStream;->markCommentStart(Ljava/lang/String;)V

    .line 1007
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->skipLine()V

    .line 1008
    sget-object v2, Lcom/trendmicro/hippo/Token$CommentType;->HTML:Lcom/trendmicro/hippo/Token$CommentType;

    iput-object v2, v1, Lcom/trendmicro/hippo/TokenStream;->commentType:Lcom/trendmicro/hippo/Token$CommentType;

    .line 1009
    return v16

    .line 1012
    :cond_35
    const/16 v0, 0x6c

    goto :goto_9

    .line 1014
    :cond_36
    const/16 v0, 0x16

    .line 1016
    :goto_9
    iput-boolean v5, v1, Lcom/trendmicro/hippo/TokenStream;->dirtyLine:Z

    .line 1017
    return v0

    .line 826
    :pswitch_d
    const/16 v2, 0x5a

    return v2

    .line 990
    :pswitch_e
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_37

    .line 991
    return v14

    .line 992
    :cond_37
    const/16 v2, 0x2b

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_38

    .line 993
    const/16 v2, 0x6b

    return v2

    .line 995
    :cond_38
    const/16 v2, 0x15

    return v2

    .line 931
    :pswitch_f
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_39

    .line 932
    const/16 v2, 0x64

    return v2

    .line 934
    :cond_39
    const/16 v2, 0x17

    return v2

    .line 825
    :pswitch_10
    const/16 v2, 0x59

    return v2

    .line 824
    :pswitch_11
    const/16 v2, 0x58

    return v2

    .line 852
    :cond_3a
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 853
    const/16 v2, 0x5d

    return v2

    .line 855
    :cond_3b
    const/16 v2, 0xa

    return v2

    .line 821
    :cond_3c
    const/16 v2, 0x55

    return v2

    .line 858
    :cond_3d
    const/16 v2, 0x26

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 859
    const/16 v2, 0x6a

    return v2

    .line 860
    :cond_3e
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 861
    const/16 v2, 0x5e

    return v2

    .line 863
    :cond_3f
    const/16 v2, 0xb

    return v2

    .line 981
    :cond_40
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v2

    if-eqz v2, :cond_41

    .line 982
    const/16 v2, 0x66

    return v2

    .line 984
    :cond_41
    const/16 v2, 0x19

    return v2

    .line 820
    :cond_42
    const/16 v2, 0x54

    return v2

    .line 879
    :cond_43
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v3

    if-eqz v3, :cond_45

    .line 880
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v3

    if-eqz v3, :cond_44

    .line 881
    return v2

    .line 883
    :cond_44
    const/16 v2, 0xd

    return v2

    .line 885
    :cond_45
    const/16 v2, 0x1a

    return v2

    .line 715
    :cond_46
    :goto_a
    iput v0, v1, Lcom/trendmicro/hippo/TokenStream;->quoteChar:I

    .line 716
    iput v2, v1, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 718
    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/TokenStream;->getChar(Z)I

    move-result v0

    .line 719
    :goto_b
    iget v4, v1, Lcom/trendmicro/hippo/TokenStream;->quoteChar:I

    if-eq v0, v4, :cond_56

    .line 720
    const/16 v4, 0xa

    if-eq v0, v4, :cond_55

    if-ne v0, v3, :cond_47

    goto/16 :goto_e

    .line 727
    :cond_47
    if-ne v0, v9, :cond_54

    .line 731
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 732
    if-eq v0, v4, :cond_53

    if-eq v0, v14, :cond_52

    const/16 v4, 0x66

    if-eq v0, v4, :cond_51

    const/16 v4, 0x6e

    if-eq v0, v4, :cond_50

    const/16 v4, 0x72

    if-eq v0, v4, :cond_4f

    const/16 v4, 0x78

    if-eq v0, v4, :cond_4c

    packed-switch v0, :pswitch_data_3

    .line 791
    if-gt v15, v0, :cond_49

    const/16 v4, 0x38

    if-ge v0, v4, :cond_49

    .line 792
    add-int/lit8 v5, v0, -0x30

    .line 793
    .local v5, "val":I
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 794
    if-gt v15, v0, :cond_48

    if-ge v0, v4, :cond_48

    .line 795
    mul-int/lit8 v6, v5, 0x8

    add-int/2addr v6, v0

    add-int/lit8 v5, v6, -0x30

    .line 796
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 797
    if-gt v15, v0, :cond_48

    if-ge v0, v4, :cond_48

    const/16 v4, 0x1f

    if-gt v5, v4, :cond_48

    .line 800
    mul-int/lit8 v4, v5, 0x8

    add-int/2addr v4, v0

    add-int/lit8 v5, v4, -0x30

    .line 801
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 804
    :cond_48
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->ungetChar(I)V

    .line 805
    move v0, v5

    const/16 v5, 0x75

    goto/16 :goto_d

    .line 809
    .end local v5    # "val":I
    :cond_49
    const/16 v5, 0x75

    goto/16 :goto_d

    .line 741
    :pswitch_12
    const/16 v0, 0xb

    const/16 v5, 0x75

    goto/16 :goto_d

    .line 747
    :pswitch_13
    iget v4, v1, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 748
    .local v4, "escapeStart":I
    const/16 v5, 0x75

    invoke-direct {v1, v5}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 749
    const/4 v6, 0x0

    .line 750
    .local v6, "escapeVal":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_c
    if-eq v8, v11, :cond_4b

    .line 751
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 752
    invoke-static {v0, v6}, Lcom/trendmicro/hippo/Kit;->xDigitToInt(II)I

    move-result v6

    .line 753
    if-gez v6, :cond_4a

    .line 754
    goto :goto_b

    .line 756
    :cond_4a
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 750
    add-int/lit8 v8, v8, 0x1

    goto :goto_c

    .line 760
    .end local v8    # "i":I
    :cond_4b
    iput v4, v1, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 761
    move v0, v6

    .line 762
    goto :goto_d

    .line 737
    .end local v4    # "escapeStart":I
    .end local v6    # "escapeVal":I
    :pswitch_14
    const/16 v5, 0x75

    const/16 v0, 0x9

    goto :goto_d

    .line 766
    :cond_4c
    const/16 v5, 0x75

    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 767
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/Kit;->xDigitToInt(II)I

    move-result v4

    .line 768
    .local v4, "escapeVal":I
    if-gez v4, :cond_4d

    .line 769
    const/16 v6, 0x78

    invoke-direct {v1, v6}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 770
    goto/16 :goto_b

    .line 772
    :cond_4d
    move v6, v0

    .line 773
    .local v6, "c1":I
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 774
    invoke-static {v0, v4}, Lcom/trendmicro/hippo/Kit;->xDigitToInt(II)I

    move-result v4

    .line 775
    if-gez v4, :cond_4e

    .line 776
    const/16 v8, 0x78

    invoke-direct {v1, v8}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 777
    invoke-direct {v1, v6}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 778
    goto/16 :goto_b

    .line 781
    :cond_4e
    move v0, v4

    .line 782
    goto :goto_d

    .line 736
    .end local v4    # "escapeVal":I
    .end local v6    # "c1":I
    :cond_4f
    const/16 v5, 0x75

    const/16 v0, 0xd

    goto :goto_d

    .line 735
    :cond_50
    const/16 v5, 0x75

    const/16 v0, 0xa

    goto :goto_d

    .line 734
    :cond_51
    const/16 v5, 0x75

    const/16 v0, 0xc

    goto :goto_d

    .line 733
    :cond_52
    const/16 v5, 0x75

    const/16 v0, 0x8

    goto :goto_d

    .line 787
    :cond_53
    const/16 v5, 0x75

    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 788
    goto/16 :goto_b

    .line 727
    :cond_54
    const/16 v5, 0x75

    .line 809
    :goto_d
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 810
    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/TokenStream;->getChar(Z)I

    move-result v0

    goto/16 :goto_b

    .line 721
    :cond_55
    :goto_e
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->ungetChar(I)V

    .line 722
    iget v2, v1, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    iput v2, v1, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 723
    iget-object v2, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v4, "msg.unterminated.string.lit"

    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 724
    return v3

    .line 813
    :cond_56
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getStringFromBuffer()Ljava/lang/String;

    move-result-object v2

    .line 814
    .local v2, "str":Ljava/lang/String;
    iget-object v3, v1, Lcom/trendmicro/hippo/TokenStream;->allStrings:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, v1, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 815
    const/16 v3, 0x29

    return v3

    .line 594
    .end local v2    # "str":Ljava/lang/String;
    :cond_57
    :goto_f
    iput v2, v1, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 595
    const/16 v4, 0xa

    .line 596
    .local v4, "base":I
    iput-boolean v2, v1, Lcom/trendmicro/hippo/TokenStream;->isBinary:Z

    iput-boolean v2, v1, Lcom/trendmicro/hippo/TokenStream;->isOctal:Z

    iput-boolean v2, v1, Lcom/trendmicro/hippo/TokenStream;->isOldOctal:Z

    iput-boolean v2, v1, Lcom/trendmicro/hippo/TokenStream;->isHex:Z

    .line 597
    iget-object v9, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    iget-object v9, v9, Lcom/trendmicro/hippo/Parser;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v9}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v9

    const/16 v11, 0xc8

    if-lt v9, v11, :cond_58

    move v9, v5

    goto :goto_10

    :cond_58
    move v9, v2

    .line 599
    .local v9, "es6":Z
    :goto_10
    if-ne v0, v15, :cond_60

    .line 600
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 601
    const/16 v11, 0x78

    if-eq v0, v11, :cond_5f

    const/16 v11, 0x58

    if-ne v0, v11, :cond_59

    goto :goto_11

    .line 605
    :cond_59
    if-eqz v9, :cond_5b

    const/16 v11, 0x6f

    if-eq v0, v11, :cond_5a

    const/16 v11, 0x4f

    if-ne v0, v11, :cond_5b

    .line 606
    :cond_5a
    const/16 v4, 0x8

    .line 607
    iput-boolean v5, v1, Lcom/trendmicro/hippo/TokenStream;->isOctal:Z

    .line 608
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    goto :goto_12

    .line 609
    :cond_5b
    if-eqz v9, :cond_5d

    if-eq v0, v14, :cond_5c

    const/16 v11, 0x42

    if-ne v0, v11, :cond_5d

    .line 610
    :cond_5c
    const/4 v4, 0x2

    .line 611
    iput-boolean v5, v1, Lcom/trendmicro/hippo/TokenStream;->isBinary:Z

    .line 612
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    goto :goto_12

    .line 613
    :cond_5d
    invoke-static {v0}, Lcom/trendmicro/hippo/TokenStream;->isDigit(I)Z

    move-result v11

    if-eqz v11, :cond_5e

    .line 614
    const/16 v4, 0x8

    .line 615
    iput-boolean v5, v1, Lcom/trendmicro/hippo/TokenStream;->isOldOctal:Z

    goto :goto_12

    .line 617
    :cond_5e
    invoke-direct {v1, v15}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    goto :goto_12

    .line 602
    :cond_5f
    :goto_11
    const/16 v4, 0x10

    .line 603
    iput-boolean v5, v1, Lcom/trendmicro/hippo/TokenStream;->isHex:Z

    .line 604
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 621
    :cond_60
    :goto_12
    const/4 v5, 0x1

    .line 622
    .local v5, "isEmpty":Z
    const/16 v11, 0x10

    const-string v12, "msg.caught.nfe"

    if-ne v4, v11, :cond_61

    .line 623
    :goto_13
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/Kit;->xDigitToInt(II)I

    move-result v11

    if-ltz v11, :cond_66

    .line 624
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 625
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 626
    const/4 v5, 0x0

    goto :goto_13

    .line 629
    :cond_61
    :goto_14
    if-gt v15, v0, :cond_66

    const/16 v11, 0x39

    if-gt v0, v11, :cond_66

    .line 630
    const/16 v11, 0x8

    if-ne v4, v11, :cond_64

    const/16 v11, 0x38

    if-lt v0, v11, :cond_64

    .line 631
    iget-boolean v14, v1, Lcom/trendmicro/hippo/TokenStream;->isOldOctal:Z

    if-eqz v14, :cond_63

    .line 638
    iget-object v14, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    .line 639
    if-ne v0, v11, :cond_62

    const-string v16, "8"

    goto :goto_15

    :cond_62
    const-string v16, "9"

    :goto_15
    move-object/from16 v11, v16

    .line 638
    const-string v15, "msg.bad.octal.literal"

    invoke-virtual {v14, v15, v11}, Lcom/trendmicro/hippo/Parser;->addWarning(Ljava/lang/String;Ljava/lang/String;)V

    .line 640
    const/16 v4, 0xa

    goto :goto_16

    .line 642
    :cond_63
    iget-object v2, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    invoke-virtual {v2, v12}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 643
    return v3

    .line 645
    :cond_64
    if-ne v4, v13, :cond_65

    const/16 v11, 0x32

    if-lt v0, v11, :cond_65

    .line 646
    iget-object v2, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    invoke-virtual {v2, v12}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 647
    return v3

    .line 649
    :cond_65
    :goto_16
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 650
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 651
    const/4 v5, 0x0

    const/16 v15, 0x30

    goto :goto_14

    .line 654
    :cond_66
    if-eqz v5, :cond_68

    iget-boolean v11, v1, Lcom/trendmicro/hippo/TokenStream;->isBinary:Z

    if-nez v11, :cond_67

    iget-boolean v11, v1, Lcom/trendmicro/hippo/TokenStream;->isOctal:Z

    if-nez v11, :cond_67

    iget-boolean v11, v1, Lcom/trendmicro/hippo/TokenStream;->isHex:Z

    if-eqz v11, :cond_68

    .line 655
    :cond_67
    iget-object v2, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    invoke-virtual {v2, v12}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 656
    return v3

    .line 659
    :cond_68
    const/4 v11, 0x1

    .line 661
    .local v11, "isInteger":Z
    const/16 v13, 0xa

    if-ne v4, v13, :cond_71

    if-eq v0, v8, :cond_69

    const/16 v13, 0x65

    if-eq v0, v13, :cond_69

    const/16 v13, 0x45

    if-ne v0, v13, :cond_71

    .line 662
    :cond_69
    const/4 v13, 0x0

    .line 663
    .end local v11    # "isInteger":Z
    .local v13, "isInteger":Z
    if-ne v0, v8, :cond_6b

    .line 665
    :cond_6a
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 666
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 667
    invoke-static {v0}, Lcom/trendmicro/hippo/TokenStream;->isDigit(I)Z

    move-result v8

    if-nez v8, :cond_6a

    .line 669
    :cond_6b
    const/16 v8, 0x65

    if-eq v0, v8, :cond_6d

    const/16 v8, 0x45

    if-ne v0, v8, :cond_6c

    goto :goto_17

    :cond_6c
    move v6, v0

    move v11, v13

    goto :goto_18

    .line 670
    :cond_6d
    :goto_17
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 671
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 672
    const/16 v8, 0x2b

    if-eq v0, v8, :cond_6e

    if-ne v0, v6, :cond_6f

    .line 673
    :cond_6e
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 674
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 676
    :cond_6f
    invoke-static {v0}, Lcom/trendmicro/hippo/TokenStream;->isDigit(I)Z

    move-result v6

    if-nez v6, :cond_70

    .line 677
    iget-object v2, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v6, "msg.missing.exponent"

    invoke-virtual {v2, v6}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 678
    return v3

    .line 681
    :cond_70
    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 682
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v0

    .line 683
    invoke-static {v0}, Lcom/trendmicro/hippo/TokenStream;->isDigit(I)Z

    move-result v6

    if-nez v6, :cond_70

    move v6, v0

    move v11, v13

    goto :goto_18

    .line 686
    .end local v13    # "isInteger":Z
    .restart local v11    # "isInteger":Z
    :cond_71
    move v6, v0

    .end local v0    # "c":I
    .local v6, "c":I
    :goto_18
    invoke-direct {v1, v6}, Lcom/trendmicro/hippo/TokenStream;->ungetChar(I)V

    .line 687
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/TokenStream;->getStringFromBuffer()Ljava/lang/String;

    move-result-object v8

    .line 688
    .local v8, "numString":Ljava/lang/String;
    iput-object v8, v1, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 691
    const/16 v0, 0xa

    if-ne v4, v0, :cond_72

    if-nez v11, :cond_72

    .line 694
    :try_start_0
    invoke-static {v8}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 699
    .local v2, "dval":D
    goto :goto_19

    .line 696
    .end local v2    # "dval":D
    :catch_0
    move-exception v0

    move-object v2, v0

    move-object v0, v2

    .line 697
    .local v0, "ex":Ljava/lang/NumberFormatException;
    iget-object v2, v1, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    invoke-virtual {v2, v12}, Lcom/trendmicro/hippo/Parser;->addError(Ljava/lang/String;)V

    .line 698
    return v3

    .line 701
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    :cond_72
    invoke-static {v8, v2, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->stringPrefixToNumber(Ljava/lang/String;II)D

    move-result-wide v2

    .line 704
    .restart local v2    # "dval":D
    :goto_19
    iput-wide v2, v1, Lcom/trendmicro/hippo/TokenStream;->number:D

    .line 705
    const/16 v0, 0x28

    return v0

    .line 473
    .end local v2    # "dval":D
    .end local v4    # "base":I
    .end local v5    # "isEmpty":Z
    .end local v6    # "c":I
    .end local v7    # "isUnicodeEscapeStart":Z
    .end local v8    # "numString":Ljava/lang/String;
    .end local v9    # "es6":Z
    .end local v10    # "identifierStart":Z
    .end local v11    # "isInteger":Z
    .local v0, "c":I
    :cond_73
    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x28
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x3a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x7b
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x74
        :pswitch_14
        :pswitch_13
        :pswitch_12
    .end packed-switch
.end method

.method public getTokenBeg()I
    .locals 1

    .line 1718
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    return v0
.end method

.method public getTokenEnd()I
    .locals 1

    .line 1725
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    return v0
.end method

.method public getTokenLength()I
    .locals 2

    .line 1732
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    iget v1, p0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    sub-int/2addr v0, v1

    return v0
.end method

.method final isNumberBinary()Z
    .locals 1

    .line 448
    iget-boolean v0, p0, Lcom/trendmicro/hippo/TokenStream;->isBinary:Z

    return v0
.end method

.method final isNumberHex()Z
    .locals 1

    .line 451
    iget-boolean v0, p0, Lcom/trendmicro/hippo/TokenStream;->isHex:Z

    return v0
.end method

.method final isNumberOctal()Z
    .locals 1

    .line 450
    iget-boolean v0, p0, Lcom/trendmicro/hippo/TokenStream;->isOctal:Z

    return v0
.end method

.method final isNumberOldOctal()Z
    .locals 1

    .line 449
    iget-boolean v0, p0, Lcom/trendmicro/hippo/TokenStream;->isOldOctal:Z

    return v0
.end method

.method isXMLAttribute()Z
    .locals 1

    .line 1126
    iget-boolean v0, p0, Lcom/trendmicro/hippo/TokenStream;->xmlIsAttribute:Z

    return v0
.end method

.method readAndClearRegExpFlags()Ljava/lang/String;
    .locals 2

    .line 1119
    iget-object v0, p0, Lcom/trendmicro/hippo/TokenStream;->regExpFlags:Ljava/lang/String;

    .line 1120
    .local v0, "flags":Ljava/lang/String;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->regExpFlags:Ljava/lang/String;

    .line 1121
    return-object v0
.end method

.method readRegExp(I)V
    .locals 7
    .param p1, "startToken"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1064
    iget v0, p0, Lcom/trendmicro/hippo/TokenStream;->tokenBeg:I

    .line 1065
    .local v0, "start":I
    const/4 v1, 0x0

    iput v1, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1066
    const/16 v2, 0x65

    if-ne p1, v2, :cond_0

    .line 1068
    const/16 v2, 0x3d

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    goto :goto_0

    .line 1070
    :cond_0
    const/16 v2, 0x18

    if-eq p1, v2, :cond_1

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1073
    :cond_1
    :goto_0
    const/4 v2, 0x0

    .line 1075
    .local v2, "inCharSet":Z
    :goto_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v3

    move v4, v3

    .local v4, "c":I
    const/16 v5, 0x2f

    if-ne v3, v5, :cond_8

    if-eqz v2, :cond_2

    goto :goto_3

    .line 1093
    :cond_2
    iget v3, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    .line 1096
    .local v3, "reEnd":I
    :goto_2
    const/16 v5, 0x67

    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1097
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    goto :goto_2

    .line 1098
    :cond_3
    const/16 v5, 0x69

    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1099
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    goto :goto_2

    .line 1100
    :cond_4
    const/16 v5, 0x6d

    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 1101
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    goto :goto_2

    .line 1102
    :cond_5
    const/16 v5, 0x79

    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/TokenStream;->matchChar(I)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 1103
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    goto :goto_2

    .line 1107
    :cond_6
    iget v5, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    add-int/2addr v5, v0

    add-int/lit8 v5, v5, 0x2

    iput v5, p0, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 1109
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->peekChar()I

    move-result v5

    invoke-static {v5}, Lcom/trendmicro/hippo/TokenStream;->isAlpha(I)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 1110
    iget-object v5, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v6, "msg.invalid.re.flag"

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1113
    :cond_7
    new-instance v5, Ljava/lang/String;

    iget-object v6, p0, Lcom/trendmicro/hippo/TokenStream;->stringBuffer:[C

    invoke-direct {v5, v6, v1, v3}, Ljava/lang/String;-><init>([CII)V

    iput-object v5, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1114
    new-instance v1, Ljava/lang/String;

    iget-object v5, p0, Lcom/trendmicro/hippo/TokenStream;->stringBuffer:[C

    iget v6, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    sub-int/2addr v6, v3

    invoke-direct {v1, v5, v3, v6}, Ljava/lang/String;-><init>([CII)V

    iput-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->regExpFlags:Ljava/lang/String;

    .line 1116
    return-void

    .line 1076
    .end local v3    # "reEnd":I
    :cond_8
    :goto_3
    const/16 v3, 0xa

    if-eq v4, v3, :cond_d

    const/4 v3, -0x1

    if-ne v4, v3, :cond_9

    goto :goto_5

    .line 1083
    :cond_9
    const/16 v3, 0x5c

    if-ne v4, v3, :cond_a

    .line 1084
    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    .line 1085
    invoke-direct {p0}, Lcom/trendmicro/hippo/TokenStream;->getChar()I

    move-result v4

    goto :goto_4

    .line 1086
    :cond_a
    const/16 v3, 0x5b

    if-ne v4, v3, :cond_b

    .line 1087
    const/4 v2, 0x1

    goto :goto_4

    .line 1088
    :cond_b
    const/16 v3, 0x5d

    if-ne v4, v3, :cond_c

    .line 1089
    const/4 v2, 0x0

    .line 1091
    :cond_c
    :goto_4
    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/TokenStream;->addToString(I)V

    goto/16 :goto_1

    .line 1077
    :cond_d
    :goto_5
    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/TokenStream;->ungetChar(I)V

    .line 1078
    iget v3, p0, Lcom/trendmicro/hippo/TokenStream;->cursor:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/trendmicro/hippo/TokenStream;->tokenEnd:I

    .line 1079
    new-instance v3, Ljava/lang/String;

    iget-object v5, p0, Lcom/trendmicro/hippo/TokenStream;->stringBuffer:[C

    iget v6, p0, Lcom/trendmicro/hippo/TokenStream;->stringBufferTop:I

    invoke-direct {v3, v5, v1, v6}, Ljava/lang/String;-><init>([CII)V

    iput-object v3, p0, Lcom/trendmicro/hippo/TokenStream;->string:Ljava/lang/String;

    .line 1080
    iget-object v1, p0, Lcom/trendmicro/hippo/TokenStream;->parser:Lcom/trendmicro/hippo/Parser;

    const-string v3, "msg.unterminated.re.lit"

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/Parser;->reportError(Ljava/lang/String;)V

    .line 1081
    return-void
.end method

.method tokenToString(I)Ljava/lang/String;
    .locals 1
    .param p1, "token"    # I

    .line 75
    const-string v0, ""

    return-object v0
.end method
