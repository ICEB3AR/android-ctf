.class final Lcom/trendmicro/classfile/TypeInfo;
.super Ljava/lang/Object;
.source "TypeInfo.java"


# static fields
.field static final DOUBLE:I = 0x3

.field static final FLOAT:I = 0x2

.field static final INTEGER:I = 0x1

.field static final LONG:I = 0x4

.field static final NULL:I = 0x5

.field static final OBJECT_TAG:I = 0x7

.field static final TOP:I = 0x0

.field static final UNINITIALIZED_THIS:I = 0x6

.field static final UNINITIALIZED_VAR_TAG:I = 0x8


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static final OBJECT(I)I
    .locals 1
    .param p0, "constantPoolIndex"    # I

    .line 30
    const v0, 0xffff

    and-int/2addr v0, p0

    shl-int/lit8 v0, v0, 0x8

    or-int/lit8 v0, v0, 0x7

    return v0
.end method

.method static final OBJECT(Ljava/lang/String;Lcom/trendmicro/classfile/ConstantPool;)I
    .locals 1
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "pool"    # Lcom/trendmicro/classfile/ConstantPool;

    .line 34
    invoke-virtual {p1, p0}, Lcom/trendmicro/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v0

    invoke-static {v0}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(I)I

    move-result v0

    return v0
.end method

.method static final UNINITIALIZED_VARIABLE(I)I
    .locals 1
    .param p0, "bytecodeOffset"    # I

    .line 38
    const v0, 0xffff

    and-int/2addr v0, p0

    shl-int/lit8 v0, v0, 0x8

    or-int/lit8 v0, v0, 0x8

    return v0
.end method

