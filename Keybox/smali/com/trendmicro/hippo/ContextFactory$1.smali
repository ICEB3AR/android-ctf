.class Lcom/trendmicro/hippo/ContextFactory$1;
.super Ljava/lang/Object;
.source "ContextFactory.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/ContextFactory;->createClassLoader(Ljava/lang/ClassLoader;)Lcom/trendmicro/hippo/GeneratedClassLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction<",
        "Lcom/trendmicro/hippo/DefiningClassLoader;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/ContextFactory;

.field final synthetic val$parent:Ljava/lang/ClassLoader;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/ContextFactory;Ljava/lang/ClassLoader;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/ContextFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 358
    iput-object p1, p0, Lcom/trendmicro/hippo/ContextFactory$1;->this$0:Lcom/trendmicro/hippo/ContextFactory;

    iput-object p2, p0, Lcom/trendmicro/hippo/ContextFactory$1;->val$parent:Ljava/lang/ClassLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Lcom/trendmicro/hippo/DefiningClassLoader;
    .locals 2

    .line 361
    new-instance v0, Lcom/trendmicro/hippo/DefiningClassLoader;

    iget-object v1, p0, Lcom/trendmicro/hippo/ContextFactory$1;->val$parent:Ljava/lang/ClassLoader;

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/DefiningClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    return-object v0
.end method

.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1

    .line 358
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ContextFactory$1;->run()Lcom/trendmicro/hippo/DefiningClassLoader;

    move-result-object v0

    return-object v0
.end method
