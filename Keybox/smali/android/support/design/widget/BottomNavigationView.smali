.class public Landroid/support/design/widget/BottomNavigationView;
.super Landroid/widget/FrameLayout;
.source "BottomNavigationView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/BottomNavigationView$SavedState;,
        Landroid/support/design/widget/BottomNavigationView$OnNavigationItemReselectedListener;,
        Landroid/support/design/widget/BottomNavigationView$OnNavigationItemSelectedListener;
    }
.end annotation


# static fields
.field private static final MENU_PRESENTER_ID:I = 0x1


# instance fields
.field private final menu:Landroid/support/v7/view/menu/MenuBuilder;

.field private menuInflater:Landroid/view/MenuInflater;

.field private final menuView:Landroid/support/design/internal/BottomNavigationMenuView;

.field private final presenter:Landroid/support/design/internal/BottomNavigationPresenter;

.field private reselectedListener:Landroid/support/design/widget/BottomNavigationView$OnNavigationItemReselectedListener;

.field private selectedListener:Landroid/support/design/widget/BottomNavigationView$OnNavigationItemSelectedListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 110
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/BottomNavigationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 114
    sget v0, Landroid/support/design/R$attr;->bottomNavigationStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/design/widget/BottomNavigationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 115
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 118
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 103
    new-instance v0, Landroid/support/design/internal/BottomNavigationPresenter;

    invoke-direct {v0}, Landroid/support/design/internal/BottomNavigationPresenter;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->presenter:Landroid/support/design/internal/BottomNavigationPresenter;

    .line 121
    new-instance v0, Landroid/support/design/internal/BottomNavigationMenu;

    invoke-direct {v0, p1}, Landroid/support/design/internal/BottomNavigationMenu;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menu:Landroid/support/v7/view/menu/MenuBuilder;

    .line 123
    new-instance v0, Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-direct {v0, p1}, Landroid/support/design/internal/BottomNavigationMenuView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    .line 124
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 127
    .local v0, "params":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v1, 0x11

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 128
    iget-object v1, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v1, v0}, Landroid/support/design/internal/BottomNavigationMenuView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 130
    iget-object v1, p0, Landroid/support/design/widget/BottomNavigationView;->presenter:Landroid/support/design/internal/BottomNavigationPresenter;

    iget-object v2, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v1, v2}, Landroid/support/design/internal/BottomNavigationPresenter;->setBottomNavigationMenuView(Landroid/support/design/internal/BottomNavigationMenuView;)V

    .line 131
    iget-object v1, p0, Landroid/support/design/widget/BottomNavigationView;->presenter:Landroid/support/design/internal/BottomNavigationPresenter;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/design/internal/BottomNavigationPresenter;->setId(I)V

    .line 132
    iget-object v1, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    iget-object v3, p0, Landroid/support/design/widget/BottomNavigationView;->presenter:Landroid/support/design/internal/BottomNavigationPresenter;

    invoke-virtual {v1, v3}, Landroid/support/design/internal/BottomNavigationMenuView;->setPresenter(Landroid/support/design/internal/BottomNavigationPresenter;)V

    .line 133
    iget-object v1, p0, Landroid/support/design/widget/BottomNavigationView;->menu:Landroid/support/v7/view/menu/MenuBuilder;

    iget-object v3, p0, Landroid/support/design/widget/BottomNavigationView;->presenter:Landroid/support/design/internal/BottomNavigationPresenter;

    invoke-virtual {v1, v3}, Landroid/support/v7/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/view/menu/MenuPresenter;)V

    .line 134
    iget-object v1, p0, Landroid/support/design/widget/BottomNavigationView;->presenter:Landroid/support/design/internal/BottomNavigationPresenter;

    invoke-virtual {p0}, Landroid/support/design/widget/BottomNavigationView;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Landroid/support/design/widget/BottomNavigationView;->menu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v1, v3, v4}, Landroid/support/design/internal/BottomNavigationPresenter;->initForMenu(Landroid/content/Context;Landroid/support/v7/view/menu/MenuBuilder;)V

    .line 137
    sget-object v7, Landroid/support/design/R$styleable;->BottomNavigationView:[I

    sget v9, Landroid/support/design/R$style;->Widget_Design_BottomNavigationView:I

    const/4 v1, 0x2

    new-array v10, v1, [I

    sget v1, Landroid/support/design/R$styleable;->BottomNavigationView_itemTextAppearanceInactive:I

    const/4 v3, 0x0

    aput v1, v10, v3

    sget v1, Landroid/support/design/R$styleable;->BottomNavigationView_itemTextAppearanceActive:I

    aput v1, v10, v2

    .line 138
    move-object v5, p1

    move-object v6, p2

    move v8, p3

    invoke-static/range {v5 .. v10}, Landroid/support/design/internal/ThemeEnforcement;->obtainTintedStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/support/v7/widget/TintTypedArray;

    move-result-object v1

    .line 147
    .local v1, "a":Landroid/support/v7/widget/TintTypedArray;
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_itemIconTint:I

    invoke-virtual {v1, v4}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 148
    iget-object v4, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    sget v5, Landroid/support/design/R$styleable;->BottomNavigationView_itemIconTint:I

    invoke-virtual {v1, v5}, Landroid/support/v7/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/support/design/internal/BottomNavigationMenuView;->setIconTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_0

    .line 150
    :cond_0
    iget-object v4, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    const v5, 0x1010038

    .line 151
    invoke-virtual {v4, v5}, Landroid/support/design/internal/BottomNavigationMenuView;->createDefaultColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    .line 150
    invoke-virtual {v4, v5}, Landroid/support/design/internal/BottomNavigationMenuView;->setIconTintList(Landroid/content/res/ColorStateList;)V

    .line 154
    :goto_0
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_itemIconSize:I

    .line 157
    invoke-virtual {p0}, Landroid/support/design/widget/BottomNavigationView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Landroid/support/design/R$dimen;->design_bottom_navigation_icon_size:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 155
    invoke-virtual {v1, v4, v5}, Landroid/support/v7/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v4

    .line 154
    invoke-virtual {p0, v4}, Landroid/support/design/widget/BottomNavigationView;->setItemIconSize(I)V

    .line 158
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_itemTextAppearanceInactive:I

    invoke-virtual {v1, v4}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 159
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_itemTextAppearanceInactive:I

    .line 160
    invoke-virtual {v1, v4, v3}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result v4

    .line 159
    invoke-virtual {p0, v4}, Landroid/support/design/widget/BottomNavigationView;->setItemTextAppearanceInactive(I)V

    .line 162
    :cond_1
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_itemTextAppearanceActive:I

    invoke-virtual {v1, v4}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 163
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_itemTextAppearanceActive:I

    .line 164
    invoke-virtual {v1, v4, v3}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result v4

    .line 163
    invoke-virtual {p0, v4}, Landroid/support/design/widget/BottomNavigationView;->setItemTextAppearanceActive(I)V

    .line 167
    :cond_2
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_itemTextColor:I

    invoke-virtual {v1, v4}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 168
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_itemTextColor:I

    invoke-virtual {v1, v4}, Landroid/support/v7/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/support/design/widget/BottomNavigationView;->setItemTextColor(Landroid/content/res/ColorStateList;)V

    .line 171
    :cond_3
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_elevation:I

    invoke-virtual {v1, v4}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 172
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_elevation:I

    .line 173
    invoke-virtual {v1, v4, v3}, Landroid/support/v7/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v4

    int-to-float v4, v4

    .line 172
    invoke-static {p0, v4}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    .line 176
    :cond_4
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_labelVisibilityMode:I

    const/4 v5, -0x1

    .line 177
    invoke-virtual {v1, v4, v5}, Landroid/support/v7/widget/TintTypedArray;->getInteger(II)I

    move-result v4

    .line 176
    invoke-virtual {p0, v4}, Landroid/support/design/widget/BottomNavigationView;->setLabelVisibilityMode(I)V

    .line 180
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_itemHorizontalTranslationEnabled:I

    .line 181
    invoke-virtual {v1, v4, v2}, Landroid/support/v7/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v2

    .line 180
    invoke-virtual {p0, v2}, Landroid/support/design/widget/BottomNavigationView;->setItemHorizontalTranslationEnabled(Z)V

    .line 183
    sget v2, Landroid/support/design/R$styleable;->BottomNavigationView_itemBackground:I

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result v2

    .line 184
    .local v2, "itemBackground":I
    iget-object v4, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v4, v2}, Landroid/support/design/internal/BottomNavigationMenuView;->setItemBackgroundRes(I)V

    .line 186
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_menu:I

    invoke-virtual {v1, v4}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 187
    sget v4, Landroid/support/design/R$styleable;->BottomNavigationView_menu:I

    invoke-virtual {v1, v4, v3}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result v3

    invoke-virtual {p0, v3}, Landroid/support/design/widget/BottomNavigationView;->inflateMenu(I)V

    .line 189
    :cond_5
    invoke-virtual {v1}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    .line 191
    iget-object v3, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {p0, v3, v0}, Landroid/support/design/widget/BottomNavigationView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 192
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-ge v3, v4, :cond_6

    .line 193
    invoke-direct {p0, p1}, Landroid/support/design/widget/BottomNavigationView;->addCompatibilityTopDivider(Landroid/content/Context;)V

    .line 196
    :cond_6
    iget-object v3, p0, Landroid/support/design/widget/BottomNavigationView;->menu:Landroid/support/v7/view/menu/MenuBuilder;

    new-instance v4, Landroid/support/design/widget/BottomNavigationView$1;

    invoke-direct {v4, p0}, Landroid/support/design/widget/BottomNavigationView$1;-><init>(Landroid/support/design/widget/BottomNavigationView;)V

    invoke-virtual {v3, v4}, Landroid/support/v7/view/menu/MenuBuilder;->setCallback(Landroid/support/v7/view/menu/MenuBuilder$Callback;)V

    .line 210
    return-void
.end method

.method static synthetic access$000(Landroid/support/design/widget/BottomNavigationView;)Landroid/support/design/widget/BottomNavigationView$OnNavigationItemReselectedListener;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/BottomNavigationView;

    .line 97
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->reselectedListener:Landroid/support/design/widget/BottomNavigationView$OnNavigationItemReselectedListener;

    return-object v0
.end method

.method static synthetic access$100(Landroid/support/design/widget/BottomNavigationView;)Landroid/support/design/widget/BottomNavigationView$OnNavigationItemSelectedListener;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/BottomNavigationView;

    .line 97
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->selectedListener:Landroid/support/design/widget/BottomNavigationView$OnNavigationItemSelectedListener;

    return-object v0
.end method

.method private addCompatibilityTopDivider(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .line 532
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 533
    .local v0, "divider":Landroid/view/View;
    sget v1, Landroid/support/design/R$color;->design_bottom_navigation_shadow_color:I

    .line 534
    invoke-static {p1, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    .line 533
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 535
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 538
    invoke-virtual {p0}, Landroid/support/design/widget/BottomNavigationView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Landroid/support/design/R$dimen;->design_bottom_navigation_shadow_height:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    const/4 v3, -0x1

    invoke-direct {v1, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 539
    .local v1, "dividerParams":Landroid/widget/FrameLayout$LayoutParams;
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 540
    invoke-virtual {p0, v0}, Landroid/support/design/widget/BottomNavigationView;->addView(Landroid/view/View;)V

    .line 541
    return-void
.end method

.method private getMenuInflater()Landroid/view/MenuInflater;
    .locals 2

    .line 544
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuInflater:Landroid/view/MenuInflater;

    if-nez v0, :cond_0

    .line 545
    new-instance v0, Landroid/support/v7/view/SupportMenuInflater;

    invoke-virtual {p0}, Landroid/support/design/widget/BottomNavigationView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/view/SupportMenuInflater;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuInflater:Landroid/view/MenuInflater;

    .line 547
    :cond_0
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuInflater:Landroid/view/MenuInflater;

    return-object v0
.end method


# virtual methods
.method public getItemBackground()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 373
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0}, Landroid/support/design/internal/BottomNavigationMenuView;->getItemBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getItemBackgroundResource()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 352
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0}, Landroid/support/design/internal/BottomNavigationMenuView;->getItemBackgroundRes()I

    move-result v0

    return v0
.end method

.method public getItemIconSize()I
    .locals 1

    .line 315
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0}, Landroid/support/design/internal/BottomNavigationMenuView;->getItemIconSize()I

    move-result v0

    return v0
.end method

.method public getItemIconTintList()Landroid/content/res/ColorStateList;
    .locals 1

    .line 270
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0}, Landroid/support/design/internal/BottomNavigationMenuView;->getIconTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getItemTextAppearanceActive()I
    .locals 1

    .line 478
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0}, Landroid/support/design/internal/BottomNavigationMenuView;->getItemTextAppearanceActive()I

    move-result v0

    return v0
