.class final Lcom/trendmicro/hippo/MemberBox;
.super Ljava/lang/Object;
.source "MemberBox.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final primitives:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x583e1be606e304b5L


# instance fields
.field transient argTypes:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field transient delegateTo:Ljava/lang/Object;

.field private transient memberObject:Ljava/lang/reflect/Member;

.field transient vararg:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 289
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/Class;

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sput-object v0, Lcom/trendmicro/hippo/MemberBox;->primitives:[Ljava/lang/Class;

    return-void
.end method

.method constructor <init>(Ljava/lang/reflect/Constructor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Constructor<",
            "*>;)V"
        }
    .end annotation

    .line 43
    .local p1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/MemberBox;->init(Ljava/lang/reflect/Constructor;)V

    .line 45
    return-void
.end method

.method constructor <init>(Ljava/lang/reflect/Method;)V
    .locals 0
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/MemberBox;->init(Ljava/lang/reflect/Method;)V

    .line 40
    return-void
.end method

.method private init(Ljava/lang/reflect/Constructor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Constructor<",
            "*>;)V"
        }
    .end annotation

    .line 56
    .local p1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    iput-object p1, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    .line 57
    invoke-virtual {p1}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 58
    invoke-virtual {p1}, Ljava/lang/reflect/Constructor;->isVarArgs()Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/MemberBox;->vararg:Z

    .line 59
    return-void
.end method

.method private init(Ljava/lang/reflect/Method;)V
    .locals 1
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .line 49
    iput-object p1, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    .line 50
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 51
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->isVarArgs()Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/MemberBox;->vararg:Z

    .line 52
    return-void
.end method

.method private static readMember(Ljava/io/ObjectInputStream;)Ljava/lang/reflect/Member;
    .locals 8
    .param p0, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 273
    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v0

    if-nez v0, :cond_0

    .line 274
    const/4 v0, 0x0

    return-object v0

    .line 275
    :cond_0
    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v0

    .line 276
    .local v0, "isMethod":Z
    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 277
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 278
    .local v2, "declaring":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/trendmicro/hippo/MemberBox;->readParameters(Ljava/io/ObjectInputStream;)[Ljava/lang/Class;

    move-result-object v3

    .line 280
    .local v3, "parms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    if-eqz v0, :cond_1

    .line 281
    :try_start_0
    invoke-virtual {v2, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    return-object v4

    .line 283
    :cond_1
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    .line 284
    :catch_0
    move-exception v4

    .line 285
    .local v4, "e":Ljava/lang/NoSuchMethodException;
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Cannot find member: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 2
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 224
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 225
    invoke-static {p1}, Lcom/trendmicro/hippo/MemberBox;->readMember(Ljava/io/ObjectInputStream;)Ljava/lang/reflect/Member;

    move-result-object v0

    .line 226
    .local v0, "member":Ljava/lang/reflect/Member;
    instance-of v1, v0, Ljava/lang/reflect/Method;

    if-eqz v1, :cond_0

    .line 227
    move-object v1, v0

    check-cast v1, Ljava/lang/reflect/Method;

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/MemberBox;->init(Ljava/lang/reflect/Method;)V

    goto :goto_0

    .line 229
    :cond_0
    move-object v1, v0

    check-cast v1, Ljava/lang/reflect/Constructor;

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/MemberBox;->init(Ljava/lang/reflect/Constructor;)V

    .line 231
    :goto_0
    return-void
.end method

.method private static readParameters(Ljava/io/ObjectInputStream;)[Ljava/lang/Class;
    .locals 4
    .param p0, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/ObjectInputStream;",
            ")[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 337
    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readShort()S

    move-result v0

    new-array v0, v0, [Ljava/lang/Class;

    .line 338
    .local v0, "result":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 339
    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v2

    if-nez v2, :cond_0

    .line 340
    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    aput-object v2, v0, v1

    .line 341
    goto :goto_1

    .line 343
    :cond_0
    sget-object v2, Lcom/trendmicro/hippo/MemberBox;->primitives:[Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readByte()B

    move-result v3

    aget-object v2, v2, v3

    aput-object v2, v0, v1

    .line 338
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 345
    .end local v1    # "i":I
    :cond_1
    return-object v0
.end method

.method private static searchAccessibleMethod(Ljava/lang/reflect/Method;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 8
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 185
    .local p1, "params":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v0

    .line 186
    .local v0, "modifiers":I
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v1

    if-nez v1, :cond_4

    .line 187
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    .line 188
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v2

    if-nez v2, :cond_4

    .line 189
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    .line 190
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v3

    .line 191
    .local v3, "intfs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    .local v4, "i":I
    array-length v5, v3

    .local v5, "N":I
    :goto_0
    if-eq v4, v5, :cond_1

    .line 192
    aget-object v6, v3, v4

    .line 193
    .local v6, "intf":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v6}, Ljava/lang/Class;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 195
    :try_start_0
    invoke-virtual {v6, v2, p1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v7

    .line 197
    :catch_0
    move-exception v7

    goto :goto_1

    .line 196
    :catch_1
    move-exception v7

    .line 191
    .end local v6    # "intf":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 201
    .end local v4    # "i":I
    .end local v5    # "N":I
    :cond_1
    :goto_2
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    .line 202
    if-nez v1, :cond_2

    goto :goto_4

    .line 203
    :cond_2
    invoke-virtual {v1}, Ljava/lang/Class;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 205
    :try_start_1
    invoke-virtual {v1, v2, p1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 206
    .local v4, "m":Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v5

    .line 207
    .local v5, "mModifiers":I
    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 208
    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v6
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_2

    if-nez v6, :cond_3

    .line 210
    return-object v4

    .line 213
    .end local v4    # "m":Ljava/lang/reflect/Method;
    .end local v5    # "mModifiers":I
    :catch_2
    move-exception v4

    goto :goto_3

    .line 212
    :catch_3
    move-exception v4

    .line 213
    :cond_3
    :goto_3
    goto :goto_2

    .line 218
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "intfs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_4
    :goto_4
    const/4 v1, 0x0

    return-object v1
.end method

.method private static writeMember(Ljava/io/ObjectOutputStream;Ljava/lang/reflect/Member;)V
    .locals 2
    .param p0, "out"    # Ljava/io/ObjectOutputStream;
    .param p1, "member"    # Ljava/lang/reflect/Member;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 250
    if-nez p1, :cond_0

    .line 251
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 252
    return-void

    .line 254
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 255
    instance-of v0, p1, Ljava/lang/reflect/Method;

    if-nez v0, :cond_2

    instance-of v0, p1, Ljava/lang/reflect/Constructor;

    if-eqz v0, :cond_1

    goto :goto_0

    .line 256
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "not Method or Constructor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 257
    :cond_2
    :goto_0
    instance-of v0, p1, Ljava/lang/reflect/Method;

    invoke-virtual {p0, v0}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 258
    invoke-interface {p1}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 259
    invoke-interface {p1}, Ljava/lang/reflect/Member;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 260
    instance-of v0, p1, Ljava/lang/reflect/Method;

    if-eqz v0, :cond_3

    .line 261
    move-object v0, p1

    check-cast v0, Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/MemberBox;->writeParameters(Ljava/io/ObjectOutputStream;[Ljava/lang/Class;)V

    goto :goto_1

    .line 263
    :cond_3
    move-object v0, p1

    check-cast v0, Ljava/lang/reflect/Constructor;

    invoke-virtual {v0}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/MemberBox;->writeParameters(Ljava/io/ObjectOutputStream;[Ljava/lang/Class;)V

    .line 265
    :goto_1
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 236
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 237
    iget-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/MemberBox;->writeMember(Ljava/io/ObjectOutputStream;Ljava/lang/reflect/Member;)V

    .line 238
    return-void
.end method

.method private static writeParameters(Ljava/io/ObjectOutputStream;[Ljava/lang/Class;)V
    .locals 6
    .param p0, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/ObjectOutputStream;",
            "[",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 310
    .local p1, "parms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v0, p1

    invoke-virtual {p0, v0}, Ljava/io/ObjectOutputStream;->writeShort(I)V

    .line 312
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_3

    .line 313
    aget-object v1, p1, v0

    .line 314
    .local v1, "parm":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    .line 315
    .local v2, "primitive":Z
    invoke-virtual {p0, v2}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 316
    if-nez v2, :cond_0

    .line 317
    invoke-virtual {p0, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 318
    goto :goto_2

    .line 320
    :cond_0
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    sget-object v4, Lcom/trendmicro/hippo/MemberBox;->primitives:[Ljava/lang/Class;

    array-length v5, v4

    if-ge v3, v5, :cond_2

    .line 321
    aget-object v4, v4, v3

    invoke-virtual {v1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 322
    invoke-virtual {p0, v3}, Ljava/io/ObjectOutputStream;->writeByte(I)V

    .line 323
    nop

    .line 312
    .end local v1    # "parm":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "primitive":Z
    .end local v3    # "j":I
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 320
    .restart local v1    # "parm":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "primitive":Z
    .restart local v3    # "j":I
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 326
    .end local v3    # "j":I
    :cond_2
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Primitive "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " not found"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 329
    .end local v0    # "i":I
    .end local v1    # "parm":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "primitive":Z
    :cond_3
    return-void
.end method


# virtual methods
.method ctor()Ljava/lang/reflect/Constructor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .line 68
    iget-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    check-cast v0, Ljava/lang/reflect/Constructor;

    return-object v0
.end method

.method getDeclaringClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 103
    iget-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    invoke-interface {v0}, Ljava/lang/reflect/Member;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method getName()Ljava/lang/String;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    invoke-interface {v0}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 135
    invoke-virtual {p0}, Lcom/trendmicro/hippo/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v0

    .line 138
    .local v0, "method":Ljava/lang/reflect/Method;
    :try_start_0
    invoke-virtual {v0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 161
    :catch_0
    move-exception v1

    goto :goto_1

    .line 152
    :catch_1
    move-exception v1

    goto :goto_2

    .line 139
    :catch_2
    move-exception v1

    .line 140
    .local v1, "ex":Ljava/lang/IllegalAccessException;
    :try_start_1
    iget-object v2, p0, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    invoke-static {v0, v2}, Lcom/trendmicro/hippo/MemberBox;->searchAccessibleMethod(Ljava/lang/reflect/Method;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 141
    .local v2, "accessible":Ljava/lang/reflect/Method;
    if-eqz v2, :cond_0

    .line 142
    iput-object v2, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    .line 143
    move-object v0, v2

    goto :goto_0

    .line 145
    :cond_0
    sget-object v3, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    invoke-virtual {v3, v0}, Lcom/trendmicro/hippo/VMBridge;->tryToMakeAccessible(Ljava/lang/reflect/AccessibleObject;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 150
    :goto_0
    invoke-virtual {v0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 146
    :cond_1
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    .end local v0    # "method":Ljava/lang/reflect/Method;
    .end local p1    # "target":Ljava/lang/Object;
    .end local p2    # "args":[Ljava/lang/Object;
    throw v3
    :try_end_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 162
    .end local v2    # "accessible":Ljava/lang/reflect/Method;
    .restart local v0    # "method":Ljava/lang/reflect/Method;
    .local v1, "ex":Ljava/lang/Exception;
    .restart local p1    # "target":Ljava/lang/Object;
    .restart local p2    # "args":[Ljava/lang/Object;
    :goto_1
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 154
    .local v1, "ite":Ljava/lang/reflect/InvocationTargetException;
    :goto_2
    move-object v2, v1

    .line 156
    .local v2, "e":Ljava/lang/Throwable;
    :goto_3
    move-object v3, v2

    check-cast v3, Ljava/lang/reflect/InvocationTargetException;

    invoke-virtual {v3}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v2

    .line 157
    instance-of v3, v2, Ljava/lang/reflect/InvocationTargetException;

    if-nez v3, :cond_3

    .line 158
    instance-of v3, v2, Lcom/trendmicro/hippo/ContinuationPending;

    if-eqz v3, :cond_2

    .line 159
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/ContinuationPending;

    throw v3

    .line 160
    :cond_2
    invoke-static {v2}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 157
    :cond_3
    goto :goto_3
.end method

.method isCtor()Z
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    instance-of v0, v0, Ljava/lang/reflect/Constructor;

    return v0
.end method

.method isMethod()Z
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    instance-of v0, v0, Ljava/lang/reflect/Method;

    return v0
.end method

.method isPublic()Z
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    invoke-interface {v0}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    return v0
.end method

.method isStatic()Z
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    invoke-interface {v0}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v0

    return v0
.end method

.method member()Ljava/lang/reflect/Member;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    return-object v0
.end method

.method method()Ljava/lang/reflect/Method;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    check-cast v0, Ljava/lang/reflect/Method;

    return-object v0
.end method

.method newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "args"    # [Ljava/lang/Object;

    .line 168
    invoke-virtual {p0}, Lcom/trendmicro/hippo/MemberBox;->ctor()Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 171
    .local v0, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 178
    :catch_0
    move-exception v1

    goto :goto_0

    .line 172
    :catch_1
    move-exception v1

    .line 173
    .local v1, "ex":Ljava/lang/IllegalAccessException;
    :try_start_1
    sget-object v2, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    invoke-virtual {v2, v0}, Lcom/trendmicro/hippo/VMBridge;->tryToMakeAccessible(Ljava/lang/reflect/AccessibleObject;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 177
    .end local v1    # "ex":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 174
    .restart local v1    # "ex":Ljava/lang/IllegalAccessException;
    :cond_0
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    .end local v0    # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local p1    # "args":[Ljava/lang/Object;
    throw v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 179
    .restart local v0    # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .local v1, "ex":Ljava/lang/Exception;
    .restart local p1    # "args":[Ljava/lang/Object;
    :goto_0
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2
.end method

.method toJavaDeclaration()Ljava/lang/String;
    .locals 5

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/MemberBox;->isMethod()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 110
    invoke-virtual {p0}, Lcom/trendmicro/hippo/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v1

    .line 111
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 113
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .end local v1    # "method":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 115
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/MemberBox;->ctor()Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 116
    .local v1, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {v1}, Ljava/lang/reflect/Constructor;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 117
    .local v2, "name":Ljava/lang/String;
    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 118
    .local v3, "lastDot":I
    if-ltz v3, :cond_1

    .line 119
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 121
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .end local v1    # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "lastDot":I
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    invoke-static {v1}, Lcom/trendmicro/hippo/JavaMembers;->liveConnectSignature([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/trendmicro/hippo/MemberBox;->memberObject:Ljava/lang/reflect/Member;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
