Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD5E1BDADE
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Apr 2020 13:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588160544;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QKWZTFSyH8yh+70/9SMyOKzRafxAi5fUnNRk0mcVKYY=;
	b=F3JFR7J7wfm9ReQ5qpY72qPq5VMCCcyBygnr1QOCfPeH45ZVYoZdyI73XTTf6o1c932B1/
	L3sApcGLvVDQlAak1MKM9l0DCg4mUHbK0CB6gXcHTakBA1YroqLyhgEb5OxdoOYtSOpR5b
	8ClxWChkfh15CWc1N8bootH3lycnlWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-OXR85C02PpmsbmvY_axvmQ-1; Wed, 29 Apr 2020 07:42:22 -0400
X-MC-Unique: OXR85C02PpmsbmvY_axvmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A1801800D4A;
	Wed, 29 Apr 2020 11:42:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C2F6282E6;
	Wed, 29 Apr 2020 11:42:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB7E01809542;
	Wed, 29 Apr 2020 11:42:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TBg6ib027385 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 07:42:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C0B85D71E; Wed, 29 Apr 2020 11:42:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-114-63.ams2.redhat.com [10.36.114.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9AF995D76A;
	Wed, 29 Apr 2020 11:42:02 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 29 Apr 2020 13:42:00 +0200
Message-Id: <20200429114200.232971-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: stable@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: Another gfs2_walk_metadata fix
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

Make sure we don't walk past the end of the metadata in gfs2_walk_metadata:=
 the
inode holds fewer pointers than indirect blocks.

Slightly clean up gfs2_iomap_get.

Fixes: a27a0c9b6a20 ("gfs2: gfs2_walk_metadata fix")
Cc: stable@vger.kernel.org # v5.3+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 936a8ec6b48e..6306eaae378b 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -528,10 +528,12 @@ static int gfs2_walk_metadata(struct inode *inode, st=
ruct metapath *mp,
=20
 =09=09/* Advance in metadata tree. */
 =09=09(mp->mp_list[hgt])++;
-=09=09if (mp->mp_list[hgt] >=3D sdp->sd_inptrs) {
-=09=09=09if (!hgt)
+=09=09if (hgt) {
+=09=09=09if (mp->mp_list[hgt] >=3D sdp->sd_inptrs)
+=09=09=09=09goto lower_metapath;
+=09=09} else {
+=09=09=09if (mp->mp_list[hgt] >=3D sdp->sd_diptrs)
 =09=09=09=09break;
-=09=09=09goto lower_metapath;
 =09=09}
=20
 fill_up_metapath:
@@ -876,10 +878,9 @@ static int gfs2_iomap_get(struct inode *inode, loff_t =
pos, loff_t length,
 =09=09=09=09=09ret =3D -ENOENT;
 =09=09=09=09=09goto unlock;
 =09=09=09=09} else {
-=09=09=09=09=09/* report a hole */
 =09=09=09=09=09iomap->offset =3D pos;
 =09=09=09=09=09iomap->length =3D length;
-=09=09=09=09=09goto do_alloc;
+=09=09=09=09=09goto hole_found;
 =09=09=09=09}
 =09=09=09}
 =09=09=09iomap->length =3D size;
@@ -933,8 +934,6 @@ static int gfs2_iomap_get(struct inode *inode, loff_t p=
os, loff_t length,
 =09return ret;
=20
 do_alloc:
-=09iomap->addr =3D IOMAP_NULL_ADDR;
-=09iomap->type =3D IOMAP_HOLE;
 =09if (flags & IOMAP_REPORT) {
 =09=09if (pos >=3D size)
 =09=09=09ret =3D -ENOENT;
@@ -956,6 +955,9 @@ static int gfs2_iomap_get(struct inode *inode, loff_t p=
os, loff_t length,
 =09=09if (pos < size && height =3D=3D ip->i_height)
 =09=09=09ret =3D gfs2_hole_size(inode, lblock, len, mp, iomap);
 =09}
+hole_found:
+=09iomap->addr =3D IOMAP_NULL_ADDR;
+=09iomap->type =3D IOMAP_HOLE;
 =09goto out;
 }
=20

base-commit: fbe051ea4adf66950e2f23e71ace8eeb4e0e1c73
--=20
2.25.3

