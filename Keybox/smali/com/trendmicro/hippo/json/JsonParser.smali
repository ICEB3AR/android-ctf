.class public Lcom/trendmicro/hippo/json/JsonParser;
.super Ljava/lang/Object;
.source "JsonParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/json/JsonParser$ParseException;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private cx:Lcom/trendmicro/hippo/Context;

.field private length:I

.field private pos:I

.field private scope:Lcom/trendmicro/hippo/Scriptable;

.field private src:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 23
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/trendmicro/hippo/json/JsonParser;->cx:Lcom/trendmicro/hippo/Context;

    .line 34
    iput-object p2, p0, Lcom/trendmicro/hippo/json/JsonParser;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 35
    return-void
.end method

.method private consume(C)V
    .locals 4
    .param p1, "token"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/json/JsonParser$ParseException;
        }
    .end annotation

    .line 389
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->consumeWhitespace()V

    .line 390
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    const-string v2, "Expected "

    if-ge v0, v1, :cond_1

    .line 393
    iget-object v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    add-int/lit8 v3, v0, 0x1

    iput v3, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 394
    .local v0, "c":C
    if-ne v0, p1, :cond_0

    .line 395
    return-void

    .line 397
    :cond_0
    new-instance v1, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, " found "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 391
    .end local v0    # "c":C
    :cond_1
    new-instance v0, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, " but reached end of stream"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private consumeWhitespace()V
    .locals 2

    .line 373
    :goto_0
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    if-ge v0, v1, :cond_1

    .line 374
    iget-object v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 375
    .local v0, "c":C
    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_0

    .line 383
    return-void

    .line 380
    :cond_0
    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 381
    nop

    .line 385
    .end local v0    # "c":C
    goto :goto_0

    .line 386
    :cond_1
    return-void
.end method

.method private fromHex(C)I
    .locals 1
    .param p1, "c"    # C

    .line 264
    const/16 v0, 0x30

    if-lt p1, v0, :cond_0

    const/16 v0, 0x39

    if-gt p1, v0, :cond_0

    add-int/lit8 v0, p1, -0x30

    goto :goto_0

    .line 265
    :cond_0
    const/16 v0, 0x41

    if-lt p1, v0, :cond_1

    const/16 v0, 0x46

    if-gt p1, v0, :cond_1

    add-int/lit8 v0, p1, -0x41

    add-int/lit8 v0, v0, 0xa

    goto :goto_0

    .line 266
    :cond_1
    const/16 v0, 0x61

    if-lt p1, v0, :cond_2

    const/16 v0, 0x66

    if-gt p1, v0, :cond_2

    add-int/lit8 v0, p1, -0x61

    add-int/lit8 v0, v0, 0xa

    goto :goto_0

    .line 267
    :cond_2
    const/4 v0, -0x1

    .line 264
    :goto_0
    return v0
.end method

.method private nextOrNumberError(I)C
    .locals 3
    .param p1, "numberStart"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/json/JsonParser$ParseException;
        }
    .end annotation

    .line 323
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    if-ge v0, v1, :cond_0

    .line 326
    iget-object v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0

    .line 324
    :cond_0
    invoke-direct {p0, p1, v1}, Lcom/trendmicro/hippo/json/JsonParser;->numberError(II)Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    move-result-object v0

    throw v0
.end method

