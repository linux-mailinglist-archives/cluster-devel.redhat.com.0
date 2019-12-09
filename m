Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3962D117096
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Dec 2019 16:37:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575905837;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1guGUsHdvG2cRf1hhgABrdcSBD72qQuuAFheT00ybfw=;
	b=inFYWMeT/JyVQbOqOfkW3O7a9+4RBI6iBFyBtqb0UpnK/pqKJ5WhrWuv/mjkE9KmtQwkze
	KwDl6gGrhfmYZw6s+FCIF7hS+/R3vyyUN5ysVglkKbQ/Rv2siJkJmH9f/sshPRZ3tq7S32
	mvqloDNk82HLFgxCsRw0mefYQp3raPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-Hib_gJgNOmmLxnZQJ1D6dA-1; Mon, 09 Dec 2019 10:37:16 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E7628056C9;
	Mon,  9 Dec 2019 15:37:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 099276E3F2;
	Mon,  9 Dec 2019 15:37:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1DF81803C38;
	Mon,  9 Dec 2019 15:37:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9FbCsE005009 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 10:37:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0383B5DA76; Mon,  9 Dec 2019 15:37:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-248.phx2.redhat.com [10.3.116.248])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C464B5D9D6
	for <cluster-devel@redhat.com>; Mon,  9 Dec 2019 15:37:11 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon,  9 Dec 2019 09:36:54 -0600
Message-Id: <20191209153700.700208-17-rpeterso@redhat.com>
In-Reply-To: <20191209153700.700208-1-rpeterso@redhat.com>
References: <20191209153700.700208-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v8 PATCH 16/22] gfs2: new slab for
	transactions
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
X-MC-Unique: Hib_gJgNOmmLxnZQJ1D6dA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This patch adds a new slab for gfs2 transactions. That allows us to
have an initialization function and protect against some errors.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c |  1 +
 fs/gfs2/log.c   | 14 +++++++++++---
 fs/gfs2/lops.c  |  4 ++++
 fs/gfs2/main.c  | 23 +++++++++++++++++++++++
 fs/gfs2/trans.c | 28 ++++++++++++++++++++++------
 fs/gfs2/trans.h |  1 +
 fs/gfs2/util.c  |  1 +
 fs/gfs2/util.h  |  1 +
 8 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index d8f9ee756c0e..e0219b0e2229 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -89,6 +89,7 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 =09memset(&tr, 0, sizeof(tr));
 =09INIT_LIST_HEAD(&tr.tr_buf);
 =09INIT_LIST_HEAD(&tr.tr_databuf);
+=09set_bit(TR_ATTACHED, &tr.tr_flags); /* prevent gfs2_trans_end free */
 =09tr.tr_revokes =3D atomic_read(&gl->gl_ail_count);
=20
 =09if (!tr.tr_revokes)
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index f543899c4d70..2b4217883b72 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -30,6 +30,7 @@
 #include "util.h"
 #include "dir.h"
 #include "trace_gfs2.h"
+#include "trans.h"
=20
 static void gfs2_log_shutdown(struct gfs2_sbd *sdp);
=20
@@ -331,7 +332,7 @@ static void ail2_empty(struct gfs2_sbd *sdp, unsigned i=
nt new_tail)
 =09=09list_del(&tr->tr_list);
 =09=09gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));
 =09=09gfs2_assert_warn(sdp, list_empty(&tr->tr_ail2_list));
-=09=09kfree(tr);
+=09=09gfs2_trans_free(sdp, tr);
 =09}
=20
 =09spin_unlock(&sdp->sd_ail_lock);
@@ -876,7 +877,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
lock *gl, u32 flags)
 =09trace_gfs2_log_flush(sdp, 0, flags);
 =09up_write(&sdp->sd_log_flush_lock);
=20
-=09kfree(tr);
+=09gfs2_trans_free(sdp, tr);
 }
