.class Lcom/trendmicro/hippo/tools/shell/Main$ScriptReference;
.super Ljava/lang/ref/SoftReference;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/shell/Main;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ScriptReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/SoftReference<",
        "Lcom/trendmicro/hippo/Script;",
        ">;"
    }
.end annotation


# instance fields
.field digest:[B

.field path:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;[BLcom/trendmicro/hippo/Script;Ljava/lang/ref/ReferenceQueue;)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "digest"    # [B
    .param p3, "script"    # Lcom/trendmicro/hippo/Script;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B",
            "Lcom/trendmicro/hippo/Script;",
            "Ljava/lang/ref/ReferenceQueue<",
            "Lcom/trendmicro/hippo/Script;",
            ">;)V"
        }
    .end annotation

    .line 710
    .local p4, "queue":Ljava/lang/ref/ReferenceQueue;, "Ljava/lang/ref/ReferenceQueue<Lcom/trendmicro/hippo/Script;>;"
    invoke-direct {p0, p3, p4}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 711
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/Main$ScriptReference;->path:Ljava/lang/String;

    .line 712
    iput-object p2, p0, Lcom/trendmicro/hippo/tools/shell/Main$ScriptReference;->digest:[B

    .line 713
    return-void
.end method
