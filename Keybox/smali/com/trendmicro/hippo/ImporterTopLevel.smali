.class public Lcom/trendmicro/hippo/ImporterTopLevel;
.super Lcom/trendmicro/hippo/TopLevel;
.source "ImporterTopLevel.java"


# static fields
.field private static final IMPORTER_TAG:Ljava/lang/Object;

.field private static final Id_constructor:I = 0x1

.field private static final Id_importClass:I = 0x2

.field private static final Id_importPackage:I = 0x3

.field private static final MAX_PROTOTYPE_ID:I = 0x3

.field private static final serialVersionUID:J = -0x7e3948b0fe0fbc54L


# instance fields
.field private importedPackages:Lcom/trendmicro/hippo/ObjArray;

.field private topScopeFlag:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    const-string v0, "Importer"

    sput-object v0, Lcom/trendmicro/hippo/ImporterTopLevel;->IMPORTER_TAG:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Lcom/trendmicro/hippo/TopLevel;-><init>()V

    .line 289
    new-instance v0, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ImporterTopLevel;->importedPackages:Lcom/trendmicro/hippo/ObjArray;

    .line 47
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Context;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ImporterTopLevel;-><init>(Lcom/trendmicro/hippo/Context;Z)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Context;Z)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "sealed"    # Z

    .line 54
    invoke-direct {p0}, Lcom/trendmicro/hippo/TopLevel;-><init>()V

    .line 289
    new-instance v0, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ImporterTopLevel;->importedPackages:Lcom/trendmicro/hippo/ObjArray;

    .line 55
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/ImporterTopLevel;->initStandardObjects(Lcom/trendmicro/hippo/Context;Z)V

    .line 56
    return-void
.end method

