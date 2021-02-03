Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DB5FF30E1FE
	for <lists+cluster-devel@lfdr.de>; Wed,  3 Feb 2021 19:08:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612375721;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DGeXld//N8qmO+oc2AW7fVM5DrKEIIAng7KC1++NB24=;
	b=W6m6GF6fvOJorwekBswa1M761G5Au8uU5VyjNOw1N+f0gODpPwbAaPtISnESozDs3amPgU
	Dgd4w8x67VDu4h236967Ps+z/hOG/FahekS9DW7nY3eRsqxTxXEkxHQusval7Fjj2vqZOL
	CC58h53GRU4CuYv/xhbtLyLx7eW6OrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-i4HhjtYxP5CoMLajGUrxeA-1; Wed, 03 Feb 2021 13:08:28 -0500
X-MC-Unique: i4HhjtYxP5CoMLajGUrxeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7947EAFA84;
	Wed,  3 Feb 2021 18:08:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69D7C5D6A8;
	Wed,  3 Feb 2021 18:08:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5755D18095CB;
	Wed,  3 Feb 2021 18:08:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113I8McR028704 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 13:08:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 650403828; Wed,  3 Feb 2021 18:08:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-112-155.ams2.redhat.com [10.36.112.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD4B4779DC;
	Wed,  3 Feb 2021 18:08:21 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  3 Feb 2021 19:07:53 +0100
Message-Id: <20210203180755.246596-19-agruenba@redhat.com>
In-Reply-To: <20210203180755.246596-1-agruenba@redhat.com>
References: <20210203180755.246596-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v4 18/20] gfs2: Minor calc_reserved cleanup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

No functional change.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index b80c96cf721a..93ae3da4accb 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -564,17 +564,14 @@ static inline unsigned int log_distance(struct gfs2_sbd *sdp, unsigned int newer
 static unsigned int calc_reserved(struct gfs2_sbd *sdp)
 {
 	unsigned int reserved = 0;
-	unsigned int mbuf;
-	unsigned int dbuf;
+	unsigned int blocks;
 	struct gfs2_trans *tr = sdp->sd_log_tr;
 
 	if (tr) {
-		mbuf = tr->tr_num_buf_new - tr->tr_num_buf_rm;
-		dbuf = tr->tr_num_databuf_new - tr->tr_num_databuf_rm;
-		reserved = mbuf + dbuf;
-		/* Account for header blocks */
-		reserved += DIV_ROUND_UP(mbuf, buf_limit(sdp));
-		reserved += DIV_ROUND_UP(dbuf, databuf_limit(sdp));
+		blocks = tr->tr_num_buf_new - tr->tr_num_buf_rm;
+		reserved += blocks + DIV_ROUND_UP(blocks, buf_limit(sdp));
+		blocks = tr->tr_num_databuf_new - tr->tr_num_databuf_rm;
+		reserved += blocks + DIV_ROUND_UP(blocks, databuf_limit(sdp));
 	}
 
 	if (sdp->sd_log_committed_revoke > 0)
-- 
2.26.2

