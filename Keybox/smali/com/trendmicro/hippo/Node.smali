.class public Lcom/trendmicro/hippo/Node;
.super Ljava/lang/Object;
.source "Node.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/Node$NodeIterator;,
        Lcom/trendmicro/hippo/Node$PropListItem;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/trendmicro/hippo/Node;",
        ">;"
    }
.end annotation


# static fields
.field public static final ARROW_FUNCTION_PROP:I = 0x1b

.field public static final ATTRIBUTE_FLAG:I = 0x2

.field public static final BOTH:I = 0x0

.field public static final CASEARRAY_PROP:I = 0x5

.field public static final CATCH_SCOPE_PROP:I = 0xe

.field public static final CONTROL_BLOCK_PROP:I = 0x12

.field public static final DECR_FLAG:I = 0x1

.field public static final DESCENDANTS_FLAG:I = 0x4

.field public static final DESTRUCTURING_ARRAY_LENGTH:I = 0x15

.field public static final DESTRUCTURING_NAMES:I = 0x16

.field public static final DESTRUCTURING_PARAMS:I = 0x17

.field public static final DESTRUCTURING_SHORTHAND:I = 0x1a

.field public static final DIRECTCALL_PROP:I = 0x9

.field public static final END_DROPS_OFF:I = 0x1

.field public static final END_RETURNS:I = 0x2

.field public static final END_RETURNS_VALUE:I = 0x4

.field public static final END_UNREACHED:I = 0x0

.field public static final END_YIELDS:I = 0x8

.field public static final EXPRESSION_CLOSURE_PROP:I = 0x19

.field public static final FUNCTION_PROP:I = 0x1

.field public static final GENERATOR_END_PROP:I = 0x14

.field public static final INCRDECR_PROP:I = 0xd

.field public static final ISNUMBER_PROP:I = 0x8

.field public static final JSDOC_PROP:I = 0x18

.field public static final LABEL_ID_PROP:I = 0xf

.field public static final LAST_PROP:I = 0x1b

.field public static final LEFT:I = 0x1

.field public static final LOCAL_BLOCK_PROP:I = 0x3

.field public static final LOCAL_PROP:I = 0x2

.field public static final MEMBER_TYPE_PROP:I = 0x10

.field public static final NAME_PROP:I = 0x11

.field public static final NON_SPECIALCALL:I = 0x0

.field private static final NOT_SET:Lcom/trendmicro/hippo/Node;

.field public static final OBJECT_IDS_PROP:I = 0xc

.field public static final PARENTHESIZED_PROP:I = 0x13

.field public static final POST_FLAG:I = 0x2

.field public static final PROPERTY_FLAG:I = 0x1

.field public static final REGEXP_PROP:I = 0x4

.field public static final RIGHT:I = 0x2

.field public static final SKIP_INDEXES_PROP:I = 0xb

.field public static final SPECIALCALL_EVAL:I = 0x1

.field public static final SPECIALCALL_PROP:I = 0xa

.field public static final SPECIALCALL_WITH:I = 0x2

.field public static final TARGETBLOCK_PROP:I = 0x6

.field public static final VARIABLE_PROP:I = 0x7


# instance fields
.field protected first:Lcom/trendmicro/hippo/Node;

.field protected last:Lcom/trendmicro/hippo/Node;

.field protected lineno:I

.field protected next:Lcom/trendmicro/hippo/Node;

.field protected propListHead:Lcom/trendmicro/hippo/Node$PropListItem;

