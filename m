Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 28B5D148DAD
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jan 2020 19:17:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579889871;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lS7SdCm44Uj8byedUKQz/OR3M0sdsqlCJ5153dp4qi0=;
	b=ZebCDkNksfJ0LbpcxYHWzT4R0nd7m0v6i+wmGKQYe4tx2WxM+o+641cvV1VC8HHTMDgUWN
	ajVuAqI4J10RoO1iCLOybI91i5e8zW4Hwqz0zwvVADKBxPl/TW8hei2hnxLm4Djl64289z
	Mz6QYeIqAAktyRBYdqUPAEv1O/tcLk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-xpFJl7aYM1a7PM0AmSJNXA-1; Fri, 24 Jan 2020 13:17:49 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0106800D41;
	Fri, 24 Jan 2020 18:17:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A38F28D06;
	Fri, 24 Jan 2020 18:17:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C17A618095FF;
	Fri, 24 Jan 2020 18:17:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00OIHXXa019704 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 13:17:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8F89010016EB; Fri, 24 Jan 2020 18:17:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A5E51001B05
	for <cluster-devel@redhat.com>; Fri, 24 Jan 2020 18:17:31 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BA648594F
	for <cluster-devel@redhat.com>; Fri, 24 Jan 2020 18:17:31 +0000 (UTC)
Date: Fri, 24 Jan 2020 13:17:31 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1265228324.4715262.1579889851203.JavaMail.zimbra@redhat.com>
In-Reply-To: <278416248.4715060.1579889698068.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.36.116.223, 10.4.195.8]
Thread-Topic: gfs2: new slab for transactions
Thread-Index: DgFCT9NDpMsyRP2aKphvnhq79AlZog==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v9] gfs2: new slab for transactions
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
X-MC-Unique: xpFJl7aYM1a7PM0AmSJNXA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

This patch is really a separate issue from the rest of the recovery and
journal replay issues. So I separated it from the patch set and implemented
Andreas's suggestions.

Bob

This patch adds a new slab for gfs2 transactions. That allows us to
have an initialization function and protect against some errors.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c |  1 +
 fs/gfs2/log.c   | 11 +++++++++--
 fs/gfs2/lops.c  |  4 ++++
 fs/gfs2/main.c  | 22 ++++++++++++++++++++++
 fs/gfs2/trans.c | 26 ++++++++++++++++++++------
 fs/gfs2/trans.h |  1 +
 fs/gfs2/util.c  |  1 +
 fs/gfs2/util.h  |  1 +
 8 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 061d22e1ceb6..956b35ec74f6 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -87,6 +87,7 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
 	memset(&tr, 0, sizeof(tr));
 	INIT_LIST_HEAD(&tr.tr_buf);
 	INIT_LIST_HEAD(&tr.tr_databuf);
+	set_bit(TR_ATTACHED, &tr.tr_flags); /* prevent gfs2_trans_end free */
 	tr.tr_revokes = atomic_read(&gl->gl_ail_count);
 
 	if (!tr.tr_revokes)
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 00a2e721a374..9024b7c23754 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -30,6 +30,7 @@
 #include "util.h"
 #include "dir.h"
 #include "trace_gfs2.h"
+#include "trans.h"
 
 static void gfs2_log_shutdown(struct gfs2_sbd *sdp);
 
@@ -307,7 +308,7 @@ static void ail2_empty(struct gfs2_sbd *sdp, unsigned int new_tail)
 		list_del(&tr->tr_list);
 		gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));
 		gfs2_assert_warn(sdp, list_empty(&tr->tr_ail2_list));
-		kfree(tr);
+		gfs2_trans_free(sdp, tr);
 	}
 
 	spin_unlock(&sdp->sd_ail_lock);
@@ -877,7 +878,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	trace_gfs2_log_flush(sdp, 0, flags);
 	up_write(&sdp->sd_log_flush_lock);
 
