.class Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;
.super Ljava/security/PermissionCollection;
.source "JavaPolicySecurity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ContextPermissions"
.end annotation


# static fields
.field static final serialVersionUID:J = -0x17e3fa1f9ffd0481L


# instance fields
.field _context:Ljava/security/AccessControlContext;

.field _statisPermissions:Ljava/security/PermissionCollection;


# direct methods
.method constructor <init>(Ljava/security/ProtectionDomain;)V
    .locals 1
    .param p1, "staticDomain"    # Ljava/security/ProtectionDomain;

    .line 62
    invoke-direct {p0}, Ljava/security/PermissionCollection;-><init>()V

    .line 63
    invoke-static {}, Ljava/security/AccessController;->getContext()Ljava/security/AccessControlContext;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;->_context:Ljava/security/AccessControlContext;

    .line 64
    if-eqz p1, :cond_0

    .line 65
    invoke-virtual {p1}, Ljava/security/ProtectionDomain;->getPermissions()Ljava/security/PermissionCollection;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;->_statisPermissions:Ljava/security/PermissionCollection;

    .line 67
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;->setReadOnly()V

    .line 68
    return-void
.end method


# virtual methods
.method public add(Ljava/security/Permission;)V
    .locals 2
    .param p1, "permission"    # Ljava/security/Permission;

    .line 72
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "NOT IMPLEMENTED"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public elements()Ljava/util/Enumeration;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration<",
            "Ljava/security/Permission;",
            ">;"
        }
    .end annotation

    .line 93
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions$1;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions$1;-><init>(Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;)V

    return-object v0
.end method

.method public implies(Ljava/security/Permission;)Z
    .locals 2
    .param p1, "permission"    # Ljava/security/Permission;

    .line 77
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;->_statisPermissions:Ljava/security/PermissionCollection;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 78
    invoke-virtual {v0, p1}, Ljava/security/PermissionCollection;->implies(Ljava/security/Permission;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 79
    return v1

    .line 83
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;->_context:Ljava/security/AccessControlContext;

    invoke-virtual {v0, p1}, Ljava/security/AccessControlContext;->checkPermission(Ljava/security/Permission;)V
    :try_end_0
    .catch Ljava/security/AccessControlException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    const/4 v0, 0x1

    return v0

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, "ex":Ljava/security/AccessControlException;
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 104
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    const-string v1, " (context="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;->_context:Ljava/security/AccessControlContext;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 107
    const-string v1, ", static_permitions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;->_statisPermissions:Ljava/security/PermissionCollection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 109
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