.field protected type:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 341
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    sput-object v0, Lcom/trendmicro/hippo/Node;->NOT_SET:Lcom/trendmicro/hippo/Node;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "nodeType"    # I

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1280
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    .line 1284
    iput v0, p0, Lcom/trendmicro/hippo/Node;->lineno:I

    .line 99
    iput p1, p0, Lcom/trendmicro/hippo/Node;->type:I

    .line 100
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "nodeType"    # I
    .param p2, "line"    # I

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1280
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    .line 1284
    iput v0, p0, Lcom/trendmicro/hippo/Node;->lineno:I

    .line 126
    iput p1, p0, Lcom/trendmicro/hippo/Node;->type:I

    .line 127
    iput p2, p0, Lcom/trendmicro/hippo/Node;->lineno:I

    .line 128
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/Node;)V
    .locals 1
    .param p1, "nodeType"    # I
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1280
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    .line 1284
    iput v0, p0, Lcom/trendmicro/hippo/Node;->lineno:I

    .line 103
    iput p1, p0, Lcom/trendmicro/hippo/Node;->type:I

    .line 104
    iput-object p2, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    iput-object p2, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .line 105
    const/4 v0, 0x0

    iput-object v0, p2, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 106
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/Node;I)V
    .locals 0
    .param p1, "nodeType"    # I
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;
    .param p3, "line"    # I

    .line 131
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 132
    iput p3, p0, Lcom/trendmicro/hippo/Node;->lineno:I

    .line 133
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 1
    .param p1, "nodeType"    # I
    .param p2, "left"    # Lcom/trendmicro/hippo/Node;
    .param p3, "right"    # Lcom/trendmicro/hippo/Node;

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1280
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    .line 1284
    iput v0, p0, Lcom/trendmicro/hippo/Node;->lineno:I

    .line 109
    iput p1, p0, Lcom/trendmicro/hippo/Node;->type:I

    .line 110
    iput-object p2, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .line 111
    iput-object p3, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    .line 112
    iput-object p3, p2, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 113
    const/4 v0, 0x0

    iput-object v0, p3, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 114
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)V
    .locals 0
    .param p1, "nodeType"    # I
    .param p2, "left"    # Lcom/trendmicro/hippo/Node;
    .param p3, "right"    # Lcom/trendmicro/hippo/Node;
    .param p4, "line"    # I

    .line 136
    invoke-direct {p0, p1, p2, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 137
    iput p4, p0, Lcom/trendmicro/hippo/Node;->lineno:I

    .line 138
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 1
    .param p1, "nodeType"    # I
    .param p2, "left"    # Lcom/trendmicro/hippo/Node;
    .param p3, "mid"    # Lcom/trendmicro/hippo/Node;
    .param p4, "right"    # Lcom/trendmicro/hippo/Node;

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1280
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    .line 1284
    iput v0, p0, Lcom/trendmicro/hippo/Node;->lineno:I

    .line 117
    iput p1, p0, Lcom/trendmicro/hippo/Node;->type:I

    .line 118
    iput-object p2, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .line 119
    iput-object p4, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    .line 120
    iput-object p3, p2, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 121
    iput-object p4, p3, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 122
    const/4 v0, 0x0

    iput-object v0, p4, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 123
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)V
    .locals 0
    .param p1, "nodeType"    # I
    .param p2, "left"    # Lcom/trendmicro/hippo/Node;
    .param p3, "mid"    # Lcom/trendmicro/hippo/Node;
    .param p4, "right"    # Lcom/trendmicro/hippo/Node;
    .param p5, "line"    # I

    .line 141
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 142
    iput p5, p0, Lcom/trendmicro/hippo/Node;->lineno:I

    .line 143
    return-void
.end method

.method static synthetic access$000()Lcom/trendmicro/hippo/Node;
    .locals 1

    .line 26
    sget-object v0, Lcom/trendmicro/hippo/Node;->NOT_SET:Lcom/trendmicro/hippo/Node;

    return-object v0
.end method

.method private static appendPrintId(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ObjToIntMap;Ljava/lang/StringBuilder;)V
    .locals 0
    .param p0, "n"    # Lcom/trendmicro/hippo/Node;
    .param p1, "printIds"    # Lcom/trendmicro/hippo/ObjToIntMap;
    .param p2, "sb"    # Ljava/lang/StringBuilder;

    .line 1278
    return-void
.end method

.method private endCheck()I
    .locals 3

    .line 862
    iget v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_b

    const/16 v1, 0x32

    if-eq v0, v1, :cond_a

    const/16 v1, 0x49

    if-eq v0, v1, :cond_9

    const/16 v1, 0x82

    const/4 v2, 0x1

    if-eq v0, v1, :cond_3

    const/16 v1, 0x8e

    if-eq v0, v1, :cond_3

    const/16 v1, 0x79

    if-eq v0, v1, :cond_2

    const/16 v1, 0x7a

    if-eq v0, v1, :cond_a

    packed-switch v0, :pswitch_data_0

    .line 916
    return v2

    .line 868
    :pswitch_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_0

    .line 869
    invoke-direct {v0}, Lcom/trendmicro/hippo/Node;->endCheck()I

    move-result v0

    return v0

    .line 870
    :cond_0
    return v2

    .line 890
    :pswitch_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/Node;->endCheckLoop()I

    move-result v0

    return v0

    .line 885
    :pswitch_2
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_1

    .line 886
    invoke-direct {v0}, Lcom/trendmicro/hippo/Node;->endCheck()I

    move-result v0

    return v0

    .line 887
    :cond_1
    return v2

    .line 865
    :cond_2
    invoke-direct {p0}, Lcom/trendmicro/hippo/Node;->endCheckBreak()I

    move-result v0

    return v0

    .line 895
    :cond_3
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    if-nez v0, :cond_4

    .line 896
    return v2

    .line 898
    :cond_4
    iget v1, v0, Lcom/trendmicro/hippo/Node;->type:I

    const/4 v2, 0x7

    if-eq v1, v2, :cond_8

    const/16 v2, 0x52

    if-eq v1, v2, :cond_7

    const/16 v2, 0x73

    if-eq v1, v2, :cond_6

    const/16 v2, 0x83

    if-eq v1, v2, :cond_5

    .line 912
    invoke-direct {p0}, Lcom/trendmicro/hippo/Node;->endCheckBlock()I

    move-result v0

    return v0

    .line 900
    :cond_5
    invoke-direct {v0}, Lcom/trendmicro/hippo/Node;->endCheckLabel()I

    move-result v0

    return v0

    .line 906
    :cond_6
    invoke-direct {v0}, Lcom/trendmicro/hippo/Node;->endCheckSwitch()I

    move-result v0

    return v0

    .line 909
    :cond_7
    invoke-direct {v0}, Lcom/trendmicro/hippo/Node;->endCheckTry()I

    move-result v0

    return v0

    .line 903
    :cond_8
    invoke-direct {v0}, Lcom/trendmicro/hippo/Node;->endCheckIf()I

    move-result v0

    return v0

    .line 873
    :cond_9
    const/16 v0, 0x8

    return v0

    .line 877
    :cond_a
    const/4 v0, 0x0

    return v0

    .line 880
    :cond_b
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_c

    .line 881
    return v1

    .line 882
    :cond_c
    const/4 v0, 0x2

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x84
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private endCheckBlock()I
    .locals 3

    .line 810
    const/4 v0, 0x1

    .line 814
    .local v0, "rv":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .local v1, "n":Lcom/trendmicro/hippo/Node;
    :goto_0
    and-int/lit8 v2, v0, 0x1

    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    .line 816
    and-int/lit8 v0, v0, -0x2

    .line 817
    invoke-direct {v1}, Lcom/trendmicro/hippo/Node;->endCheck()I

    move-result v2

    or-int/2addr v0, v2

    .line 814
    iget-object v1, v1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    goto :goto_0

    .line 819
    :cond_0
    return v0
