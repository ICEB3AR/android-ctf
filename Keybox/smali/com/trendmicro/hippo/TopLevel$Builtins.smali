.class public final enum Lcom/trendmicro/hippo/TopLevel$Builtins;
.super Ljava/lang/Enum;
.source "TopLevel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/TopLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Builtins"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/trendmicro/hippo/TopLevel$Builtins;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/trendmicro/hippo/TopLevel$Builtins;

.field public static final enum Array:Lcom/trendmicro/hippo/TopLevel$Builtins;

.field public static final enum Boolean:Lcom/trendmicro/hippo/TopLevel$Builtins;

.field public static final enum Error:Lcom/trendmicro/hippo/TopLevel$Builtins;

.field public static final enum Function:Lcom/trendmicro/hippo/TopLevel$Builtins;

.field public static final enum Number:Lcom/trendmicro/hippo/TopLevel$Builtins;

.field public static final enum Object:Lcom/trendmicro/hippo/TopLevel$Builtins;

.field public static final enum RegExp:Lcom/trendmicro/hippo/TopLevel$Builtins;

.field public static final enum String:Lcom/trendmicro/hippo/TopLevel$Builtins;

.field public static final enum Symbol:Lcom/trendmicro/hippo/TopLevel$Builtins;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 47
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$Builtins;

    const-string v1, "Object"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/TopLevel$Builtins;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$Builtins;->Object:Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 49
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$Builtins;

    const-string v1, "Array"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/trendmicro/hippo/TopLevel$Builtins;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$Builtins;->Array:Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 51
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$Builtins;

    const-string v1, "Function"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/TopLevel$Builtins;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$Builtins;->Function:Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 53
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$Builtins;

    const-string v1, "String"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/trendmicro/hippo/TopLevel$Builtins;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$Builtins;->String:Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 55
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$Builtins;

    const-string v1, "Number"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/trendmicro/hippo/TopLevel$Builtins;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$Builtins;->Number:Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 57
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$Builtins;

    const-string v1, "Boolean"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/trendmicro/hippo/TopLevel$Builtins;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$Builtins;->Boolean:Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 59
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$Builtins;

    const-string v1, "RegExp"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/trendmicro/hippo/TopLevel$Builtins;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$Builtins;->RegExp:Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 61
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$Builtins;

    const-string v1, "Error"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lcom/trendmicro/hippo/TopLevel$Builtins;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$Builtins;->Error:Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 63
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$Builtins;

    const-string v1, "Symbol"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Lcom/trendmicro/hippo/TopLevel$Builtins;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$Builtins;->Symbol:Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 45
    const/16 v1, 0x9

    new-array v1, v1, [Lcom/trendmicro/hippo/TopLevel$Builtins;

    sget-object v11, Lcom/trendmicro/hippo/TopLevel$Builtins;->Object:Lcom/trendmicro/hippo/TopLevel$Builtins;

    aput-object v11, v1, v2

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$Builtins;->Array:Lcom/trendmicro/hippo/TopLevel$Builtins;

    aput-object v2, v1, v3

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$Builtins;->Function:Lcom/trendmicro/hippo/TopLevel$Builtins;

    aput-object v2, v1, v4

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$Builtins;->String:Lcom/trendmicro/hippo/TopLevel$Builtins;

    aput-object v2, v1, v5

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$Builtins;->Number:Lcom/trendmicro/hippo/TopLevel$Builtins;

    aput-object v2, v1, v6

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$Builtins;->Boolean:Lcom/trendmicro/hippo/TopLevel$Builtins;

    aput-object v2, v1, v7

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$Builtins;->RegExp:Lcom/trendmicro/hippo/TopLevel$Builtins;

    aput-object v2, v1, v8

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$Builtins;->Error:Lcom/trendmicro/hippo/TopLevel$Builtins;

    aput-object v2, v1, v9

    aput-object v0, v1, v10

    sput-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->$VALUES:[Lcom/trendmicro/hippo/TopLevel$Builtins;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 45
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/trendmicro/hippo/TopLevel$Builtins;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 45
    const-class v0, Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/TopLevel$Builtins;

    return-object v0
.end method

.method public static values()[Lcom/trendmicro/hippo/TopLevel$Builtins;
    .locals 1

    .line 45
    sget-object v0, Lcom/trendmicro/hippo/TopLevel$Builtins;->$VALUES:[Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-virtual {v0}, [Lcom/trendmicro/hippo/TopLevel$Builtins;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/trendmicro/hippo/TopLevel$Builtins;

    return-object v0
.end method
