Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 3343D195713
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Mar 2020 13:28:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585312108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Dc9E7ySbdZovqb4ZnQXBohlslsEdNSFxH+VDZa8IZxk=;
	b=gDfm0KhrEhrUye3BaUY8yc6Z7C6DRMtrRbvx/nYAY/5Eqf68QXidsXPnKd1wuohAPDxYuO
	3nj9fbnQbhEljHz5I7hIupfuVN2fs5VHWtxKeW0mu4EJwdwRmke3B8jLoNJgwgZlE12zUA
	uD8Jz6F1BW9oOguhs7Z5FDVrOelroq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-1k6W9KvrOHm0nn5UT-rhpg-1; Fri, 27 Mar 2020 08:28:26 -0400
X-MC-Unique: 1k6W9KvrOHm0nn5UT-rhpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E907418CA256;
	Fri, 27 Mar 2020 12:28:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D634597AFA;
	Fri, 27 Mar 2020 12:28:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CBC08A024;
	Fri, 27 Mar 2020 12:28:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RCSGda003952 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 08:28:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 76DBB60FC1; Fri, 27 Mar 2020 12:28:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 717E460FA2
	for <cluster-devel@redhat.com>; Fri, 27 Mar 2020 12:28:12 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FFD218089C8
	for <cluster-devel@redhat.com>; Fri, 27 Mar 2020 12:28:12 +0000 (UTC)
Date: Fri, 27 Mar 2020 08:28:12 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <477848241.19215566.1585312092548.JavaMail.zimbra@redhat.com>
In-Reply-To: <71877045.19215478.1585312035114.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.79, 10.4.195.5]
Thread-Topic: gfs2: implement special transaction type for jdata sync writes
Thread-Index: jwZdeToioCP777W8xUTMuAj7hCO4vQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 5/5 v2] gfs2: implement special
 transaction type for jdata sync writes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

This is a revised version of the last patch I sent. I had to revise it
because of a bug I found while testing.

Bob


This patch implements Ben Marzinski's idea to solve the jdata sync
write deadlock. To quote Ben:

  Once you have flushes working like this, you can make a special version
  of gfs2_trans_begin() that will allow a transaction to start as long as
  the updating log lock isn't held, instead of blocking on the regular
  log lock, like normal transactions. You would only call this special
  version of gfs2_trans_begin() when writing out jdata pages during a
  syncing log flush. So these mmaped jdata writes will be the only things
  that can ever start transactions while you are writing out the active
  items during a syncing log flush.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c  | 22 +++++++++++++++++++---
 fs/gfs2/glops.c |  2 +-
 fs/gfs2/log.c   | 19 ++++++++++++++-----
 fs/gfs2/log.h   |  6 ++++--
 fs/gfs2/trans.c | 39 ++++++++++++++++++++++++++++++++-------
 fs/gfs2/trans.h |  4 ++++
 6 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 786c1ce8f030..93bec66515a2 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -183,18 +183,34 @@ static int gfs2_jdata_writepage(struct page *page, struct writeback_control *wbc
 	struct inode *inode = page->mapping->host;
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
+	int new_trans = 0;
+	int ret = 0;
 
 	if (gfs2_assert_withdraw(sdp, gfs2_glock_is_held_excl(ip->i_gl)))
 		goto out;
-	if (PageChecked(page) || current->journal_info)
+	if (current->journal_info)
 		goto out_ignore;
-	return __gfs2_jdata_writepage(page, wbc);
+	if (PageChecked(page)) {
+		ret = gfs2_trans_begin_jdata_sync(sdp, RES_DINODE + 1, 0);
+		if (ret) {
+			if (ret == -EAGAIN)
+				ret = 0;
+			goto out_ignore;
+		}
+		new_trans = 1;
+	}
+
+	ret = __gfs2_jdata_writepage(page, wbc);
+	if (new_trans)
+		gfs2_trans_end_jdata_sync(sdp);
+	if (!ret)
+		return 0;
 
 out_ignore:
 	redirty_page_for_writepage(wbc, page);
 out:
 	unlock_page(page);
-	return 0;
+	return ret;
 }
 
 /**
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 9e9c7a4b8c66..3738b074719e 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -125,7 +125,7 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
          * on the stack */
 	tr.tr_reserved = 1 + gfs2_struct2blk(sdp, tr.tr_revokes);
 	tr.tr_ip = _RET_IP_;
-	ret = gfs2_log_reserve(sdp, tr.tr_reserved);
+	ret = gfs2_log_reserve(sdp, tr.tr_reserved, true);
 	if (ret < 0)
 		return ret;
 	WARN_ON_ONCE(current->journal_info);
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 5371af3cd96c..5cc3d62d38c1 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -389,23 +389,29 @@ static void ail2_empty(struct gfs2_sbd *sdp, unsigned int new_tail)
  * gfs2_log_release - Release a given number of log blocks
  * @sdp: The GFS2 superblock
  * @blks: The number of blocks
+ * @is_normal: If true, release sd_log_flush_lock rwsem, else updating lock
  *
  */
 
-void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks)
+void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks,
+		      bool is_normal)
 {
 
 	atomic_add(blks, &sdp->sd_log_blks_free);
 	trace_gfs2_log_blocks(sdp, blks);
 	gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
 				  sdp->sd_jdesc->jd_blocks);
-	up_read(&sdp->sd_log_flush_lock);
+	if (is_normal)
+		up_read(&sdp->sd_log_flush_lock);
+	else
+		up_read(&sdp->sd_log_updating_lock);
 }
 
 /**
  * gfs2_log_reserve - Make a log reservation
  * @sdp: The GFS2 superblock
  * @blks: The number of blocks to reserve
+ * @is_normal: If true, hold the sd_log_flush_lock rwsem, else updating lock
  *
  * Note that we never give out the last few blocks of the journal. Thats
  * due to the fact that there is a small number of header blocks
@@ -422,7 +428,7 @@ void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks)
  * Returns: errno
  */
 