.method private numberError(II)Lcom/trendmicro/hippo/json/JsonParser$ParseException;
    .locals 3
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 319
    new-instance v0, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported number format: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    invoke-virtual {v2, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private readArray()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/json/JsonParser$ParseException;
        }
    .end annotation

    .line 139
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->consumeWhitespace()V

    .line 141
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    const/16 v2, 0x5d

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v2, :cond_0

    .line 142
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 143
    iget-object v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->cx:Lcom/trendmicro/hippo/Context;

    iget-object v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->scope:Lcom/trendmicro/hippo/Scriptable;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 145
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .line 147
    .local v1, "needsComma":Z
    :goto_0
    iget v3, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    if-ge v3, v4, :cond_6

    .line 148
    iget-object v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 149
    .local v3, "c":C
    const/16 v4, 0x2c

    const-string v5, "Unexpected comma in array literal"

    if-eq v3, v4, :cond_4

    if-eq v3, v2, :cond_2

    .line 164
    if-nez v1, :cond_1

    .line 167
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readValue()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    const/4 v1, 0x1

    goto :goto_1

    .line 165
    :cond_1
    new-instance v2, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    const-string v4, "Missing comma in array literal"

    invoke-direct {v2, v4}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 151
    :cond_2
    if-eqz v1, :cond_3

    .line 154
    iget v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 155
    iget-object v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->cx:Lcom/trendmicro/hippo/Context;

    iget-object v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    return-object v2

    .line 152
    :cond_3
    new-instance v2, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    invoke-direct {v2, v5}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 157
    :cond_4
    if-eqz v1, :cond_5

    .line 160
    const/4 v1, 0x0

    .line 161
    iget v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 162
    nop

    .line 170
    :goto_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->consumeWhitespace()V

    .line 171
    .end local v3    # "c":C
    goto :goto_0

    .line 158
    .restart local v3    # "c":C
    :cond_5
    new-instance v2, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    invoke-direct {v2, v5}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 172
    .end local v3    # "c":C
    :cond_6
    new-instance v2, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    const-string v3, "Unterminated array literal"

    invoke-direct {v2, v3}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private readDigits()V
    .locals 2

    .line 330
    :goto_0
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    if-ge v0, v1, :cond_1

    .line 331
    iget-object v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 332
    .local v0, "c":C
    const/16 v1, 0x30

    if-lt v0, v1, :cond_1

    const/16 v1, 0x39

    if-le v0, v1, :cond_0

    .line 333
    goto :goto_1

    .line 330
    .end local v0    # "c":C
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    goto :goto_0

    .line 336
    :cond_1
    :goto_1
    return-void
.end method

.method private readFalse()Ljava/lang/Boolean;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/json/JsonParser$ParseException;
        }
    .end annotation

    .line 350
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    sub-int/2addr v0, v1

    const/4 v2, 0x4

    if-lt v0, v2, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    .line 351
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x61

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x1

    .line 352
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x6c

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x2

    .line 353
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x73

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x3

    .line 354
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x65

    if-ne v0, v1, :cond_0

    .line 357
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 358
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 355
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    const-string v1, "Unexpected token: f"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readNull()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/json/JsonParser$ParseException;
        }
    .end annotation

    .line 362
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    sub-int/2addr v0, v1

    const/4 v2, 0x3

    if-lt v0, v2, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    .line 363
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x75

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x1

    .line 364
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x6c

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v3, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v3, v3, 0x2

    .line 365
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v1, :cond_0

    .line 368
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 369
    const/4 v0, 0x0

    return-object v0

    .line 366
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    const-string v1, "Unexpected token: n"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readNumber(C)Ljava/lang/Number;
    .locals 7
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/json/JsonParser$ParseException;
        }
    .end annotation

    .line 271
    nop

    .line 272
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v0, v0, -0x1

    .line 273
    .local v0, "numberStart":I
    const/16 v1, 0x2d

    const/16 v2, 0x39

    const/16 v3, 0x30

    if-ne p1, v1, :cond_1

    .line 274
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/json/JsonParser;->nextOrNumberError(I)C

    move-result p1

    .line 275
    if-lt p1, v3, :cond_0

    if-gt p1, v2, :cond_0

    goto :goto_0

    .line 276
    :cond_0
    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/json/JsonParser;->numberError(II)Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    move-result-object v1

    throw v1

    .line 279
    :cond_1
    :goto_0
    if-eq p1, v3, :cond_2

    .line 280
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readDigits()V

    .line 283
    :cond_2
    iget v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v5, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    if-ge v4, v5, :cond_4

    .line 284
    iget-object v5, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/String;->charAt(I)C

    move-result p1

    .line 285
    const/16 v4, 0x2e

    if-ne p1, v4, :cond_4

    .line 286
    iget v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 287
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/json/JsonParser;->nextOrNumberError(I)C

    move-result p1

    .line 288
    if-lt p1, v3, :cond_3

    if-gt p1, v2, :cond_3

    .line 291
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readDigits()V

    goto :goto_1

    .line 289
    :cond_3
    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/json/JsonParser;->numberError(II)Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    move-result-object v1

    throw v1

    .line 295
    :cond_4
    :goto_1
    iget v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v5, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    if-ge v4, v5, :cond_9

    .line 296
    iget-object v5, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/String;->charAt(I)C

    move-result p1

    .line 297
    const/16 v4, 0x65

    if-eq p1, v4, :cond_5

    const/16 v4, 0x45

    if-ne p1, v4, :cond_9

    .line 298
    :cond_5
    iget v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 299
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/json/JsonParser;->nextOrNumberError(I)C

    move-result p1

    .line 300
    if-eq p1, v1, :cond_6

    const/16 v1, 0x2b

    if-ne p1, v1, :cond_7

    .line 301
    :cond_6
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/json/JsonParser;->nextOrNumberError(I)C

    move-result p1

    .line 303
    :cond_7
    if-lt p1, v3, :cond_8

    if-gt p1, v2, :cond_8

    .line 306
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readDigits()V

    goto :goto_2

    .line 304
    :cond_8
    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/json/JsonParser;->numberError(II)Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    move-result-object v1

    throw v1

    .line 309
    :cond_9
    :goto_2
    iget-object v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 310
    .local v1, "num":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    .line 311
    .local v2, "dval":D
    double-to-int v4, v2

    .line 312
    .local v4, "ival":I
    int-to-double v5, v4

    cmpl-double v5, v5, v2

    if-nez v5, :cond_a

    .line 313
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    return-object v5

    .line 315
    :cond_a
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5
.end method

