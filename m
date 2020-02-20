Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 351E91667AF
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 20:54:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582228472;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9ETDepl+nRKuYMif8J+TrimCBI6GpCq0zt4HJ8RSAgI=;
	b=NRJbWuaEMJoDOqlD+78n4rDCHOLwCRLe4V8ARe2CKaDbNUVWQuePE2gCR4MhFGhQa6eGIi
	UUHraS6qVGAYmwfvQwCZTlrlaciRj4xQomkuYtfYNWSD35XzzWfFT4MksGHvdMaMHeCjlZ
	oHj+kiUrmx6VeNVp/ZVwAMazrKlW+Fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-TWVmyhsjMRuEPm84YaNtyg-1; Thu, 20 Feb 2020 14:54:30 -0500
X-MC-Unique: TWVmyhsjMRuEPm84YaNtyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 474EB801E67;
	Thu, 20 Feb 2020 19:54:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3573B26FAF;
	Thu, 20 Feb 2020 19:54:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AD3518089CE;
	Thu, 20 Feb 2020 19:54:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KJsQJd009345 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 14:54:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5B27390F79; Thu, 20 Feb 2020 19:54:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2123890F57
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 19:54:24 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 20 Feb 2020 13:53:23 -0600
Message-Id: <20200220195329.952027-23-rpeterso@redhat.com>
In-Reply-To: <20200220195329.952027-1-rpeterso@redhat.com>
References: <20200220195329.952027-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 22/28] gfs2: drain the ail2 list after
	io errors
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, gfs2_logd continually tried to flush its journal
log, after the file system is withdrawn. We don't want to write anything
to the journal, lest we add corruption. Best course of action is to
drain the ail1 into the ail2 list (via gfs2_ail1_empty) then drain the
ail2 list with a new function, ail2_drain.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c   | 71 ++++++++++++++++++++++++++++++++++++++++++-------
 fs/gfs2/trans.c |  4 +++
 2 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index ed80ef8e5c33..010c319caade 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -299,20 +299,17 @@ static void gfs2_ail1_wait(struct gfs2_sbd *sdp)
 }
=20
 /**
- * gfs2_ail2_empty_one - Check whether or not a trans in the AIL has been =
synced
- * @sdp: the filesystem
- * @ai: the AIL entry
- *
+ * gfs2_ail_empty_tr - empty one of the ail lists for a transaction
  */
=20
-static void gfs2_ail2_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *t=
r)
+static void gfs2_ail_empty_tr(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
+=09=09=09      struct list_head *head)
 {
-=09struct list_head *head =3D &tr->tr_ail2_list;
 =09struct gfs2_bufdata *bd;
=20
 =09while (!list_empty(head)) {
-=09=09bd =3D list_entry(head->prev, struct gfs2_bufdata,
-=09=09=09=09bd_ail_st_list);
+=09=09bd =3D list_first_entry(head, struct gfs2_bufdata,
+=09=09=09=09      bd_ail_st_list);
 =09=09gfs2_assert(sdp, bd->bd_tr =3D=3D tr);
 =09=09gfs2_remove_from_ail(bd);
 =09}
@@ -334,7 +331,7 @@ static void ail2_empty(struct gfs2_sbd *sdp, unsigned i=
nt new_tail)
 =09=09if (!rm)
 =09=09=09continue;
=20
-=09=09gfs2_ail2_empty_one(sdp, tr);
+=09=09gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
 =09=09list_del(&tr->tr_list);
 =09=09gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));
 =09=09gfs2_assert_warn(sdp, list_empty(&tr->tr_ail2_list));
@@ -801,6 +798,40 @@ static void log_write_header(struct gfs2_sbd *sdp, u32=
 flags)
 =09=09log_pull_tail(sdp, tail);
 }
