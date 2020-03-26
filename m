Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id EA9021946B5
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Mar 2020 19:40:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585248035;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IBl8nYNQkCTz0ZTXAv4eOEi0CmrjJJZzhlNjL0PpCR8=;
	b=I6L/WcCG3AkHqAJrkM2eO/PiimvsRFo7/4gsXv3tLKS8W7Rb3i3bm2tPwVJ0fPK4PV8Ri8
	mD1zf59jK6Nie09O89n9LrcRM9E+3/JKIQ70mDudXpR/XV7wMVyhRqtwhLsnWf8fjxAHUT
	IrSAdP5IfpuTOPX+VDa/d55+7b/2KJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-MlRDCqtOO7eHfySiDg0mvg-1; Thu, 26 Mar 2020 14:40:32 -0400
X-MC-Unique: MlRDCqtOO7eHfySiDg0mvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB19713FD;
	Thu, 26 Mar 2020 18:40:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A13C010002A9;
	Thu, 26 Mar 2020 18:40:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EE378A042;
	Thu, 26 Mar 2020 18:40:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02QIeQBX005055 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 14:40:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D9EA5C1BA; Thu, 26 Mar 2020 18:40:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 626D792F8F
	for <cluster-devel@redhat.com>; Thu, 26 Mar 2020 18:40:26 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 26 Mar 2020 13:40:20 -0500
Message-Id: <20200326184020.123544-6-rpeterso@redhat.com>
In-Reply-To: <20200326184020.123544-1-rpeterso@redhat.com>
References: <20200326184020.123544-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 5/5] gfs2: implement special
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

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
 fs/gfs2/aops.c  | 25 +++++++++++++++++++++----
 fs/gfs2/glops.c |  2 +-
 fs/gfs2/log.c   | 19 ++++++++++++++-----
 fs/gfs2/log.h   |  6 ++++--
 fs/gfs2/trans.c | 39 ++++++++++++++++++++++++++++++++-------
 fs/gfs2/trans.h |  4 ++++
 6 files changed, 76 insertions(+), 19 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 786c1ce8f030..cf28ff8e7a53 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -157,8 +157,15 @@ static int __gfs2_jdata_writepage(struct page *page, s=
truct writeback_control *w
 =09struct inode *inode =3D page->mapping->host;
 =09struct gfs2_inode *ip =3D GFS2_I(inode);
 =09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
+=09int new_trans =3D 0;
+=09int ret;
=20
 =09if (PageChecked(page)) {
+=09=09ret =3D gfs2_trans_begin_jdata_sync(sdp, RES_DINODE + 1, 0);
+=09=09if (ret)
+=09=09=09return ret;
+
+=09=09new_trans =3D 1;
 =09=09ClearPageChecked(page);
 =09=09if (!page_has_buffers(page)) {
 =09=09=09create_empty_buffers(page, inode->i_sb->s_blocksize,
@@ -166,7 +173,10 @@ static int __gfs2_jdata_writepage(struct page *page, s=
truct writeback_control *w
 =09=09}
 =09=09gfs2_page_add_databufs(ip, page, 0, sdp->sd_vfs->s_blocksize);
 =09}
-=09return gfs2_write_full_page(page, gfs2_get_block_noalloc, wbc);
+=09ret =3D gfs2_write_full_page(page, gfs2_get_block_noalloc, wbc);
+=09if (new_trans)
+=09=09gfs2_trans_end_jdata_sync(sdp);
+=09return ret;
 }
=20
 /**
@@ -183,18 +193,25 @@ static int gfs2_jdata_writepage(struct page *page, st=
ruct writeback_control *wbc
 =09struct inode *inode =3D page->mapping->host;
 =09struct gfs2_inode *ip =3D GFS2_I(inode);
 =09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
+=09int ret =3D 0;
=20
 =09if (gfs2_assert_withdraw(sdp, gfs2_glock_is_held_excl(ip->i_gl)))
 =09=09goto out;
-=09if (PageChecked(page) || current->journal_info)
+=09if (current->journal_info)
 =09=09goto out_ignore;
-=09return __gfs2_jdata_writepage(page, wbc);
+
+=09ret =3D __gfs2_jdata_writepage(page, wbc);
+=09if (!ret)
+=09=09return 0;
+
+=09if (ret =3D=3D -EAGAIN)
+=09=09ret =3D 0;
=20
 out_ignore:
 =09redirty_page_for_writepage(wbc, page);
 out:
 =09unlock_page(page);
-=09return 0;
+=09return ret;
 }
=20
 /**
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 9e9c7a4b8c66..3738b074719e 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -125,7 +125,7 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
          * on the stack */
 =09tr.tr_reserved =3D 1 + gfs2_struct2blk(sdp, tr.tr_revokes);
 =09tr.tr_ip =3D _RET_IP_;
-=09ret =3D gfs2_log_reserve(sdp, tr.tr_reserved);
+=09ret =3D gfs2_log_reserve(sdp, tr.tr_reserved, true);
 =09if (ret < 0)
 =09=09return ret;
 =09WARN_ON_ONCE(current->journal_info);
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 5371af3cd96c..5cc3d62d38c1 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -389,23 +389,29 @@ static void ail2_empty(struct gfs2_sbd *sdp, unsigned=
 int new_tail)
  * gfs2_log_release - Release a given number of log blocks
  * @sdp: The GFS2 superblock
  * @blks: The number of blocks
+ * @is_normal: If true, release sd_log_flush_lock rwsem, else updating loc=
k
  *
  */
=20
-void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks)
+void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks,
+=09=09      bool is_normal)
 {
=20
 =09atomic_add(blks, &sdp->sd_log_blks_free);
 =09trace_gfs2_log_blocks(sdp, blks);
 =09gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=3D
 =09=09=09=09  sdp->sd_jdesc->jd_blocks);