.end method

.method private endCheckBreak()I
    .locals 3

    .line 846
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ast/Jump;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Jump;->getJumpStatement()Lcom/trendmicro/hippo/ast/Jump;

    move-result-object v0

    .line 847
    .local v0, "n":Lcom/trendmicro/hippo/Node;
    const/16 v1, 0x12

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 848
    const/4 v1, 0x0

    return v1
.end method

.method private endCheckIf()I
    .locals 4

    .line 661
    const/4 v0, 0x0

    .line 663
    .local v0, "rv":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 664
    .local v1, "th":Lcom/trendmicro/hippo/Node;
    move-object v2, p0

    check-cast v2, Lcom/trendmicro/hippo/ast/Jump;

    iget-object v2, v2, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 666
    .local v2, "el":Lcom/trendmicro/hippo/Node;
    invoke-direct {v1}, Lcom/trendmicro/hippo/Node;->endCheck()I

    move-result v0

    .line 668
    if-eqz v2, :cond_0

    .line 669
    invoke-direct {v2}, Lcom/trendmicro/hippo/Node;->endCheck()I

    move-result v3

    or-int/2addr v0, v3

    goto :goto_0

    .line 671
    :cond_0
    or-int/lit8 v0, v0, 0x1

    .line 673
    :goto_0
    return v0
.end method

.method private endCheckLabel()I
    .locals 3

    .line 831
    const/4 v0, 0x0

    .line 833
    .local v0, "rv":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    invoke-direct {v1}, Lcom/trendmicro/hippo/Node;->endCheck()I

    move-result v0

    .line 834
    const/16 v1, 0x12

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v1

    or-int/2addr v0, v1

    .line 836
    return v0
.end method

.method private endCheckLoop()I
    .locals 4

    .line 775
    const/4 v0, 0x0

    .line 782
    .local v0, "rv":I
    iget-object v1, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .local v1, "n":Lcom/trendmicro/hippo/Node;
    :goto_0
    iget-object v2, v1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    iget-object v3, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    if-eq v2, v3, :cond_0

    iget-object v1, v1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    goto :goto_0

    .line 785
    :cond_0
    iget v2, v1, Lcom/trendmicro/hippo/Node;->type:I

    const/4 v3, 0x6

    if-eq v2, v3, :cond_1

    .line 786
    const/4 v2, 0x1

    return v2

    .line 789
    :cond_1
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/ast/Jump;

    iget-object v2, v2, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    iget-object v2, v2, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    invoke-direct {v2}, Lcom/trendmicro/hippo/Node;->endCheck()I

    move-result v0

    .line 792
    iget-object v2, v1, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    iget v2, v2, Lcom/trendmicro/hippo/Node;->type:I

    const/16 v3, 0x2d

    if-ne v2, v3, :cond_2

    .line 793
    and-int/lit8 v0, v0, -0x2

    .line 796
    :cond_2
    const/16 v2, 0x12

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v2

    or-int/2addr v0, v2

    .line 798
    return v0
.end method

.method private endCheckSwitch()I
    .locals 1

    .line 685
    const/4 v0, 0x0

    .line 709
    .local v0, "rv":I
    return v0
.end method

.method private endCheckTry()I
    .locals 1

    .line 722
    const/4 v0, 0x0

    .line 755
    .local v0, "rv":I
    return v0
.end method

