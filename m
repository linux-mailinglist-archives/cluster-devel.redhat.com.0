Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 75CC224DE8B
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Aug 2020 19:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598031239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CYvS6g++R9+2PcQeXFNio4x+cKbC4mPBul6YOvYazRI=;
	b=JCa71bjGXmscVHvvJp3qe3/jy7NXbmhbXJxZHcFEwNuz1NxVNF3j+MXI4q0FhW3C36ViPv
	hmwHEVK4VE/jMsImQ1YKFw9vPe53BAFvQ9u+ZE0TKtwkGQWSMBOkVO/71znY4nxDWDuRe9
	g69aZ6FuC5AbzT18wnDJpRgSVdXQ2MA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-uOA6BmexNN2Fb9gt839rlw-1; Fri, 21 Aug 2020 13:33:57 -0400
X-MC-Unique: uOA6BmexNN2Fb9gt839rlw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 202E95200;
	Fri, 21 Aug 2020 17:33:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1078B5C1D0;
	Fri, 21 Aug 2020 17:33:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F035D662C7;
	Fri, 21 Aug 2020 17:33:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LHXjhB028449 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 13:33:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6ED5C5DA74; Fri, 21 Aug 2020 17:33:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-102.phx2.redhat.com [10.3.112.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BEBF5DA78
	for <cluster-devel@redhat.com>; Fri, 21 Aug 2020 17:33:45 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Aug 2020 12:33:37 -0500
Message-Id: <20200821173337.20377-13-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-1-rpeterso@redhat.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 12/12] gfs2: add some much needed
	cleanup for log flushes that fail
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
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

When a log flush fails due to io errors, it signals the failure but does
not clean up after itself very well. This is because buffers are added to
the transaction tr_buf and tr_databuf queue, but the io error causes
gfs2_log_flush to bypass the "after_commit" functions responsible for
dequeueing the bd elements. If the bd elements are added to the ail list
before the error, function ail_drain takes care of dequeueing them.
But if they haven't gotten that far, the elements are forgotten and
make the transactions unable to be freed.

This patch introduces new function trans_drain which drains the bd
elements from the transaction so they can be freed properly.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c   | 31 +++++++++++++++++++++++++++++++
 fs/gfs2/trans.c |  1 +
 2 files changed, 32 insertions(+)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 4fb1a96b8124..2e2625ee59e3 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -913,6 +913,36 @@ static void empty_ail1_list(struct gfs2_sbd *sdp)
 	}
 }
 
+/**
+ * drain_bd - drain the buf and databuf queue for a failed transaction
+ * @tr: the transaction to drain
+ *
+ * When this is called, we're taking an error exit for a log write that failed
+ * but since we bypassed the after_commit functions, we need to remove the
+ * items from the buf and databuf queue.
+ */
+static void trans_drain(struct gfs2_trans *tr)
+{
+	struct gfs2_bufdata *bd;
+	struct list_head *head;
+
+	if (!tr)
+		return;
+
+	head = &tr->tr_buf;
+	while (!list_empty(head)) {
+		bd = list_first_entry(head, struct gfs2_bufdata, bd_list);
+		list_del_init(&bd->bd_list);
+		kmem_cache_free(gfs2_bufdata_cachep, bd);
+	}
+	head = &tr->tr_databuf;
+	while (!list_empty(head)) {
+		bd = list_first_entry(head, struct gfs2_bufdata, bd_list);
+		list_del_init(&bd->bd_list);
+		kmem_cache_free(gfs2_bufdata_cachep, bd);
+	}
+}
+
 /**
  * gfs2_log_flush - flush incore transaction(s)
  * @sdp: the filesystem
@@ -1017,6 +1047,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 
 out:
 	if (gfs2_withdrawn(sdp)) {
+		trans_drain(tr);
 		/**
 		 * If the tr_list is empty, we're withdrawing during a log
 		 * flush that targets a transaction, but the transaction was
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index e1c7eb6eb00a..6d4bf7ea7b3b 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -67,6 +67,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 		tr->tr_reserved += gfs2_struct2blk(sdp, revokes);
 	INIT_LIST_HEAD(&tr->tr_databuf);
 	INIT_LIST_HEAD(&tr->tr_buf);
+	INIT_LIST_HEAD(&tr->tr_list);
 	INIT_LIST_HEAD(&tr->tr_ail1_list);
 	INIT_LIST_HEAD(&tr->tr_ail2_list);
 
-- 
2.26.2

