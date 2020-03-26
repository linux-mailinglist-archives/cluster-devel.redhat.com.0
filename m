Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC111946B4
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Mar 2020 19:40:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585248032;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BsFCUscVNsMXq7OOsb3bfThAYYPeI/a9c4eIs1TVFKU=;
	b=i+EmSqf/KxVmzs+HSZA+YCwszKo/u0BQGonUd0OKYiYcHAWn9XL1XTte5Nl//aBCIqF1ke
	qtdypRFsieNJhnlcNCK2Aw1N9XWJ8+8xikBiQSDi0hjnha5en3XRLHHvVwv1hBgrWvVNxU
	K0nL/izasP4RRmVh9fnjTctjxI65lUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-vJw1pDG2Pt-Q_RL6nkjWKw-1; Thu, 26 Mar 2020 14:40:30 -0400
X-MC-Unique: vJw1pDG2Pt-Q_RL6nkjWKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EC7E100EDE4;
	Thu, 26 Mar 2020 18:40:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0B585E012;
	Thu, 26 Mar 2020 18:40:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF72D18089D0;
	Thu, 26 Mar 2020 18:40:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02QIeQJh005050 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 14:40:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 396EE5C1BA; Thu, 26 Mar 2020 18:40:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F198F92F8F
	for <cluster-devel@redhat.com>; Thu, 26 Mar 2020 18:40:25 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 26 Mar 2020 13:40:19 -0500
Message-Id: <20200326184020.123544-5-rpeterso@redhat.com>
In-Reply-To: <20200326184020.123544-1-rpeterso@redhat.com>
References: <20200326184020.123544-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 4/5] gfs2: special log flush sequence
	to protect jdata writes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This patch implements Ben Marzinkski's idea of using two locks
as different layers of protection inside the gfs2_log_flush.
To quote Ben:

  You would need two locks, the regular log lock [sd_log_flush_lock],
  and the updating log lock [sd_log_updating_lock]. Calling
  gfs2_log_flush would grab and later release the updating log lock,
  just like it currently grabs and releases sd_log_flush_lock.

  Everything else that currently grabs sd_log_flush_lock, like
  gfs2_log_reserve(), would grab the regular log lock instead.
  (No changes if we define regular log lock =3D=3D log_flush_lock.

  In a normal log flush, you would grab the regular log lock
  [log_flush_lock], call gfs2_log_flush, which would grab and
  later release the updating log lock, and after it returned,
  drop the regular log lock. In this case, the two locks would
  both lock basically the same code.

  For syncs [that] don't care if new data is written after the
  call to sync, you could do the same as rhel7 gfs2_meta_syncfs()
  [did in RHEL7], grabbing the regular log lock [gfs2_log_flush_lock]
  before each of the calls to gfs_log_flush(), and dropping after
  each return. Again, the two locks would basically lock the
  same code.

  For syncs where you need to be sure that no new data is coming
  in, like freezes and shutdowns, you need to grab the regular
  log lock, call gfs2_log_flush(), clean out the active items list
  like [rhel7's] gfs2_meta_syncfs() does, and then call
  gfs2_log_flush again, this time with the freeze or shutdown type.

  Only after both gfs2_log_flush() calls can you drop the regular
  log lock. This would mean that when you are writing out the
  active items in these syncing flushes, only the regular log lock
  would be held. This is the only time you will be holding one
  lock and not the other.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h     |  1 +
 fs/gfs2/log.c        | 77 ++++++++++++++++++++++++++++----------------
 fs/gfs2/ops_fstype.c |  1 +
 3 files changed, 52 insertions(+), 27 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 84a824293a78..129cf8582a0a 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -834,6 +834,7 @@ struct gfs2_sbd {
 =09int sd_log_idle;
=20
 =09struct rw_semaphore sd_log_flush_lock;
+=09struct rw_semaphore sd_log_updating_lock;
 =09atomic_t sd_log_in_flight;
 =09struct bio *sd_log_bio;
 =09wait_queue_head_t sd_log_flush_wait;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 2abec43ae898..5371af3cd96c 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -876,6 +876,30 @@ static void ail_drain(struct gfs2_sbd *sdp)
 =09spin_unlock(&sdp->sd_ail_lock);
 }
=20
+static void gfs2_meta_syncfs(struct gfs2_sbd *sdp, u32 flags)
+{
+=09if (!sdp->sd_log_idle) {
+=09=09for (;;) {
+=09=09=09gfs2_ail1_start(sdp);
+=09=09=09gfs2_ail1_wait(sdp);
+=09=09=09if (gfs2_ail1_empty(sdp, 0))
+=09=09=09=09break;
+=09=09}
+=09=09if (gfs2_withdrawn(sdp))
+=09=09=09return;
+=09=09atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved
+=09=09=09=09=09=09       buffer */
+=09=09trace_gfs2_log_blocks(sdp, -1);
+=09=09log_write_header(sdp, flags);
+=09=09sdp->sd_log_head =3D sdp->sd_log_flush_head;
+=09}
+=09if (flags & (GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
+=09=09     GFS2_LOG_HEAD_FLUSH_FREEZE))
+=09=09gfs2_log_shutdown(sdp);
+=09if (flags & GFS2_LOG_HEAD_FLUSH_FREEZE)
+=09=09atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
+}
+
 /**
  * gfs2_log_flush - flush incore transaction(s)
  * @sdp: the filesystem
@@ -884,13 +908,13 @@ static void ail_drain(struct gfs2_sbd *sdp)
  *
  */
=20
-void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags=
)
+static void __gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl,
+=09=09=09     u32 flags)
 {
 =09struct gfs2_trans *tr =3D NULL;
 =09enum gfs2_freeze_state state =3D atomic_read(&sdp->sd_freeze_state);
=20
-=09down_write(&sdp->sd_log_flush_lock);
-
+=09down_write(&sdp->sd_log_updating_lock);
 =09/*
 =09 * Do this check while holding the log_flush_lock to prevent new
 =09 * buffers from being added to the ail via gfs2_pin()
@@ -900,7 +924,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
lock *gl, u32 flags)
=20
 =09/* Log might have been flushed while we waited for the flush lock */
 =09if (gl && !test_bit(GLF_LFLUSH, &gl->gl_flags)) {
-=09=09up_write(&sdp->sd_log_flush_lock);
+=09=09up_write(&sdp->sd_log_updating_lock);
 =09=09return;
 =09}
 =09trace_gfs2_log_flush(sdp, 1, flags);
@@ -963,28 +987,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_=
glock *gl, u32 flags)
 =09spin_unlock(&sdp->sd_ail_lock);
 =09gfs2_log_unlock(sdp);
