Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CA796FBAD7
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:31:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680667;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=anahfFKViAMxu04hKIffURIrFgdJj1TtX4mk6/TG+vk=;
	b=V2f3iF8MrZlVv/LMaQ6GBamW5lED+9XLz+yfi1sp10GZGeDwQpXvzxJFFmV0NBFOQVl8ix
	nLeThkDRPY1l3LpwaxRatgoMoNwMDMKGDAZhJDcV1lk38njFtw8rTyCIGnSxDokRxNfqLP
	G9iYNjtLMaDpDeXEeQ4dhE1Z3oS6cXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-zU2e0GU8Nt23uSIzYVxEiA-1; Wed, 13 Nov 2019 16:31:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D7E41011C94;
	Wed, 13 Nov 2019 21:31:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03EE960BE0;
	Wed, 13 Nov 2019 21:31:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DBC9418034E9;
	Wed, 13 Nov 2019 21:31:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLV1mT005468 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:31:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F32F269739; Wed, 13 Nov 2019 21:31:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC95569320
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:31:00 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:26 -0600
Message-Id: <20191113213030.237431-29-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 28/32] gfs2: Eliminate GFS2_RDF_UPTODATE
	flag in favor of buffer existence
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: zU2e0GU8Nt23uSIzYVxEiA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Before this patch, the rgrp code used two different methods to check
if the rgrp information was up-to-date: (1) The GFS2_RDF_UPTODATE flag
in the rgrp and (2) the existence (or not) of valid buffer_head
pointers in the first bitmap. When the buffer_heads are read in from
media, the rgrp is, by definition, up to date. When the rgrp glock is
invalidated, the buffer_heads are released, thereby indicating the
rgrp is no longer up to date (another node may have changed it).
So we don't need both of these flags. This patch eliminates the flag
in favor of simply checking if the buffer_head pointers exist.
This simplifies the code. It also makes it more bullet-proof:
if there are two methods, they can possibly get out of sync. With
one method, there's no way to get out of sync, and debugging is
easier.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c  |  3 ---
 fs/gfs2/incore.h |  1 -
 fs/gfs2/rgrp.c   | 22 +++++++++++-----------
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4072f37e4278..183fd7cbdbc1 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -213,9 +213,6 @@ static void rgrp_go_inval(struct gfs2_glock *gl, int fl=
ags)
=20
 =09WARN_ON_ONCE(!(flags & DIO_METADATA));
 =09truncate_inode_pages_range(mapping, gl->gl_vm.start, gl->gl_vm.end);
-
-=09if (rgd)
-=09=09rgd->rd_flags &=3D ~GFS2_RDF_UPTODATE;
 }
=20
 static struct gfs2_inode *gfs2_glock2inode(struct gfs2_glock *gl)
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index a15ddd2f9bf4..61be366a2fa7 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -113,7 +113,6 @@ struct gfs2_rgrpd {
 =09u32 rd_flags;
 =09u32 rd_extfail_pt;=09=09/* extent failure point */
 #define GFS2_RDF_CHECK=09=090x10000000 /* check for unlinked inodes */
-#define GFS2_RDF_UPTODATE=090x20000000 /* rg is up to date */
 #define GFS2_RDF_ERROR=09=090x40000000 /* error in rg */
 #define GFS2_RDF_PREFERRED=090x80000000 /* This rgrp is preferred */
 #define GFS2_RDF_MASK=09=090xf0000000 /* mask for internal flags */
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 10d3397ed3cd..e5eba83a1a42 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -939,7 +939,7 @@ static int read_rindex_entry(struct gfs2_inode *ip)
 =09=09goto fail;
=20
 =09rgd->rd_rgl =3D (struct gfs2_rgrp_lvb *)rgd->rd_gl->gl_lksb.sb_lvbptr;
-=09rgd->rd_flags &=3D ~(GFS2_RDF_UPTODATE | GFS2_RDF_PREFERRED);
+=09rgd->rd_flags &=3D ~GFS2_RDF_PREFERRED;
 =09if (rgd->rd_data > sdp->sd_max_rg_data)
 =09=09sdp->sd_max_rg_data =3D rgd->rd_data;
 =09spin_lock(&sdp->sd_rindex_spin);
@@ -1214,15 +1214,15 @@ static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rgd)
 =09=09}
 =09}
=20
-=09if (!(rgd->rd_flags & GFS2_RDF_UPTODATE)) {
-=09=09for (x =3D 0; x < length; x++)
-=09=09=09clear_bit(GBF_FULL, &rgd->rd_bits[x].bi_flags);
-=09=09gfs2_rgrp_in(rgd, (rgd->rd_bits[0].bi_bh)->b_data);
-=09=09rgd->rd_flags |=3D (GFS2_RDF_UPTODATE | GFS2_RDF_CHECK);
-=09=09rgd->rd_free_clone =3D rgd->rd_free;
-=09=09/* max out the rgrp allocation failure point */
-=09=09rgd->rd_extfail_pt =3D rgd->rd_free;
-=09}
+=09for (x =3D 0; x < length; x++)
+=09=09clear_bit(GBF_FULL, &rgd->rd_bits[x].bi_flags);
+
+=09gfs2_rgrp_in(rgd, (rgd->rd_bits[0].bi_bh)->b_data);
+=09rgd->rd_flags |=3D GFS2_RDF_CHECK;
+=09rgd->rd_free_clone =3D rgd->rd_free;
+=09/* max out the rgrp allocation failure point */
+=09rgd->rd_extfail_pt =3D rgd->rd_free;
+
 =09if (cpu_to_be32(GFS2_MAGIC) !=3D rgd->rd_rgl->rl_magic) {
 =09=09rgd->rd_rgl->rl_unlinked =3D cpu_to_be32(count_unlinked(rgd));
 =09=09gfs2_rgrp_ondisk2lvb(rgd->rd_rgl,
@@ -1254,7 +1254,7 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 {
 =09u32 rl_flags;
=20
-=09if (rgd->rd_flags & GFS2_RDF_UPTODATE)
+=09if (rgd->rd_bits[0].bi_bh)
 =09=09return 0;
=20
 =09if (cpu_to_be32(GFS2_MAGIC) !=3D rgd->rd_rgl->rl_magic)
--=20
2.23.0

