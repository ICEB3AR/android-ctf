.class Lcom/trendmicro/hippo/PolicySecurityController$1;
.super Ljava/lang/Object;
.source "PolicySecurityController.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/PolicySecurityController;->createClassLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lcom/trendmicro/hippo/GeneratedClassLoader;
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

.field final synthetic val$parent:Ljava/lang/ClassLoader;

.field final synthetic val$securityDomain:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/PolicySecurityController;Ljava/lang/ClassLoader;Ljava/lang/Object;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/PolicySecurityController;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 80
    iput-object p1, p0, Lcom/trendmicro/hippo/PolicySecurityController$1;->this$0:Lcom/trendmicro/hippo/PolicySecurityController;

    iput-object p2, p0, Lcom/trendmicro/hippo/PolicySecurityController$1;->val$parent:Ljava/lang/ClassLoader;

    iput-object p3, p0, Lcom/trendmicro/hippo/PolicySecurityController$1;->val$securityDomain:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .locals 3

    .line 84
    new-instance v0, Lcom/trendmicro/hippo/PolicySecurityController$Loader;

    iget-object v1, p0, Lcom/trendmicro/hippo/PolicySecurityController$1;->val$parent:Ljava/lang/ClassLoader;

    iget-object v2, p0, Lcom/trendmicro/hippo/PolicySecurityController$1;->val$securityDomain:Ljava/lang/Object;

    check-cast v2, Ljava/security/CodeSource;

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/PolicySecurityController$Loader;-><init>(Ljava/lang/ClassLoader;Ljava/security/CodeSource;)V

    return-object v0
.end method