=20
-=09if (!(flags & GFS2_LOG_HEAD_FLUSH_NORMAL)) {
-=09=09if (!sdp->sd_log_idle) {
-=09=09=09for (;;) {
-=09=09=09=09gfs2_ail1_start(sdp);
-=09=09=09=09gfs2_ail1_wait(sdp);
-=09=09=09=09if (gfs2_ail1_empty(sdp, 0))
-=09=09=09=09=09break;
-=09=09=09}
-=09=09=09if (gfs2_withdrawn(sdp))
-=09=09=09=09goto out;
-=09=09=09atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buff=
er */
-=09=09=09trace_gfs2_log_blocks(sdp, -1);
-=09=09=09log_write_header(sdp, flags);
-=09=09=09sdp->sd_log_head =3D sdp->sd_log_flush_head;
-=09=09}
-=09=09if (flags & (GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
-=09=09=09     GFS2_LOG_HEAD_FLUSH_FREEZE))
-=09=09=09gfs2_log_shutdown(sdp);
-=09=09if (flags & GFS2_LOG_HEAD_FLUSH_FREEZE)
-=09=09=09atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
-=09}
-
 out:
 =09if (gfs2_withdrawn(sdp)) {
 =09=09ail_drain(sdp); /* frees all transactions */
@@ -992,11 +994,32 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2=
_glock *gl, u32 flags)
 =09}
=20
 =09trace_gfs2_log_flush(sdp, 0, flags);
-=09up_write(&sdp->sd_log_flush_lock);
+=09up_write(&sdp->sd_log_updating_lock);
=20
 =09kfree(tr);
 }
=20
+void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags=
)
+{
+=09u32 normal =3D 0;
+
+=09down_write(&sdp->sd_log_flush_lock);
+=09if (flags & GFS2_LOG_HEAD_FLUSH_NORMAL)
+=09=09goto normal_flush;
+
+=09normal =3D flags & ~(GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
+=09=09=09   GFS2_LOG_HEAD_FLUSH_FREEZE |
+=09=09=09   GFS2_LOG_HEAD_FLUSH_SYNC);
+=09normal |=3D GFS2_LOG_HEAD_FLUSH_NORMAL;
+=09__gfs2_log_flush(sdp, NULL, normal);
+
+=09gfs2_meta_syncfs(sdp, flags);
+
+normal_flush:
+=09__gfs2_log_flush(sdp, gl, flags);
+=09up_write(&sdp->sd_log_flush_lock);
+}
+
 /**
  * gfs2_merge_trans - Merge a new transaction into a cached transaction
  * @old: Original transaction to be expanded
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 1aeb591bfd28..11a3a471124c 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -133,6 +133,7 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb=
)
 =09INIT_LIST_HEAD(&sdp->sd_ail2_list);
=20
 =09init_rwsem(&sdp->sd_log_flush_lock);
+=09init_rwsem(&sdp->sd_log_updating_lock);
 =09atomic_set(&sdp->sd_log_in_flight, 0);
 =09atomic_set(&sdp->sd_reserving_log, 0);
 =09init_waitqueue_head(&sdp->sd_reserving_log_wait);
--=20
2.25.1

