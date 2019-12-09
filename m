Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 900661170A4
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Dec 2019 16:37:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575905848;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TZPUvqLYLHgZVieeSQDPM6AGnzzFbprX6eUsJfy5RIs=;
	b=hTR6N32mbMGbJNApqDk1e9mN5ok3xv3cG6tQBtXrovvV6reS2gtZLj8AqRbO5oLXOm3glR
	TyVzKVBzjb4ErHbG3yFayoEIwJ59dTivYoQl+aL17DmtTXfetZxP4Q8pjimGw3u0+hgHzq
	62t8FKjwuy0Y1Avfd1V2xX8N9Rl25A0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-VN1Pp6B4NyOlk7SSOOLhGQ-1; Mon, 09 Dec 2019 10:37:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2BD0107B7E5;
	Mon,  9 Dec 2019 15:37:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DB515D6D6;
	Mon,  9 Dec 2019 15:37:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87F1E1803C40;
	Mon,  9 Dec 2019 15:37:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9FbDw8005041 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 10:37:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6469C5D9D6; Mon,  9 Dec 2019 15:37:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-248.phx2.redhat.com [10.3.116.248])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 308105DA7B
	for <cluster-devel@redhat.com>; Mon,  9 Dec 2019 15:37:13 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon,  9 Dec 2019 09:36:58 -0600
Message-Id: <20191209153700.700208-21-rpeterso@redhat.com>
In-Reply-To: <20191209153700.700208-1-rpeterso@redhat.com>
References: <20191209153700.700208-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v8 PATCH 20/22] gfs2: drain the ail2 list
	after io errors
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
X-MC-Unique: VN1Pp6B4NyOlk7SSOOLhGQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, gfs2_logd continually tried to flush its journal
log, after the file system is withdrawn. We don't want to write anything
to the journal, lest we add corruption. Best course of action is to
drain the ail1 into the ail2 list (via gfs2_ail1_empty) then drain the
ail2 list with a new function, ail2_drain.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c   | 82 +++++++++++++++++++++++++++++++++++++++++++------
 fs/gfs2/trans.c |  4 +++
 2 files changed, 77 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 33ddf7ccfea9..aa8d636e7c6e 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -304,25 +304,34 @@ static void gfs2_ail1_wait(struct gfs2_sbd *sdp)
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
 }
=20
+/**
+ * gfs2_ail2_empty_one - Check whether or not a trans in the AIL has been =
synced
+ * @sdp: the filesystem
+ * @ai: the AIL entry
+ *
+ */
+
+static void gfs2_ail2_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *t=
r)
+{
+=09gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
+}
+
 static void ail2_empty(struct gfs2_sbd *sdp, unsigned int new_tail)
 {
 =09struct gfs2_trans *tr, *safe;
@@ -794,6 +803,41 @@ static void log_write_header(struct gfs2_sbd *sdp, u32=
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
+=09=09gfs2_trans_free(sdp, tr);
+=09}
+=09while (!list_empty(&sdp->sd_ail2_list)) {
+=09=09tr =3D list_first_entry(&sdp->sd_ail2_list, struct gfs2_trans,
+=09=09=09=09      tr_list);
+=09=09gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
+=09=09/* Same as gfs2_ail2_empty_one(sdp, tr);*/
+=09=09list_del(&tr->tr_list);
+=09=09gfs2_trans_free(sdp, tr);
+=09}
+=09spin_unlock(&sdp->sd_ail_lock);
+}
+
 /**
  * gfs2_log_flush - flush incore transaction(s)
  * @sdp: the filesystem
@@ -804,11 +848,18 @@ static void log_write_header(struct gfs2_sbd *sdp, u3=
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
 =09if (gl && !test_bit(GLF_LFLUSH, &gl->gl_flags) &&
 =09    atomic_read(&gl->gl_revokes) =3D=3D 0) {
@@ -837,8 +888,14 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_=
glock *gl, u32 flags)
 =09=09=09sdp->sd_log_num_revoke =3D=3D sdp->sd_log_commited_revoke);
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
@@ -848,6 +905,8 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
lock *gl, u32 flags)
 =09=09trace_gfs2_log_blocks(sdp, -1);
 =09=09log_write_header(sdp, flags);
 =09}
+=09if (gfs2_withdrawn(sdp))
+=09=09goto out;
 =09lops_after_commit(sdp, tr);
=20
 =09gfs2_log_lock(sdp);
@@ -886,6 +945,11 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_=
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
index 50f902a23c4d..56ed43eb8ee9 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -234,6 +234,10 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct=
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
2.23.0

