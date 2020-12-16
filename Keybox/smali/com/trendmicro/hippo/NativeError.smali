.class final Lcom/trendmicro/hippo/NativeError;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/NativeError$ProtoProps;
    }
.end annotation


# static fields
.field private static final ConstructorId_captureStackTrace:I = -0x1

.field public static final DEFAULT_STACK_LIMIT:I = -0x1

.field private static final ERROR_DELEGATE_GET_STACK:Ljava/lang/reflect/Method;

.field private static final ERROR_DELEGATE_SET_STACK:Ljava/lang/reflect/Method;

.field private static final ERROR_TAG:Ljava/lang/Object;

.field private static final Id_constructor:I = 0x1

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field private static final MAX_PROTOTYPE_ID:I = 0x3

.field private static final STACK_HIDE_KEY:Ljava/lang/String; = "_stackHide"

.field private static final serialVersionUID:J = -0x4a15dade41b63183L


# instance fields
.field private stackProvider:Lcom/trendmicro/hippo/HippoException;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 22
    const-class v0, Lcom/trendmicro/hippo/NativeError;

    const-string v1, "Error"

    sput-object v1, Lcom/trendmicro/hippo/NativeError;->ERROR_TAG:Ljava/lang/Object;

    .line 30
    :try_start_0
    const-string v1, "getStackDelegated"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Lcom/trendmicro/hippo/Scriptable;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/trendmicro/hippo/NativeError;->ERROR_DELEGATE_GET_STACK:Ljava/lang/reflect/Method;

    .line 31
    const-string v1, "setStackDelegated"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Lcom/trendmicro/hippo/Scriptable;

    aput-object v4, v3, v5

    const-class v4, Ljava/lang/Object;

    aput-object v4, v3, v2

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/NativeError;->ERROR_DELEGATE_SET_STACK:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    nop

    .line 35
    return-void

    .line 32
    :catch_0
    move-exception v0

    .line 33
    .local v0, "nsm":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    return-void
.end method

