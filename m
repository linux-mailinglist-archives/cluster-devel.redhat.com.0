Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 566124297AE
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633981240;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vosAKbATtC0PLQmGNT2ZnRe34sy0G6hfmqxGL9nK9Go=;
	b=ISgIUiK8W6pSUjUfvgTX9BRiKrqRZb4ZhDoLP6EFng1tWCt1359nR2qSuZ7FvqZZZPDCYq
	7RVENDVTJMqgvfl8jaDH5W9XYKQU+sMwV19BmOkQMeGPrgp562wsTDHXSa5YEQH25yR1M1
	UqCCuoI+yU0+v0eRzMTL+aWUoCx6aJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-8b9N5_nAOIiI-HtkPJ4GrQ-1; Mon, 11 Oct 2021 15:40:36 -0400
X-MC-Unique: 8b9N5_nAOIiI-HtkPJ4GrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87E43CF981;
	Mon, 11 Oct 2021 19:40:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD1F60C82;
	Mon, 11 Oct 2021 19:40:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26B711809C84;
	Mon, 11 Oct 2021 19:40:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BJeTDM028757 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 15:40:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02BC026DE2; Mon, 11 Oct 2021 19:40:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-2.phx2.redhat.com [10.3.114.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C692226E40
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 19:40:28 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 11 Oct 2021 14:39:56 -0500
Message-Id: <20211011194008.50097-2-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-1-rpeterso@redhat.com>
References: <20211011194008.50097-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v3 PATCH 01/13] gfs2: Allow append and
	immutable bits to coexist
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, function do_gfs2_set_flags checked if the append
and immutable flags were being set while already set. If so, error -EPERM
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
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 84ec053d43b4..89ef6c2dc495 100644
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

