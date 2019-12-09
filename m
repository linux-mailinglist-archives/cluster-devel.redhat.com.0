Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B2FC1117091
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Dec 2019 16:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575905836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bK7NNV/UREkWQD6hUmw6yVYo4pM1qcN1h9MZgwuXsW8=;
	b=cOdgDjHYBjf+EB2IMG2sfJElms7d9pR1DVdRaLdt4YwuvSK7FpaO6w38H9Ewr3BNAYpydM
	YSFVvovno+qYMLc3BzcdqgH+CQ4Kc3hV1KdJR/Wj+zVE1ybW5YKQwKCmP2WYYDUjbIhtnU
	CVAsY/OMFXSfbi//y46EevI18zzjsTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-QTFkkGfZN5OfW02CC8fREQ-1; Mon, 09 Dec 2019 10:37:14 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F531CF089;
	Mon,  9 Dec 2019 15:37:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D52F5C240;
	Mon,  9 Dec 2019 15:37:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EE7A8354F;
	Mon,  9 Dec 2019 15:37:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9Fb4bk004839 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 10:37:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 72E4C5DA75; Mon,  9 Dec 2019 15:37:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-248.phx2.redhat.com [10.3.116.248])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F0565D9D6
	for <cluster-devel@redhat.com>; Mon,  9 Dec 2019 15:37:04 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon,  9 Dec 2019 09:36:39 -0600
Message-Id: <20191209153700.700208-2-rpeterso@redhat.com>
In-Reply-To: <20191209153700.700208-1-rpeterso@redhat.com>
References: <20191209153700.700208-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v8 PATCH 01/22] gfs2: Introduce concept of a
	pending withdraw
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: QTFkkGfZN5OfW02CC8fREQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

File system withdraws can be delayed when inconsistencies are
discovered when we cannot withdraw immediately, for example, when
critical spin_locks are held. But delaying the withdraw can cause
gfs2 to ignore the error and keep running for a short period of time.
For example, an rgrp glock may be dequeued and demoted while there
are still buffers that haven't been properly revoked, due to io
errors writing to the journal.

This patch introduces a new concept of a pending withdraw, which
means an inconsistency has been discovered and we need to withdraw
at the earliest possible opportunity. In these cases, we aren't
quite withdrawn yet, but we still need to not dequeue glocks and
other critical things. If we dequeue the glocks and the withdraw
results in our journal being replayed, the replay could overwrite
data that's been modified by a different node that acquired the
glock in the meantime.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h |  1 +
 fs/gfs2/log.c    | 21 ++++++++-------------
 fs/gfs2/util.c   | 14 +++++++-------
 fs/gfs2/util.h   |  3 ++-
 4 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 5f89c515f5bb..6042babb7324 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -619,6 +619,7 @@ enum {
 =09SDF_FORCE_AIL_FLUSH     =3D 9,
 =09SDF_AIL1_IO_ERROR=09=3D 10,
 =09SDF_FS_FROZEN           =3D 11,
+=09SDF_WITHDRAWING=09=09=3D 12, /* Will withdraw eventually */
 };
=20
 enum gfs2_freeze_state {
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index eb3f2e7b8085..38a03c2203de 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -91,8 +91,7 @@ static void gfs2_remove_from_ail(struct gfs2_bufdata *bd)
=20
 static int gfs2_ail1_start_one(struct gfs2_sbd *sdp,
 =09=09=09       struct writeback_control *wbc,
-=09=09=09       struct gfs2_trans *tr,
-=09=09=09       bool *withdraw)
+=09=09=09       struct gfs2_trans *tr)
 __releases(&sdp->sd_ail_lock)
 __acquires(&sdp->sd_ail_lock)
 {
@@ -111,7 +110,7 @@ __acquires(&sdp->sd_ail_lock)
 =09=09=09    !test_and_set_bit(SDF_AIL1_IO_ERROR,
 =09=09=09=09=09      &sdp->sd_flags)) {
 =09=09=09=09gfs2_io_error_bh(sdp, bh);
-=09=09=09=09*withdraw =3D true;
+=09=09=09=09set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 =09=09=09}
 =09=09=09list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
 =09=09=09continue;
@@ -152,7 +151,6 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct write=
back_control *wbc)
 =09struct list_head *head =3D &sdp->sd_ail1_list;
 =09struct gfs2_trans *tr;
 =09struct blk_plug plug;
-=09bool withdraw =3D false;
=20
 =09trace_gfs2_ail_flush(sdp, wbc, 1);
 =09blk_start_plug(&plug);
