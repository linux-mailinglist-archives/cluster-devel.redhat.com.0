Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 42C1828DE31
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:59:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669551;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CKk7wJYlkac3RzqlieD44yEJsip/68bAnwhBIcblfZE=;
	b=H2OalJ0BWxn/zFVQan1+df+Dn7ev79+2ypE8ey/E481Nk//BzzWp9WniRqXjL7hslKWkAO
	Ze2itSUhoTwgtJQi5jhqaz6qv7VSwsVSyTkRwIbulflGJbKEXfDHUb1HUtnsztyieGU1hh
	ASbyDV6JAoHQ/Ojcit9uaTnynrU02WI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-Cbp7W8ldP1m5Kwpj024aqQ-1; Wed, 14 Oct 2020 05:59:09 -0400
X-MC-Unique: Cbp7W8ldP1m5Kwpj024aqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8496879527;
	Wed, 14 Oct 2020 09:59:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A679319C59;
	Wed, 14 Oct 2020 09:59:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9207C58132;
	Wed, 14 Oct 2020 09:59:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9x39J001510 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:59:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F52076669; Wed, 14 Oct 2020 09:59:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACF7950B44;
	Wed, 14 Oct 2020 09:59:02 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:31 +0200
Message-Id: <20201014095833.1035870-16-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 15/17] gfs2: Use resource group glock sharing
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
index ff64fa85d3ac..ad034370a4f7 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1541,7 +1541,7 @@ static int sweep_bh_for_rgrps(struct gfs2_inode *ip, struct gfs2_holder *rd_gh,
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
index 7eb3465dfbc9..751bd31cfa5d 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1435,7 +1435,8 @@ int gfs2_fitrim(struct file *filp, void __user *argp)
 
 	while (1) {
 
-		ret = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE, 0, &gh);
+		ret = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE,
+					 LM_FLAG_NODE_SCOPE, &gh);
 		if (ret)
 			goto out;
 
@@ -2016,7 +2017,7 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
 	struct gfs2_rgrpd *begin = NULL;
 	struct gfs2_blkreserv *rs = &ip->i_res;
-	int error = 0, flags = 0;
+	int error = 0, flags = LM_FLAG_NODE_SCOPE;
 	bool rg_locked;
 	u64 last_unlinked = NO_BLOCK;
 	u32 target = ap->target;
@@ -2697,9 +2698,8 @@ void gfs2_rlist_alloc(struct gfs2_rgrp_list *rlist)
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
index 3d9daac44e1c..0bff8f8f88a6 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1229,7 +1229,8 @@ static int gfs2_dinode_dealloc(struct gfs2_inode *ip)
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

