Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1F0243F8F
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Aug 2020 22:01:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597348889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eLo6oaoIlT/DHgGH821xP7anZU2/1A3SgiWL/YvnNek=;
	b=jG7eQrED9lged2A3AFNsy/kRDPB/qwZxQ3fGIuJI50pdgSnjyWyAv3Tx3ZDcdSIjVx8wX5
	OMpU3d3RR9Sf5qljP2LuAAaMbn73iQJ7Cz0+YXU87kgD7DA07Xjeht9X2VxYPTTeiIWmps
	44Np5TZ3rwsbuGonYUWCgg6vtvLDpnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-qjq_dFz1OqOBwEJ9yFiGOw-1; Thu, 13 Aug 2020 16:01:27 -0400
X-MC-Unique: qjq_dFz1OqOBwEJ9yFiGOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 738ED18B9F40;
	Thu, 13 Aug 2020 20:01:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F5B819C78;
	Thu, 13 Aug 2020 20:01:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1810C4EE17;
	Thu, 13 Aug 2020 20:01:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DK1JFj024970 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 16:01:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95A1C5D9F3; Thu, 13 Aug 2020 20:01:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 679225D9D2
	for <cluster-devel@redhat.com>; Thu, 13 Aug 2020 20:01:19 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 13 Aug 2020 15:01:13 -0500
Message-Id: <20200813200114.5665-3-adas@redhat.com>
In-Reply-To: <20200813200114.5665-1-adas@redhat.com>
References: <20200813200114.5665-1-adas@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/3] gfs2: Add fields for statfs info in
	struct gfs2_log_header_host
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

And read these in __get_log_header() from the log header.
Also make gfs2_statfs_change_out() non-static so it can be used
outside of super.c

Signed-off-by: Abhi Das <adas@redhat.com>
---
 fs/gfs2/incore.h   | 4 ++++
 fs/gfs2/recovery.c | 4 ++++
 fs/gfs2/super.c    | 2 +-
 fs/gfs2/super.h    | 2 ++
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index ca2ec02436ec..9fc12206a3ad 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -41,6 +41,10 @@ struct gfs2_log_header_host {
 	u32 lh_flags;		/* GFS2_LOG_HEAD_... */
 	u32 lh_tail;		/* Block number of log tail */
 	u32 lh_blkno;
+
+	s64 lh_local_total;
+	s64 lh_local_free;
+	s64 lh_local_dinodes;
 };
 
 /*
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 390ea79d682c..a8bb17e355b8 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -144,6 +144,10 @@ int __get_log_header(struct gfs2_sbd *sdp, const struct gfs2_log_header *lh,
 	head->lh_tail = be32_to_cpu(lh->lh_tail);
 	head->lh_blkno = be32_to_cpu(lh->lh_blkno);
 
+	head->lh_local_total = be64_to_cpu(lh->lh_local_total);
+	head->lh_local_free = be64_to_cpu(lh->lh_local_free);
+	head->lh_local_dinodes = be64_to_cpu(lh->lh_local_dinodes);
+
 	return 0;
 }
 /**
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 9f4d9e7be839..4c51d30d65c5 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -224,7 +224,7 @@ void gfs2_statfs_change_in(struct gfs2_statfs_change_host *sc, const void *buf)
 	sc->sc_dinodes = be64_to_cpu(str->sc_dinodes);
 }
 
-static void gfs2_statfs_change_out(const struct gfs2_statfs_change_host *sc, void *buf)
+void gfs2_statfs_change_out(const struct gfs2_statfs_change_host *sc, void *buf)
 {
 	struct gfs2_statfs_change *str = buf;
 
diff --git a/fs/gfs2/super.h b/fs/gfs2/super.h
index 51900554ed81..ed4f5cb29074 100644
--- a/fs/gfs2/super.h
+++ b/fs/gfs2/super.h
@@ -37,6 +37,8 @@ extern void gfs2_statfs_change(struct gfs2_sbd *sdp, s64 total, s64 free,
 			       s64 dinodes);
 extern void gfs2_statfs_change_in(struct gfs2_statfs_change_host *sc,
 				  const void *buf);
+extern void gfs2_statfs_change_out(const struct gfs2_statfs_change_host *sc,
+				   void *buf);
 extern void update_statfs(struct gfs2_sbd *sdp, struct buffer_head *m_bh,
 			  struct buffer_head *l_bh);
 extern int gfs2_statfs_sync(struct super_block *sb, int type);
-- 
2.20.1

