Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5093A3F7C4B
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Aug 2021 20:36:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629916580;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aWwmhdgJxiqjsFwk9Iw26Z65ZlaezzSXJ2DaaCa0IOM=;
	b=cGyeF2i+OMKF2Q9irSZXq4O0vfdOQo/+WZxXuCdX2vPeBleK8iqL+JmGTP2Iz5rqQPxJtP
	uNcrZ3mh50592QrvgM3qdxxr7mOGJWZG3Kg8ULbCH72x6/Y81QDy3lnokF+bAHgDMPeW9e
	OaNn7/1XczMefayYhDI1jj/OgH1t7/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-rvlgsqk8N-OGFj4dv8fCOg-1; Wed, 25 Aug 2021 14:36:18 -0400
X-MC-Unique: rvlgsqk8N-OGFj4dv8fCOg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A45FE871471;
	Wed, 25 Aug 2021 18:36:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C87B5C1A1;
	Wed, 25 Aug 2021 18:36:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 04B704BB7C;
	Wed, 25 Aug 2021 18:36:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17PIa5Vf014547 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Aug 2021 14:36:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9411477708; Wed, 25 Aug 2021 18:36:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-176.phx2.redhat.com [10.3.114.176])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6348B1B46C
	for <cluster-devel@redhat.com>; Wed, 25 Aug 2021 18:36:00 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 25 Aug 2021 13:36:00 -0500
Message-Id: <20210825183600.175266-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Allow append and immutable bits to
	coexist
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch function do_gfs2_set_flags checked if the append
and immutable flags were being set while already set. If so error -EPERM
was given. There's no reason why these two flags should be mutually
exclusive, and if you set them separately, you will, in essence, set
one while it is already set. For example:

chattr +a /mnt/gfs2/file1
chattr +i /mnt/gfs2/file1

The first command sets the append-only flag. Since they are additive,
the second command sets the immutable flag AND append-only flag,
since they both coexist in i_diskflags. So the second command should
not return an error. This bug caused xfstests generic/545 to fail.

This patch simply removes the invalid checks.
I also eliminated an unused parm from do_gfs2_set_flags.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/file.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index c979562a615a..920549a2c3ef 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -213,11 +213,9 @@ void gfs2_set_inode_flags(struct inode *inode)
  * @inode: The inode
  * @reqflags: The flags to set
  * @mask: Indicates which flags are valid
- * @fsflags: The FS_* inode flags passed in
  *
  */
-static int do_gfs2_set_flags(struct inode *inode, u32 reqflags, u32 mask,
-			     const u32 fsflags)
+static int do_gfs2_set_flags(struct inode *inode, u32 reqflags, u32 mask)
 {
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
@@ -237,10 +235,6 @@ static int do_gfs2_set_flags(struct inode *inode, u32 reqflags, u32 mask,
 		goto out;
 
 	error = -EPERM;
-	if (IS_IMMUTABLE(inode) && (new_flags & GFS2_DIF_IMMUTABLE))
-		goto out;
-	if (IS_APPEND(inode) && (new_flags & GFS2_DIF_APPENDONLY))
-		goto out;
 	if (!IS_IMMUTABLE(inode)) {
 		error = gfs2_permission(&init_user_ns, inode, MAY_WRITE);
 		if (error)
@@ -313,7 +307,7 @@ int gfs2_fileattr_set(struct user_namespace *mnt_userns,
 		mask &= ~(GFS2_DIF_TOPDIR | GFS2_DIF_INHERIT_JDATA);
 	}
 
-	return do_gfs2_set_flags(inode, gfsflags, mask, fsflags);
+	return do_gfs2_set_flags(inode, gfsflags, mask);
 }
 
 static int gfs2_getlabel(struct file *filp, char __user *label)
-- 
2.31.1

