.class public Lcom/trendmicro/hippo/ContextFactoryFactory;
.super Ljava/lang/Object;
.source "ContextFactoryFactory.java"


# instance fields
.field public contextURL:Ljava/lang/String;

.field private hintkey0:Ljava/lang/String;

.field public javauri:Ljava/net/URI;


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/lang/String;

    const-string v1, "content://sms"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/ContextFactoryFactory;->contextURL:Ljava/lang/String;

    .line 17
    new-instance v0, Ljava/net/URI;

    iget-object v1, p0, Lcom/trendmicro/hippo/ContextFactoryFactory;->contextURL:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/ContextFactoryFactory;->javauri:Ljava/net/URI;

    .line 18
    new-instance v0, Ljava/lang/String;

    const-string v1, "TrendMicro"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/ContextFactoryFactory;->hintkey0:Ljava/lang/String;

    .line 19
    return-void
.end method


# virtual methods
.method public ContextFactoryFactory(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    new-instance v0, Lcom/trendmicro/hippo/ContextFactoryFactory;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ContextFactoryFactory;-><init>()V

    return-object v0
.end method

.method public CreateKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "keynumber"    # I

    .line 43
    iget-object v0, p0, Lcom/trendmicro/hippo/ContextFactoryFactory;->hintkey0:Ljava/lang/String;

    return-object v0
.end method

.method public PreinitializedSBox()[B
    .locals 1

    .line 36
    const/16 v0, 0x100

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    .line 38
    .local v0, "S":[B
    return-object v0

    :array_0
    .array-data 1
        0x40t
        -0x30t
        0x72t
        0x0t
        -0x14t
        0x6ct
        -0x1et
        0x55t
        -0x66t
        -0x65t
        0x69t
        0x47t
        0x7bt
        -0x45t
        0x32t
        0x4et
        -0x50t
        -0x67t
        0x18t
        0x6at
        0x45t
        -0x7ct
        -0x17t
        0x65t
        -0x28t
        0x7dt
        -0x41t
        0x6ft
        -0x33t
        -0x4ct
        0x79t
        0x2ct
        0x35t
        0x21t
        -0x46t
        0x2bt
        -0x1ft
        0x4bt
        -0x4ft
        0x76t
        -0x18t
        -0x6dt
        0x4t
        0x4dt
        0x3ct
        0xbt
        0x56t
        0x41t
        0x8t
        -0x8t
        0x6dt
        -0xbt
        0xat
        0x3t
        -0x4bt
        -0x7bt
        0x28t
        -0x5et
        0x4ct
        -0x2ft
        0x38t
        0x7t
        0x70t
        0x5ct
        0x50t
        0x9t
        -0x6ct
        -0x3dt
        -0xet
        -0x6at
        -0x25t
        -0x7ft
        0x51t
        -0x1dt
        0x75t
        -0x2dt
        -0x40t
        0x33t
        -0x51t
        -0x6bt
        -0x6et
        -0x47t
        0x23t
        -0x16t
        0x3bt
        0x52t
        0x64t
        -0x56t
        0xet
        0x5at
        -0x21t
        0x5ft
        -0x29t
        -0x79t
        0x62t
        -0x10t
        0x7ft
        0x27t
        0x1dt
        -0x34t
        0x19t
        -0x7at
        -0x5t
        0x77t
        -0x7t
        -0x6t
        -0x2et
        0x39t
        0x78t
        -0x43t
        -0x27t
        -0x3ft
        0x11t
        -0x7dt
        -0x55t
        -0x2at
        -0x52t
        0x74t
        0x68t
        0x20t
        -0x4at
        0x29t
        0x59t
        0x5et
        0x17t
        0x73t
        -0x64t
        -0x80t
        -0x2ct
        0x2et
        -0x71t
        -0x54t
        -0x75t
        -0x1t
        -0x24t
        -0x23t
        -0x5bt
        0x63t
        0x5bt
        -0x19t
        -0x11t
        -0xat
        -0x48t
        0x42t
        -0x42t
        -0x35t
        -0x5dt
        -0x5at
        -0x78t
        -0x9t
        0x31t
        -0x1bt
        0x1t
        -0x57t
        -0x4dt
        -0x59t
        -0x69t
        0x44t
        -0x20t
        0x2dt
        -0x5ft
        -0x58t
        0x16t
        -0x62t
        0x1bt
        -0x2bt
        -0x70t
        -0x5ct
        -0x26t
        -0x72t
        -0x15t
        0x2at
        0x6bt
        0x1ct
        0x49t
        0x7ct
        0x24t
        -0xft
        0x13t
        -0x3et
        0x4ft
        -0x3ct
        0x2ft
        -0x7et
        0x14t
        -0x37t
        0x3at
        -0x61t
        0x6et
        0x3ft
        -0x32t
        0x2t
        0xft
        0x58t
        0xct
        -0x3bt
        0x43t
        -0x4et
        0x66t
        0x4at
        0x7et
        -0x39t
        -0x13t
        -0x22t
        0x46t
        0x53t
        -0x31t
        0x10t
        0x22t
        -0xdt
        -0x6ft
        0x67t
        -0x38t
        0x5dt
        0x3dt
        0x25t
        0x71t
        -0x1at
        -0x49t
        -0x36t
        -0x63t
        -0x68t
        -0x53t
        0x15t
        0x54t
        -0x77t
        0x3et
        -0x3t
        -0x74t
        -0x60t
        -0xct
        0x57t
        0x61t
        0x5t
        -0x12t
        0x7at
        0x30t
        0x26t
        -0x44t
        0x12t
        -0x76t
        0x36t
        0x6t
        0x48t
        0x1at
        0x1ft
        -0x3at
        -0x4t
        -0x73t
        0x34t
        0x37t
        0xdt
        -0x2t
        0x1et
        -0x1ct
        0x60t
    .end array-data
.end method

.method public resolverFactory()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/trendmicro/hippo/ContextFactoryFactory;->contextURL:Ljava/lang/String;

    return-object v0
.end method
