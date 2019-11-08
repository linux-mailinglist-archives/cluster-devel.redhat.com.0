Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 97E8CF4BF8
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Nov 2019 13:38:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573216728;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Qx3ZcYVTTqQDvYS9aaNYovoEz4Tf6HgBRpSE+cT0Fho=;
	b=cv89NCSKLqd7rHpdJttBz4E6N8nY7Rnjn06cABhRhaP9NkHOlsw8qW+N8JfdvYoBWebwRc
	MqyTLK6C9gkow0D1QNHuA6XE4PsTMYg/bQbOFAmcXT/+sBul3WM0TPZdvXHHE1feLC9ZwE
	yYYaFAJtCkiCxM/CO/aJK8Oio3YWDbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-tTvX5rhCOJ6_2zaIThVsXA-1; Fri, 08 Nov 2019 07:38:46 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF895800054;
	Fri,  8 Nov 2019 12:38:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 069456084E;
	Fri,  8 Nov 2019 12:38:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DFED4BB78;
	Fri,  8 Nov 2019 12:38:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8CceLI002217 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 07:38:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E878C5D6B7; Fri,  8 Nov 2019 12:38:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.206.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 286305D6AE;
	Fri,  8 Nov 2019 12:38:37 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri,  8 Nov 2019 13:38:36 +0100
Message-Id: <20191108123836.5248-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Remove active journal side effect
	from gfs2_write_log_header
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
X-MC-Unique: tTvX5rhCOJ6_2zaIThVsXA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Function gfs2_write_log_header can be used to write a log header into any o=
f
the journals of a filesystem.  When used on the node's own journal,
gfs2_write_log_header advances the current position in the log
(sdp->sd_log_flush_head) as a side effect, through function gfs2_log_bmap.

This is confusing, and it also means that we can't use gfs2_log_bmap for ot=
her
journals even if they have an extent map.  So clean this mess up by not
advancing sdp->sd_log_flush_head in gfs2_write_log_header or gfs2_log_bmap
anymore and making that a responsibility of the callers instead.

