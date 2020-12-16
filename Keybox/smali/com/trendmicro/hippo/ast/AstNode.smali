.class public abstract Lcom/trendmicro/hippo/ast/AstNode;
.super Lcom/trendmicro/hippo/Node;
.source "AstNode.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;,
        Lcom/trendmicro/hippo/ast/AstNode$PositionComparator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/trendmicro/hippo/Node;",
        "Ljava/lang/Comparable<",
        "Lcom/trendmicro/hippo/ast/AstNode;",
        ">;"
    }
.end annotation


# static fields
.field private static operatorNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected inlineComment:Lcom/trendmicro/hippo/ast/AstNode;

.field protected length:I

.field protected parent:Lcom/trendmicro/hippo/ast/AstNode;

.field protected position:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 84
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    .line 88
    const/16 v1, 0x34

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "in"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "typeof"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x35

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "instanceof"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x1f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "delete"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x5a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ","

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x68

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ":"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x69

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "||"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x6a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "&&"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x6b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "++"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x6c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "--"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "|"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "^"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "&"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "=="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "!="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "<"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ">"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0xf

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "<="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ">="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "<<"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x13

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ">>"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x14

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ">>>"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x15

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "+"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x16

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "-"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x17

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "*"

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x18

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "/"

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x19

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "%"

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x1a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "!"

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x1b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "~"

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x1c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x1d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x2e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "==="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x2f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "!=="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x5b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x5c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "|="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x5e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "&="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x5f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "<<="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x60

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ">>="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x61

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ">>>="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x62

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "+="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x63

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "-="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x64

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "*="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x65

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "/="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x66

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "%="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x5d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "^="

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    const/16 v1, 0x7f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "void"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 151
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 66
    iput v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->position:I

    .line 67
    const/4 v0, 0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->length:I

    .line 152
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "pos"    # I

    .line 159
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 160
    iput p1, p0, Lcom/trendmicro/hippo/ast/AstNode;->position:I

    .line 161
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 170
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 171
    iput p1, p0, Lcom/trendmicro/hippo/ast/AstNode;->position:I

    .line 172
    iput p2, p0, Lcom/trendmicro/hippo/ast/AstNode;->length:I

    .line 173
    return-void
.end method

