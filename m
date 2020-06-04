Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 260681F03C5
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=U6u/C8LfqnUUTmKL3mut2xwy3wK4YfFZwKk+ZIzEzlA=;
	b=JaoLa+3A3RsH5QkGZi56RNcpk/8N84a0w/ZuwgRV5bVuhsrsg2DjmgNhuIhUkgcocMKsN1
	Y3jJm0YpqPohNyT3UTKg3XPEXhfNkhVh+gzCEK3a5PbS3wlj0zB3pG+PxPkZ0O2kGg9Nx8
	MbmCOqAe2/1M4XbamBeY7jyHAywAXV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-RnTMoVxCN6i0nvPWOYtgbw-1; Fri, 05 Jun 2020 20:20:11 -0400
X-MC-Unique: RnTMoVxCN6i0nvPWOYtgbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A17AA0BE1;
	Sat,  6 Jun 2020 00:20:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F272510013D0;
	Sat,  6 Jun 2020 00:20:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6639687426;
	Sat,  6 Jun 2020 00:20:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 054KFKYK010993 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jun 2020 16:15:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9BE87B5E5; Thu,  4 Jun 2020 20:15:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C36E57B5F3
	for <cluster-devel@redhat.com>; Thu,  4 Jun 2020 20:15:17 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEE8197016
	for <cluster-devel@redhat.com>; Thu,  4 Jun 2020 20:15:17 +0000 (UTC)
Date: Thu, 4 Jun 2020 16:15:17 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1633443291.31843143.1591301717731.JavaMail.zimbra@redhat.com>
In-Reply-To: <839050994.31843098.1591301634432.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.115.80, 10.4.195.4]
Thread-Topic: gfs2: fix use-after-free on transaction ail lists
Thread-Index: oLdP9eHYk7S4xuP9Rw2dLnMrxk2q3g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [gfs2 patch] gfs2: fix use-after-free on
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Before this patch, transactions could be merged into the system
transaction by function gfs2_merge_trans(), but then it is not
considered attached. The caller, log_refund, only sets TR_ATTACHED
if the transaction is not merged. Later, in function, gfs2_trans_end,
if TR_ATTACHED is not set (because it was merged) the transaction is
freed by gfs2_trans_free(). However, by the time this happens, the
log flush mechanism may have queued bd elements to the ail list,
which means tr_ail1_list may not be empty, and the flush may forget
about the bd elements altogether (memory leak) or worse, reference
them after the transaction has been freed.

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
index 79aa0fb4984e..91e1eebc5ee0 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1017,8 +1017,10 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
  * @new: New transaction to be merged
  */
 
-static void gfs2_merge_trans(struct gfs2_trans *old, struct gfs2_trans *new)
+static void gfs2_merge_trans(struct gfs2_sbd *sdp, struct gfs2_trans *new)
 {
+	struct gfs2_trans *old = sdp->sd_log_tr;
+
 	WARN_ON_ONCE(!test_bit(TR_ATTACHED, &old->tr_flags));
 
 	old->tr_num_buf_new	+= new->tr_num_buf_new;
@@ -1030,6 +1032,11 @@ static void gfs2_merge_trans(struct gfs2_trans *old, struct gfs2_trans *new)
 
 	list_splice_tail_init(&new->tr_databuf, &old->tr_databuf);
 	list_splice_tail_init(&new->tr_buf, &old->tr_buf);
+
+	spin_lock(&sdp->sd_ail_lock);
+	list_splice_tail_init(&new->tr_ail1_list, &old->tr_ail1_list);
+	list_splice_tail_init(&new->tr_ail2_list, &old->tr_ail2_list);
+	spin_unlock(&sdp->sd_ail_lock);
 }
 
 static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
@@ -1041,7 +1048,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	gfs2_log_lock(sdp);
 
 	if (sdp->sd_log_tr) {
-		gfs2_merge_trans(sdp->sd_log_tr, tr);
+		gfs2_merge_trans(sdp, tr);
 	} else if (tr->tr_num_buf_new || tr->tr_num_databuf_new) {
 		gfs2_assert_withdraw(sdp, test_bit(TR_ALLOCED, &tr->tr_flags));
 		sdp->sd_log_tr = tr;

