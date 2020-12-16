.class final Lcom/trendmicro/hippo/NativeDate;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeDate.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final ConstructorId_UTC:I = -0x1

.field private static final ConstructorId_now:I = -0x3

.field private static final ConstructorId_parse:I = -0x2

.field private static final DATE_TAG:Ljava/lang/Object;

.field private static final HalfTimeDomain:D = 8.64E15

.field private static final HoursPerDay:D = 24.0

.field private static final Id_constructor:I = 0x1

.field private static final Id_getDate:I = 0x11

.field private static final Id_getDay:I = 0x13

.field private static final Id_getFullYear:I = 0xd

.field private static final Id_getHours:I = 0x15

.field private static final Id_getMilliseconds:I = 0x1b

.field private static final Id_getMinutes:I = 0x17

.field private static final Id_getMonth:I = 0xf

.field private static final Id_getSeconds:I = 0x19

.field private static final Id_getTime:I = 0xb

.field private static final Id_getTimezoneOffset:I = 0x1d

.field private static final Id_getUTCDate:I = 0x12

.field private static final Id_getUTCDay:I = 0x14

.field private static final Id_getUTCFullYear:I = 0xe

.field private static final Id_getUTCHours:I = 0x16

.field private static final Id_getUTCMilliseconds:I = 0x1c

.field private static final Id_getUTCMinutes:I = 0x18

.field private static final Id_getUTCMonth:I = 0x10

.field private static final Id_getUTCSeconds:I = 0x1a

.field private static final Id_getYear:I = 0xc

.field private static final Id_setDate:I = 0x27

.field private static final Id_setFullYear:I = 0x2b

.field private static final Id_setHours:I = 0x25

.field private static final Id_setMilliseconds:I = 0x1f

.field private static final Id_setMinutes:I = 0x23

.field private static final Id_setMonth:I = 0x29

.field private static final Id_setSeconds:I = 0x21

.field private static final Id_setTime:I = 0x1e

.field private static final Id_setUTCDate:I = 0x28

.field private static final Id_setUTCFullYear:I = 0x2c

.field private static final Id_setUTCHours:I = 0x26

.field private static final Id_setUTCMilliseconds:I = 0x20

.field private static final Id_setUTCMinutes:I = 0x24

.field private static final Id_setUTCMonth:I = 0x2a

.field private static final Id_setUTCSeconds:I = 0x22

.field private static final Id_setYear:I = 0x2d

.field private static final Id_toDateString:I = 0x4

.field private static final Id_toGMTString:I = 0x8

.field private static final Id_toISOString:I = 0x2e

.field private static final Id_toJSON:I = 0x2f

.field private static final Id_toLocaleDateString:I = 0x7

.field private static final Id_toLocaleString:I = 0x5

.field private static final Id_toLocaleTimeString:I = 0x6

.field private static final Id_toSource:I = 0x9

.field private static final Id_toString:I = 0x2

.field private static final Id_toTimeString:I = 0x3

.field private static final Id_toUTCString:I = 0x8

.field private static final Id_valueOf:I = 0xa

.field private static LocalTZA:D = 0.0

.field private static final MAXARGS:I = 0x7

.field private static final MAX_PROTOTYPE_ID:I = 0x2f

.field private static final MinutesPerDay:D = 1440.0

.field private static final MinutesPerHour:D = 60.0

.field private static final SecondsPerDay:D = 86400.0

.field private static final SecondsPerHour:D = 3600.0

.field private static final SecondsPerMinute:D = 60.0

.field private static final js_NaN_date_str:Ljava/lang/String; = "Invalid Date"

.field private static localeDateFormatter:Ljava/text/DateFormat; = null

.field private static localeDateTimeFormatter:Ljava/text/DateFormat; = null

.field private static localeTimeFormatter:Ljava/text/DateFormat; = null

.field private static final msPerDay:D = 8.64E7

.field private static final msPerHour:D = 3600000.0

.field private static final msPerMinute:D = 60000.0

.field private static final msPerSecond:D = 1000.0

.field private static final serialVersionUID:J = -0x7349f3ade5310b76L

.field private static thisTimeZone:Ljava/util/TimeZone;

.field private static timeZoneFormatter:Ljava/text/DateFormat;


# instance fields
.field private date:D


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 22
    nop

    .line 26
    const-string v0, "Date"

    sput-object v0, Lcom/trendmicro/hippo/NativeDate;->DATE_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 39
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 40
    sget-object v0, Lcom/trendmicro/hippo/NativeDate;->thisTimeZone:Ljava/util/TimeZone;

    if-nez v0, :cond_0

    .line 43
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/NativeDate;->thisTimeZone:Ljava/util/TimeZone;

    .line 44
    invoke-virtual {v0}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v0

    int-to-double v0, v0

    sput-wide v0, Lcom/trendmicro/hippo/NativeDate;->LocalTZA:D

    .line 46
    :cond_0
    return-void
.end method

.method private static DateFromTime(D)I
    .locals 5
    .param p0, "t"    # D

    .line 525
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->YearFromTime(D)I

    move-result v0

    .line 526
    .local v0, "year":I
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->Day(D)D

    move-result-wide v1

    int-to-double v3, v0

    invoke-static {v3, v4}, Lcom/trendmicro/hippo/NativeDate;->DayFromYear(D)D

    move-result-wide v3

    sub-double/2addr v1, v3

    double-to-int v1, v1

    .line 528
    .local v1, "d":I
    add-int/lit8 v1, v1, -0x3b

    .line 529
    if-gez v1, :cond_1

    .line 530
    const/16 v2, -0x1c

    if-ge v1, v2, :cond_0

    add-int/lit8 v2, v1, 0x1f

    add-int/lit8 v2, v2, 0x1c

    goto :goto_0

    :cond_0
    add-int/lit8 v2, v1, 0x1c

    :goto_0
    add-int/lit8 v2, v2, 0x1

    return v2

    .line 533
    :cond_1
    invoke-static {v0}, Lcom/trendmicro/hippo/NativeDate;->IsLeapYear(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 534
    if-nez v1, :cond_2

    .line 535
    const/16 v2, 0x1d

    return v2

    .line 536
    :cond_2
    add-int/lit8 v1, v1, -0x1

    .line 541
    :cond_3
    div-int/lit8 v2, v1, 0x1e

    int-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 554
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 553
    :pswitch_0
    add-int/lit16 v2, v1, -0x113

    add-int/lit8 v2, v2, 0x1

    return v2

    .line 551
    :pswitch_1
    const/16 v2, 0x1e

    .local v2, "mdays":I
    const/16 v3, 0x113

    .local v3, "mstart":I
    goto :goto_1

    .line 550
    .end local v2    # "mdays":I
    .end local v3    # "mstart":I
    :pswitch_2
    const/16 v2, 0x1f

    .restart local v2    # "mdays":I
    const/16 v3, 0xf5

    .restart local v3    # "mstart":I
    goto :goto_1

    .line 549
    .end local v2    # "mdays":I
    .end local v3    # "mstart":I
    :pswitch_3
    const/16 v2, 0x1e

    .restart local v2    # "mdays":I
    const/16 v3, 0xd6

    .restart local v3    # "mstart":I
    goto :goto_1

    .line 548
    .end local v2    # "mdays":I
    .end local v3    # "mstart":I
    :pswitch_4
    const/16 v2, 0x1f

    .restart local v2    # "mdays":I
    const/16 v3, 0xb8

    .restart local v3    # "mstart":I
    goto :goto_1

    .line 547
    .end local v2    # "mdays":I
    .end local v3    # "mstart":I
    :pswitch_5
    const/16 v2, 0x1f

    .restart local v2    # "mdays":I
    const/16 v3, 0x99

    .restart local v3    # "mstart":I
    goto :goto_1

    .line 546
    .end local v2    # "mdays":I
    .end local v3    # "mstart":I
    :pswitch_6
    const/16 v2, 0x1e

    .restart local v2    # "mdays":I
    const/16 v3, 0x7a

    .restart local v3    # "mstart":I
    goto :goto_1

    .line 545
    .end local v2    # "mdays":I
    .end local v3    # "mstart":I
    :pswitch_7
    const/16 v2, 0x1f

    .restart local v2    # "mdays":I
    const/16 v3, 0x5c

    .restart local v3    # "mstart":I
    goto :goto_1

    .line 544
    .end local v2    # "mdays":I
    .end local v3    # "mstart":I
    :pswitch_8
    const/16 v2, 0x1e

    .restart local v2    # "mdays":I
    const/16 v3, 0x3d

    .restart local v3    # "mstart":I
    goto :goto_1

    .line 543
    .end local v2    # "mdays":I
    .end local v3    # "mstart":I
    :pswitch_9
    const/16 v2, 0x1f

    .restart local v2    # "mdays":I
    const/16 v3, 0x1f

    .line 556
    .restart local v3    # "mstart":I
    :goto_1
    sub-int/2addr v1, v3

    .line 557
    if-gez v1, :cond_4

    .line 559
    add-int/2addr v1, v2

    .line 561
    :cond_4
    add-int/lit8 v4, v1, 0x1

    return v4

    .line 542
    .end local v2    # "mdays":I
    .end local v3    # "mstart":I
    :pswitch_a
    add-int/lit8 v2, v1, 0x1

    return v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static Day(D)D
    .locals 2
    .param p0, "t"    # D

    .line 401
    const-wide v0, 0x4194997000000000L    # 8.64E7

    div-double v0, p0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    return-wide v0
.end method

.method private static DayFromMonth(II)D
    .locals 3
    .param p0, "m"    # I
    .param p1, "year"    # I

    .line 457
    mul-int/lit8 v0, p0, 0x1e

    .line 459
    .local v0, "day":I
    const/4 v1, 0x2

    const/4 v2, 0x7

    if-lt p0, v2, :cond_0

    div-int/lit8 v2, p0, 0x2

    add-int/lit8 v2, v2, -0x1

    add-int/2addr v0, v2

    goto :goto_0

    .line 460
    :cond_0
    if-lt p0, v1, :cond_1

    add-int/lit8 v2, p0, -0x1

    div-int/2addr v2, v1

    add-int/lit8 v2, v2, -0x1

    add-int/2addr v0, v2

    goto :goto_0

    .line 461
    :cond_1
    add-int/2addr v0, p0

    .line 463
    :goto_0
    if-lt p0, v1, :cond_2

    invoke-static {p1}, Lcom/trendmicro/hippo/NativeDate;->IsLeapYear(I)Z

    move-result v1

    if-eqz v1, :cond_2

    add-int/lit8 v0, v0, 0x1

    .line 465
    :cond_2
    int-to-double v1, v0

    return-wide v1
.end method

.method private static DayFromYear(D)D
    .locals 6
    .param p0, "y"    # D

    .line 423
    const-wide v0, 0x409ec80000000000L    # 1970.0

    sub-double v0, p0, v0

    const-wide v2, 0x4076d00000000000L    # 365.0

    mul-double/2addr v0, v2

    const-wide v2, 0x409ec40000000000L    # 1969.0

    sub-double v2, p0, v2

    const-wide/high16 v4, 0x4010000000000000L    # 4.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    add-double/2addr v0, v2

    const-wide v2, 0x409db40000000000L    # 1901.0

    sub-double v2, p0, v2

    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    div-double/2addr v2, v4

    .line 424
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    sub-double/2addr v0, v2

    const-wide v2, 0x4099040000000000L    # 1601.0

    sub-double v2, p0, v2

    const-wide/high16 v4, 0x4079000000000000L    # 400.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    add-double/2addr v0, v2

    .line 423
    return-wide v0
.end method

.method private static DaylightSavingTA(D)D
    .locals 9
    .param p0, "t"    # D

    .line 585
    const-wide/16 v0, 0x0

    cmpg-double v2, p0, v0

    if-gez v2, :cond_0

    .line 586
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->YearFromTime(D)I

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/hippo/NativeDate;->EquivalentYear(I)I

    move-result v2

    .line 587
    .local v2, "year":I
    int-to-double v3, v2

    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->MonthFromTime(D)I

    move-result v5

    int-to-double v5, v5

    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->DateFromTime(D)I

    move-result v7

    int-to-double v7, v7

    invoke-static/range {v3 .. v8}, Lcom/trendmicro/hippo/NativeDate;->MakeDay(DDD)D

    move-result-wide v3

    .line 588
    .local v3, "day":D
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->TimeWithinDay(D)D

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Lcom/trendmicro/hippo/NativeDate;->MakeDate(DD)D

    move-result-wide p0

    .line 590
    .end local v2    # "year":I
    .end local v3    # "day":D
    :cond_0
    new-instance v2, Ljava/util/Date;

    double-to-long v3, p0

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 591
    .local v2, "date":Ljava/util/Date;
    sget-object v3, Lcom/trendmicro/hippo/NativeDate;->thisTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v3, v2}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 592
    const-wide v0, 0x414b774000000000L    # 3600000.0

    return-wide v0

    .line 593
    :cond_1
    return-wide v0
.end method