.end method

.method public getItemTextAppearanceInactive()I
    .locals 1

    .line 459
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0}, Landroid/support/design/internal/BottomNavigationMenuView;->getItemTextAppearanceInactive()I

    move-result v0

    return v0
.end method

.method public getItemTextColor()Landroid/content/res/ColorStateList;
    .locals 1

    .line 328
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0}, Landroid/support/design/internal/BottomNavigationMenuView;->getItemTextColor()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getLabelVisibilityMode()I
    .locals 1

    .line 440
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0}, Landroid/support/design/internal/BottomNavigationMenuView;->getLabelVisibilityMode()I

    move-result v0

    return v0
.end method

.method public getMaxItemCount()I
    .locals 1

    .line 259
    const/4 v0, 0x5

    return v0
.end method

.method public getMenu()Landroid/view/Menu;
    .locals 1

    .line 240
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menu:Landroid/support/v7/view/menu/MenuBuilder;

    return-object v0
.end method

.method public getSelectedItemId()I
    .locals 1

    .line 393
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0}, Landroid/support/design/internal/BottomNavigationMenuView;->getSelectedItemId()I

    move-result v0

    return v0
.end method

.method public inflateMenu(I)V
    .locals 3
    .param p1, "resId"    # I

    .line 251
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->presenter:Landroid/support/design/internal/BottomNavigationPresenter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/design/internal/BottomNavigationPresenter;->setUpdateSuspended(Z)V

    .line 252
    invoke-direct {p0}, Landroid/support/design/widget/BottomNavigationView;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    iget-object v2, p0, Landroid/support/design/widget/BottomNavigationView;->menu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0, p1, v2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 253
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->presenter:Landroid/support/design/internal/BottomNavigationPresenter;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/support/design/internal/BottomNavigationPresenter;->setUpdateSuspended(Z)V

    .line 254
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->presenter:Landroid/support/design/internal/BottomNavigationPresenter;

    invoke-virtual {v0, v1}, Landroid/support/design/internal/BottomNavigationPresenter;->updateMenuView(Z)V

    .line 255
    return-void
