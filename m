Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 834B32A1099
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:53:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094831;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EyErCuJYlst5DcLrAzwgVEDHCdY8HJJfBsKhTmq48bE=;
	b=cAIjleLQg6DoRxLTDKMB1jmk3RJSaxVNAaT5m/E/Uoy1Qap3B/6C8+MRxgnIyXgKFipPXe
	mwEiVgnkPrEs7VlH+vBLnjF04lCpkY2eTECnk82Yregw7ttqOKyTDwe/3JuBu7mapLyExr
	3ScqWtd125fDbsIUpSNVvd7fKuLUJ4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-AUIXOBbVOQiqfA6sg9xmcw-1; Fri, 30 Oct 2020 17:53:49 -0400
X-MC-Unique: AUIXOBbVOQiqfA6sg9xmcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2DCF108E1CC;
	Fri, 30 Oct 2020 21:53:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E296E60BE2;
	Fri, 30 Oct 2020 21:53:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF89C5811C;
	Fri, 30 Oct 2020 21:53:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULrYF9024286 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:53:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 87CD16115F; Fri, 30 Oct 2020 21:53:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0FF6756AD;
	Fri, 30 Oct 2020 21:53:27 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:52 +0100
Message-Id: <20201030215152.1567790-18-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 17/17] gfs2: Use resource group glock sharing
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Bob Peterson <rpeterso@redhat.com>

This patch takes advantage of the new glock holder sharing feature for
resource groups.  We have already introduced local resource group
locking in a previous patch, so competing accesses of local processes
are already under control.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c  |  2 +-
 fs/gfs2/inode.c |  6 +++---
 fs/gfs2/rgrp.c  | 10 +++++-----
 fs/gfs2/super.c |  3 ++-
 fs/gfs2/xattr.c |  6 ++++--
 5 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 0267aaf3e045..f9e430c4c548 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1542,7 +1542,7 @@ static int sweep_bh_for_rgrps(struct gfs2_inode *ip, struct gfs2_holder *rd_gh,
 				goto out;
 			}
 			ret = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE,
-						 0, rd_gh);
+						 LM_FLAG_NODE_SCOPE, rd_gh);
 			if (ret)
 				goto out;
 
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 6774865f5b5b..8b767ac6cec9 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -1143,7 +1143,7 @@ static int gfs2_unlink(struct inode *dir, struct dentry *dentry)
 	if (!rgd)
 		goto out_inodes;
 
-	gfs2_holder_init(rgd->rd_gl, LM_ST_EXCLUSIVE, 0, ghs + 2);
+	gfs2_holder_init(rgd->rd_gl, LM_ST_EXCLUSIVE, LM_FLAG_NODE_SCOPE, ghs + 2);
 
 
 	error = gfs2_glock_nq(ghs); /* parent */
@@ -1448,8 +1448,8 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 			error = -ENOENT;
 			goto out_gunlock;
 		}
-		error = gfs2_glock_nq_init(nrgd->rd_gl, LM_ST_EXCLUSIVE, 0,
-					   &rd_gh);
+		error = gfs2_glock_nq_init(nrgd->rd_gl, LM_ST_EXCLUSIVE,
+					   LM_FLAG_NODE_SCOPE, &rd_gh);
 		if (error)
 			goto out_gunlock;
 	}
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 9e033cdb8096..a218c0707b5d 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1435,7 +1435,8 @@ int gfs2_fitrim(struct file *filp, void __user *argp)
 
 	while (1) {
 
-		ret = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE, 0, &gh);
+		ret = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE,
+					 LM_FLAG_NODE_SCOPE, &gh);
 		if (ret)
 			goto out;
 
@@ -2048,7 +2049,7 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
 	struct gfs2_rgrpd *begin = NULL;
 	struct gfs2_blkreserv *rs = &ip->i_res;
-	int error = 0, flags = 0;
+	int error = 0, flags = LM_FLAG_NODE_SCOPE;
 	bool rg_locked;
 	u64 last_unlinked = NO_BLOCK;
 	u32 target = ap->target;
@@ -2728,9 +2729,8 @@ void gfs2_rlist_alloc(struct gfs2_rgrp_list *rlist)
 				      sizeof(struct gfs2_holder),
 				      GFP_NOFS | __GFP_NOFAIL);
 	for (x = 0; x < rlist->rl_rgrps; x++)
-		gfs2_holder_init(rlist->rl_rgd[x]->rd_gl,
-				LM_ST_EXCLUSIVE, 0,
-				&rlist->rl_ghs[x]);
+		gfs2_holder_init(rlist->rl_rgd[x]->rd_gl, LM_ST_EXCLUSIVE,
+				 LM_FLAG_NODE_SCOPE, &rlist->rl_ghs[x]);
 }
 
 /**
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index b285192bd6b3..ad4a3670fe24 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1230,7 +1230,8 @@ static int gfs2_dinode_dealloc(struct gfs2_inode *ip)
 		goto out_qs;
 	}
 
-	error = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE, 0, &gh);
+	error = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE,
+				   LM_FLAG_NODE_SCOPE, &gh);
 	if (error)
 		goto out_qs;
 
diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
index 9d7667bc4292..d332bf31f0ae 100644
--- a/fs/gfs2/xattr.c
+++ b/fs/gfs2/xattr.c
@@ -259,7 +259,8 @@ static int ea_dealloc_unstuffed(struct gfs2_inode *ip, struct buffer_head *bh,
 		return -EIO;
 	}
 
-	error = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE, 0, &rg_gh);
+	error = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE,
+				   LM_FLAG_NODE_SCOPE, &rg_gh);
 	if (error)
 		return error;
 
@@ -1385,7 +1386,8 @@ static int ea_dealloc_block(struct gfs2_inode *ip)
 		return -EIO;
 	}
 
-	error = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE, 0, &gh);
+	error = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE,
+				   LM_FLAG_NODE_SCOPE, &gh);
 	if (error)
 		return error;
 
-- 
2.26.2

