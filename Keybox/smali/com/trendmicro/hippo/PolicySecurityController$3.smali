.class Lcom/trendmicro/hippo/PolicySecurityController$3;
.super Ljava/lang/Object;
.source "PolicySecurityController.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


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
        "Ljava/security/PrivilegedExceptionAction<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/PolicySecurityController;

.field final synthetic val$classLoader:Ljava/lang/ClassLoader;

.field final synthetic val$codeSource:Ljava/security/CodeSource;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/PolicySecurityController;Ljava/lang/ClassLoader;Ljava/security/CodeSource;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/PolicySecurityController;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 136
    iput-object p1, p0, Lcom/trendmicro/hippo/PolicySecurityController$3;->this$0:Lcom/trendmicro/hippo/PolicySecurityController;

    iput-object p2, p0, Lcom/trendmicro/hippo/PolicySecurityController$3;->val$classLoader:Ljava/lang/ClassLoader;

    iput-object p3, p0, Lcom/trendmicro/hippo/PolicySecurityController$3;->val$codeSource:Ljava/security/CodeSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 140
    new-instance v0, Lcom/trendmicro/hippo/PolicySecurityController$Loader;

    iget-object v1, p0, Lcom/trendmicro/hippo/PolicySecurityController$3;->val$classLoader:Ljava/lang/ClassLoader;

    iget-object v2, p0, Lcom/trendmicro/hippo/PolicySecurityController$3;->val$codeSource:Ljava/security/CodeSource;

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/PolicySecurityController$Loader;-><init>(Ljava/lang/ClassLoader;Ljava/security/CodeSource;)V

    .line 142
    .local v0, "loader":Lcom/trendmicro/hippo/PolicySecurityController$Loader;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Lcom/trendmicro/hippo/PolicySecurityController$SecureCaller;

    .line 143
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "Impl"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 144
    invoke-static {}, Lcom/trendmicro/hippo/PolicySecurityController;->access$000()[B

    move-result-object v2

    .line 142
    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/PolicySecurityController$Loader;->defineClass(Ljava/lang/String;[B)Ljava/lang/Class;

    move-result-object v1

    .line 145
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method
