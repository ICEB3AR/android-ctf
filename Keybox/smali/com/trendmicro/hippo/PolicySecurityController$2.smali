.class Lcom/trendmicro/hippo/PolicySecurityController$2;
.super Ljava/lang/Object;
.source "PolicySecurityController.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/PolicySecurityController;->callWithDomain(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
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
.field final synthetic this$0:Lcom/trendmicro/hippo/PolicySecurityController;

.field final synthetic val$cx:Lcom/trendmicro/hippo/Context;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/PolicySecurityController;Lcom/trendmicro/hippo/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/PolicySecurityController;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 105
    iput-object p1, p0, Lcom/trendmicro/hippo/PolicySecurityController$2;->this$0:Lcom/trendmicro/hippo/PolicySecurityController;

    iput-object p2, p0, Lcom/trendmicro/hippo/PolicySecurityController$2;->val$cx:Lcom/trendmicro/hippo/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/trendmicro/hippo/PolicySecurityController$2;->val$cx:Lcom/trendmicro/hippo/Context;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getApplicationClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method
