Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BDF053511CA
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Apr 2021 11:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617268740;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H/QEd2obX76a2CRmTRPkElskyTLqEnaVLZqUEFhEtpQ=;
	b=LX8WHByJkrn7/JswCavO1Y3TFPryuezp4q+Nll3nJRxMk9wcRKFWD4DSFVGcl92HnRzCNd
	9LrKgfYb8Jyqly8n/bQJVNJ9nmUY9pwWgxVdIopansVh/0TDZpV6tZhLuD53VNLjvjAswQ
	k5XlvP+cVk1A6HYOIM41roiKKmS/iUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-sVitMJ-RPm6dvCOiJgz1BQ-1; Thu, 01 Apr 2021 05:18:58 -0400
X-MC-Unique: sVitMJ-RPm6dvCOiJgz1BQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CD2C1853026;
	Thu,  1 Apr 2021 09:18:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D43A62460;
	Thu,  1 Apr 2021 09:18:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 524481809C83;
	Thu,  1 Apr 2021 09:18:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1319ImgO028075 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 05:18:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8813E614FC; Thu,  1 Apr 2021 09:18:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C165E60CCD;
	Thu,  1 Apr 2021 09:18:47 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  1 Apr 2021 11:18:38 +0200
Message-Id: <20210401091839.2251916-4-agruenba@redhat.com>
In-Reply-To: <20210401091839.2251916-1-agruenba@redhat.com>
References: <20210401091839.2251916-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 3/4] gfs2: Replace gfs2_lblk_to_dblk with
	gfs2_get_extent
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

We don't need two very similar functions for mapping logical blocks to physical
blocks.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 24 ------------------------
 fs/gfs2/bmap.h |  1 -
 fs/gfs2/log.c  |  6 +++++-
 3 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index ac959a99ea81..bad5dc641bbd 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -961,30 +961,6 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
 	goto out;
 }
 
-/**
- * gfs2_lblk_to_dblk - convert logical block to disk block
- * @inode: the inode of the file we're mapping
- * @lblock: the block relative to the start of the file
- * @dblock: the returned dblock, if no error
- *
- * This function maps a single block from a file logical block (relative to
- * the start of the file) to a file system absolute block using iomap.
- *
- * Returns: the absolute file system block, or an error
- */
-int gfs2_lblk_to_dblk(struct inode *inode, u32 lblock, u64 *dblock)
-{
-	struct iomap iomap = { };
-	loff_t pos = (loff_t)lblock << inode->i_blkbits;
-	int ret;
-
-	ret = gfs2_iomap_get(inode, pos, i_blocksize(inode), &iomap);
-	if (ret == 0)
-		*dblock = iomap.addr >> inode->i_blkbits;
-
-	return ret;
-}
-
 static int gfs2_write_lock(struct inode *inode)
 {
 	struct gfs2_inode *ip = GFS2_I(inode);
diff --git a/fs/gfs2/bmap.h b/fs/gfs2/bmap.h
index 67ef7cf7fdac..6676d863faef 100644
--- a/fs/gfs2/bmap.h
+++ b/fs/gfs2/bmap.h
@@ -66,6 +66,5 @@ extern int gfs2_write_alloc_required(struct gfs2_inode *ip, u64 offset,
 extern int gfs2_map_journal_extents(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd);
 extern void gfs2_free_journal_extents(struct gfs2_jdesc *jd);
 extern int __gfs2_punch_hole(struct file *file, loff_t offset, loff_t length);
-extern int gfs2_lblk_to_dblk(struct inode *inode, u32 lblock, u64 *dblock);
 
 #endif /* __BMAP_DOT_H__ */
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 6410281546f9..69ddd9518396 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -859,7 +859,11 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 	if (!list_empty(&jd->extent_list))
 		dblock = gfs2_log_bmap(jd, lblock);
 	else {
-		int ret = gfs2_lblk_to_dblk(jd->jd_inode, lblock, &dblock);
+		unsigned int extlen;
+		int ret;
+
+		extlen = 1;
+		ret = gfs2_get_extent(jd->jd_inode, lblock, &dblock, &extlen);
 		if (gfs2_assert_withdraw(sdp, ret == 0))
 			return;
 	}
-- 
2.26.2

