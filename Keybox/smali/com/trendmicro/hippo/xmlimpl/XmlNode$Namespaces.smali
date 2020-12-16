.class Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;
.super Ljava/lang/Object;
.source "XmlNode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/xmlimpl/XmlNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Namespaces"
.end annotation


# instance fields
.field private map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private uriToPrefix:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 320
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 317
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->map:Ljava/util/Map;

    .line 318
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->uriToPrefix:Ljava/util/Map;

    .line 321
    return-void
.end method


# virtual methods
.method declare(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)V
    .locals 3
    .param p1, "n"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 324
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->map:Ljava/util/Map;

    invoke-static {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->access$000(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 325
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->map:Ljava/util/Map;

    invoke-static {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->access$000(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->access$100(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->uriToPrefix:Ljava/util/Map;

    invoke-static {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->access$100(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 330
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->uriToPrefix:Ljava/util/Map;

    invoke-static {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->access$100(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->access$000(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    :cond_1
    return-void
.end method

.method getNamespace(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;

    .line 340
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 341
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    return-object v0
.end method

.method getNamespaceByUri(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;

    .line 335
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->uriToPrefix:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 336
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->uriToPrefix:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    return-object v0
.end method

.method getNamespaces()[Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 6

    .line 345
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 346
    .local v0, "rv":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;>;"
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->map:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 347
    .local v2, "prefix":Ljava/lang/String;
    iget-object v3, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->map:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 348
    .local v3, "uri":Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v4

    .line 349
    .local v4, "n":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 350
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 352
    .end local v2    # "prefix":Ljava/lang/String;
    .end local v3    # "uri":Ljava/lang/String;
    .end local v4    # "n":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    :cond_0
    goto :goto_0

    .line 353
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    return-object v1
.end method
