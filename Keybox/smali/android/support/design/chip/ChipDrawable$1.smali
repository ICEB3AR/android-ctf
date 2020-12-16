.class Landroid/support/design/chip/ChipDrawable$1;
.super Landroid/support/v4/content/res/ResourcesCompat$FontCallback;
.source "ChipDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/chip/ChipDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/design/chip/ChipDrawable;


# direct methods
.method constructor <init>(Landroid/support/design/chip/ChipDrawable;)V
    .locals 0
    .param p1, "this$0"    # Landroid/support/design/chip/ChipDrawable;

    .line 178
    iput-object p1, p0, Landroid/support/design/chip/ChipDrawable$1;->this$0:Landroid/support/design/chip/ChipDrawable;

    invoke-direct {p0}, Landroid/support/v4/content/res/ResourcesCompat$FontCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onFontRetrievalFailed(I)V
    .locals 0
    .param p1, "reason"    # I

    .line 187
    return-void
.end method

.method public onFontRetrieved(Landroid/graphics/Typeface;)V
    .locals 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .line 181
    iget-object v0, p0, Landroid/support/design/chip/ChipDrawable$1;->this$0:Landroid/support/design/chip/ChipDrawable;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/support/design/chip/ChipDrawable;->access$002(Landroid/support/design/chip/ChipDrawable;Z)Z

    .line 182
    iget-object v0, p0, Landroid/support/design/chip/ChipDrawable$1;->this$0:Landroid/support/design/chip/ChipDrawable;

    invoke-virtual {v0}, Landroid/support/design/chip/ChipDrawable;->onSizeChange()V

    .line 183
    iget-object v0, p0, Landroid/support/design/chip/ChipDrawable$1;->this$0:Landroid/support/design/chip/ChipDrawable;

    invoke-virtual {v0}, Landroid/support/design/chip/ChipDrawable;->invalidateSelf()V

    .line 184
    return-void
.end method
