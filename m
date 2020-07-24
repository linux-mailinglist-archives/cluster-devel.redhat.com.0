Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0B84022CDD7
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 20:36:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595615784;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=juUMV9svM0/4pLjTVIQLBT0K04CvUwAbxNQ/SAhGVys=;
	b=DscTj+SibrmLOaRuRoXqk4/omWsbyeMAPrlL2MDlV5jvZ/xlNyrQc0wR9gh8cZve182vGX
	TnB5Lqn4E0Aui5oTEgs054Qmzup03I+1g/F1eMhcWggqOBXfOGSMT19nsV/GUti+/Vz0zt
	ktHFdyy0affJRSCX282x+RjWrlN4vRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-fObh8kGsN9q1xCH1uNUZgA-1; Fri, 24 Jul 2020 14:36:23 -0400
X-MC-Unique: fObh8kGsN9q1xCH1uNUZgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5647919200C1;
	Fri, 24 Jul 2020 18:36:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4703851C4F;
	Fri, 24 Jul 2020 18:36:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 315F31809557;
	Fri, 24 Jul 2020 18:36:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OIXDBG016312 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 14:33:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A64270599; Fri, 24 Jul 2020 18:33:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BA656FEFE
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 18:33:13 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 24 Jul 2020 13:33:02 -0500
Message-Id: <20200724183304.366913-10-rpeterso@redhat.com>
In-Reply-To: <20200724183304.366913-1-rpeterso@redhat.com>
References: <20200724183304.366913-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 09/11] gfs2: enhance log_blocks trace
	point to show log blocks free
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds some code to enhance the log_blocks trace point. It
reports the number of free log blocks, and also adds new trace points
for revoke writes that were previously missing.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c        | 12 ++++++++++--
 fs/gfs2/trace_gfs2.h |  9 ++++++---
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 665e287bf4f1..489b6f5c605d 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -716,16 +716,24 @@ void gfs2_write_revokes(struct gfs2_sbd *sdp)
 		atomic_dec(&sdp->sd_log_blks_free);
 		/* If no blocks have been reserved, we need to also
 		 * reserve a block for the header */
-		if (!sdp->sd_log_blks_reserved)
+		if (!sdp->sd_log_blks_reserved) {
 			atomic_dec(&sdp->sd_log_blks_free);
+			trace_gfs2_log_blocks(sdp, -2, 7);
+		} else {
+			trace_gfs2_log_blocks(sdp, -1, 7);
+		}
 	}
 	gfs2_ail1_empty(sdp, max_revokes);
 	gfs2_log_unlock(sdp);
 
 	if (!sdp->sd_log_num_revoke) {
 		atomic_inc(&sdp->sd_log_blks_free);
-		if (!sdp->sd_log_blks_reserved)
+		if (!sdp->sd_log_blks_reserved) {
 			atomic_inc(&sdp->sd_log_blks_free);
+			trace_gfs2_log_blocks(sdp, 2, 7);
+		} else {
+			trace_gfs2_log_blocks(sdp, 1, 7);
+		}
 	}
 }
 
diff --git a/fs/gfs2/trace_gfs2.h b/fs/gfs2/trace_gfs2.h
index 1c4aa666e7e0..9d28be2a8b69 100644
--- a/fs/gfs2/trace_gfs2.h
+++ b/fs/gfs2/trace_gfs2.h
@@ -52,7 +52,8 @@
 	{ 3, "gfs2_log_flush" }, \
 	{ 4, "gfs2_log_flush2" }, \
 	{ 5, "log_refund" }, \
-	{ 6, "init_journal" })
+	{ 6, "init_journal" }, \
+				     { 7, "gfs2_write_revokes" })
 
 #define show_glock_flags(flags) __print_flags(flags, "",	\
 	{(1UL << GLF_LOCK),			"l" },		\
@@ -398,17 +399,19 @@ TRACE_EVENT(gfs2_log_blocks,
 		__field(        dev_t,  dev                     )
 		__field(	int,	blocks			)
 		__field(	int,	caller			)
+		__field(	int,	blks_free		)
 	),
 
 	TP_fast_assign(
 		__entry->dev		= sdp->sd_vfs->s_dev;
 		__entry->blocks		= blocks;
 		__entry->caller		= caller;
+		__entry->blks_free	= atomic_read(&sdp->sd_log_blks_free);
 	),
 
-	TP_printk("%u,%u log reserve %d %s", MAJOR(__entry->dev),
+	TP_printk("%u,%u log reserve %d %s %d", MAJOR(__entry->dev),
 		  MINOR(__entry->dev), __entry->blocks,
-		  lbcaller(__entry->caller))
+		  lbcaller(__entry->caller), __entry->blks_free)
 );
 
 /* Writing back the AIL */
-- 
2.26.2

