.class Lcom/trendmicro/hippo/regexp/RECompiled;
.super Ljava/lang/Object;
.source "NativeRegExp.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x554745732fcce675L


# instance fields
.field anchorCh:I

.field classCount:I

.field classList:[Lcom/trendmicro/hippo/regexp/RECharSet;

.field flags:I

.field parenCount:I

.field program:[B

.field final source:[C


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .line 2791
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2789
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/regexp/RECompiled;->anchorCh:I

    .line 2792
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    .line 2793
    return-void
.end method
