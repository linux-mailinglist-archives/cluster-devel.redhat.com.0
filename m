Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6059B7879F5
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692911472;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3E/DjYBtrPQldjdJR84o32bb+mSTt1+YvBh2I5xGMcs=;
	b=Tv8XFvVtZAkHxXwQQadLDs4iNv4r/luUrfF9Cvb349O1tIBr6SbSA2BLP79O9NDvYdyJ55
	4VJS6xPbThzPA9PdVbY+3plXsIPETdda8YL6LkB6Tz95tefNtOfVPNYqde9hluhs8RtKRr
	rlxBrFVMbylPm58F+DxvasZo9669sRA=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-mHUoQPQkM3-PKST_chj0yw-1; Thu, 24 Aug 2023 17:11:06 -0400
X-MC-Unique: mHUoQPQkM3-PKST_chj0yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDBF31C068E2;
	Thu, 24 Aug 2023 21:11:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E31166B59D;
	Thu, 24 Aug 2023 21:11:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 68B4F19465B7;
	Thu, 24 Aug 2023 21:11:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 56D4E19465A3 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:11:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 44E39492C18; Thu, 24 Aug 2023 21:11:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA212492C3A;
 Thu, 24 Aug 2023 21:11:03 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Aug 2023 23:10:59 +0200
Message-Id: <20230824211101.3242346-3-agruenba@redhat.com>
In-Reply-To: <20230824211101.3242346-1-agruenba@redhat.com>
References: <20230824211101.3242346-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 2/4] gfs2: low-memory forced flush fixes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Function gfs2_ail_flush_reqd checks the SDF_FORCE_AIL_FLUSH flag to
determine if an AIL flush should be forced in low-memory situations.
However, it also immediately clears the flag, and when called repeatedly
as in function gfs2_logd, the flag will be lost.  Fix that by pulling
the SDF_FORCE_AIL_FLUSH flag check out of gfs2_ail_flush_reqd.

In addition, in gfs2_writepages, logd needs to be woken up after setting
the SDF_FORCE_AIL_FLUSH flag.

Fixes: b066a4eebd4f ("gfs2: forcibly flush ail to relieve memory pressure")
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c | 4 +++-
 fs/gfs2/log.c  | 8 ++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 5f02542370c4..d15a10a18962 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -189,8 +189,10 @@ static int gfs2_writepages(struct address_space *mapping,
 	 * pages held in the ail that it can't find.
 	 */
 	ret = iomap_writepages(mapping, wbc, &wpc, &gfs2_writeback_ops);
-	if (ret == 0)
+	if (ret == 0) {
 		set_bit(SDF_FORCE_AIL_FLUSH, &sdp->sd_flags);
+		wake_up(&sdp->sd_logd_waitq);
+	}
 	return ret;
 }
 
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index d3da259820e3..aaca22f2aa2d 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1282,9 +1282,6 @@ static inline int gfs2_ail_flush_reqd(struct gfs2_sbd *sdp)
 {
 	unsigned int used_blocks = sdp->sd_jdesc->jd_blocks - atomic_read(&sdp->sd_log_blks_free);
 
-	if (test_and_clear_bit(SDF_FORCE_AIL_FLUSH, &sdp->sd_flags))
-		return 1;
-
 	return used_blocks + atomic_read(&sdp->sd_log_blks_needed) >=
 		atomic_read(&sdp->sd_log_thresh2);
 }
@@ -1325,7 +1322,9 @@ int gfs2_logd(void *data)
 						  GFS2_LFC_LOGD_JFLUSH_REQD);
 		}
 
-		if (gfs2_ail_flush_reqd(sdp)) {
+		if (test_bit(SDF_FORCE_AIL_FLUSH, &sdp->sd_flags) ||
+		    gfs2_ail_flush_reqd(sdp)) {
+			clear_bit(SDF_FORCE_AIL_FLUSH, &sdp->sd_flags);
 			gfs2_ail1_start(sdp);
 			gfs2_ail1_wait(sdp);
 			gfs2_ail1_empty(sdp, 0);
@@ -1338,6 +1337,7 @@ int gfs2_logd(void *data)
 		try_to_freeze();
 
 		t = wait_event_interruptible_timeout(sdp->sd_logd_waitq,
+				test_bit(SDF_FORCE_AIL_FLUSH, &sdp->sd_flags) ||
 				gfs2_ail_flush_reqd(sdp) ||
 				gfs2_jrnl_flush_reqd(sdp) ||
 				kthread_should_stop(),
-- 
2.40.1

