Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E484B296D
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Feb 2022 16:51:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644594673;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BKt4+ADXJt267CSWvFd+2vdKatebDOtRxDbe1hFEvos=;
	b=LgzmKODBtQ3Ib7Lq1Gf8fDJd8K4vrBOJvxHZT+nJZb4j6UcLmRSpqXJGil+oosGc0oRCCp
	M8zThZS4Hl53A+Jp7r3p9D/p5pCcmuzawpzpP/ITA6fK+NzGHfFLpo9X+o93nN+4Y6nBwJ
	uppFtW0wVMuX7abDaLut4qtOaym4L9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-iIZCIt2PPYy0l2AAbaJNjg-1; Fri, 11 Feb 2022 10:51:12 -0500
X-MC-Unique: iIZCIt2PPYy0l2AAbaJNjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E437363A6;
	Fri, 11 Feb 2022 15:51:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09B4C1059A6D;
	Fri, 11 Feb 2022 15:51:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E05C84BB7C;
	Fri, 11 Feb 2022 15:51:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21BFp5Q8029793 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Feb 2022 10:51:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BF05D105B21B; Fri, 11 Feb 2022 15:51:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (unknown [10.2.16.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76D121059A6D
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 15:50:37 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 11 Feb 2022 10:50:36 -0500
Message-Id: <20220211155036.108314-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Convert function bh_get to use iomap
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, function bh_get used block_map to figure out the
block it needed to read in from the quota_change file. This patch
changes it to use iomap directly to make it more efficient.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/quota.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index dc77080a82bb..91bc3affe460 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -368,8 +368,8 @@ static int bh_get(struct gfs2_quota_data *qd)
 	struct gfs2_inode *ip = GFS2_I(sdp->sd_qc_inode);
 	unsigned int block, offset;
 	struct buffer_head *bh;
+	struct iomap iomap = { };
 	int error;
-	struct buffer_head bh_map = { .b_state = 0, .b_blocknr = 0 };
 
 	mutex_lock(&sdp->sd_quota_mutex);
 
@@ -381,11 +381,18 @@ static int bh_get(struct gfs2_quota_data *qd)
 	block = qd->qd_slot / sdp->sd_qc_per_block;
 	offset = qd->qd_slot % sdp->sd_qc_per_block;
 
-	bh_map.b_size = BIT(ip->i_inode.i_blkbits);
-	error = gfs2_block_map(&ip->i_inode, block, &bh_map, 0);
+	error = gfs2_iomap_get(sdp->sd_qc_inode,
+			       (loff_t)block << sdp->sd_qc_inode->i_blkbits,
+			       sdp->sd_sb.sb_bsize, &iomap);
 	if (error)
 		goto fail;
-	error = gfs2_meta_read(ip->i_gl, bh_map.b_blocknr, DIO_WAIT, 0, &bh);
+	if (iomap.addr == IOMAP_NULL_ADDR) {
+		error = -ENOENT;
+		goto fail;
+	}
+
+	error = gfs2_meta_read(ip->i_gl, iomap.addr >> sdp->sd_qc_inode->i_blkbits,
+			       DIO_WAIT, 0, &bh);
 	if (error)
 		goto fail;
 	error = -EIO;
-- 
2.34.1

