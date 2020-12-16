.class final enum Lcom/trendmicro/hippo/TopLevel$NativeErrors;
.super Ljava/lang/Enum;
.source "TopLevel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/TopLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "NativeErrors"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/trendmicro/hippo/TopLevel$NativeErrors;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/trendmicro/hippo/TopLevel$NativeErrors;

.field public static final enum Error:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

.field public static final enum EvalError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

.field public static final enum InternalError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

.field public static final enum JavaException:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

.field public static final enum RangeError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

.field public static final enum ReferenceError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

.field public static final enum SyntaxError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

.field public static final enum TypeError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

.field public static final enum URIError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 71
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    const-string v1, "Error"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->Error:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 73
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    const-string v1, "EvalError"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->EvalError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 75
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    const-string v1, "RangeError"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->RangeError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 77
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    const-string v1, "ReferenceError"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->ReferenceError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 79
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    const-string v1, "SyntaxError"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->SyntaxError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 81
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    const-string v1, "TypeError"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->TypeError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 83
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    const-string v1, "URIError"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->URIError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 85
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    const-string v1, "InternalError"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->InternalError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 87
    new-instance v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    const-string v1, "JavaException"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->JavaException:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 69
    const/16 v1, 0x9

    new-array v1, v1, [Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    sget-object v11, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->Error:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    aput-object v11, v1, v2

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->EvalError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    aput-object v2, v1, v3

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->RangeError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    aput-object v2, v1, v4

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->ReferenceError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    aput-object v2, v1, v5

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->SyntaxError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    aput-object v2, v1, v6

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->TypeError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    aput-object v2, v1, v7

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->URIError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    aput-object v2, v1, v8

    sget-object v2, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->InternalError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    aput-object v2, v1, v9

    aput-object v0, v1, v10

    sput-object v1, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->$VALUES:[Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 69
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 69
    const-class v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    return-object v0
.end method

.method public static values()[Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    .locals 1

    .line 69
    sget-object v0, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->$VALUES:[Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    invoke-virtual {v0}, [Lcom/trendmicro/hippo/TopLevel$NativeErrors;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    return-object v0
.end method
