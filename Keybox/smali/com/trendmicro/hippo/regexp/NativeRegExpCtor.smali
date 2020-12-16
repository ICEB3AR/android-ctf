.class Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "NativeRegExpCtor.java"


# static fields
.field private static final DOLLAR_ID_BASE:I = 0xc

.field private static final Id_AMPERSAND:I = 0x6

.field private static final Id_BACK_QUOTE:I = 0xa

.field private static final Id_DOLLAR_1:I = 0xd

.field private static final Id_DOLLAR_2:I = 0xe

.field private static final Id_DOLLAR_3:I = 0xf

.field private static final Id_DOLLAR_4:I = 0x10

.field private static final Id_DOLLAR_5:I = 0x11

.field private static final Id_DOLLAR_6:I = 0x12

.field private static final Id_DOLLAR_7:I = 0x13

.field private static final Id_DOLLAR_8:I = 0x14

.field private static final Id_DOLLAR_9:I = 0x15

.field private static final Id_PLUS:I = 0x8

.field private static final Id_QUOTE:I = 0xc

.field private static final Id_STAR:I = 0x2

.field private static final Id_UNDERSCORE:I = 0x4

.field private static final Id_input:I = 0x3

.field private static final Id_lastMatch:I = 0x5

.field private static final Id_lastParen:I = 0x7

.field private static final Id_leftContext:I = 0x9

.field private static final Id_multiline:I = 0x1

.field private static final Id_rightContext:I = 0xb

.field private static final MAX_INSTANCE_ID:I = 0x15

.field private static final serialVersionUID:J = -0x4f90e148c40815ceL


# instance fields
.field private inputAttr:I

.field private multilineAttr:I

.field private starAttr:I

.field private underscoreAttr:I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 336
    const/4 v0, 0x4

    iput v0, p0, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->multilineAttr:I

    .line 337
    iput v0, p0, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->starAttr:I

    .line 338
    iput v0, p0, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->inputAttr:I

    .line 339
    iput v0, p0, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->underscoreAttr:I

    .line 35
    return-void
.end method

