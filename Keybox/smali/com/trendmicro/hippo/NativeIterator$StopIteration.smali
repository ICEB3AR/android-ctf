.class Lcom/trendmicro/hippo/NativeIterator$StopIteration;
.super Lcom/trendmicro/hippo/NativeObject;
.source "NativeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/NativeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StopIteration"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x227d07bedda89dbfL


# direct methods
.method constructor <init>()V
    .locals 0

    .line 68
    invoke-direct {p0}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 73
    const-string v0, "StopIteration"

    return-object v0
.end method

.method public hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "instance"    # Lcom/trendmicro/hippo/Scriptable;

    .line 81
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeIterator$StopIteration;

    return v0
.end method
