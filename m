Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AD7432DF1A5
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BbSj54d9wR3A2tC2zhl8yw96gesoKcUAZTLO9jD8vhM=;
	b=SxWZATOsqyBOmyMF3qH8KI0KtX0+rBuvphlxsoS7B5bYPJMJLz4NSuA41p3cDosNIgFr7Z
	xzve78IPdGciHeNIkrdU7puWttXcflbZouf9VKN9i76Imd9UH0pUGHqnmRBLcdS72UYSP8
	zxjMHjCKnC2+MCPHPKHPSMDoPHeoKDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-lvBlyp4cPZ6nFY4HlkmIuw-1; Sat, 19 Dec 2020 15:49:27 -0500
X-MC-Unique: lvBlyp4cPZ6nFY4HlkmIuw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97D31801AA8;
	Sat, 19 Dec 2020 20:49:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 387465C1B4;
	Sat, 19 Dec 2020 20:49:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2317E1809CA1;
	Sat, 19 Dec 2020 20:49:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKnLxY020228 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:49:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C2C3A39A4E; Sat, 19 Dec 2020 20:49:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B284350A8B;
	Sat, 19 Dec 2020 20:49:20 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:39 +0100
Message-Id: <20201219204848.285781-12-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 11/20] gfs2: Don't wait for journal flush
	in clean_journal
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

Commit 588bff95c94e added gfs2_write_log_header() and started using it in
clean_journal(), with an additional call to log_flush_wait() at the end of
gfs2_write_log_header() which is unnecessary for clean_journal().  Move
that call out of gfs2_write_log_header() to restore the previous behavior.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 88f9d630fb96..95ad444bd3dc 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -757,7 +757,7 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 	u64 dblock;
 
 	if (gfs2_withdrawn(sdp))
-		goto out;
+		return;
 
 	page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
 	lh = page_address(page);
@@ -812,8 +812,6 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 
 	gfs2_log_write(sdp, page, sb->s_blocksize, 0, dblock);
 	gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE | op_flags);
-out:
-	log_flush_wait(sdp);
 }
 
 /**
@@ -842,6 +840,7 @@ static void log_write_header(struct gfs2_sbd *sdp, u32 flags)
 	gfs2_write_log_header(sdp, sdp->sd_jdesc, sdp->sd_log_sequence++, tail,
 			      sdp->sd_log_flush_head, flags, op_flags);
 	gfs2_log_incr_head(sdp);
+	log_flush_wait(sdp);
 
 	if (sdp->sd_log_tail != tail)
 		log_pull_tail(sdp, tail);
-- 
2.26.2

