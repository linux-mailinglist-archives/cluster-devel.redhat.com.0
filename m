Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E7E6A1F03D0
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:22:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402952;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZAycnTTrJXQWRlL43GH//V/cfMi6d9xyFsV5Q2URIco=;
	b=AsJRDqTRk9EwIJe86FRBuMk1Zz3ii5xWwhf/bXbj5mCF/3fJNaitpRJ1oBF4/7XjxBUJTp
	oWFmRBrO7LD9Qf3fYDP9bwfpjSlc0t3Gz4BNG6hJo0BmKLIcnqV4bGoylgIijKq8mNZj6S
	wij3Q3wShKjsbi7X0c+mlABAQow9pHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-3FRIQsE3P8SFQSeA_Ps_5g-1; Fri, 05 Jun 2020 20:22:31 -0400
X-MC-Unique: 3FRIQsE3P8SFQSeA_Ps_5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD697A0C05;
	Sat,  6 Jun 2020 00:22:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EBE25D9C5;
	Sat,  6 Jun 2020 00:22:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C9561809554;
	Sat,  6 Jun 2020 00:22:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055Gl88A020684 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 12:47:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DB317B610; Fri,  5 Jun 2020 16:47:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-115-80.phx2.redhat.com [10.3.115.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37B987B60D
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 16:47:08 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  5 Jun 2020 11:46:58 -0500
Message-Id: <20200605164701.30776-4-rpeterso@redhat.com>
In-Reply-To: <20200605164701.30776-1-rpeterso@redhat.com>
References: <20200605164701.30776-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 3/6] gfs2: instrumentation wrt
	log_flush stuck
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

This adds checks for gfs2_log_flush being stuck, similarly to the check
in gfs2_ail1_flush. To faciliate this and make the strings easy to grep
we move the ail1 emptying to its own function, empty_ail1_list.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 0644e58c6191..fcc7f58d74f0 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -145,9 +145,6 @@ static void dump_ail_list(struct gfs2_sbd *sdp)
 	struct gfs2_bufdata *bd;
 	struct buffer_head *bh;
 
-	fs_err(sdp, "Error: In gfs2_ail1_flush for ten minutes! t=%d\n",
-	       current->journal_info ? 1 : 0);
-
 	list_for_each_entry_reverse(tr, &sdp->sd_ail1_list, tr_list) {
 		list_for_each_entry_reverse(bd, &tr->tr_ail1_list,
 					    bd_ail_st_list) {
@@ -197,6 +194,8 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control *wbc)
 restart:
 	ret = 0;
 	if (time_after(jiffies, flush_start + (HZ * 600))) {
+		fs_err(sdp, "Error: In %s for ten minutes! t=%d\n",
+		       __func__, current->journal_info ? 1 : 0);
 		dump_ail_list(sdp);
 		goto out;
 	}
@@ -876,6 +875,28 @@ static void ail_drain(struct gfs2_sbd *sdp)
 	spin_unlock(&sdp->sd_ail_lock);
 }
 
+/**
+ * empty_ail1_list - try to start IO and empty the ail1 list
+ * @sdp: Pointer to GFS2 superblock
+ */
+static void empty_ail1_list(struct gfs2_sbd *sdp)
+{
+	unsigned long start = jiffies;
+
+	for (;;) {
+		if (time_after(jiffies, start + (HZ * 600))) {
+			fs_err(sdp, "Error: In %s for 10 minutes! t=%d\n",
+			       __func__, current->journal_info ? 1 : 0);
+			dump_ail_list(sdp);
+			return;
+		}
+		gfs2_ail1_start(sdp);
+		gfs2_ail1_wait(sdp);
+		if (gfs2_ail1_empty(sdp, 0))
+			return;
+	}
+}
+
 /**
  * gfs2_log_flush - flush incore transaction(s)
  * @sdp: the filesystem
@@ -965,12 +986,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 
 	if (!(flags & GFS2_LOG_HEAD_FLUSH_NORMAL)) {
 		if (!sdp->sd_log_idle) {
-			for (;;) {
-				gfs2_ail1_start(sdp);
-				gfs2_ail1_wait(sdp);
-				if (gfs2_ail1_empty(sdp, 0))
-					break;
-			}
+			empty_ail1_list(sdp);
 			if (gfs2_withdrawn(sdp))
 				goto out;
 			atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buffer */
-- 
2.26.2

