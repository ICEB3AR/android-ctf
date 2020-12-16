.class Lcom/trendmicro/hippo/FieldAndMethods;
.super Lcom/trendmicro/hippo/NativeJavaMethod;
.source "JavaMembers.java"


# static fields
.field private static final serialVersionUID:J = -0x7ffca5a02b1fef53L


# instance fields
.field field:Ljava/lang/reflect/Field;

.field javaObject:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/Scriptable;[Lcom/trendmicro/hippo/MemberBox;Ljava/lang/reflect/Field;)V
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "methods"    # [Lcom/trendmicro/hippo/MemberBox;
    .param p3, "field"    # Ljava/lang/reflect/Field;

    .line 890
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/NativeJavaMethod;-><init>([Lcom/trendmicro/hippo/MemberBox;)V

    .line 891
    iput-object p3, p0, Lcom/trendmicro/hippo/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    .line 892
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/FieldAndMethods;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 893
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getFunctionPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/FieldAndMethods;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 894
    return-void
.end method


# virtual methods
.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 899
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_0

    .line 900
    return-object p0

    .line 904
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    iget-object v1, p0, Lcom/trendmicro/hippo/FieldAndMethods;->javaObject:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 905
    .local v0, "rval":Ljava/lang/Object;
    iget-object v1, p0, Lcom/trendmicro/hippo/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 909
    .local v1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    nop

    .line 910
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v2

    .line 911
    .local v2, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v3

    invoke-virtual {v3, v2, p0, v0, v1}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 912
    instance-of v3, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v3, :cond_1

    .line 913
    move-object v3, v0

    check-cast v3, Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v3, p1}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 915
    :cond_1
    return-object v0

    .line 906
    .end local v0    # "rval":Ljava/lang/Object;
    .end local v1    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "cx":Lcom/trendmicro/hippo/Context;
    :catch_0
    move-exception v0

    .line 907
    .local v0, "accEx":Ljava/lang/IllegalAccessException;
    iget-object v1, p0, Lcom/trendmicro/hippo/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    .line 908
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    .line 907
    const-string v2, "msg.java.internal.private"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1
.end method
