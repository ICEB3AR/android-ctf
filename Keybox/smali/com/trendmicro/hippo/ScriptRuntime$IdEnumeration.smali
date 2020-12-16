.class Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;
.super Ljava/lang/Object;
.source "ScriptRuntime.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/ScriptRuntime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IdEnumeration"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field currentId:Ljava/lang/Object;

.field enumNumbers:Z

.field enumType:I

.field ids:[Ljava/lang/Object;

.field index:I

.field iterator:Lcom/trendmicro/hippo/Scriptable;

.field obj:Lcom/trendmicro/hippo/Scriptable;

.field used:Lcom/trendmicro/hippo/ObjToIntMap;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/trendmicro/hippo/ScriptRuntime$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trendmicro/hippo/ScriptRuntime$1;

    .line 2170
    invoke-direct {p0}, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;-><init>()V

    return-void
.end method
