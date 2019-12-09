Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C8C06117092
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Dec 2019 16:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575905836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RjPwmHBqE+UUcSYi0J4PZx4o5x3HFz+8hPrvWDWkkKs=;
	b=WHTdh4evyyZdFpIfTqbYNGBvvk5MgaixY1sMWy1g7J3uAQD1NBnz0lx3/ylNbfS4PxY4Nh
	U3FoKoSa3bhOi1bAly6XMVXATamsDVNk/y05umTpQCSNjETEZQNeu74t8CV1PrH7d4bNUP
	rlN5+VxymYKth3NbHg4GEHbarhhUF6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-w_Vc0C_WM8es9ELP0g475w-1; Mon, 09 Dec 2019 10:37:14 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98304974DA;
	Mon,  9 Dec 2019 15:37:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F8485DA75;
	Mon,  9 Dec 2019 15:37:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F1171803C38;
	Mon,  9 Dec 2019 15:37:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9Fb8n4004938 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 10:37:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B0FFF5DA75; Mon,  9 Dec 2019 15:37:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-248.phx2.redhat.com [10.3.116.248])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D0E45D9D6
	for <cluster-devel@redhat.com>; Mon,  9 Dec 2019 15:37:08 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon,  9 Dec 2019 09:36:51 -0600
Message-Id: <20191209153700.700208-14-rpeterso@redhat.com>
In-Reply-To: <20191209153700.700208-1-rpeterso@redhat.com>
References: <20191209153700.700208-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v8 PATCH 13/22] gfs2: Issue revokes more
	intelligently
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: w_Vc0C_WM8es9ELP0g475w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, function gfs2_write_revokes would call
gfs2_ail1_empty, then traverse the sd_ail1_list looking for
transactions that had bds which were no longer queued to a glock.
And if it found some, it would try to issue revokes for them, up to
a predetermined maximum. There were two problems with how it did
this. First was the fact that gfs2_ail1_empty moves transactions
which have nothing remaining on the ail1 list from the sd_ail1_list
to the sd_ail2_list, thus making its traversal of sd_ail1_list
miss them completely, and therefore, never issue revokes for them.
Second was the fact that there were three traversals (or partial
traversals) of the sd_ail1_list, each of which took and then
released the sd_ail_lock lock: First inside gfs2_ail1_empty,
second to determine if there are any revokes to be issued, and
third to actually issue them. All this taking and releasing of the
sd_ail_lock meant other processes could modify the lists and the
conditions in which we're working.

This patch simplies the whole process by adding a new parameter
to function gfs2_ail1_empty, max_revokes. For normal calls, this
is passed in as 0, meaning we don't want to issue any revokes.
For function gfs2_write_revokes, we pass in the maximum number
of revokes we can, thus allowing gfs2_ail1_empty to add the
revokes where needed. This simplies the code, allows for a single
holding of the sd_ail_lock, and allows gfs2_ail1_empty to add
revokes for all the necessary bd items without missing any.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 61 +++++++++++++++++++--------------------------------
 1 file changed, 22 insertions(+), 39 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 58321a0a424a..f543899c4d70 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -194,11 +194,13 @@ static void gfs2_ail1_start(struct gfs2_sbd *sdp)
 /**
  * gfs2_ail1_empty_one - Check whether or not a trans in the AIL has been =
synced
  * @sdp: the filesystem
- * @ai: the AIL entry
+ * @tr: the transaction
+ * @max_revokes: If nonzero, issue revokes for the bd items for written bu=
ffers
  *
  */
=20
-static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *t=
r)
+static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *t=
r,
+=09=09=09=09int *max_revokes)
 {
 =09struct gfs2_bufdata *bd, *s;
 =09struct buffer_head *bh;
@@ -223,18 +225,28 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp,=
 struct gfs2_trans *tr)
 =09=09=09gfs2_io_error_bh(sdp, bh);
 =09=09=09set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 =09=09}
-=09=09list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
+=09=09/* If we have space for revokes and the bd is no longer on any
+=09=09   buf list, we can just add a revoke for it here and avoid
+=09=09   having to put it on the ail2 list, where it would need to
+=09=09   be revoked later. */
+=09=09if (*max_revokes && list_empty(&bd->bd_list)) {
+=09=09=09gfs2_add_revoke(sdp, bd);
+=09=09=09(*max_revokes)--;
+=09=09} else {
+=09=09=09list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
+=09=09}
 =09}
 }
=20
 /**
  * gfs2_ail1_empty - Try to empty the ail1 lists
  * @sdp: The superblock
+ * @max_revokes: If non-zero, add revokes where appropriate
  *
  * Tries to empty the ail1 lists, starting with the oldest first
  */