.method private readObject()Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/json/JsonParser$ParseException;
        }
    .end annotation

    .line 89
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->consumeWhitespace()V

    .line 90
    iget-object v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->cx:Lcom/trendmicro/hippo/Context;

    iget-object v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 92
    .local v0, "object":Lcom/trendmicro/hippo/Scriptable;
    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    const/16 v3, 0x7d

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v3, :cond_0

    .line 93
    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 94
    return-object v0

    .line 98
    :cond_0
    const/4 v1, 0x0

    .line 99
    .local v1, "needsComma":Z
    :goto_0
    iget v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    if-ge v2, v4, :cond_8

    .line 100
    iget-object v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    add-int/lit8 v5, v2, 0x1

    iput v5, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 101
    .local v2, "c":C
    const/16 v4, 0x22

    if-eq v2, v4, :cond_5

    const/16 v4, 0x2c

    const-string v5, "Unexpected comma in object literal"

    if-eq v2, v4, :cond_3

    if-ne v2, v3, :cond_2

    .line 103
    if-eqz v1, :cond_1

    .line 106
    return-object v0

    .line 104
    :cond_1
    new-instance v3, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    invoke-direct {v3, v5}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 131
    :cond_2
    new-instance v3, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    const-string v4, "Unexpected token in object literal"

    invoke-direct {v3, v4}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 108
    :cond_3
    if-eqz v1, :cond_4

    .line 111
    const/4 v1, 0x0

    .line 112
    goto :goto_2

    .line 109
    :cond_4
    new-instance v3, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    invoke-direct {v3, v5}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 114
    :cond_5
    if-nez v1, :cond_7

    .line 117
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readString()Ljava/lang/String;

    move-result-object v4

    .line 118
    .local v4, "id":Ljava/lang/String;
    const/16 v5, 0x3a

    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/json/JsonParser;->consume(C)V

    .line 119
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readValue()Ljava/lang/Object;

    move-result-object v5

    .line 121
    .local v5, "value":Ljava/lang/Object;
    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->indexFromString(Ljava/lang/String;)J

    move-result-wide v6

    .line 122
    .local v6, "index":J
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-gez v8, :cond_6

    .line 123
    invoke-interface {v0, v4, v0, v5}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_1

    .line 125
    :cond_6
    long-to-int v8, v6

    invoke-interface {v0, v8, v0, v5}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 128
    :goto_1
    const/4 v1, 0x1

    .line 129
    nop

    .line 133
    .end local v4    # "id":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/Object;
    .end local v6    # "index":J
    :goto_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->consumeWhitespace()V

    .line 134
    .end local v2    # "c":C
    goto :goto_0

    .line 115
    .restart local v2    # "c":C
    :cond_7
    new-instance v3, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    const-string v4, "Missing comma in object literal"

    invoke-direct {v3, v4}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 135
    .end local v2    # "c":C
    :cond_8
    new-instance v2, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    const-string v3, "Unterminated object literal"

    invoke-direct {v2, v3}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private readString()Ljava/lang/String;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/json/JsonParser$ParseException;
        }
    .end annotation

    .line 180
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 181
    .local v0, "stringStart":I
    :goto_0
    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    const-string v3, "String contains control character"

    const/16 v4, 0x1f

    const/16 v5, 0x22

    const/16 v6, 0x5c

    if-ge v1, v2, :cond_3

    .line 182
    iget-object v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    add-int/lit8 v7, v1, 0x1

    iput v7, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 183
    .local v1, "c":C
    if-le v1, v4, :cond_2

    .line 185
    if-ne v1, v6, :cond_0

    .line 186
    goto :goto_1

    .line 187
    :cond_0
    if-ne v1, v5, :cond_1

    .line 188
    iget-object v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v3, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 190
    .end local v1    # "c":C
    :cond_1
    goto :goto_0

    .line 184
    .restart local v1    # "c":C
    :cond_2
    new-instance v2, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    invoke-direct {v2, v3}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 197
    .end local v1    # "c":C
    :cond_3
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .local v1, "b":Ljava/lang/StringBuilder;
    :goto_2
    iget v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v7, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    if-ge v2, v7, :cond_14

    .line 199
    nop

    .line 200
    iget-object v7, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v7, v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 201
    iget v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v7, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    if-ge v2, v7, :cond_13

    .line 204
    iget-object v7, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    add-int/lit8 v8, v2, 0x1

    iput v8, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-virtual {v7, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 205
    .local v2, "c":C
    if-eq v2, v5, :cond_e

    const/16 v7, 0x2f

    if-eq v2, v7, :cond_d

    if-eq v2, v6, :cond_c

    const/16 v7, 0x62

    const/16 v8, 0x8

    if-eq v2, v7, :cond_b

    const/16 v7, 0x66

    const/16 v9, 0xc

    if-eq v2, v7, :cond_a

    const/16 v7, 0x6e

    if-eq v2, v7, :cond_9

    const/16 v7, 0x72

    if-eq v2, v7, :cond_8

    const/16 v7, 0x74

    if-eq v2, v7, :cond_7

    const/16 v7, 0x75

    if-ne v2, v7, :cond_6

    .line 231
    iget v7, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    iget v10, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    sub-int/2addr v7, v10

    const/4 v11, 0x5

    if-lt v7, v11, :cond_5

    .line 234
    iget-object v7, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    add-int/lit8 v10, v10, 0x0

    invoke-virtual {v7, v10}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/json/JsonParser;->fromHex(C)I

    move-result v7

    shl-int/2addr v7, v9

    iget-object v9, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v10, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v10, v10, 0x1

    .line 235
    invoke-virtual {v9, v10}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-direct {p0, v9}, Lcom/trendmicro/hippo/json/JsonParser;->fromHex(C)I

    move-result v9

    shl-int/lit8 v8, v9, 0x8

    or-int/2addr v7, v8

    iget-object v8, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v9, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v9, v9, 0x2

    .line 236
    invoke-virtual {v8, v9}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-direct {p0, v8}, Lcom/trendmicro/hippo/json/JsonParser;->fromHex(C)I

    move-result v8

    shl-int/lit8 v8, v8, 0x4

    or-int/2addr v7, v8

    iget-object v8, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v9, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v9, v9, 0x3

    .line 237
    invoke-virtual {v8, v9}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-direct {p0, v8}, Lcom/trendmicro/hippo/json/JsonParser;->fromHex(C)I

    move-result v8

    or-int/2addr v7, v8

    .line 238
    .local v7, "code":I
    if-ltz v7, :cond_4

    .line 241
    iget v8, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 242
    int-to-char v8, v7

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 243
    goto/16 :goto_3

    .line 239
    :cond_4
    new-instance v3, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid character code: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v6, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v8, v6, 0x4

    invoke-virtual {v5, v6, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 232
    .end local v7    # "code":I
    :cond_5
    new-instance v3, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid character code: \\u"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v6, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 245
    :cond_6
    new-instance v3, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected character in string: \'\\"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 228
    :cond_7
    const/16 v7, 0x9

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 229
    goto :goto_3

    .line 225
    :cond_8
    const/16 v7, 0xd

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 226
    goto :goto_3

    .line 222
    :cond_9
    const/16 v7, 0xa

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 223
    goto :goto_3

    .line 219
    :cond_a
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 220
    goto :goto_3

    .line 216
    :cond_b
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 217
    goto :goto_3

    .line 210
    :cond_c
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 211
    goto :goto_3

    .line 213
    :cond_d
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 214
    goto :goto_3

    .line 207
    :cond_e
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 208
    nop

    .line 247
    :goto_3
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 248
    :cond_f
    iget v7, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v8, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    if-ge v7, v8, :cond_12

    .line 249
    iget-object v8, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    add-int/lit8 v9, v7, 0x1

    iput v9, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-virtual {v8, v7}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 250
    if-le v2, v4, :cond_11

    .line 252
    if-ne v2, v6, :cond_10

    .line 253
    goto :goto_4

    .line 254
    :cond_10
    if-ne v2, v5, :cond_f

    .line 255
    iget-object v3, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v4, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v3, v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 256
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 251
    :cond_11
    new-instance v4, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    invoke-direct {v4, v3}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 259
    .end local v2    # "c":C
    :cond_12
    :goto_4
    goto/16 :goto_2

    .line 202
    :cond_13
    new-instance v2, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    const-string v3, "Unterminated string"

    invoke-direct {v2, v3}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 260
    :cond_14
    new-instance v2, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    const-string v3, "Unterminated string literal"

    invoke-direct {v2, v3}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private readTrue()Ljava/lang/Boolean;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/json/JsonParser$ParseException;
        }
    .end annotation

    .line 339
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    sub-int/2addr v0, v1

    const/4 v2, 0x3

    if-lt v0, v2, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    .line 340
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x72

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x1

    .line 341
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x75

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/lit8 v1, v1, 0x2

    .line 342
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x65

    if-ne v0, v1, :cond_0

    .line 345
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 346
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 343
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    const-string v1, "Unexpected token: t"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readValue()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/json/JsonParser$ParseException;
        }
    .end annotation

    .line 53
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->consumeWhitespace()V

    .line 54
    iget v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    if-ge v0, v1, :cond_7

    .line 55
    iget-object v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 56
    .local v0, "c":C
    const/16 v1, 0x22

    if-eq v0, v1, :cond_6

    const/16 v1, 0x2d

    if-eq v0, v1, :cond_5

    const/16 v1, 0x5b

    if-eq v0, v1, :cond_4

    const/16 v1, 0x66

    if-eq v0, v1, :cond_3

    const/16 v1, 0x6e

    if-eq v0, v1, :cond_2

    const/16 v1, 0x74

    if-eq v0, v1, :cond_1

    const/16 v1, 0x7b

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    .line 82
    new-instance v1, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected token: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 58
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readObject()Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 62
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readTrue()Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 68
    :cond_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readNull()Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 64
    :cond_3
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readFalse()Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 60
    :cond_4
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readArray()Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 80
    :cond_5
    :pswitch_0
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/json/JsonParser;->readNumber(C)Ljava/lang/Number;

    move-result-object v1

    return-object v1

    .line 66
    :cond_6
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 85
    .end local v0    # "c":C
    :cond_7
    new-instance v0, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    const-string v1, "Empty JSON string"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x30
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public declared-synchronized parseValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p1, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/json/JsonParser$ParseException;
        }
    .end annotation

    monitor-enter p0

    .line 38
    if-eqz p1, :cond_1

    .line 41
    const/4 v0, 0x0

    :try_start_0
    iput v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    .line 42
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I

    .line 43
    iput-object p1, p0, Lcom/trendmicro/hippo/json/JsonParser;->src:Ljava/lang/String;

    .line 44
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->readValue()Ljava/lang/Object;

    move-result-object v0

    .line 45
    .local v0, "value":Ljava/lang/Object;
    invoke-direct {p0}, Lcom/trendmicro/hippo/json/JsonParser;->consumeWhitespace()V

    .line 46
    iget v1, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    iget v2, p0, Lcom/trendmicro/hippo/json/JsonParser;->length:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lt v1, v2, :cond_0

    .line 49
    monitor-exit p0

    return-object v0

    .line 47
    :cond_0
    :try_start_1
    new-instance v1, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected end of stream at char "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/trendmicro/hippo/json/JsonParser;->pos:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 37
    .end local v0    # "value":Ljava/lang/Object;
    .end local p0    # "this":Lcom/trendmicro/hippo/json/JsonParser;
    .end local p1    # "json":Ljava/lang/String;
    :catchall_0
    move-exception p1

    goto :goto_0

    .line 39
    .restart local p1    # "json":Ljava/lang/String;
    :cond_1
    new-instance v0, Lcom/trendmicro/hippo/json/JsonParser$ParseException;

    const-string v1, "Input string may not be null"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    .end local p1    # "json":Ljava/lang/String;
    :goto_0
    monitor-exit p0

    throw p1
.end method