@@ -161,13 +159,12 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct wri=
teback_control *wbc)
 =09list_for_each_entry_reverse(tr, head, tr_list) {
 =09=09if (wbc->nr_to_write <=3D 0)
 =09=09=09break;
-=09=09if (gfs2_ail1_start_one(sdp, wbc, tr, &withdraw) &&
-=09=09    !gfs2_withdrawn(sdp))
+=09=09if (gfs2_ail1_start_one(sdp, wbc, tr) && !gfs2_withdrawn(sdp))
 =09=09=09goto restart;
 =09}
 =09spin_unlock(&sdp->sd_ail_lock);
 =09blk_finish_plug(&plug);
-=09if (withdraw)
+=09if (test_bit(SDF_WITHDRAWING, &sdp->sd_flags))
 =09=09gfs2_lm_withdraw(sdp, NULL);
 =09trace_gfs2_ail_flush(sdp, wbc, 0);
 }
@@ -196,8 +193,7 @@ static void gfs2_ail1_start(struct gfs2_sbd *sdp)
  *
  */
=20
-static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *t=
r,
-=09=09=09=09bool *withdraw)
+static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *t=
r)
 {
 =09struct gfs2_bufdata *bd, *s;
 =09struct buffer_head *bh;
@@ -211,7 +207,7 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, s=
truct gfs2_trans *tr,
 =09=09if (!buffer_uptodate(bh) &&
 =09=09    !test_and_set_bit(SDF_AIL1_IO_ERROR, &sdp->sd_flags)) {
 =09=09=09gfs2_io_error_bh(sdp, bh);
-=09=09=09*withdraw =3D true;
+=09=09=09set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 =09=09}
 =09=09list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
 =09}
@@ -229,11 +225,10 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
 =09struct gfs2_trans *tr, *s;
 =09int oldest_tr =3D 1;
 =09int ret;
-=09bool withdraw =3D false;
=20
 =09spin_lock(&sdp->sd_ail_lock);
 =09list_for_each_entry_safe_reverse(tr, s, &sdp->sd_ail1_list, tr_list) {
-=09=09gfs2_ail1_empty_one(sdp, tr, &withdraw);
+=09=09gfs2_ail1_empty_one(sdp, tr);
 =09=09if (list_empty(&tr->tr_ail1_list) && oldest_tr)
 =09=09=09list_move(&tr->tr_list, &sdp->sd_ail2_list);
 =09=09else
@@ -242,7 +237,7 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
 =09ret =3D list_empty(&sdp->sd_ail1_list);
 =09spin_unlock(&sdp->sd_ail_lock);
=20
-=09if (withdraw)
+=09if (test_bit(SDF_WITHDRAWING, &sdp->sd_flags))
 =09=09gfs2_lm_withdraw(sdp, "fatal: I/O error(s)\n");
=20
 =09return ret;
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index ec600b487498..7305a7036c3e 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -258,13 +258,13 @@ void gfs2_io_error_bh_i(struct gfs2_sbd *sdp, struct =
buffer_head *bh,
 =09=09=09const char *function, char *file, unsigned int line,
 =09=09=09bool withdraw)
 {
-=09if (!gfs2_withdrawn(sdp))
-=09=09fs_err(sdp,
-=09=09       "fatal: I/O error\n"
-=09=09       "  block =3D %llu\n"
-=09=09       "  function =3D %s, file =3D %s, line =3D %u\n",
-=09=09       (unsigned long long)bh->b_blocknr,
-=09=09       function, file, line);
+=09if (gfs2_withdrawn(sdp))
+=09=09return;
+
+=09fs_err(sdp, "fatal: I/O error\n"
+=09       "  block =3D %llu\n"
+=09       "  function =3D %s, file =3D %s, line =3D %u\n",
+=09       (unsigned long long)bh->b_blocknr, function, file, line);
 =09if (withdraw)
 =09=09gfs2_lm_withdraw(sdp, NULL);
 }
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index f2702bc9837c..c0ea08c2beee 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -170,7 +170,8 @@ static inline unsigned int gfs2_tune_get_i(struct gfs2_=
tune *gt,
  */
 static inline bool gfs2_withdrawn(struct gfs2_sbd *sdp)
 {
-=09return test_bit(SDF_WITHDRAWN, &sdp->sd_flags);
+=09return test_bit(SDF_WITHDRAWN, &sdp->sd_flags) ||
+=09=09test_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 }
=20
 #define gfs2_tune_get(sdp, field) \
--=20
2.23.0

