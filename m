Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 37890A630D
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Sep 2019 09:49:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1BBB5AFD9;
	Tue,  3 Sep 2019 07:49:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A17B60606;
	Tue,  3 Sep 2019 07:49:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71A171802216;
	Tue,  3 Sep 2019 07:49:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x837niZM027893 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 03:49:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC26A5D704; Tue,  3 Sep 2019 07:49:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-227.brq.redhat.com [10.40.204.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E118E5D6C8;
	Tue,  3 Sep 2019 07:49:41 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  3 Sep 2019 09:49:39 +0200
Message-Id: <20190903074939.28503-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Minor PAGE_SIZE arithmetic cleanups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 03 Sep 2019 07:49:53 +0000 (UTC)

Replace divisions by PAGE_SIZE with shifts by PAGE_SHIFT and similar.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c  | 4 ++--
 fs/gfs2/file.c  | 2 +-
 fs/gfs2/quota.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index f42048cc5454..b9fe975d7625 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -243,7 +243,7 @@ static int gfs2_write_jdata_pagevec(struct address_space *mapping,
 {
 	struct inode *inode = mapping->host;
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
-	unsigned nrblocks = nr_pages * (PAGE_SIZE/inode->i_sb->s_blocksize);
+	unsigned nrblocks = nr_pages * (PAGE_SIZE >> inode->i_blkbits);
 	int i;
 	int ret;
 
@@ -552,7 +552,7 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *buf, loff_t *pos,
                        unsigned size)
 {
 	struct address_space *mapping = ip->i_inode.i_mapping;
-	unsigned long index = *pos / PAGE_SIZE;
+	unsigned long index = *pos >> PAGE_SHIFT;
 	unsigned offset = *pos & (PAGE_SIZE - 1);
 	unsigned copied = 0;
 	unsigned amt;
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 99e2c8cd5eaa..997b326247e2 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1049,7 +1049,7 @@ static long __gfs2_fallocate(struct file *file, int mode, loff_t offset, loff_t
 			rblocks += data_blocks ? data_blocks : 1;
 
 		error = gfs2_trans_begin(sdp, rblocks,
-					 PAGE_SIZE/sdp->sd_sb.sb_bsize);
+					 PAGE_SIZE >> inode->i_blkbits);
 		if (error)
 			goto out_trans_fail;
 
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 69c4b77f127b..f95606f2157a 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -774,7 +774,7 @@ static int gfs2_write_disk_quota(struct gfs2_inode *ip, struct gfs2_quota *qp,
 	nbytes = sizeof(struct gfs2_quota);
 
 	pg_beg = loc >> PAGE_SHIFT;
-	pg_off = loc % PAGE_SIZE;
+	pg_off = loc & (PAGE_SIZE - 1);
 
 	/* If the quota straddles a page boundary, split the write in two */
 	if ((pg_off + nbytes) > PAGE_SIZE) {
-- 
2.20.1

