.class Lcom/trendmicro/hippo/xmlimpl/Namespace;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "Namespace.java"


# static fields
.field private static final Id_constructor:I = 0x1

.field private static final Id_prefix:I = 0x1

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field private static final Id_uri:I = 0x2

.field private static final MAX_INSTANCE_ID:I = 0x2

.field private static final MAX_PROTOTYPE_ID:I = 0x3

.field private static final NAMESPACE_TAG:Ljava/lang/Object;

.field static final serialVersionUID:J = -0x500413d73ea9fd70L


# instance fields
.field private ns:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

.field private prototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 24
    const-string v0, "Namespace"

    sput-object v0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->NAMESPACE_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 30
    return-void
.end method

.method private constructNamespace()Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 1

    .line 312
    const-string v0, ""

    invoke-virtual {p0, v0, v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->newNamespace(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method private constructNamespace(Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 4
    .param p1, "prefixValue"    # Ljava/lang/Object;
    .param p2, "uriValue"    # Ljava/lang/Object;

    .line 280
    instance-of v0, p2, Lcom/trendmicro/hippo/xmlimpl/QName;

    if-eqz v0, :cond_1

    .line 281
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/QName;

    .line 282
    .local v0, "qname":Lcom/trendmicro/hippo/xmlimpl/QName;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->uri()Ljava/lang/String;

    move-result-object v1

    .line 283
    .local v1, "uri":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 284
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->toString()Ljava/lang/String;

    move-result-object v1

    .line 286
    .end local v0    # "qname":Lcom/trendmicro/hippo/xmlimpl/QName;
    :cond_0
    goto :goto_0

    .line 287
    .end local v1    # "uri":Ljava/lang/String;
    :cond_1
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 290
    .restart local v1    # "uri":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_4

    .line 291
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v0, :cond_2

    .line 292
    const-string v0, ""

    .local v0, "prefix":Ljava/lang/String;
    goto :goto_1

    .line 294
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_2
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 295
    .restart local v0    # "prefix":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_3

    goto :goto_1

    .line 296
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Illegal prefix \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\' for \'no namespace\'."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 300
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_4
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v0, :cond_5

    .line 301
    const-string v0, ""

    .restart local v0    # "prefix":Ljava/lang/String;
    goto :goto_1

    .line 302
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_5
    invoke-static {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->accept(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 303
    const-string v0, ""

    .restart local v0    # "prefix":Ljava/lang/String;
    goto :goto_1

    .line 305
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_6
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 308
    .restart local v0    # "prefix":Ljava/lang/String;
    :goto_1
    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->newNamespace(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v2

    return-object v2
.end method

.method static create(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xmlimpl/Namespace;Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 1
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "prototype"    # Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .param p2, "namespace"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 33
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;-><init>()V

    .line 34
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 35
    iput-object p1, v0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->prototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    .line 36
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 37
    iput-object p2, v0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->ns:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 38
    return-object v0
.end method

.method private equals(Lcom/trendmicro/hippo/xmlimpl/Namespace;)Z
    .locals 2
    .param p1, "n"    # Lcom/trendmicro/hippo/xmlimpl/Namespace;

    .line 67
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private jsConstructor(Lcom/trendmicro/hippo/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "inNewExpr"    # Z
    .param p3, "args"    # [Ljava/lang/Object;

    .line 317
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p2, :cond_0

    array-length v2, p3

    if-ne v2, v1, :cond_0

    .line 318
    aget-object v0, p3, v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->castToNamespace(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0

    .line 321
    :cond_0
    array-length v2, p3

    if-nez v2, :cond_1

    .line 322
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->constructNamespace()Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0

    .line 323
    :cond_1
    array-length v2, p3

    if-ne v2, v1, :cond_2

    .line 324
    aget-object v0, p3, v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->constructNamespace(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0

    .line 326
    :cond_2
    aget-object v0, p3, v0

    aget-object v1, p3, v1

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->constructNamespace(Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method private js_toSource()Ljava/lang/String;
    .locals 3

    .line 332
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 333
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 334
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->ns:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->ns:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->toSourceImpl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 335
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 336
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 1
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 227
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    if-eqz v0, :cond_0

    .line 229
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    return-object v0

    .line 228
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method static toSourceImpl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 2
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "sb"    # Ljava/lang/StringBuilder;

    .line 341
    const-string v0, "new Namespace("

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 343
    const-string v0, ""

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 345
    :cond_1
    const/16 v0, 0x27

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 346
    if-eqz p0, :cond_2

    .line 347
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->escapeString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    const-string v1, "\', \'"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    :cond_2
    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->escapeString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 353
    :goto_0
    const/16 v0, 0x29

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 354
    return-void
.end method


# virtual methods
.method castToNamespace(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 1
    .param p1, "namespaceObj"    # Ljava/lang/Object;

    .line 270
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    if-eqz v0, :cond_0

    .line 271
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    return-object v0

    .line 273
    :cond_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->constructNamespace(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method constructNamespace(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 3
    .param p1, "uriValue"    # Ljava/lang/Object;

    .line 247
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    if-eqz v0, :cond_0

    .line 248
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    .line 249
    .local v0, "ns":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v1

    .line 250
    .local v1, "prefix":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    .line 251
    .local v0, "uri":Ljava/lang/String;
    goto :goto_1

    .end local v0    # "uri":Ljava/lang/String;
    .end local v1    # "prefix":Ljava/lang/String;
    :cond_0
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/QName;

    if-eqz v0, :cond_2

    .line 252
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/QName;

    .line 253
    .local v0, "qname":Lcom/trendmicro/hippo/xmlimpl/QName;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->uri()Ljava/lang/String;

    move-result-object v1

    .line 254
    .local v1, "uri":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 256
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->prefix()Ljava/lang/String;

    move-result-object v2

    move-object v0, v1

    move-object v1, v2

    .local v2, "prefix":Ljava/lang/String;
    goto :goto_0

    .line 258
    .end local v2    # "prefix":Ljava/lang/String;
    :cond_1
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->toString()Ljava/lang/String;

    move-result-object v1

    .line 259
    const/4 v2, 0x0

    move-object v0, v1

    move-object v1, v2

    .line 261
    .local v0, "uri":Ljava/lang/String;
    .local v1, "prefix":Ljava/lang/String;
    :goto_0
    goto :goto_1

    .line 262
    .end local v0    # "uri":Ljava/lang/String;
    .end local v1    # "prefix":Ljava/lang/String;
    :cond_2
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 263
    .restart local v0    # "uri":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_3

    const-string v1, ""

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    .line 266
    .restart local v1    # "prefix":Ljava/lang/String;
    :goto_1
    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->newNamespace(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v2

    return-object v2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .line 72
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 73
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->equals(Lcom/trendmicro/hippo/xmlimpl/Namespace;)Z

    move-result v0

    return v0
.end method

.method protected equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;

    .line 83
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    if-nez v0, :cond_0

    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v0

    .line 84
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->equals(Lcom/trendmicro/hippo/xmlimpl/Namespace;)Z

    move-result v0

    .line 85
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

    .line 211
    sget-object v0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->NAMESPACE_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 212
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 214
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 215
    .local v0, "id":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 221
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    invoke-direct {v1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->js_toSource()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 223
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 219
    :cond_2
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 217
    :cond_3
    if-nez p4, :cond_4

    goto :goto_0

    :cond_4
    const/4 v1, 0x0

    :goto_0
    invoke-direct {p0, p2, v1, p5}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->jsConstructor(Lcom/trendmicro/hippo/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public exportAsJSClass(Z)V
    .locals 2
    .param p1, "sealed"    # Z

    .line 46
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v1, v0, p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 47
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 115
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 116
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 117
    .local v2, "s_length":I
    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    const-string v1, "uri"

    const/4 v0, 0x2

    goto :goto_0

    .line 118
    :cond_0
    const/4 v3, 0x6

    if-ne v2, v3, :cond_1

    const-string v1, "prefix"

    const/4 v0, 0x1

    .line 119
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    if-eq v1, p1, :cond_2

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v0, 0x0

    .line 124
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_2
    if-nez v0, :cond_3

    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v1

    return v1

    .line 127
    :cond_3
    const/4 v1, 0x1

    if-eq v0, v1, :cond_5

    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    goto :goto_1

    .line 132
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 130
    :cond_5
    :goto_1
    const/4 v1, 0x5

    .line 131
    .local v1, "attr":I
    nop

    .line 134
    invoke-super {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getMaxInstanceId()I

    move-result v2

    add-int/2addr v2, v0

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->instanceIdInfo(II)I

    move-result v2

    return v2
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .line 174
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 175
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 176
    .local v2, "s_length":I
    const/16 v3, 0x8

    if-ne v2, v3, :cond_1

    .line 177
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 178
    .local v3, "c":I
    const/16 v4, 0x6f

    if-ne v3, v4, :cond_0

    const-string v1, "toSource"

    const/4 v0, 0x3

    goto :goto_0

    .line 179
    :cond_0
    const/16 v4, 0x74

    if-ne v3, v4, :cond_2

    const-string v1, "toString"

    const/4 v0, 0x2

    goto :goto_0

    .line 181
    .end local v3    # "c":I
    :cond_1
    const/16 v3, 0xb

    if-ne v2, v3, :cond_2

    const-string v1, "constructor"

    const/4 v0, 0x1

    .line 182
    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    if-eq v1, p1, :cond_3

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v0, 0x0

    .line 186
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_3
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 90
    const-string v0, "Namespace"

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

    .line 95
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method final getDelegate()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->ns:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 2
    .param p1, "id"    # I

    .line 141
    invoke-super {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 145
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 143
    :cond_0
    const-string v0, "uri"

    return-object v0

    .line 142
    :cond_1
    const-string v0, "prefix"

    return-object v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 2
    .param p1, "id"    # I

    .line 151
    invoke-super {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 158
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->ns:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 153
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->ns:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 154
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->ns:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 107
    invoke-super {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getMaxInstanceId()I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 78
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 195
    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 198
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "toSource"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 199
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 197
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 196
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 201
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/xmlimpl/Namespace;->NAMESPACE_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 202
    return-void
.end method

.method newNamespace(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;

    .line 233
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->prototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    if-nez v0, :cond_0

    move-object v0, p0

    .line 234
    .local v0, "prototype":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-static {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->create(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xmlimpl/Namespace;Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    return-object v1
.end method

.method newNamespace(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 3
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;

    .line 238
    if-nez p1, :cond_0

    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->newNamespace(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0

    .line 239
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->prototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    if-nez v0, :cond_1

    move-object v0, p0

    .line 240
    .local v0, "prototype":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-static {p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->create(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xmlimpl/Namespace;Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    return-object v1
.end method

.method public prefix()Ljava/lang/String;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->ns:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toLocaleString()Ljava/lang/String;
    .locals 1

    .line 63
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 59
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public uri()Ljava/lang/String;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/Namespace;->ns:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
