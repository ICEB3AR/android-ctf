.class Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions$1;
.super Ljava/lang/Object;
.source "JavaPolicySecurity.java"

# interfaces
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;->elements()Ljava/util/Enumeration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Enumeration<",
        "Ljava/security/Permission;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;

    .line 93
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions$1;->this$0:Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 1

    .line 94
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic nextElement()Ljava/lang/Object;
    .locals 1

    .line 93
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions$1;->nextElement()Ljava/security/Permission;

    move-result-object v0

    return-object v0
.end method

.method public nextElement()Ljava/security/Permission;
    .locals 1

    .line 95
    const/4 v0, 0x0

    return-object v0
.end method
