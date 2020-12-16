.class Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$1;
.super Ljava/lang/Object;
.source "JavaPolicySecurity.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;->callProcessFileSecure(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V
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
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;

.field final synthetic val$cx:Lcom/trendmicro/hippo/Context;

.field final synthetic val$filename:Ljava/lang/String;

.field final synthetic val$scope:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 128
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$1;->this$0:Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;

    iput-object p2, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$1;->val$filename:Ljava/lang/String;

    iput-object p3, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$1;->val$cx:Lcom/trendmicro/hippo/Context;

    iput-object p4, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$1;->val$scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .locals 5

    .line 130
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$1;->this$0:Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$1;->val$filename:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;->access$000(Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 131
    .local v0, "url":Ljava/net/URL;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$1;->this$0:Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;->access$100(Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;Ljava/net/URL;)Ljava/security/ProtectionDomain;

    move-result-object v1

    .line 133
    .local v1, "staticDomain":Ljava/security/ProtectionDomain;
    :try_start_0
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$1;->val$cx:Lcom/trendmicro/hippo/Context;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$1;->val$scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {v0}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4, v1}, Lcom/trendmicro/hippo/tools/shell/Main;->processFileSecure(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    nop

    .line 138
    const/4 v2, 0x0

    return-object v2

    .line 135
    :catch_0
    move-exception v2

    .line 136
    .local v2, "ioex":Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method
