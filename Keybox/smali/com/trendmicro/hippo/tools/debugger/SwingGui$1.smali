.class Lcom/trendmicro/hippo/tools/debugger/SwingGui$1;
.super Ljavax/swing/filechooser/FileFilter;
.source "SwingGui.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/debugger/SwingGui;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/SwingGui;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 364
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-direct {p0}, Ljavax/swing/filechooser/FileFilter;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .locals 5
    .param p1, "f"    # Ljava/io/File;

    .line 367
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 368
    return v1

    .line 370
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 371
    .local v0, "n":Ljava/lang/String;
    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 372
    .local v2, "i":I
    if-lez v2, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v1

    if-ge v2, v3, :cond_1

    .line 373
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 374
    .local v3, "ext":Ljava/lang/String;
    const-string v4, "js"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 375
    return v1

    .line 378
    .end local v3    # "ext":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .line 383
    const-string v0, "JavaScript Files (*.js)"

    return-object v0
.end method
