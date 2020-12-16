.class final Lcom/trendmicro/hippo/regexp/RECharSet;
.super Ljava/lang/Object;
.source "NativeRegExp.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x6e135f24919b1c1aL


# instance fields
.field volatile transient bits:[B

.field volatile transient converted:Z

.field final length:I

.field final sense:Z

.field final startIndex:I

.field final strlength:I


# direct methods
.method constructor <init>(IIIZ)V
    .locals 0
    .param p1, "length"    # I
    .param p2, "startIndex"    # I
    .param p3, "strlength"    # I
    .param p4, "sense"    # Z

    .line 2964
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2965
    iput p1, p0, Lcom/trendmicro/hippo/regexp/RECharSet;->length:I

    .line 2966
    iput p2, p0, Lcom/trendmicro/hippo/regexp/RECharSet;->startIndex:I

    .line 2967
    iput p3, p0, Lcom/trendmicro/hippo/regexp/RECharSet;->strlength:I

    .line 2968
    iput-boolean p4, p0, Lcom/trendmicro/hippo/regexp/RECharSet;->sense:Z

    .line 2969
    return-void
.end method
