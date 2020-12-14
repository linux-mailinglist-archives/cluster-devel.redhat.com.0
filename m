Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E82782D9467
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Dec 2020 09:55:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607936108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kpPHb0xxPulC6k0bATJ8iIdcQiJNK4dfXBGQBwxR07Q=;
	b=L+3E5qCRG+3MgV6I82UxTR9LBQuqUbVFKPTYkR0gqCZgyWu5ymWZXh9HAMIrFlxQUbJTfo
	7ES1x1bENuKZ1frN6gGb9mXrP1IjOjWXcyslQ+L4TTa132pHRwR+6H31IFRllortfJT1tD
	NTllab1vYuW78uC1BO4JBbPY5/xdKrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-4GvrTrG7MgyutL8nB6qs5A-1; Mon, 14 Dec 2020 03:55:07 -0500
X-MC-Unique: 4GvrTrG7MgyutL8nB6qs5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FDC9800D62;
	Mon, 14 Dec 2020 08:55:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EB2F60C13;
	Mon, 14 Dec 2020 08:55:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50D65180954D;
	Mon, 14 Dec 2020 08:55:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BE8t2NX016482 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 03:55:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6D3356267C; Mon, 14 Dec 2020 08:55:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.194])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3A8A62688;
	Mon, 14 Dec 2020 08:55:01 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 14 Dec 2020 09:54:40 +0100
Message-Id: <20201214085442.45467-11-agruenba@redhat.com>
In-Reply-To: <20201214085442.45467-1-agruenba@redhat.com>
References: <20201214085442.45467-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 10/12] gfs2: Don't wait for journal flush in
	clean_journal
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
index b0d4ce4992ed..a8cc71ba4852 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -756,7 +756,7 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 	u64 dblock;
 
 	if (gfs2_withdrawn(sdp))
-		goto out;
+		return;
 
 	page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
 	lh = page_address(page);
@@ -811,8 +811,6 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 
 	gfs2_log_write(sdp, page, sb->s_blocksize, 0, dblock);
 	gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE | op_flags);
-out:
-	log_flush_wait(sdp);
 }
 
 /**
@@ -841,6 +839,7 @@ static void log_write_header(struct gfs2_sbd *sdp, u32 flags)
 	gfs2_write_log_header(sdp, sdp->sd_jdesc, sdp->sd_log_sequence++, tail,
 			      sdp->sd_log_flush_head, flags, op_flags);
 	gfs2_log_incr_head(sdp);
+	log_flush_wait(sdp);
 
 	if (sdp->sd_log_tail != tail)
 		log_pull_tail(sdp, tail);
-- 
2.26.2

