Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9191F03E7
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403050;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pgGewLfPgGgDnCvztvcvbNGYUXaBh950e+OWO3xDieY=;
	b=fFcxFATLyI6Y1rDOAsGRDSJVUymgrTAG63GlCxzcXDFbViIWqCBveA6+SD9AjzLcXgpd92
	1vwIeo/Vynp/Ie5deV356IbzRJ5lpeNY09ddbAOnUsib0jhUkHi533AA598lnTxDx16npD
	vcy9SFiMqqm18jUriwMCqVvvLkv1CpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-oclNiwVtM7e0lhroelNveA-1; Fri, 05 Jun 2020 20:24:06 -0400
X-MC-Unique: oclNiwVtM7e0lhroelNveA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BEC5835B48;
	Sat,  6 Jun 2020 00:24:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C8F35D9F7;
	Sat,  6 Jun 2020 00:24:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F062E8A8CB;
	Sat,  6 Jun 2020 00:24:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055Gl9S9020707 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 12:47:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A37E7B610; Fri,  5 Jun 2020 16:47:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-115-80.phx2.redhat.com [10.3.115.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53B497B60D
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 16:47:09 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  5 Jun 2020 11:47:01 -0500
Message-Id: <20200605164701.30776-7-rpeterso@redhat.com>
In-Reply-To: <20200605164701.30776-1-rpeterso@redhat.com>
References: <20200605164701.30776-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 6/6] gfs2: fix use-after-free on
	transaction ail lists
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Before this patch, transactions could be merged into the system
transaction by function gfs2_merge_trans(), but then it is not
considered attached. The caller, log_refund, only sets TR_ATTACHED
if the transaction is not merged. Later, in function, gfs2_trans_end,
if TR_ATTACHED is not set (because it was merged) the transaction is
freed by gfs2_trans_free(). However, by the time this happens, the
log flush mechanism may have queued bd elements to the ail list,
which means tr_ail1_list may not be empty, and the flush may forget
about the bd elements altogether (memory leak, because it focuses
on the sdp transaction instead) or worse, reference them after the
transaction has been freed.

Although I've not seen any serious consequences, the problem becomes
apparent with the previous patch's addition of:

	gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));

to function gfs2_trans_free().

This patch adds logic into gfs2_merge_trans() to move the merged
transaction's ail lists to the sdp transaction. This prevents the
use-after-free.

To facilitate this, we pass sdp into the function instead of the
transaction itself.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 64efa3f743af..5a2bc70b0859 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1020,8 +1020,10 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
  * @new: New transaction to be merged
  */
 
-static void gfs2_merge_trans(struct gfs2_trans *old, struct gfs2_trans *new)
+static void gfs2_merge_trans(struct gfs2_sbd *sdp, struct gfs2_trans *new)
 {
+	struct gfs2_trans *old = sdp->sd_log_tr;
+
 	WARN_ON_ONCE(!test_bit(TR_ATTACHED, &old->tr_flags));
 
 	old->tr_num_buf_new	+= new->tr_num_buf_new;
@@ -1033,6 +1035,11 @@ static void gfs2_merge_trans(struct gfs2_trans *old, struct gfs2_trans *new)
 
 	list_splice_tail_init(&new->tr_databuf, &old->tr_databuf);
 	list_splice_tail_init(&new->tr_buf, &old->tr_buf);
+
+	spin_lock(&sdp->sd_ail_lock);
+	list_splice_tail_init(&new->tr_ail1_list, &old->tr_ail1_list);
+	list_splice_tail_init(&new->tr_ail2_list, &old->tr_ail2_list);
+	spin_unlock(&sdp->sd_ail_lock);
 }
 
 static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
@@ -1044,7 +1051,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	gfs2_log_lock(sdp);
 
 	if (sdp->sd_log_tr) {
-		gfs2_merge_trans(sdp->sd_log_tr, tr);
+		gfs2_merge_trans(sdp, tr);
 	} else if (tr->tr_num_buf_new || tr->tr_num_databuf_new) {
 		gfs2_assert_withdraw(sdp, test_bit(TR_ALLOCED, &tr->tr_flags));
 		sdp->sd_log_tr = tr;
-- 
2.26.2

