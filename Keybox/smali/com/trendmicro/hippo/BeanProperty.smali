.class Lcom/trendmicro/hippo/BeanProperty;
.super Ljava/lang/Object;
.source "JavaMembers.java"


# instance fields
.field getter:Lcom/trendmicro/hippo/MemberBox;

.field setter:Lcom/trendmicro/hippo/MemberBox;

.field setters:Lcom/trendmicro/hippo/NativeJavaMethod;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/MemberBox;Lcom/trendmicro/hippo/MemberBox;Lcom/trendmicro/hippo/NativeJavaMethod;)V
    .locals 0
    .param p1, "getter"    # Lcom/trendmicro/hippo/MemberBox;
    .param p2, "setter"    # Lcom/trendmicro/hippo/MemberBox;
    .param p3, "setters"    # Lcom/trendmicro/hippo/NativeJavaMethod;

    .line 873
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 874
    iput-object p1, p0, Lcom/trendmicro/hippo/BeanProperty;->getter:Lcom/trendmicro/hippo/MemberBox;

    .line 875
    iput-object p2, p0, Lcom/trendmicro/hippo/BeanProperty;->setter:Lcom/trendmicro/hippo/MemberBox;

    .line 876
    iput-object p3, p0, Lcom/trendmicro/hippo/BeanProperty;->setters:Lcom/trendmicro/hippo/NativeJavaMethod;

    .line 877
    return-void
.end method
