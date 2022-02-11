Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4524B296E
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Feb 2022 16:52:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644594725;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pQ2mdB7oTwaoZuERzEbfMUZqOMWk74jRxwI3W1sefI0=;
	b=cr+RbEl7syqDFMQl8IcsoQBwtMwYbVL/FistwU6IRfM9D4ji3hizfYCEmKwiw4y5BT6aFl
	+rwdhnhEeWqldeoxyfkfKisWK6rfjaiPIHZ9Yw/Ofser8c605ZNMLACGMlzTTN7y97DbQr
	VvNdu0iZKPMFEskvSR4hWb/6FbJcguU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-Q_mn_sR_MteaV77F2LOmrw-1; Fri, 11 Feb 2022 10:51:57 -0500
X-MC-Unique: Q_mn_sR_MteaV77F2LOmrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 113FC83DD20;
	Fri, 11 Feb 2022 15:51:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 015B87CAE1;
	Fri, 11 Feb 2022 15:51:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDA161809CB8;
	Fri, 11 Feb 2022 15:51:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21BFpqWn029860 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Feb 2022 10:51:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 970322B593; Fri, 11 Feb 2022 15:51:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (unknown [10.2.16.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E3D22BCC5
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 15:51:52 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 11 Feb 2022 10:51:51 -0500
Message-Id: <20220211155151.108646-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Move iomap_get before taking
	sd_quota_mutex
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

Before this patch quota function bh_get called gfs2_iomap_get after it
had locked the sd_quota_mutex. That's a problem because that holds the
i_rw_mutex, and that lock order is different from other code that
locks i_rw_mutex first, then the sd_quota_mutex:

punch_hole
   sweep_bh_for_rgrps
      down_write(&ip->i_rw_mutex)
      ...
      __gfs2_free_blocks(ip, rgd, bstart, (u32)blen, meta);
   gfs2_quota_change
      do_qc
         lock(&sdp->sd_quota_mutex);

This patch changes the order of events to this:

1. If qd->qd_bh_count is zero (we're likely but not guaranteed to be
   the first qd holder) it calls gfs2_iomap_get to determine which
   block should be read.
2. Lock the sd_quota_mutex
3. If qd->qd_bh_count is still zero (now it's guaranteed) it reads
   in the necessary block.
4. If qd_bh_count is no longer zero (because it wasn't holding the
   mutex) the iomap_get was wasted time, so return.

The case in which it wastes time (step 4) should be very rare and
only occur when sd_quota_mutex is contended. But this avoids the ABBA
deadlock.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/quota.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 91bc3affe460..fe98b2a6c0b6 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -368,9 +368,23 @@ static int bh_get(struct gfs2_quota_data *qd)
 	struct gfs2_inode *ip = GFS2_I(sdp->sd_qc_inode);
 	unsigned int block, offset;
 	struct buffer_head *bh;
-	struct iomap iomap = { };
+	struct iomap iomap = { .addr = IOMAP_NULL_ADDR, };
 	int error;
 
+	block = qd->qd_slot / sdp->sd_qc_per_block;
+	offset = qd->qd_slot % sdp->sd_qc_per_block;
+
+retry:
+	if (!qd->qd_bh_count) {
+		error = gfs2_iomap_get(sdp->sd_qc_inode,
+				 (loff_t)block << sdp->sd_qc_inode->i_blkbits,
+				       sdp->sd_sb.sb_bsize, &iomap);
+		if (error)
+			return error;
+		if (iomap.addr == IOMAP_NULL_ADDR)
+			return -ENOENT;
+	}
+
 	mutex_lock(&sdp->sd_quota_mutex);
 
 	if (qd->qd_bh_count++) {
@@ -378,17 +392,18 @@ static int bh_get(struct gfs2_quota_data *qd)
 		return 0;
 	}
 
-	block = qd->qd_slot / sdp->sd_qc_per_block;
-	offset = qd->qd_slot % sdp->sd_qc_per_block;
-
-	error = gfs2_iomap_get(sdp->sd_qc_inode,
-			       (loff_t)block << sdp->sd_qc_inode->i_blkbits,
-			       sdp->sd_sb.sb_bsize, &iomap);
-	if (error)
-		goto fail;
-	if (iomap.addr == IOMAP_NULL_ADDR) {
-		error = -ENOENT;
-		goto fail;
+	/*
+	 * Make sure we called iomap_get. If qd_bh_count was non-zero at
+	 * the start of the function, but was changed to 0 (by someone else's
+	 * decrement) and we discover it after we acquired the mutex, we will
+	 * have skipped the call to gfs2_iomap_get() and therefore don't know
+	 * the block number we need to read. In that case we need to start
+	 * over to get the block number.
+	 */
+	if (unlikely(iomap.addr == IOMAP_NULL_ADDR)) {
+		qd->qd_bh_count--;
+		mutex_unlock(&sdp->sd_quota_mutex);
+		goto retry;
 	}
 
 	error = gfs2_meta_read(ip->i_gl, iomap.addr >> sdp->sd_qc_inode->i_blkbits,
-- 
2.34.1

