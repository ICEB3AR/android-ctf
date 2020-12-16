.class Lcom/trendmicro/hippo/Interpreter$GeneratorState;
.super Ljava/lang/Object;
.source "Interpreter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Interpreter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GeneratorState"
.end annotation


# instance fields
.field operation:I

.field returnedException:Ljava/lang/RuntimeException;

.field value:Ljava/lang/Object;


# direct methods
.method constructor <init>(ILjava/lang/Object;)V
    .locals 0
    .param p1, "operation"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 1014
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1015
    iput p1, p0, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->operation:I

    .line 1016
    iput-object p2, p0, Lcom/trendmicro/hippo/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    .line 1017
    return-void
.end method
