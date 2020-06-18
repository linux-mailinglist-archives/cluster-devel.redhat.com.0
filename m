Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 412E71FDCBB
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Jun 2020 03:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592443310;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qakBgmq4l863WrMNcl9pSh7TxuRFOGjPrt9Jraau84s=;
	b=aqUnx/iKLysc7AYXX++TsnFS3qqr3Xfd6Ym/f5rB/+SXG5tj2o7jvAN0/cREy5miJxMYcF
	/9tlf1f38PGBvoeLP/AbrjruZlXgZ0mHiN6FY39lpLEHHAiZxuRdhXs7R6/eARFacKrHUq
	tPaULMNoDM5wrf613yxsNstyD9PM6O4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-ReZQgFn7OCqs3Xxk3UP-dw-1; Wed, 17 Jun 2020 21:21:48 -0400
X-MC-Unique: ReZQgFn7OCqs3Xxk3UP-dw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B56A107ACCA;
	Thu, 18 Jun 2020 01:21:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFF4879301;
	Thu, 18 Jun 2020 01:21:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DBD61833C6;
	Thu, 18 Jun 2020 01:21:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I1LiF4032668 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 21:21:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F3CB12157F25; Thu, 18 Jun 2020 01:21:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF6352157F23
	for <cluster-devel@redhat.com>; Thu, 18 Jun 2020 01:21:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 384578007B1
	for <cluster-devel@redhat.com>; Thu, 18 Jun 2020 01:21:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-439-VblFmM0QPuO8BR2YDHcHkw-1;
	Wed, 17 Jun 2020 21:21:36 -0400
X-MC-Unique: VblFmM0QPuO8BR2YDHcHkw-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1685C20B1F;
	Thu, 18 Jun 2020 01:21:34 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 17 Jun 2020 21:16:00 -0400
Message-Id: <20200618011631.604574-235-sashal@kernel.org>
In-Reply-To: <20200618011631.604574-1-sashal@kernel.org>
References: <20200618011631.604574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05I1LiF4032668
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.4 235/266] gfs2: fix
	use-after-free on transaction ail lists
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 83d060ca8d90fa1e3feac227f995c013100862d3 ]

Before this patch, transactions could be merged into the system
transaction by function gfs2_merge_trans(), but the transaction ail
lists were never merged. Because the ail flushing mechanism can run
separately, bd elements can be attached to the transaction's buffer
list during the transaction (trans_add_meta, etc) but quickly moved
to its ail lists. Later, in function gfs2_trans_end, the transaction
can be freed (by gfs2_trans_end) while it still has bd elements
queued to its ail lists, which can cause it to either lose track of
the bd elements altogether (memory leak) or worse, reference the bd
elements after the parent transaction has been freed.

Although I've not seen any serious consequences, the problem becomes
apparent with the previous patch's addition of:

	gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));

to function gfs2_trans_free().

This patch adds logic into gfs2_merge_trans() to move the merged
transaction's ail lists to the sdp transaction. This prevents the
use-after-free. To do this properly, we need to hold the ail lock,
so we pass sdp into the function instead of the transaction itself.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/log.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 110e5c4db819..a4b6a49462a4 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -881,8 +881,10 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
  * @new: New transaction to be merged
  */
 
-static void gfs2_merge_trans(struct gfs2_trans *old, struct gfs2_trans *new)
+static void gfs2_merge_trans(struct gfs2_sbd *sdp, struct gfs2_trans *new)
 {
+	struct gfs2_trans *old = sdp->sd_log_tr;
+
 	WARN_ON_ONCE(!test_bit(TR_ATTACHED, &old->tr_flags));
 
 	old->tr_num_buf_new	+= new->tr_num_buf_new;
@@ -893,6 +895,11 @@ static void gfs2_merge_trans(struct gfs2_trans *old, struct gfs2_trans *new)
 
 	list_splice_tail_init(&new->tr_databuf, &old->tr_databuf);
 	list_splice_tail_init(&new->tr_buf, &old->tr_buf);
+
+	spin_lock(&sdp->sd_ail_lock);
+	list_splice_tail_init(&new->tr_ail1_list, &old->tr_ail1_list);
+	list_splice_tail_init(&new->tr_ail2_list, &old->tr_ail2_list);
+	spin_unlock(&sdp->sd_ail_lock);
 }
 
 static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
@@ -904,7 +911,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	gfs2_log_lock(sdp);
 
 	if (sdp->sd_log_tr) {
-		gfs2_merge_trans(sdp->sd_log_tr, tr);
+		gfs2_merge_trans(sdp, tr);
 	} else if (tr->tr_num_buf_new || tr->tr_num_databuf_new) {
 		gfs2_assert_withdraw(sdp, test_bit(TR_ALLOCED, &tr->tr_flags));
 		sdp->sd_log_tr = tr;
-- 
2.25.1


