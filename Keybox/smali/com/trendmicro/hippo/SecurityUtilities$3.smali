.class Lcom/trendmicro/hippo/SecurityUtilities$3;
.super Ljava/lang/Object;
.source "SecurityUtilities.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/SecurityUtilities;->getScriptProtectionDomain()Ljava/security/ProtectionDomain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction<",
        "Ljava/security/ProtectionDomain;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$securityManager:Ljava/lang/SecurityManager;


# direct methods
.method constructor <init>(Ljava/lang/SecurityManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 61
    iput-object p1, p0, Lcom/trendmicro/hippo/SecurityUtilities$3;->val$securityManager:Ljava/lang/SecurityManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1

    .line 61
    invoke-virtual {p0}, Lcom/trendmicro/hippo/SecurityUtilities$3;->run()Ljava/security/ProtectionDomain;

    move-result-object v0

    return-object v0
.end method

.method public run()Ljava/security/ProtectionDomain;
    .locals 2

    .line 64
    iget-object v0, p0, Lcom/trendmicro/hippo/SecurityUtilities$3;->val$securityManager:Ljava/lang/SecurityManager;

    check-cast v0, Lcom/trendmicro/hippo/HippoSecurityManager;

    .line 65
    invoke-virtual {v0}, Lcom/trendmicro/hippo/HippoSecurityManager;->getCurrentScriptClass()Ljava/lang/Class;

    move-result-object v0

    .line 66
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Class;->getProtectionDomain()Ljava/security/ProtectionDomain;

    move-result-object v1

    :goto_0
    return-object v1
.end method
