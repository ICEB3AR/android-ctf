.class public final enum Lcom/trendmicro/hippo/ast/FunctionNode$Form;
.super Ljava/lang/Enum;
.source "FunctionNode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/ast/FunctionNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Form"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/trendmicro/hippo/ast/FunctionNode$Form;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/trendmicro/hippo/ast/FunctionNode$Form;

.field public static final enum FUNCTION:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

.field public static final enum GETTER:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

.field public static final enum METHOD:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

.field public static final enum SETTER:Lcom/trendmicro/hippo/ast/FunctionNode$Form;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 68
    new-instance v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    const-string v1, "FUNCTION"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/ast/FunctionNode$Form;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->FUNCTION:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    new-instance v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    const-string v1, "GETTER"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/trendmicro/hippo/ast/FunctionNode$Form;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->GETTER:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    new-instance v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    const-string v1, "SETTER"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/ast/FunctionNode$Form;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->SETTER:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    new-instance v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    const-string v1, "METHOD"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/trendmicro/hippo/ast/FunctionNode$Form;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->METHOD:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    const/4 v1, 0x4

    new-array v1, v1, [Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    sget-object v6, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->FUNCTION:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    aput-object v6, v1, v2

    sget-object v2, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->GETTER:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    aput-object v2, v1, v3

    sget-object v2, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->SETTER:Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    aput-object v2, v1, v4

    aput-object v0, v1, v5

    sput-object v1, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->$VALUES:[Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 68
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/trendmicro/hippo/ast/FunctionNode$Form;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 68
    const-class v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    return-object v0
.end method

.method public static values()[Lcom/trendmicro/hippo/ast/FunctionNode$Form;
    .locals 1

    .line 68
    sget-object v0, Lcom/trendmicro/hippo/ast/FunctionNode$Form;->$VALUES:[Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    invoke-virtual {v0}, [Lcom/trendmicro/hippo/ast/FunctionNode$Form;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/trendmicro/hippo/ast/FunctionNode$Form;

    return-object v0
.end method