.method private ensureProperty(I)Lcom/trendmicro/hippo/Node$PropListItem;
    .locals 3
    .param p1, "propType"    # I

    .line 453
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Node;->lookupProperty(I)Lcom/trendmicro/hippo/Node$PropListItem;

    move-result-object v0

    .line 454
    .local v0, "item":Lcom/trendmicro/hippo/Node$PropListItem;
    if-nez v0, :cond_0

    .line 455
    new-instance v1, Lcom/trendmicro/hippo/Node$PropListItem;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/Node$PropListItem;-><init>(Lcom/trendmicro/hippo/Node$1;)V

    move-object v0, v1

    .line 456
    iput p1, v0, Lcom/trendmicro/hippo/Node$PropListItem;->type:I

    .line 457
    iget-object v1, p0, Lcom/trendmicro/hippo/Node;->propListHead:Lcom/trendmicro/hippo/Node$PropListItem;

    iput-object v1, v0, Lcom/trendmicro/hippo/Node$PropListItem;->next:Lcom/trendmicro/hippo/Node$PropListItem;

    .line 458
    iput-object v0, p0, Lcom/trendmicro/hippo/Node;->propListHead:Lcom/trendmicro/hippo/Node$PropListItem;

    .line 460
    :cond_0
    return-object v0
.end method

.method private static generatePrintIds(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ObjToIntMap;)V
    .locals 0
    .param p0, "n"    # Lcom/trendmicro/hippo/Node;
    .param p1, "map"    # Lcom/trendmicro/hippo/ObjToIntMap;

    .line 1262
    return-void
.end method

.method private lookupProperty(I)Lcom/trendmicro/hippo/Node$PropListItem;
    .locals 2
    .param p1, "propType"    # I

    .line 444
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->propListHead:Lcom/trendmicro/hippo/Node$PropListItem;

    .line 445
    .local v0, "x":Lcom/trendmicro/hippo/Node$PropListItem;
    :goto_0
    if-eqz v0, :cond_0

    iget v1, v0, Lcom/trendmicro/hippo/Node$PropListItem;->type:I

    if-eq p1, v1, :cond_0

    .line 446
    iget-object v0, v0, Lcom/trendmicro/hippo/Node$PropListItem;->next:Lcom/trendmicro/hippo/Node$PropListItem;

    goto :goto_0

    .line 448
    :cond_0
    return-object v0
.end method

.method public static newNumber(D)Lcom/trendmicro/hippo/Node;
    .locals 1
    .param p0, "number"    # D

    .line 146
    new-instance v0, Lcom/trendmicro/hippo/ast/NumberLiteral;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ast/NumberLiteral;-><init>()V

    .line 147
    .local v0, "n":Lcom/trendmicro/hippo/ast/NumberLiteral;
    invoke-virtual {v0, p0, p1}, Lcom/trendmicro/hippo/ast/NumberLiteral;->setNumber(D)V

    .line 148
    return-object v0
.end method

.method public static newString(ILjava/lang/String;)Lcom/trendmicro/hippo/Node;
    .locals 1
    .param p0, "type"    # I
    .param p1, "str"    # Ljava/lang/String;

    .line 156
    new-instance v0, Lcom/trendmicro/hippo/ast/Name;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ast/Name;-><init>()V

    .line 157
    .local v0, "name":Lcom/trendmicro/hippo/ast/Name;
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Name;->setIdentifier(Ljava/lang/String;)V

    .line 158
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/ast/Name;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 159
    return-object v0
.end method