.end method

.method public isItemHorizontalTranslationEnabled()Z
    .locals 1

    .line 503
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0}, Landroid/support/design/internal/BottomNavigationMenuView;->isItemHorizontalTranslationEnabled()Z

    move-result v0

    return v0
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 3
    .param p1, "state"    # Landroid/os/Parcelable;

    .line 561
    instance-of v0, p1, Landroid/support/design/widget/BottomNavigationView$SavedState;

    if-nez v0, :cond_0

    .line 562
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 563
    return-void

    .line 565
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/support/design/widget/BottomNavigationView$SavedState;

    .line 566
    .local v0, "savedState":Landroid/support/design/widget/BottomNavigationView$SavedState;
    invoke-virtual {v0}, Landroid/support/design/widget/BottomNavigationView$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 567
    iget-object v1, p0, Landroid/support/design/widget/BottomNavigationView;->menu:Landroid/support/v7/view/menu/MenuBuilder;

    iget-object v2, v0, Landroid/support/design/widget/BottomNavigationView$SavedState;->menuPresenterState:Landroid/os/Bundle;

    invoke-virtual {v1, v2}, Landroid/support/v7/view/menu/MenuBuilder;->restorePresenterStates(Landroid/os/Bundle;)V

    .line 568
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 4

    .line 552
    invoke-super {p0}, Landroid/widget/FrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 553
    .local v0, "superState":Landroid/os/Parcelable;
    new-instance v1, Landroid/support/design/widget/BottomNavigationView$SavedState;

    invoke-direct {v1, v0}, Landroid/support/design/widget/BottomNavigationView$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 554
    .local v1, "savedState":Landroid/support/design/widget/BottomNavigationView$SavedState;
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    iput-object v2, v1, Landroid/support/design/widget/BottomNavigationView$SavedState;->menuPresenterState:Landroid/os/Bundle;

    .line 555
    iget-object v2, p0, Landroid/support/design/widget/BottomNavigationView;->menu:Landroid/support/v7/view/menu/MenuBuilder;

    iget-object v3, v1, Landroid/support/design/widget/BottomNavigationView$SavedState;->menuPresenterState:Landroid/os/Bundle;

    invoke-virtual {v2, v3}, Landroid/support/v7/view/menu/MenuBuilder;->savePresenterStates(Landroid/os/Bundle;)V

    .line 556
    return-object v1
