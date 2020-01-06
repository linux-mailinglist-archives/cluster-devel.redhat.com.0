Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 862711318D3
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Jan 2020 20:37:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578339455;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=oN3DA/7ZCN+EryYsAS7UyOf+rW5dJGVteLpE+jxPio0=;
	b=JBGzpxoz2dcSlXllxwSzwodAp0oEjmTaYwVnaWADShI3En1PP8KUIG4T90NO8/TUIY9pAb
	Dp8NgBuQgHsnvsURHfhJB+9513XkVDqaRgq49kqjmV7us9m8sKJGaF92dMhvWIytms9tCY
	hRoIU86T0HKM4w/nyWFiTy0eYijVCXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-eAEpeEVIOmm-mGB3ZsGWRw-1; Mon, 06 Jan 2020 14:37:33 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B00510054E3;
	Mon,  6 Jan 2020 19:37:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2626A6A846;
	Mon,  6 Jan 2020 19:37:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8031E18089C8;
	Mon,  6 Jan 2020 19:37:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006JbRCw029858 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 14:37:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8A5AB60CC0; Mon,  6 Jan 2020 19:37:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82A9060C88
	for <cluster-devel@redhat.com>; Mon,  6 Jan 2020 19:37:25 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0486981C69
	for <cluster-devel@redhat.com>; Mon,  6 Jan 2020 19:37:25 +0000 (UTC)
Date: Mon, 6 Jan 2020 14:37:24 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <984303382.749084.1578339444962.JavaMail.zimbra@redhat.com>
In-Reply-To: <2097861270.749038.1578339383372.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.64, 10.4.195.13]
Thread-Topic: gfs2: keep a redirty list for jdata pages that are PageChecked
	in ail1
Thread-Index: MLlFAo7CCMZj66zumeaHWIWTB3pmBA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: keep a redirty list for jdata
 pages that are PageChecked in ail1
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
X-MC-Unique: eAEpeEVIOmm-mGB3ZsGWRw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Before this patch, jdata writes would sometimes get into an infinite
loop because function gfs2_ail1_flush refused to exit until all of
its pages were written out, but if the page was in use and another
process sets PageChecked, it would never be written out.

This patch adds a new queue to the transactions, tr_redirty_list.
This temporarily holds buffer descriptor (bd / bufdata) elements
that need to be requeued for next time because they're PageChecked.

The new queue allows all eligible pages to be written properly and
gfs2_ail1_flush to requeue and redirty PageChecked pages.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h |  1 +
 fs/gfs2/log.c    | 27 +++++++++++++++++++++++++++
 fs/gfs2/trans.c  |  1 +
 3 files changed, 29 insertions(+)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index e09859384559..82f033e89367 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -513,6 +513,7 @@ struct gfs2_trans {
 	unsigned int tr_first;
 	struct list_head tr_ail1_list;
 	struct list_head tr_ail2_list;
+	struct list_head tr_redirty_list;
 };
 
 struct gfs2_journal_extent {
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 66189ae62c1d..ef4a20d470c1 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -119,6 +119,10 @@ __acquires(&sdp->sd_ail_lock)
 		if (gl == bd->bd_gl)
 			continue;
 		gl = bd->bd_gl;
+		if (PageChecked(bh->b_page)) {
+			list_move(&bd->bd_ail_st_list, &tr->tr_redirty_list);
+			continue;
+		}
 		list_move(&bd->bd_ail_st_list, &tr->tr_ail1_list);
 		mapping = bh->b_page->mapping;
 		if (!mapping)
@@ -219,11 +223,21 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
  * @sdp: The superblock
  *
  * Tries to empty the ail1 lists, starting with the oldest first
+ * Then it requeues any buffers that need to be redirtied, to the ail1 list.
+ * It returns true if the ail1 list was empty BEFORE the redirtied entries
+ * were requeued.
  */
 
 static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
 {
 	struct gfs2_trans *tr, *s;
+	struct gfs2_bufdata *bd;
+	struct writeback_control wbc = {
+		.sync_mode = WB_SYNC_NONE,
+		.nr_to_write = LONG_MAX,
+		.range_start = 0,
+		.range_end = LLONG_MAX,
+	};
 	int oldest_tr = 1;
 	int ret;
 	bool withdraw = false;
@@ -237,6 +251,19 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
 			oldest_tr = 0;
 	}
 	ret = list_empty(&sdp->sd_ail1_list);
+	/*
+	 * Now requeue and redirty any bufdata elements that were not written
+	 * because they were PageChecked.
+	 */
+	list_for_each_entry_reverse(tr, &sdp->sd_ail1_list, tr_list) {
+		while (!list_empty(&tr->tr_redirty_list)) {
+			bd = list_first_entry(&tr->tr_redirty_list,
+					      struct gfs2_bufdata,
+					      bd_ail_st_list);
+			redirty_page_for_writepage(&wbc, bd->bd_bh->b_page);
+			list_move(&bd->bd_ail_st_list, &tr->tr_ail1_list);
+		}
+	}
 	spin_unlock(&sdp->sd_ail_lock);
 
 	if (withdraw)
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 60369f9950e2..73afef62bf3f 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -52,6 +52,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 		tr->tr_reserved += gfs2_struct2blk(sdp, revokes);
 	INIT_LIST_HEAD(&tr->tr_databuf);
 	INIT_LIST_HEAD(&tr->tr_buf);
+	INIT_LIST_HEAD(&tr->tr_redirty_list);
 
 	sb_start_intwrite(sdp->sd_vfs);
 