.method private static getImpl()Lcom/trendmicro/hippo/regexp/RegExpImpl;
    .locals 2

    .line 76
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 77
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getRegExpProxy(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/RegExpProxy;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;

    return-object v1
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 57
    array-length v0, p4

    if-lez v0, :cond_1

    const/4 v0, 0x0

    aget-object v1, p4, v0

    instance-of v1, v1, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    if-eqz v1, :cond_1

    array-length v1, p4

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    aget-object v1, p4, v2

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v1, v2, :cond_1

    .line 60
    :cond_0
    aget-object v0, p4, v0

    return-object v0

    .line 62
    :cond_1
    invoke-virtual {p0, p1, p2, p4}, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 68
    new-instance v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    invoke-direct {v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;-><init>()V

    .line 69
    .local v0, "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    invoke-virtual {v0, p1, p2, p3}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->compile(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    .line 70
    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->RegExp:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, p2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V

    .line 71
    return-object v0
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 9
    .param p1, "s"    # Ljava/lang/String;

    .line 126
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 127
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x4

    const/4 v4, 0x1

    const/4 v5, 0x2

    if-eq v2, v5, :cond_6

    const/4 v6, 0x5

    if-eq v2, v6, :cond_5

    const/16 v6, 0x9

    if-eq v2, v6, :cond_2

    const/16 v6, 0xb

    if-eq v2, v6, :cond_1

    const/16 v6, 0xc

    if-eq v2, v6, :cond_0

    goto/16 :goto_0

    .line 152
    :cond_0
    const-string v1, "rightContext"

    const/16 v0, 0xb

    goto/16 :goto_0

    .line 151
    :cond_1
    const-string v1, "leftContext"

    const/16 v0, 0x9

    goto/16 :goto_0

    .line 146
    :cond_2
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 147
    .local v2, "c":I
    const/16 v6, 0x4d

    if-ne v2, v6, :cond_3

    const-string v1, "lastMatch"

    const/4 v0, 0x5

    goto/16 :goto_0

    .line 148
    :cond_3
    const/16 v6, 0x50

    if-ne v2, v6, :cond_4

    const-string v1, "lastParen"

    const/4 v0, 0x7

    goto/16 :goto_0

    .line 149
    :cond_4
    const/16 v6, 0x69

    if-ne v2, v6, :cond_d

    const-string v1, "multiline"

    const/4 v0, 0x1

    goto/16 :goto_0

    .line 145
    .end local v2    # "c":I
    :cond_5
    const-string v1, "input"

    const/4 v0, 0x3

    goto/16 :goto_0

    .line 128
    :cond_6
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v6, 0x26

    const/16 v7, 0x24

    const/4 v8, 0x0

    if-eq v2, v6, :cond_c

    const/16 v6, 0x27

    if-eq v2, v6, :cond_b

    const/16 v6, 0x2a

    if-eq v2, v6, :cond_a

    const/16 v6, 0x2b

    if-eq v2, v6, :cond_9

    const/16 v6, 0x5f

    if-eq v2, v6, :cond_8

    const/16 v6, 0x60

    if-eq v2, v6, :cond_7

    packed-switch v2, :pswitch_data_0

    .line 144
    goto/16 :goto_0

    .line 141
    :pswitch_0
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/16 v0, 0x15

    goto/16 :goto_1

    .line 140
    :pswitch_1
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/16 v0, 0x14

    goto/16 :goto_1

    .line 139
    :pswitch_2
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/16 v0, 0x13

    goto/16 :goto_1

    .line 138
    :pswitch_3
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/16 v0, 0x12

    goto/16 :goto_1

    .line 137
    :pswitch_4
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/16 v0, 0x11

    goto/16 :goto_1

    .line 136
    :pswitch_5
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/16 v0, 0x10

    goto :goto_1

    .line 135
    :pswitch_6
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/16 v0, 0xf

    goto :goto_1

    .line 134
    :pswitch_7
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/16 v0, 0xe

    goto :goto_1

    .line 133
    :pswitch_8
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/16 v0, 0xd

    goto :goto_1

    .line 143
    :cond_7
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/16 v0, 0xa

    goto :goto_1

    .line 142
    :cond_8
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/4 v0, 0x4

    goto :goto_1

    .line 132
    :cond_9
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/16 v0, 0x8

    goto :goto_1

    .line 131
    :cond_a
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/4 v0, 0x2

    goto :goto_1

    .line 130
    :cond_b
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/16 v0, 0xc

    goto :goto_1

    .line 129
    :cond_c
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v7, :cond_d

    const/4 v0, 0x6

    goto :goto_1

    .line 154
    :cond_d
    :goto_0
    if-eqz v1, :cond_e

    if-eq v1, p1, :cond_e

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    const/4 v0, 0x0

    .line 158
    .end local v1    # "X":Ljava/lang/String;
    :cond_e
    :goto_1
    if-nez v0, :cond_f

    invoke-super {p0, p1}, Lcom/trendmicro/hippo/BaseFunction;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v1

    return v1

    .line 161
    :cond_f
    if-eq v0, v4, :cond_13

    if-eq v0, v5, :cond_12

    const/4 v1, 0x3

    if-eq v0, v1, :cond_11

    if-eq v0, v3, :cond_10

    .line 175
    const/4 v1, 0x5

    .local v1, "attr":I
    goto :goto_2

    .line 172
    .end local v1    # "attr":I
    :cond_10
    iget v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->underscoreAttr:I

    .line 173
    .restart local v1    # "attr":I
    goto :goto_2

    .line 169
    .end local v1    # "attr":I
    :cond_11
    iget v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->inputAttr:I

    .line 170
    .restart local v1    # "attr":I
    goto :goto_2

    .line 166
    .end local v1    # "attr":I
    :cond_12
    iget v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->starAttr:I

    .line 167
    .restart local v1    # "attr":I
    goto :goto_2

    .line 163
    .end local v1    # "attr":I
    :cond_13
    iget v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->multilineAttr:I

    .line 164
    .restart local v1    # "attr":I
    nop

    .line 179
    :goto_2
    invoke-super {p0}, Lcom/trendmicro/hippo/BaseFunction;->getMaxInstanceId()I

    move-result v2

    add-int/2addr v2, v0

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->instanceIdInfo(II)I

    move-result v2

    return v2

    :pswitch_data_0
    .packed-switch 0x31
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getArity()I
    .locals 1

    .line 50
    const/4 v0, 0x2

    return v0
.end method

.method public getFunctionName()Ljava/lang/String;
    .locals 1

    .line 40
    const-string v0, "RegExp"

    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 6
    .param p1, "id"    # I

    .line 187
    invoke-super {p0}, Lcom/trendmicro/hippo/BaseFunction;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    .line 188
    .local v0, "shifted":I
    const/4 v1, 0x1

    if-gt v1, v0, :cond_0

    const/16 v2, 0x15

    if-gt v0, v2, :cond_0

    .line 189
    packed-switch v0, :pswitch_data_0

    .line 209
    add-int/lit8 v2, v0, -0xc

    sub-int/2addr v2, v1

    .line 210
    .local v2, "substring_number":I
    const/4 v3, 0x2

    new-array v3, v3, [C

    const/4 v4, 0x0

    const/16 v5, 0x24

    aput-char v5, v3, v4

    add-int/lit8 v4, v2, 0x31

    int-to-char v4, v4

    aput-char v4, v3, v1

    move-object v1, v3

    .line 211
    .local v1, "buf":[C
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1}, Ljava/lang/String;-><init>([C)V

    return-object v3

    .line 206
    .end local v1    # "buf":[C
    .end local v2    # "substring_number":I
    :pswitch_0
    const-string v1, "$\'"

    return-object v1

    .line 205
    :pswitch_1
    const-string v1, "rightContext"

    return-object v1

    .line 203
    :pswitch_2
    const-string v1, "$`"

    return-object v1

    .line 202
    :pswitch_3
    const-string v1, "leftContext"

    return-object v1

    .line 200
    :pswitch_4
    const-string v1, "$+"

    return-object v1

    .line 199
    :pswitch_5
    const-string v1, "lastParen"

    return-object v1

    .line 197
    :pswitch_6
    const-string v1, "$&"

    return-object v1

    .line 196
    :pswitch_7
    const-string v1, "lastMatch"

    return-object v1

    .line 194
    :pswitch_8
    const-string v1, "$_"

    return-object v1

    .line 193
    :pswitch_9
    const-string v1, "input"

    return-object v1

    .line 191
    :pswitch_a
    const-string v1, "$*"

    return-object v1

    .line 190
    :pswitch_b
    const-string v1, "multiline"

    return-object v1

    .line 213
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/BaseFunction;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v1

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 4
    .param p1, "id"    # I

    .line 219
    invoke-super {p0}, Lcom/trendmicro/hippo/BaseFunction;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    .line 220
    .local v0, "shifted":I
    const/4 v1, 0x1

    if-gt v1, v0, :cond_1

    const/16 v2, 0x15

    if-gt v0, v2, :cond_1

    .line 221
    invoke-static {}, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->getImpl()Lcom/trendmicro/hippo/regexp/RegExpImpl;

    move-result-object v2

    .line 223
    .local v2, "impl":Lcom/trendmicro/hippo/regexp/RegExpImpl;
    packed-switch v0, :pswitch_data_0

    .line 256
    add-int/lit8 v3, v0, -0xc

    sub-int/2addr v3, v1

    .line 257
    .local v3, "substring_number":I
    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->getParenSubString(I)Lcom/trendmicro/hippo/regexp/SubString;

    move-result-object v1

    .line 258
    .local v1, "stringResult":Ljava/lang/Object;
    goto :goto_0

    .line 250
    .end local v1    # "stringResult":Ljava/lang/Object;
    .end local v3    # "substring_number":I
    :pswitch_0
    iget-object v1, v2, Lcom/trendmicro/hippo/regexp/RegExpImpl;->rightContext:Lcom/trendmicro/hippo/regexp/SubString;

    .line 251
    .restart local v1    # "stringResult":Ljava/lang/Object;
    goto :goto_0

    .line 245
    .end local v1    # "stringResult":Ljava/lang/Object;
    :pswitch_1
    iget-object v1, v2, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    .line 246
    .restart local v1    # "stringResult":Ljava/lang/Object;
    goto :goto_0

    .line 240
    .end local v1    # "stringResult":Ljava/lang/Object;
    :pswitch_2
    iget-object v1, v2, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastParen:Lcom/trendmicro/hippo/regexp/SubString;

    .line 241
    .restart local v1    # "stringResult":Ljava/lang/Object;
    goto :goto_0

    .line 235
    .end local v1    # "stringResult":Ljava/lang/Object;
    :pswitch_3
    iget-object v1, v2, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    .line 236
    .restart local v1    # "stringResult":Ljava/lang/Object;
    goto :goto_0

    .line 230
    .end local v1    # "stringResult":Ljava/lang/Object;
    :pswitch_4
    iget-object v1, v2, Lcom/trendmicro/hippo/regexp/RegExpImpl;->input:Ljava/lang/String;

    .line 231
    .restart local v1    # "stringResult":Ljava/lang/Object;
    goto :goto_0

    .line 226
    .end local v1    # "stringResult":Ljava/lang/Object;
    :pswitch_5
    iget-boolean v1, v2, Lcom/trendmicro/hippo/regexp/RegExpImpl;->multiline:Z

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 261
    .restart local v1    # "stringResult":Ljava/lang/Object;
    :goto_0
    if-nez v1, :cond_0

    const-string v3, ""

    goto :goto_1

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_1
    return-object v3

    .line 263
    .end local v1    # "stringResult":Ljava/lang/Object;
    .end local v2    # "impl":Lcom/trendmicro/hippo/regexp/RegExpImpl;
    :cond_1
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/BaseFunction;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getLength()I
    .locals 1

    .line 45
    const/4 v0, 0x2

    return v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 119
    invoke-super {p0}, Lcom/trendmicro/hippo/BaseFunction;->getMaxInstanceId()I

    move-result v0

    add-int/lit8 v0, v0, 0x15

    return v0
.end method

.method protected setInstanceIdAttributes(II)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .line 301
    invoke-super {p0}, Lcom/trendmicro/hippo/BaseFunction;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    .line 302
    .local v0, "shifted":I
    packed-switch v0, :pswitch_data_0

    .line 327
    add-int/lit8 v1, v0, -0xc

    add-int/lit8 v1, v1, -0x1

    .line 328
    .local v1, "substring_number":I
    if-ltz v1, :cond_0

    const/16 v2, 0x8

    if-gt v1, v2, :cond_0

    .line 330
    return-void

    .line 325
    .end local v1    # "substring_number":I
    :pswitch_0
    return-void

    .line 313
    :pswitch_1
    iput p2, p0, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->underscoreAttr:I

    .line 314
    return-void

    .line 310
    :pswitch_2
    iput p2, p0, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->inputAttr:I

    .line 311
    return-void

    .line 307
    :pswitch_3
    iput p2, p0, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->starAttr:I

    .line 308
    return-void

    .line 304
    :pswitch_4
    iput p2, p0, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->multilineAttr:I

    .line 305
    return-void

    .line 333
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/BaseFunction;->setInstanceIdAttributes(II)V

    .line 334
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 269
    invoke-super {p0}, Lcom/trendmicro/hippo/BaseFunction;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    .line 270
    .local v0, "shifted":I
    packed-switch v0, :pswitch_data_0

    .line 291
    add-int/lit8 v1, v0, -0xc

    add-int/lit8 v1, v1, -0x1

    .line 292
    .local v1, "substring_number":I
    if-ltz v1, :cond_0

    const/16 v2, 0x8

    if-gt v1, v2, :cond_0

    .line 293
    return-void

    .line 289
    .end local v1    # "substring_number":I
    :pswitch_0
    return-void

    .line 278
    :pswitch_1
    invoke-static {}, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->getImpl()Lcom/trendmicro/hippo/regexp/RegExpImpl;

    move-result-object v1

    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->input:Ljava/lang/String;

    .line 279
    return-void

    .line 273
    :pswitch_2
    invoke-static {}, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->getImpl()Lcom/trendmicro/hippo/regexp/RegExpImpl;

    move-result-object v1

    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v2

    iput-boolean v2, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->multiline:Z

    .line 274
    return-void

    .line 296
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/BaseFunction;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 297
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
