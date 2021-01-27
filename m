Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BB12D3065B9
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jan 2021 22:11:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611781918;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AelqZlOgxpJuUfCURBIgl1g6TO9YlWpobu4ZFtMqhn4=;
	b=ZqyKXRi0QGNr+wKdNG2CXAcyM3xpmimv+f30IAHS8HsBE2VfonDxa58D5RR1Vxp05xCCQh
	itx/Iky8NPWLCRviKuhEB1tETOby8ClWcAsDyzwniejjLTaazwxNFGI0XY22eBVsplkhrt
	A2P1/6CFBE2mel2bA1z2Mza4BFIZcTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-Os0BN1tOP8usmfkjh-8NRw-1; Wed, 27 Jan 2021 16:11:57 -0500
X-MC-Unique: Os0BN1tOP8usmfkjh-8NRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDFBB8030A7;
	Wed, 27 Jan 2021 21:11:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF78577BFD;
	Wed, 27 Jan 2021 21:11:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 940181809CA2;
	Wed, 27 Jan 2021 21:11:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RL7wmh013786 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 16:07:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5DF135B4A8; Wed, 27 Jan 2021 21:07:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 964571F0;
	Wed, 27 Jan 2021 21:07:57 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 Jan 2021 22:07:32 +0100
Message-Id: <20210127210746.16958-7-agruenba@redhat.com>
In-Reply-To: <20210127210746.16958-1-agruenba@redhat.com>
References: <20210127210746.16958-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 06/20] gfs2: Rename gfs2_{write =>
	flush}_revokes
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Function gfs2_write_revokes doesn't actually write any revokes; instead, it
adds revokes to the system transaction during a flush.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c  | 4 ++--
 fs/gfs2/log.h  | 2 +-
 fs/gfs2/lops.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 12e8280f0806..7375c007bde5 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -696,7 +696,7 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
 }
 
 /**
- * gfs2_write_revokes - Add as many revokes to the system transaction as we can
+ * gfs2_flush_revokes - Add as many revokes to the system transaction as we can
  * @sdp: The GFS2 superblock
  *
  * Our usual strategy is to defer writing revokes as much as we can in the hope
@@ -707,7 +707,7 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
  * been written back.  This will basically come at no cost now, and will save
  * us from having to keep track of those blocks on the AIL2 list later.
  */
-void gfs2_write_revokes(struct gfs2_sbd *sdp)
+void gfs2_flush_revokes(struct gfs2_sbd *sdp)
 {
 	/* number of revokes we still have room for */
 	unsigned int max_revokes;
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index 79f97290146e..a9cdbc990edf 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -78,6 +78,6 @@ extern void log_flush_wait(struct gfs2_sbd *sdp);
 extern int gfs2_logd(void *data);
 extern void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd);
 extern void gfs2_glock_remove_revoke(struct gfs2_glock *gl);
-extern void gfs2_write_revokes(struct gfs2_sbd *sdp);
+extern void gfs2_flush_revokes(struct gfs2_sbd *sdp);
 
 #endif /* __LOG_DOT_H__ */
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 3922b26264f5..8658ebbcb4a9 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -845,7 +845,7 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	struct page *page;
 	unsigned int length;
 
-	gfs2_write_revokes(sdp);
+	gfs2_flush_revokes(sdp);
 	if (!sdp->sd_log_num_revoke)
 		return;
 
-- 
2.26.2

