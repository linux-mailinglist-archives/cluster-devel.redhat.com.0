Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8045F141023
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Jan 2020 18:43:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579282997;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8iMPAGkdbw9gzroEoqubnHlkjyqRXyiu5DCmEy6UJ9E=;
	b=Pl2YYdo6L72wa3Uej2s8TWXeFxRuidObuHruKmwg9NzoppmNaUYh8MrUWQxyp4GhlCQCK7
	SEW7tWpO7L4sQ0fT3E0a4RYM2qhs4m7o0UwnHaaG0aTSTnnp/6b5WXHorqKZQwnRcd6O0U
	Ra087O16WtWHAP3gcw7e+K9g6QgGvHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-_Qa5R6nxNJSxxlapAxQ8Ng-1; Fri, 17 Jan 2020 12:43:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A14478010C0;
	Fri, 17 Jan 2020 17:43:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F30F7DB34;
	Fri, 17 Jan 2020 17:43:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4437F87092;
	Fri, 17 Jan 2020 17:43:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HHhBv0025348 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 12:43:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 579305DA66; Fri, 17 Jan 2020 17:43:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 898275D9CD;
	Fri, 17 Jan 2020 17:43:07 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 17 Jan 2020 18:43:06 +0100
Message-Id: <20200117174306.16735-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Fix incorrect variable name
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: _Qa5R6nxNJSxxlapAxQ8Ng-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Rename sd_log_commited_revoke to sd_log_committed_revoke.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h |  2 +-
 fs/gfs2/log.c    | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 0c4decdd3277..a64146896c4c 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -805,7 +805,7 @@ struct gfs2_sbd {
=20
 =09struct gfs2_trans *sd_log_tr;
 =09unsigned int sd_log_blks_reserved;
-=09int sd_log_commited_revoke;
+=09int sd_log_committed_revoke;
=20
 =09atomic_t sd_log_pinned;
 =09unsigned int sd_log_num_revoke;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index ef4a20d470c1..0ad2a7cf7d77 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -496,8 +496,8 @@ static unsigned int calc_reserved(struct gfs2_sbd *sdp)
 =09=09reserved +=3D DIV_ROUND_UP(dbuf, databuf_limit(sdp));
 =09}
=20
-=09if (sdp->sd_log_commited_revoke > 0)
-=09=09reserved +=3D gfs2_struct2blk(sdp, sdp->sd_log_commited_revoke);
+=09if (sdp->sd_log_committed_revoke > 0)
+=09=09reserved +=3D gfs2_struct2blk(sdp, sdp->sd_log_committed_revoke);
 =09/* One for the overall header */
 =09if (reserved)
 =09=09reserved++;
@@ -852,7 +852,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
lock *gl, u32 flags)
 =09if (unlikely(state =3D=3D SFS_FROZEN))
 =09=09gfs2_assert_withdraw(sdp, !sdp->sd_log_num_revoke);
 =09gfs2_assert_withdraw(sdp,
-=09=09=09sdp->sd_log_num_revoke =3D=3D sdp->sd_log_commited_revoke);
+=09=09=09sdp->sd_log_num_revoke =3D=3D sdp->sd_log_committed_revoke);
=20
 =09gfs2_ordered_write(sdp);
 =09lops_before_commit(sdp, tr);
@@ -871,7 +871,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_g=
lock *gl, u32 flags)
 =09gfs2_log_lock(sdp);
 =09sdp->sd_log_head =3D sdp->sd_log_flush_head;
 =09sdp->sd_log_blks_reserved =3D 0;
-=09sdp->sd_log_commited_revoke =3D 0;
+=09sdp->sd_log_committed_revoke =3D 0;
=20
 =09spin_lock(&sdp->sd_ail_lock);
 =09if (tr && !list_empty(&tr->tr_ail1_list)) {
@@ -943,7 +943,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs=
2_trans *tr)
 =09=09set_bit(TR_ATTACHED, &tr->tr_flags);
 =09}
=20
-=09sdp->sd_log_commited_revoke +=3D tr->tr_num_revoke;
+=09sdp->sd_log_committed_revoke +=3D tr->tr_num_revoke;
 =09reserved =3D calc_reserved(sdp);
 =09maxres =3D sdp->sd_log_blks_reserved + tr->tr_reserved;
 =09gfs2_assert_withdraw(sdp, maxres >=3D reserved);
--=20
2.20.1

