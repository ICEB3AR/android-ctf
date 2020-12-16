.class public Landroid/support/design/widget/TextInputEditText;
.super Landroid/support/v7/widget/AppCompatEditText;
.source "TextInputEditText.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/TextInputEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 44
    sget v0, Landroid/support/design/R$attr;->editTextStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/design/widget/TextInputEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 48
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 49
    return-void
.end method

.method private getHintFromLayout()Ljava/lang/CharSequence;
    .locals 2

    .line 87
    invoke-direct {p0}, Landroid/support/design/widget/TextInputEditText;->getTextInputLayout()Landroid/support/design/widget/TextInputLayout;

    move-result-object v0

    .line 88
    .local v0, "layout":Landroid/support/design/widget/TextInputLayout;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/design/widget/TextInputLayout;->getHint()Ljava/lang/CharSequence;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method private getTextInputLayout()Landroid/support/design/widget/TextInputLayout;
    .locals 2

    .line 75
    invoke-virtual {p0}, Landroid/support/design/widget/TextInputEditText;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 76
    .local v0, "parent":Landroid/view/ViewParent;
    :goto_0
    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_1

    .line 77
    instance-of v1, v0, Landroid/support/design/widget/TextInputLayout;

    if-eqz v1, :cond_0

    .line 78
    move-object v1, v0

    check-cast v1, Landroid/support/design/widget/TextInputLayout;

    return-object v1

    .line 80
    :cond_0
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_0

    .line 82
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method


# virtual methods
.method public getHint()Ljava/lang/CharSequence;
    .locals 2

    .line 55
    invoke-direct {p0}, Landroid/support/design/widget/TextInputEditText;->getTextInputLayout()Landroid/support/design/widget/TextInputLayout;

    move-result-object v0

    .line 56
    .local v0, "layout":Landroid/support/design/widget/TextInputLayout;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/design/widget/TextInputLayout;->isProvidingHint()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 57
    invoke-virtual {v0}, Landroid/support/design/widget/TextInputLayout;->getHint()Ljava/lang/CharSequence;

    move-result-object v1

    return-object v1

    .line 59
    :cond_0
    invoke-super {p0}, Landroid/support/v7/widget/AppCompatEditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v1

    return-object v1
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 2
    .param p1, "outAttrs"    # Landroid/view/inputmethod/EditorInfo;

    .line 64
    invoke-super {p0, p1}, Landroid/support/v7/widget/AppCompatEditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    .line 65
    .local v0, "ic":Landroid/view/inputmethod/InputConnection;
    if-eqz v0, :cond_0

    iget-object v1, p1, Landroid/view/inputmethod/EditorInfo;->hintText:Ljava/lang/CharSequence;

    if-nez v1, :cond_0

    .line 68
    invoke-direct {p0}, Landroid/support/design/widget/TextInputEditText;->getHintFromLayout()Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p1, Landroid/view/inputmethod/EditorInfo;->hintText:Ljava/lang/CharSequence;

    .line 70
    :cond_0
    return-object v0
.end method
