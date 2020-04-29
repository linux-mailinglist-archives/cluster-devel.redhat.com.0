Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A8BEF1BE02B
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Apr 2020 16:06:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588169199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SK32gLNRx01CmvMLyms+FHnCFrzAAxD6ALoF9C/o1/8=;
	b=dp1j/s6jwHzQZKRwmwdvO0g/tAsNRETt4a5P3Xo5vWHyIGf31JnL7Gjw4E2ObRLeMcjRDn
	WIf/MP6Mj/7ZZozPfCIb7JnWDaC2jauzwslQtKULavOgHXBp2/e6DKILiYYY8QgdyiAaVY
	Gr2KBHTCkwDgBecFPHFo+0NeoyqOjyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-xbyB5OxyODayn37RS3et9g-1; Wed, 29 Apr 2020 10:06:37 -0400
X-MC-Unique: xbyB5OxyODayn37RS3et9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C103718FF663;
	Wed, 29 Apr 2020 14:06:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 064B55D70B;
	Wed, 29 Apr 2020 14:06:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D0151809542;
	Wed, 29 Apr 2020 14:06:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TE6S7J008226 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 10:06:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9CD9F1002388; Wed, 29 Apr 2020 14:06:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-114-63.ams2.redhat.com [10.36.114.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B23AE1001281;
	Wed, 29 Apr 2020 14:06:24 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 29 Apr 2020 16:06:23 +0200
Message-Id: <20200429140623.236426-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: stable@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: More gfs2_find_jhead fixes
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

It turns out that when extending an existing bio, gfs2_find_jhead fails to
check if the block number is consecutive, which leads to incorrect reads fo=
r
fragmented journals.

In addition, limit the maximum bio size to an arbitrary value of 2 megabyte=
s:
since commit 07173c3ec276 ("block: enable multipage bvecs"), if we just kee=
p
adding pages until bio_add_page fails, bios will grow much larger than usef=
ul,
which pins more memory than necessary with barely any additional performanc=
e
gains.

Fixes: f4686c26ecc3 ("gfs2: read journal in large chunks")
Cc: stable@vger.kernel.org # v5.2+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/lops.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 5ea96757afc4..48b54ec1c793 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -263,7 +263,7 @@ static struct bio *gfs2_log_alloc_bio(struct gfs2_sbd *=
sdp, u64 blkno,
 =09struct super_block *sb =3D sdp->sd_vfs;
 =09struct bio *bio =3D bio_alloc(GFP_NOIO, BIO_MAX_PAGES);
=20
-=09bio->bi_iter.bi_sector =3D blkno << (sb->s_blocksize_bits - 9);
+=09bio->bi_iter.bi_sector =3D blkno << sdp->sd_fsb2bb_shift;
 =09bio_set_dev(bio, sb->s_bdev);
 =09bio->bi_end_io =3D end_io;
 =09bio->bi_private =3D sdp;
@@ -509,7 +509,7 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_=
log_header_host *head,
 =09unsigned int bsize =3D sdp->sd_sb.sb_bsize, off;
 =09unsigned int bsize_shift =3D sdp->sd_sb.sb_bsize_shift;
 =09unsigned int shift =3D PAGE_SHIFT - bsize_shift;
-=09unsigned int readahead_blocks =3D BIO_MAX_PAGES << shift;
+=09unsigned int max_bio_size =3D 2 * 1024 * 1024;
 =09struct gfs2_journal_extent *je;
 =09int sz, ret =3D 0;
 =09struct bio *bio =3D NULL;
@@ -537,12 +537,17 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs=
2_log_header_host *head,
 =09=09=09=09off =3D 0;
 =09=09=09}
=20
-=09=09=09if (!bio || (bio_chained && !off)) {
+=09=09=09if (!bio || (bio_chained && !off) ||
+=09=09=09    bio->bi_iter.bi_size >=3D max_bio_size) {
 =09=09=09=09/* start new bio */
 =09=09=09} else {
-=09=09=09=09sz =3D bio_add_page(bio, page, bsize, off);
-=09=09=09=09if (sz =3D=3D bsize)
-=09=09=09=09=09goto block_added;
+=09=09=09=09sector_t sector =3D dblock << sdp->sd_fsb2bb_shift;
+
+=09=09=09=09if (bio_end_sector(bio) =3D=3D sector) {
+=09=09=09=09=09sz =3D bio_add_page(bio, page, bsize, off);
+=09=09=09=09=09if (sz =3D=3D bsize)
+=09=09=09=09=09=09goto block_added;
+=09=09=09=09}
 =09=09=09=09if (off) {
 =09=09=09=09=09unsigned int blocks =3D
 =09=09=09=09=09=09(PAGE_SIZE - off) >> bsize_shift;
@@ -568,7 +573,7 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_=
log_header_host *head,
 =09=09=09off +=3D bsize;
 =09=09=09if (off =3D=3D PAGE_SIZE)
 =09=09=09=09page =3D NULL;
-=09=09=09if (blocks_submitted < blocks_read + readahead_blocks) {
+=09=09=09if (blocks_submitted < 2 * max_bio_size >> bsize_shift) {
 =09=09=09=09/* Keep at least one bio in flight */
 =09=09=09=09continue;
 =09=09=09}

base-commit: fbe051ea4adf66950e2f23e71ace8eeb4e0e1c73
prerequisite-patch-id: f37202c2597b647c19a42736cfec807040560d9b
--=20
2.25.3