=20
+/**
+ * ail_drain - drain the ail lists after a withdraw
+ * @sdp: Pointer to GFS2 superblock
+ */
+static void ail_drain(struct gfs2_sbd *sdp)
+{
+=09struct gfs2_trans *tr;
+
+=09spin_lock(&sdp->sd_ail_lock);
+=09/*
+=09 * For transactions on the sd_ail1_list we need to drain both the
+=09 * ail1 and ail2 lists. That's because function gfs2_ail1_start_one
+=09 * (temporarily) moves items from its tr_ail1 list to tr_ail2 list
+=09 * before revokes are sent for that block. Items on the sd_ail2_list
+=09 * should have already gotten beyond that point, so no need.
+=09 */
+=09while (!list_empty(&sdp->sd_ail1_list)) {
+=09=09tr =3D list_first_entry(&sdp->sd_ail1_list, struct gfs2_trans,
+=09=09=09=09      tr_list);
+=09=09gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail1_list);
+=09=09gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
+=09=09list_del(&tr->tr_list);
+=09=09kfree(tr);
+=09}
+=09while (!list_empty(&sdp->sd_ail2_list)) {
+=09=09tr =3D list_first_entry(&sdp->sd_ail2_list, struct gfs2_trans,
+=09=09=09=09      tr_list);
+=09=09gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
+=09=09list_del(&tr->tr_list);
+=09=09kfree(tr);
+=09}
+=09spin_unlock(&sdp->sd_ail_lock);
+}
+
 /**
  * gfs2_log_flush - flush incore transaction(s)
  * @sdp: the filesystem
@@ -811,11 +842,18 @@ static void log_write_header(struct gfs2_sbd *sdp, u3=
2 flags)
=20
 void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags=
)
 {
-=09struct gfs2_trans *tr;
+=09struct gfs2_trans *tr =3D NULL;
 =09enum gfs2_freeze_state state =3D atomic_read(&sdp->sd_freeze_state);
=20
 =09down_write(&sdp->sd_log_flush_lock);
=20
+=09/*
+=09 * Do this check while holding the log_flush_lock to prevent new
+=09 * buffers from being added to the ail via gfs2_pin()
+=09 */
+=09if (gfs2_withdrawn(sdp))
+=09=09goto out;
+
 =09/* Log might have been flushed while we waited for the flush lock */
 =09if (gl && !test_bit(GLF_LFLUSH, &gl->gl_flags)) {
 =09=09up_write(&sdp->sd_log_flush_lock);
@@ -843,8 +881,14 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_=
glock *gl, u32 flags)
 =09=09=09sdp->sd_log_num_revoke =3D=3D sdp->sd_log_committed_revoke);
=20
 =09gfs2_ordered_write(sdp);
+=09if (gfs2_withdrawn(sdp))
+=09=09goto out;
 =09lops_before_commit(sdp, tr);
+=09if (gfs2_withdrawn(sdp))
+=09=09goto out;
 =09gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE);
+=09if (gfs2_withdrawn(sdp))
+=09=09goto out;
=20
 =09if (sdp->sd_log_head !=3D sdp->sd_log_flush_head) {
 =09=09log_flush_wait(sdp);
@@ -854,6 +898,8 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
lock *gl, u32 flags)
 =09=09trace_gfs2_log_blocks(sdp, -1);
 =09=09log_write_header(sdp, flags);
 =09}
+=09if (gfs2_withdrawn(sdp))
+=09=09goto out;
 =09lops_after_commit(sdp, tr);
=20
 =09gfs2_log_lock(sdp);
@@ -892,6 +938,11 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_=
glock *gl, u32 flags)
 =09}
=20
 out:
+=09if (gfs2_withdrawn(sdp)) {
+=09=09ail_drain(sdp); /* frees all transactions */
+=09=09tr =3D NULL;
+=09}
+
 =09trace_gfs2_log_flush(sdp, 0, flags);
 =09up_write(&sdp->sd_log_flush_lock);
=20
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index a685637a5b55..ffe840505082 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -228,6 +228,10 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct=
 buffer_head *bh)
 =09=09fs_info(sdp, "GFS2:adding buf while frozen\n");
 =09=09gfs2_assert_withdraw(sdp, 0);
 =09}
+=09if (unlikely(gfs2_withdrawn(sdp))) {
+=09=09fs_info(sdp, "GFS2:adding buf while withdrawn! 0x%llx\n",
+=09=09=09(unsigned long long)bd->bd_bh->b_blocknr);
+=09}
 =09gfs2_pin(sdp, bd->bd_bh);
 =09mh->__pad0 =3D cpu_to_be64(0);
 =09mh->mh_jid =3D cpu_to_be32(sdp->sd_jdesc->jd_jid);
--=20
2.24.1

