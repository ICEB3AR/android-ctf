.class public Lcom/trendmicro/hippo/NativeJavaConstructor;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "NativeJavaConstructor.java"


# static fields
.field private static final serialVersionUID:J = -0x7117f69fecc379afL


# instance fields
.field ctor:Lcom/trendmicro/hippo/MemberBox;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/MemberBox;)V
    .locals 0
    .param p1, "ctor"    # Lcom/trendmicro/hippo/MemberBox;

    .line 30
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeJavaConstructor;->ctor:Lcom/trendmicro/hippo/MemberBox;

    .line 32
    return-void
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 38
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaConstructor;->ctor:Lcom/trendmicro/hippo/MemberBox;

    invoke-static {p1, p2, p4, v0}, Lcom/trendmicro/hippo/NativeJavaClass;->constructSpecific(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/MemberBox;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public getFunctionName()Ljava/lang/String;
    .locals 2

    .line 44
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaConstructor;->ctor:Lcom/trendmicro/hippo/MemberBox;

    iget-object v0, v0, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    invoke-static {v0}, Lcom/trendmicro/hippo/JavaMembers;->liveConnectSignature([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "sig":Ljava/lang/String;
    const-string v1, "<init>"

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[JavaConstructor "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaConstructor;->ctor:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/MemberBox;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