.method public static codeBug()Ljava/lang/RuntimeException;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 485
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static operatorToString(I)Ljava/lang/String;
    .locals 4
    .param p0, "op"    # I

    .line 346
    sget-object v0, Lcom/trendmicro/hippo/ast/AstNode;->operatorNames:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 347
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 349
    return-object v0

    .line 348
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid operator: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public addChild(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 2
    .param p1, "kid"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 275
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->assertNotNull(Ljava/lang/Object;)V

    .line 276
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v1

    add-int/2addr v0, v1

    .line 277
    .local v0, "end":I
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v1

    sub-int v1, v0, v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/AstNode;->setLength(I)V

    .line 278
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 279
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 280
    return-void
.end method

.method protected assertNotNull(Ljava/lang/Object;)V
    .locals 2
    .param p1, "arg"    # Ljava/lang/Object;

    .line 456
    if-eqz p1, :cond_0

    .line 458
    return-void

    .line 457
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "arg cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public compareTo(Lcom/trendmicro/hippo/ast/AstNode;)I
    .locals 6
    .param p1, "other"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 541
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 542
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/AstNode;->getAbsolutePosition()I

    move-result v0

    .line 543
    .local v0, "abs1":I
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getAbsolutePosition()I

    move-result v1

    .line 544
    .local v1, "abs2":I
    const/4 v2, -0x1

    if-ge v0, v1, :cond_1

    return v2

    .line 545
    :cond_1
    const/4 v3, 0x1

    if-ge v1, v0, :cond_2

    return v3

    .line 546
    :cond_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v4

    .line 547
    .local v4, "len1":I
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v5

    .line 548
    .local v5, "len2":I
    if-ge v4, v5, :cond_3

    return v2

    .line 549
    :cond_3
    if-ge v5, v4, :cond_4

    return v3

    .line 550
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    sub-int/2addr v2, v3

    return v2
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 64
    check-cast p1, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->compareTo(Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result p1

    return p1
.end method

.method public debugPrint()Ljava/lang/String;
    .locals 3

    .line 620
    new-instance v0, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x3e8

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;-><init>(Ljava/lang/StringBuilder;)V

    .line 621
    .local v0, "dpv":Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 622
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public depth()I
    .locals 1

    .line 559
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->parent:Lcom/trendmicro/hippo/ast/AstNode;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->depth()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    :goto_0
    return v0
.end method

.method public getAbsolutePosition()I
    .locals 3

    .line 195
    iget v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->position:I

    .line 196
    .local v0, "pos":I
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/AstNode;->parent:Lcom/trendmicro/hippo/ast/AstNode;

    .line 197
    .local v1, "parent":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    if-eqz v1, :cond_0

    .line 198
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v2

    add-int/2addr v0, v2

    .line 199
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstNode;->getParent()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    goto :goto_0

    .line 201
    :cond_0
    return v0
.end method

.method public getAstRoot()Lcom/trendmicro/hippo/ast/AstRoot;
    .locals 2

    .line 288
    move-object v0, p0

    .line 289
    .local v0, "parent":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/trendmicro/hippo/ast/AstRoot;

    if-nez v1, :cond_0

    .line 290
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->getParent()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    goto :goto_0

    .line 292
    :cond_0
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/ast/AstRoot;

    return-object v1
.end method

.method public getEnclosingFunction()Lcom/trendmicro/hippo/ast/FunctionNode;
    .locals 2

    .line 506
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/AstNode;->getParent()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 507
    .local v0, "parent":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/trendmicro/hippo/ast/FunctionNode;

    if-nez v1, :cond_0

    .line 508
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->getParent()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    goto :goto_0

    .line 510
    :cond_0
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/ast/FunctionNode;

    return-object v1
.end method

.method public getEnclosingScope()Lcom/trendmicro/hippo/ast/Scope;
    .locals 2

    .line 521
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/AstNode;->getParent()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 522
    .local v0, "parent":Lcom/trendmicro/hippo/ast/AstNode;
    :goto_0
    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/trendmicro/hippo/ast/Scope;

    if-nez v1, :cond_0

    .line 523
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->getParent()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    goto :goto_0

    .line 525
    :cond_0
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/ast/Scope;

    return-object v1
.end method

.method public getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 626
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->inlineComment:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getLength()I
    .locals 1

    .line 208
    iget v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->length:I

    return v0
.end method

.method public getLineno()I
    .locals 2

    .line 606
    iget v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->lineno:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 607
    iget v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->lineno:I

    return v0

    .line 608
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->parent:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_1

    .line 609
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->getLineno()I

    move-result v0

    return v0

    .line 610
    :cond_1
    return v1
.end method

.method public getParent()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 242
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->parent:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getPosition()I
    .locals 1

    .line 179
    iget v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->position:I

    return v0
.end method

.method public hasSideEffects()Z
    .locals 2

    .line 375
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v0

    const/16 v1, 0x1e

    if-eq v0, v1, :cond_0

    const/16 v1, 0x1f

    if-eq v0, v1, :cond_0

    const/16 v1, 0x25

    if-eq v0, v1, :cond_0

    const/16 v1, 0x26

    if-eq v0, v1, :cond_0

    const/16 v1, 0x32

    if-eq v0, v1, :cond_0

    const/16 v1, 0x33

    if-eq v0, v1, :cond_0

    const/16 v1, 0x38

    if-eq v0, v1, :cond_0

    const/16 v1, 0x39

    if-eq v0, v1, :cond_0

    const/16 v1, 0x52

    if-eq v0, v1, :cond_0

    const/16 v1, 0x53

    if-eq v0, v1, :cond_0

    const/16 v1, 0x6b

    if-eq v0, v1, :cond_0

    const/16 v1, 0x6c

    if-eq v0, v1, :cond_0

    sparse-switch v0, :sswitch_data_0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    .line 446
    const/4 v0, 0x0

    return v0

    .line 443
    :cond_0
    :pswitch_0
    :sswitch_0
    const/4 v0, 0x1

    return v0

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_0
        0x23 -> :sswitch_0
        0x41 -> :sswitch_0
        0x49 -> :sswitch_0
        0x5b -> :sswitch_0
        0x5c -> :sswitch_0
        0x5d -> :sswitch_0
        0x5e -> :sswitch_0
        0x5f -> :sswitch_0
        0x60 -> :sswitch_0
        0x61 -> :sswitch_0
        0x62 -> :sswitch_0
        0x63 -> :sswitch_0
        0x64 -> :sswitch_0
        0x65 -> :sswitch_0
        0x66 -> :sswitch_0
        0x76 -> :sswitch_0
        0x77 -> :sswitch_0
        0x78 -> :sswitch_0
        0x79 -> :sswitch_0
        0x7a -> :sswitch_0
        0x7b -> :sswitch_0
        0x7c -> :sswitch_0
        0x7d -> :sswitch_0
        0x7e -> :sswitch_0
        0x82 -> :sswitch_0
        0x83 -> :sswitch_0
        0x84 -> :sswitch_0
        0x85 -> :sswitch_0
        0x87 -> :sswitch_0
        0x88 -> :sswitch_0
        0x8c -> :sswitch_0
        0x8d -> :sswitch_0
        0x8e -> :sswitch_0
        0x8f -> :sswitch_0
        0x9a -> :sswitch_0
        0x9b -> :sswitch_0
        0x9f -> :sswitch_0
        0xa0 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x45
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x6e
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public makeIndent(I)Ljava/lang/String;
    .locals 3
    .param p1, "indent"    # I

    .line 323
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 324
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p1, :cond_0

    .line 325
    const-string v2, "  "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 327
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected printList(Ljava/util/List;Ljava/lang/StringBuilder;)V
    .locals 6
    .param p2, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/lang/StringBuilder;",
            ")V"
        }
    .end annotation

    .line 467
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 468
    .local v0, "max":I
    const/4 v1, 0x0

    .line 469
    .local v1, "count":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ast/AstNode;

    .line 470
    .local v3, "item":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 471
    add-int/lit8 v4, v1, 0x1

    .end local v1    # "count":I
    .local v4, "count":I
    add-int/lit8 v5, v0, -0x1

    if-ge v1, v5, :cond_0

    .line 472
    const-string v1, ", "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 473
    :cond_0
    instance-of v1, v3, Lcom/trendmicro/hippo/ast/EmptyExpression;

    if-eqz v1, :cond_1

    .line 474
    const-string v1, ","

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 476
    .end local v3    # "item":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_1
    :goto_1
    move v1, v4

    goto :goto_0

    .line 477
    .end local v4    # "count":I
    .restart local v1    # "count":I
    :cond_2
    return-void
.end method

.method public setBounds(II)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "end"    # I

    .line 223
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->setPosition(I)V

    .line 224
    sub-int v0, p2, p1

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/AstNode;->setLength(I)V

    .line 225
    return-void
.end method

.method public setInlineComment(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "inlineComment"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 630
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/AstNode;->inlineComment:Lcom/trendmicro/hippo/ast/AstNode;

    .line 631
    return-void
.end method

.method public setLength(I)V
    .locals 0
    .param p1, "length"    # I

    .line 215
    iput p1, p0, Lcom/trendmicro/hippo/ast/AstNode;->length:I

    .line 216
    return-void
.end method

.method public setParent(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "parent"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 251
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->parent:Lcom/trendmicro/hippo/ast/AstNode;

    if-ne p1, v0, :cond_0

    .line 252
    return-void

    .line 256
    :cond_0
    if-eqz v0, :cond_1

    .line 257
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->getAbsolutePosition()I

    move-result v0

    neg-int v0, v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/AstNode;->setRelative(I)V

    .line 260
    :cond_1
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/AstNode;->parent:Lcom/trendmicro/hippo/ast/AstNode;

    .line 261
    if-eqz p1, :cond_2

    .line 262
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getAbsolutePosition()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/AstNode;->setRelative(I)V

    .line 264
    :cond_2
    return-void
.end method

.method public setPosition(I)V
    .locals 0
    .param p1, "position"    # I

    .line 186
    iput p1, p0, Lcom/trendmicro/hippo/ast/AstNode;->position:I

    .line 187
    return-void
.end method

.method public setRelative(I)V
    .locals 1
    .param p1, "parentPosition"    # I

    .line 235
    iget v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->position:I

    sub-int/2addr v0, p1

    iput v0, p0, Lcom/trendmicro/hippo/ast/AstNode;->position:I

    .line 236
    return-void
.end method

.method public shortName()Ljava/lang/String;
    .locals 3

    .line 335
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 336
    .local v0, "classname":Ljava/lang/String;
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 337
    .local v1, "last":I
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public toSource()Ljava/lang/String;
    .locals 1

    .line 315
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract toSource(I)Ljava/lang/String;
.end method

.method public abstract visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
.end method