.end method

.method public setItemBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;

    .line 383
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/BottomNavigationMenuView;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    .line 384
    return-void
.end method

.method public setItemBackgroundResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .line 362
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/BottomNavigationMenuView;->setItemBackgroundRes(I)V

    .line 363
    return-void
.end method

.method public setItemHorizontalTranslationEnabled(Z)V
    .locals 2
    .param p1, "itemHorizontalTranslationEnabled"    # Z

    .line 489
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0}, Landroid/support/design/internal/BottomNavigationMenuView;->isItemHorizontalTranslationEnabled()Z

    move-result v0

    if-eq v0, p1, :cond_0

    .line 490
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/BottomNavigationMenuView;->setItemHorizontalTranslationEnabled(Z)V

    .line 491
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->presenter:Landroid/support/design/internal/BottomNavigationPresenter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/design/internal/BottomNavigationPresenter;->updateMenuView(Z)V

    .line 493
    :cond_0
    return-void
.end method

.method public setItemIconSize(I)V
    .locals 1
    .param p1, "iconSize"    # I

    .line 292
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/BottomNavigationMenuView;->setItemIconSize(I)V

    .line 293
    return-void
.end method

.method public setItemIconSizeRes(I)V
    .locals 1
    .param p1, "iconSizeRes"    # I

    .line 304
    invoke-virtual {p0}, Landroid/support/design/widget/BottomNavigationView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/BottomNavigationView;->setItemIconSize(I)V

    .line 305
    return-void