-=09up_read(&sdp->sd_log_flush_lock);
+=09if (is_normal)
+=09=09up_read(&sdp->sd_log_flush_lock);
+=09else
+=09=09up_read(&sdp->sd_log_updating_lock);
 }
=20
 /**
  * gfs2_log_reserve - Make a log reservation
  * @sdp: The GFS2 superblock
  * @blks: The number of blocks to reserve
+ * @is_normal: If true, hold the sd_log_flush_lock rwsem, else updating lo=
ck
  *
  * Note that we never give out the last few blocks of the journal. Thats
  * due to the fact that there is a small number of header blocks
@@ -422,7 +428,7 @@ void gfs2_log_release(struct gfs2_sbd *sdp, unsigned in=
t blks)
  * Returns: errno
  */
=20
-int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
+int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks, bool is_norm=
al)
 {
 =09int ret =3D 0;
 =09unsigned reserved_blks =3D 7 * (4096 / sdp->sd_vfs->s_blocksize);
@@ -466,9 +472,12 @@ int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned in=
t blks)
 =09if (unlikely(did_wait))
 =09=09wake_up(&sdp->sd_log_waitq);
=20
-=09down_read(&sdp->sd_log_flush_lock);
+=09if (is_normal)
+=09=09down_read(&sdp->sd_log_flush_lock);
+=09else if (!down_read_trylock(&sdp->sd_log_updating_lock))
+=09=09ret =3D -EAGAIN;
 =09if (unlikely(!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))) {
-=09=09gfs2_log_release(sdp, blks);
+=09=09gfs2_log_release(sdp, blks, is_normal);
 =09=09ret =3D -EROFS;
 =09}
 =09if (atomic_dec_and_test(&sdp->sd_reserving_log))
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index c1cd6ae17659..188ab09ecc7d 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -64,8 +64,10 @@ static inline void gfs2_ordered_add_inode(struct gfs2_in=
ode *ip)
 extern void gfs2_ordered_del_inode(struct gfs2_inode *ip);
 extern unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nst=
ruct);
=20
-extern void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks);
-extern int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks);
+extern void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks,
+=09=09=09     bool is_normal);
+extern int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks,
+=09=09=09    bool is_normal);
 extern void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc =
*jd,
 =09=09=09=09  u64 seq, u32 tail, u32 lblock, u32 flags,
 =09=09=09=09  int op_flags);
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index ffe840505082..08b3a93d6359 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -25,8 +25,8 @@
 #include "util.h"
 #include "trace_gfs2.h"
