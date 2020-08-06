Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBB723DADF
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721126;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/vsVV6yUvIJjcUmkKq0MMV1Cm77DpUX30Qo1ACkJkzA=;
	b=KEWDlAnCpWH4h+6ybHqOo06JvG6xvQUXZTPxW70FgVVDOC/w6RG3x4cK2Xe1CSs2JM/Rjy
	6egC3VxxEMRfsESUk029A6IdzCqgcfc56fM0/Y/ayfFcO9j81itOdaFnVPXkWJSbm+6r8+
	NRXU4UzmQ4arbxi6YyotM+nWw3tfPAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-H32syAS4O0i05hXKSz9F_g-1; Thu, 06 Aug 2020 09:38:44 -0400
X-MC-Unique: H32syAS4O0i05hXKSz9F_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 395E0101C8A7;
	Thu,  6 Aug 2020 13:38:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 272591002393;
	Thu,  6 Aug 2020 13:38:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1515396938;
	Thu,  6 Aug 2020 13:38:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076Dcdi4030857 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D1C260C47; Thu,  6 Aug 2020 13:38:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D0866111F
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:38 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:53 +0100
Message-Id: <20200806133807.111280-19-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 18/32] savemeta: Simplify di_save_len()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

We only need to consider 2 or 3 dinode fields to decide how much of a
dinode block needs to be saved, so ditch the ..._inode_get() calls
and just look at the relevant fields. Also accept a char * instead of a
gfs2_buffer_head because that's all we need now.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 41 +++++++++++++++--------------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 0c541553..249b49af 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -296,36 +296,25 @@ static int block_is_systemfile(uint64_t blk)
 		block_is_per_node(blk) || block_is_in_per_node(blk);
 }
 
-static size_t di_save_len(struct gfs2_buffer_head *bh, uint64_t owner)
+static size_t di_save_len(const char *buf, uint64_t owner)
 {
-	struct gfs2_inode *inode;
-	struct gfs2_dinode *dn;
-	size_t len;
-
-	if (sbd.gfs1)
-		inode = lgfs2_gfs_inode_get(&sbd, bh->b_data);
-	else
-		inode = lgfs2_inode_get(&sbd, bh);
+	const struct gfs2_dinode *dn;
+	uint16_t di_height;
+	uint32_t di_mode;
+	int gfs1dir;
 
-	if (inode == NULL) {
-		fprintf(stderr, "Error reading inode at %"PRIu64": %s\n",
-		        bh->b_blocknr, strerror(errno));
-		return 0; /* Skip the block */
-	}
-	dn = &inode->i_di;
-	len = sizeof(struct gfs2_dinode);
+	dn = (void *)buf;
+	di_mode = be32_to_cpu(dn->di_mode);
+	di_height = be16_to_cpu(dn->di_height);
+	/* __pad1 is di_type in gfs1 */
+	gfs1dir = sbd.gfs1 && (be16_to_cpu(dn->__pad1) == GFS_FILE_DIR);
 
 	/* Do not save (user) data from the inode block unless they are
 	   indirect pointers, dirents, symlinks or fs internal data */
-	if (dn->di_height != 0 ||
-	    S_ISDIR(dn->di_mode) ||
-	    S_ISLNK(dn->di_mode) ||
-	    (sbd.gfs1 && dn->__pad1 == GFS_FILE_DIR) ||
-	    block_is_systemfile(owner))
-		len = sbd.bsize;
-
-	inode_put(&inode);
-	return len;
+	if (di_height > 0 || S_ISDIR(di_mode) || S_ISLNK(di_mode) || gfs1dir
+	    || block_is_systemfile(owner))
+		return sbd.bsize;
+	return sizeof(struct gfs2_dinode);
 }
 
 /*
@@ -366,7 +355,7 @@ static int get_gfs_struct_info(struct gfs2_buffer_head *lbh, uint64_t owner,
 		*gstruct_len = sbd.bsize;
 		break;
 	case GFS2_METATYPE_DI:   /* 4 (disk inode) */
-		*gstruct_len = di_save_len(lbh, owner);
+		*gstruct_len = di_save_len(lbh->b_data, owner);
 		break;
 	case GFS2_METATYPE_IN:   /* 5 (indir inode blklst) */
 		*gstruct_len = sbd.bsize; /*sizeof(struct gfs_indirect);*/
-- 
2.26.2

