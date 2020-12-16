.class Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;
.super Ljava/lang/Object;
.source "VMBridge_jdk18.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18;->newInterfaceProxy(Ljava/lang/Object;Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/InterfaceAdapter;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18;

.field final synthetic val$adapter:Lcom/trendmicro/hippo/InterfaceAdapter;

.field final synthetic val$cf:Lcom/trendmicro/hippo/ContextFactory;

.field final synthetic val$target:Ljava/lang/Object;

.field final synthetic val$topScope:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18;Ljava/lang/Object;Lcom/trendmicro/hippo/InterfaceAdapter;Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 100
    iput-object p1, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;->this$0:Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18;

    iput-object p2, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;->val$target:Ljava/lang/Object;

    iput-object p3, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;->val$adapter:Lcom/trendmicro/hippo/InterfaceAdapter;

    iput-object p4, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;->val$cf:Lcom/trendmicro/hippo/ContextFactory;

    iput-object p5, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;->val$topScope:Lcom/trendmicro/hippo/Scriptable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 109
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Object;

    if-ne v0, v1, :cond_3

    .line 110
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    .line 111
    .local v0, "methodName":Ljava/lang/String;
    const-string v1, "equals"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 112
    const/4 v1, 0x0

    aget-object v2, p3, v1

    .line 117
    .local v2, "other":Ljava/lang/Object;
    if-ne p1, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 119
    .end local v2    # "other":Ljava/lang/Object;
    :cond_1
    const-string v1, "hashCode"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 120
    iget-object v1, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;->val$target:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1

    .line 122
    :cond_2
    const-string v1, "toString"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 123
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Proxy["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;->val$target:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 126
    .end local v0    # "methodName":Ljava/lang/String;
    :cond_3
    iget-object v2, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;->val$adapter:Lcom/trendmicro/hippo/InterfaceAdapter;

    iget-object v3, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;->val$cf:Lcom/trendmicro/hippo/ContextFactory;

    iget-object v4, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;->val$target:Ljava/lang/Object;

    iget-object v5, p0, Lcom/trendmicro/hippo/jdk18/VMBridge_jdk18$1;->val$topScope:Lcom/trendmicro/hippo/Scriptable;

    move-object v6, p1

    move-object v7, p2

    move-object v8, p3

    invoke-virtual/range {v2 .. v8}, Lcom/trendmicro/hippo/InterfaceAdapter;->invoke(Lcom/trendmicro/hippo/ContextFactory;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
