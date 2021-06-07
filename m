Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1F939E199
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Jun 2021 18:13:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-NM1jArilOpucBXoQMUiRFA-1; Mon, 07 Jun 2021 12:12:58 -0400
X-MC-Unique: NM1jArilOpucBXoQMUiRFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D62B36D25A;
	Mon,  7 Jun 2021 16:12:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C56455D6D5;
	Mon,  7 Jun 2021 16:12:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1808544A5B;
	Mon,  7 Jun 2021 16:12:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 157GCmAA016292 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 7 Jun 2021 12:12:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D54A763536; Mon,  7 Jun 2021 16:12:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D004C621B9
	for <cluster-devel@redhat.com>; Mon,  7 Jun 2021 16:12:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D31A101D228
	for <cluster-devel@redhat.com>; Mon,  7 Jun 2021 16:12:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-48-BoEKH3nwM-GgyUMmRGxRBg-1; 
	Mon, 07 Jun 2021 12:12:44 -0400
X-MC-Unique: BoEKH3nwM-GgyUMmRGxRBg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B824613C8;
	Mon,  7 Jun 2021 16:12:42 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon,  7 Jun 2021 12:11:48 -0400
Message-Id: <20210607161215.3583176-22-sashal@kernel.org>
In-Reply-To: <20210607161215.3583176-1-sashal@kernel.org>
References: <20210607161215.3583176-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 157GCmAA016292
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.12 22/49] gfs2: Clean up revokes
	on normal withdraws
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit f5456b5d67cf812fd31fe3e130ca216b2e0908e5 ]

Before this patch, the system ail lists were cleaned up if the logd
process withdrew, but on other withdraws, they were not cleaned up.
This included the cleaning up of the revokes as well.

This patch reorganizes things a bit so that all withdraws (not just logd)
clean up the ail lists, including any pending revokes.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/log.c  | 6 +++---
 fs/gfs2/log.h  | 1 +
 fs/gfs2/lops.c | 7 ++++++-
 fs/gfs2/lops.h | 1 +
 fs/gfs2/util.c | 1 +
 5 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 6410281546f9..47287a7056fe 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -923,10 +923,10 @@ static void log_write_header(struct gfs2_sbd *sdp, u32 flags)
 }
 
 /**
- * ail_drain - drain the ail lists after a withdraw
+ * gfs2_ail_drain - drain the ail lists after a withdraw
  * @sdp: Pointer to GFS2 superblock
  */
-static void ail_drain(struct gfs2_sbd *sdp)
+void gfs2_ail_drain(struct gfs2_sbd *sdp)
 {
 	struct gfs2_trans *tr;
 
@@ -953,6 +953,7 @@ static void ail_drain(struct gfs2_sbd *sdp)
 		list_del(&tr->tr_list);
 		gfs2_trans_free(sdp, tr);
 	}
+	gfs2_drain_revokes(sdp);
 	spin_unlock(&sdp->sd_ail_lock);
 }
 
@@ -1159,7 +1160,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	if (tr && list_empty(&tr->tr_list))
 		list_add(&tr->tr_list, &sdp->sd_ail1_list);
 	spin_unlock(&sdp->sd_ail_lock);
-	ail_drain(sdp); /* frees all transactions */
 	tr = NULL;
 	goto out_end;
 }
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index eea58015710e..fc905c2af53c 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -93,5 +93,6 @@ extern int gfs2_logd(void *data);
 extern void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd);
 extern void gfs2_glock_remove_revoke(struct gfs2_glock *gl);
 extern void gfs2_flush_revokes(struct gfs2_sbd *sdp);
+extern void gfs2_ail_drain(struct gfs2_sbd *sdp);
 
 #endif /* __LOG_DOT_H__ */
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index a82f4747aa8d..ef44d325e518 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -882,7 +882,7 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	gfs2_log_write_page(sdp, page);
 }
 
-static void revoke_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
+void gfs2_drain_revokes(struct gfs2_sbd *sdp)
 {
 	struct list_head *head = &sdp->sd_log_revokes;
 	struct gfs2_bufdata *bd;
@@ -897,6 +897,11 @@ static void revoke_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	}
 }
 
+static void revoke_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
+{
+	gfs2_drain_revokes(sdp);
+}
+
 static void revoke_lo_before_scan(struct gfs2_jdesc *jd,
 				  struct gfs2_log_header_host *head, int pass)
 {
diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
index 31b6dd0d2e5d..f707601597dc 100644
--- a/fs/gfs2/lops.h
+++ b/fs/gfs2/lops.h
@@ -20,6 +20,7 @@ extern void gfs2_log_submit_bio(struct bio **biop, int opf);
 extern void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh);
 extern int gfs2_find_jhead(struct gfs2_jdesc *jd,
 			   struct gfs2_log_header_host *head, bool keep_cache);
+extern void gfs2_drain_revokes(struct gfs2_sbd *sdp);
 static inline unsigned int buf_limit(struct gfs2_sbd *sdp)
 {
 	return sdp->sd_ldptrs;
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 4f034b87b427..cffb346fb9b3 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -130,6 +130,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 	if (test_bit(SDF_NORECOVERY, &sdp->sd_flags) || !sdp->sd_jdesc)
 		return;
 
+	gfs2_ail_drain(sdp); /* frees all transactions */
 	inode = sdp->sd_jdesc->jd_inode;
 	ip = GFS2_I(inode);
 	i_gl = ip->i_gl;
-- 
2.30.2


