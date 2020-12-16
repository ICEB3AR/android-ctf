.class Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$2;
.super Ljava/lang/Object;
.source "JavaPolicySecurity.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;->createClassLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lcom/trendmicro/hippo/GeneratedClassLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction<",
        "Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$Loader;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;

.field final synthetic val$domain:Ljava/security/ProtectionDomain;

.field final synthetic val$parentLoader:Ljava/lang/ClassLoader;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 181
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$2;->this$0:Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;

    iput-object p2, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$2;->val$parentLoader:Ljava/lang/ClassLoader;

    iput-object p3, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$2;->val$domain:Ljava/security/ProtectionDomain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$Loader;
    .locals 3

    .line 183
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$Loader;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$2;->val$parentLoader:Ljava/lang/ClassLoader;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$2;->val$domain:Ljava/security/ProtectionDomain;

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$Loader;-><init>(Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)V

    return-object v0
.end method

.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1

    .line 181
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$2;->run()Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$Loader;

    move-result-object v0

    return-object v0
.end method