This is related to commit 7c70b896951c ("gfs2: clean_journal improperly set
sd_log_flush_head").

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c      |  3 ++-
 fs/gfs2/lops.c     | 29 +++++++++++++++--------------
 fs/gfs2/lops.h     |  3 ++-
 fs/gfs2/recovery.c |  2 --
 4 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 58e237fba565..162246fafc2e 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -707,7 +707,7 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct=
 gfs2_jdesc *jd,
 =09lh->lh_nsec =3D cpu_to_be32(tv.tv_nsec);
 =09lh->lh_sec =3D cpu_to_be64(tv.tv_sec);
 =09if (!list_empty(&jd->extent_list))
-=09=09dblock =3D gfs2_log_bmap(sdp);
+=09=09dblock =3D gfs2_log_bmap(jd, lblock);
 =09else {
 =09=09int ret =3D gfs2_lblk_to_dblk(jd->jd_inode, lblock, &dblock);
 =09=09if (gfs2_assert_withdraw(sdp, ret =3D=3D 0))
@@ -768,6 +768,7 @@ static void log_write_header(struct gfs2_sbd *sdp, u32 =
flags)
 =09sdp->sd_log_idle =3D (tail =3D=3D sdp->sd_log_flush_head);
 =09gfs2_write_log_header(sdp, sdp->sd_jdesc, sdp->sd_log_sequence++, tail,
 =09=09=09      sdp->sd_log_flush_head, flags, op_flags);
+=09gfs2_log_incr_head(sdp);
=20
 =09if (sdp->sd_log_tail !=3D tail)
 =09=09log_pull_tail(sdp, tail);
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 5b17979af539..313b83ef6657 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -129,7 +129,7 @@ static void gfs2_unpin(struct gfs2_sbd *sdp, struct buf=
fer_head *bh,
 =09atomic_dec(&sdp->sd_log_pinned);
 }
=20
-static void gfs2_log_incr_head(struct gfs2_sbd *sdp)
+void gfs2_log_incr_head(struct gfs2_sbd *sdp)
 {
 =09BUG_ON((sdp->sd_log_flush_head =3D=3D sdp->sd_log_tail) &&
 =09       (sdp->sd_log_flush_head !=3D sdp->sd_log_head));
@@ -138,18 +138,13 @@ static void gfs2_log_incr_head(struct gfs2_sbd *sdp)
 =09=09sdp->sd_log_flush_head =3D 0;
 }
=20
-u64 gfs2_log_bmap(struct gfs2_sbd *sdp)
+u64 gfs2_log_bmap(struct gfs2_jdesc *jd, unsigned int lblock)
 {
-=09unsigned int lbn =3D sdp->sd_log_flush_head;
 =09struct gfs2_journal_extent *je;
-=09u64 block;
=20
-=09list_for_each_entry(je, &sdp->sd_jdesc->extent_list, list) {
-=09=09if ((lbn >=3D je->lblock) && (lbn < (je->lblock + je->blocks))) {
-=09=09=09block =3D je->dblock + lbn - je->lblock;
-=09=09=09gfs2_log_incr_head(sdp);
-=09=09=09return block;
-=09=09}
+=09list_for_each_entry(je, &jd->extent_list, list) {
+=09=09if (lblock >=3D je->lblock && lblock < je->lblock + je->blocks)
+=09=09=09return je->dblock + lblock - je->lblock;
 =09}
=20
 =09return -1;
@@ -351,8 +346,11 @@ void gfs2_log_write(struct gfs2_sbd *sdp, struct page =
*page,
=20
 static void gfs2_log_write_bh(struct gfs2_sbd *sdp, struct buffer_head *bh=
)
 {
-=09gfs2_log_write(sdp, bh->b_page, bh->b_size, bh_offset(bh),
-=09=09       gfs2_log_bmap(sdp));
+=09u64 dblock;
+
+=09dblock =3D gfs2_log_bmap(sdp->sd_jdesc, sdp->sd_log_flush_head);
+=09gfs2_log_incr_head(sdp);
+=09gfs2_log_write(sdp, bh->b_page, bh->b_size, bh_offset(bh), dblock);
 }
=20
 /**
@@ -369,8 +367,11 @@ static void gfs2_log_write_bh(struct gfs2_sbd *sdp, st=
ruct buffer_head *bh)
 void gfs2_log_write_page(struct gfs2_sbd *sdp, struct page *page)
 {
 =09struct super_block *sb =3D sdp->sd_vfs;
-=09gfs2_log_write(sdp, page, sb->s_blocksize, 0,
-=09=09       gfs2_log_bmap(sdp));
+=09u64 dblock;
+
+=09dblock =3D gfs2_log_bmap(sdp->sd_jdesc, sdp->sd_log_flush_head);
+=09gfs2_log_incr_head(sdp);
+=09gfs2_log_write(sdp, page, sb->s_blocksize, 0, dblock);
 }
=20
 /**
diff --git a/fs/gfs2/lops.h b/fs/gfs2/lops.h
index 9c059957a733..9c5e4e491e03 100644
--- a/fs/gfs2/lops.h
+++ b/fs/gfs2/lops.h
@@ -18,7 +18,8 @@
 =09 ~(2 * sizeof(__be64) - 1))
=20
 extern const struct gfs2_log_operations *gfs2_log_ops[];
-extern u64 gfs2_log_bmap(struct gfs2_sbd *sdp);
+extern void gfs2_log_incr_head(struct gfs2_sbd *sdp);
+extern u64 gfs2_log_bmap(struct gfs2_jdesc *jd, unsigned int lbn);
 extern void gfs2_log_write(struct gfs2_sbd *sdp, struct page *page,
 =09=09=09   unsigned size, unsigned offset, u64 blkno);
 extern void gfs2_log_write_page(struct gfs2_sbd *sdp, struct page *page);
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index f4aa8551277b..60c9371b184b 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -263,8 +263,6 @@ static void clean_journal(struct gfs2_jdesc *jd,
 =09u32 lblock =3D head->lh_blkno;
=20
 =09gfs2_replay_incr_blk(jd, &lblock);
-=09if (jd->jd_jid =3D=3D sdp->sd_lockstruct.ls_jid)
-=09=09sdp->sd_log_flush_head =3D lblock;
 =09gfs2_write_log_header(sdp, jd, head->lh_sequence + 1, 0, lblock,
 =09=09=09      GFS2_LOG_HEAD_UNMOUNT | GFS2_LOG_HEAD_RECOVERY,
 =09=09=09      REQ_PREFLUSH | REQ_FUA | REQ_META | REQ_SYNC);
--=20
2.20.1

