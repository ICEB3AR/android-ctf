.class final Lcom/trendmicro/hippo/xmlimpl/QName;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "QName.java"


# static fields
.field private static final Id_constructor:I = 0x1

.field private static final Id_localName:I = 0x1

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field private static final Id_uri:I = 0x2

.field private static final MAX_INSTANCE_ID:I = 0x2

.field private static final MAX_PROTOTYPE_ID:I = 0x3

.field private static final QNAME_TAG:Ljava/lang/Object;

.field static final serialVersionUID:J = 0x5c89385a23415beL


# instance fields
.field private delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

.field private lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

.field private prototype:Lcom/trendmicro/hippo/xmlimpl/QName;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 24
    const-string v0, "QName"

    sput-object v0, Lcom/trendmicro/hippo/xmlimpl/QName;->QNAME_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 33
    return-void
.end method

.method static create(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xmlimpl/QName;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 1
    .param p0, "lib"    # Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "prototype"    # Lcom/trendmicro/hippo/xmlimpl/QName;
    .param p3, "delegate"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 36
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/QName;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;-><init>()V

    .line 37
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/QName;
    iput-object p0, v0, Lcom/trendmicro/hippo/xmlimpl/QName;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    .line 38
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/QName;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 39
    iput-object p2, v0, Lcom/trendmicro/hippo/xmlimpl/QName;->prototype:Lcom/trendmicro/hippo/xmlimpl/QName;

    .line 40
    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/xmlimpl/QName;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 41
    iput-object p3, v0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 42
    return-object v0
.end method

.method private equals(Lcom/trendmicro/hippo/xmlimpl/QName;)Z
    .locals 2
    .param p1, "q"    # Lcom/trendmicro/hippo/xmlimpl/QName;

    .line 116
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    iget-object v1, p1, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->equals(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Z

    move-result v0

    return v0
.end method

.method private jsConstructor(Lcom/trendmicro/hippo/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "inNewExpr"    # Z
    .param p3, "args"    # [Ljava/lang/Object;

    .line 332
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p2, :cond_0

    array-length v2, p3

    if-ne v2, v1, :cond_0

    .line 333
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    aget-object v0, p3, v0

    invoke-virtual {p0, v1, p1, v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->castToQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0

    .line 335
    :cond_0
    array-length v2, p3

    if-nez v2, :cond_1

    .line 336
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {p0, v0, p1, v1}, Lcom/trendmicro/hippo/xmlimpl/QName;->constructQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0

    .line 337
    :cond_1
    array-length v2, p3

    if-ne v2, v1, :cond_2

    .line 338
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    aget-object v0, p3, v0

    invoke-virtual {p0, v1, p1, v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->constructQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0

    .line 340
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    aget-object v0, p3, v0

    aget-object v1, p3, v1

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/trendmicro/hippo/xmlimpl/QName;->constructQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method private js_toSource()Ljava/lang/String;
    .locals 4

    .line 345
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 346
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 347
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/QName;->uri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/QName;->prefix()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->toSourceImpl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 348
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 349
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 1
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 255
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/QName;

    if-eqz v0, :cond_0

    .line 257
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/QName;

    return-object v0

    .line 256
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/xmlimpl/QName;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private static toSourceImpl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 1
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "sb"    # Ljava/lang/StringBuilder;

    .line 353
    const-string v0, "new QName("

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 354
    if-nez p0, :cond_0

    if-nez p2, :cond_0

    .line 355
    const-string v0, "*"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 356
    const-string v0, "null, "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 359
    :cond_0
    invoke-static {p2, p0, p3}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->toSourceImpl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 360
    const-string v0, ", "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    :cond_1
    :goto_0
    const/16 v0, 0x27

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 363
    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->escapeString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    const-string v0, "\')"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    return-void
.end method


# virtual methods
.method castToQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 1
    .param p1, "lib"    # Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "qnameValue"    # Ljava/lang/Object;

    .line 324
    instance-of v0, p3, Lcom/trendmicro/hippo/xmlimpl/QName;

    if-eqz v0, :cond_0

    .line 325
    move-object v0, p3

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/QName;

    return-object v0

    .line 327
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/trendmicro/hippo/xmlimpl/QName;->constructQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method constructQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 1
    .param p1, "lib"    # Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "nameValue"    # Ljava/lang/Object;

    .line 320
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/trendmicro/hippo/xmlimpl/QName;->constructQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method constructQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 6
    .param p1, "lib"    # Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "namespace"    # Ljava/lang/Object;
    .param p4, "name"    # Ljava/lang/Object;

    .line 277
    const/4 v0, 0x0

    .line 278
    .local v0, "nameString":Ljava/lang/String;
    instance-of v1, p4, Lcom/trendmicro/hippo/xmlimpl/QName;

    if-eqz v1, :cond_1

    .line 279
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p3, v1, :cond_0

    .line 280
    move-object v1, p4

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/QName;

    return-object v1

    .line 282
    :cond_0
    move-object v1, p4

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/QName;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v0

    .line 285
    :cond_1
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p4, v1, :cond_2

    .line 286
    const-string v0, ""

    goto :goto_0

    .line 288
    :cond_2
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 291
    :goto_0
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p3, v1, :cond_4

    .line 292
    const-string v1, "*"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 293
    const/4 p3, 0x0

    goto :goto_1

    .line 295
    :cond_3
    invoke-virtual {p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->getDefaultNamespace(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object p3

    .line 298
    :cond_4
    :goto_1
    const/4 v1, 0x0

    .line 299
    .local v1, "namespaceNamespace":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    if-nez p3, :cond_5

    goto :goto_2

    .line 301
    :cond_5
    instance-of v2, p3, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    if-eqz v2, :cond_6

    .line 302
    move-object v1, p3

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    goto :goto_2

    .line 304
    :cond_6
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newNamespace(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    .line 306
    :goto_2
    move-object v2, v0

    .line 309
    .local v2, "q_localName":Ljava/lang/String;
    if-nez p3, :cond_7

    .line 310
    const/4 v3, 0x0

    .line 311
    .local v3, "q_uri":Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "q_prefix":Ljava/lang/String;
    goto :goto_3

    .line 313
    .end local v3    # "q_uri":Ljava/lang/String;
    .end local v4    # "q_prefix":Ljava/lang/String;
    :cond_7
    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v3

    .line 314
    .restart local v3    # "q_uri":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v4

    .line 316
    .restart local v4    # "q_prefix":Ljava/lang/String;
    :goto_3
    invoke-virtual {p0, p1, v3, v2, v4}, Lcom/trendmicro/hippo/xmlimpl/QName;->newQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v5

    return-object v5
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .line 98
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/QName;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 99
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/QName;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->equals(Lcom/trendmicro/hippo/xmlimpl/QName;)Z

    move-result v0

    return v0
.end method

.method protected equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;

    .line 110
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/QName;

    if-nez v0, :cond_0

    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v0

    .line 111
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/QName;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->equals(Lcom/trendmicro/hippo/xmlimpl/QName;)Z

    move-result v0

    .line 112
    .local v0, "result":Z
    if-eqz v0, :cond_1

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_1
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    return-object v1
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 238
    sget-object v0, Lcom/trendmicro/hippo/xmlimpl/QName;->QNAME_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 239
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 241
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 242
    .local v0, "id":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 248
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/xmlimpl/QName;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v1

    invoke-direct {v1}, Lcom/trendmicro/hippo/xmlimpl/QName;->js_toSource()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 250
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 246
    :cond_2
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/xmlimpl/QName;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/QName;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 244
    :cond_3
    if-nez p4, :cond_4

    goto :goto_0

    :cond_4
    const/4 v1, 0x0

    :goto_0
    invoke-direct {p0, p2, v1, p5}, Lcom/trendmicro/hippo/xmlimpl/QName;->jsConstructor(Lcom/trendmicro/hippo/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method exportAsJSClass(Z)V
    .locals 2
    .param p1, "sealed"    # Z

    .line 51
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/QName;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v1, v0, p1}, Lcom/trendmicro/hippo/xmlimpl/QName;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 52
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 146
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 147
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 148
    .local v2, "s_length":I
    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    const-string v1, "uri"

    const/4 v0, 0x2

    goto :goto_0

    .line 149
    :cond_0
    const/16 v3, 0x9

    if-ne v2, v3, :cond_1

    const-string v1, "localName"

    const/4 v0, 0x1

    .line 150
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    if-eq v1, p1, :cond_2

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v0, 0x0

    .line 155
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_2
    if-nez v0, :cond_3

    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v1

    return v1

    .line 158
    :cond_3
    const/4 v1, 0x1

    if-eq v0, v1, :cond_5

    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    goto :goto_1

    .line 163
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 161
    :cond_5
    :goto_1
    const/4 v1, 0x5

    .line 162
    .local v1, "attr":I
    nop

    .line 165
    invoke-super {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getMaxInstanceId()I

    move-result v2

    add-int/2addr v2, v0

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/QName;->instanceIdInfo(II)I

    move-result v2

    return v2
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .line 201
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 202
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 203
    .local v2, "s_length":I
    const/16 v3, 0x8

    if-ne v2, v3, :cond_1

    .line 204
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 205
    .local v3, "c":I
    const/16 v4, 0x6f

    if-ne v3, v4, :cond_0

    const-string v1, "toSource"

    const/4 v0, 0x3

    goto :goto_0

    .line 206
    :cond_0
    const/16 v4, 0x74

    if-ne v3, v4, :cond_2

    const-string v1, "toString"

    const/4 v0, 0x2

    goto :goto_0

    .line 208
    .end local v3    # "c":I
    :cond_1
    const/16 v3, 0xb

    if-ne v2, v3, :cond_2

    const-string v1, "constructor"

    const/4 v0, 0x1

    .line 209
    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    if-eq v1, p1, :cond_3

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v0, 0x0

    .line 213
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_3
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 121
    const-string v0, "QName"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 126
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/QName;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method final getDelegate()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 2
    .param p1, "id"    # I

    .line 172
    invoke-super {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 176
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 174
    :cond_0
    const-string v0, "uri"

    return-object v0

    .line 173
    :cond_1
    const-string v0, "localName"

    return-object v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 2
    .param p1, "id"    # I

    .line 182
    invoke-super {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 186
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 184
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/QName;->uri()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 183
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 138
    invoke-super {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getMaxInstanceId()I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->hashCode()I

    move-result v0

    return v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 222
    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 225
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "toSource"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 226
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 224
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 223
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 228
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/xmlimpl/QName;->QNAME_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 229
    return-void
.end method

.method public localName()Ljava/lang/String;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "*"

    return-object v0

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method newQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 4
    .param p1, "lib"    # Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
    .param p2, "q_uri"    # Ljava/lang/String;
    .param p3, "q_localName"    # Ljava/lang/String;
    .param p4, "q_prefix"    # Ljava/lang/String;

    .line 261
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->prototype:Lcom/trendmicro/hippo/xmlimpl/QName;

    .line 262
    .local v0, "prototype":Lcom/trendmicro/hippo/xmlimpl/QName;
    if-nez v0, :cond_0

    .line 263
    move-object v0, p0

    .line 265
    :cond_0
    const/4 v1, 0x0

    .line 266
    .local v1, "ns":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    if-eqz p4, :cond_1

    .line 267
    invoke-static {p4, p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    goto :goto_0

    .line 268
    :cond_1
    if-eqz p2, :cond_2

    .line 269
    invoke-static {p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    .line 271
    :cond_2
    :goto_0
    if-eqz p3, :cond_3

    const-string v2, "*"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 p3, 0x0

    .line 272
    :cond_3
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/QName;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    invoke-static {v1, p3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v3

    invoke-static {p1, v2, v0, v3}, Lcom/trendmicro/hippo/xmlimpl/QName;->create(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xmlimpl/QName;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v2

    return-object v2
.end method

.method prefix()Ljava/lang/String;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method final toNodeQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 89
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 57
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    if-nez v0, :cond_0

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "*::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->isGlobal()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 61
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 63
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/QName;->uri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method uri()Ljava/lang/String;
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/QName;->delegate:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
