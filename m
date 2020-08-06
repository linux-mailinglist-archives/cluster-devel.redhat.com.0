Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 68B0E23DAD4
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721110;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ai4rCggkEZE91o7wpSQovWIJi4bO2eFm+ACrNSg9txg=;
	b=W2/4WJMEvj36pkdE0NtbRUrXQmsAtHV1UPVwEF/E8UF5Em1kqm/m/CKV8YoHurMJhQYmcf
	p8Pc5OcFE+MtMdQlpU5AtnVo2E++JD6LS7OQKbQjlCog+qLcwFul1HCe8109CmFTMJVPzV
	4TB1N3WraQpwop2oRKYU9AacVA4yxcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-Xgkr3KaXNMKrneZmQa-vbQ-1; Thu, 06 Aug 2020 09:38:27 -0400
X-MC-Unique: Xgkr3KaXNMKrneZmQa-vbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4DA558;
	Thu,  6 Aug 2020 13:38:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4E1A87A54;
	Thu,  6 Aug 2020 13:38:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A175C1809554;
	Thu,  6 Aug 2020 13:38:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcMrM030718 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95DFE59; Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC13E60BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:21 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:43 +0100
Message-Id: <20200806133807.111280-9-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 08/32] libgfs2: Remove gfs2_buffer_head from
	lgfs2_write_journal_data()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/structures.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 36e02c2f..0aca7cd0 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -156,41 +156,41 @@ int lgfs2_write_journal_data(struct gfs2_inode *ip)
 		.lh_flags = GFS2_LOG_HEAD_UNMOUNT,
 #endif
 	};
-	struct gfs2_buffer_head *bh;
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	unsigned blocks = (ip->i_di.di_size + sdp->bsize - 1) / sdp->bsize;
 	uint64_t jext0 = ip->i_di.di_num.no_addr + ip->i_di.di_blocks - blocks;
 	uint64_t seq = ((blocks) * (random() / (RAND_MAX + 1.0)));
+	uint64_t jblk = jext0;
+	char *buf;
 
-	bh = bget(sdp, jext0);
-	if (bh == NULL)
+	buf = calloc(1, sdp->bsize);
+	if (buf == NULL)
 		return -1;
 
 	crc32c_optimization_init();
 	do {
-		struct gfs2_log_header *buflh = (struct gfs2_log_header *)bh->b_data;
+		struct gfs2_log_header *buflh = (struct gfs2_log_header *)buf;
 
 		lh.lh_sequence = seq;
-		lh.lh_blkno = bh->b_blocknr - jext0;
-		gfs2_log_header_out(&lh, bh->b_data);
+		lh.lh_blkno = jblk - jext0;
+		gfs2_log_header_out(&lh, buf);
 
-		buflh->lh_hash = cpu_to_be32(lgfs2_log_header_hash(bh->b_data));
+		buflh->lh_hash = cpu_to_be32(lgfs2_log_header_hash(buf));
 #ifdef GFS2_HAS_LH_V2
-		buflh->lh_addr = cpu_to_be64(bh->b_blocknr);
-		buflh->lh_crc = cpu_to_be32(lgfs2_log_header_crc(bh->b_data, sdp->bsize));
+		buflh->lh_addr = cpu_to_be64(jblk);
+		buflh->lh_crc = cpu_to_be32(lgfs2_log_header_crc(buf, sdp->bsize));
 #endif
-
-		if (bwrite(bh)) {
-			free(bh);
+		if (pwrite(sdp->device_fd, buf, sdp->bsize, jblk * sdp->bsize) != sdp->bsize) {
+			free(buf);
 			return -1;
 		}
 
 		if (++seq == blocks)
 			seq = 0;
 
-	} while (++bh->b_blocknr < jext0 + blocks);
+	} while (++jblk < jext0 + blocks);
 
-	free(bh);
+	free(buf);
 	return 0;
 }
 
-- 
2.26.2

