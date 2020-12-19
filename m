Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E5DEA2DF19C
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410951;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=chQdphqwkVIHBJHxu1LWW+pPG0K7MNhZH3fki0eZaXA=;
	b=ABxVd+a5eKnEkqCfxe8DaVYuW8D2ihioL7316T+AGugpio1CHcSPkGTPN5MvRdeTWuHzGm
	dmm+VkfB5k9+kkYGmArBxtUzek0NnJY3fyRCzIhtPstTcEHz0ClfR1jPk55t9sv0/rxjr4
	aDNOSk2rYQ2HEBV0Y/GgAtFWxkFYCOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-BSfyP1GLNVyAKdpaNsPqSw-1; Sat, 19 Dec 2020 15:49:09 -0500
X-MC-Unique: BSfyP1GLNVyAKdpaNsPqSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D37DFE769;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8B075C22A;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A6D85002C;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKn4Pm020128 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:49:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2FC0F50ADB; Sat, 19 Dec 2020 20:49:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 177902DAD0;
	Sat, 19 Dec 2020 20:49:02 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:32 +0100
Message-Id: <20201219204848.285781-5-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 04/20] gfs2: Some documentation updates
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The calc_reserved description claims that buf_limit is 502 (on 4k
filesystems), but it is actually 503.  Fix / clarify the entire
description.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 6778473b2a7f..5bc3cc8ef7f4 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -50,10 +50,12 @@ unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct)
 	unsigned int blks;
 	unsigned int first, second;
 
+	/* The initial struct gfs2_log_descriptor block */
 	blks = 1;
 	first = sdp->sd_ldptrs;
 
 	if (nstruct > first) {
+		/* Subsequent struct gfs2_meta_header blocks */
 		second = sdp->sd_inptrs;
 		blks += DIV_ROUND_UP(nstruct - first, second);
 	}
@@ -507,24 +509,20 @@ static inline unsigned int log_distance(struct gfs2_sbd *sdp, unsigned int newer
 }
 
 /**
- * calc_reserved - Calculate the number of blocks to reserve when
- *                 refunding a transaction's unused buffers.
+ * calc_reserved - Calculate the number of blocks to keep reserved
  * @sdp: The GFS2 superblock
  *
  * This is complex.  We need to reserve room for all our currently used
- * metadata buffers (e.g. normal file I/O rewriting file time stamps) and 
- * all our journaled data buffers for journaled files (e.g. files in the 
+ * metadata blocks (e.g. normal file I/O rewriting file time stamps) and
+ * all our journaled data blocks for journaled files (e.g. files in the
  * meta_fs like rindex, or files for which chattr +j was done.)
- * If we don't reserve enough space, gfs2_log_refund and gfs2_log_flush
- * will count it as free space (sd_log_blks_free) and corruption will follow.
+ * If we don't reserve enough space, corruption will follow.
  *
- * We can have metadata bufs and jdata bufs in the same journal.  So each
- * type gets its own log header, for which we need to reserve a block.
- * In fact, each type has the potential for needing more than one header 
- * in cases where we have more buffers than will fit on a journal page.
+ * We can have metadata blocks and jdata blocks in the same journal.  Each
+ * type gets its own log descriptor, for which we need to reserve a block.
+ * In fact, each type has the potential for needing more than one log descriptor
+ * in cases where we have more blocks than will fit in a log descriptor.
  * Metadata journal entries take up half the space of journaled buffer entries.
- * Thus, metadata entries have buf_limit (502) and journaled buffers have
- * databuf_limit (251) before they cause a wrap around.
  *
  * Also, we need to reserve blocks for revoke journal entries and one for an
  * overall header for the lot.
@@ -1007,7 +1005,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 
 	if (sdp->sd_log_head != sdp->sd_log_flush_head) {
 		log_write_header(sdp, flags);
-	} else if (sdp->sd_log_tail != current_tail(sdp) && !sdp->sd_log_idle){
+	} else if (sdp->sd_log_tail != current_tail(sdp) && !sdp->sd_log_idle) {
 		atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buffer */
 		trace_gfs2_log_blocks(sdp, -1);
 		log_write_header(sdp, flags);
-- 
2.26.2