-int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
+int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks, bool is_normal)
 {
 	int ret = 0;
 	unsigned reserved_blks = 7 * (4096 / sdp->sd_vfs->s_blocksize);
@@ -466,9 +472,12 @@ int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
 	if (unlikely(did_wait))
 		wake_up(&sdp->sd_log_waitq);
 
-	down_read(&sdp->sd_log_flush_lock);
+	if (is_normal)
+		down_read(&sdp->sd_log_flush_lock);
+	else if (!down_read_trylock(&sdp->sd_log_updating_lock))
+		ret = -EAGAIN;
 	if (unlikely(!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))) {
-		gfs2_log_release(sdp, blks);
+		gfs2_log_release(sdp, blks, is_normal);
 		ret = -EROFS;
 	}
 	if (atomic_dec_and_test(&sdp->sd_reserving_log))
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index c1cd6ae17659..188ab09ecc7d 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -64,8 +64,10 @@ static inline void gfs2_ordered_add_inode(struct gfs2_inode *ip)
 extern void gfs2_ordered_del_inode(struct gfs2_inode *ip);
 extern unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct);
 
-extern void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks);
-extern int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks);
+extern void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks,
+			     bool is_normal);
+extern int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks,
+			    bool is_normal);
 extern void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 				  u64 seq, u32 tail, u32 lblock, u32 flags,
 				  int op_flags);
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index ffe840505082..08b3a93d6359 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -25,8 +25,8 @@
 #include "util.h"
 #include "trace_gfs2.h"
 
-int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
-		     unsigned int revokes)
+static int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
+			      unsigned int revokes, bool is_normal)
 {
 	struct gfs2_trans *tr;
 	int error;
@@ -55,7 +55,8 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 
 	sb_start_intwrite(sdp->sd_vfs);
 
-	error = gfs2_log_reserve(sdp, tr->tr_reserved);
+	/* We only want to take the sd_log_flush_lock for normal flushes */
+	error = gfs2_log_reserve(sdp, tr->tr_reserved, is_normal);
 	if (error)
 		goto fail;
 
@@ -70,6 +71,18 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 	return error;
 }
 
+int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
+		     unsigned int revokes)
+{
+	return __gfs2_trans_begin(sdp, blocks, revokes, true);
+}
+
+int gfs2_trans_begin_jdata_sync(struct gfs2_sbd *sdp, unsigned int blocks,
+				unsigned int revokes)
+{
+	return __gfs2_trans_begin(sdp, blocks, revokes, false);
+}
+
 static void gfs2_print_trans(struct gfs2_sbd *sdp, const struct gfs2_trans *tr)
 {
 	fs_warn(sdp, "Transaction created at: %pSR\n", (void *)tr->tr_ip);
@@ -82,7 +95,7 @@ static void gfs2_print_trans(struct gfs2_sbd *sdp, const struct gfs2_trans *tr)
 		tr->tr_num_revoke, tr->tr_num_revoke_rm);
 }
 
-void gfs2_trans_end(struct gfs2_sbd *sdp)
+void __gfs2_trans_end(struct gfs2_sbd *sdp, bool is_normal)
 {
 	struct gfs2_trans *tr = current->journal_info;
 	s64 nbuf;
@@ -91,7 +104,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 	current->journal_info = NULL;
 
 	if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
-		gfs2_log_release(sdp, tr->tr_reserved);
+		gfs2_log_release(sdp, tr->tr_reserved, is_normal);
 		if (alloced) {
 			kfree(tr);
 			sb_end_intwrite(sdp->sd_vfs);
@@ -110,8 +123,10 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 	gfs2_log_commit(sdp, tr);
 	if (alloced && !test_bit(TR_ATTACHED, &tr->tr_flags))
 		kfree(tr);
-	up_read(&sdp->sd_log_flush_lock);
-
+	if (is_normal)
+		up_read(&sdp->sd_log_flush_lock);
+	else
+		up_read(&sdp->sd_log_updating_lock);
 	if (sdp->sd_vfs->s_flags & SB_SYNCHRONOUS)
 		gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 			       GFS2_LFC_TRANS_END);
@@ -119,6 +134,16 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 		sb_end_intwrite(sdp->sd_vfs);
 }
 
+void gfs2_trans_end(struct gfs2_sbd *sdp)
+{
+	__gfs2_trans_end(sdp, true);
+}
+
+void gfs2_trans_end_jdata_sync(struct gfs2_sbd *sdp)
+{
+	__gfs2_trans_end(sdp, false);
+}
+
 static struct gfs2_bufdata *gfs2_alloc_bufdata(struct gfs2_glock *gl,
 					       struct buffer_head *bh)
 {
diff --git a/fs/gfs2/trans.h b/fs/gfs2/trans.h
index 6071334de035..e384f9dddbc7 100644
--- a/fs/gfs2/trans.h
+++ b/fs/gfs2/trans.h
@@ -36,8 +36,12 @@ static inline unsigned int gfs2_rg_blocks(const struct gfs2_inode *ip, unsigned
 
 extern int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 			    unsigned int revokes);
+extern int gfs2_trans_begin_jdata_sync(struct gfs2_sbd *sdp,
+				       unsigned int blocks,
+				       unsigned int revokes);
 
 extern void gfs2_trans_end(struct gfs2_sbd *sdp);
+extern void gfs2_trans_end_jdata_sync(struct gfs2_sbd *sdp);
 extern void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head *bh);
 extern void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh);
 extern void gfs2_trans_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd);