=20
-static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
+static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
 {
 =09struct gfs2_trans *tr, *s;
 =09int oldest_tr =3D 1;
@@ -242,7 +254,7 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
=20
 =09spin_lock(&sdp->sd_ail_lock);
 =09list_for_each_entry_safe_reverse(tr, s, &sdp->sd_ail1_list, tr_list) {
-=09=09gfs2_ail1_empty_one(sdp, tr);
+=09=09gfs2_ail1_empty_one(sdp, tr, &max_revokes);
 =09=09if (list_empty(&tr->tr_ail1_list) && oldest_tr)
 =09=09=09list_move(&tr->tr_list, &sdp->sd_ail2_list);
 =09=09else
@@ -631,25 +643,9 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
=20
 void gfs2_write_revokes(struct gfs2_sbd *sdp)
 {
-=09struct gfs2_trans *tr;
-=09struct gfs2_bufdata *bd, *tmp;
-=09int have_revokes =3D 0;
 =09int max_revokes =3D (sdp->sd_sb.sb_bsize - sizeof(struct gfs2_log_descr=
iptor)) / sizeof(u64);
=20
-=09gfs2_ail1_empty(sdp);
-=09spin_lock(&sdp->sd_ail_lock);
-=09list_for_each_entry_reverse(tr, &sdp->sd_ail1_list, tr_list) {
-=09=09list_for_each_entry(bd, &tr->tr_ail2_list, bd_ail_st_list) {
-=09=09=09if (list_empty(&bd->bd_list)) {
-=09=09=09=09have_revokes =3D 1;
-=09=09=09=09goto done;
-=09=09=09}
-=09=09}
-=09}
-done:
-=09spin_unlock(&sdp->sd_ail_lock);
-=09if (have_revokes =3D=3D 0)
-=09=09return;
+=09gfs2_log_lock(sdp);
 =09while (sdp->sd_log_num_revoke > max_revokes)
 =09=09max_revokes +=3D (sdp->sd_sb.sb_bsize - sizeof(struct gfs2_meta_head=
er)) / sizeof(u64);
 =09max_revokes -=3D sdp->sd_log_num_revoke;
@@ -660,20 +656,7 @@ void gfs2_write_revokes(struct gfs2_sbd *sdp)
 =09=09if (!sdp->sd_log_blks_reserved)
 =09=09=09atomic_dec(&sdp->sd_log_blks_free);
 =09}
-=09gfs2_log_lock(sdp);
-=09spin_lock(&sdp->sd_ail_lock);
-=09list_for_each_entry_reverse(tr, &sdp->sd_ail1_list, tr_list) {
-=09=09list_for_each_entry_safe(bd, tmp, &tr->tr_ail2_list, bd_ail_st_list)=
 {
-=09=09=09if (max_revokes =3D=3D 0)
-=09=09=09=09goto out_of_blocks;
-=09=09=09if (!list_empty(&bd->bd_list))
-=09=09=09=09continue;
-=09=09=09gfs2_add_revoke(sdp, bd);
-=09=09=09max_revokes--;
-=09=09}
-=09}
-out_of_blocks:
-=09spin_unlock(&sdp->sd_ail_lock);
+=09gfs2_ail1_empty(sdp, max_revokes);
 =09gfs2_log_unlock(sdp);
=20
 =09if (!sdp->sd_log_num_revoke) {
@@ -872,7 +855,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
lock *gl, u32 flags)
 =09=09=09for (;;) {
 =09=09=09=09gfs2_ail1_start(sdp);
 =09=09=09=09gfs2_ail1_wait(sdp);
-=09=09=09=09if (gfs2_ail1_empty(sdp))
+=09=09=09=09if (gfs2_ail1_empty(sdp, 0))
 =09=09=09=09=09break;
 =09=09=09}
 =09=09=09if (gfs2_withdrawn(sdp))
@@ -1040,7 +1023,7 @@ int gfs2_logd(void *data)
=20
 =09=09did_flush =3D false;
 =09=09if (gfs2_jrnl_flush_reqd(sdp) || t =3D=3D 0) {
-=09=09=09gfs2_ail1_empty(sdp);
+=09=09=09gfs2_ail1_empty(sdp, 0);
 =09=09=09gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 =09=09=09=09       GFS2_LFC_LOGD_JFLUSH_REQD);
 =09=09=09did_flush =3D true;
@@ -1049,7 +1032,7 @@ int gfs2_logd(void *data)
 =09=09if (gfs2_ail_flush_reqd(sdp)) {
 =09=09=09gfs2_ail1_start(sdp);
 =09=09=09gfs2_ail1_wait(sdp);
-=09=09=09gfs2_ail1_empty(sdp);
+=09=09=09gfs2_ail1_empty(sdp, 0);
 =09=09=09gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 =09=09=09=09       GFS2_LFC_LOGD_AIL_FLUSH_REQD);
 =09=09=09did_flush =3D true;
--=20
2.23.0

