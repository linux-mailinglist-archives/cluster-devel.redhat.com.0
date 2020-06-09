Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3511F3D64
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jun 2020 15:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591710926;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Bbz93LjKCqDQLqgtJaAmlunfqFqtWwhMm8+PXF4jv84=;
	b=SLx2PLRi8s3YcYA329bFBVlDwG+pIGDM2BsqZYtEC9L/ZcNn1ZLEWVbEW5kC6cYkpD4k1R
	/tIJLTQuuM/m2FvIUPmYkgYyW69cz7DiCDkrgekHgb7TD6mAP69haX50BybQxZ7HRjhJpO
	1WzlvnGYNTWtnjdypXi1qIDb8FS6L/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-UO4kYcdQNuyPJ_yPngf4Lw-1; Tue, 09 Jun 2020 09:55:24 -0400
X-MC-Unique: UO4kYcdQNuyPJ_yPngf4Lw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60640461;
	Tue,  9 Jun 2020 13:55:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 572AF8202B;
	Tue,  9 Jun 2020 13:55:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6148180954D;
	Tue,  9 Jun 2020 13:55:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059DtFgQ005854 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 09:55:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61A417BFE3; Tue,  9 Jun 2020 13:55:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DAB27BA10;
	Tue,  9 Jun 2020 13:55:11 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E77E1B3490;
	Tue,  9 Jun 2020 13:55:11 +0000 (UTC)
Date: Tue, 9 Jun 2020 09:55:11 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <181861383.32913711.1591710911880.JavaMail.zimbra@redhat.com>
In-Reply-To: <328729303.32913287.1591710587188.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.115.80, 10.4.195.30]
Thread-Topic: gfs2: fix trans slab error when withdraw occurs inside log_flush
Thread-Index: j5Pmy3ZM1kFJ/ijkLUpWJK3QrIb7Bg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: fix trans slab error when
 withdraw occurs inside log_flush
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Log flush operations (gfs2_log_flush()) can target a specific transaction.
But if the function encounters errors (e.g. io errors) and withdraws,
the transaction was only freed it if was queued to one of the ail lists.
If the withdraw occurred before the transaction was queued to the ail1
list, function ail_drain never freed it. The result was:

BUG gfs2_trans: Objects remaining in gfs2_trans on __kmem_cache_shutdown()

This patch makes log_flush() add the targeted transaction to the ail1
list so that function ail_drain() will find and free it properly.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 3e4734431783..2b05415bbc13 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1002,6 +1002,16 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 
 out:
 	if (gfs2_withdrawn(sdp)) {
+		/**
+		 * If the tr_list is empty, we're withdrawing during a log
+		 * flush that targets a transaction, but the transaction was
+		 * never queued onto any of the ail lists. Here we add it to
+		 * ail1 just so that ail_drain() will find and free it.
+		 */
+		spin_lock(&sdp->sd_ail_lock);
+		if (tr && list_empty(&tr->tr_list))
+			list_add(&tr->tr_list, &sdp->sd_ail1_list);
+		spin_unlock(&sdp->sd_ail_lock);
 		ail_drain(sdp); /* frees all transactions */
 		tr = NULL;
 	}

