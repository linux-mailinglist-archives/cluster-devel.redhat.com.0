Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 285507DDEA
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Aug 2019 16:30:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7FC7481F13;
	Thu,  1 Aug 2019 14:30:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4944600D1;
	Thu,  1 Aug 2019 14:30:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54B2F1800202;
	Thu,  1 Aug 2019 14:30:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x71ETQUZ027191 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Aug 2019 10:29:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 238455D9E5; Thu,  1 Aug 2019 14:29:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DEB05D9CA;
	Thu,  1 Aug 2019 14:29:22 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  1 Aug 2019 16:29:20 +0200
Message-Id: <20190801142920.21097-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Inode dirtying fix
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 01 Aug 2019 14:30:41 +0000 (UTC)

With the recent iomap write page reclaim deadlock fix, it turns out that the
GLF_DIRTY flag isn't always set when it needs to be anymore: previously, this
happened as a side effect of always adding the inode buffer head to the current
transaction with gfs2_trans_add_meta, but this isn't happening consistently
anymore.  Fix by removing an additional unnecessary gfs2_trans_add_meta call
and by setting the GLF_DIRTY flag in gfs2_iomap_end.

(The GLF_DIRTY flag causes inode_go_sync to flush the transaction log when
syncing out the glock of that inode.  When the flag isn't set, inode_go_sync
will skip inodes, including ones with an i_state of I_DIRTY_PAGES, which will
lead to cluster incoherency.)

In addition, in gfs2_iomap_page_done, if the metadata has changed, mark the
inode as I_DIRTY_DATASYNC to have the inode added to the current transaction:
we don't expect metadata to change here, but let's err on the safe side.

Fixes: d0a22a4b03b8 ("gfs2: Fix iomap write page reclaim deadlock");
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 79581b9bdebb..4df26ef2b2b1 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1002,11 +1002,16 @@ static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
 				 unsigned copied, struct page *page,
 				 struct iomap *iomap)
 {
+	struct gfs2_trans *tr = current->journal_info;
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
 	if (page && !gfs2_is_stuffed(ip))
 		gfs2_page_add_databufs(ip, page, offset_in_page(pos), copied);
+
+	if (tr->tr_num_buf_new)
+		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
+
 	gfs2_trans_end(sdp);
 }
 
@@ -1099,8 +1104,6 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 		tr = current->journal_info;
 		if (tr->tr_num_buf_new)
 			__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
-		else
-			gfs2_trans_add_meta(ip->i_gl, mp->mp_bh[0]);
 
 		gfs2_trans_end(sdp);
 	}
@@ -1181,10 +1184,16 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 
 	if (ip->i_qadata && ip->i_qadata->qa_qd_num)
 		gfs2_quota_unlock(ip);
+
+	if (unlikely(!written))
+		goto out_unlock;
+
 	if (iomap->flags & IOMAP_F_SIZE_CHANGED)
 		mark_inode_dirty(inode);
-	gfs2_write_unlock(inode);
+	set_bit(GLF_DIRTY, &ip->i_gl->gl_flags);
 
+out_unlock:
+	gfs2_write_unlock(inode);
 out:
 	return 0;
 }
-- 
2.20.1

