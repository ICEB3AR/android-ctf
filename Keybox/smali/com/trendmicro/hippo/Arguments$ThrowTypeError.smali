.class Lcom/trendmicro/hippo/Arguments$ThrowTypeError;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "Arguments.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Arguments;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ThrowTypeError"
.end annotation


# instance fields
.field private propertyName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "propertyName"    # Ljava/lang/String;

    .line 421
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 422
    iput-object p1, p0, Lcom/trendmicro/hippo/Arguments$ThrowTypeError;->propertyName:Ljava/lang/String;

    .line 423
    return-void
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 427
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments$ThrowTypeError;->propertyName:Ljava/lang/String;

    const-string v1, "msg.arguments.not.access.strict"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method
