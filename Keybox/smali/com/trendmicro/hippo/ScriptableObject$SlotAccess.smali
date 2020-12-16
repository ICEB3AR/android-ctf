.class final enum Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;
.super Ljava/lang/Enum;
.source "ScriptableObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/ScriptableObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "SlotAccess"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

.field public static final enum CONVERT_ACCESSOR_TO_DATA:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

.field public static final enum MODIFY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

.field public static final enum MODIFY_CONST:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

.field public static final enum MODIFY_GETTER_SETTER:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

.field public static final enum QUERY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 128
    new-instance v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    const-string v1, "QUERY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->QUERY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    new-instance v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    const-string v1, "MODIFY"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    new-instance v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    const-string v1, "MODIFY_CONST"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_CONST:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    new-instance v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    const-string v1, "MODIFY_GETTER_SETTER"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_GETTER_SETTER:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    new-instance v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    const-string v1, "CONVERT_ACCESSOR_TO_DATA"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->CONVERT_ACCESSOR_TO_DATA:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    .line 127
    const/4 v1, 0x5

    new-array v1, v1, [Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    sget-object v7, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->QUERY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    aput-object v7, v1, v2

    sget-object v2, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    aput-object v2, v1, v3

    sget-object v2, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_CONST:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    aput-object v2, v1, v4

    sget-object v2, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_GETTER_SETTER:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    aput-object v2, v1, v5

    aput-object v0, v1, v6

    sput-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->$VALUES:[Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 127
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 127
    const-class v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    return-object v0
.end method

.method public static values()[Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;
    .locals 1

    .line 127
    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->$VALUES:[Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-virtual {v0}, [Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    return-object v0
.end method
