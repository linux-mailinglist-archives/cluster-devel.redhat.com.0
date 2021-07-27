Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id F35F93D7C4D
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 19:37:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627407446;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tgpKgCfg3K4XMuNm688Mi45wMV2YtR53OmRiwINwIY4=;
	b=dydwl9Y+cYOsREzjVhObAK2np+3ZedNHfh9Bq02NooP4zPv3siGD229FuUcpAa4XqBT8Y4
	oTrBJ1teup9WrN2Ed7E5yiug0SokWRjvRpoGnVMWuBTyASrQVqgeabkyYQufIx8HdwKUdE
	BeLcuozHnPCAcBilDTJB5WcHlBKc5Lg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-PqeznXKvP8COTtKj-nnc3g-1; Tue, 27 Jul 2021 13:37:24 -0400
X-MC-Unique: PqeznXKvP8COTtKj-nnc3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BC58102620C;
	Tue, 27 Jul 2021 17:37:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BC2B19D9D;
	Tue, 27 Jul 2021 17:37:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 597144A707;
	Tue, 27 Jul 2021 17:37:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RHbIoJ022890 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 13:37:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E932319630; Tue, 27 Jul 2021 17:37:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-120.phx2.redhat.com [10.3.112.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7900179B3
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 17:37:18 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Jul 2021 12:37:08 -0500
Message-Id: <20210727173709.210711-15-rpeterso@redhat.com>
In-Reply-To: <20210727173709.210711-1-rpeterso@redhat.com>
References: <20210727173709.210711-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 14/15] fs: Move notify_change
	permission checks into may_setattr
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Andreas Gruenbacher <agruenba@redhat.com>

Move the permission checks in notify_change into a separate function to
make them available to filesystems.

When notify_change is called, the vfs performs those checks before
calling into iop->setattr.  However, a filesystem like gfs2 can only
lock and revalidate the inode inside ->setattr, and it must then repeat
those checks to err on the safe side.

It would be nice to get rid of the double checking, but moving the
permission check into iop->setattr altogether isn't really an option.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/attr.c          | 50 ++++++++++++++++++++++++++++------------------
 include/linux/fs.h |  2 ++
 2 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index 87ef39db1c34..473d21b3a86d 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -249,6 +249,34 @@ void setattr_copy(struct user_namespace *mnt_userns, struct inode *inode,
 }
 EXPORT_SYMBOL(setattr_copy);
 
+int may_setattr(struct user_namespace *mnt_userns, struct inode *inode,
+		unsigned int ia_valid)
+{
+	int error;
+
+	if (ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID | ATTR_TIMES_SET)) {
+		if (IS_IMMUTABLE(inode) || IS_APPEND(inode))
+			return -EPERM;
+	}
+
+	/*
+	 * If utimes(2) and friends are called with times == NULL (or both
+	 * times are UTIME_NOW), then we need to check for write permission
+	 */
+	if (ia_valid & ATTR_TOUCH) {
+		if (IS_IMMUTABLE(inode))
+			return -EPERM;
+
+		if (!inode_owner_or_capable(mnt_userns, inode)) {
+			error = inode_permission(mnt_userns, inode, MAY_WRITE);
+			if (error)
+				return error;
+		}
+	}
+	return 0;
+}
+EXPORT_SYMBOL(may_setattr);
+
 /**
  * notify_change - modify attributes of a filesytem object
  * @mnt_userns:	user namespace of the mount the inode was found from
@@ -290,25 +318,9 @@ int notify_change(struct user_namespace *mnt_userns, struct dentry *dentry,
 
 	WARN_ON_ONCE(!inode_is_locked(inode));
 
-	if (ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID | ATTR_TIMES_SET)) {
-		if (IS_IMMUTABLE(inode) || IS_APPEND(inode))
-			return -EPERM;
-	}
-
-	/*
-	 * If utimes(2) and friends are called with times == NULL (or both
-	 * times are UTIME_NOW), then we need to check for write permission
-	 */
-	if (ia_valid & ATTR_TOUCH) {
-		if (IS_IMMUTABLE(inode))
-			return -EPERM;
-
-		if (!inode_owner_or_capable(mnt_userns, inode)) {
-			error = inode_permission(mnt_userns, inode, MAY_WRITE);
-			if (error)
-				return error;
-		}
-	}
+	error = may_setattr(mnt_userns, inode, ia_valid);
+	if (error)
+		return error;
 
 	if ((ia_valid & ATTR_MODE)) {
 		umode_t amode = attr->ia_mode;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 640574294216..50192964bf6b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3469,6 +3469,8 @@ extern int buffer_migrate_page_norefs(struct address_space *,
 #define buffer_migrate_page_norefs NULL
 #endif
 
+int may_setattr(struct user_namespace *mnt_userns, struct inode *inode,
+		unsigned int ia_valid);
 int setattr_prepare(struct user_namespace *, struct dentry *, struct iattr *);
 extern int inode_newsize_ok(const struct inode *, loff_t offset);
 void setattr_copy(struct user_namespace *, struct inode *inode,
-- 
2.31.1

