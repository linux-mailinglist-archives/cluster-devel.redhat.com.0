Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 71F07257C79
	for <lists+cluster-devel@lfdr.de>; Mon, 31 Aug 2020 17:30:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-EzZkAirgNXyNOqnFSqE4Zg-1; Mon, 31 Aug 2020 11:30:47 -0400
X-MC-Unique: EzZkAirgNXyNOqnFSqE4Zg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F422AF177;
	Mon, 31 Aug 2020 15:30:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94F9A60C04;
	Mon, 31 Aug 2020 15:30:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6052679A11;
	Mon, 31 Aug 2020 15:30:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07VFUHoo007760 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 11:30:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2009030BBA; Mon, 31 Aug 2020 15:30:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B10551DD
	for <cluster-devel@redhat.com>; Mon, 31 Aug 2020 15:30:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0221E101A53F
	for <cluster-devel@redhat.com>; Mon, 31 Aug 2020 15:30:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-66-vQMHIozAMVOGxv0xJJjXbw-1; 
	Mon, 31 Aug 2020 11:30:09 -0400
X-MC-Unique: vQMHIozAMVOGxv0xJJjXbw-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CD863214D8;
	Mon, 31 Aug 2020 15:30:06 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 31 Aug 2020 11:29:14 -0400
Message-Id: <20200831152934.1023912-22-sashal@kernel.org>
In-Reply-To: <20200831152934.1023912-1-sashal@kernel.org>
References: <20200831152934.1023912-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07VFUHoo007760
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.8 22/42] gfs2: add some much
	needed cleanup for log flushes that fail
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 462582b99b6079a6fbcdfc65bac49f5c2a27cfff ]

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
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/log.c   | 31 +++++++++++++++++++++++++++++++
 fs/gfs2/trans.c |  1 +
 2 files changed, 32 insertions(+)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index a76e55bc28ebf..27f467a0f008e 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -901,6 +901,36 @@ static void empty_ail1_list(struct gfs2_sbd *sdp)
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
@@ -1005,6 +1035,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 
 out:
 	if (gfs2_withdrawn(sdp)) {
+		trans_drain(tr);
 		/**
 		 * If the tr_list is empty, we're withdrawing during a log
 		 * flush that targets a transaction, but the transaction was
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index a3dfa3aa87ad9..d897dd73c5999 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -52,6 +52,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 		tr->tr_reserved += gfs2_struct2blk(sdp, revokes);
 	INIT_LIST_HEAD(&tr->tr_databuf);
 	INIT_LIST_HEAD(&tr->tr_buf);
+	INIT_LIST_HEAD(&tr->tr_list);
 	INIT_LIST_HEAD(&tr->tr_ail1_list);
 	INIT_LIST_HEAD(&tr->tr_ail2_list);
 
-- 
2.25.1