.end method

.method public setItemIconTintList(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .line 280
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/BottomNavigationMenuView;->setIconTintList(Landroid/content/res/ColorStateList;)V

    .line 281
    return-void
.end method

.method public setItemTextAppearanceActive(I)V
    .locals 1
    .param p1, "textAppearanceRes"    # I

    .line 468
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/BottomNavigationMenuView;->setItemTextAppearanceActive(I)V

    .line 469
    return-void
.end method

.method public setItemTextAppearanceInactive(I)V
    .locals 1
    .param p1, "textAppearanceRes"    # I

    .line 449
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/BottomNavigationMenuView;->setItemTextAppearanceInactive(I)V

    .line 450
    return-void
.end method

.method public setItemTextColor(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1, "textColor"    # Landroid/content/res/ColorStateList;

    .line 339
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/BottomNavigationMenuView;->setItemTextColor(Landroid/content/res/ColorStateList;)V

    .line 340
    return-void
.end method

.method public setLabelVisibilityMode(I)V
    .locals 2
    .param p1, "labelVisibilityMode"    # I

    .line 426
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0}, Landroid/support/design/internal/BottomNavigationMenuView;->getLabelVisibilityMode()I

    move-result v0

    if-eq v0, p1, :cond_0

    .line 427
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menuView:Landroid/support/design/internal/BottomNavigationMenuView;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/BottomNavigationMenuView;->setLabelVisibilityMode(I)V

    .line 428
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->presenter:Landroid/support/design/internal/BottomNavigationPresenter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/design/internal/BottomNavigationPresenter;->updateMenuView(Z)V

    .line 430
    :cond_0
    return-void
.end method

.method public setOnNavigationItemReselectedListener(Landroid/support/design/widget/BottomNavigationView$OnNavigationItemReselectedListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/support/design/widget/BottomNavigationView$OnNavigationItemReselectedListener;

    .line 234
    iput-object p1, p0, Landroid/support/design/widget/BottomNavigationView;->reselectedListener:Landroid/support/design/widget/BottomNavigationView$OnNavigationItemReselectedListener;

    .line 235
    return-void
.end method

.method public setOnNavigationItemSelectedListener(Landroid/support/design/widget/BottomNavigationView$OnNavigationItemSelectedListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/support/design/widget/BottomNavigationView$OnNavigationItemSelectedListener;

    .line 222
    iput-object p1, p0, Landroid/support/design/widget/BottomNavigationView;->selectedListener:Landroid/support/design/widget/BottomNavigationView$OnNavigationItemSelectedListener;

    .line 223
    return-void
.end method

.method public setSelectedItemId(I)V
    .locals 4
    .param p1, "itemId"    # I

    .line 403
    iget-object v0, p0, Landroid/support/design/widget/BottomNavigationView;->menu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 404
    .local v0, "item":Landroid/view/MenuItem;
    if-eqz v0, :cond_0

    .line 405
    iget-object v1, p0, Landroid/support/design/widget/BottomNavigationView;->menu:Landroid/support/v7/view/menu/MenuBuilder;

    iget-object v2, p0, Landroid/support/design/widget/BottomNavigationView;->presenter:Landroid/support/design/internal/BottomNavigationPresenter;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/support/v7/view/menu/MenuBuilder;->performItemAction(Landroid/view/MenuItem;Landroid/support/v7/view/menu/MenuPresenter;I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 406
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 409
    :cond_0
    return-void
.end method
