Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D376522CDD1
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 20:33:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595615604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3OxGX5nkRoT75FAMKedfPUghX85j6wueMqbw6qx6Ac4=;
	b=OwgYKYcnasdKoAg0VB9LkeuejK0++u2eGfM7lz23C3t413a1l1fyj4uG4OPbOjL/qSAU9Y
	/gYv9e2z8DFzSXMhUJQul9SlyQutcCONaKbGFNjRpzOpCg89N8PCKN4K53sEw9cdTROIEJ
	2HXXnOGIhryaTCkLqEYTrClmww/C778=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-ZQWJu-FIM5CH8rAzWxsyDg-1; Fri, 24 Jul 2020 14:33:22 -0400
X-MC-Unique: ZQWJu-FIM5CH8rAzWxsyDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23C2F100A68C;
	Fri, 24 Jul 2020 18:33:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 124B71009940;
	Fri, 24 Jul 2020 18:33:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00019A3595;
	Fri, 24 Jul 2020 18:33:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OIXDLb016307 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 14:33:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F2EE70599; Fri, 24 Jul 2020 18:33:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 101116FEFE
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 18:33:13 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 24 Jul 2020 13:33:01 -0500
Message-Id: <20200724183304.366913-9-rpeterso@redhat.com>
In-Reply-To: <20200724183304.366913-1-rpeterso@redhat.com>
References: <20200724183304.366913-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 08/11] gfs2: Add caller info to
	log_blocks trace point
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

The log_blocks kernel trace point becomes much more useful if we know
from whence the call was made. This patch adds caller info to the trace
point.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c        | 12 ++++++------
 fs/gfs2/ops_fstype.c |  2 +-
 fs/gfs2/trace_gfs2.h | 20 ++++++++++++++++----
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index a58333e3980d..665e287bf4f1 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -396,7 +396,7 @@ void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks)
 {
 
 	atomic_add(blks, &sdp->sd_log_blks_free);
-	trace_gfs2_log_blocks(sdp, blks);
+	trace_gfs2_log_blocks(sdp, blks, 0);
 	gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
 				  sdp->sd_jdesc->jd_blocks);
 	up_read(&sdp->sd_log_flush_lock);
@@ -457,7 +457,7 @@ int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
 		goto retry;
 	}
 	atomic_sub(blks, &sdp->sd_log_blks_needed);
-	trace_gfs2_log_blocks(sdp, -blks);
+	trace_gfs2_log_blocks(sdp, -blks, 1);
 
 	/*
 	 * If we waited, then so might others, wake them up _after_ we get
@@ -576,7 +576,7 @@ static void log_pull_tail(struct gfs2_sbd *sdp, unsigned int new_tail)
 	ail2_empty(sdp, new_tail);
 
 	atomic_add(dist, &sdp->sd_log_blks_free);
-	trace_gfs2_log_blocks(sdp, dist);
+	trace_gfs2_log_blocks(sdp, dist, 2);
 	gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
 			     sdp->sd_jdesc->jd_blocks);
 
@@ -966,7 +966,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 		log_write_header(sdp, flags);
 	} else if (sdp->sd_log_tail != current_tail(sdp) && !sdp->sd_log_idle){
 		atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buffer */
-		trace_gfs2_log_blocks(sdp, -1);
+		trace_gfs2_log_blocks(sdp, -1, 3);
 		log_write_header(sdp, flags);
 	}
 	if (gfs2_withdrawn(sdp))
@@ -992,7 +992,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 			if (gfs2_withdrawn(sdp))
 				goto out;
 			atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buffer */
-			trace_gfs2_log_blocks(sdp, -1);
+			trace_gfs2_log_blocks(sdp, -1, 4);
 			log_write_header(sdp, flags);
 			sdp->sd_log_head = sdp->sd_log_flush_head;
 		}
@@ -1075,7 +1075,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	gfs2_assert_withdraw(sdp, maxres >= reserved);
 	unused = maxres - reserved;
 	atomic_add(unused, &sdp->sd_log_blks_free);
-	trace_gfs2_log_blocks(sdp, unused);
+	trace_gfs2_log_blocks(sdp, unused, 5);
 	gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
 			     sdp->sd_jdesc->jd_blocks);
 	sdp->sd_log_blks_reserved = reserved;
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 6d18d2c91add..b2538eea3e5e 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -688,7 +688,7 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 		/* Map the extents for this journal's blocks */
 		gfs2_map_journal_extents(sdp, sdp->sd_jdesc);
 	}
-	trace_gfs2_log_blocks(sdp, atomic_read(&sdp->sd_log_blks_free));
+	trace_gfs2_log_blocks(sdp, atomic_read(&sdp->sd_log_blks_free), 6);
 
 	if (sdp->sd_lockstruct.ls_first) {
 		unsigned int x;
diff --git a/fs/gfs2/trace_gfs2.h b/fs/gfs2/trace_gfs2.h
index e0025258107a..1c4aa666e7e0 100644
--- a/fs/gfs2/trace_gfs2.h
+++ b/fs/gfs2/trace_gfs2.h
@@ -45,6 +45,15 @@
 					 { 2, "ins " },	\
 					 { 3, "clm " })
 
+#define lbcaller(x) __print_symbolic(x, \
+	{ 0, "gfs2_log_release" }, \
+	{ 1, "gfs2_log_reserve" }, \
+	{ 2, "log_pull_tail" },	   \
+	{ 3, "gfs2_log_flush" }, \
+	{ 4, "gfs2_log_flush2" }, \
+	{ 5, "log_refund" }, \
+	{ 6, "init_journal" })
+
 #define show_glock_flags(flags) __print_flags(flags, "",	\
 	{(1UL << GLF_LOCK),			"l" },		\
 	{(1UL << GLF_DEMOTE),			"D" },		\
@@ -381,22 +390,25 @@ TRACE_EVENT(gfs2_log_flush,
 /* Reserving/releasing blocks in the log */
 TRACE_EVENT(gfs2_log_blocks,
 
-	TP_PROTO(const struct gfs2_sbd *sdp, int blocks),
+	TP_PROTO(const struct gfs2_sbd *sdp, int blocks, int caller),
 
-	TP_ARGS(sdp, blocks),
+	TP_ARGS(sdp, blocks, caller),
 
 	TP_STRUCT__entry(
 		__field(        dev_t,  dev                     )
 		__field(	int,	blocks			)
+		__field(	int,	caller			)
 	),
 
 	TP_fast_assign(
 		__entry->dev		= sdp->sd_vfs->s_dev;
 		__entry->blocks		= blocks;
+		__entry->caller		= caller;
 	),
 
-	TP_printk("%u,%u log reserve %d", MAJOR(__entry->dev),
-		  MINOR(__entry->dev), __entry->blocks)
+	TP_printk("%u,%u log reserve %d %s", MAJOR(__entry->dev),
+		  MINOR(__entry->dev), __entry->blocks,
+		  lbcaller(__entry->caller))
 );
 
 /* Writing back the AIL */
-- 
2.26.2

