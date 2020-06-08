Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 266D41F1CAD
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632151;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=94EchcLShvTObD2RfCJBnCkIaFd2s6MdyY+YlMc3kCM=;
	b=K5LXAEg2dlxL7dDcdD4iZjdFLKDjjmccv/9FnbDyOm9j40HEbLp9QWWkjEkU1oQcwBf+8z
	MgjsQhnB83eZWxUvJopFr98IxfifhNdfZ+tqthMshj9pGG4mOjvMkB+hhGCS3r/442LIg+
	ga++dNpGZi2Q+TMe/rXLc/sqWxBE69A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-f-q7oGb6MaKakJAOrd6EZQ-1; Mon, 08 Jun 2020 12:02:29 -0400
X-MC-Unique: f-q7oGb6MaKakJAOrd6EZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B7E4EC1A5;
	Mon,  8 Jun 2020 16:02:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 296EE1010404;
	Mon,  8 Jun 2020 16:02:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1647EB348B;
	Mon,  8 Jun 2020 16:02:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G0oGm011624 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:00:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 45DF4648DB; Mon,  8 Jun 2020 16:00:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49F4D1CA;
	Mon,  8 Jun 2020 16:00:49 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:23 +0200
Message-Id: <20200608160039.549204-5-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 04/20] gfs2: Only do glock put in
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

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
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
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
-- 
2.26.2