.method private static DaysInMonth(II)I
    .locals 1
    .param p0, "year"    # I
    .param p1, "month"    # I

    .line 479
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    .line 480
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeDate;->IsLeapYear(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x1d

    goto :goto_0

    :cond_0
    const/16 v0, 0x1c

    :goto_0
    return v0

    .line 481
    :cond_1
    const/16 v0, 0x8

    if-lt p1, v0, :cond_2

    .line 482
    and-int/lit8 v0, p1, 0x1

    rsub-int/lit8 v0, v0, 0x1f

    goto :goto_1

    .line 483
    :cond_2
    and-int/lit8 v0, p1, 0x1

    add-int/lit8 v0, v0, 0x1e

    .line 481
    :goto_1
    return v0
.end method

.method private static DaysInYear(D)D
    .locals 2
    .param p0, "year"    # D

    .line 470
    invoke-static {p0, p1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 473
    :cond_0
    double-to-int v0, p0

    invoke-static {v0}, Lcom/trendmicro/hippo/NativeDate;->IsLeapYear(I)Z

    move-result v0

    if-eqz v0, :cond_1

    const-wide v0, 0x4076e00000000000L    # 366.0

    goto :goto_0

    :cond_1
    const-wide v0, 0x4076d00000000000L    # 365.0

    :goto_0
    return-wide v0

    .line 471
    :cond_2
    :goto_1
    sget-wide v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v0
.end method

.method private static EquivalentYear(I)I
    .locals 2
    .param p0, "year"    # I

    .line 605
    int-to-double v0, p0

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/NativeDate;->DayFromYear(D)D

    move-result-wide v0

    double-to-int v0, v0

    add-int/lit8 v0, v0, 0x4

    .line 606
    .local v0, "day":I
    rem-int/lit8 v0, v0, 0x7

    .line 607
    if-gez v0, :cond_0

    .line 608
    add-int/lit8 v0, v0, 0x7

    .line 610
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeDate;->IsLeapYear(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 611
    packed-switch v0, :pswitch_data_0

    .line 618
    goto :goto_0

    :pswitch_0
    const/16 v1, 0x7b4

    return v1

    .line 617
    :pswitch_1
    const/16 v1, 0x7c4

    return v1

    .line 616
    :pswitch_2
    const/16 v1, 0x7b8

    return v1

    .line 615
    :pswitch_3
    const/16 v1, 0x7c8

    return v1

    .line 614
    :pswitch_4
    const/16 v1, 0x7bc

    return v1

    .line 613
    :pswitch_5
    const/16 v1, 0x7cc

    return v1

    .line 612
    :pswitch_6
    const/16 v1, 0x7c0

    return v1

    .line 621
    :cond_1
    packed-switch v0, :pswitch_data_1

    goto :goto_0

    .line 628
    :pswitch_7
    const/16 v1, 0x7b9

    return v1

    .line 627
    :pswitch_8
    const/16 v1, 0x7b3

    return v1

    .line 626
    :pswitch_9
    const/16 v1, 0x7bd

    return v1

    .line 625
    :pswitch_a
    const/16 v1, 0x7c2

    return v1

    .line 624
    :pswitch_b
    const/16 v1, 0x7c1

    return v1

    .line 623
    :pswitch_c
    const/16 v1, 0x7b5

    return v1

    .line 622
    :pswitch_d
    const/16 v1, 0x7ba

    return v1

    .line 632
    :goto_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch
.end method

.method private static HourFromTime(D)I
    .locals 6
    .param p0, "t"    # D

    .line 648
    const-wide v0, 0x414b774000000000L    # 3600000.0

    div-double v0, p0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4038000000000000L    # 24.0

    rem-double/2addr v0, v2

    .line 649
    .local v0, "result":D
    const-wide/16 v4, 0x0

    cmpg-double v4, v0, v4

    if-gez v4, :cond_0

    .line 650
    add-double/2addr v0, v2

    .line 651
    :cond_0
    double-to-int v2, v0

    return v2
.end method

.method private static IsLeapYear(I)Z
    .locals 1
    .param p0, "year"    # I

    .line 415
    rem-int/lit8 v0, p0, 0x4

    if-nez v0, :cond_1

    rem-int/lit8 v0, p0, 0x64

    if-nez v0, :cond_0

    rem-int/lit16 v0, p0, 0x190

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static LocalTime(D)D
    .locals 4
    .param p0, "t"    # D

    .line 637
    sget-wide v0, Lcom/trendmicro/hippo/NativeDate;->LocalTZA:D

    add-double/2addr v0, p0

    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->DaylightSavingTA(D)D

    move-result-wide v2

    add-double/2addr v0, v2

    return-wide v0
.end method

.method private static MakeDate(DD)D
    .locals 2
    .param p0, "day"    # D
    .param p2, "time"    # D

    .line 704
    const-wide v0, 0x4194997000000000L    # 8.64E7

    mul-double/2addr v0, p0

    add-double/2addr v0, p2

    return-wide v0
.end method

.method private static MakeDay(DDD)D
    .locals 8
    .param p0, "year"    # D
    .param p2, "month"    # D
    .param p4, "date"    # D

    .line 690
    const-wide/high16 v0, 0x4028000000000000L    # 12.0

    div-double v2, p2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    add-double/2addr p0, v2

    .line 692
    rem-double/2addr p2, v0

    .line 693
    const-wide/16 v2, 0x0

    cmpg-double v2, p2, v2

    if-gez v2, :cond_0

    .line 694
    add-double/2addr p2, v0

    .line 696
    :cond_0
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->TimeFromYear(D)D

    move-result-wide v0

    const-wide v2, 0x4194997000000000L    # 8.64E7

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    .line 697
    .local v0, "yearday":D
    double-to-int v2, p2

    double-to-int v3, p0

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/NativeDate;->DayFromMonth(II)D

    move-result-wide v2

    .line 699
    .local v2, "monthday":D
    add-double v4, v0, v2

    add-double/2addr v4, p4

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v4, v6

    return-wide v4
.end method

.method private static MakeTime(DDDD)D
    .locals 4
    .param p0, "hour"    # D
    .param p2, "min"    # D
    .param p4, "sec"    # D
    .param p6, "ms"    # D

    .line 684
    const-wide/high16 v0, 0x404e000000000000L    # 60.0

    mul-double v2, p0, v0

    add-double/2addr v2, p2

    mul-double/2addr v2, v0

    add-double/2addr v2, p4

    const-wide v0, 0x408f400000000000L    # 1000.0

    mul-double/2addr v2, v0

    add-double/2addr v2, p6

    return-wide v2
.end method

.method private static MinFromTime(D)I
    .locals 6
    .param p0, "t"    # D

    .line 657
    const-wide v0, 0x40ed4c0000000000L    # 60000.0

    div-double v0, p0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x404e000000000000L    # 60.0

    rem-double/2addr v0, v2

    .line 658
    .local v0, "result":D
    const-wide/16 v4, 0x0

    cmpg-double v4, v0, v4

    if-gez v4, :cond_0

    .line 659
    add-double/2addr v0, v2

    .line 660
    :cond_0
    double-to-int v2, v0

    return v2
.end method

.method private static MonthFromTime(D)I
    .locals 5
    .param p0, "t"    # D

    .line 488
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->YearFromTime(D)I

    move-result v0

    .line 489
    .local v0, "year":I
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->Day(D)D

    move-result-wide v1

    int-to-double v3, v0

    invoke-static {v3, v4}, Lcom/trendmicro/hippo/NativeDate;->DayFromYear(D)D

    move-result-wide v3

    sub-double/2addr v1, v3

    double-to-int v1, v1

    .line 491
    .local v1, "d":I
    add-int/lit8 v1, v1, -0x3b

    .line 492
    const/4 v2, 0x1

    if-gez v1, :cond_1

    .line 493
    const/16 v3, -0x1c

    if-ge v1, v3, :cond_0

    const/4 v2, 0x0

    :cond_0
    return v2

    .line 496
    :cond_1
    invoke-static {v0}, Lcom/trendmicro/hippo/NativeDate;->IsLeapYear(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 497
    if-nez v1, :cond_2

    .line 498
    return v2

    .line 499
    :cond_2
    add-int/lit8 v1, v1, -0x1

    .line 503
    :cond_3
    div-int/lit8 v2, v1, 0x1e

    .line 505
    .local v2, "estimate":I
    packed-switch v2, :pswitch_data_0

    .line 517
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 516
    :pswitch_0
    const/16 v3, 0xb

    return v3

    .line 515
    :pswitch_1
    const/16 v3, 0x113

    .local v3, "mstart":I
    goto :goto_0

    .line 514
    .end local v3    # "mstart":I
    :pswitch_2
    const/16 v3, 0xf5

    .restart local v3    # "mstart":I
    goto :goto_0

    .line 513
    .end local v3    # "mstart":I
    :pswitch_3
    const/16 v3, 0xd6

    .restart local v3    # "mstart":I
    goto :goto_0

    .line 512
    .end local v3    # "mstart":I
    :pswitch_4
    const/16 v3, 0xb8

    .restart local v3    # "mstart":I
    goto :goto_0

    .line 511
    .end local v3    # "mstart":I
    :pswitch_5
    const/16 v3, 0x99

    .restart local v3    # "mstart":I
    goto :goto_0

    .line 510
    .end local v3    # "mstart":I
    :pswitch_6
    const/16 v3, 0x7a

    .restart local v3    # "mstart":I
    goto :goto_0

    .line 509
    .end local v3    # "mstart":I
    :pswitch_7
    const/16 v3, 0x5c

    .restart local v3    # "mstart":I
    goto :goto_0

    .line 508
    .end local v3    # "mstart":I
    :pswitch_8
    const/16 v3, 0x3d

    .restart local v3    # "mstart":I
    goto :goto_0

    .line 507
    .end local v3    # "mstart":I
    :pswitch_9
    const/16 v3, 0x1f

    .line 520
    .restart local v3    # "mstart":I
    :goto_0
    if-lt v1, v3, :cond_4

    add-int/lit8 v4, v2, 0x2

    goto :goto_1

    :cond_4
    add-int/lit8 v4, v2, 0x1

    :goto_1
    return v4

    .line 506
    .end local v3    # "mstart":I
    :pswitch_a
    const/4 v3, 0x2

    return v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static SecFromTime(D)I
    .locals 6
    .param p0, "t"    # D

    .line 666
    const-wide v0, 0x408f400000000000L    # 1000.0

    div-double v0, p0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x404e000000000000L    # 60.0

    rem-double/2addr v0, v2

    .line 667
    .local v0, "result":D
    const-wide/16 v4, 0x0

    cmpg-double v4, v0, v4

    if-gez v4, :cond_0

    .line 668
    add-double/2addr v0, v2

    .line 669
    :cond_0
    double-to-int v2, v0

    return v2
.end method

.method private static TimeClip(D)D
    .locals 4
    .param p0, "d"    # D

    .line 709
    cmpl-double v0, p0, p0

    if-nez v0, :cond_2

    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v0, p0, v0

    if-eqz v0, :cond_2

    const-wide/high16 v0, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v0, p0, v0

    if-eqz v0, :cond_2

    .line 712
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const-wide v2, 0x433eb208c2dc0000L    # 8.64E15

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    goto :goto_0

    .line 716
    :cond_0
    const-wide/16 v0, 0x0

    cmpl-double v2, p0, v0

    if-lez v2, :cond_1

    .line 717
    add-double/2addr v0, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    return-wide v0

    .line 718
    :cond_1
    add-double/2addr v0, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    return-wide v0

    .line 714
    :cond_2
    :goto_0
    sget-wide v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v0
.end method

.method private static TimeFromYear(D)D
    .locals 4
    .param p0, "y"    # D

    .line 429
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->DayFromYear(D)D

    move-result-wide v0

    const-wide v2, 0x4194997000000000L    # 8.64E7

    mul-double/2addr v0, v2

    return-wide v0
.end method

.method private static TimeWithinDay(D)D
    .locals 6
    .param p0, "t"    # D

    .line 407
    const-wide v0, 0x4194997000000000L    # 8.64E7

    rem-double v2, p0, v0

    .line 408
    .local v2, "result":D
    const-wide/16 v4, 0x0

    cmpg-double v4, v2, v4

    if-gez v4, :cond_0

    .line 409
    add-double/2addr v2, v0

    .line 410
    :cond_0
    return-wide v2
.end method

.method private static WeekDay(D)I
    .locals 6
    .param p0, "t"    # D

    .line 567
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->Day(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4010000000000000L    # 4.0

    add-double/2addr v0, v2

    .line 568
    .local v0, "result":D
    const-wide/high16 v2, 0x401c000000000000L    # 7.0

    rem-double/2addr v0, v2

    .line 569
    const-wide/16 v4, 0x0

    cmpg-double v4, v0, v4

    if-gez v4, :cond_0

    .line 570
    add-double/2addr v0, v2

    .line 571
    :cond_0
    double-to-int v2, v0

    return v2
.end method

.method private static YearFromTime(D)I
    .locals 11
    .param p0, "t"    # D

    .line 434
    invoke-static {p0, p1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 438
    :cond_0
    const-wide v0, 0x421d63c37f000000L    # 3.1556952E10

    div-double v0, p0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    const-wide v2, 0x409ec80000000000L    # 1970.0

    add-double/2addr v0, v2

    .line 439
    .local v0, "y":D
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/NativeDate;->TimeFromYear(D)D

    move-result-wide v2

    .line 446
    .local v2, "t2":D
    cmpl-double v4, v2, p0

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    if-lez v4, :cond_1

    .line 447
    sub-double/2addr v0, v5

    goto :goto_0

    .line 449
    :cond_1
    const-wide v7, 0x4194997000000000L    # 8.64E7

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/NativeDate;->DaysInYear(D)D

    move-result-wide v9

    mul-double/2addr v9, v7

    add-double/2addr v9, v2

    cmpg-double v4, v9, p0

    if-gtz v4, :cond_2

    .line 450
    add-double/2addr v0, v5

    .line 452
    :cond_2
    :goto_0
    double-to-int v4, v0

    return v4

    .line 435
    .end local v0    # "y":D
    .end local v2    # "t2":D
    :cond_3
    :goto_1
    const/4 v0, 0x0

    return v0
.end method

.method private static append0PaddedUint(Ljava/lang/StringBuilder;II)V
    .locals 3
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "i"    # I
    .param p2, "minWidth"    # I

    .line 1344
    if-gez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1345
    :cond_0
    const/4 v0, 0x1

    .line 1346
    .local v0, "scale":I
    add-int/lit8 p2, p2, -0x1

    .line 1347
    const/16 v1, 0xa

    if-lt p1, v1, :cond_3

    .line 1348
    const v1, 0x3b9aca00

    if-ge p1, v1, :cond_2

    .line 1350
    :goto_0
    mul-int/lit8 v1, v0, 0xa

    .line 1351
    .local v1, "newScale":I
    if-ge p1, v1, :cond_1

    goto :goto_1

    .line 1352
    :cond_1
    add-int/lit8 p2, p2, -0x1

    .line 1353
    move v0, v1

    .line 1354
    .end local v1    # "newScale":I
    goto :goto_0

    .line 1357
    :cond_2
    add-int/lit8 p2, p2, -0x9

    .line 1358
    const v0, 0x3b9aca00

    .line 1361
    :cond_3
    :goto_1
    const/16 v1, 0x30

    if-lez p2, :cond_4

    .line 1362
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1363
    add-int/lit8 p2, p2, -0x1

    goto :goto_1

    .line 1365
    :cond_4
    :goto_2
    const/4 v2, 0x1

    if-eq v0, v2, :cond_5

    .line 1366
    div-int v2, p1, v0

    add-int/2addr v2, v1

    int-to-char v2, v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1367
    rem-int/2addr p1, v0

    .line 1368
    div-int/lit8 v0, v0, 0xa

    goto :goto_2

    .line 1370
    :cond_5
    add-int/lit8 v1, p1, 0x30

    int-to-char v1, v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1371
    return-void
.end method

.method private static appendMonthName(Ljava/lang/StringBuilder;I)V
    .locals 4
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "index"    # I

    .line 1378
    const-string v0, "JanFebMarAprMayJunJulAugSepOctNovDec"

    .line 1380
    .local v0, "months":Ljava/lang/String;
    const/4 v1, 0x3

    mul-int/2addr p1, v1

    .line 1381
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, v1, :cond_0

    .line 1382
    add-int v3, p1, v2

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1381
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1384
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method private static appendWeekDayName(Ljava/lang/StringBuilder;I)V
    .locals 4
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "index"    # I

    .line 1388
    const-string v0, "SunMonTueWedThuFriSat"

    .line 1389
    .local v0, "days":Ljava/lang/String;
    const/4 v1, 0x3

    mul-int/2addr p1, v1

    .line 1390
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, v1, :cond_0

    .line 1391
    add-int v3, p1, v2

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1390
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1393
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method private static date_format(DI)Ljava/lang/String;
    .locals 12
    .param p0, "t"    # D
    .param p2, "methodId"    # I

    .line 1146
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x3c

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1147
    .local v0, "result":Ljava/lang/StringBuilder;
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v1

    .line 1153
    .local v1, "local":D
    const/4 v3, 0x2

    const/4 v4, 0x4

    const/4 v5, 0x3

    if-eq p2, v5, :cond_1

    .line 1154
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/NativeDate;->WeekDay(D)I

    move-result v5

    invoke-static {v0, v5}, Lcom/trendmicro/hippo/NativeDate;->appendWeekDayName(Ljava/lang/StringBuilder;I)V

    .line 1155
    const/16 v5, 0x20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1156
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/NativeDate;->MonthFromTime(D)I

    move-result v6

    invoke-static {v0, v6}, Lcom/trendmicro/hippo/NativeDate;->appendMonthName(Ljava/lang/StringBuilder;I)V

    .line 1157
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1158
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/NativeDate;->DateFromTime(D)I

    move-result v6

    invoke-static {v0, v6, v3}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1159
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1160
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/NativeDate;->YearFromTime(D)I

    move-result v6

    .line 1161
    .local v6, "year":I
    if-gez v6, :cond_0

    .line 1162
    const/16 v7, 0x2d

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1163
    neg-int v6, v6

    .line 1165
    :cond_0
    invoke-static {v0, v6, v4}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1166
    if-eq p2, v4, :cond_1

    .line 1167
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1170
    .end local v6    # "year":I
    :cond_1
    if-eq p2, v4, :cond_5

    .line 1171
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/NativeDate;->HourFromTime(D)I

    move-result v5

    invoke-static {v0, v5, v3}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1172
    const/16 v5, 0x3a

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1173
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/NativeDate;->MinFromTime(D)I

    move-result v6

    invoke-static {v0, v6, v3}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1174
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1175
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/NativeDate;->SecFromTime(D)I

    move-result v5

    invoke-static {v0, v5, v3}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1179
    sget-wide v5, Lcom/trendmicro/hippo/NativeDate;->LocalTZA:D

    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->DaylightSavingTA(D)D

    move-result-wide v7

    add-double/2addr v5, v7

    const-wide v7, 0x40ed4c0000000000L    # 60000.0

    div-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    double-to-int v3, v5

    .line 1182
    .local v3, "minutes":I
    div-int/lit8 v5, v3, 0x3c

    mul-int/lit8 v5, v5, 0x64

    rem-int/lit8 v6, v3, 0x3c

    add-int/2addr v5, v6

    .line 1183
    .local v5, "offset":I
    if-lez v5, :cond_2

    .line 1184
    const-string v6, " GMT+"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1186
    :cond_2
    const-string v6, " GMT-"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1187
    neg-int v5, v5

    .line 1189
    :goto_0
    invoke-static {v0, v5, v4}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1191
    sget-object v4, Lcom/trendmicro/hippo/NativeDate;->timeZoneFormatter:Ljava/text/DateFormat;

    if-nez v4, :cond_3

    .line 1192
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v6, "zzz"

    invoke-direct {v4, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v4, Lcom/trendmicro/hippo/NativeDate;->timeZoneFormatter:Ljava/text/DateFormat;

    .line 1196
    :cond_3
    const-wide/16 v6, 0x0

    cmpg-double v4, p0, v6

    if-gez v4, :cond_4

    .line 1197
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/NativeDate;->YearFromTime(D)I

    move-result v4

    invoke-static {v4}, Lcom/trendmicro/hippo/NativeDate;->EquivalentYear(I)I

    move-result v4

    .line 1198
    .local v4, "equiv":I
    int-to-double v6, v4

    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->MonthFromTime(D)I

    move-result v8

    int-to-double v8, v8

    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->DateFromTime(D)I

    move-result v10

    int-to-double v10, v10

    invoke-static/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeDate;->MakeDay(DDD)D

    move-result-wide v6

    .line 1199
    .local v6, "day":D
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->TimeWithinDay(D)D

    move-result-wide v8

    invoke-static {v6, v7, v8, v9}, Lcom/trendmicro/hippo/NativeDate;->MakeDate(DD)D

    move-result-wide p0

    move-wide v6, p0

    goto :goto_1

    .line 1196
    .end local v4    # "equiv":I
    .end local v6    # "day":D
    :cond_4
    move-wide v6, p0

    .line 1201
    .end local p0    # "t":D
    .local v6, "t":D
    :goto_1
    const-string p0, " ("

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1202
    new-instance p0, Ljava/util/Date;

    double-to-long v8, v6

    invoke-direct {p0, v8, v9}, Ljava/util/Date;-><init>(J)V

    move-object v4, p0

    .line 1203
    .local v4, "date":Ljava/util/Date;
    sget-object v8, Lcom/trendmicro/hippo/NativeDate;->timeZoneFormatter:Ljava/text/DateFormat;

    monitor-enter v8

    .line 1204
    :try_start_0
    sget-object p0, Lcom/trendmicro/hippo/NativeDate;->timeZoneFormatter:Ljava/text/DateFormat;

    invoke-virtual {p0, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1205
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1206
    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-wide p0, v6

    goto :goto_2

    .line 1205
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    .line 1208
    .end local v3    # "minutes":I
    .end local v4    # "date":Ljava/util/Date;
    .end local v5    # "offset":I
    .end local v6    # "t":D
    .restart local p0    # "t":D
    :cond_5
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static date_msecFromArgs([Ljava/lang/Object;)D
    .locals 21
    .param p0, "args"    # [Ljava/lang/Object;

    .line 743
    move-object/from16 v0, p0

    const/4 v1, 0x7

    new-array v2, v1, [D

    .line 747
    .local v2, "array":[D
    const/4 v3, 0x0

    .local v3, "loop":I
    :goto_0
    const/4 v4, 0x2

    const-wide/16 v5, 0x0

    if-ge v3, v1, :cond_4

    .line 748
    array-length v7, v0

    if-ge v3, v7, :cond_2

    .line 749
    aget-object v4, v0, v3

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v4

    .line 750
    .local v4, "d":D
    cmpl-double v6, v4, v4

    if-nez v6, :cond_1

    invoke-static {v4, v5}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_1

    .line 753
    :cond_0
    aget-object v6, v0, v3

    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v6

    aput-wide v6, v2, v3

    goto :goto_2

    .line 751
    :cond_1
    :goto_1
    sget-wide v6, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v6

    .line 755
    .end local v4    # "d":D
    :cond_2
    if-ne v3, v4, :cond_3

    .line 756
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    aput-wide v4, v2, v3

    goto :goto_2

    .line 758
    :cond_3
    aput-wide v5, v2, v3

    .line 747
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 764
    :cond_4
    const/4 v1, 0x0

    aget-wide v7, v2, v1

    cmpl-double v5, v7, v5

    if-ltz v5, :cond_5

    aget-wide v5, v2, v1

    const-wide v7, 0x4058c00000000000L    # 99.0

    cmpg-double v5, v5, v7

    if-gtz v5, :cond_5

    .line 765
    aget-wide v5, v2, v1

    const-wide v7, 0x409db00000000000L    # 1900.0

    add-double/2addr v5, v7

    aput-wide v5, v2, v1

    .line 767
    :cond_5
    aget-wide v7, v2, v1

    const/4 v1, 0x1

    aget-wide v9, v2, v1

    aget-wide v11, v2, v4

    const/4 v1, 0x3

    aget-wide v13, v2, v1

    const/4 v1, 0x4

    aget-wide v15, v2, v1

    const/4 v1, 0x5

    aget-wide v17, v2, v1

    const/4 v1, 0x6

    aget-wide v19, v2, v1

    invoke-static/range {v7 .. v20}, Lcom/trendmicro/hippo/NativeDate;->date_msecFromDate(DDDDDDD)D

    move-result-wide v4

    return-wide v4
.end method

.method private static date_msecFromDate(DDDDDDD)D
    .locals 6
    .param p0, "year"    # D
    .param p2, "mon"    # D
    .param p4, "mday"    # D
    .param p6, "hour"    # D
    .param p8, "min"    # D
    .param p10, "sec"    # D
    .param p12, "msec"    # D

    .line 733
    invoke-static/range {p0 .. p5}, Lcom/trendmicro/hippo/NativeDate;->MakeDay(DDD)D

    move-result-wide v0

    .line 734
    .local v0, "day":D
    invoke-static/range {p6 .. p13}, Lcom/trendmicro/hippo/NativeDate;->MakeTime(DDDD)D

    move-result-wide v2

    .line 735
    .local v2, "time":D
    invoke-static {v0, v1, v2, v3}, Lcom/trendmicro/hippo/NativeDate;->MakeDate(DD)D

    move-result-wide v4

    .line 736
    .local v4, "result":D
    return-wide v4
.end method

.method private static date_parseString(Ljava/lang/String;)D
    .locals 49
    .param p0, "s"    # Ljava/lang/String;

    .line 934
    move-object/from16 v6, p0

    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/NativeDate;->parseISOString(Ljava/lang/String;)D

    move-result-wide v7

    .line 935
    .local v7, "d":D
    cmpl-double v0, v7, v7

    if-nez v0, :cond_0

    .line 936
    return-wide v7

    .line 939
    :cond_0
    const/4 v0, -0x1

    .line 940
    .local v0, "year":I
    const/4 v1, -0x1

    .line 941
    .local v1, "mon":I
    const/4 v2, -0x1

    .line 942
    .local v2, "mday":I
    const/4 v3, -0x1

    .line 943
    .local v3, "hour":I
    const/4 v4, -0x1

    .line 944
    .local v4, "min":I
    const/4 v5, -0x1

    .line 945
    .local v5, "sec":I
    const/4 v9, 0x0

    .line 946
    .local v9, "c":C
    const/4 v10, 0x0

    .line 947
    .local v10, "si":C
    const/4 v11, 0x0

    .line 948
    .local v11, "i":I
    const/4 v12, -0x1

    .line 949
    .local v12, "n":I
    const-wide/high16 v13, -0x4010000000000000L    # -1.0

    .line 950
    .local v13, "tzoffset":D
    const/4 v15, 0x0

    .line 951
    .local v15, "prevc":C
    const/16 v16, 0x0

    .line 952
    .local v16, "limit":I
    const/16 v17, 0x0

    .line 954
    .local v17, "seenplusminus":Z
    move/from16 v18, v1

    .end local v1    # "mon":I
    .local v18, "mon":I
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v1

    move/from16 v16, v12

    move/from16 v19, v17

    move v12, v3

    move/from16 v45, v9

    move v9, v0

    move/from16 v0, v45

    move/from16 v46, v11

    move v11, v2

    move/from16 v2, v46

    move-wide/from16 v47, v13

    move v13, v4

    move v14, v5

    move v5, v15

    move v15, v10

    move/from16 v10, v18

    move-wide/from16 v17, v47

    .line 955
    .end local v3    # "hour":I
    .end local v4    # "min":I
    .end local v18    # "mon":I
    .local v0, "c":C
    .local v1, "limit":I
    .local v2, "i":I
    .local v5, "prevc":C
    .local v9, "year":I
    .local v10, "mon":I
    .local v11, "mday":I
    .local v12, "hour":I
    .local v13, "min":I
    .local v14, "sec":I
    .local v15, "si":C
    .local v16, "n":I
    .local v17, "tzoffset":D
    .local v19, "seenplusminus":Z
    :cond_1
    :goto_0
    if-ge v2, v1, :cond_35

    .line 956
    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 957
    add-int/lit8 v2, v2, 0x1

    .line 958
    const/16 v4, 0x20

    const/16 v3, 0x2d

    if-le v0, v4, :cond_32

    const/16 v4, 0x2c

    if-eq v0, v4, :cond_32

    if-ne v0, v3, :cond_2

    move/from16 v24, v5

    move-wide/from16 v29, v7

    move/from16 v25, v15

    move v15, v1

    goto/16 :goto_10

    .line 967
    :cond_2
    const/16 v4, 0x28

    if-ne v0, v4, :cond_6

    .line 968
    const/4 v3, 0x1

    .line 969
    .local v3, "depth":I
    :goto_1
    if-ge v2, v1, :cond_1

    .line 970
    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 971
    add-int/lit8 v2, v2, 0x1

    .line 972
    if-ne v0, v4, :cond_3

    .line 973
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 974
    :cond_3
    const/16 v4, 0x29

    if-ne v0, v4, :cond_5

    .line 975
    add-int/lit8 v3, v3, -0x1

    if-gtz v3, :cond_4

    .line 976
    goto :goto_0

    .line 975
    :cond_4
    const/16 v4, 0x28

    goto :goto_1

    .line 974
    :cond_5
    const/16 v4, 0x28

    goto :goto_1

    .line 980
    .end local v3    # "depth":I
    :cond_6
    const/16 v3, 0x30

    if-gt v3, v0, :cond_20

    const/16 v3, 0x39

    if-gt v0, v3, :cond_20

    .line 981
    add-int/lit8 v3, v0, -0x30

    .line 982
    .end local v16    # "n":I
    .local v3, "n":I
    :goto_2
    if-ge v2, v1, :cond_7

    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    move v0, v4

    move-wide/from16 v29, v7

    const/16 v7, 0x30

    .end local v7    # "d":D
    .local v29, "d":D
    if-gt v7, v4, :cond_8

    const/16 v4, 0x39

    if-gt v0, v4, :cond_8

    .line 983
    mul-int/lit8 v4, v3, 0xa

    add-int/2addr v4, v0

    add-int/lit8 v3, v4, -0x30

    .line 984
    add-int/lit8 v2, v2, 0x1

    move-wide/from16 v7, v29

    goto :goto_2

    .line 982
    .end local v29    # "d":D
    .restart local v7    # "d":D
    :cond_7
    move-wide/from16 v29, v7

    .line 994
    .end local v7    # "d":D
    .restart local v29    # "d":D
    :cond_8
    const/16 v4, 0x3c

    const/16 v7, 0x2b

    if-eq v5, v7, :cond_1c

    const/16 v7, 0x2d

    if-ne v5, v7, :cond_9

    goto/16 :goto_6

    .line 1008
    :cond_9
    const/16 v7, 0x46

    if-ge v3, v7, :cond_17

    const/16 v7, 0x2f

    if-ne v5, v7, :cond_a

    if-ltz v10, :cond_a

    if-ltz v11, :cond_a

    if-gez v9, :cond_a

    goto/16 :goto_3

    .line 1018
    :cond_a
    const/16 v7, 0x3a

    if-ne v0, v7, :cond_d

    .line 1019
    if-gez v12, :cond_b

    .line 1020
    move v4, v3

    move/from16 v16, v3

    move v12, v4

    move v8, v5

    .end local v12    # "hour":I
    .local v4, "hour":I
    goto/16 :goto_8

    .line 1021
    .end local v4    # "hour":I
    .restart local v12    # "hour":I
    :cond_b
    if-gez v13, :cond_c

    .line 1022
    move v4, v3

    move/from16 v16, v3

    move v13, v4

    move v8, v5

    .end local v13    # "min":I
    .local v4, "min":I
    goto/16 :goto_8

    .line 1024
    .end local v4    # "min":I
    .restart local v13    # "min":I
    :cond_c
    sget-wide v7, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v7

    .line 1025
    :cond_d
    const/16 v7, 0x2f

    if-ne v0, v7, :cond_10

    .line 1026
    if-gez v10, :cond_e

    .line 1027
    add-int/lit8 v4, v3, -0x1

    move/from16 v16, v3

    move v10, v4

    move v8, v5

    .end local v10    # "mon":I
    .local v4, "mon":I
    goto/16 :goto_8

    .line 1028
    .end local v4    # "mon":I
    .restart local v10    # "mon":I
    :cond_e
    if-gez v11, :cond_f

    .line 1029
    move v4, v3

    move/from16 v16, v3

    move v11, v4

    move v8, v5

    .end local v11    # "mday":I
    .local v4, "mday":I
    goto/16 :goto_8

    .line 1031
    .end local v4    # "mday":I
    .restart local v11    # "mday":I
    :cond_f
    sget-wide v7, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v7

    .line 1032
    :cond_10
    if-ge v2, v1, :cond_11

    const/16 v7, 0x2c

    if-eq v0, v7, :cond_11

    const/16 v7, 0x20

    if-le v0, v7, :cond_11

    const/16 v7, 0x2d

    if-eq v0, v7, :cond_11

    .line 1033
    sget-wide v7, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v7

    .line 1034
    :cond_11
    if-eqz v19, :cond_13

    if-ge v3, v4, :cond_13

    .line 1035
    const-wide/16 v7, 0x0

    cmpg-double v4, v17, v7

    if-gez v4, :cond_12

    .line 1036
    int-to-double v7, v3

    sub-double v17, v17, v7

    move/from16 v16, v3

    move v8, v5

    goto/16 :goto_8

    .line 1038
    :cond_12
    int-to-double v7, v3

    add-double v17, v17, v7

    move/from16 v16, v3

    move v8, v5

    goto/16 :goto_8

    .line 1039
    :cond_13
    if-ltz v12, :cond_14

    if-gez v13, :cond_14

    .line 1040
    move v4, v3

    move/from16 v16, v3

    move v13, v4

    move v8, v5

    .end local v13    # "min":I
    .local v4, "min":I
    goto/16 :goto_8

    .line 1041
    .end local v4    # "min":I
    .restart local v13    # "min":I
    :cond_14
    if-ltz v13, :cond_15

    if-gez v14, :cond_15

    .line 1042
    move v4, v3

    move/from16 v16, v3

    move v14, v4

    move v8, v5

    .end local v14    # "sec":I
    .local v4, "sec":I
    goto/16 :goto_8

    .line 1043
    .end local v4    # "sec":I
    .restart local v14    # "sec":I
    :cond_15
    if-gez v11, :cond_16

    .line 1044
    move v4, v3

    move/from16 v16, v3

    move v11, v4

    move v8, v5

    .end local v11    # "mday":I
    .local v4, "mday":I
    goto :goto_8

    .line 1046
    .end local v4    # "mday":I
    .restart local v11    # "mday":I
    :cond_16
    sget-wide v7, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v7

    .line 1012
    :cond_17
    :goto_3
    if-ltz v9, :cond_18

    .line 1013
    sget-wide v7, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v7

    .line 1014
    :cond_18
    const/16 v4, 0x20

    if-le v0, v4, :cond_1a

    const/16 v4, 0x2c

    if-eq v0, v4, :cond_1a

    const/16 v4, 0x2f

    if-eq v0, v4, :cond_1a

    if-lt v2, v1, :cond_19

    goto :goto_4

    .line 1017
    :cond_19
    sget-wide v7, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v7

    .line 1015
    :cond_1a
    :goto_4
    const/16 v4, 0x64

    if-ge v3, v4, :cond_1b

    add-int/lit16 v4, v3, 0x76c

    goto :goto_5

    :cond_1b
    move v4, v3

    :goto_5
    move/from16 v16, v3

    move v9, v4

    move v8, v5

    .end local v9    # "year":I
    .local v4, "year":I
    goto :goto_8

    .line 996
    .end local v4    # "year":I
    .restart local v9    # "year":I
    :cond_1c
    :goto_6
    const/4 v7, 0x1

    .line 999
    .end local v19    # "seenplusminus":Z
    .local v7, "seenplusminus":Z
    const/16 v8, 0x18

    if-ge v3, v8, :cond_1d

    .line 1000
    mul-int/lit8 v3, v3, 0x3c

    goto :goto_7

    .line 1002
    :cond_1d
    rem-int/lit8 v8, v3, 0x64

    div-int/lit8 v16, v3, 0x64

    mul-int/lit8 v16, v16, 0x3c

    add-int v3, v8, v16

    .line 1003
    :goto_7
    const/16 v4, 0x2b

    if-ne v5, v4, :cond_1e

    .line 1004
    neg-int v3, v3

    .line 1005
    :cond_1e
    const-wide/16 v22, 0x0

    cmpl-double v4, v17, v22

    if-eqz v4, :cond_1f

    const-wide/high16 v19, -0x4010000000000000L    # -1.0

    cmpl-double v4, v17, v19

    if-eqz v4, :cond_1f

    .line 1006
    sget-wide v19, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v19

    .line 1007
    :cond_1f
    move v8, v5

    .end local v5    # "prevc":C
    .local v8, "prevc":C
    int-to-double v4, v3

    move/from16 v16, v3

    move-wide/from16 v17, v4

    move/from16 v19, v7

    .line 1048
    .end local v3    # "n":I
    .end local v7    # "seenplusminus":Z
    .restart local v16    # "n":I
    .restart local v19    # "seenplusminus":Z
    :goto_8
    const/4 v5, 0x0

    move-wide/from16 v7, v29

    .end local v8    # "prevc":C
    .restart local v5    # "prevc":C
    goto/16 :goto_0

    .line 980
    .end local v29    # "d":D
    .local v7, "d":D
    :cond_20
    move-wide/from16 v29, v7

    move v8, v5

    .line 1049
    .end local v5    # "prevc":C
    .end local v7    # "d":D
    .restart local v8    # "prevc":C
    .restart local v29    # "d":D
    const/16 v3, 0x2f

    if-eq v0, v3, :cond_31

    const/16 v3, 0x3a

    if-eq v0, v3, :cond_31

    const/16 v3, 0x2b

    if-eq v0, v3, :cond_31

    const/16 v3, 0x2d

    if-ne v0, v3, :cond_21

    move/from16 v24, v8

    move/from16 v25, v15

    move v15, v1

    goto/16 :goto_f

    .line 1052
    :cond_21
    add-int/lit8 v7, v2, -0x1

    move v5, v2

    .line 1053
    .end local v2    # "i":I
    .local v5, "i":I
    .local v7, "st":I
    :goto_9
    if-ge v5, v1, :cond_25

    .line 1054
    invoke-virtual {v6, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1055
    const/16 v2, 0x41

    if-gt v2, v0, :cond_22

    const/16 v2, 0x5a

    if-le v0, v2, :cond_23

    :cond_22
    const/16 v2, 0x61

    if-gt v2, v0, :cond_24

    const/16 v2, 0x7a

    if-le v0, v2, :cond_23

    .line 1056
    goto :goto_a

    .line 1057
    :cond_23
    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    .line 1059
    :cond_24
    :goto_a
    move/from16 v20, v0

    goto :goto_b

    .line 1053
    :cond_25
    move/from16 v20, v0

    .line 1059
    .end local v0    # "c":C
    .local v20, "c":C
    :goto_b
    sub-int v4, v5, v7

    .line 1060
    .local v4, "letterCount":I
    const/4 v3, 0x2

    if-ge v4, v3, :cond_26

    .line 1061
    sget-wide v2, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v2

    .line 1067
    :cond_26
    const-string v2, "am;pm;monday;tuesday;wednesday;thursday;friday;saturday;sunday;january;february;march;april;may;june;july;august;september;october;november;december;gmt;ut;utc;est;edt;cst;cdt;mst;mdt;pst;pdt;"

    .line 1073
    .local v2, "wtb":Ljava/lang/String;
    const/4 v0, 0x0

    .line 1074
    .local v0, "index":I
    const/16 v21, 0x0

    move/from16 v45, v21

    move/from16 v21, v1

    move/from16 v1, v45

    .line 1075
    .local v1, "wtbOffset":I
    .local v21, "limit":I
    :goto_c
    const/16 v3, 0x3b

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v23

    .line 1076
    .local v23, "wtbNext":I
    if-gez v23, :cond_27

    .line 1077
    sget-wide v24, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v24

    .line 1078
    :cond_27
    const/4 v3, 0x1

    move/from16 v24, v8

    move v8, v0

    .end local v0    # "index":I
    .local v8, "index":I
    .local v24, "prevc":C
    move-object v0, v2

    move/from16 v25, v15

    move/from16 v15, v21

    move/from16 v21, v1

    .end local v1    # "wtbOffset":I
    .local v15, "limit":I
    .local v21, "wtbOffset":I
    .local v25, "si":C
    move v1, v3

    move-object/from16 v26, v2

    .end local v2    # "wtb":Ljava/lang/String;
    .local v26, "wtb":Ljava/lang/String;
    move/from16 v2, v21

    move-object/from16 v3, p0

    move/from16 v22, v4

    .end local v4    # "letterCount":I
    .local v22, "letterCount":I
    move v4, v7

    move/from16 v27, v5

    .end local v5    # "i":I
    .local v27, "i":I
    move/from16 v5, v22

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 1079
    nop

    .line 1083
    .end local v21    # "wtbOffset":I
    .end local v23    # "wtbNext":I
    const/16 v0, 0xc

    const/4 v1, 0x2

    if-ge v8, v1, :cond_2b

    .line 1088
    if-gt v12, v0, :cond_2a

    if-gez v12, :cond_28

    goto :goto_d

    .line 1090
    :cond_28
    if-nez v8, :cond_29

    .line 1092
    if-ne v12, v0, :cond_2f

    .line 1093
    const/4 v0, 0x0

    move v12, v0

    .end local v12    # "hour":I
    .local v0, "hour":I
    goto/16 :goto_e

    .line 1096
    .end local v0    # "hour":I
    .restart local v12    # "hour":I
    :cond_29
    if-eq v12, v0, :cond_2f

    .line 1097
    add-int/lit8 v12, v12, 0xc

    goto/16 :goto_e

    .line 1089
    :cond_2a
    :goto_d
    sget-wide v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v0

    .line 1099
    :cond_2b
    add-int/lit8 v1, v8, -0x2

    .end local v8    # "index":I
    .local v1, "index":I
    const/4 v2, 0x7

    if-ge v1, v2, :cond_2c

    goto/16 :goto_e

    .line 1101
    :cond_2c
    add-int/lit8 v1, v1, -0x7

    if-ge v1, v0, :cond_2e

    .line 1103
    if-gez v10, :cond_2d

    .line 1104
    move v0, v1

    move v10, v0

    .end local v10    # "mon":I
    .local v0, "mon":I
    goto :goto_e

    .line 1106
    .end local v0    # "mon":I
    .restart local v10    # "mon":I
    :cond_2d
    sget-wide v2, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v2

    .line 1109
    :cond_2e
    add-int/lit8 v1, v1, -0xc

    .line 1111
    packed-switch v1, :pswitch_data_0

    .line 1123
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_e

    .line 1122
    :pswitch_0
    const-wide v2, 0x407a400000000000L    # 420.0

    move-wide/from16 v17, v2

    .end local v17    # "tzoffset":D
    .local v2, "tzoffset":D
    goto :goto_e

    .line 1121
    .end local v2    # "tzoffset":D
    .restart local v17    # "tzoffset":D
    :pswitch_1
    const-wide/high16 v2, 0x407e000000000000L    # 480.0

    move-wide/from16 v17, v2

    .end local v17    # "tzoffset":D
    .restart local v2    # "tzoffset":D
    goto :goto_e

    .line 1120
    .end local v2    # "tzoffset":D
    .restart local v17    # "tzoffset":D
    :pswitch_2
    const-wide v2, 0x4076800000000000L    # 360.0

    move-wide/from16 v17, v2

    .end local v17    # "tzoffset":D
    .restart local v2    # "tzoffset":D
    goto :goto_e

    .line 1119
    .end local v2    # "tzoffset":D
    .restart local v17    # "tzoffset":D
    :pswitch_3
    const-wide v2, 0x407a400000000000L    # 420.0

    move-wide/from16 v17, v2

    .end local v17    # "tzoffset":D
    .restart local v2    # "tzoffset":D
    goto :goto_e

    .line 1118
    .end local v2    # "tzoffset":D
    .restart local v17    # "tzoffset":D
    :pswitch_4
    const-wide v2, 0x4072c00000000000L    # 300.0

    move-wide/from16 v17, v2

    .end local v17    # "tzoffset":D
    .restart local v2    # "tzoffset":D
    goto :goto_e

    .line 1117
    .end local v2    # "tzoffset":D
    .restart local v17    # "tzoffset":D
    :pswitch_5
    const-wide v2, 0x4076800000000000L    # 360.0

    move-wide/from16 v17, v2

    .end local v17    # "tzoffset":D
    .restart local v2    # "tzoffset":D
    goto :goto_e

    .line 1116
    .end local v2    # "tzoffset":D
    .restart local v17    # "tzoffset":D
    :pswitch_6
    const-wide/high16 v2, 0x406e000000000000L    # 240.0

    move-wide/from16 v17, v2

    .end local v17    # "tzoffset":D
    .restart local v2    # "tzoffset":D
    goto :goto_e

    .line 1115
    .end local v2    # "tzoffset":D
    .restart local v17    # "tzoffset":D
    :pswitch_7
    const-wide v2, 0x4072c00000000000L    # 300.0

    move-wide/from16 v17, v2

    .end local v17    # "tzoffset":D
    .restart local v2    # "tzoffset":D
    goto :goto_e

    .line 1114
    .end local v2    # "tzoffset":D
    .restart local v17    # "tzoffset":D
    :pswitch_8
    const-wide/16 v2, 0x0

    move-wide/from16 v17, v2

    .end local v17    # "tzoffset":D
    .restart local v2    # "tzoffset":D
    goto :goto_e

    .line 1113
    .end local v2    # "tzoffset":D
    .restart local v17    # "tzoffset":D
    :pswitch_9
    const-wide/16 v2, 0x0

    move-wide/from16 v17, v2

    .end local v17    # "tzoffset":D
    .restart local v2    # "tzoffset":D
    goto :goto_e

    .line 1112
    .end local v2    # "tzoffset":D
    .restart local v17    # "tzoffset":D
    :pswitch_a
    const-wide/16 v2, 0x0

    move-wide/from16 v17, v2

    .line 1126
    .end local v1    # "index":I
    .end local v7    # "st":I
    .end local v22    # "letterCount":I
    .end local v26    # "wtb":Ljava/lang/String;
    :cond_2f
    :goto_e
    move v1, v15

    move/from16 v0, v20

    move/from16 v5, v24

    move/from16 v15, v25

    move/from16 v2, v27

    move-wide/from16 v7, v29

    goto/16 :goto_0

    .line 1080
    .restart local v7    # "st":I
    .restart local v8    # "index":I
    .restart local v21    # "wtbOffset":I
    .restart local v22    # "letterCount":I
    .restart local v23    # "wtbNext":I
    .restart local v26    # "wtb":Ljava/lang/String;
    :cond_30
    const/4 v1, 0x2

    add-int/lit8 v0, v23, 0x1

    .line 1081
    .end local v21    # "wtbOffset":I
    .local v0, "wtbOffset":I
    nop

    .end local v23    # "wtbNext":I
    add-int/lit8 v2, v8, 0x1

    .line 1082
    .end local v8    # "index":I
    .local v2, "index":I
    move v3, v1

    move/from16 v21, v15

    move/from16 v4, v22

    move/from16 v8, v24

    move/from16 v15, v25

    move/from16 v5, v27

    move v1, v0

    move v0, v2

    move-object/from16 v2, v26

    goto/16 :goto_c

    .line 1049
    .end local v7    # "st":I
    .end local v20    # "c":C
    .end local v22    # "letterCount":I
    .end local v24    # "prevc":C
    .end local v25    # "si":C
    .end local v26    # "wtb":Ljava/lang/String;
    .end local v27    # "i":I
    .local v0, "c":C
    .local v1, "limit":I
    .local v2, "i":I
    .local v8, "prevc":C
    .local v15, "si":C
    :cond_31
    move/from16 v24, v8

    move/from16 v25, v15

    move v15, v1

    .line 1050
    .end local v1    # "limit":I
    .end local v8    # "prevc":C
    .local v15, "limit":I
    .restart local v24    # "prevc":C
    .restart local v25    # "si":C
    :goto_f
    move v5, v0

    move v1, v15

    move/from16 v15, v25

    move-wide/from16 v7, v29

    .end local v24    # "prevc":C
    .local v5, "prevc":C
    goto/16 :goto_0

    .line 958
    .end local v25    # "si":C
    .end local v29    # "d":D
    .restart local v1    # "limit":I
    .local v7, "d":D
    .local v15, "si":C
    :cond_32
    move/from16 v24, v5

    move-wide/from16 v29, v7

    move/from16 v25, v15

    move v15, v1

    .line 959
    .end local v1    # "limit":I
    .end local v5    # "prevc":C
    .end local v7    # "d":D
    .local v15, "limit":I
    .restart local v24    # "prevc":C
    .restart local v25    # "si":C
    .restart local v29    # "d":D
    :goto_10
    if-ge v2, v15, :cond_34

    .line 960
    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 961
    .end local v25    # "si":C
    .local v1, "si":C
    const/16 v3, 0x2d

    if-ne v0, v3, :cond_33

    const/16 v3, 0x30

    if-gt v3, v1, :cond_33

    const/16 v3, 0x39

    if-gt v1, v3, :cond_33

    .line 962
    move v5, v0

    move-wide/from16 v7, v29

    move/from16 v45, v15

    move v15, v1

    move/from16 v1, v45

    .end local v24    # "prevc":C
    .restart local v5    # "prevc":C
    goto/16 :goto_0

    .line 955
    .end local v5    # "prevc":C
    .restart local v24    # "prevc":C
    :cond_33
    move/from16 v5, v24

    move-wide/from16 v7, v29

    move/from16 v45, v15

    move v15, v1

    move/from16 v1, v45

    goto/16 :goto_0

    .line 959
    .end local v1    # "si":C
    .restart local v25    # "si":C
    :cond_34
    move v1, v15

    move/from16 v5, v24

    move/from16 v15, v25

    move-wide/from16 v7, v29

    goto/16 :goto_0

    .line 1128
    .end local v24    # "prevc":C
    .end local v25    # "si":C
    .end local v29    # "d":D
    .local v1, "limit":I
    .restart local v5    # "prevc":C
    .restart local v7    # "d":D
    .local v15, "si":C
    :cond_35
    move/from16 v24, v5

    move-wide/from16 v29, v7

    move/from16 v25, v15

    move v15, v1

    .end local v1    # "limit":I
    .end local v5    # "prevc":C
    .end local v7    # "d":D
    .local v15, "limit":I
    .restart local v24    # "prevc":C
    .restart local v25    # "si":C
    .restart local v29    # "d":D
    if-ltz v9, :cond_3b

    if-ltz v10, :cond_3b

    if-gez v11, :cond_36

    move/from16 v22, v0

    move/from16 v23, v9

    move/from16 v26, v10

    move/from16 v27, v11

    goto :goto_11

    .line 1130
    :cond_36
    if-gez v14, :cond_37

    .line 1131
    const/4 v14, 0x0

    .line 1132
    :cond_37
    if-gez v13, :cond_38

    .line 1133
    const/4 v13, 0x0

    .line 1134
    :cond_38
    if-gez v12, :cond_39

    .line 1135
    const/4 v12, 0x0

    .line 1137
    :cond_39
    int-to-double v3, v9

    int-to-double v7, v10

    move v5, v0

    .end local v0    # "c":C
    .local v5, "c":C
    int-to-double v0, v11

    move/from16 v22, v5

    .end local v5    # "c":C
    .local v22, "c":C
    int-to-double v5, v12

    move/from16 v23, v9

    move/from16 v26, v10

    .end local v9    # "year":I
    .end local v10    # "mon":I
    .local v23, "year":I
    .local v26, "mon":I
    int-to-double v9, v13

    move/from16 v27, v11

    move/from16 v28, v12

    .end local v11    # "mday":I
    .end local v12    # "hour":I
    .local v27, "mday":I
    .local v28, "hour":I
    int-to-double v11, v14

    const-wide/16 v43, 0x0

    move-wide/from16 v31, v3

    move-wide/from16 v33, v7

    move-wide/from16 v35, v0

    move-wide/from16 v37, v5

    move-wide/from16 v39, v9

    move-wide/from16 v41, v11

    invoke-static/range {v31 .. v44}, Lcom/trendmicro/hippo/NativeDate;->date_msecFromDate(DDDDDDD)D

    move-result-wide v0

    .line 1138
    .local v0, "msec":D
    const-wide/high16 v3, -0x4010000000000000L    # -1.0

    cmpl-double v3, v17, v3

    if-nez v3, :cond_3a

    .line 1139
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/NativeDate;->internalUTC(D)D

    move-result-wide v3

    return-wide v3

    .line 1141
    :cond_3a
    const-wide v3, 0x40ed4c0000000000L    # 60000.0

    mul-double v3, v3, v17

    add-double/2addr v3, v0

    return-wide v3

    .line 1128
    .end local v22    # "c":C
    .end local v23    # "year":I
    .end local v26    # "mon":I
    .end local v27    # "mday":I
    .end local v28    # "hour":I
    .local v0, "c":C
    .restart local v9    # "year":I
    .restart local v10    # "mon":I
    .restart local v11    # "mday":I
    .restart local v12    # "hour":I
    :cond_3b
    move/from16 v22, v0

    move/from16 v23, v9

    move/from16 v26, v10

    move/from16 v27, v11

    .line 1129
    .end local v0    # "c":C
    .end local v9    # "year":I
    .end local v10    # "mon":I
    .end local v11    # "mday":I
    .restart local v22    # "c":C
    .restart local v23    # "year":I
    .restart local v26    # "mon":I
    .restart local v27    # "mday":I
    :goto_11
    sget-wide v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 3
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 32
    new-instance v0, Lcom/trendmicro/hippo/NativeDate;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeDate;-><init>()V

    .line 34
    .local v0, "obj":Lcom/trendmicro/hippo/NativeDate;
    sget-wide v1, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    iput-wide v1, v0, Lcom/trendmicro/hippo/NativeDate;->date:D

    .line 35
    const/16 v1, 0x2f

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeDate;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 36
    return-void
.end method

.method private static internalUTC(D)D
    .locals 4
    .param p0, "t"    # D

    .line 642
    sget-wide v0, Lcom/trendmicro/hippo/NativeDate;->LocalTZA:D

    sub-double v2, p0, v0

    sub-double v0, p0, v0

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/NativeDate;->DaylightSavingTA(D)D

    move-result-wide v0

    sub-double/2addr v2, v0

    return-wide v2
.end method

.method private static jsConstructor([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p0, "args"    # [Ljava/lang/Object;

    .line 1214
    new-instance v0, Lcom/trendmicro/hippo/NativeDate;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeDate;-><init>()V

    .line 1218
    .local v0, "obj":Lcom/trendmicro/hippo/NativeDate;
    array-length v1, p0

    if-nez v1, :cond_0

    .line 1219
    invoke-static {}, Lcom/trendmicro/hippo/NativeDate;->now()D

    move-result-wide v1

    iput-wide v1, v0, Lcom/trendmicro/hippo/NativeDate;->date:D

    .line 1220
    return-object v0

    .line 1224
    :cond_0
    array-length v1, p0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_4

    .line 1225
    const/4 v1, 0x0

    aget-object v1, p0, v1

    .line 1226
    .local v1, "arg0":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/NativeDate;

    if-eqz v2, :cond_1

    .line 1227
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/NativeDate;

    iget-wide v2, v2, Lcom/trendmicro/hippo/NativeDate;->date:D

    iput-wide v2, v0, Lcom/trendmicro/hippo/NativeDate;->date:D

    .line 1228
    return-object v0

    .line 1230
    :cond_1
    instance-of v2, v1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_2

    .line 1231
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/Scriptable;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .line 1234
    :cond_2
    instance-of v2, v1, Ljava/lang/CharSequence;

    if-eqz v2, :cond_3

    .line 1236
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/trendmicro/hippo/NativeDate;->date_parseString(Ljava/lang/String;)D

    move-result-wide v2

    .local v2, "date":D
    goto :goto_0

    .line 1239
    .end local v2    # "date":D
    :cond_3
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    .line 1241
    .restart local v2    # "date":D
    :goto_0
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/NativeDate;->TimeClip(D)D

    move-result-wide v4

    iput-wide v4, v0, Lcom/trendmicro/hippo/NativeDate;->date:D

    .line 1242
    return-object v0

    .line 1245
    .end local v1    # "arg0":Ljava/lang/Object;
    .end local v2    # "date":D
    :cond_4
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeDate;->date_msecFromArgs([Ljava/lang/Object;)D

    move-result-wide v1

    .line 1247
    .local v1, "time":D
    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-nez v3, :cond_5

    invoke-static {v1, v2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v3

    if-nez v3, :cond_5

    .line 1248
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/NativeDate;->internalUTC(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/trendmicro/hippo/NativeDate;->TimeClip(D)D

    move-result-wide v1

    .line 1250
    :cond_5
    iput-wide v1, v0, Lcom/trendmicro/hippo/NativeDate;->date:D

    .line 1252
    return-object v0
.end method

.method private static jsStaticFunction_UTC([Ljava/lang/Object;)D
    .locals 2
    .param p0, "args"    # [Ljava/lang/Object;

    .line 773
    array-length v0, p0

    if-nez v0, :cond_0

    .line 774
    sget-wide v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v0

    .line 776
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeDate;->date_msecFromArgs([Ljava/lang/Object;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/NativeDate;->TimeClip(D)D

    move-result-wide v0

    return-wide v0
.end method

.method private static js_toISOString(D)Ljava/lang/String;
    .locals 5
    .param p0, "t"    # D

    .line 1315
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x1b

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1317
    .local v0, "result":Ljava/lang/StringBuilder;
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->YearFromTime(D)I

    move-result v1

    .line 1318
    .local v1, "year":I
    const/4 v2, 0x6

    const/16 v3, 0x2d

    if-gez v1, :cond_0

    .line 1319
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1320
    neg-int v4, v1

    invoke-static {v0, v4, v2}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    goto :goto_0

    .line 1321
    :cond_0
    const/16 v4, 0x270f

    if-le v1, v4, :cond_1

    .line 1322
    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    goto :goto_0

    .line 1324
    :cond_1
    const/4 v2, 0x4

    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1326
    :goto_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1327
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->MonthFromTime(D)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    const/4 v4, 0x2

    invoke-static {v0, v2, v4}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1328
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1329
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->DateFromTime(D)I

    move-result v2

    invoke-static {v0, v2, v4}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1330
    const/16 v2, 0x54

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1331
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->HourFromTime(D)I

    move-result v2

    invoke-static {v0, v2, v4}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1332
    const/16 v2, 0x3a

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1333
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->MinFromTime(D)I

    move-result v3

    invoke-static {v0, v3, v4}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1334
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1335
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->SecFromTime(D)I

    move-result v2

    invoke-static {v0, v2, v4}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1336
    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1337
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->msFromTime(D)I

    move-result v2

    const/4 v3, 0x3

    invoke-static {v0, v2, v3}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1338
    const/16 v2, 0x5a

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1339
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static js_toUTCString(D)Ljava/lang/String;
    .locals 5
    .param p0, "date"    # D

    .line 1291
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x3c

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1293
    .local v0, "result":Ljava/lang/StringBuilder;
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->WeekDay(D)I

    move-result v1

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/NativeDate;->appendWeekDayName(Ljava/lang/StringBuilder;I)V

    .line 1294
    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1295
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->DateFromTime(D)I

    move-result v1

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1296
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1297
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->MonthFromTime(D)I

    move-result v3

    invoke-static {v0, v3}, Lcom/trendmicro/hippo/NativeDate;->appendMonthName(Ljava/lang/StringBuilder;I)V

    .line 1298
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1299
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->YearFromTime(D)I

    move-result v3

    .line 1300
    .local v3, "year":I
    if-gez v3, :cond_0

    .line 1301
    const/16 v4, 0x2d

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    neg-int v3, v3

    .line 1303
    :cond_0
    const/4 v4, 0x4

    invoke-static {v0, v3, v4}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1304
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1305
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->HourFromTime(D)I

    move-result v1

    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1306
    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1307
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->MinFromTime(D)I

    move-result v4

    invoke-static {v0, v4, v2}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1308
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1309
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeDate;->SecFromTime(D)I

    move-result v1

    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/NativeDate;->append0PaddedUint(Ljava/lang/StringBuilder;II)V

    .line 1310
    const-string v1, " GMT"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1311
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static makeDate(D[Ljava/lang/Object;I)D
    .locals 23
    .param p0, "date"    # D
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "methodId"    # I

    .line 1505
    move-object/from16 v0, p2

    array-length v1, v0

    if-nez v1, :cond_0

    .line 1506
    sget-wide v1, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v1

    .line 1510
    :cond_0
    const/4 v1, 0x1

    .line 1511
    .local v1, "local":Z
    packed-switch p3, :pswitch_data_0

    .line 1534
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1527
    :pswitch_0
    const/4 v1, 0x0

    .line 1530
    :pswitch_1
    const/4 v2, 0x3

    .line 1531
    .local v2, "maxargs":I
    goto :goto_0

    .line 1520
    .end local v2    # "maxargs":I
    :pswitch_2
    const/4 v1, 0x0

    .line 1523
    :pswitch_3
    const/4 v2, 0x2

    .line 1524
    .restart local v2    # "maxargs":I
    goto :goto_0

    .line 1513
    .end local v2    # "maxargs":I
    :pswitch_4
    const/4 v1, 0x0

    .line 1516
    :pswitch_5
    const/4 v2, 0x1

    .line 1517
    .restart local v2    # "maxargs":I
    nop

    .line 1537
    :goto_0
    const/4 v3, 0x0

    .line 1538
    .local v3, "hasNaN":Z
    array-length v4, v0

    if-ge v4, v2, :cond_1

    array-length v4, v0

    goto :goto_1

    :cond_1
    move v4, v2

    .line 1539
    .local v4, "numNums":I
    :goto_1
    nop

    .line 1540
    const/4 v5, 0x3

    new-array v6, v5, [D

    .line 1541
    .local v6, "nums":[D
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    if-ge v7, v4, :cond_4

    .line 1542
    aget-object v8, v0, v7

    invoke-static {v8}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v8

    .line 1543
    .local v8, "d":D
    cmpl-double v10, v8, v8

    if-nez v10, :cond_3

    invoke-static {v8, v9}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v10

    if-eqz v10, :cond_2

    goto :goto_3

    .line 1546
    :cond_2
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(D)D

    move-result-wide v10

    aput-wide v10, v6, v7

    goto :goto_4

    .line 1544
    :cond_3
    :goto_3
    const/4 v3, 0x1

    .line 1541
    .end local v8    # "d":D
    :goto_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 1551
    .end local v7    # "i":I
    :cond_4
    if-eqz v3, :cond_5

    .line 1552
    sget-wide v7, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v7

    .line 1555
    :cond_5
    const/4 v7, 0x0

    .restart local v7    # "i":I
    move v8, v4

    .line 1561
    .local v8, "stop":I
    cmpl-double v9, p0, p0

    if-eqz v9, :cond_7

    .line 1562
    if-ge v2, v5, :cond_6

    .line 1563
    sget-wide v9, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v9

    .line 1565
    :cond_6
    const-wide/16 v9, 0x0

    .local v9, "lorutime":D
    goto :goto_5

    .line 1567
    .end local v9    # "lorutime":D
    :cond_7
    if-eqz v1, :cond_8

    .line 1568
    invoke-static/range {p0 .. p1}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v9

    .restart local v9    # "lorutime":D
    goto :goto_5

    .line 1570
    .end local v9    # "lorutime":D
    :cond_8
    move-wide/from16 v9, p0

    .line 1573
    .restart local v9    # "lorutime":D
    :goto_5
    if-lt v2, v5, :cond_9

    if-ge v7, v8, :cond_9

    .line 1574
    add-int/lit8 v5, v7, 0x1

    .end local v7    # "i":I
    .local v5, "i":I
    aget-wide v11, v6, v7

    move v7, v5

    move-wide/from16 v17, v11

    .local v11, "year":D
    goto :goto_6

    .line 1576
    .end local v5    # "i":I
    .end local v11    # "year":D
    .restart local v7    # "i":I
    :cond_9
    invoke-static {v9, v10}, Lcom/trendmicro/hippo/NativeDate;->YearFromTime(D)I

    move-result v5

    int-to-double v11, v5

    move-wide/from16 v17, v11

    .line 1578
    .local v17, "year":D
    :goto_6
    const/4 v5, 0x2

    if-lt v2, v5, :cond_a

    if-ge v7, v8, :cond_a

    .line 1579
    add-int/lit8 v5, v7, 0x1

    .end local v7    # "i":I
    .restart local v5    # "i":I
    aget-wide v11, v6, v7

    move v7, v5

    move-wide/from16 v19, v11

    .local v11, "month":D
    goto :goto_7

    .line 1581
    .end local v5    # "i":I
    .end local v11    # "month":D
    .restart local v7    # "i":I
    :cond_a
    invoke-static {v9, v10}, Lcom/trendmicro/hippo/NativeDate;->MonthFromTime(D)I

    move-result v5

    int-to-double v11, v5

    move-wide/from16 v19, v11

    .line 1583
    .local v19, "month":D
    :goto_7
    const/4 v5, 0x1

    if-lt v2, v5, :cond_b

    if-ge v7, v8, :cond_b

    .line 1584
    add-int/lit8 v5, v7, 0x1

    .end local v7    # "i":I
    .restart local v5    # "i":I
    aget-wide v11, v6, v7

    move v7, v5

    move-wide/from16 v21, v11

    .local v11, "day":D
    goto :goto_8

    .line 1586
    .end local v5    # "i":I
    .end local v11    # "day":D
    .restart local v7    # "i":I
    :cond_b
    invoke-static {v9, v10}, Lcom/trendmicro/hippo/NativeDate;->DateFromTime(D)I

    move-result v5

    int-to-double v11, v5

    move-wide/from16 v21, v11

    .line 1588
    .local v21, "day":D
    :goto_8
    move-wide/from16 v11, v17

    move-wide/from16 v13, v19

    move-wide/from16 v15, v21

    invoke-static/range {v11 .. v16}, Lcom/trendmicro/hippo/NativeDate;->MakeDay(DDD)D

    move-result-wide v11

    .line 1589
    .end local v21    # "day":D
    .restart local v11    # "day":D
    invoke-static {v9, v10}, Lcom/trendmicro/hippo/NativeDate;->TimeWithinDay(D)D

    move-result-wide v13

    invoke-static {v11, v12, v13, v14}, Lcom/trendmicro/hippo/NativeDate;->MakeDate(DD)D

    move-result-wide v13

    .line 1591
    .local v13, "result":D
    if-eqz v1, :cond_c

    .line 1592
    invoke-static {v13, v14}, Lcom/trendmicro/hippo/NativeDate;->internalUTC(D)D

    move-result-wide v13

    .line 1594
    :cond_c
    invoke-static {v13, v14}, Lcom/trendmicro/hippo/NativeDate;->TimeClip(D)D

    move-result-wide v15

    return-wide v15

    :pswitch_data_0
    .packed-switch 0x27
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static makeTime(D[Ljava/lang/Object;I)D
    .locals 27
    .param p0, "date"    # D
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "methodId"    # I

    .line 1397
    move-object/from16 v0, p2

    array-length v1, v0

    if-nez v1, :cond_0

    .line 1407
    sget-wide v1, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v1

    .line 1411
    :cond_0
    const/4 v1, 0x1

    .line 1412
    .local v1, "local":Z
    packed-switch p3, :pswitch_data_0

    .line 1442
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1435
    :pswitch_0
    const/4 v1, 0x0

    .line 1438
    :pswitch_1
    const/4 v2, 0x4

    .line 1439
    .local v2, "maxargs":I
    goto :goto_0

    .line 1428
    .end local v2    # "maxargs":I
    :pswitch_2
    const/4 v1, 0x0

    .line 1431
    :pswitch_3
    const/4 v2, 0x3

    .line 1432
    .restart local v2    # "maxargs":I
    goto :goto_0

    .line 1421
    .end local v2    # "maxargs":I
    :pswitch_4
    const/4 v1, 0x0

    .line 1424
    :pswitch_5
    const/4 v2, 0x2

    .line 1425
    .restart local v2    # "maxargs":I
    goto :goto_0

    .line 1414
    .end local v2    # "maxargs":I
    :pswitch_6
    const/4 v1, 0x0

    .line 1417
    :pswitch_7
    const/4 v2, 0x1

    .line 1418
    .restart local v2    # "maxargs":I
    nop

    .line 1445
    :goto_0
    const/4 v3, 0x0

    .line 1446
    .local v3, "hasNaN":Z
    array-length v4, v0

    if-ge v4, v2, :cond_1

    array-length v4, v0

    goto :goto_1

    :cond_1
    move v4, v2

    .line 1447
    .local v4, "numNums":I
    :goto_1
    nop

    .line 1448
    const/4 v5, 0x4

    new-array v6, v5, [D

    .line 1449
    .local v6, "nums":[D
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    if-ge v7, v4, :cond_4

    .line 1450
    aget-object v8, v0, v7

    invoke-static {v8}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v8

    .line 1451
    .local v8, "d":D
    cmpl-double v10, v8, v8

    if-nez v10, :cond_3

    invoke-static {v8, v9}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v10

    if-eqz v10, :cond_2

    goto :goto_3

    .line 1454
    :cond_2
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(D)D

    move-result-wide v10

    aput-wide v10, v6, v7

    goto :goto_4

    .line 1452
    :cond_3
    :goto_3
    const/4 v3, 0x1

    .line 1449
    .end local v8    # "d":D
    :goto_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 1460
    .end local v7    # "i":I
    :cond_4
    if-nez v3, :cond_c

    cmpl-double v7, p0, p0

    if-eqz v7, :cond_5

    goto/16 :goto_a

    .line 1464
    :cond_5
    const/4 v7, 0x0

    .restart local v7    # "i":I
    move v8, v4

    .line 1468
    .local v8, "stop":I
    if-eqz v1, :cond_6

    .line 1469
    invoke-static/range {p0 .. p1}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v9

    .local v9, "lorutime":D
    goto :goto_5

    .line 1471
    .end local v9    # "lorutime":D
    :cond_6
    move-wide/from16 v9, p0

    .line 1473
    .restart local v9    # "lorutime":D
    :goto_5
    if-lt v2, v5, :cond_7

    if-ge v7, v8, :cond_7

    .line 1474
    add-int/lit8 v5, v7, 0x1

    .end local v7    # "i":I
    .local v5, "i":I
    aget-wide v11, v6, v7

    move v7, v5

    move-wide/from16 v19, v11

    .local v11, "hour":D
    goto :goto_6

    .line 1476
    .end local v5    # "i":I
    .end local v11    # "hour":D
    .restart local v7    # "i":I
    :cond_7
    invoke-static {v9, v10}, Lcom/trendmicro/hippo/NativeDate;->HourFromTime(D)I

    move-result v5

    int-to-double v11, v5

    move-wide/from16 v19, v11

    .line 1478
    .local v19, "hour":D
    :goto_6
    const/4 v5, 0x3

    if-lt v2, v5, :cond_8

    if-ge v7, v8, :cond_8

    .line 1479
    add-int/lit8 v5, v7, 0x1

    .end local v7    # "i":I
    .restart local v5    # "i":I
    aget-wide v11, v6, v7

    move v7, v5

    move-wide/from16 v21, v11

    .local v11, "min":D
    goto :goto_7

    .line 1481
    .end local v5    # "i":I
    .end local v11    # "min":D
    .restart local v7    # "i":I
    :cond_8
    invoke-static {v9, v10}, Lcom/trendmicro/hippo/NativeDate;->MinFromTime(D)I

    move-result v5

    int-to-double v11, v5

    move-wide/from16 v21, v11

    .line 1483
    .local v21, "min":D
    :goto_7
    const/4 v5, 0x2

    if-lt v2, v5, :cond_9

    if-ge v7, v8, :cond_9

    .line 1484
    add-int/lit8 v5, v7, 0x1

    .end local v7    # "i":I
    .restart local v5    # "i":I
    aget-wide v11, v6, v7

    move v7, v5

    move-wide/from16 v23, v11

    .local v11, "sec":D
    goto :goto_8

    .line 1486
    .end local v5    # "i":I
    .end local v11    # "sec":D
    .restart local v7    # "i":I
    :cond_9
    invoke-static {v9, v10}, Lcom/trendmicro/hippo/NativeDate;->SecFromTime(D)I

    move-result v5

    int-to-double v11, v5

    move-wide/from16 v23, v11

    .line 1488
    .local v23, "sec":D
    :goto_8
    const/4 v5, 0x1

    if-lt v2, v5, :cond_a

    if-ge v7, v8, :cond_a

    .line 1489
    add-int/lit8 v5, v7, 0x1

    .end local v7    # "i":I
    .restart local v5    # "i":I
    aget-wide v11, v6, v7

    move v7, v5

    move-wide/from16 v25, v11

    .local v11, "msec":D
    goto :goto_9

    .line 1491
    .end local v5    # "i":I
    .end local v11    # "msec":D
    .restart local v7    # "i":I
    :cond_a
    invoke-static {v9, v10}, Lcom/trendmicro/hippo/NativeDate;->msFromTime(D)I

    move-result v5

    int-to-double v11, v5

    move-wide/from16 v25, v11

    .line 1493
    .local v25, "msec":D
    :goto_9
    move-wide/from16 v11, v19

    move-wide/from16 v13, v21

    move-wide/from16 v15, v23

    move-wide/from16 v17, v25

    invoke-static/range {v11 .. v18}, Lcom/trendmicro/hippo/NativeDate;->MakeTime(DDDD)D

    move-result-wide v11

    .line 1494
    .local v11, "time":D
    invoke-static {v9, v10}, Lcom/trendmicro/hippo/NativeDate;->Day(D)D

    move-result-wide v13

    invoke-static {v13, v14, v11, v12}, Lcom/trendmicro/hippo/NativeDate;->MakeDate(DD)D

    move-result-wide v13

    .line 1496
    .local v13, "result":D
    if-eqz v1, :cond_b

    .line 1497
    invoke-static {v13, v14}, Lcom/trendmicro/hippo/NativeDate;->internalUTC(D)D

    move-result-wide v13

    .line 1499
    :cond_b
    invoke-static {v13, v14}, Lcom/trendmicro/hippo/NativeDate;->TimeClip(D)D

    move-result-wide v15

    return-wide v15

    .line 1461
    .end local v7    # "i":I
    .end local v8    # "stop":I
    .end local v9    # "lorutime":D
    .end local v11    # "time":D
    .end local v13    # "result":D
    .end local v19    # "hour":D
    .end local v21    # "min":D
    .end local v23    # "sec":D
    .end local v25    # "msec":D
    :cond_c
    :goto_a
    sget-wide v7, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v7

    nop

    :pswitch_data_0
    .packed-switch 0x1f
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static msFromTime(D)I
    .locals 6
    .param p0, "t"    # D

    .line 675
    const-wide v0, 0x408f400000000000L    # 1000.0

    rem-double v2, p0, v0

    .line 676
    .local v2, "result":D
    const-wide/16 v4, 0x0

    cmpg-double v4, v2, v4

    if-gez v4, :cond_0

    .line 677
    add-double/2addr v2, v0

    .line 678
    :cond_0
    double-to-int v0, v2

    return v0
.end method

.method private static now()D
    .locals 2

    .line 576
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-double v0, v0

    return-wide v0
.end method

.method private static parseISOString(Ljava/lang/String;)D
    .locals 54
    .param p0, "s"    # Ljava/lang/String;

    .line 789
    move-object/from16 v0, p0

    const/4 v1, -0x1

    .line 790
    .local v1, "ERROR":I
    const/4 v2, 0x0

    .local v2, "YEAR":I
    const/4 v3, 0x1

    .local v3, "MONTH":I
    const/4 v4, 0x2

    .line 791
    .local v4, "DAY":I
    const/4 v5, 0x3

    .local v5, "HOUR":I
    const/4 v6, 0x4

    .local v6, "MIN":I
    const/4 v7, 0x5

    .local v7, "SEC":I
    const/4 v8, 0x6

    .line 792
    .local v8, "MSEC":I
    const/4 v9, 0x7

    .local v9, "TZHOUR":I
    const/16 v10, 0x8

    .line 793
    .local v10, "TZMIN":I
    const/4 v11, 0x0

    .line 795
    .local v11, "state":I
    const/16 v12, 0x9

    new-array v12, v12, [I

    fill-array-data v12, :array_0

    .line 796
    .local v12, "values":[I
    const/4 v13, 0x4

    .local v13, "yearlen":I
    const/4 v14, 0x1

    .local v14, "yearmod":I
    const/4 v15, 0x1

    .line 797
    .local v15, "tzmod":I
    const/16 v16, 0x0

    move/from16 v17, v1

    .end local v1    # "ERROR":I
    .local v16, "i":I
    .local v17, "ERROR":I
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 798
    .local v1, "len":I
    move/from16 v18, v2

    .end local v2    # "YEAR":I
    .local v18, "YEAR":I
    if-eqz v1, :cond_3

    .line 799
    move/from16 v24, v3

    const/4 v2, 0x0

    .end local v3    # "MONTH":I
    .local v24, "MONTH":I
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 800
    .local v3, "c":C
    const/16 v2, 0x2b

    if-eq v3, v2, :cond_1

    const/16 v2, 0x2d

    if-ne v3, v2, :cond_0

    goto :goto_0

    .line 805
    :cond_0
    const/16 v2, 0x54

    if-ne v3, v2, :cond_4

    .line 807
    add-int/lit8 v16, v16, 0x1

    .line 808
    const/4 v11, 0x3

    goto :goto_2

    .line 802
    :cond_1
    :goto_0
    add-int/lit8 v16, v16, 0x1

    .line 803
    const/4 v13, 0x6

    .line 804
    const/16 v2, 0x2d

    if-ne v3, v2, :cond_2

    const/4 v2, -0x1

    goto :goto_1

    :cond_2
    const/4 v2, 0x1

    :goto_1
    move v14, v2

    goto :goto_2

    .line 798
    .end local v24    # "MONTH":I
    .local v3, "MONTH":I
    :cond_3
    move/from16 v24, v3

    .line 811
    .end local v3    # "MONTH":I
    .restart local v24    # "MONTH":I
    :cond_4
    :goto_2
    const/4 v3, 0x6

    const/4 v2, -0x1

    if-eq v11, v2, :cond_1e

    .line 812
    if-nez v11, :cond_5

    move v2, v13

    goto :goto_3

    :cond_5
    if-ne v11, v3, :cond_6

    const/4 v2, 0x3

    goto :goto_3

    :cond_6
    const/4 v2, 0x2

    :goto_3
    add-int v2, v16, v2

    .line 813
    .local v2, "m":I
    if-le v2, v1, :cond_7

    .line 814
    const/4 v11, -0x1

    .line 815
    move/from16 v34, v4

    move/from16 v3, v16

    goto/16 :goto_13

    .line 818
    :cond_7
    const/16 v31, 0x0

    move/from16 v3, v16

    .line 819
    .end local v16    # "i":I
    .local v3, "i":I
    .local v31, "value":I
    :goto_4
    if-ge v3, v2, :cond_a

    .line 820
    move/from16 v33, v2

    .end local v2    # "m":I
    .local v33, "m":I
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 821
    .local v2, "c":C
    move/from16 v34, v4

    .end local v4    # "DAY":I
    .local v34, "DAY":I
    const/16 v4, 0x30

    if-lt v2, v4, :cond_9

    const/16 v4, 0x39

    if-le v2, v4, :cond_8

    goto :goto_5

    .line 822
    :cond_8
    mul-int/lit8 v4, v31, 0xa

    add-int/lit8 v16, v2, -0x30

    add-int v31, v4, v16

    .line 819
    .end local v2    # "c":C
    add-int/lit8 v3, v3, 0x1

    move/from16 v2, v33

    move/from16 v4, v34

    goto :goto_4

    .line 821
    .restart local v2    # "c":C
    :cond_9
    :goto_5
    const/4 v11, -0x1

    goto/16 :goto_13

    .line 824
    .end local v33    # "m":I
    .end local v34    # "DAY":I
    .local v2, "m":I
    .restart local v4    # "DAY":I
    :cond_a
    move/from16 v33, v2

    move/from16 v34, v4

    .end local v2    # "m":I
    .end local v4    # "DAY":I
    .restart local v33    # "m":I
    .restart local v34    # "DAY":I
    aput v31, v12, v11

    .line 826
    if-ne v3, v1, :cond_c

    .line 828
    const/4 v2, 0x3

    if-eq v11, v2, :cond_b

    const/4 v2, 0x7

    if-eq v11, v2, :cond_b

    goto :goto_6

    .line 831
    :cond_b
    const/4 v11, -0x1

    .line 833
    :goto_6
    goto/16 :goto_13

    .line 836
    :cond_c
    add-int/lit8 v16, v3, 0x1

    .end local v3    # "i":I
    .restart local v16    # "i":I
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 837
    .local v2, "c":C
    const/16 v3, 0x5a

    if-ne v2, v3, :cond_e

    .line 839
    const/4 v3, 0x0

    const/4 v4, 0x7

    aput v3, v12, v4

    .line 840
    const/16 v4, 0x8

    aput v3, v12, v4

    .line 841
    const/4 v3, 0x4

    if-eq v11, v3, :cond_d

    const/4 v3, 0x5

    if-eq v11, v3, :cond_d

    const/4 v3, 0x6

    if-eq v11, v3, :cond_d

    .line 847
    const/4 v11, -0x1

    .line 849
    move/from16 v3, v16

    goto/16 :goto_13

    .line 845
    :cond_d
    move/from16 v3, v16

    goto/16 :goto_13

    .line 853
    :cond_e
    const/16 v3, 0x3a

    packed-switch v11, :pswitch_data_0

    const/16 v3, 0x54

    const/16 v4, 0x2b

    goto/16 :goto_10

    .line 883
    :pswitch_0
    const/4 v3, -0x1

    move v11, v3

    const/16 v3, 0x54

    const/16 v4, 0x2b

    .end local v11    # "state":I
    .local v3, "state":I
    goto/16 :goto_10

    .line 867
    .end local v3    # "state":I
    .restart local v11    # "state":I
    :pswitch_1
    if-eq v2, v3, :cond_f

    .line 869
    add-int/lit8 v16, v16, -0x1

    .line 871
    :cond_f
    const/16 v3, 0x8

    .line 872
    .end local v11    # "state":I
    .restart local v3    # "state":I
    move v11, v3

    const/16 v3, 0x54

    const/16 v4, 0x2b

    goto/16 :goto_10

    .line 880
    .end local v3    # "state":I
    .restart local v11    # "state":I
    :pswitch_2
    const/16 v3, 0x2b

    if-eq v2, v3, :cond_11

    const/16 v3, 0x2d

    if-ne v2, v3, :cond_10

    goto :goto_7

    :cond_10
    const/4 v3, -0x1

    goto :goto_8

    :cond_11
    :goto_7
    const/4 v3, 0x7

    .line 881
    .end local v11    # "state":I
    .restart local v3    # "state":I
    :goto_8
    move v11, v3

    const/16 v3, 0x54

    const/16 v4, 0x2b

    goto/16 :goto_10

    .line 877
    .end local v3    # "state":I
    .restart local v11    # "state":I
    :pswitch_3
    const/16 v3, 0x2e

    if-ne v2, v3, :cond_12

    const/16 v32, 0x6

    goto :goto_a

    :cond_12
    const/16 v3, 0x2b

    if-eq v2, v3, :cond_14

    const/16 v3, 0x2d

    if-ne v2, v3, :cond_13

    goto :goto_9

    :cond_13
    const/16 v32, -0x1

    goto :goto_a

    :cond_14
    :goto_9
    const/16 v32, 0x7

    :goto_a
    move/from16 v3, v32

    .line 878
    .end local v11    # "state":I
    .restart local v3    # "state":I
    move v11, v3

    const/16 v3, 0x54

    const/16 v4, 0x2b

    goto :goto_10

    .line 874
    .end local v3    # "state":I
    .restart local v11    # "state":I
    :pswitch_4
    const/16 v4, 0x2b

    if-ne v2, v3, :cond_15

    const/16 v26, 0x5

    goto :goto_c

    :cond_15
    if-eq v2, v4, :cond_17

    const/16 v3, 0x2d

    if-ne v2, v3, :cond_16

    goto :goto_b

    :cond_16
    const/16 v26, -0x1

    goto :goto_c

    :cond_17
    :goto_b
    const/16 v26, 0x7

    :goto_c
    move/from16 v3, v26

    .line 875
    .end local v11    # "state":I
    .restart local v3    # "state":I
    move v11, v3

    const/16 v3, 0x54

    goto :goto_10

    .line 862
    .end local v3    # "state":I
    .restart local v11    # "state":I
    :pswitch_5
    const/16 v4, 0x2b

    if-ne v2, v3, :cond_18

    const/16 v27, 0x4

    goto :goto_d

    :cond_18
    const/16 v27, -0x1

    :goto_d
    move/from16 v3, v27

    .line 863
    .end local v11    # "state":I
    .restart local v3    # "state":I
    move v11, v3

    const/16 v3, 0x54

    goto :goto_10

    .line 859
    .end local v3    # "state":I
    .restart local v11    # "state":I
    :pswitch_6
    const/16 v4, 0x2b

    const/16 v3, 0x54

    if-ne v2, v3, :cond_19

    const/16 v29, 0x3

    goto :goto_e

    :cond_19
    const/16 v29, -0x1

    :goto_e
    move/from16 v3, v29

    .line 860
    .end local v11    # "state":I
    .restart local v3    # "state":I
    move v11, v3

    const/16 v3, 0x54

    goto :goto_10

    .line 856
    .end local v3    # "state":I
    .restart local v11    # "state":I
    :pswitch_7
    const/16 v4, 0x2b

    const/16 v3, 0x2d

    if-ne v2, v3, :cond_1a

    add-int/lit8 v3, v11, 0x1

    move/from16 v29, v3

    const/16 v3, 0x54

    goto :goto_f

    :cond_1a
    const/16 v3, 0x54

    if-ne v2, v3, :cond_1b

    const/16 v29, 0x3

    goto :goto_f

    :cond_1b
    const/16 v29, -0x1

    :goto_f
    move/from16 v11, v29

    .line 857
    nop

    .line 886
    :goto_10
    const/4 v3, 0x7

    if-ne v11, v3, :cond_1d

    .line 888
    const/16 v3, 0x2d

    if-ne v2, v3, :cond_1c

    const/16 v20, -0x1

    goto :goto_11

    :cond_1c
    const/16 v20, 0x1

    :goto_11
    move/from16 v15, v20

    goto :goto_12

    .line 886
    :cond_1d
    const/16 v3, 0x2d

    .line 890
    .end local v2    # "c":C
    .end local v31    # "value":I
    .end local v33    # "m":I
    :goto_12
    move/from16 v4, v34

    goto/16 :goto_2

    .line 811
    .end local v34    # "DAY":I
    .restart local v4    # "DAY":I
    :cond_1e
    move/from16 v34, v4

    .end local v4    # "DAY":I
    .restart local v34    # "DAY":I
    move/from16 v3, v16

    .line 894
    .end local v16    # "i":I
    .local v3, "i":I
    :goto_13
    const/4 v2, -0x1

    if-eq v11, v2, :cond_27

    if-eq v3, v1, :cond_1f

    move/from16 v19, v1

    move/from16 v20, v3

    move/from16 v21, v5

    move/from16 v22, v6

    move/from16 v25, v7

    move/from16 v26, v8

    move/from16 v16, v9

    move/from16 v23, v10

    move/from16 v29, v11

    move-object/from16 v28, v12

    move/from16 v51, v13

    move/from16 v30, v14

    goto/16 :goto_16

    .line 897
    :cond_1f
    const/4 v2, 0x0

    aget v2, v12, v2

    const/4 v4, 0x1

    .local v2, "year":I
    aget v0, v12, v4

    const/4 v4, 0x2

    .local v0, "month":I
    aget v4, v12, v4

    .line 898
    .local v4, "day":I
    move/from16 v19, v1

    const/16 v16, 0x3

    .end local v1    # "len":I
    .local v19, "len":I
    aget v1, v12, v16

    move/from16 v20, v3

    const/16 v16, 0x4

    .end local v3    # "i":I
    .local v1, "hour":I
    .local v20, "i":I
    aget v3, v12, v16

    move/from16 v21, v5

    const/16 v16, 0x5

    .end local v5    # "HOUR":I
    .local v3, "min":I
    .local v21, "HOUR":I
    aget v5, v12, v16

    move/from16 v22, v6

    const/16 v16, 0x6

    .end local v6    # "MIN":I
    .local v5, "sec":I
    .local v22, "MIN":I
    aget v6, v12, v16

    .line 899
    .local v6, "msec":I
    move/from16 v25, v7

    const/16 v16, 0x7

    .end local v7    # "SEC":I
    .local v25, "SEC":I
    aget v7, v12, v16

    move/from16 v26, v8

    const/16 v16, 0x8

    .end local v8    # "MSEC":I
    .local v7, "tzhour":I
    .local v26, "MSEC":I
    aget v8, v12, v16

    .line 900
    .local v8, "tzmin":I
    move/from16 v16, v9

    .end local v9    # "TZHOUR":I
    .local v16, "TZHOUR":I
    const v9, 0x435e7

    if-gt v2, v9, :cond_26

    const/4 v9, 0x1

    if-lt v0, v9, :cond_26

    const/16 v9, 0xc

    if-gt v0, v9, :cond_26

    const/4 v9, 0x1

    if-lt v4, v9, :cond_26

    .line 902
    invoke-static {v2, v0}, Lcom/trendmicro/hippo/NativeDate;->DaysInMonth(II)I

    move-result v9

    if-gt v4, v9, :cond_25

    const/16 v9, 0x18

    if-gt v1, v9, :cond_25

    if-ne v1, v9, :cond_21

    if-gtz v3, :cond_20

    if-gtz v5, :cond_20

    if-gtz v6, :cond_20

    goto :goto_14

    :cond_20
    move/from16 v23, v10

    move/from16 v29, v11

    move-object/from16 v28, v12

    move/from16 v51, v13

    move/from16 v30, v14

    goto/16 :goto_16

    :cond_21
    :goto_14
    const/16 v9, 0x3b

    if-gt v3, v9, :cond_25

    if-gt v5, v9, :cond_25

    const/16 v9, 0x17

    if-gt v7, v9, :cond_25

    const/16 v9, 0x3b

    if-le v8, v9, :cond_22

    .line 910
    move/from16 v23, v10

    move/from16 v29, v11

    move-object/from16 v28, v12

    move/from16 v51, v13

    move/from16 v30, v14

    goto/16 :goto_16

    .line 913
    :cond_22
    mul-int v9, v2, v14

    move/from16 v23, v10

    .end local v10    # "TZMIN":I
    .local v23, "TZMIN":I
    int-to-double v9, v9

    move/from16 v27, v2

    .end local v2    # "year":I
    .local v27, "year":I
    add-int/lit8 v2, v0, -0x1

    move/from16 v29, v11

    move-object/from16 v28, v12

    .end local v11    # "state":I
    .end local v12    # "values":[I
    .local v28, "values":[I
    .local v29, "state":I
    int-to-double v11, v2

    move v2, v13

    move/from16 v30, v14

    .end local v13    # "yearlen":I
    .end local v14    # "yearmod":I
    .local v2, "yearlen":I
    .local v30, "yearmod":I
    int-to-double v13, v4

    move/from16 v31, v7

    move/from16 v32, v8

    .end local v7    # "tzhour":I
    .end local v8    # "tzmin":I
    .local v31, "tzhour":I
    .local v32, "tzmin":I
    int-to-double v7, v1

    move/from16 v33, v0

    move/from16 v49, v1

    .end local v0    # "month":I
    .end local v1    # "hour":I
    .local v33, "month":I
    .local v49, "hour":I
    int-to-double v0, v3

    move/from16 v51, v2

    move/from16 v50, v3

    .end local v2    # "yearlen":I
    .end local v3    # "min":I
    .local v50, "min":I
    .local v51, "yearlen":I
    int-to-double v2, v5

    move/from16 v52, v4

    move/from16 v53, v5

    .end local v4    # "day":I
    .end local v5    # "sec":I
    .local v52, "day":I
    .local v53, "sec":I
    int-to-double v4, v6

    move-wide/from16 v35, v9

    move-wide/from16 v37, v11

    move-wide/from16 v39, v13

    move-wide/from16 v41, v7

    move-wide/from16 v43, v0

    move-wide/from16 v45, v2

    move-wide/from16 v47, v4

    invoke-static/range {v35 .. v48}, Lcom/trendmicro/hippo/NativeDate;->date_msecFromDate(DDDDDDD)D

    move-result-wide v0

    .line 915
    .local v0, "date":D
    move/from16 v2, v31

    const/4 v3, -0x1

    .end local v31    # "tzhour":I
    .local v2, "tzhour":I
    if-ne v2, v3, :cond_23

    goto :goto_15

    .line 921
    :cond_23
    mul-int/lit8 v7, v2, 0x3c

    add-int v7, v7, v32

    int-to-double v3, v7

    const-wide v7, 0x40ed4c0000000000L    # 60000.0

    mul-double/2addr v3, v7

    int-to-double v7, v15

    mul-double/2addr v3, v7

    sub-double/2addr v0, v3

    .line 924
    :goto_15
    const-wide v3, -0x3cc14df73d240000L    # -8.64E15

    cmpg-double v3, v0, v3

    if-ltz v3, :cond_28

    const-wide v3, 0x433eb208c2dc0000L    # 8.64E15

    cmpl-double v3, v0, v3

    if-lez v3, :cond_24

    goto :goto_16

    .line 925
    :cond_24
    return-wide v0

    .line 902
    .end local v23    # "TZMIN":I
    .end local v27    # "year":I
    .end local v28    # "values":[I
    .end local v29    # "state":I
    .end local v30    # "yearmod":I
    .end local v32    # "tzmin":I
    .end local v33    # "month":I
    .end local v49    # "hour":I
    .end local v50    # "min":I
    .end local v51    # "yearlen":I
    .end local v52    # "day":I
    .end local v53    # "sec":I
    .local v0, "month":I
    .restart local v1    # "hour":I
    .local v2, "year":I
    .restart local v3    # "min":I
    .restart local v4    # "day":I
    .restart local v5    # "sec":I
    .restart local v7    # "tzhour":I
    .restart local v8    # "tzmin":I
    .restart local v10    # "TZMIN":I
    .restart local v11    # "state":I
    .restart local v12    # "values":[I
    .restart local v13    # "yearlen":I
    .restart local v14    # "yearmod":I
    :cond_25
    move/from16 v33, v0

    move/from16 v49, v1

    move/from16 v27, v2

    move/from16 v50, v3

    move/from16 v52, v4

    move/from16 v53, v5

    move v2, v7

    move/from16 v32, v8

    move/from16 v23, v10

    move/from16 v29, v11

    move-object/from16 v28, v12

    move/from16 v51, v13

    move/from16 v30, v14

    .end local v0    # "month":I
    .end local v1    # "hour":I
    .end local v3    # "min":I
    .end local v4    # "day":I
    .end local v5    # "sec":I
    .end local v7    # "tzhour":I
    .end local v8    # "tzmin":I
    .end local v10    # "TZMIN":I
    .end local v11    # "state":I
    .end local v12    # "values":[I
    .end local v13    # "yearlen":I
    .end local v14    # "yearmod":I
    .local v2, "tzhour":I
    .restart local v23    # "TZMIN":I
    .restart local v27    # "year":I
    .restart local v28    # "values":[I
    .restart local v29    # "state":I
    .restart local v30    # "yearmod":I
    .restart local v32    # "tzmin":I
    .restart local v33    # "month":I
    .restart local v49    # "hour":I
    .restart local v50    # "min":I
    .restart local v51    # "yearlen":I
    .restart local v52    # "day":I
    .restart local v53    # "sec":I
    goto :goto_16

    .line 900
    .end local v23    # "TZMIN":I
    .end local v27    # "year":I
    .end local v28    # "values":[I
    .end local v29    # "state":I
    .end local v30    # "yearmod":I
    .end local v32    # "tzmin":I
    .end local v33    # "month":I
    .end local v49    # "hour":I
    .end local v50    # "min":I
    .end local v51    # "yearlen":I
    .end local v52    # "day":I
    .end local v53    # "sec":I
    .restart local v0    # "month":I
    .restart local v1    # "hour":I
    .local v2, "year":I
    .restart local v3    # "min":I
    .restart local v4    # "day":I
    .restart local v5    # "sec":I
    .restart local v7    # "tzhour":I
    .restart local v8    # "tzmin":I
    .restart local v10    # "TZMIN":I
    .restart local v11    # "state":I
    .restart local v12    # "values":[I
    .restart local v13    # "yearlen":I
    .restart local v14    # "yearmod":I
    :cond_26
    move/from16 v33, v0

    move/from16 v49, v1

    move/from16 v27, v2

    move/from16 v50, v3

    move/from16 v52, v4

    move/from16 v53, v5

    move v2, v7

    move/from16 v32, v8

    move/from16 v23, v10

    move/from16 v29, v11

    move-object/from16 v28, v12

    move/from16 v51, v13

    move/from16 v30, v14

    .end local v0    # "month":I
    .end local v1    # "hour":I
    .end local v3    # "min":I
    .end local v4    # "day":I
    .end local v5    # "sec":I
    .end local v7    # "tzhour":I
    .end local v8    # "tzmin":I
    .end local v10    # "TZMIN":I
    .end local v11    # "state":I
    .end local v12    # "values":[I
    .end local v13    # "yearlen":I
    .end local v14    # "yearmod":I
    .local v2, "tzhour":I
    .restart local v23    # "TZMIN":I
    .restart local v27    # "year":I
    .restart local v28    # "values":[I
    .restart local v29    # "state":I
    .restart local v30    # "yearmod":I
    .restart local v32    # "tzmin":I
    .restart local v33    # "month":I
    .restart local v49    # "hour":I
    .restart local v50    # "min":I
    .restart local v51    # "yearlen":I
    .restart local v52    # "day":I
    .restart local v53    # "sec":I
    goto :goto_16

    .line 894
    .end local v2    # "tzhour":I
    .end local v16    # "TZHOUR":I
    .end local v19    # "len":I
    .end local v20    # "i":I
    .end local v21    # "HOUR":I
    .end local v22    # "MIN":I
    .end local v23    # "TZMIN":I
    .end local v25    # "SEC":I
    .end local v26    # "MSEC":I
    .end local v27    # "year":I
    .end local v28    # "values":[I
    .end local v29    # "state":I
    .end local v30    # "yearmod":I
    .end local v32    # "tzmin":I
    .end local v33    # "month":I
    .end local v49    # "hour":I
    .end local v50    # "min":I
    .end local v51    # "yearlen":I
    .end local v52    # "day":I
    .end local v53    # "sec":I
    .local v1, "len":I
    .local v3, "i":I
    .local v5, "HOUR":I
    .local v6, "MIN":I
    .local v7, "SEC":I
    .local v8, "MSEC":I
    .restart local v9    # "TZHOUR":I
    .restart local v10    # "TZMIN":I
    .restart local v11    # "state":I
    .restart local v12    # "values":[I
    .restart local v13    # "yearlen":I
    .restart local v14    # "yearmod":I
    :cond_27
    move/from16 v19, v1

    move/from16 v20, v3

    move/from16 v21, v5

    move/from16 v22, v6

    move/from16 v25, v7

    move/from16 v26, v8

    move/from16 v16, v9

    move/from16 v23, v10

    move/from16 v29, v11

    move-object/from16 v28, v12

    move/from16 v51, v13

    move/from16 v30, v14

    .line 929
    .end local v1    # "len":I
    .end local v3    # "i":I
    .end local v5    # "HOUR":I
    .end local v6    # "MIN":I
    .end local v7    # "SEC":I
    .end local v8    # "MSEC":I
    .end local v9    # "TZHOUR":I
    .end local v10    # "TZMIN":I
    .end local v11    # "state":I
    .end local v12    # "values":[I
    .end local v13    # "yearlen":I
    .end local v14    # "yearmod":I
    .restart local v16    # "TZHOUR":I
    .restart local v19    # "len":I
    .restart local v20    # "i":I
    .restart local v21    # "HOUR":I
    .restart local v22    # "MIN":I
    .restart local v23    # "TZMIN":I
    .restart local v25    # "SEC":I
    .restart local v26    # "MSEC":I
    .restart local v28    # "values":[I
    .restart local v29    # "state":I
    .restart local v30    # "yearmod":I
    .restart local v51    # "yearlen":I
    :cond_28
    :goto_16
    sget-wide v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :array_0
    .array-data 4
        0x7b2
        0x1
        0x1
        0x0
        0x0
        0x0
        0x0
        -0x1
        -0x1
    .end array-data
.end method

.method private static toLocale_helper(DI)Ljava/lang/String;
    .locals 4
    .param p0, "t"    # D
    .param p2, "methodId"    # I

    .line 1258
    const/4 v0, 0x5

    const/4 v1, 0x1

    if-eq p2, v0, :cond_4

    const/4 v0, 0x6

    if-eq p2, v0, :cond_2

    const/4 v0, 0x7

    if-ne p2, v0, :cond_1

    .line 1275
    sget-object v0, Lcom/trendmicro/hippo/NativeDate;->localeDateFormatter:Ljava/text/DateFormat;

    if-nez v0, :cond_0

    .line 1276
    nop

    .line 1277
    invoke-static {v1}, Ljava/text/DateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/NativeDate;->localeDateFormatter:Ljava/text/DateFormat;

    .line 1279
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/NativeDate;->localeDateFormatter:Ljava/text/DateFormat;

    .line 1280
    .local v0, "formatter":Ljava/text/DateFormat;
    goto :goto_0

    .line 1281
    .end local v0    # "formatter":Ljava/text/DateFormat;
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1268
    :cond_2
    sget-object v0, Lcom/trendmicro/hippo/NativeDate;->localeTimeFormatter:Ljava/text/DateFormat;

    if-nez v0, :cond_3

    .line 1269
    nop

    .line 1270
    invoke-static {v1}, Ljava/text/DateFormat;->getTimeInstance(I)Ljava/text/DateFormat;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/NativeDate;->localeTimeFormatter:Ljava/text/DateFormat;

    .line 1272
    :cond_3
    sget-object v0, Lcom/trendmicro/hippo/NativeDate;->localeTimeFormatter:Ljava/text/DateFormat;

    .line 1273
    .restart local v0    # "formatter":Ljava/text/DateFormat;
    goto :goto_0

    .line 1260
    .end local v0    # "formatter":Ljava/text/DateFormat;
    :cond_4
    sget-object v0, Lcom/trendmicro/hippo/NativeDate;->localeDateTimeFormatter:Ljava/text/DateFormat;

    if-nez v0, :cond_5

    .line 1261
    nop

    .line 1262
    invoke-static {v1, v1}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/NativeDate;->localeDateTimeFormatter:Ljava/text/DateFormat;

    .line 1265
    :cond_5
    sget-object v0, Lcom/trendmicro/hippo/NativeDate;->localeDateTimeFormatter:Ljava/text/DateFormat;

    .line 1266
    .restart local v0    # "formatter":Ljava/text/DateFormat;
    nop

    .line 1284
    :goto_0
    monitor-enter v0

    .line 1285
    :try_start_0
    new-instance v1, Ljava/util/Date;

    double-to-long v2, p0

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 1286
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 141
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    sget-object v3, Lcom/trendmicro/hippo/NativeDate;->DATE_TAG:Ljava/lang/Object;

    move-object/from16 v4, p1

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 142
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 144
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v3

    .line 145
    .local v3, "id":I
    const/4 v5, -0x3

    if-eq v3, v5, :cond_26

    const/4 v5, -0x2

    const/4 v6, 0x0

    if-eq v3, v5, :cond_25

    const/4 v5, -0x1

    if-eq v3, v5, :cond_24

    const/4 v5, 0x1

    if-eq v3, v5, :cond_22

    const/16 v7, 0x2f

    if-eq v3, v7, :cond_1c

    .line 204
    instance-of v7, v1, Lcom/trendmicro/hippo/NativeDate;

    if-eqz v7, :cond_1b

    .line 206
    move-object v7, v1

    check-cast v7, Lcom/trendmicro/hippo/NativeDate;

    .line 207
    .local v7, "realThis":Lcom/trendmicro/hippo/NativeDate;
    iget-wide v8, v7, Lcom/trendmicro/hippo/NativeDate;->date:D

    .line 209
    .local v8, "t":D
    const-string v10, "Invalid Date"

    const-wide v11, 0x409db00000000000L    # 1900.0

    packed-switch v3, :pswitch_data_0

    .line 380
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 374
    :pswitch_0
    cmpl-double v5, v8, v8

    if-nez v5, :cond_1

    .line 375
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->js_toISOString(D)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 377
    :cond_1
    const-string v5, "msg.invalid.date"

    invoke-static {v5}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 378
    .local v5, "msg":Ljava/lang/String;
    const-string v6, "RangeError"

    invoke-static {v6, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v6

    throw v6

    .line 349
    .end local v5    # "msg":Ljava/lang/String;
    :pswitch_1
    invoke-static {v2, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v5

    .line 351
    .local v5, "year":D
    cmpl-double v10, v5, v5

    if-nez v10, :cond_5

    invoke-static {v5, v6}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v10

    if-eqz v10, :cond_2

    goto :goto_1

    .line 354
    :cond_2
    cmpl-double v10, v8, v8

    if-eqz v10, :cond_3

    .line 355
    const-wide/16 v8, 0x0

    goto :goto_0

    .line 357
    :cond_3
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v8

    .line 360
    :goto_0
    const-wide/16 v13, 0x0

    cmpl-double v10, v5, v13

    if-ltz v10, :cond_4

    const-wide v13, 0x4058c00000000000L    # 99.0

    cmpg-double v10, v5, v13

    if-gtz v10, :cond_4

    .line 361
    add-double/2addr v5, v11

    .line 363
    :cond_4
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->MonthFromTime(D)I

    move-result v10

    int-to-double v12, v10

    .line 364
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->DateFromTime(D)I

    move-result v10

    int-to-double v14, v10

    .line 363
    move-wide v10, v5

    invoke-static/range {v10 .. v15}, Lcom/trendmicro/hippo/NativeDate;->MakeDay(DDD)D

    move-result-wide v10

    .line 365
    .local v10, "day":D
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->TimeWithinDay(D)D

    move-result-wide v12

    invoke-static {v10, v11, v12, v13}, Lcom/trendmicro/hippo/NativeDate;->MakeDate(DD)D

    move-result-wide v8

    .line 366
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->internalUTC(D)D

    move-result-wide v8

    .line 367
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->TimeClip(D)D

    move-result-wide v8

    goto :goto_2

    .line 352
    .end local v10    # "day":D
    :cond_5
    :goto_1
    sget-wide v8, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    .line 370
    .end local v5    # "year":D
    :goto_2
    iput-wide v8, v7, Lcom/trendmicro/hippo/NativeDate;->date:D

    .line 371
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 343
    :pswitch_2
    invoke-static {v8, v9, v2, v3}, Lcom/trendmicro/hippo/NativeDate;->makeDate(D[Ljava/lang/Object;I)D

    move-result-wide v5

    .line 344
    .end local v8    # "t":D
    .local v5, "t":D
    iput-wide v5, v7, Lcom/trendmicro/hippo/NativeDate;->date:D

    .line 345
    invoke-static {v5, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v8

    return-object v8

    .line 333
    .end local v5    # "t":D
    .restart local v8    # "t":D
    :pswitch_3
    invoke-static {v8, v9, v2, v3}, Lcom/trendmicro/hippo/NativeDate;->makeTime(D[Ljava/lang/Object;I)D

    move-result-wide v5

    .line 334
    .end local v8    # "t":D
    .restart local v5    # "t":D
    iput-wide v5, v7, Lcom/trendmicro/hippo/NativeDate;->date:D

    .line 335
    invoke-static {v5, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v8

    return-object v8

    .line 321
    .end local v5    # "t":D
    .restart local v8    # "t":D
    :pswitch_4
    invoke-static {v2, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v5

    invoke-static {v5, v6}, Lcom/trendmicro/hippo/NativeDate;->TimeClip(D)D

    move-result-wide v5

    .line 322
    .end local v8    # "t":D
    .restart local v5    # "t":D
    iput-wide v5, v7, Lcom/trendmicro/hippo/NativeDate;->date:D

    .line 323
    invoke-static {v5, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v8

    return-object v8

    .line 315
    .end local v5    # "t":D
    .restart local v8    # "t":D
    :pswitch_5
    cmpl-double v5, v8, v8

    if-nez v5, :cond_6

    .line 316
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v5

    sub-double v5, v8, v5

    const-wide v10, 0x40ed4c0000000000L    # 60000.0

    div-double v8, v5, v10

    .line 318
    :cond_6
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 308
    :pswitch_6
    cmpl-double v5, v8, v8

    if-nez v5, :cond_8

    .line 309
    const/16 v5, 0x1b

    if-ne v3, v5, :cond_7

    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v8

    .line 310
    :cond_7
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->msFromTime(D)I

    move-result v5

    int-to-double v8, v5

    .line 312
    :cond_8
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 300
    :pswitch_7
    cmpl-double v5, v8, v8

    if-nez v5, :cond_a

    .line 301
    const/16 v5, 0x19

    if-ne v3, v5, :cond_9

    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v8

    .line 302
    :cond_9
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->SecFromTime(D)I

    move-result v5

    int-to-double v8, v5

    .line 304
    :cond_a
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 292
    :pswitch_8
    cmpl-double v5, v8, v8

    if-nez v5, :cond_c

    .line 293
    const/16 v5, 0x17

    if-ne v3, v5, :cond_b

    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v8

    .line 294
    :cond_b
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->MinFromTime(D)I

    move-result v5

    int-to-double v8, v5

    .line 296
    :cond_c
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 284
    :pswitch_9
    cmpl-double v5, v8, v8

    if-nez v5, :cond_e

    .line 285
    const/16 v5, 0x15

    if-ne v3, v5, :cond_d

    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v8

    .line 286
    :cond_d
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->HourFromTime(D)I

    move-result v5

    int-to-double v8, v5

    .line 288
    :cond_e
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 276
    :pswitch_a
    cmpl-double v5, v8, v8

    if-nez v5, :cond_10

    .line 277
    const/16 v5, 0x13

    if-ne v3, v5, :cond_f

    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v8

    .line 278
    :cond_f
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->WeekDay(D)I

    move-result v5

    int-to-double v8, v5

    .line 280
    :cond_10
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 268
    :pswitch_b
    cmpl-double v5, v8, v8

    if-nez v5, :cond_12

    .line 269
    const/16 v5, 0x11

    if-ne v3, v5, :cond_11

    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v8

    .line 270
    :cond_11
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->DateFromTime(D)I

    move-result v5

    int-to-double v8, v5

    .line 272
    :cond_12
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 260
    :pswitch_c
    cmpl-double v5, v8, v8

    if-nez v5, :cond_14

    .line 261
    const/16 v5, 0xf

    if-ne v3, v5, :cond_13

    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v8

    .line 262
    :cond_13
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->MonthFromTime(D)I

    move-result v5

    int-to-double v8, v5

    .line 264
    :cond_14
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 243
    :pswitch_d
    cmpl-double v6, v8, v8

    if-nez v6, :cond_17

    .line 244
    const/16 v6, 0xe

    if-eq v3, v6, :cond_15

    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->LocalTime(D)D

    move-result-wide v8

    .line 245
    :cond_15
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->YearFromTime(D)I

    move-result v6

    int-to-double v8, v6

    .line 246
    const/16 v6, 0xc

    if-ne v3, v6, :cond_17

    .line 247
    invoke-virtual {v0, v5}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 248
    cmpg-double v5, v11, v8

    if-gtz v5, :cond_17

    const-wide v5, 0x409f400000000000L    # 2000.0

    cmpg-double v5, v8, v5

    if-gez v5, :cond_17

    .line 249
    sub-double/2addr v8, v11

    goto :goto_3

    .line 252
    :cond_16
    sub-double/2addr v8, v11

    .line 256
    :cond_17
    :goto_3
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 238
    :pswitch_e
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 234
    :pswitch_f
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "(new Date("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v8, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "))"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 228
    :pswitch_10
    cmpl-double v5, v8, v8

    if-nez v5, :cond_18

    .line 229
    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeDate;->js_toUTCString(D)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 231
    :cond_18
    return-object v10

    .line 222
    :pswitch_11
    cmpl-double v5, v8, v8

    if-nez v5, :cond_19

    .line 223
    invoke-static {v8, v9, v3}, Lcom/trendmicro/hippo/NativeDate;->toLocale_helper(DI)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 225
    :cond_19
    return-object v10

    .line 214
    :pswitch_12
    cmpl-double v5, v8, v8

    if-nez v5, :cond_1a

    .line 215
    invoke-static {v8, v9, v3}, Lcom/trendmicro/hippo/NativeDate;->date_format(DI)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 217
    :cond_1a
    return-object v10

    .line 205
    .end local v7    # "realThis":Lcom/trendmicro/hippo/NativeDate;
    .end local v8    # "t":D
    :cond_1b
    invoke-static/range {p1 .. p1}, Lcom/trendmicro/hippo/NativeDate;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v5

    throw v5

    .line 169
    :cond_1c
    const-string v5, "toISOString"

    .line 171
    .local v5, "toISOString":Ljava/lang/String;
    invoke-static/range {p2 .. p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v6

    .line 172
    .local v6, "o":Lcom/trendmicro/hippo/Scriptable;
    sget-object v7, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-static {v6, v7}, Lcom/trendmicro/hippo/ScriptRuntime;->toPrimitive(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    .line 173
    .local v7, "tv":Ljava/lang/Object;
    instance-of v8, v7, Ljava/lang/Number;

    if-eqz v8, :cond_1e

    .line 174
    move-object v8, v7

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v8

    .line 175
    .local v8, "d":D
    cmpl-double v10, v8, v8

    if-nez v10, :cond_1d

    invoke-static {v8, v9}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v10

    if-eqz v10, :cond_1e

    .line 176
    :cond_1d
    const/4 v10, 0x0

    return-object v10

    .line 179
    .end local v8    # "d":D
    :cond_1e
    const-string v8, "toISOString"

    invoke-static {v6, v8}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 180
    .local v9, "toISO":Ljava/lang/Object;
    sget-object v10, Lcom/trendmicro/hippo/NativeDate;->NOT_FOUND:Ljava/lang/Object;

    if-eq v9, v10, :cond_21

    .line 185
    instance-of v10, v9, Lcom/trendmicro/hippo/Callable;

    if-eqz v10, :cond_20

    .line 191
    move-object v8, v9

    check-cast v8, Lcom/trendmicro/hippo/Callable;

    sget-object v10, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    move-object/from16 v11, p3

    invoke-interface {v8, v0, v11, v6, v10}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 193
    .local v8, "result":Ljava/lang/Object;
    invoke-static {v8}, Lcom/trendmicro/hippo/ScriptRuntime;->isPrimitive(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1f

    .line 197
    return-object v8

    .line 194
    :cond_1f
    nop

    .line 195
    invoke-static {v8}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 194
    const-string v12, "msg.toisostring.must.return.primitive"

    invoke-static {v12, v10}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v10

    throw v10

    .line 186
    .end local v8    # "result":Ljava/lang/Object;
    :cond_20
    move-object/from16 v11, p3

    .line 188
    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 189
    invoke-static {v9}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 186
    const-string v13, "msg.isnt.function.in"

    invoke-static {v13, v8, v10, v12}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v8

    throw v8

    .line 181
    :cond_21
    move-object/from16 v11, p3

    .line 183
    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 181
    const-string v12, "msg.function.not.found.in"

    invoke-static {v12, v8, v10}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v8

    throw v8

    .line 162
    .end local v5    # "toISOString":Ljava/lang/String;
    .end local v6    # "o":Lcom/trendmicro/hippo/Scriptable;
    .end local v7    # "tv":Ljava/lang/Object;
    .end local v9    # "toISO":Ljava/lang/Object;
    :cond_22
    move-object/from16 v11, p3

    if-eqz v1, :cond_23

    .line 163
    invoke-static {}, Lcom/trendmicro/hippo/NativeDate;->now()D

    move-result-wide v5

    const/4 v7, 0x2

    invoke-static {v5, v6, v7}, Lcom/trendmicro/hippo/NativeDate;->date_format(DI)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 164
    :cond_23
    invoke-static/range {p5 .. p5}, Lcom/trendmicro/hippo/NativeDate;->jsConstructor([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    return-object v5

    .line 156
    :cond_24
    move-object/from16 v11, p3

    invoke-static/range {p5 .. p5}, Lcom/trendmicro/hippo/NativeDate;->jsStaticFunction_UTC([Ljava/lang/Object;)D

    move-result-wide v5

    invoke-static {v5, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 151
    :cond_25
    move-object/from16 v11, p3

    invoke-static {v2, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v5

    .line 152
    .local v5, "dataStr":Ljava/lang/String;
    invoke-static {v5}, Lcom/trendmicro/hippo/NativeDate;->date_parseString(Ljava/lang/String;)D

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v6

    return-object v6

    .line 147
    .end local v5    # "dataStr":Ljava/lang/String;
    :cond_26
    move-object/from16 v11, p3

    invoke-static {}, Lcom/trendmicro/hippo/NativeDate;->now()D

    move-result-wide v5

    invoke-static {v5, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_12
        :pswitch_12
        :pswitch_12
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_e
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_c
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_9
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V
    .locals 12
    .param p1, "ctor"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 70
    sget-object v2, Lcom/trendmicro/hippo/NativeDate;->DATE_TAG:Ljava/lang/Object;

    const/4 v3, -0x3

    const-string v4, "now"

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeDate;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 72
    sget-object v8, Lcom/trendmicro/hippo/NativeDate;->DATE_TAG:Ljava/lang/Object;

    const/4 v9, -0x2

    const-string v10, "parse"

    const/4 v11, 0x1

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeDate;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 74
    sget-object v2, Lcom/trendmicro/hippo/NativeDate;->DATE_TAG:Ljava/lang/Object;

    const/4 v3, -0x1

    const-string v4, "UTC"

    const/4 v5, 0x7

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeDate;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 76
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V

    .line 77
    return-void
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 12
    .param p1, "s"    # Ljava/lang/String;

    .line 1604
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 1605
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x53

    const/16 v4, 0x54

    const/16 v5, 0x44

    const/4 v6, 0x3

    const/16 v7, 0x4d

    const/16 v8, 0x74

    const/16 v9, 0x73

    const/16 v10, 0x67

    const/4 v11, 0x0

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 1703
    :pswitch_1
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1704
    .local v2, "c":I
    if-ne v2, v10, :cond_0

    const-string v1, "getUTCMilliseconds"

    const/16 v0, 0x1c

    goto/16 :goto_0

    .line 1705
    :cond_0
    if-ne v2, v9, :cond_1

    const-string v1, "setUTCMilliseconds"

    const/16 v0, 0x20

    goto/16 :goto_0

    .line 1706
    :cond_1
    if-ne v2, v8, :cond_24

    .line 1707
    const/16 v3, 0x8

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1708
    if-ne v2, v5, :cond_2

    const-string v1, "toLocaleDateString"

    const/4 v0, 0x7

    goto/16 :goto_0

    .line 1709
    :cond_2
    if-ne v2, v4, :cond_24

    const-string v1, "toLocaleTimeString"

    const/4 v0, 0x6

    goto/16 :goto_0

    .line 1702
    .end local v2    # "c":I
    :pswitch_2
    const-string v1, "getTimezoneOffset"

    const/16 v0, 0x1d

    goto/16 :goto_0

    .line 1698
    :pswitch_3
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1699
    .restart local v2    # "c":I
    if-ne v2, v10, :cond_3

    const-string v1, "getMilliseconds"

    const/16 v0, 0x1b

    goto/16 :goto_0

    .line 1700
    :cond_3
    if-ne v2, v9, :cond_24

    const-string v1, "setMilliseconds"

    const/16 v0, 0x1f

    goto/16 :goto_0

    .line 1693
    .end local v2    # "c":I
    :pswitch_4
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1694
    .restart local v2    # "c":I
    if-ne v2, v10, :cond_4

    const-string v1, "getUTCFullYear"

    const/16 v0, 0xe

    goto/16 :goto_0

    .line 1695
    :cond_4
    if-ne v2, v9, :cond_5

    const-string v1, "setUTCFullYear"

    const/16 v0, 0x2c

    goto/16 :goto_0

    .line 1696
    :cond_5
    if-ne v2, v8, :cond_24

    const-string v1, "toLocaleString"

    const/4 v0, 0x5

    goto/16 :goto_0

    .line 1681
    .end local v2    # "c":I
    :pswitch_5
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1682
    .restart local v2    # "c":I
    const/4 v4, 0x6

    if-ne v2, v10, :cond_7

    .line 1683
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1684
    if-ne v2, v7, :cond_6

    const-string v1, "getUTCMinutes"

    const/16 v0, 0x18

    goto/16 :goto_0

    .line 1685
    :cond_6
    if-ne v2, v3, :cond_24

    const-string v1, "getUTCSeconds"

    const/16 v0, 0x1a

    goto/16 :goto_0

    .line 1687
    :cond_7
    if-ne v2, v9, :cond_24

    .line 1688
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1689
    if-ne v2, v7, :cond_8

    const-string v1, "setUTCMinutes"

    const/16 v0, 0x24

    goto/16 :goto_0

    .line 1690
    :cond_8
    if-ne v2, v3, :cond_24

    const-string v1, "setUTCSeconds"

    const/16 v0, 0x22

    goto/16 :goto_0

    .line 1677
    .end local v2    # "c":I
    :pswitch_6
    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1678
    .restart local v2    # "c":I
    if-ne v2, v5, :cond_9

    const-string v1, "toDateString"

    const/4 v0, 0x4

    goto/16 :goto_0

    .line 1679
    :cond_9
    if-ne v2, v4, :cond_24

    const-string v1, "toTimeString"

    const/4 v0, 0x3

    goto/16 :goto_0

    .line 1655
    .end local v2    # "c":I
    :pswitch_7
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x46

    if-eq v2, v3, :cond_f

    if-eq v2, v7, :cond_e

    if-eq v2, v9, :cond_d

    packed-switch v2, :pswitch_data_1

    .line 1676
    goto/16 :goto_0

    .line 1663
    :pswitch_8
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1664
    .restart local v2    # "c":I
    const/16 v3, 0x72

    const/16 v4, 0x9

    if-ne v2, v10, :cond_b

    .line 1665
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1666
    if-ne v2, v3, :cond_a

    const-string v1, "getUTCHours"

    const/16 v0, 0x16

    goto/16 :goto_0

    .line 1667
    :cond_a
    if-ne v2, v8, :cond_24

    const-string v1, "getUTCMonth"

    const/16 v0, 0x10

    goto/16 :goto_0

    .line 1669
    :cond_b
    if-ne v2, v9, :cond_24

    .line 1670
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1671
    if-ne v2, v3, :cond_c

    const-string v1, "setUTCHours"

    const/16 v0, 0x26

    goto/16 :goto_0

    .line 1672
    :cond_c
    if-ne v2, v8, :cond_24

    const-string v1, "setUTCMonth"

    const/16 v0, 0x2a

    goto/16 :goto_0

    .line 1662
    .end local v2    # "c":I
    :pswitch_9
    const-string v1, "toUTCString"

    const/16 v0, 0x8

    goto/16 :goto_0

    .line 1661
    :pswitch_a
    const-string v1, "toISOString"

    const/16 v0, 0x2e

    goto/16 :goto_0

    .line 1675
    :cond_d
    const-string v1, "constructor"

    const/4 v0, 0x1

    goto/16 :goto_0

    .line 1660
    :cond_e
    const-string v1, "toGMTString"

    const/16 v0, 0x8

    goto/16 :goto_0

    .line 1656
    :cond_f
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1657
    .restart local v2    # "c":I
    if-ne v2, v10, :cond_10

    const-string v1, "getFullYear"

    const/16 v0, 0xd

    goto/16 :goto_0

    .line 1658
    :cond_10
    if-ne v2, v9, :cond_24

    const-string v1, "setFullYear"

    const/16 v0, 0x2b

    goto/16 :goto_0

    .line 1638
    .end local v2    # "c":I
    :pswitch_b
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1639
    .restart local v2    # "c":I
    if-ne v2, v7, :cond_12

    .line 1640
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1641
    if-ne v2, v10, :cond_11

    const-string v1, "getMinutes"

    const/16 v0, 0x17

    goto/16 :goto_0

    .line 1642
    :cond_11
    if-ne v2, v9, :cond_24

    const-string v1, "setMinutes"

    const/16 v0, 0x23

    goto/16 :goto_0

    .line 1644
    :cond_12
    if-ne v2, v3, :cond_14

    .line 1645
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1646
    if-ne v2, v10, :cond_13

    const-string v1, "getSeconds"

    const/16 v0, 0x19

    goto/16 :goto_0

    .line 1647
    :cond_13
    if-ne v2, v9, :cond_24

    const-string v1, "setSeconds"

    const/16 v0, 0x21

    goto/16 :goto_0

    .line 1649
    :cond_14
    const/16 v3, 0x55

    if-ne v2, v3, :cond_24

    .line 1650
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1651
    if-ne v2, v10, :cond_15

    const-string v1, "getUTCDate"

    const/16 v0, 0x12

    goto/16 :goto_0

    .line 1652
    :cond_15
    if-ne v2, v9, :cond_24

    const-string v1, "setUTCDate"

    const/16 v0, 0x28

    goto/16 :goto_0

    .line 1637
    .end local v2    # "c":I
    :pswitch_c
    const-string v1, "getUTCDay"

    const/16 v0, 0x14

    goto/16 :goto_0

    .line 1625
    :pswitch_d
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x48

    if-eq v2, v3, :cond_1a

    if-eq v2, v7, :cond_18

    const/16 v3, 0x6f

    if-eq v2, v3, :cond_17

    if-eq v2, v8, :cond_16

    .line 1636
    goto/16 :goto_0

    .line 1635
    :cond_16
    const-string v1, "toString"

    const/4 v0, 0x2

    goto/16 :goto_0

    .line 1634
    :cond_17
    const-string v1, "toSource"

    const/16 v0, 0x9

    goto/16 :goto_0

    .line 1630
    :cond_18
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1631
    .restart local v2    # "c":I
    if-ne v2, v10, :cond_19

    const-string v1, "getMonth"

    const/16 v0, 0xf

    goto/16 :goto_0

    .line 1632
    :cond_19
    if-ne v2, v9, :cond_24

    const-string v1, "setMonth"

    const/16 v0, 0x29

    goto/16 :goto_0

    .line 1626
    .end local v2    # "c":I
    :cond_1a
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1627
    .restart local v2    # "c":I
    if-ne v2, v10, :cond_1b

    const-string v1, "getHours"

    const/16 v0, 0x15

    goto/16 :goto_0

    .line 1628
    :cond_1b
    if-ne v2, v9, :cond_24

    const-string v1, "setHours"

    const/16 v0, 0x25

    goto :goto_0

    .line 1610
    .end local v2    # "c":I
    :pswitch_e
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v5, :cond_21

    if-eq v2, v4, :cond_1f

    const/16 v3, 0x59

    if-eq v2, v3, :cond_1d

    const/16 v3, 0x75

    if-eq v2, v3, :cond_1c

    .line 1624
    goto :goto_0

    .line 1623
    :cond_1c
    const-string v1, "valueOf"

    const/16 v0, 0xa

    goto :goto_0

    .line 1619
    :cond_1d
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1620
    .restart local v2    # "c":I
    if-ne v2, v10, :cond_1e

    const-string v1, "getYear"

    const/16 v0, 0xc

    goto :goto_0

    .line 1621
    :cond_1e
    if-ne v2, v9, :cond_24

    const-string v1, "setYear"

    const/16 v0, 0x2d

    goto :goto_0

    .line 1615
    .end local v2    # "c":I
    :cond_1f
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1616
    .restart local v2    # "c":I
    if-ne v2, v10, :cond_20

    const-string v1, "getTime"

    const/16 v0, 0xb

    goto :goto_0

    .line 1617
    :cond_20
    if-ne v2, v9, :cond_24

    const-string v1, "setTime"

    const/16 v0, 0x1e

    goto :goto_0

    .line 1611
    .end local v2    # "c":I
    :cond_21
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1612
    .restart local v2    # "c":I
    if-ne v2, v10, :cond_22

    const-string v1, "getDate"

    const/16 v0, 0x11

    goto :goto_0

    .line 1613
    :cond_22
    if-ne v2, v9, :cond_24

    const-string v1, "setDate"

    const/16 v0, 0x27

    goto :goto_0

    .line 1606
    .end local v2    # "c":I
    :pswitch_f
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1607
    .restart local v2    # "c":I
    if-ne v2, v10, :cond_23

    const-string v1, "getDay"

    const/16 v0, 0x13

    goto :goto_0

    .line 1608
    :cond_23
    if-ne v2, v8, :cond_24

    const-string v1, "toJSON"

    const/16 v0, 0x2f

    .line 1713
    .end local v2    # "c":I
    :cond_24
    :goto_0
    if-eqz v1, :cond_25

    if-eq v1, p1, :cond_25

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_25

    const/4 v0, 0x0

    .line 1717
    .end local v1    # "X":Ljava/lang/String;
    :cond_25
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x53
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 51
    const-string v0, "Date"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 57
    .local p1, "typeHint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 58
    sget-object p1, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    .line 59
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getJSTimeValue()D
    .locals 2

    .line 64
    iget-wide v0, p0, Lcom/trendmicro/hippo/NativeDate;->date:D

    return-wide v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 84
    packed-switch p1, :pswitch_data_0

    .line 132
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :pswitch_0
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "toJSON"

    .local v1, "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 130
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toISOString"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 129
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "setYear"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 128
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x3

    .restart local v0    # "arity":I
    const-string v1, "setUTCFullYear"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 127
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x3

    .restart local v0    # "arity":I
    const-string v1, "setFullYear"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 126
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setUTCMonth"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 125
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setMonth"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 124
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "setUTCDate"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 123
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_8
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "setDate"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 122
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_9
    const/4 v0, 0x4

    .restart local v0    # "arity":I
    const-string v1, "setUTCHours"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 121
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_a
    const/4 v0, 0x4

    .restart local v0    # "arity":I
    const-string v1, "setHours"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 120
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_b
    const/4 v0, 0x3

    .restart local v0    # "arity":I
    const-string v1, "setUTCMinutes"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 119
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_c
    const/4 v0, 0x3

    .restart local v0    # "arity":I
    const-string v1, "setMinutes"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 118
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_d
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setUTCSeconds"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 117
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_e
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setSeconds"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 116
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_f
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "setUTCMilliseconds"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 115
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_10
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "setMilliseconds"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 114
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_11
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "setTime"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 113
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_12
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getTimezoneOffset"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 112
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_13
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getUTCMilliseconds"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 111
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_14
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getMilliseconds"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 110
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_15
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getUTCSeconds"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 109
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getSeconds"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 108
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_17
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getUTCMinutes"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 107
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_18
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getMinutes"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 106
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_19
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getUTCHours"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 105
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getHours"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 104
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1b
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getUTCDay"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 103
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1c
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getDay"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 102
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1d
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getUTCDate"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 101
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getDate"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 100
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1f
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getUTCMonth"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 99
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_20
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getMonth"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 98
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_21
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getUTCFullYear"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 97
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getFullYear"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 96
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_23
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getYear"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 95
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_24
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getTime"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 94
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_25
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "valueOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 93
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_26
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 92
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_27
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toUTCString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 91
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_28
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLocaleDateString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 90
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_29
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLocaleTimeString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 89
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLocaleString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 88
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2b
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toDateString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 87
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2c
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toTimeString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 86
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2d
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 85
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2e
    const/4 v0, 0x7

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 134
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/NativeDate;->DATE_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeDate;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 135
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
