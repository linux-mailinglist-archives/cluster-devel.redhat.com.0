Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E773C12F9D7
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Jan 2020 16:31:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578065500;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kTq91Z8h0iuxopyy2j3245NhN1pB5rSgAuq1AdMhTb4=;
	b=ZLtXZmNBibOB1124xC9+Nphw8HffwWzJrCtwODEHDJTkwcyE6PBpHGhG/AVbxK6OkvwWJS
	EMMkHtZ2jtJrUM9bU9oMHXeW4saIEJJu9huIiq7crxWXNuEEXZt/zoDDacSZblHpZKyxG3
	p32NoB37xzC/4DyNdZBKltdBLjP7LSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-vKpj4xBpNWKg9r54e8nulg-1; Fri, 03 Jan 2020 10:31:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F7C6107AD41;
	Fri,  3 Jan 2020 15:31:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F7C984662;
	Fri,  3 Jan 2020 15:31:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 06C2D18089CD;
	Fri,  3 Jan 2020 15:31:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 003FVSZk016207 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jan 2020 10:31:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 77C5863BCA; Fri,  3 Jan 2020 15:31:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-64.phx2.redhat.com [10.3.116.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A4ED7BA20
	for <cluster-devel@redhat.com>; Fri,  3 Jan 2020 15:31:28 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  3 Jan 2020 09:31:22 -0600
Message-Id: <20200103153123.402971-6-rpeterso@redhat.com>
In-Reply-To: <20200103153123.402971-1-rpeterso@redhat.com>
References: <20200103153123.402971-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 5/6] gfs2: revoke cleanup: truncate
	functions
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
X-MC-Unique: vKpj4xBpNWKg9r54e8nulg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Several gfs2 functions failed to reserve enough revoke entries for their
transactions in the journal. Function gfs2_trans_remove_revoke unconditiona=
lly
decrements tr->tr_num_revoke, and if not enough revokes are reserved, the
value goes from 0 to  4294967295 (-1, but it's an unsigned int). This is la=
ter
re-added to the system-wide revoke numbers, thereby decrementing the value
(sd_log_commited_revoke) "properly," but by accident. This worked properly
most of the time because one transaction would reserve space for revokes,
then it would be merged with the system transaction (sdp->sd_log_tr) and it
usually did not run out, because you can hold a lot of revoke entries
per log descriptor block. Some of the code, such as gfs2_write_revokes, wou=
ld
work around this and somehow got it right most of the time. However, some
jdata tests with xfstests generic/269 encountered problems when it actually
ran out.

This patch is part of a series that tries to do proper accounting of revoke=
s.

This patch adds the needed revoke entries to truncate functions.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 403d5ada2f52..9a4c9c8611f7 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1355,8 +1355,6 @@ static int gfs2_block_zero_range(struct inode *inode,=
 loff_t from,
 =09return iomap_zero_range(inode, from, length, NULL, &gfs2_iomap_ops);
 }
=20
-#define GFS2_JTRUNC_REVOKES 8192
-
 /**
  * gfs2_journaled_truncate - Wrapper for truncate_pagecache for jdata file=
s
  * @inode: The inode being truncated
@@ -1371,7 +1369,7 @@ static int gfs2_block_zero_range(struct inode *inode,=
 loff_t from,
 static int gfs2_journaled_truncate(struct inode *inode, u64 oldsize, u64 n=
ewsize)
 {
 =09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
-=09u64 max_chunk =3D GFS2_JTRUNC_REVOKES * sdp->sd_vfs->s_blocksize;
+=09u64 max_chunk =3D sdp->sd_ldptrs * sdp->sd_vfs->s_blocksize;
 =09u64 chunk;
 =09int error;
=20
@@ -1395,7 +1393,8 @@ static int gfs2_journaled_truncate(struct inode *inod=
e, u64 oldsize, u64 newsize
 =09=09=09continue;
=20
 =09=09gfs2_trans_end(sdp);
-=09=09error =3D gfs2_trans_begin(sdp, RES_DINODE, GFS2_JTRUNC_REVOKES);
+=09=09error =3D gfs2_trans_begin(sdp, RES_DINODE,
+=09=09=09=09=09 RES_DINODE + sdp->sd_ldptrs);
 =09=09if (error)
 =09=09=09return error;
 =09}
@@ -1413,7 +1412,8 @@ static int trunc_start(struct inode *inode, u64 newsi=
ze)
 =09int error;
=20
 =09if (journaled)
-=09=09error =3D gfs2_trans_begin(sdp, RES_DINODE + RES_JDATA, GFS2_JTRUNC_=
REVOKES);
+=09=09error =3D gfs2_trans_begin(sdp, RES_DINODE + RES_JDATA,
+=09=09=09=09=09 RES_DINODE + sdp->sd_ldptrs);
 =09else
 =09=09error =3D gfs2_trans_begin(sdp, RES_DINODE, 0);
 =09if (error)
@@ -2404,7 +2404,7 @@ static int gfs2_journaled_truncate_range(struct inode=
 *inode, loff_t offset,
 =09=09=09=09=09 loff_t length)
 {
 =09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
-=09loff_t max_chunk =3D GFS2_JTRUNC_REVOKES * sdp->sd_vfs->s_blocksize;
+=09loff_t max_chunk =3D sdp->sd_ldptrs * sdp->sd_vfs->s_blocksize;
 =09int error;
=20
 =09while (length) {
@@ -2429,7 +2429,8 @@ static int gfs2_journaled_truncate_range(struct inode=
 *inode, loff_t offset,
 =09=09=09continue;
=20
 =09=09gfs2_trans_end(sdp);
-=09=09error =3D gfs2_trans_begin(sdp, RES_DINODE, GFS2_JTRUNC_REVOKES);
+=09=09error =3D gfs2_trans_begin(sdp, RES_DINODE,
+=09=09=09=09=09 RES_DINODE + sdp->sd_ldptrs);
 =09=09if (error)
 =09=09=09return error;
 =09}
@@ -2453,7 +2454,7 @@ int __gfs2_punch_hole(struct file *file, loff_t offse=
t, loff_t length)
=20
 =09if (gfs2_is_jdata(ip))
 =09=09error =3D gfs2_trans_begin(sdp, RES_DINODE + 2 * RES_JDATA,
-=09=09=09=09=09 GFS2_JTRUNC_REVOKES);
+=09=09=09=09=09 RES_DINODE + sdp->sd_ldptrs);
 =09else
 =09=09error =3D gfs2_trans_begin(sdp, RES_DINODE, 0);
 =09if (error)
--=20
2.24.1