.method public static newString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .line 152
    const/16 v0, 0x29

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/Node;->newString(ILjava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0
.end method

.method public static newTarget()Lcom/trendmicro/hippo/Node;
    .locals 2

    .line 566
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/16 v1, 0x84

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    return-object v0
.end method

.method private static final propToString(I)Ljava/lang/String;
    .locals 1
    .param p0, "propType"    # I

    .line 439
    const/4 v0, 0x0

    return-object v0
.end method

.method private resetTargets_r()V
    .locals 2

    .line 1036
    iget v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    const/16 v1, 0x84

    if-eq v0, v1, :cond_0

    const/16 v1, 0x49

    if-ne v0, v1, :cond_1

    .line 1037
    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Node;->labelId(I)V

    .line 1039
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .line 1040
    .local v0, "child":Lcom/trendmicro/hippo/Node;
    :goto_0
    if-eqz v0, :cond_2

    .line 1041
    invoke-direct {v0}, Lcom/trendmicro/hippo/Node;->resetTargets_r()V

    .line 1042
    iget-object v0, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    goto :goto_0

    .line 1044
    :cond_2
    return-void
.end method

.method private toString(Lcom/trendmicro/hippo/ObjToIntMap;Ljava/lang/StringBuilder;)V
    .locals 0
    .param p1, "printIds"    # Lcom/trendmicro/hippo/ObjToIntMap;
    .param p2, "sb"    # Ljava/lang/StringBuilder;

    .line 1213
    return-void
.end method

.method private static toStringTreeHelper(Lcom/trendmicro/hippo/ast/ScriptNode;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ObjToIntMap;ILjava/lang/StringBuilder;)V
    .locals 0
    .param p0, "treeTop"    # Lcom/trendmicro/hippo/ast/ScriptNode;
    .param p1, "n"    # Lcom/trendmicro/hippo/Node;
    .param p2, "printIds"    # Lcom/trendmicro/hippo/ObjToIntMap;
    .param p3, "level"    # I
    .param p4, "sb"    # Ljava/lang/StringBuilder;

    .line 1250
    return-void
.end method


# virtual methods
.method public addChildAfter(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 2
    .param p1, "newChild"    # Lcom/trendmicro/hippo/Node;
    .param p2, "node"    # Lcom/trendmicro/hippo/Node;

    .line 296
    iget-object v0, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    if-nez v0, :cond_1

    .line 299
    iget-object v0, p2, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    iput-object v0, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 300
    iput-object p1, p2, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 301
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    if-ne v0, p2, :cond_0

    .line 302
    iput-object p1, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    .line 303
    :cond_0
    return-void

    .line 297
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "newChild had siblings in addChildAfter"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addChildBefore(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 2
    .param p1, "newChild"    # Lcom/trendmicro/hippo/Node;
    .param p2, "node"    # Lcom/trendmicro/hippo/Node;

    .line 280
    iget-object v0, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    if-nez v0, :cond_1

    .line 283
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    if-ne v0, p2, :cond_0

    .line 284
    iput-object v0, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 285
    iput-object p1, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .line 286
    return-void

    .line 288
    :cond_0
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/Node;->getChildBefore(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 289
    .local v0, "prev":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/Node;->addChildAfter(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 290
    return-void

    .line 281
    .end local v0    # "prev":Lcom/trendmicro/hippo/Node;
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "newChild had siblings in addChildBefore"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addChildToBack(Lcom/trendmicro/hippo/Node;)V
    .locals 1
    .param p1, "child"    # Lcom/trendmicro/hippo/Node;

    .line 248
    const/4 v0, 0x0

    iput-object v0, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 249
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    if-nez v0, :cond_0

    .line 250
    iput-object p1, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    iput-object p1, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .line 251
    return-void

    .line 253
    :cond_0
    iput-object p1, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 254
    iput-object p1, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    .line 255
    return-void
.end method

.method public addChildToFront(Lcom/trendmicro/hippo/Node;)V
    .locals 1
    .param p1, "child"    # Lcom/trendmicro/hippo/Node;

    .line 240
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    iput-object v0, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 241
    iput-object p1, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .line 242
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    if-nez v0, :cond_0

    .line 243
    iput-object p1, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    .line 245
    :cond_0
    return-void
.end method

.method public addChildrenToBack(Lcom/trendmicro/hippo/Node;)V
    .locals 1
    .param p1, "children"    # Lcom/trendmicro/hippo/Node;

    .line 267
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_0

    .line 268
    iput-object p1, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 270
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getLastSibling()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    .line 271
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    if-nez v0, :cond_1

    .line 272
    iput-object p1, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .line 274
    :cond_1
    return-void
.end method

.method public addChildrenToFront(Lcom/trendmicro/hippo/Node;)V
    .locals 2
    .param p1, "children"    # Lcom/trendmicro/hippo/Node;

    .line 258
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getLastSibling()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 259
    .local v0, "lastSib":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    iput-object v1, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 260
    iput-object p1, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .line 261
    iget-object v1, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    if-nez v1, :cond_0

    .line 262
    iput-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    .line 264
    :cond_0
    return-void
.end method

.method public getChildBefore(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 3
    .param p1, "child"    # Lcom/trendmicro/hippo/Node;

    .line 220
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    if-ne p1, v0, :cond_0

    .line 221
    const/4 v0, 0x0

    return-object v0

    .line 222
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .line 223
    .local v0, "n":Lcom/trendmicro/hippo/Node;
    :goto_0
    iget-object v1, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    if-eq v1, p1, :cond_2

    .line 224
    iget-object v0, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 225
    if-eqz v0, :cond_1

    goto :goto_0

    .line 226
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "node is not a child"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 228
    :cond_2
    return-object v0
.end method

.method public final getDouble()D
    .locals 2

    .line 532
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ast/NumberLiteral;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/NumberLiteral;->getNumber()D

    move-result-wide v0

    return-wide v0
.end method

.method public getExistingIntProp(I)I
    .locals 2
    .param p1, "propType"    # I

    .line 497
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Node;->lookupProperty(I)Lcom/trendmicro/hippo/Node$PropListItem;

    move-result-object v0

    .line 498
    .local v0, "item":Lcom/trendmicro/hippo/Node$PropListItem;
    if-nez v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 499
    :cond_0
    iget v1, v0, Lcom/trendmicro/hippo/Node$PropListItem;->intValue:I

    return v1
.end method

.method public getFirstChild()Lcom/trendmicro/hippo/Node;
    .locals 1

    .line 208
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    return-object v0
.end method

.method public getIntProp(II)I
    .locals 2
    .param p1, "propType"    # I
    .param p2, "defaultValue"    # I

    .line 490
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Node;->lookupProperty(I)Lcom/trendmicro/hippo/Node$PropListItem;

    move-result-object v0

    .line 491
    .local v0, "item":Lcom/trendmicro/hippo/Node$PropListItem;
    if-nez v0, :cond_0

    return p2

    .line 492
    :cond_0
    iget v1, v0, Lcom/trendmicro/hippo/Node$PropListItem;->intValue:I

    return v1
.end method

.method public getJsDoc()Ljava/lang/String;
    .locals 2

    .line 180
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Node;->getJsDocNode()Lcom/trendmicro/hippo/ast/Comment;

    move-result-object v0

    .line 181
    .local v0, "comment":Lcom/trendmicro/hippo/ast/Comment;
    if-eqz v0, :cond_0

    .line 182
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Comment;->getValue()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 184
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getJsDocNode()Lcom/trendmicro/hippo/ast/Comment;
    .locals 1

    .line 193
    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/Comment;

    return-object v0
.end method

.method public getLastChild()Lcom/trendmicro/hippo/Node;
    .locals 1

    .line 212
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    return-object v0
.end method

.method public getLastSibling()Lcom/trendmicro/hippo/Node;
    .locals 2

    .line 232
    move-object v0, p0

    .line 233
    .local v0, "n":Lcom/trendmicro/hippo/Node;
    :goto_0
    iget-object v1, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    if-eqz v1, :cond_0

    .line 234
    iget-object v0, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    goto :goto_0

    .line 236
    :cond_0
    return-object v0
.end method

.method public getLineno()I
    .locals 1

    .line 523
    iget v0, p0, Lcom/trendmicro/hippo/Node;->lineno:I

    return v0
.end method

.method public getNext()Lcom/trendmicro/hippo/Node;
    .locals 1

    .line 216
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    return-object v0
.end method

.method public getProp(I)Ljava/lang/Object;
    .locals 2
    .param p1, "propType"    # I

    .line 483
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Node;->lookupProperty(I)Lcom/trendmicro/hippo/Node$PropListItem;

    move-result-object v0

    .line 484
    .local v0, "item":Lcom/trendmicro/hippo/Node$PropListItem;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    return-object v1

    .line 485
    :cond_0
    iget-object v1, v0, Lcom/trendmicro/hippo/Node$PropListItem;->objectValue:Ljava/lang/Object;

    return-object v1
.end method

.method public getScope()Lcom/trendmicro/hippo/ast/Scope;
    .locals 1

    .line 552
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Name;->getScope()Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v0

    return-object v0
.end method

.method public final getString()Ljava/lang/String;
    .locals 1

    .line 541
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .line 163
    iget v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    return v0
.end method

.method public hasChildren()Z
    .locals 1

    .line 204
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasConsistentReturnUsage()Z
    .locals 2

    .line 648
    invoke-direct {p0}, Lcom/trendmicro/hippo/Node;->endCheck()I

    move-result v0

    .line 649
    .local v0, "n":I
    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_1

    and-int/lit8 v1, v0, 0xb

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method public hasSideEffects()Z
    .locals 3

    .line 922
    iget v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    const/16 v1, 0x1e

    const/4 v2, 0x1

    if-eq v0, v1, :cond_8

    const/16 v1, 0x1f

    if-eq v0, v1, :cond_8

    const/16 v1, 0x25

    if-eq v0, v1, :cond_8

    const/16 v1, 0x26

    if-eq v0, v1, :cond_8

    const/16 v1, 0x32

    if-eq v0, v1, :cond_8

    const/16 v1, 0x33

    if-eq v0, v1, :cond_8

    const/16 v1, 0x38

    if-eq v0, v1, :cond_8

    const/16 v1, 0x39

    if-eq v0, v1, :cond_8

    const/16 v1, 0x52

    if-eq v0, v1, :cond_8

    const/16 v1, 0x53

    if-eq v0, v1, :cond_8

    const/4 v1, 0x0

    sparse-switch v0, :sswitch_data_0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    packed-switch v0, :pswitch_data_3

    .line 1010
    return v1

    .line 939
    :pswitch_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    if-nez v0, :cond_1

    .line 940
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 941
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->hasSideEffects()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->hasSideEffects()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    move v2, v1

    :cond_3
    :goto_0
    return v2

    .line 930
    :sswitch_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_4

    iget-object v0, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_4

    iget-object v0, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    if-nez v0, :cond_5

    .line 933
    :cond_4
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 934
    :cond_5
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    iget-object v0, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->hasSideEffects()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    iget-object v0, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    iget-object v0, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 935
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->hasSideEffects()Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_1

    :cond_6
    move v2, v1

    .line 934
    :goto_1
    return v2

    .line 925
    :sswitch_1
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_7

    .line 926
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->hasSideEffects()Z

    move-result v0

    return v0

    .line 927
    :cond_7
    return v2

    .line 1007
    :cond_8
    :pswitch_1
    :sswitch_2
    return v2

    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_2
        0x23 -> :sswitch_2
        0x41 -> :sswitch_2
        0x49 -> :sswitch_2
        0x5a -> :sswitch_1
        0x5b -> :sswitch_2
        0x5c -> :sswitch_2
        0x5d -> :sswitch_2
        0x5e -> :sswitch_2
        0x5f -> :sswitch_2
        0x60 -> :sswitch_2
        0x61 -> :sswitch_2
        0x62 -> :sswitch_2
        0x63 -> :sswitch_2
        0x64 -> :sswitch_2
        0x65 -> :sswitch_2
        0x66 -> :sswitch_2
        0x67 -> :sswitch_0
        0x76 -> :sswitch_2
        0x77 -> :sswitch_2
        0x78 -> :sswitch_2
        0x79 -> :sswitch_2
        0x7a -> :sswitch_2
        0x7b -> :sswitch_2
        0x7c -> :sswitch_2
        0x7d -> :sswitch_2
        0x7e -> :sswitch_2
        0x82 -> :sswitch_2
        0x83 -> :sswitch_2
        0x84 -> :sswitch_2
        0x85 -> :sswitch_2
        0x86 -> :sswitch_1
        0x87 -> :sswitch_2
        0x88 -> :sswitch_2
        0x8c -> :sswitch_2
        0x8d -> :sswitch_2
        0x8e -> :sswitch_2
        0x8f -> :sswitch_2
        0x9a -> :sswitch_2
        0x9b -> :sswitch_2
        0x9f -> :sswitch_2
        0xa0 -> :sswitch_2
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x45
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x69
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x71
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/trendmicro/hippo/Node;",
            ">;"
        }
    .end annotation

    .line 400
    new-instance v0, Lcom/trendmicro/hippo/Node$NodeIterator;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/Node$NodeIterator;-><init>(Lcom/trendmicro/hippo/Node;)V

    return-object v0
.end method

.method public final labelId()I
    .locals 2

    .line 571
    iget v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    const/16 v1, 0x84

    if-eq v0, v1, :cond_0

    const/16 v1, 0x49

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 572
    :cond_0
    const/16 v0, 0xf

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v0

    return v0
.end method

.method public labelId(I)V
    .locals 2
    .param p1, "labelId"    # I

    .line 577
    iget v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    const/16 v1, 0x84

    if-eq v0, v1, :cond_0

    const/16 v1, 0x49

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 578
    :cond_0
    const/16 v0, 0xf

    invoke-virtual {p0, v0, p1}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 579
    return-void
.end method

.method public putIntProp(II)V
    .locals 1
    .param p1, "propType"    # I
    .param p2, "prop"    # I

    .line 514
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Node;->ensureProperty(I)Lcom/trendmicro/hippo/Node$PropListItem;

    move-result-object v0

    .line 515
    .local v0, "item":Lcom/trendmicro/hippo/Node$PropListItem;
    iput p2, v0, Lcom/trendmicro/hippo/Node$PropListItem;->intValue:I

    .line 516
    return-void
.end method

.method public putProp(ILjava/lang/Object;)V
    .locals 1
    .param p1, "propType"    # I
    .param p2, "prop"    # Ljava/lang/Object;

    .line 504
    if-nez p2, :cond_0

    .line 505
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/Node;->removeProp(I)V

    goto :goto_0

    .line 507
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Node;->ensureProperty(I)Lcom/trendmicro/hippo/Node$PropListItem;

    move-result-object v0

    .line 508
    .local v0, "item":Lcom/trendmicro/hippo/Node$PropListItem;
    iput-object p2, v0, Lcom/trendmicro/hippo/Node$PropListItem;->objectValue:Ljava/lang/Object;

    .line 510
    .end local v0    # "item":Lcom/trendmicro/hippo/Node$PropListItem;
    :goto_0
    return-void
.end method

.method public removeChild(Lcom/trendmicro/hippo/Node;)V
    .locals 2
    .param p1, "child"    # Lcom/trendmicro/hippo/Node;

    .line 306
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/Node;->getChildBefore(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 307
    .local v0, "prev":Lcom/trendmicro/hippo/Node;
    if-nez v0, :cond_0

    .line 308
    iget-object v1, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    iget-object v1, v1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    iput-object v1, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    goto :goto_0

    .line 310
    :cond_0
    iget-object v1, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    iput-object v1, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 311
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    if-ne p1, v1, :cond_1

    iput-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    .line 312
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 313
    return-void
.end method

.method public removeChildren()V
    .locals 1

    .line 338
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    iput-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    .line 339
    return-void
.end method

.method public removeProp(I)V
    .locals 3
    .param p1, "propType"    # I

    .line 465
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->propListHead:Lcom/trendmicro/hippo/Node$PropListItem;

    .line 466
    .local v0, "x":Lcom/trendmicro/hippo/Node$PropListItem;
    if-eqz v0, :cond_3

    .line 467
    const/4 v1, 0x0

    .line 468
    .local v1, "prev":Lcom/trendmicro/hippo/Node$PropListItem;
    :cond_0
    iget v2, v0, Lcom/trendmicro/hippo/Node$PropListItem;->type:I

    if-eq v2, p1, :cond_1

    .line 469
    move-object v1, v0

    .line 470
    iget-object v0, v0, Lcom/trendmicro/hippo/Node$PropListItem;->next:Lcom/trendmicro/hippo/Node$PropListItem;

    .line 471
    if-nez v0, :cond_0

    return-void

    .line 473
    :cond_1
    if-nez v1, :cond_2

    .line 474
    iget-object v2, v0, Lcom/trendmicro/hippo/Node$PropListItem;->next:Lcom/trendmicro/hippo/Node$PropListItem;

    iput-object v2, p0, Lcom/trendmicro/hippo/Node;->propListHead:Lcom/trendmicro/hippo/Node$PropListItem;

    goto :goto_0

    .line 476
    :cond_2
    iget-object v2, v0, Lcom/trendmicro/hippo/Node$PropListItem;->next:Lcom/trendmicro/hippo/Node$PropListItem;

    iput-object v2, v1, Lcom/trendmicro/hippo/Node$PropListItem;->next:Lcom/trendmicro/hippo/Node$PropListItem;

    .line 479
    .end local v1    # "prev":Lcom/trendmicro/hippo/Node$PropListItem;
    :cond_3
    :goto_0
    return-void
.end method

.method public replaceChild(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 1
    .param p1, "child"    # Lcom/trendmicro/hippo/Node;
    .param p2, "newChild"    # Lcom/trendmicro/hippo/Node;

    .line 316
    iget-object v0, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    iput-object v0, p2, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 317
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    if-ne p1, v0, :cond_0

    .line 318
    iput-object p2, p0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    goto :goto_0

    .line 320
    :cond_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/Node;->getChildBefore(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 321
    .local v0, "prev":Lcom/trendmicro/hippo/Node;
    iput-object p2, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 323
    .end local v0    # "prev":Lcom/trendmicro/hippo/Node;
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    if-ne p1, v0, :cond_1

    .line 324
    iput-object p2, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    .line 325
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 326
    return-void
.end method

.method public replaceChildAfter(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 2
    .param p1, "prevChild"    # Lcom/trendmicro/hippo/Node;
    .param p2, "newChild"    # Lcom/trendmicro/hippo/Node;

    .line 329
    iget-object v0, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 330
    .local v0, "child":Lcom/trendmicro/hippo/Node;
    iget-object v1, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    iput-object v1, p2, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 331
    iput-object p2, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 332
    iget-object v1, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    if-ne v0, v1, :cond_0

    .line 333
    iput-object p2, p0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    .line 334
    :cond_0
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 335
    return-void
.end method

.method public resetTargets()V
    .locals 2

    .line 1027
    iget v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    const/16 v1, 0x7e

    if-ne v0, v1, :cond_0

    .line 1028
    invoke-direct {p0}, Lcom/trendmicro/hippo/Node;->resetTargets_r()V

    goto :goto_0

    .line 1030
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1032
    :goto_0
    return-void
.end method

.method public final setDouble(D)V
    .locals 1
    .param p1, "number"    # D

    .line 536
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ast/NumberLiteral;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/ast/NumberLiteral;->setNumber(D)V

    .line 537
    return-void
.end method

.method public setJsDocNode(Lcom/trendmicro/hippo/ast/Comment;)V
    .locals 1
    .param p1, "jsdocNode"    # Lcom/trendmicro/hippo/ast/Comment;

    .line 200
    const/16 v0, 0x18

    invoke-virtual {p0, v0, p1}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 201
    return-void
.end method

.method public setLineno(I)V
    .locals 0
    .param p1, "lineno"    # I

    .line 527
    iput p1, p0, Lcom/trendmicro/hippo/Node;->lineno:I

    .line 528
    return-void
.end method

.method public setScope(Lcom/trendmicro/hippo/ast/Scope;)V
    .locals 1
    .param p1, "s"    # Lcom/trendmicro/hippo/ast/Scope;

    .line 557
    if-nez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 558
    :cond_0
    instance-of v0, p0, Lcom/trendmicro/hippo/ast/Name;

    if-eqz v0, :cond_1

    .line 561
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Name;->setScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 562
    return-void

    .line 559
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public final setString(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 546
    if-nez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 547
    :cond_0
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Name;->setIdentifier(Ljava/lang/String;)V

    .line 548
    return-void
.end method

.method public setType(I)Lcom/trendmicro/hippo/Node;
    .locals 0
    .param p1, "type"    # I

    .line 170
    iput p1, p0, Lcom/trendmicro/hippo/Node;->type:I

    .line 171
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1054
    iget v0, p0, Lcom/trendmicro/hippo/Node;->type:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringTree(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;
    .locals 1
    .param p1, "treeTop"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 1221
    const/4 v0, 0x0

    return-object v0
.end method
