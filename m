Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A44DA1EA6F4
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Jun 2020 17:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591025844;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=IcY7tA7Z5lLsQll8LbLHutWWOCktBAH8oXDwPiMgwpo=;
	b=XGTfXYL1H+A/PspsD3Y7uJ/adCCO37Eu4XtjHb4MZshY8MoNPwkVi+RpGlCh0LYDeiPmLO
	ixyCisv8N5/xTfV0sOP9TA5ZL8q9OVSi8u9UGCuhaUPtbqVKhpzjFcc4Z9aIa968HX+SfY
	ltpro1L4U0Jlv5HBsq5pXZ5nVYzRkq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-Oy0FD1vVNn2pumNo9VUeFA-1; Mon, 01 Jun 2020 11:37:20 -0400
X-MC-Unique: Oy0FD1vVNn2pumNo9VUeFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C000A107BEF5;
	Mon,  1 Jun 2020 15:37:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F47D6116D;
	Mon,  1 Jun 2020 15:37:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55080938FB;
	Mon,  1 Jun 2020 15:37:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051FbCE8029044 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 11:37:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39E1F5D9E2; Mon,  1 Jun 2020 15:37:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 355DE5D9DD
	for <cluster-devel@redhat.com>; Mon,  1 Jun 2020 15:37:09 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69EBE938F2
	for <cluster-devel@redhat.com>; Mon,  1 Jun 2020 15:37:09 +0000 (UTC)
Date: Mon, 1 Jun 2020 11:37:09 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <260121160.30871863.1591025829368.JavaMail.zimbra@redhat.com>
In-Reply-To: <283332483.30871826.1591025812761.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.44, 10.4.195.19]
Thread-Topic: gfs2: Only do glock put in gfs2_create_inode for free inodes
Thread-Index: 7YVlgw0IBPPcFavc0Lmqx/zRFxjoWw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Only do glock put in
 gfs2_create_inode for free inodes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Before this patch, the error path of function gfs2_create_inode would
always calls gfs2_glock_put for the inode glock. That's good for inodes
that are free. But after they've been added to the vfs inodes, errors
will cause the inode to be evicted, and the evict will do the glock
put for us. If we do a glock put again, we can try to free the glock
while there are still references to it, e.g. revokes pending for
the transaction that created it.

This patch adds a check: if (free_vfs_inode) before the put, thus
solving the problem.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 5acd3ce30759..e3a27fd284dd 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -780,7 +780,8 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 fail_free_inode:
 	if (ip->i_gl) {
 		glock_clear_object(ip->i_gl, ip);
-		gfs2_glock_put(ip->i_gl);
+		if (free_vfs_inode) /* else evict will do the put for us */
+			gfs2_glock_put(ip->i_gl);
 	}
 	gfs2_rs_delete(ip, NULL);
 	gfs2_qa_put(ip);

