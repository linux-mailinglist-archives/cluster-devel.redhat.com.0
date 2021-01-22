Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BE1CE3008FB
	for <lists+cluster-devel@lfdr.de>; Fri, 22 Jan 2021 17:51:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611334307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+Eo2bi5s6p8trZ1VP4orbNfANaC7tz/F8dKhtHWLZwk=;
	b=VciAb3k/ZDW7YiRhtwekpwy+sjPD0FizMTRMkIP/VuG/x14H8nUuUfm2+SvToYe+Jf1hKp
	6NOBeSkZubfHcF9zwKC4niua7lW4+0hVpaQTllluXfR0/N7+bPQoHBvQCwyFz1GU8Hu2RR
	Cy2REFcUTJTsoaFxuPiApxGlG1VDe1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-rYupw9puP0yw7RV7GZ13Sw-1; Fri, 22 Jan 2021 11:51:45 -0500
X-MC-Unique: rYupw9puP0yw7RV7GZ13Sw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB790180A09E;
	Fri, 22 Jan 2021 16:51:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B12C519C71;
	Fri, 22 Jan 2021 16:51:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB7F11809C9F;
	Fri, 22 Jan 2021 16:51:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MGpToR005684 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 11:51:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5B8C260939; Fri, 22 Jan 2021 16:51:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56C3860916
	for <cluster-devel@redhat.com>; Fri, 22 Jan 2021 16:51:26 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1277B18095FF
	for <cluster-devel@redhat.com>; Fri, 22 Jan 2021 16:51:26 +0000 (UTC)
Date: Fri, 22 Jan 2021 11:51:25 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <532932834.49228184.1611334285990.JavaMail.zimbra@redhat.com>
In-Reply-To: <1347847193.49228160.1611334275663.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.58, 10.4.195.3]
Thread-Topic: gfs2: keep bios separate for each journal
Thread-Index: d/nowCYZmtKE27D6Kh5R2iVafbwl7w==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: keep bios separate for each
	journal
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

The recovery func can recover multiple journals, but they were all using
the same bio. This resulted in use-after-free related to sdp->sd_log_bio.
This patch moves the variable to the journal descriptor, jd, so that
every recovery can operate on its own bio. And hopefully we never run out.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h   |  2 +-
 fs/gfs2/log.c      |  6 +++---
 fs/gfs2/lops.c     | 14 ++++++++------
 fs/gfs2/lops.h     |  5 +++--
 fs/gfs2/recovery.c |  2 +-
 5 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 8e1ab8ed4abc..9933af070121 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -531,6 +531,7 @@ struct gfs2_jdesc {
 	unsigned int nr_extents;
 	struct work_struct jd_work;
 	struct inode *jd_inode;
+	struct bio *jd_log_bio;
 	unsigned long jd_flags;
 #define JDF_RECOVERY 1
 	unsigned int jd_jid;
@@ -844,7 +845,6 @@ struct gfs2_sbd {
 
 	struct rw_semaphore sd_log_flush_lock;
 	atomic_t sd_log_in_flight;
-	struct bio *sd_log_bio;
 	wait_queue_head_t sd_log_flush_wait;
 	int sd_log_error; /* First log error */
 	wait_queue_head_t sd_withdraw_wait;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 41d13f19d1b4..d3fa14ec2c44 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -822,8 +822,8 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 		     sb->s_blocksize - LH_V1_SIZE - 4);
 	lh->lh_crc = cpu_to_be32(crc);
 
-	gfs2_log_write(sdp, page, sb->s_blocksize, 0, dblock);
-	gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE | op_flags);
+	gfs2_log_write(sdp, jd, page, sb->s_blocksize, 0, dblock);
+	gfs2_log_submit_bio(&jd->jd_log_bio, REQ_OP_WRITE | op_flags);
 out:
 	log_flush_wait(sdp);
 }
@@ -999,7 +999,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	lops_before_commit(sdp, tr);
 	if (gfs2_withdrawn(sdp))
 		goto out_withdraw;