=20
-int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
-=09=09     unsigned int revokes)
+static int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
+=09=09=09      unsigned int revokes, bool is_normal)
 {
 =09struct gfs2_trans *tr;
 =09int error;
@@ -55,7 +55,8 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int b=
locks,
=20
 =09sb_start_intwrite(sdp->sd_vfs);
=20
-=09error =3D gfs2_log_reserve(sdp, tr->tr_reserved);
+=09/* We only want to take the sd_log_flush_lock for normal flushes */
+=09error =3D gfs2_log_reserve(sdp, tr->tr_reserved, is_normal);
 =09if (error)
 =09=09goto fail;
=20
@@ -70,6 +71,18 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int =
blocks,
 =09return error;
 }
=20
+int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
+=09=09     unsigned int revokes)
+{
+=09return __gfs2_trans_begin(sdp, blocks, revokes, true);
+}
+
+int gfs2_trans_begin_jdata_sync(struct gfs2_sbd *sdp, unsigned int blocks,
+=09=09=09=09unsigned int revokes)
+{
+=09return __gfs2_trans_begin(sdp, blocks, revokes, false);
+}
+
 static void gfs2_print_trans(struct gfs2_sbd *sdp, const struct gfs2_trans=
 *tr)
 {
 =09fs_warn(sdp, "Transaction created at: %pSR\n", (void *)tr->tr_ip);
@@ -82,7 +95,7 @@ static void gfs2_print_trans(struct gfs2_sbd *sdp, const =
struct gfs2_trans *tr)
 =09=09tr->tr_num_revoke, tr->tr_num_revoke_rm);
 }
=20
-void gfs2_trans_end(struct gfs2_sbd *sdp)
+void __gfs2_trans_end(struct gfs2_sbd *sdp, bool is_normal)
 {
 =09struct gfs2_trans *tr =3D current->journal_info;
 =09s64 nbuf;
@@ -91,7 +104,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 =09current->journal_info =3D NULL;
=20
 =09if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
-=09=09gfs2_log_release(sdp, tr->tr_reserved);
+=09=09gfs2_log_release(sdp, tr->tr_reserved, is_normal);
 =09=09if (alloced) {
 =09=09=09kfree(tr);
 =09=09=09sb_end_intwrite(sdp->sd_vfs);
@@ -110,8 +123,10 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 =09gfs2_log_commit(sdp, tr);
 =09if (alloced && !test_bit(TR_ATTACHED, &tr->tr_flags))
 =09=09kfree(tr);
-=09up_read(&sdp->sd_log_flush_lock);
-
+=09if (is_normal)
+=09=09up_read(&sdp->sd_log_flush_lock);
+=09else
+=09=09up_read(&sdp->sd_log_updating_lock);
 =09if (sdp->sd_vfs->s_flags & SB_SYNCHRONOUS)
 =09=09gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 =09=09=09       GFS2_LFC_TRANS_END);
@@ -119,6 +134,16 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 =09=09sb_end_intwrite(sdp->sd_vfs);
 }
=20
+void gfs2_trans_end(struct gfs2_sbd *sdp)
+{
+=09__gfs2_trans_end(sdp, true);
+}
+
+void gfs2_trans_end_jdata_sync(struct gfs2_sbd *sdp)
+{
+=09__gfs2_trans_end(sdp, false);
+}
+
 static struct gfs2_bufdata *gfs2_alloc_bufdata(struct gfs2_glock *gl,
 =09=09=09=09=09       struct buffer_head *bh)
 {
diff --git a/fs/gfs2/trans.h b/fs/gfs2/trans.h
index 6071334de035..e384f9dddbc7 100644
--- a/fs/gfs2/trans.h
+++ b/fs/gfs2/trans.h
@@ -36,8 +36,12 @@ static inline unsigned int gfs2_rg_blocks(const struct g=
fs2_inode *ip, unsigned
=20
 extern int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 =09=09=09    unsigned int revokes);
+extern int gfs2_trans_begin_jdata_sync(struct gfs2_sbd *sdp,
+=09=09=09=09       unsigned int blocks,
+=09=09=09=09       unsigned int revokes);
=20
 extern void gfs2_trans_end(struct gfs2_sbd *sdp);
+extern void gfs2_trans_end_jdata_sync(struct gfs2_sbd *sdp);
 extern void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head =
*bh);
 extern void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head =
*bh);
 extern void gfs2_trans_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdat=
a *bd);
--=20
2.25.1

