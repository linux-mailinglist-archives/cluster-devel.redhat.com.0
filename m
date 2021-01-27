Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0656D3065AF
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jan 2021 22:11:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611781916;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XH4k9hVclRFLZtmU+gTZJr+mu7MJJlk7XTj/diXBc0s=;
	b=IVHZ7747xPTkRHLawJbxUaOmEmT3BU4y1rMc8Z8YfaBG+I09HDaCanMDGGz/kTybRY2tnL
	ujOlqShTd8rG22MO7cF7CGjV6FYkNJPFMbJJ3ks4bP0/k3f1G4pcSNMBiVbKcbflzNqKTu
	VixUyyMCDS2kFadkN9FNck0GXBcm7ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-Gx3eoPFjM0qXsXfCjmX25A-1; Wed, 27 Jan 2021 16:11:53 -0500
X-MC-Unique: Gx3eoPFjM0qXsXfCjmX25A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5B618066FD;
	Wed, 27 Jan 2021 21:11:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D59A11045E04;
	Wed, 27 Jan 2021 21:11:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0F7C1809CA9;
	Wed, 27 Jan 2021 21:11:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RL845H013829 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 16:08:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16FF86F923; Wed, 27 Jan 2021 21:08:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5129E6F451;
	Wed, 27 Jan 2021 21:08:03 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 Jan 2021 22:07:37 +0100
Message-Id: <20210127210746.16958-12-agruenba@redhat.com>
In-Reply-To: <20210127210746.16958-1-agruenba@redhat.com>
References: <20210127210746.16958-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 11/20] gfs2: Don't wait for journal flush
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index 2e74137322bd..4a2b121b34d0 100644
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

