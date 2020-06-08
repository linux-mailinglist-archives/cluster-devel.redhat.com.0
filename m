Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id ACB341F1C9D
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:01:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632087;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ly/N85wPzNw0dimoErI4Jri4buMlJwKIz/SLvHF5Res=;
	b=KCMnp9jnndwAQ2p/iPQGexOXFzv3qJDQByJRhLKwHETAo9zR3/iBA3VK2N0RPhBFjsawY+
	nI5cRCTY2XH0h+WHYHqU9r1UDY+YOTfCywj5tqiA4duWD1GfYG3WKlssWd6uJBzRkIOsFR
	v22dKPJhGuUTGMdCUpl59F9rJ3oBauE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-5KZtgPCFOXazIFRjwVqCvQ-1; Mon, 08 Jun 2020 12:01:15 -0400
X-MC-Unique: 5KZtgPCFOXazIFRjwVqCvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33AE518FF662;
	Mon,  8 Jun 2020 16:01:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 219367BA09;
	Mon,  8 Jun 2020 16:01:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C6B9B3490;
	Mon,  8 Jun 2020 16:01:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G1AMS011847 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:01:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E08888927A; Mon,  8 Jun 2020 16:01:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E36F08926C;
	Mon,  8 Jun 2020 16:01:09 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:37 +0200
Message-Id: <20200608160039.549204-19-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 18/20] gfs2: initialize transaction
	tr_ailX_lists earlier
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

Since transactions may be freed shortly after they're created, before
a log_flush occurs, we need to initialize their ail1 and ail2 lists
earlier. Before this patch, the ail1 list was initialized in gfs2_log_flush().
This moves the initialization to the point when the transaction is first
created.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glops.c | 2 ++
 fs/gfs2/log.c   | 2 --
 fs/gfs2/trans.c | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4862dae868a2..224fb3bd503c 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -91,6 +91,8 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
 	memset(&tr, 0, sizeof(tr));
 	INIT_LIST_HEAD(&tr.tr_buf);
 	INIT_LIST_HEAD(&tr.tr_databuf);
+	INIT_LIST_HEAD(&tr.tr_ail1_list);
+	INIT_LIST_HEAD(&tr.tr_ail2_list);
 	tr.tr_revokes = atomic_read(&gl->gl_ail_count);
 
 	if (!tr.tr_revokes) {
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index fcc7f58d74f0..a81af1bde1bb 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -933,8 +933,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	tr = sdp->sd_log_tr;
 	if (tr) {
 		sdp->sd_log_tr = NULL;
-		INIT_LIST_HEAD(&tr->tr_ail1_list);
-		INIT_LIST_HEAD(&tr->tr_ail2_list);
 		tr->tr_first = sdp->sd_log_flush_head;
 		if (unlikely (state == SFS_FROZEN))
 			if (gfs2_assert_withdraw_delayed(sdp,
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index ffe840505082..62a65ed9a9f5 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -52,6 +52,8 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 		tr->tr_reserved += gfs2_struct2blk(sdp, revokes);
 	INIT_LIST_HEAD(&tr->tr_databuf);
 	INIT_LIST_HEAD(&tr->tr_buf);
+	INIT_LIST_HEAD(&tr->tr_ail1_list);
+	INIT_LIST_HEAD(&tr->tr_ail2_list);
 
 	sb_start_intwrite(sdp->sd_vfs);
 
-- 
2.26.2