-	gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE);
+	gfs2_log_submit_bio(&sdp->sd_jdesc->jd_log_bio, REQ_OP_WRITE);
 	if (gfs2_withdrawn(sdp))
 		goto out_withdraw;
 
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 9e9dd486bed9..921e156d3181 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -322,17 +322,18 @@ static struct bio *gfs2_log_get_bio(struct gfs2_sbd *sdp, u64 blkno,
  * then add the page segment to that.
  */
 
-void gfs2_log_write(struct gfs2_sbd *sdp, struct page *page,
-		    unsigned size, unsigned offset, u64 blkno)
+void gfs2_log_write(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
+		    struct page *page, unsigned size, unsigned offset,
+		    u64 blkno)
 {
 	struct bio *bio;
 	int ret;
 
-	bio = gfs2_log_get_bio(sdp, blkno, &sdp->sd_log_bio, REQ_OP_WRITE,
+	bio = gfs2_log_get_bio(sdp, blkno, &jd->jd_log_bio, REQ_OP_WRITE,
 			       gfs2_end_log_write, false);
 	ret = bio_add_page(bio, page, size, offset);
 	if (ret == 0) {
-		bio = gfs2_log_get_bio(sdp, blkno, &sdp->sd_log_bio,
+		bio = gfs2_log_get_bio(sdp, blkno, &jd->jd_log_bio,
 				       REQ_OP_WRITE, gfs2_end_log_write, true);
 		ret = bio_add_page(bio, page, size, offset);
 		WARN_ON(ret == 0);
@@ -355,7 +356,8 @@ static void gfs2_log_write_bh(struct gfs2_sbd *sdp, struct buffer_head *bh)
 
 	dblock = gfs2_log_bmap(sdp->sd_jdesc, sdp->sd_log_flush_head);
 	gfs2_log_incr_head(sdp);
-	gfs2_log_write(sdp, bh->b_page, bh->b_size, bh_offset(bh), dblock);
+	gfs2_log_write(sdp, sdp->sd_jdesc, bh->b_page, bh->b_size,
+		       bh_offset(bh), dblock);
 }
 
 /**
@@ -376,7 +378,7 @@ static void gfs2_log_write_page(struct gfs2_sbd *sdp, struct page *page)
 
 	dblock = gfs2_log_bmap(sdp->sd_jdesc, sdp->sd_log_flush_head);
 	gfs2_log_incr_head(sdp);
-	gfs2_log_write(sdp, page, sb->s_blocksize, 0, dblock);
+	gfs2_log_write(sdp, sdp->sd_jdesc, page, sb->s_blocksize, 0, dblock);
 }
 
 /**
diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
index 2280f68862de..9a85b9d7ad60 100644
--- a/fs/gfs2/lops.h
+++ b/fs/gfs2/lops.h
@@ -20,8 +20,9 @@
 extern const struct gfs2_log_operations *gfs2_log_ops[];
 extern void gfs2_log_incr_head(struct gfs2_sbd *sdp);
 extern u64 gfs2_log_bmap(struct gfs2_jdesc *jd, unsigned int lbn);
-extern void gfs2_log_write(struct gfs2_sbd *sdp, struct page *page,
-			   unsigned size, unsigned offset, u64 blkno);
+extern void gfs2_log_write(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
+			   struct page *page, unsigned size, unsigned offset,
+			   u64 blkno);
 extern void gfs2_log_submit_bio(struct bio **biop, int opf);
 extern void gfs2_pin(struct gfs2_sbd *sdp, struct buffer_head *bh);
 extern int gfs2_find_jhead(struct gfs2_jdesc *jd,
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 74ab1fcaf558..cff8b9a6612c 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -505,7 +505,7 @@ void gfs2_recover_func(struct work_struct *work)
 
 		/* We take the sd_log_flush_lock here primarily to prevent log
 		 * flushes and simultaneous journal replays from stomping on
-		 * each other wrt sd_log_bio. */
+		 * each other wrt jd_log_bio. */
 		down_read(&sdp->sd_log_flush_lock);
 		for (pass = 0; pass < 2; pass++) {
 			lops_before_scan(jd, &head, pass);