-	kfree(tr);
+	gfs2_trans_free(sdp, tr);
 }
 
 /**
@@ -897,6 +898,12 @@ static void gfs2_merge_trans(struct gfs2_trans *old, struct gfs2_trans *new)
 	old->tr_num_revoke	+= new->tr_num_revoke;
 	old->tr_num_revoke_rm	+= new->tr_num_revoke_rm;
 
+	new->tr_num_buf_new	= 0;
+	new->tr_num_buf_rm	= 0;
+	new->tr_num_databuf_new	= 0;
+	new->tr_num_databuf_rm	= 0;
+	new->tr_num_revoke	= 0;
+
 	list_splice_tail_init(&new->tr_databuf, &old->tr_databuf);
 	list_splice_tail_init(&new->tr_buf, &old->tr_buf);
 }
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index d9431724b788..b70706bf37b2 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -734,6 +734,8 @@ static void buf_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 		list_del_init(&bd->bd_list);
 		gfs2_unpin(sdp, bd->bd_bh, tr);
 	}
+	tr->tr_num_buf_new = 0;
+	tr->tr_num_buf_rm = 0;
 }
 
 static void buf_lo_before_scan(struct gfs2_jdesc *jd,
@@ -1083,6 +1085,8 @@ static void databuf_lo_after_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 		list_del_init(&bd->bd_list);
 		gfs2_unpin(sdp, bd->bd_bh, tr);
 	}
+	tr->tr_num_databuf_new = 0;
+	tr->tr_num_databuf_rm = 0;
 }
 
 
diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index a1a295b739fb..0528906a3a1a 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -68,6 +68,19 @@ static void gfs2_init_gl_aspace_once(void *foo)
 	address_space_init_once(mapping);
 }
 
+static void gfs2_init_tr_once(void *foo)
+{
+	struct gfs2_trans *tr = foo;
+
+	memset(tr, 0, sizeof(struct gfs2_trans));
+	INIT_LIST_HEAD(&tr->tr_databuf);
+	INIT_LIST_HEAD(&tr->tr_buf);
+	INIT_LIST_HEAD(&tr->tr_ail1_list);
+	INIT_LIST_HEAD(&tr->tr_ail2_list);
+	INIT_LIST_HEAD(&tr->tr_list);
+	tr->tr_ip = 0;
+}
+
 /**
  * init_gfs2_fs - Register GFS2 as a filesystem
  *
@@ -143,6 +156,12 @@ static int __init init_gfs2_fs(void)
 	if (!gfs2_qadata_cachep)
 		goto fail_cachep7;
 
+	gfs2_trans_cachep = kmem_cache_create("gfs2_trans",
+					       sizeof(struct gfs2_trans),
+					       0, 0, gfs2_init_tr_once);
+	if (!gfs2_trans_cachep)
+		goto fail_cachep8;
+
 	error = register_shrinker(&gfs2_qd_shrinker);
 	if (error)
 		goto fail_shrinker;
@@ -194,6 +213,8 @@ static int __init init_gfs2_fs(void)
 fail_fs1:
 	unregister_shrinker(&gfs2_qd_shrinker);
 fail_shrinker:
+	kmem_cache_destroy(gfs2_trans_cachep);
+fail_cachep8:
 	kmem_cache_destroy(gfs2_qadata_cachep);
 fail_cachep7:
 	kmem_cache_destroy(gfs2_quotad_cachep);
@@ -236,6 +257,7 @@ static void __exit exit_gfs2_fs(void)
 	rcu_barrier();
 
 	mempool_destroy(gfs2_page_pool);
+	kmem_cache_destroy(gfs2_trans_cachep);
 	kmem_cache_destroy(gfs2_qadata_cachep);
 	kmem_cache_destroy(gfs2_quotad_cachep);
 	kmem_cache_destroy(gfs2_rgrpd_cachep);
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index a685637a5b55..8e2fade0f6c8 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -37,7 +37,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 	if (!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
 		return -EROFS;
 
-	tr = kzalloc(sizeof(struct gfs2_trans), GFP_NOFS);
+	tr = kmem_cache_alloc(gfs2_trans_cachep, GFP_NOFS);
 	if (!tr)
 		return -ENOMEM;
 
@@ -45,13 +45,16 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 	tr->tr_blocks = blocks;
 	tr->tr_revokes = revokes;
 	tr->tr_reserved = 1;
+	tr->tr_num_revoke = 0;
+
+	clear_bit(TR_TOUCHED, &tr->tr_flags);
+	clear_bit(TR_ATTACHED, &tr->tr_flags);
+
 	set_bit(TR_ALLOCED, &tr->tr_flags);
 	if (blocks)
 		tr->tr_reserved += 6 + blocks;
 	if (revokes)
 		tr->tr_reserved += gfs2_struct2blk(sdp, revokes);
-	INIT_LIST_HEAD(&tr->tr_databuf);
-	INIT_LIST_HEAD(&tr->tr_buf);
 
 	sb_start_intwrite(sdp->sd_vfs);
 
@@ -65,7 +68,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 
 fail:
 	sb_end_intwrite(sdp->sd_vfs);
-	kfree(tr);
+	kmem_cache_free(gfs2_trans_cachep, tr);
 
 	return error;
 }
@@ -93,7 +96,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 	if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
 		gfs2_log_release(sdp, tr->tr_reserved);
 		if (alloced) {
-			kfree(tr);
+			gfs2_trans_free(sdp, tr);
 			sb_end_intwrite(sdp->sd_vfs);
 		}
 		return;
@@ -109,7 +112,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 
 	gfs2_log_commit(sdp, tr);
 	if (alloced && !test_bit(TR_ATTACHED, &tr->tr_flags))
-		kfree(tr);
+		gfs2_trans_free(sdp, tr);
 	up_read(&sdp->sd_log_flush_lock);
 
 	if (sdp->sd_vfs->s_flags & SB_SYNCHRONOUS)
@@ -272,3 +275,14 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
 	gfs2_log_unlock(sdp);
 }
 
+void gfs2_trans_free(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
+{
+	if (tr == NULL)
+		return;
+
+	gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));
+	gfs2_assert_warn(sdp, list_empty(&tr->tr_ail2_list));
+	gfs2_assert_warn(sdp, list_empty(&tr->tr_databuf));
+	gfs2_assert_warn(sdp, list_empty(&tr->tr_buf));
+	kmem_cache_free(gfs2_trans_cachep, tr);
+}
diff --git a/fs/gfs2/trans.h b/fs/gfs2/trans.h
index 6071334de035..83199ce5a5c5 100644
--- a/fs/gfs2/trans.h
+++ b/fs/gfs2/trans.h
@@ -42,5 +42,6 @@ extern void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head *bh);
 extern void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh);
 extern void gfs2_trans_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd);
 extern void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len);
+extern void gfs2_trans_free(struct gfs2_sbd *sdp, struct gfs2_trans *tr);
 
 #endif /* __TRANS_DOT_H__ */
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index ec600b487498..5c56922e966d 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -26,6 +26,7 @@ struct kmem_cache *gfs2_bufdata_cachep __read_mostly;
 struct kmem_cache *gfs2_rgrpd_cachep __read_mostly;
 struct kmem_cache *gfs2_quotad_cachep __read_mostly;
 struct kmem_cache *gfs2_qadata_cachep __read_mostly;
+struct kmem_cache *gfs2_trans_cachep __read_mostly;
 mempool_t *gfs2_page_pool __read_mostly;
 
 void gfs2_assert_i(struct gfs2_sbd *sdp)
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index f2702bc9837c..cd35293f1adf 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -151,6 +151,7 @@ extern struct kmem_cache *gfs2_bufdata_cachep;
 extern struct kmem_cache *gfs2_rgrpd_cachep;
 extern struct kmem_cache *gfs2_quotad_cachep;
 extern struct kmem_cache *gfs2_qadata_cachep;
+extern struct kmem_cache *gfs2_trans_cachep;
 extern mempool_t *gfs2_page_pool;
 extern struct workqueue_struct *gfs2_control_wq;
 

