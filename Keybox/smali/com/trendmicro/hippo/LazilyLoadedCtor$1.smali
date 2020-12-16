.class Lcom/trendmicro/hippo/LazilyLoadedCtor$1;
.super Ljava/lang/Object;
.source "LazilyLoadedCtor.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/LazilyLoadedCtor;->buildValue()Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/LazilyLoadedCtor;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/LazilyLoadedCtor;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/LazilyLoadedCtor;

    .line 87
    iput-object p1, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor$1;->this$0:Lcom/trendmicro/hippo/LazilyLoadedCtor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/trendmicro/hippo/LazilyLoadedCtor$1;->this$0:Lcom/trendmicro/hippo/LazilyLoadedCtor;

    invoke-static {v0}, Lcom/trendmicro/hippo/LazilyLoadedCtor;->access$000(Lcom/trendmicro/hippo/LazilyLoadedCtor;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
