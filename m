Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0DC186EDD
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Mar 2020 16:43:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584373436;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tZS/QwTdCx6vPUsj/NLKb6rGPjKAQlnQXNiMtgwAjTA=;
	b=JW9lanElbZSnS7tvUcxewQq7cUzVXsuv4cQhbZ9kk8bqOMqOXA3rvdBX1KgzEAWZaFbHCY
	CcEv3khyColNDE2w3C8YEQ2raunB1xqZ0x009BZ1zcQgQ3x+OZlvBsVJM1qGJD5uf62z79
	o3jiZn7LUPcvGL6vKlm0EpkGrKplHuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-8mSFoE_MMsamBJyLpNgG1w-1; Mon, 16 Mar 2020 11:43:54 -0400
X-MC-Unique: 8mSFoE_MMsamBJyLpNgG1w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BE1410B79BD;
	Mon, 16 Mar 2020 15:43:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8AD592D0C;
	Mon, 16 Mar 2020 15:43:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5B9718089C8;
	Mon, 16 Mar 2020 15:43:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02GFhn90022350 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 16 Mar 2020 11:43:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B84E85DA76; Mon, 16 Mar 2020 15:43:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-206-58.brq.redhat.com [10.40.206.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2AC55D9C9;
	Mon, 16 Mar 2020 15:43:45 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 16 Mar 2020 16:43:44 +0100
Message-Id: <20200316154344.182925-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Switch to list_{first,last}_entry
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

Replace open-coded versions of list_first_entry and list_last_entry with th=
ose
functions.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c     |  4 ++--
 fs/gfs2/glock.c    | 10 +++++-----
 fs/gfs2/log.c      |  9 ++++-----
 fs/gfs2/lops.c     |  6 +++---
 fs/gfs2/quota.c    |  6 +++---
 fs/gfs2/recovery.c |  2 +-
 fs/gfs2/super.c    |  4 ++--
 7 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 08f6fbb3655e..2fe4457e1d01 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -2223,7 +2223,7 @@ void gfs2_free_journal_extents(struct gfs2_jdesc *jd)
 =09struct gfs2_journal_extent *jext;
=20
 =09while(!list_empty(&jd->extent_list)) {
-=09=09jext =3D list_entry(jd->extent_list.next, struct gfs2_journal_extent=
, list);
+=09=09jext =3D list_first_entry(&jd->extent_list, struct gfs2_journal_exte=
nt, list);
 =09=09list_del(&jext->list);
 =09=09kfree(jext);
 =09}
@@ -2244,7 +2244,7 @@ static int gfs2_add_jextent(struct gfs2_jdesc *jd, u6=
4 lblock, u64 dblock, u64 b
 =09struct gfs2_journal_extent *jext;
=20
 =09if (!list_empty(&jd->extent_list)) {
-=09=09jext =3D list_entry(jd->extent_list.prev, struct gfs2_journal_extent=
, list);
+=09=09jext =3D list_last_entry(&jd->extent_list, struct gfs2_journal_exten=
t, list);
 =09=09if ((jext->dblock + jext->blocks) =3D=3D dblock) {
 =09=09=09jext->blocks +=3D blocks;
 =09=09=09return 0;
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index d0eceaff3cea..d33bfbfe4a93 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -281,7 +281,7 @@ void gfs2_glock_put(struct gfs2_glock *gl)
=20
 static inline int may_grant(const struct gfs2_glock *gl, const struct gfs2=
_holder *gh)
 {
-=09const struct gfs2_holder *gh_head =3D list_entry(gl->gl_holders.next, c=
onst struct gfs2_holder, gh_list);
+=09const struct gfs2_holder *gh_head =3D list_first_entry(&gl->gl_holders,=
 const struct gfs2_holder, gh_list);
 =09if ((gh->gh_state =3D=3D LM_ST_EXCLUSIVE ||
 =09     gh_head->gh_state =3D=3D LM_ST_EXCLUSIVE) && gh !=3D gh_head)
 =09=09return 0;
@@ -613,7 +613,7 @@ static inline struct gfs2_holder *find_first_holder(con=
st struct gfs2_glock *gl)
 =09struct gfs2_holder *gh;
=20
 =09if (!list_empty(&gl->gl_holders)) {
-=09=09gh =3D list_entry(gl->gl_holders.next, struct gfs2_holder, gh_list);
+=09=09gh =3D list_first_entry(&gl->gl_holders, struct gfs2_holder, gh_list=
);
 =09=09if (test_bit(HIF_HOLDER, &gh->gh_iflags))
 =09=09=09return gh;
 =09}
@@ -1160,7 +1160,7 @@ __acquires(&gl->gl_lockref.lock)
 =09}
 =09list_add_tail(&gh->gh_list, insert_pt);
 do_cancel:
-=09gh =3D list_entry(gl->gl_holders.next, struct gfs2_holder, gh_list);
+=09gh =3D list_first_entry(&gl->gl_holders, struct gfs2_holder, gh_list);
 =09if (!(gh->gh_flags & LM_FLAG_PRIORITY)) {
 =09=09spin_unlock(&gl->gl_lockref.lock);
 =09=09if (sdp->sd_lockstruct.ls_ops->lm_cancel)
@@ -1555,7 +1555,7 @@ __acquires(&lru_lock)
 =09list_sort(NULL, list, glock_cmp);
=20
 =09while(!list_empty(list)) {
-=09=09gl =3D list_entry(list->next, struct gfs2_glock, gl_lru);
+=09=09gl =3D list_first_entry(list, struct gfs2_glock, gl_lru);
 =09=09list_del_init(&gl->gl_lru);
 =09=09if (!spin_trylock(&gl->gl_lockref.lock)) {
 add_back_to_lru:
@@ -1596,7 +1596,7 @@ static long gfs2_scan_glock_lru(int nr)
=20
 =09spin_lock(&lru_lock);
 =09while ((nr-- >=3D 0) && !list_empty(&lru_list)) {
-=09=09gl =3D list_entry(lru_list.next, struct gfs2_glock, gl_lru);
+=09=09gl =3D list_first_entry(&lru_list, struct gfs2_glock, gl_lru);
=20
 =09=09/* Test for being demotable */
 =09=09if (!test_bit(GLF_LOCK, &gl->gl_flags)) {
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 00a2e721a374..a86300d141a2 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -280,8 +280,7 @@ static void gfs2_ail2_empty_one(struct gfs2_sbd *sdp, s=
truct gfs2_trans *tr)
 =09struct gfs2_bufdata *bd;
=20
 =09while (!list_empty(head)) {
-=09=09bd =3D list_entry(head->prev, struct gfs2_bufdata,
-=09=09=09=09bd_ail_st_list);
+=09=09bd =3D list_last_entry(head, struct gfs2_bufdata, bd_ail_st_list);
 =09=09gfs2_assert(sdp, bd->bd_tr =3D=3D tr);
 =09=09gfs2_remove_from_ail(bd);
 =09}
@@ -487,7 +486,7 @@ static unsigned int current_tail(struct gfs2_sbd *sdp)
 =09if (list_empty(&sdp->sd_ail1_list)) {
 =09=09tail =3D sdp->sd_log_head;
 =09} else {
-=09=09tr =3D list_entry(sdp->sd_ail1_list.prev, struct gfs2_trans,
+=09=09tr =3D list_last_entry(&sdp->sd_ail1_list, struct gfs2_trans,
 =09=09=09=09tr_list);
 =09=09tail =3D tr->tr_first;
 =09}
@@ -549,7 +548,7 @@ static void gfs2_ordered_write(struct gfs2_sbd *sdp)
 =09spin_lock(&sdp->sd_ordered_lock);
 =09list_sort(NULL, &sdp->sd_log_ordered, &ip_cmp);
 =09while (!list_empty(&sdp->sd_log_ordered)) {
-=09=09ip =3D list_entry(sdp->sd_log_ordered.next, struct gfs2_inode, i_ord=
ered);
+=09=09ip =3D list_first_entry(&sdp->sd_log_ordered, struct gfs2_inode, i_o=
rdered);
 =09=09if (ip->i_inode.i_mapping->nrpages =3D=3D 0) {
 =09=09=09test_and_clear_bit(GIF_ORDERED, &ip->i_flags);
 =09=09=09list_del(&ip->i_ordered);
@@ -570,7 +569,7 @@ static void gfs2_ordered_wait(struct gfs2_sbd *sdp)
=20
 =09spin_lock(&sdp->sd_ordered_lock);
 =09while (!list_empty(&sdp->sd_log_ordered)) {
-=09=09ip =3D list_entry(sdp->sd_log_ordered.next, struct gfs2_inode, i_ord=
ered);
+=09=09ip =3D list_first_entry(&sdp->sd_log_ordered, struct gfs2_inode, i_o=
rdered);
 =09=09list_del(&ip->i_ordered);
 =09=09WARN_ON(!test_and_clear_bit(GIF_ORDERED, &ip->i_flags));
 =09=09if (ip->i_inode.i_mapping->nrpages =3D=3D 0)
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index c090d5ad3f22..68ce5b6d6e57 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -730,7 +730,7 @@ static void buf_lo_after_commit(struct gfs2_sbd *sdp, s=
truct gfs2_trans *tr)
=20
 =09head =3D &tr->tr_buf;
 =09while (!list_empty(head)) {
-=09=09bd =3D list_entry(head->next, struct gfs2_bufdata, bd_list);
+=09=09bd =3D list_first_entry(head, struct gfs2_bufdata, bd_list);
 =09=09list_del_init(&bd->bd_list);
 =09=09gfs2_unpin(sdp, bd->bd_bh, tr);
 =09}
@@ -900,7 +900,7 @@ static void revoke_lo_after_commit(struct gfs2_sbd *sdp=
, struct gfs2_trans *tr)
 =09struct gfs2_glock *gl;
=20
 =09while (!list_empty(head)) {
-=09=09bd =3D list_entry(head->next, struct gfs2_bufdata, bd_list);
+=09=09bd =3D list_first_entry(head, struct gfs2_bufdata, bd_list);
 =09=09list_del_init(&bd->bd_list);
 =09=09gl =3D bd->bd_gl;
 =09=09gfs2_glock_remove_revoke(gl);
@@ -1079,7 +1079,7 @@ static void databuf_lo_after_commit(struct gfs2_sbd *=
sdp, struct gfs2_trans *tr)
=20
 =09head =3D &tr->tr_databuf;
 =09while (!list_empty(head)) {
-=09=09bd =3D list_entry(head->next, struct gfs2_bufdata, bd_list);
+=09=09bd =3D list_first_entry(head, struct gfs2_bufdata, bd_list);
 =09=09list_del_init(&bd->bd_list);
 =09=09gfs2_unpin(sdp, bd->bd_bh, tr);
 =09}
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index e9f93045eb01..2314cae949ef 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -115,7 +115,7 @@ static void gfs2_qd_dispose(struct list_head *list)
 =09struct gfs2_sbd *sdp;
=20
 =09while (!list_empty(list)) {
-=09=09qd =3D list_entry(list->next, struct gfs2_quota_data, qd_lru);
+=09=09qd =3D list_first_entry(list, struct gfs2_quota_data, qd_lru);
 =09=09sdp =3D qd->qd_gl->gl_name.ln_sbd;
=20
 =09=09list_del(&qd->qd_lru);
@@ -1441,7 +1441,7 @@ void gfs2_quota_cleanup(struct gfs2_sbd *sdp)
=20
 =09spin_lock(&qd_lock);
 =09while (!list_empty(head)) {
-=09=09qd =3D list_entry(head->prev, struct gfs2_quota_data, qd_list);
+=09=09qd =3D list_last_entry(head, struct gfs2_quota_data, qd_list);
=20
 =09=09list_del(&qd->qd_list);
=20
@@ -1504,7 +1504,7 @@ static void quotad_check_trunc_list(struct gfs2_sbd *=
sdp)
 =09=09ip =3D NULL;
 =09=09spin_lock(&sdp->sd_trunc_lock);
 =09=09if (!list_empty(&sdp->sd_trunc_list)) {
-=09=09=09ip =3D list_entry(sdp->sd_trunc_list.next,
+=09=09=09ip =3D list_first_entry(&sdp->sd_trunc_list,
 =09=09=09=09=09struct gfs2_inode, i_trunc_list);
 =09=09=09list_del_init(&ip->i_trunc_list);
 =09=09}
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 85f830e56945..560b8ba006d1 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -111,7 +111,7 @@ void gfs2_revoke_clean(struct gfs2_jdesc *jd)
 =09struct gfs2_revoke_replay *rr;
=20
 =09while (!list_empty(head)) {
-=09=09rr =3D list_entry(head->next, struct gfs2_revoke_replay, rr_list);
+=09=09rr =3D list_first_entry(head, struct gfs2_revoke_replay, rr_list);
 =09=09list_del(&rr->rr_list);
 =09=09kfree(rr);
 =09}
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 0f8c0f057f80..91a86547b30c 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -62,7 +62,7 @@ void gfs2_jindex_free(struct gfs2_sbd *sdp)
 =09spin_unlock(&sdp->sd_jindex_spin);
=20
 =09while (!list_empty(&list)) {
-=09=09jd =3D list_entry(list.next, struct gfs2_jdesc, jd_list);
+=09=09jd =3D list_first_entry(&list, struct gfs2_jdesc, jd_list);
 =09=09gfs2_free_journal_extents(jd);
 =09=09list_del(&jd->jd_list);
 =09=09iput(jd->jd_inode);
@@ -446,7 +446,7 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sd=
p)
=20
 out:
 =09while (!list_empty(&list)) {
-=09=09lfcc =3D list_entry(list.next, struct lfcc, list);
+=09=09lfcc =3D list_first_entry(&list, struct lfcc, list);
 =09=09list_del(&lfcc->list);
 =09=09gfs2_glock_dq_uninit(&lfcc->gh);
 =09=09kfree(lfcc);
--=20
2.24.1

