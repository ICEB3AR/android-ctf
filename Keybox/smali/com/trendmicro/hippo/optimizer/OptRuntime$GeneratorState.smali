.class public Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;
.super Ljava/lang/Object;
.source "OptRuntime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/optimizer/OptRuntime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GeneratorState"
.end annotation


# static fields
.field static final CLASS_NAME:Ljava/lang/String; = "com/trendmicro/hippo/optimizer/OptRuntime$GeneratorState"

.field static final resumptionPoint_NAME:Ljava/lang/String; = "resumptionPoint"

.field static final resumptionPoint_TYPE:Ljava/lang/String; = "I"

.field static final thisObj_NAME:Ljava/lang/String; = "thisObj"

.field static final thisObj_TYPE:Ljava/lang/String; = "Lcom/trendmicro/hippo/Scriptable;"


# instance fields
.field localsState:[Ljava/lang/Object;

.field maxLocals:I

.field maxStack:I

.field public resumptionPoint:I

.field stackState:[Ljava/lang/Object;

.field public thisObj:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/Scriptable;II)V
    .locals 0
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "maxLocals"    # I
    .param p3, "maxStack"    # I

    .line 297
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 298
    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;->thisObj:Lcom/trendmicro/hippo/Scriptable;

    .line 299
    iput p2, p0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;->maxLocals:I

    .line 300
    iput p3, p0, Lcom/trendmicro/hippo/optimizer/OptRuntime$GeneratorState;->maxStack:I

    .line 301
    return-void
.end method