.method private callPrepareStack(Lcom/trendmicro/hippo/Function;[Lcom/trendmicro/hippo/ScriptStackElement;)Ljava/lang/Object;
    .locals 5
    .param p1, "prepare"    # Lcom/trendmicro/hippo/Function;
    .param p2, "stack"    # [Lcom/trendmicro/hippo/ScriptStackElement;

    .line 214
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 215
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    array-length v1, p2

    new-array v1, v1, [Ljava/lang/Object;

    .line 218
    .local v1, "elts":[Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p2

    if-ge v2, v3, :cond_0

    .line 219
    const-string v3, "CallSite"

    invoke-virtual {v0, p0, v3}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/NativeCallSite;

    .line 220
    .local v3, "site":Lcom/trendmicro/hippo/NativeCallSite;
    aget-object v4, p2, v2

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/NativeCallSite;->setElement(Lcom/trendmicro/hippo/ScriptStackElement;)V

    .line 221
    aput-object v3, v1, v2

    .line 218
    .end local v3    # "site":Lcom/trendmicro/hippo/NativeCallSite;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 224
    .end local v2    # "i":I
    :cond_0
    invoke-virtual {v0, p0, v1}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 225
    .local v2, "eltArray":Lcom/trendmicro/hippo/Scriptable;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    const/4 v4, 0x1

    aput-object v2, v3, v4

    invoke-interface {p1, v0, p1, p0, v3}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 5
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 47
    new-instance v0, Lcom/trendmicro/hippo/NativeError;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeError;-><init>()V

    .line 48
    .local v0, "obj":Lcom/trendmicro/hippo/NativeError;
    const-string v1, "name"

    const-string v2, "Error"

    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 49
    const-string v2, "message"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    const-string v4, "fileName"

    invoke-static {v0, v4, v3}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 51
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "lineNumber"

    invoke-static {v0, v4, v3}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 52
    const/4 v3, 0x2

    invoke-virtual {v0, v1, v3}, Lcom/trendmicro/hippo/NativeError;->setAttributes(Ljava/lang/String;I)V

    .line 53
    invoke-virtual {v0, v2, v3}, Lcom/trendmicro/hippo/NativeError;->setAttributes(Ljava/lang/String;I)V

    .line 54
    const/4 v1, 0x3

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeError;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 55
    invoke-static {v0, p1}, Lcom/trendmicro/hippo/NativeCallSite;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 56
    return-void
.end method

.method private static js_captureStackTrace(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)V
    .locals 9
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 295
    const/4 v0, 0x0

    aget-object v0, p2, v0

    invoke-static {p0, v0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    .line 296
    .local v0, "obj":Lcom/trendmicro/hippo/ScriptableObject;
    const/4 v1, 0x0

    .line 297
    .local v1, "func":Lcom/trendmicro/hippo/Function;
    array-length v2, p2

    const/4 v3, 0x1

    if-le v2, v3, :cond_0

    .line 298
    aget-object v2, p2, v3

    invoke-static {p0, v2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    move-object v1, v2

    check-cast v1, Lcom/trendmicro/hippo/Function;

    move-object v7, v1

    goto :goto_0

    .line 297
    :cond_0
    move-object v7, v1

    .line 302
    .end local v1    # "func":Lcom/trendmicro/hippo/Function;
    .local v7, "func":Lcom/trendmicro/hippo/Function;
    :goto_0
    const-string v1, "Error"

    invoke-virtual {p0, p1, v1}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lcom/trendmicro/hippo/NativeError;

    .line 304
    .local v8, "err":Lcom/trendmicro/hippo/NativeError;
    new-instance v1, Lcom/trendmicro/hippo/EvaluatorException;

    const-string v2, "[object Object]"

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/EvaluatorException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Lcom/trendmicro/hippo/NativeError;->setStackProvider(Lcom/trendmicro/hippo/HippoException;)V

    .line 307
    if-eqz v7, :cond_1

    .line 308
    const-string v1, "name"

    invoke-interface {v7, v1, v7}, Lcom/trendmicro/hippo/Function;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 309
    .local v1, "funcName":Ljava/lang/Object;
    if-eqz v1, :cond_1

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 310
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "_stackHide"

    invoke-virtual {v8, v3, v2}, Lcom/trendmicro/hippo/NativeError;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    .end local v1    # "funcName":Ljava/lang/Object;
    :cond_1
    sget-object v4, Lcom/trendmicro/hippo/NativeError;->ERROR_DELEGATE_GET_STACK:Ljava/lang/reflect/Method;

    sget-object v5, Lcom/trendmicro/hippo/NativeError;->ERROR_DELEGATE_SET_STACK:Ljava/lang/reflect/Method;

    const/4 v6, 0x0

    const-string v2, "stack"

    move-object v1, v0

    move-object v3, v8

    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;I)V

    .line 319
    return-void
.end method

.method private static js_toSource(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/String;
    .locals 9
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 254
    const-string v0, "name"

    invoke-static {p2, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 255
    .local v0, "name":Ljava/lang/Object;
    const-string v1, "message"

    invoke-static {p2, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 256
    .local v1, "message":Ljava/lang/Object;
    const-string v2, "fileName"

    invoke-static {p2, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 257
    .local v2, "fileName":Ljava/lang/Object;
    const-string v3, "lineNumber"

    invoke-static {p2, v3}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 259
    .local v3, "lineNumber":Ljava/lang/Object;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 260
    .local v4, "sb":Ljava/lang/StringBuilder;
    const-string v5, "(new "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    sget-object v5, Lcom/trendmicro/hippo/NativeError;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v5, :cond_0

    .line 262
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 264
    :cond_0
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    sget-object v5, Lcom/trendmicro/hippo/NativeError;->NOT_FOUND:Ljava/lang/Object;

    if-ne v1, v5, :cond_1

    sget-object v5, Lcom/trendmicro/hippo/NativeError;->NOT_FOUND:Ljava/lang/Object;

    if-ne v2, v5, :cond_1

    sget-object v5, Lcom/trendmicro/hippo/NativeError;->NOT_FOUND:Ljava/lang/Object;

    if-eq v3, v5, :cond_5

    .line 270
    :cond_1
    sget-object v5, Lcom/trendmicro/hippo/NativeError;->NOT_FOUND:Ljava/lang/Object;

    if-ne v1, v5, :cond_2

    .line 271
    const-string v1, ""

    .line 273
    :cond_2
    invoke-static {p0, p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->uneval(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    sget-object v5, Lcom/trendmicro/hippo/NativeError;->NOT_FOUND:Ljava/lang/Object;

    if-ne v2, v5, :cond_3

    sget-object v5, Lcom/trendmicro/hippo/NativeError;->NOT_FOUND:Ljava/lang/Object;

    if-eq v3, v5, :cond_5

    .line 275
    :cond_3
    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    sget-object v6, Lcom/trendmicro/hippo/NativeError;->NOT_FOUND:Ljava/lang/Object;

    if-ne v2, v6, :cond_4

    .line 277
    const-string v2, ""

    .line 279
    :cond_4
    invoke-static {p0, p1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->uneval(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    sget-object v6, Lcom/trendmicro/hippo/NativeError;->NOT_FOUND:Ljava/lang/Object;

    if-eq v3, v6, :cond_5

    .line 281
    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v6

    .line 282
    .local v6, "line":I
    if-eqz v6, :cond_5

    .line 283
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    int-to-double v7, v6

    invoke-static {v7, v8}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    .end local v6    # "line":I
    :cond_5
    const-string v5, "))"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private static js_toString(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 4
    .param p0, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 229
    const-string v0, "name"

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 230
    .local v0, "name":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/NativeError;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_1

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 233
    :cond_0
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 231
    :cond_1
    :goto_0
    const-string v0, "Error"

    .line 235
    :goto_1
    const-string v1, "message"

    invoke-static {p0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 236
    .local v1, "msg":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/NativeError;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_3

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v1, v2, :cond_2

    goto :goto_2

    .line 239
    :cond_2
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    .line 237
    :cond_3
    :goto_2
    const-string v1, ""

    .line 241
    :goto_3
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_4

    .line 242
    return-object v1

    .line 243
    :cond_4
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_5

    .line 244
    return-object v0

    .line 246
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v3, v1

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method static make(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;[Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeError;
    .locals 7
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "ctorObj"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 61
    const-string v0, "prototype"

    invoke-virtual {p2, v0, p2}, Lcom/trendmicro/hippo/IdFunctionObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    .line 63
    .local v0, "proto":Lcom/trendmicro/hippo/Scriptable;
    new-instance v1, Lcom/trendmicro/hippo/NativeError;

    invoke-direct {v1}, Lcom/trendmicro/hippo/NativeError;-><init>()V

    .line 64
    .local v1, "obj":Lcom/trendmicro/hippo/NativeError;
    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/NativeError;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 65
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/NativeError;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 67
    array-length v2, p3

    .line 68
    .local v2, "arglen":I
    const/4 v3, 0x1

    if-lt v2, v3, :cond_1

    .line 69
    const/4 v4, 0x0

    aget-object v5, p3, v4

    sget-object v6, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq v5, v6, :cond_0

    .line 70
    aget-object v4, p3, v4

    .line 71
    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 70
    const-string v5, "message"

    invoke-static {v1, v5, v4}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 73
    :cond_0
    const/4 v4, 0x2

    if-lt v2, v4, :cond_1

    .line 74
    aget-object v3, p3, v3

    const-string v5, "fileName"

    invoke-static {v1, v5, v3}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    const/4 v3, 0x3

    if-lt v2, v3, :cond_1

    .line 76
    aget-object v3, p3, v4

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v3

    .line 77
    .local v3, "line":I
    nop

    .line 78
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 77
    const-string v5, "lineNumber"

    invoke-static {v1, v5, v4}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 82
    .end local v3    # "line":I
    :cond_1
    return-object v1
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 138
    sget-object v0, Lcom/trendmicro/hippo/NativeError;->ERROR_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 139
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 141
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 142
    .local v0, "id":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 150
    invoke-static {p2, p3, p4}, Lcom/trendmicro/hippo/NativeError;->js_toSource(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 156
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 147
    :cond_2
    invoke-static {p4}, Lcom/trendmicro/hippo/NativeError;->js_toString(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 144
    :cond_3
    invoke-static {p2, p3, p1, p5}, Lcom/trendmicro/hippo/NativeError;->make(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;[Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeError;

    move-result-object v1

    return-object v1

    .line 153
    :cond_4
    invoke-static {p2, p4, p5}, Lcom/trendmicro/hippo/NativeError;->js_captureStackTrace(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)V

    .line 154
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1
.end method

.method protected fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V
    .locals 8
    .param p1, "ctor"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 88
    sget-object v2, Lcom/trendmicro/hippo/NativeError;->ERROR_TAG:Ljava/lang/Object;

    const/4 v3, -0x1

    const-string v4, "captureStackTrace"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeError;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 94
    new-instance v0, Lcom/trendmicro/hippo/NativeError$ProtoProps;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/NativeError$ProtoProps;-><init>(Lcom/trendmicro/hippo/NativeError$1;)V

    .line 95
    .local v0, "protoProps":Lcom/trendmicro/hippo/NativeError$ProtoProps;
    const-string v1, "_ErrorPrototypeProps"

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/NativeError;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v5, Lcom/trendmicro/hippo/NativeError$ProtoProps;->GET_STACK_LIMIT:Ljava/lang/reflect/Method;

    sget-object v6, Lcom/trendmicro/hippo/NativeError$ProtoProps;->SET_STACK_LIMIT:Ljava/lang/reflect/Method;

    const-string v3, "stackTraceLimit"

    const/4 v7, 0x0

    move-object v2, p1

    move-object v4, v0

    invoke-virtual/range {v2 .. v7}, Lcom/trendmicro/hippo/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;I)V

    .line 100
    sget-object v5, Lcom/trendmicro/hippo/NativeError$ProtoProps;->GET_PREPARE_STACK:Ljava/lang/reflect/Method;

    sget-object v6, Lcom/trendmicro/hippo/NativeError$ProtoProps;->SET_PREPARE_STACK:Ljava/lang/reflect/Method;

    const-string v3, "prepareStackTrace"

    invoke-virtual/range {v2 .. v7}, Lcom/trendmicro/hippo/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;I)V

    .line 103
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V

    .line 104
    return-void
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .line 327
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 328
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 329
    .local v2, "s_length":I
    const/16 v3, 0x8

    if-ne v2, v3, :cond_1

    .line 330
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 331
    .local v3, "c":I
    const/16 v4, 0x6f

    if-ne v3, v4, :cond_0

    const-string v1, "toSource"

    const/4 v0, 0x3

    goto :goto_0

    .line 332
    :cond_0
    const/16 v4, 0x74

    if-ne v3, v4, :cond_2

    const-string v1, "toString"

    const/4 v0, 0x2

    goto :goto_0

    .line 334
    .end local v3    # "c":I
    :cond_1
    const/16 v3, 0xb

    if-ne v2, v3, :cond_2

    const-string v1, "constructor"

    const/4 v0, 0x1

    .line 335
    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    if-eq v1, p1, :cond_3

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v0, 0x0

    .line 339
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_3
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 109
    const-string v0, "Error"

    return-object v0
.end method

.method public getStackDelegated(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 7
    .param p1, "target"    # Lcom/trendmicro/hippo/Scriptable;

    .line 173
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeError;->stackProvider:Lcom/trendmicro/hippo/HippoException;

    if-nez v0, :cond_0

    .line 174
    sget-object v0, Lcom/trendmicro/hippo/NativeError;->NOT_FOUND:Ljava/lang/Object;

    return-object v0

    .line 178
    :cond_0
    const/4 v0, -0x1

    .line 179
    .local v0, "limit":I
    const/4 v1, 0x0

    .line 180
    .local v1, "prepare":Lcom/trendmicro/hippo/Function;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeError;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/NativeError;

    .line 181
    .local v2, "cons":Lcom/trendmicro/hippo/NativeError;
    const-string v3, "_ErrorPrototypeProps"

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/NativeError;->getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/NativeError$ProtoProps;

    .line 183
    .local v3, "pp":Lcom/trendmicro/hippo/NativeError$ProtoProps;
    if-eqz v3, :cond_1

    .line 184
    invoke-virtual {v3}, Lcom/trendmicro/hippo/NativeError$ProtoProps;->getStackTraceLimit()I

    move-result v0

    .line 185
    invoke-virtual {v3}, Lcom/trendmicro/hippo/NativeError$ProtoProps;->getPrepareStackTrace()Lcom/trendmicro/hippo/Function;

    move-result-object v1

    .line 189
    :cond_1
    const-string v4, "_stackHide"

    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/NativeError;->getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 190
    .local v4, "hideFunc":Ljava/lang/String;
    iget-object v5, p0, Lcom/trendmicro/hippo/NativeError;->stackProvider:Lcom/trendmicro/hippo/HippoException;

    invoke-virtual {v5, v0, v4}, Lcom/trendmicro/hippo/HippoException;->getScriptStack(ILjava/lang/String;)[Lcom/trendmicro/hippo/ScriptStackElement;

    move-result-object v5

    .line 194
    .local v5, "stack":[Lcom/trendmicro/hippo/ScriptStackElement;
    if-nez v1, :cond_2

    .line 195
    iget-object v6, p0, Lcom/trendmicro/hippo/NativeError;->stackProvider:Lcom/trendmicro/hippo/HippoException;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/HippoException;->details()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/trendmicro/hippo/HippoException;->formatStackTrace([Lcom/trendmicro/hippo/ScriptStackElement;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .local v6, "value":Ljava/lang/Object;
    goto :goto_0

    .line 197
    .end local v6    # "value":Ljava/lang/Object;
    :cond_2
    invoke-direct {p0, v1, v5}, Lcom/trendmicro/hippo/NativeError;->callPrepareStack(Lcom/trendmicro/hippo/Function;[Lcom/trendmicro/hippo/ScriptStackElement;)Ljava/lang/Object;

    move-result-object v6

    .line 202
    .restart local v6    # "value":Ljava/lang/Object;
    :goto_0
    invoke-virtual {p0, p1, v6}, Lcom/trendmicro/hippo/NativeError;->setStackDelegated(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 203
    return-object v6
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 125
    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 128
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "toSource"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 129
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 127
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 126
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 131
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/NativeError;->ERROR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeError;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 132
    return-void
.end method

.method public setStackDelegated(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 2
    .param p1, "target"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "value"    # Ljava/lang/Object;

    .line 207
    const-string v0, "stack"

    invoke-interface {p1, v0}, Lcom/trendmicro/hippo/Scriptable;->delete(Ljava/lang/String;)V

    .line 208
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/NativeError;->stackProvider:Lcom/trendmicro/hippo/HippoException;

    .line 209
    invoke-interface {p1, v0, p1, p2}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 210
    return-void
.end method

.method public setStackProvider(Lcom/trendmicro/hippo/HippoException;)V
    .locals 7
    .param p1, "re"    # Lcom/trendmicro/hippo/HippoException;

    .line 164
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeError;->stackProvider:Lcom/trendmicro/hippo/HippoException;

    if-nez v0, :cond_0

    .line 165
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeError;->stackProvider:Lcom/trendmicro/hippo/HippoException;

    .line 166
    sget-object v4, Lcom/trendmicro/hippo/NativeError;->ERROR_DELEGATE_GET_STACK:Ljava/lang/reflect/Method;

    sget-object v5, Lcom/trendmicro/hippo/NativeError;->ERROR_DELEGATE_SET_STACK:Ljava/lang/reflect/Method;

    const/4 v6, 0x2

    const-string v2, "stack"

    move-object v1, p0

    move-object v3, p0

    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/hippo/NativeError;->defineProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;I)V

    .line 170
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 116
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeError;->js_toString(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 117
    .local v0, "toString":Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method
