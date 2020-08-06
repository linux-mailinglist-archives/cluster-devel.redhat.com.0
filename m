Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CC61C23DAEB
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:39:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721144;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S0hRWbgGWcTVFIuYkYFUuX6ySZ53gGOg2aB/4U0ydVk=;
	b=GE1RjAvbDDRGn0gZyjmYaeCqJf1vdSoZHVGKtmK5CVW9z56MzzrPZT+CgZSR4nqgFuwFrv
	80JUE9hfsOE+YP6ZnKjdQyf5OGOakDtvUFJpLs0GtGAYyBlipMMld+GwMUqcsozV1AGI1d
	Muaa3xs0re292BYBdh2kI1UNQGVVVwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-YertSA9oNByQjxAAkgvzgw-1; Thu, 06 Aug 2020 09:39:03 -0400
X-MC-Unique: YertSA9oNByQjxAAkgvzgw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7F6A1093316;
	Thu,  6 Aug 2020 13:39:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B83E45DA84;
	Thu,  6 Aug 2020 13:39:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5ED596939;
	Thu,  6 Aug 2020 13:39:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076Dcv0f031026 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EEF6860C47; Thu,  6 Aug 2020 13:38:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B42360BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:56 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:38:04 +0100
Message-Id: <20200806133807.111280-30-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 29/32] savemeta: Remove some unnecessary
	reads from save_inode_data()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

We've already read the inode block so there's no need to do it again,
and we shouldn't be reading the xattr block twice.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index ea09d2bf..272f796c 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -808,9 +808,7 @@ static void save_leaf_blocks(struct metafd *mfd, struct block_range_queue *q)
 static void save_inode_data(struct metafd *mfd, char *ibuf, uint64_t iblk)
 {
 	struct block_range_queue indq[GFS2_MAX_META_HEIGHT] = {{NULL}};
-	struct gfs2_buffer_head *metabh;
 	uint32_t height;
-	struct gfs2_inode *inode;
 	struct gfs2_dinode _di = {0};
 	int is_exhash;
 
@@ -858,38 +856,23 @@ static void save_inode_data(struct metafd *mfd, char *ibuf, uint64_t iblk)
 	}
 	if (is_exhash)
 		save_leaf_blocks(mfd, &indq[height - 1]);
-	metabh = bread(&sbd, iblk);
-	if (sbd.gfs1) {
-		inode = lgfs2_gfs_inode_get(&sbd, metabh->b_data);
-	} else {
-		inode = lgfs2_inode_get(&sbd, metabh);
-	}
-	if (inode == NULL) {
-		perror("Failed to read inode");
-		exit(-1);
-	}
-	if (inode->i_di.di_eattr) { /* if this inode has extended attributes */
-		struct gfs2_buffer_head *lbh;
+	if (_di.di_eattr) { /* if this inode has extended attributes */
 		size_t blklen;
 		uint64_t blk;
 		int mhtype;
 		char *buf;
 
-		blk = inode->i_di.di_eattr;
-		lbh = bread(&sbd, blk);
+		blk = _di.di_eattr;
 		buf = check_read_block(sbd.device_fd, blk, iblk, &mhtype, &blklen);
 		if (buf != NULL) {
 			save_buf(mfd, buf, blk, blklen);
+			if (mhtype == GFS2_METATYPE_EA)
+				save_ea_block(mfd, buf, iblk);
+			else if (mhtype == GFS2_METATYPE_IN)
+				save_indirect_blocks(mfd, buf, iblk, NULL, sizeof(_di.di_header));
 			free(buf);
 		}
-		if (mhtype == GFS2_METATYPE_EA)
-			save_ea_block(mfd, lbh->b_data, iblk);
-		else if (mhtype == GFS2_METATYPE_IN)
-			save_indirect_blocks(mfd, lbh->b_data, iblk, NULL, sizeof(di.di_header));
-		brelse(lbh);
 	}
-	inode_put(&inode);
-	brelse(metabh);
 }
 
 static void get_journal_inode_blocks(void)
-- 
2.26.2