.method static final fromType(Ljava/lang/String;Lcom/trendmicro/classfile/ConstantPool;)I
    .locals 3
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "pool"    # Lcom/trendmicro/classfile/ConstantPool;

    .line 66
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 67
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x46

    if-eq v0, v2, :cond_2

    const/16 v2, 0x53

    if-eq v0, v2, :cond_1

    const/16 v2, 0x5a

    if-eq v0, v2, :cond_1

    const/16 v2, 0x49

    if-eq v0, v2, :cond_1

    const/16 v2, 0x4a

    if-eq v0, v2, :cond_0

    packed-switch v0, :pswitch_data_0

    .line 81
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bad type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :pswitch_0
    const/4 v0, 0x3

    return v0

    .line 79
    :cond_0
    const/4 v0, 0x4

    return v0

    .line 73
    :cond_1
    :pswitch_1
    return v1

    .line 77
    :cond_2
    const/4 v0, 0x2

    return v0

    .line 84
    :cond_3
    invoke-static {p0, p1}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(Ljava/lang/String;Lcom/trendmicro/classfile/ConstantPool;)I

    move-result v0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x42
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getClassFromInternalName(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "internalName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 211
    const/16 v0, 0x2f

    const/16 v1, 0x2e

    :try_start_0
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 212
    :catch_0
    move-exception v0

    .line 213
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static final getPayload(I)I
    .locals 1
    .param p0, "typeInfo"    # I

    .line 46
    ushr-int/lit8 v0, p0, 0x8

    return v0
.end method

.method static final getPayloadAsType(ILcom/trendmicro/classfile/ConstantPool;)Ljava/lang/String;
    .locals 2
    .param p0, "typeInfo"    # I
    .param p1, "pool"    # Lcom/trendmicro/classfile/ConstantPool;

    .line 56
    invoke-static {p0}, Lcom/trendmicro/classfile/TypeInfo;->getTag(I)I

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    .line 57
    invoke-static {p0}, Lcom/trendmicro/classfile/TypeInfo;->getPayload(I)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/trendmicro/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 59
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "expecting object type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static final getTag(I)I
    .locals 1
    .param p0, "typeInfo"    # I

    .line 42
    and-int/lit16 v0, p0, 0xff

    return v0
.end method

.method static isTwoWords(I)Z
    .locals 1
    .param p0, "type"    # I

    .line 88
    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method static merge(IILcom/trendmicro/classfile/ConstantPool;)I
    .locals 13
    .param p0, "current"    # I
    .param p1, "incoming"    # I
    .param p2, "pool"    # Lcom/trendmicro/classfile/ConstantPool;

    .line 110
    invoke-static {p0}, Lcom/trendmicro/classfile/TypeInfo;->getTag(I)I

    move-result v0

    .line 111
    .local v0, "currentTag":I
    invoke-static {p1}, Lcom/trendmicro/classfile/TypeInfo;->getTag(I)I

    move-result v1

    .line 112
    .local v1, "incomingTag":I
    const/4 v2, 0x1

    const/4 v3, 0x7

    const/4 v4, 0x0

    if-ne v0, v3, :cond_0

    move v5, v2

    goto :goto_0

    :cond_0
    move v5, v4

    .line 113
    .local v5, "currentIsObject":Z
    :goto_0
    if-ne v1, v3, :cond_1

    goto :goto_1

    :cond_1
    move v2, v4

    .line 115
    .local v2, "incomingIsObject":Z
    :goto_1
    if-eq p0, p1, :cond_e

    const/4 v3, 0x5

    if-eqz v5, :cond_2

    if-ne p1, v3, :cond_2

    goto/16 :goto_5

    .line 117
    :cond_2
    if-eqz v0, :cond_d

    if-nez v1, :cond_3

    goto/16 :goto_4

    .line 120
    :cond_3
    if-ne p0, v3, :cond_4

    if-eqz v2, :cond_4

    .line 121
    return p1

    .line 122
    :cond_4
    if-eqz v5, :cond_c

    if-eqz v2, :cond_c

    .line 123
    invoke-static {p0, p2}, Lcom/trendmicro/classfile/TypeInfo;->getPayloadAsType(ILcom/trendmicro/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v3

    .line 124
    .local v3, "currentName":Ljava/lang/String;
    invoke-static {p1, p2}, Lcom/trendmicro/classfile/TypeInfo;->getPayloadAsType(ILcom/trendmicro/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v4

    .line 128
    .local v4, "incomingName":Ljava/lang/String;
    const/4 v6, 0x2

    invoke-virtual {p2, v6}, Lcom/trendmicro/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 129
    .local v6, "currentlyGeneratedName":Ljava/lang/String;
    const/4 v7, 0x4

    .line 130
    invoke-virtual {p2, v7}, Lcom/trendmicro/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 136
    .local v7, "currentlyGeneratedSuperName":Ljava/lang/String;
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 137
    move-object v3, v7

    .line 139
    :cond_5
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 140
    move-object v4, v7

    .line 143
    :cond_6
    invoke-static {v3}, Lcom/trendmicro/classfile/TypeInfo;->getClassFromInternalName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 144
    .local v8, "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v4}, Lcom/trendmicro/classfile/TypeInfo;->getClassFromInternalName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 146
    .local v9, "incomingClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 147
    return p0

    .line 148
    :cond_7
    invoke-virtual {v9, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 149
    return p1

    .line 150
    :cond_8
    invoke-virtual {v9}, Ljava/lang/Class;->isInterface()Z

    move-result v10

    if-nez v10, :cond_b

    .line 151
    invoke-virtual {v8}, Ljava/lang/Class;->isInterface()Z

    move-result v10

    if-eqz v10, :cond_9

    goto :goto_3

    .line 158
    :cond_9
    invoke-virtual {v9}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v10

    .line 159
    .local v10, "commonClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_2
    if-eqz v10, :cond_c

    .line 160
    invoke-virtual {v10, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v11

    if-eqz v11, :cond_a

    .line 161
    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    .line 162
    .local v11, "name":Ljava/lang/String;
    invoke-static {v11}, Lcom/trendmicro/classfile/ClassFileWriter;->getSlashedForm(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 163
    invoke-static {v11, p2}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(Ljava/lang/String;Lcom/trendmicro/classfile/ConstantPool;)I

    move-result v12

    return v12

    .line 165
    .end local v11    # "name":Ljava/lang/String;
    :cond_a
    invoke-virtual {v10}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v10

    goto :goto_2

    .line 156
    .end local v10    # "commonClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_b
    :goto_3
    const-string v10, "java/lang/Object"

    invoke-static {v10, p2}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(Ljava/lang/String;Lcom/trendmicro/classfile/ConstantPool;)I

    move-result v10

    return v10

    .line 169
    .end local v3    # "currentName":Ljava/lang/String;
    .end local v4    # "incomingName":Ljava/lang/String;
    .end local v6    # "currentlyGeneratedName":Ljava/lang/String;
    .end local v7    # "currentlyGeneratedSuperName":Ljava/lang/String;
    .end local v8    # "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "incomingClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_c
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bad merge attempt between "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    invoke-static {p0, p2}, Lcom/trendmicro/classfile/TypeInfo;->toString(ILcom/trendmicro/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " and "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    invoke-static {p1, p2}, Lcom/trendmicro/classfile/TypeInfo;->toString(ILcom/trendmicro/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 119
    :cond_d
    :goto_4
    return v4

    .line 116
    :cond_e
    :goto_5
    return p0
.end method

.method static print([II[IILcom/trendmicro/classfile/ConstantPool;)V
    .locals 2
    .param p0, "locals"    # [I
    .param p1, "localsTop"    # I
    .param p2, "stack"    # [I
    .param p3, "stackTop"    # I
    .param p4, "pool"    # Lcom/trendmicro/classfile/ConstantPool;

    .line 236
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "locals: "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 237
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0, p1, p4}, Lcom/trendmicro/classfile/TypeInfo;->toString([IILcom/trendmicro/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 238
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "stack: "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 239
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p2, p3, p4}, Lcom/trendmicro/classfile/TypeInfo;->toString([IILcom/trendmicro/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 240
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 241
    return-void
.end method

.method static print([I[ILcom/trendmicro/classfile/ConstantPool;)V
    .locals 2
    .param p0, "locals"    # [I
    .param p1, "stack"    # [I
    .param p2, "pool"    # Lcom/trendmicro/classfile/ConstantPool;

    .line 231
    array-length v0, p0

    array-length v1, p1

    invoke-static {p0, v0, p1, v1, p2}, Lcom/trendmicro/classfile/TypeInfo;->print([II[IILcom/trendmicro/classfile/ConstantPool;)V

    .line 232
    return-void
.end method

.method static toString(ILcom/trendmicro/classfile/ConstantPool;)Ljava/lang/String;
    .locals 3
    .param p0, "type"    # I
    .param p1, "pool"    # Lcom/trendmicro/classfile/ConstantPool;

    .line 175
    invoke-static {p0}, Lcom/trendmicro/classfile/TypeInfo;->getTag(I)I

    move-result v0

    .line 176
    .local v0, "tag":I
    packed-switch v0, :pswitch_data_0

    .line 192
    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    .line 193
    invoke-static {p0, p1}, Lcom/trendmicro/classfile/TypeInfo;->getPayloadAsType(ILcom/trendmicro/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 190
    :pswitch_0
    const-string v1, "uninitialized_this"

    return-object v1

    .line 188
    :pswitch_1
    const-string v1, "null"

    return-object v1

    .line 186
    :pswitch_2
    const-string v1, "long"

    return-object v1

    .line 184
    :pswitch_3
    const-string v1, "double"

    return-object v1

    .line 182
    :pswitch_4
    const-string v1, "float"

    return-object v1

    .line 180
    :pswitch_5
    const-string v1, "int"

    return-object v1

    .line 178
    :pswitch_6
    const-string v1, "top"

    return-object v1

    .line 194
    :cond_0
    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    .line 195
    const-string v1, "uninitialized"

    return-object v1

    .line 197
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "bad type"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static toString([IILcom/trendmicro/classfile/ConstantPool;)Ljava/lang/String;
    .locals 3
    .param p0, "types"    # [I
    .param p1, "typesTop"    # I
    .param p2, "pool"    # Lcom/trendmicro/classfile/ConstantPool;

    .line 218
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 219
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p1, :cond_1

    .line 221
    if-lez v1, :cond_0

    .line 222
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    :cond_0
    aget v2, p0, v1

    invoke-static {v2, p2}, Lcom/trendmicro/classfile/TypeInfo;->toString(ILcom/trendmicro/classfile/ConstantPool;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 226
    .end local v1    # "i":I
    :cond_1
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