=20
 /**
@@ -895,6 +896,12 @@ static void gfs2_merge_trans(struct gfs2_trans *old, s=
truct gfs2_trans *new)
 =09old->tr_num_databuf_rm=09+=3D new->tr_num_databuf_rm;
 =09old->tr_num_revoke=09+=3D new->tr_num_revoke;
=20
+=09new->tr_num_buf_new=09=3D 0;
+=09new->tr_num_buf_rm=09=3D 0;
+=09new->tr_num_databuf_new=09=3D 0;
+=09new->tr_num_databuf_rm=09=3D 0;
+=09new->tr_num_revoke=09=3D 0;
+
 =09list_splice_tail_init(&new->tr_databuf, &old->tr_databuf);
 =09list_splice_tail_init(&new->tr_buf, &old->tr_buf);
 }
@@ -904,6 +911,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs=
2_trans *tr)
 =09unsigned int reserved;
 =09unsigned int unused;
 =09unsigned int maxres;
+=09unsigned int new_revokes =3D tr->tr_num_revoke;
=20
 =09gfs2_log_lock(sdp);
=20
@@ -915,7 +923,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs=
2_trans *tr)
 =09=09set_bit(TR_ATTACHED, &tr->tr_flags);
 =09}
=20
-=09sdp->sd_log_commited_revoke +=3D tr->tr_num_revoke;
+=09sdp->sd_log_commited_revoke +=3D new_revokes;
 =09reserved =3D calc_reserved(sdp);
 =09maxres =3D sdp->sd_log_blks_reserved + tr->tr_reserved;
 =09gfs2_assert_withdraw(sdp, maxres >=3D reserved);
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 2f4c478e7bb7..99b366a6e4e6 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -730,6 +730,8 @@ static void buf_lo_after_commit(struct gfs2_sbd *sdp, s=
truct gfs2_trans *tr)
 =09=09list_del_init(&bd->bd_list);
 =09=09gfs2_unpin(sdp, bd->bd_bh, tr);
 =09}
+=09tr->tr_num_buf_new =3D 0;
+=09tr->tr_num_buf_rm =3D 0;
 }
=20
 static void buf_lo_before_scan(struct gfs2_jdesc *jd,
@@ -1079,6 +1081,8 @@ static void databuf_lo_after_commit(struct gfs2_sbd *=
sdp, struct gfs2_trans *tr)
 =09=09list_del_init(&bd->bd_list);
 =09=09gfs2_unpin(sdp, bd->bd_bh, tr);
 =09}
+=09tr->tr_num_databuf_new =3D 0;
+=09tr->tr_num_databuf_rm =3D 0;
 }
=20
=20
diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index a1a295b739fb..5ff114bbcede 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -68,6 +68,19 @@ static void gfs2_init_gl_aspace_once(void *foo)
 =09address_space_init_once(mapping);
 }
=20
+static void gfs2_init_tr_once(void *foo)
+{
+=09struct gfs2_trans *tr =3D foo;
+
+=09memset(tr, 0, sizeof(struct gfs2_trans));
+=09INIT_LIST_HEAD(&tr->tr_databuf);
+=09INIT_LIST_HEAD(&tr->tr_buf);
+=09INIT_LIST_HEAD(&tr->tr_ail1_list);
+=09INIT_LIST_HEAD(&tr->tr_ail2_list);
+=09INIT_LIST_HEAD(&tr->tr_list);
+=09tr->tr_ip =3D 0;
+}
+
 /**
  * init_gfs2_fs - Register GFS2 as a filesystem
  *
@@ -143,6 +156,13 @@ static int __init init_gfs2_fs(void)
 =09if (!gfs2_qadata_cachep)
 =09=09goto fail_cachep7;
=20
+=09gfs2_trans_cachep =3D kmem_cache_create("gfs2_trans",
+=09=09=09=09=09       sizeof(struct gfs2_trans),
+=09=09=09=09=09       0, SLAB_CONSISTENCY_CHECKS|
+=09=09=09=09=09       SLAB_POISON, gfs2_init_tr_once);
+=09if (!gfs2_trans_cachep)
+=09=09goto fail_cachep8;
+
 =09error =3D register_shrinker(&gfs2_qd_shrinker);
 =09if (error)
 =09=09goto fail_shrinker;
@@ -194,6 +214,8 @@ static int __init init_gfs2_fs(void)
 fail_fs1:
 =09unregister_shrinker(&gfs2_qd_shrinker);
 fail_shrinker:
+=09kmem_cache_destroy(gfs2_trans_cachep);
+fail_cachep8:
 =09kmem_cache_destroy(gfs2_qadata_cachep);
 fail_cachep7:
 =09kmem_cache_destroy(gfs2_quotad_cachep);
@@ -236,6 +258,7 @@ static void __exit exit_gfs2_fs(void)
 =09rcu_barrier();
=20
 =09mempool_destroy(gfs2_page_pool);
+=09kmem_cache_destroy(gfs2_trans_cachep);
 =09kmem_cache_destroy(gfs2_qadata_cachep);
 =09kmem_cache_destroy(gfs2_quotad_cachep);
 =09kmem_cache_destroy(gfs2_rgrpd_cachep);
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 9d4227330de4..50f902a23c4d 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -37,7 +37,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int b=
locks,
 =09if (!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
 =09=09return -EROFS;
=20
-=09tr =3D kzalloc(sizeof(struct gfs2_trans), GFP_NOFS);
+=09tr =3D kmem_cache_alloc(gfs2_trans_cachep, GFP_NOFS);
 =09if (!tr)
 =09=09return -ENOMEM;
=20
@@ -45,14 +45,19 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int=
 blocks,
 =09tr->tr_blocks =3D blocks;
 =09tr->tr_revokes =3D revokes;
 =09tr->tr_reserved =3D 1;
+=09tr->tr_num_revoke =3D 0;
+
+=09clear_bit(TR_TOUCHED, &tr->tr_flags);
+=09clear_bit(TR_ATTACHED, &tr->tr_flags);
+
 =09set_bit(TR_ALLOCED, &tr->tr_flags);
 =09if (blocks)
 =09=09tr->tr_reserved +=3D 6 + blocks;
 =09if (revokes)
 =09=09tr->tr_reserved +=3D gfs2_struct2blk(sdp, revokes,
 =09=09=09=09=09=09   sizeof(u64));
-=09INIT_LIST_HEAD(&tr->tr_databuf);
-=09INIT_LIST_HEAD(&tr->tr_buf);
+=09gfs2_assert_warn(sdp, list_empty(&tr->tr_databuf));
+=09gfs2_assert_warn(sdp, list_empty(&tr->tr_buf));
=20
 =09sb_start_intwrite(sdp->sd_vfs);
=20
@@ -66,7 +71,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int b=
locks,
=20
 fail:
 =09sb_end_intwrite(sdp->sd_vfs);
-=09kfree(tr);
+=09kmem_cache_free(gfs2_trans_cachep, tr);
=20
 =09return error;
 }
@@ -94,7 +99,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 =09if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
 =09=09gfs2_log_release(sdp, tr->tr_reserved);
 =09=09if (alloced) {
-=09=09=09kfree(tr);
+=09=09=09gfs2_trans_free(sdp, tr);
 =09=09=09sb_end_intwrite(sdp->sd_vfs);
 =09=09}
 =09=09return;
@@ -110,7 +115,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
=20
 =09gfs2_log_commit(sdp, tr);
 =09if (alloced && !test_bit(TR_ATTACHED, &tr->tr_flags))
-=09=09kfree(tr);
+=09=09gfs2_trans_free(sdp, tr);
 =09up_read(&sdp->sd_log_flush_lock);
=20
 =09if (sdp->sd_vfs->s_flags & SB_SYNCHRONOUS)
@@ -273,3 +278,14 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u6=
4 blkno, unsigned int len)
 =09gfs2_log_unlock(sdp);
 }
=20
+void gfs2_trans_free(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
+{
+=09if (tr =3D=3D NULL)
+=09=09return;
+
+=09gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));
+=09gfs2_assert_warn(sdp, list_empty(&tr->tr_ail2_list));
+=09gfs2_assert_warn(sdp, list_empty(&tr->tr_databuf));
+=09gfs2_assert_warn(sdp, list_empty(&tr->tr_buf));
+=09kmem_cache_free(gfs2_trans_cachep, tr);
+}
diff --git a/fs/gfs2/trans.h b/fs/gfs2/trans.h
index 6071334de035..83199ce5a5c5 100644
--- a/fs/gfs2/trans.h
+++ b/fs/gfs2/trans.h
@@ -42,5 +42,6 @@ extern void gfs2_trans_add_data(struct gfs2_glock *gl, st=
ruct buffer_head *bh);
 extern void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head =
*bh);
 extern void gfs2_trans_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdat=
a *bd);
 extern void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsi=
gned int len);
+extern void gfs2_trans_free(struct gfs2_sbd *sdp, struct gfs2_trans *tr);
=20
 #endif /* __TRANS_DOT_H__ */
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 690a2f575709..04141d0d8e17 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -32,6 +32,7 @@ struct kmem_cache *gfs2_bufdata_cachep __read_mostly;
 struct kmem_cache *gfs2_rgrpd_cachep __read_mostly;
 struct kmem_cache *gfs2_quotad_cachep __read_mostly;
 struct kmem_cache *gfs2_qadata_cachep __read_mostly;
+struct kmem_cache *gfs2_trans_cachep __read_mostly;
 mempool_t *gfs2_page_pool __read_mostly;
=20
 void gfs2_assert_i(struct gfs2_sbd *sdp)
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index f23cced3809e..479d351c24a7 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -154,6 +154,7 @@ extern struct kmem_cache *gfs2_bufdata_cachep;
 extern struct kmem_cache *gfs2_rgrpd_cachep;
 extern struct kmem_cache *gfs2_quotad_cachep;
 extern struct kmem_cache *gfs2_qadata_cachep;
+extern struct kmem_cache *gfs2_trans_cachep;
 extern mempool_t *gfs2_page_pool;
 extern struct workqueue_struct *gfs2_control_wq;
=20
--=20
2.23.0

