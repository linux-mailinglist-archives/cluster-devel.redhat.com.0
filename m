Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3651D146D90
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795021;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IT0k0xzRPAVO8bvxVaN6WzHJrtY2jBJfT003JeA+Tbc=;
	b=Ar5/6Bw5d/M1Qz8hHmialtm2VrXngNP8909vmIhn1Kh7G8NjFfVxU7D7WthpfAYY7ihMu4
	Cip7C5xr+K+Co7E+qp9Sn52OWHLdsU4jwznMqAFAao5CVnyrCzP+CmHHf7opfq5xLgiO9H
	Dx423UJYDOVq9vPXpGAymuhDI8vFMr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-xc1qJDzfMt2J5fpad6XRRg-1; Thu, 23 Jan 2020 10:56:59 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5BF6801E72;
	Thu, 23 Jan 2020 15:56:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32C2F38F;
	Thu, 23 Jan 2020 15:56:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F0A98594A;
	Thu, 23 Jan 2020 15:56:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFuDAn012378 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4A22160BE1; Thu, 23 Jan 2020 15:56:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23DD660C81
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:56:10 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:46 +0000
Message-Id: <20200123155552.1080247-8-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 07/13] savemeta: Remove anthropomorphize()
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
X-MC-Unique: xc1qJDzfMt2J5fpad6XRRg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This function doesn't work properly (e.g. converts 5GB in bytes to
4.1023MB) and we don't really need it as we can just report sizes in GB
with a simpler conversion instead.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 27 ++++-----------------------
 tests/edit.at        |  2 +-
 2 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index ad0c537d..f73cb0e0 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -206,25 +206,6 @@ static int block_is_systemfile(uint64_t blk)
 =09=09block_is_per_node(blk) || block_is_in_per_node(blk);
 }
=20
-/**
- * anthropomorphize - make a uint64_t number more human
- */
-static const char *anthropomorphize(unsigned long long inhuman_value)
-{
-=09const char *symbols =3D " KMGTPE";
-=09int i;
-=09unsigned long long val =3D inhuman_value, remainder =3D 0;
-=09static char out_val[32];
-
-=09memset(out_val, 0, sizeof(out_val));
-=09for (i =3D 0; i < 6 && val > 1024; i++) {
-=09=09remainder =3D val % 1024;
-=09=09val /=3D 1024;
-=09}
-=09sprintf(out_val, "%llu.%llu%cB", val, remainder, symbols[i]);
-=09return out_val;
-}
-
 static size_t di_save_len(struct gfs2_buffer_head *bh, uint64_t owner)
 {
 =09struct gfs2_inode *inode;
@@ -909,7 +890,7 @@ static int check_header(struct savemeta_header *smh)
 =09if (smh->sh_magic !=3D SAVEMETA_MAGIC || smh->sh_format > SAVEMETA_FORM=
AT)
 =09=09return -1;
 =09printf("Metadata saved at %s", ctime((time_t *)&smh->sh_time)); /* ctim=
e() adds \n */
-=09printf("File system size %s\n", anthropomorphize(smh->sh_fs_bytes));
+=09printf("File system size %.2fGB\n", smh->sh_fs_bytes / ((float)(1 << 30=
)));
 =09return 0;
 }
=20
@@ -940,7 +921,7 @@ void savemeta(char *out_fn, int saveoption, int gziplev=
el)
 =09=09do_dinode_extended(&di, lbh);
 =09brelse(lbh);
=20
-=09printf("Filesystem size: %s\n", anthropomorphize(sbd.fssize * sbd.bsize=
));
+=09printf("Filesystem size: %.2fGB\n", (sbd.fssize * sbd.bsize) / ((float)=
(1 << 30)));
 =09get_journal_inode_blocks();
=20
 =09err =3D init_per_node_lookup();
@@ -1105,8 +1086,8 @@ static int find_highest_block(struct metafd *mfd, off=
_t pos, uint64_t fssize)
 =09}
=20
 =09if (fssize > 0) {
-=09=09printf("Saved file system size is %"PRIu64" (0x%"PRIx64") blocks, %s=
\n",
-=09=09       fssize, fssize, anthropomorphize(fssize * sbd.bsize));
+=09=09printf("Saved file system size is %"PRIu64" blocks, %.2fGB\n",
+=09=09       fssize, (fssize * sbd.bsize) / ((float)(1 << 30)));
 =09=09sbd.fssize =3D fssize;
 =09} else {
 =09=09sbd.fssize =3D highest + 1;
diff --git a/tests/edit.at b/tests/edit.at
index e1a0fca7..c9c341b9 100644
--- a/tests/edit.at
+++ b/tests/edit.at
@@ -7,7 +7,7 @@ GFS_TGT_REGEN
 AT_CHECK([$GFS_MKFS -p lock_nolock $GFS_TGT $(($(gfs_max_blocks 4096)/2))]=
, 0, [ignore], [ignore])
 AT_CHECK([gfs2_edit savemeta $GFS_TGT test.meta > savemeta.log], 0, [ignor=
e], [ignore])
 AT_CHECK([head -2 savemeta.log], 0, [There are 1310716 blocks of 4096 byte=
s in the filesystem.
-Filesystem size: 4.1023GB
+Filesystem size: 5.00GB
 ], [ignore])
 GFS_TGT_REGEN
 AT_CHECK([gfs2_edit restoremeta test.meta $GFS_TGT], 0, [ignore], [ignore]=
)
--=20
2.24.1