.method private getPackageProperty(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 105
    sget-object v0, Lcom/trendmicro/hippo/ImporterTopLevel;->NOT_FOUND:Ljava/lang/Object;

    .line 107
    .local v0, "result":Ljava/lang/Object;
    iget-object v1, p0, Lcom/trendmicro/hippo/ImporterTopLevel;->importedPackages:Lcom/trendmicro/hippo/ObjArray;

    monitor-enter v1

    .line 108
    :try_start_0
    iget-object v2, p0, Lcom/trendmicro/hippo/ImporterTopLevel;->importedPackages:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjArray;->toArray()[Ljava/lang/Object;

    move-result-object v2

    .line 109
    .local v2, "elements":[Ljava/lang/Object;
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_2

    .line 111
    aget-object v3, v2, v1

    check-cast v3, Lcom/trendmicro/hippo/NativeJavaPackage;

    .line 112
    .local v3, "p":Lcom/trendmicro/hippo/NativeJavaPackage;
    const/4 v4, 0x0

    invoke-virtual {v3, p1, p2, v4}, Lcom/trendmicro/hippo/NativeJavaPackage;->getPkgProperty(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Z)Ljava/lang/Object;

    move-result-object v4

    .line 113
    .local v4, "v":Ljava/lang/Object;
    if-eqz v4, :cond_1

    instance-of v5, v4, Lcom/trendmicro/hippo/NativeJavaPackage;

    if-nez v5, :cond_1

    .line 114
    sget-object v5, Lcom/trendmicro/hippo/ImporterTopLevel;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v5, :cond_0

    .line 115
    move-object v0, v4

    goto :goto_1

    .line 117
    :cond_0
    const-string v5, "msg.ambig.import"

    .line 118
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 117
    invoke-static {v5, v6, v7}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v5

    throw v5

    .line 110
    .end local v3    # "p":Lcom/trendmicro/hippo/NativeJavaPackage;
    .end local v4    # "v":Ljava/lang/Object;
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 122
    .end local v1    # "i":I
    :cond_2
    return-object v0

    .line 109
    .end local v2    # "elements":[Ljava/lang/Object;
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method private importClass(Lcom/trendmicro/hippo/NativeJavaClass;)V
    .locals 4
    .param p1, "cl"    # Lcom/trendmicro/hippo/NativeJavaClass;

    .line 202
    invoke-virtual {p1}, Lcom/trendmicro/hippo/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 203
    .local v0, "s":Ljava/lang/String;
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 204
    .local v1, "n":Ljava/lang/String;
    invoke-virtual {p0, v1, p0}, Lcom/trendmicro/hippo/ImporterTopLevel;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 205
    .local v2, "val":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/ImporterTopLevel;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_1

    if-ne v2, p1, :cond_0

    goto :goto_0

    .line 206
    :cond_0
    const-string v3, "msg.prop.defined"

    invoke-static {v3, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v3

    throw v3

    .line 209
    :cond_1
    :goto_0
    invoke-virtual {p0, v1, p0, p1}, Lcom/trendmicro/hippo/ImporterTopLevel;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 210
    return-void
.end method

.method private importPackage(Lcom/trendmicro/hippo/NativeJavaPackage;)V
    .locals 3
    .param p1, "pkg"    # Lcom/trendmicro/hippo/NativeJavaPackage;

    .line 187
    if-nez p1, :cond_0

    .line 188
    return-void

    .line 190
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ImporterTopLevel;->importedPackages:Lcom/trendmicro/hippo/ObjArray;

    monitor-enter v0

    .line 191
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/trendmicro/hippo/ImporterTopLevel;->importedPackages:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v2

    if-eq v1, v2, :cond_2

    .line 192
    iget-object v2, p0, Lcom/trendmicro/hippo/ImporterTopLevel;->importedPackages:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/NativeJavaPackage;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 193
    monitor-exit v0

    return-void

    .line 191
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 196
    .end local v1    # "j":I
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/ImporterTopLevel;->importedPackages:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 197
    monitor-exit v0

    .line 198
    return-void

    .line 197
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 66
    new-instance v0, Lcom/trendmicro/hippo/ImporterTopLevel;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ImporterTopLevel;-><init>()V

    .line 67
    .local v0, "obj":Lcom/trendmicro/hippo/ImporterTopLevel;
    const/4 v1, 0x3

    invoke-virtual {v0, v1, p1, p2}, Lcom/trendmicro/hippo/ImporterTopLevel;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 68
    return-void
.end method

.method private js_construct(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 137
    new-instance v0, Lcom/trendmicro/hippo/ImporterTopLevel;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ImporterTopLevel;-><init>()V

    .line 138
    .local v0, "result":Lcom/trendmicro/hippo/ImporterTopLevel;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p2

    if-eq v1, v2, :cond_2

    .line 139
    aget-object v2, p2, v1

    .line 140
    .local v2, "arg":Ljava/lang/Object;
    instance-of v3, v2, Lcom/trendmicro/hippo/NativeJavaClass;

    if-eqz v3, :cond_0

    .line 141
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/NativeJavaClass;

    invoke-direct {v0, v3}, Lcom/trendmicro/hippo/ImporterTopLevel;->importClass(Lcom/trendmicro/hippo/NativeJavaClass;)V

    goto :goto_1

    .line 142
    :cond_0
    instance-of v3, v2, Lcom/trendmicro/hippo/NativeJavaPackage;

    if-eqz v3, :cond_1

    .line 143
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/NativeJavaPackage;

    invoke-direct {v0, v3}, Lcom/trendmicro/hippo/ImporterTopLevel;->importPackage(Lcom/trendmicro/hippo/NativeJavaPackage;)V

    .line 138
    .end local v2    # "arg":Ljava/lang/Object;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 145
    .restart local v2    # "arg":Ljava/lang/Object;
    :cond_1
    nop

    .line 146
    invoke-static {v2}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 145
    const-string v4, "msg.not.class.not.pkg"

    invoke-static {v4, v3}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v3

    throw v3

    .line 154
    .end local v1    # "i":I
    .end local v2    # "arg":Ljava/lang/Object;
    :cond_2
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ImporterTopLevel;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 155
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/ImporterTopLevel;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 156
    return-object v0
.end method

.method private js_importClass([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "args"    # [Ljava/lang/Object;

    .line 161
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-eq v0, v1, :cond_1

    .line 162
    aget-object v1, p1, v0

    .line 163
    .local v1, "arg":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/NativeJavaClass;

    if-eqz v2, :cond_0

    .line 167
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/NativeJavaClass;

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/ImporterTopLevel;->importClass(Lcom/trendmicro/hippo/NativeJavaClass;)V

    .line 161
    .end local v1    # "arg":Ljava/lang/Object;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 164
    .restart local v1    # "arg":Ljava/lang/Object;
    :cond_0
    nop

    .line 165
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 164
    const-string v3, "msg.not.class"

    invoke-static {v3, v2}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    throw v2

    .line 169
    .end local v0    # "i":I
    .end local v1    # "arg":Ljava/lang/Object;
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0
.end method

.method private js_importPackage([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "args"    # [Ljava/lang/Object;

    .line 174
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-eq v0, v1, :cond_1

    .line 175
    aget-object v1, p1, v0

    .line 176
    .local v1, "arg":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/NativeJavaPackage;

    if-eqz v2, :cond_0

    .line 180
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/NativeJavaPackage;

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/ImporterTopLevel;->importPackage(Lcom/trendmicro/hippo/NativeJavaPackage;)V

    .line 174
    .end local v1    # "arg":Ljava/lang/Object;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 177
    .restart local v1    # "arg":Ljava/lang/Object;
    :cond_0
    nop

    .line 178
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 177
    const-string v3, "msg.not.pkg"

    invoke-static {v3, v2}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    throw v2

    .line 182
    .end local v0    # "i":I
    .end local v1    # "arg":Ljava/lang/Object;
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0
.end method

.method private realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/ImporterTopLevel;
    .locals 1
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 249
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ImporterTopLevel;->topScopeFlag:Z

    if-eqz v0, :cond_0

    .line 252
    return-object p0

    .line 254
    :cond_0
    instance-of v0, p1, Lcom/trendmicro/hippo/ImporterTopLevel;

    if-eqz v0, :cond_1

    .line 256
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ImporterTopLevel;

    return-object v0

    .line 255
    :cond_1
    invoke-static {p2}, Lcom/trendmicro/hippo/ImporterTopLevel;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 230
    sget-object v0, Lcom/trendmicro/hippo/ImporterTopLevel;->IMPORTER_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 231
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/TopLevel;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 233
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 234
    .local v0, "id":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 242
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/ImporterTopLevel;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/ImporterTopLevel;

    move-result-object v1

    invoke-direct {v1, p5}, Lcom/trendmicro/hippo/ImporterTopLevel;->js_importPackage([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 244
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 239
    :cond_2
    invoke-direct {p0, p4, p1}, Lcom/trendmicro/hippo/ImporterTopLevel;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/ImporterTopLevel;

    move-result-object v1

    invoke-direct {v1, p5}, Lcom/trendmicro/hippo/ImporterTopLevel;->js_importClass([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 236
    :cond_3
    invoke-direct {p0, p3, p5}, Lcom/trendmicro/hippo/ImporterTopLevel;->js_construct(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .line 266
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 267
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 268
    .local v2, "s_length":I
    const/16 v3, 0xb

    if-ne v2, v3, :cond_1

    .line 269
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 270
    .local v3, "c":I
    const/16 v4, 0x63

    if-ne v3, v4, :cond_0

    const-string v1, "constructor"

    const/4 v0, 0x1

    goto :goto_0

    .line 271
    :cond_0
    const/16 v4, 0x69

    if-ne v3, v4, :cond_2

    const-string v1, "importClass"

    const/4 v0, 0x2

    goto :goto_0

    .line 273
    .end local v3    # "c":I
    :cond_1
    const/16 v3, 0xd

    if-ne v2, v3, :cond_2

    const-string v1, "importPackage"

    const/4 v0, 0x3

    .line 274
    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    if-eq v1, p1, :cond_3

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v0, 0x0

    .line 278
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_3
    return v0
.end method

.method public get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 97
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/TopLevel;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 98
    .local v0, "result":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/ImporterTopLevel;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    .line 99
    return-object v0

    .line 100
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ImporterTopLevel;->getPackageProperty(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 101
    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 61
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ImporterTopLevel;->topScopeFlag:Z

    if-eqz v0, :cond_0

    const-string v0, "global"

    goto :goto_0

    :cond_0
    const-string v0, "JavaImporter"

    :goto_0
    return-object v0
.end method

.method public has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 91
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/TopLevel;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 92
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ImporterTopLevel;->getPackageProperty(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/trendmicro/hippo/ImporterTopLevel;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 91
    :goto_1
    return v0
.end method

.method public importPackage(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)V
    .locals 0
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "funObj"    # Lcom/trendmicro/hippo/Function;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 132
    invoke-direct {p0, p3}, Lcom/trendmicro/hippo/ImporterTopLevel;->js_importPackage([Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    return-void
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 217
    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 220
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "importPackage"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 221
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "importClass"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 218
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 223
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/ImporterTopLevel;->IMPORTER_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/ImporterTopLevel;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 224
    return-void
.end method

.method public initStandardObjects(Lcom/trendmicro/hippo/Context;Z)V
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "sealed"    # Z

    .line 74
    invoke-virtual {p1, p0, p2}, Lcom/trendmicro/hippo/Context;->initStandardObjects(Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/ScriptableObject;

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ImporterTopLevel;->topScopeFlag:Z

    .line 79
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p0, v1}, Lcom/trendmicro/hippo/ImporterTopLevel;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    move-result-object v0

    .line 80
    .local v0, "ctor":Lcom/trendmicro/hippo/IdFunctionObject;
    if-eqz p2, :cond_0

    .line 81
    invoke-virtual {v0}, Lcom/trendmicro/hippo/IdFunctionObject;->sealObject()V

    .line 86
    :cond_0
    const-string v1, "constructor"

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ImporterTopLevel;->delete(Ljava/lang/String;)V

    .line 87
    return-void
.end method
