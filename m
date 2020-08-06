Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EF4EE23DAE4
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721133;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jQ/ljgKtJnb7o7tUZQ/B6GCq/ae7EVkhKBKjBnsu61M=;
	b=HqgnhpA409VQ5TJB/ZefepmDsSW8L7z2d7d21dCvRS0Ngx48OZb0vDQIQMH3cg3bfzHpDr
	14/jYxj+U9cQK2a469JNef9JxyKcKmYukg3oQdYMtlMIG59s+dUgpuehGbOZ/dQsULrCqS
	M2keg4o6sJjoXm5plEL/2Nyf+d1RENc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-yrdMCzcOOIivieFsN_bTfQ-1; Thu, 06 Aug 2020 09:38:51 -0400
X-MC-Unique: yrdMCzcOOIivieFsN_bTfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E609B1923766;
	Thu,  6 Aug 2020 13:38:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4C647B904;
	Thu,  6 Aug 2020 13:38:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C23241809554;
	Thu,  6 Aug 2020 13:38:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DckMI030923 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C790560BF1; Thu,  6 Aug 2020 13:38:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E81AE70107
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:45 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:57 +0100
Message-Id: <20200806133807.111280-23-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 22/32] savemeta: Remove gfs2_buffer_head
	from save_block()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 47c998c9..8afa8e60 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -572,19 +572,28 @@ static int save_buf(struct metafd *mfd, const char *buf, uint64_t addr, uint64_t
 
 static int save_block(int fd, struct metafd *mfd, uint64_t blk, uint64_t owner, int *blktype)
 {
-	struct gfs2_buffer_head *savebh;
+	char *buf;
 	int err;
 
+	buf = calloc(1, sbd.bsize);
+	if (buf == NULL) {
+		fprintf(stderr, "Failed to read block 0x%"PRIx64" (in 0x%"PRIx64"): %s\n",
+		        blk, owner, strerror(errno));
+		return 1;
+	}
 	if (gfs2_check_range(&sbd, blk) && blk != LGFS2_SB_ADDR(&sbd)) {
 		fprintf(stderr, "Warning: bad pointer 0x%"PRIx64" ignored in block 0x%"PRIx64"\n",
 		        blk, owner);
 		return 0;
 	}
-	savebh = bread(&sbd, blk);
-	if (savebh == NULL)
+	if (pread(sbd.device_fd, buf, sbd.bsize, sbd.bsize * blk) != sbd.bsize) {
+		fprintf(stderr, "Failed to read block 0x%"PRIx64" (in 0x%"PRIx64"): %s\n",
+		        blk, owner, strerror(errno));
+		free(buf);
 		return 1;
-	err = save_buf(mfd, savebh->b_data, blk, owner, blktype);
-	brelse(savebh);
+	}
+	err = save_buf(mfd, buf, blk, owner, blktype);
+	free(buf);
 	return err;
 }
 
-- 
2.26.2

