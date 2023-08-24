Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 034427879F6
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692911473;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u/8Dhdb/fI8j1HZGqLzWA8D6IXCUN3mPMngafA6caqw=;
	b=S2ySNyeQMXbqNTbPgq0h5U6G0y0guz+sGu6PsQmAHNJL4bCpxophvzZz85o8PMzpBUBpz7
	x11CaGfSPV1jr8xUomc1JR1hgeMpbxK76gw5qQcHP43sGtyjHJHUb8pGSt7H+lHvzgJsnN
	/ZipBt8LpaM3V0Kj8vsuMzGWC6iTCA8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-flnNxH18ODyt7i1wUUVgaQ-1; Thu, 24 Aug 2023 17:11:07 -0400
X-MC-Unique: flnNxH18ODyt7i1wUUVgaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D136185A7A5;
	Thu, 24 Aug 2023 21:11:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81E631121319;
	Thu, 24 Aug 2023 21:11:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4CF9919465A8;
	Thu, 24 Aug 2023 21:11:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 015481946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:11:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C5BAF492C3C; Thu, 24 Aug 2023 21:11:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46E5E492C14;
 Thu, 24 Aug 2023 21:11:05 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:11:01 +0200
Message-Id: <20230824211101.3242346-5-agruenba@redhat.com>
In-Reply-To: <20230824211101.3242346-1-agruenba@redhat.com>
References: <20230824211101.3242346-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 4/4] gfs2: journal flush threshold fixes and
 cleanup
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Commit f07b35202148 ("GFS2: Made logd daemon take into account log
demand") changed gfs2_ail_flush_reqd() and gfs2_jrnl_flush_reqd() to
take sd_log_blks_needed into account, but the checks in
gfs2_log_commit() were not updated correspondingly.

Once that is fixed, gfs2_jrnl_flush_reqd() and gfs2_ail_flush_reqd() can
be used in gfs2_log_commit().  Make those two helpers available to
gfs2_log_commit() by defining them above gfs2_log_commit().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index abe4397dc59b..addf4ce0bedd 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1227,6 +1227,21 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	gfs2_log_unlock(sdp);
 }
 
+static inline int gfs2_jrnl_flush_reqd(struct gfs2_sbd *sdp)
+{
+	return atomic_read(&sdp->sd_log_pinned) +
+	       atomic_read(&sdp->sd_log_blks_needed) >=
+	       atomic_read(&sdp->sd_log_thresh1);
+}
+
+static inline int gfs2_ail_flush_reqd(struct gfs2_sbd *sdp)
+{
+	return sdp->sd_jdesc->jd_blocks -
+	       atomic_read(&sdp->sd_log_blks_free) +
+	       atomic_read(&sdp->sd_log_blks_needed) >=
+	       atomic_read(&sdp->sd_log_thresh2);
+}
+
 /**
  * gfs2_log_commit - Commit a transaction to the log
  * @sdp: the filesystem
@@ -1246,9 +1261,7 @@ void gfs2_log_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 {
 	log_refund(sdp, tr);
 
-	if (atomic_read(&sdp->sd_log_pinned) > atomic_read(&sdp->sd_log_thresh1) ||
-	    ((sdp->sd_jdesc->jd_blocks - atomic_read(&sdp->sd_log_blks_free)) >
-	    atomic_read(&sdp->sd_log_thresh2)))
+	if (gfs2_ail_flush_reqd(sdp) || gfs2_jrnl_flush_reqd(sdp))
 		wake_up(&sdp->sd_logd_waitq);
 }
 
@@ -1271,21 +1284,6 @@ static void gfs2_log_shutdown(struct gfs2_sbd *sdp)
 	gfs2_assert_warn(sdp, list_empty(&sdp->sd_ail2_list));
 }
 
-static inline int gfs2_jrnl_flush_reqd(struct gfs2_sbd *sdp)
-{
-	return (atomic_read(&sdp->sd_log_pinned) +
-		atomic_read(&sdp->sd_log_blks_needed) >=
-		atomic_read(&sdp->sd_log_thresh1));
-}
-
-static inline int gfs2_ail_flush_reqd(struct gfs2_sbd *sdp)
-{
-	unsigned int used_blocks = sdp->sd_jdesc->jd_blocks - atomic_read(&sdp->sd_log_blks_free);
-
-	return used_blocks + atomic_read(&sdp->sd_log_blks_needed) >=
-		atomic_read(&sdp->sd_log_thresh2);
-}
-
 /**
  * gfs2_logd - Update log tail as Active Items get flushed to in-place blocks
  * @data: Pointer to GFS2 superblock
-- 
2.40.1

