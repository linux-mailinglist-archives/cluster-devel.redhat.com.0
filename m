Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0934B13BB18
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 09:30:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579077053;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FMTJ04XOBUKduRJkVN2JKCbMm4y1XBU6b80Xh+jYlp8=;
	b=cPg1dNO1uJVDR7YJs/T9AnnPsREnIY4hsxie0ZVaRBc8w2ORMDSpo0X7xTxlT62kQ3xd9E
	5q5ESTJYfo1+LcNXwcFHsC7xgt4gR0vKAh7GP/KVLjCUTC6UKVpaCLyZ/Dvvm+WOZ2zjR5
	1WN+sw4qOGES8/A+i+lo2LpzumFd8uM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-X5zRsW-NP6-lKQG5ckpPxw-1; Wed, 15 Jan 2020 03:30:52 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A77F1006304;
	Wed, 15 Jan 2020 08:30:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 049ED108438C;
	Wed, 15 Jan 2020 08:30:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0B0C824EC;
	Wed, 15 Jan 2020 08:30:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00F8UlT8017276 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 03:30:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8161E8248B; Wed, 15 Jan 2020 08:30:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 149C1842A7;
	Wed, 15 Jan 2020 08:30:42 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 15 Jan 2020 09:30:40 +0100
Message-Id: <20200115083040.32714-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Avoid access time trashing in
	gfs2_inode_lookup
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: X5zRsW-NP6-lKQG5ckpPxw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

In gfs2_inode_lookup, we initialize inode->i_atime to the lowest
possibly value after gfs2_inode_refresh may already have been called.
This should be the other way around, but we didn't notice because
usually the inode type is known from the directory entry and so
gfs2_inode_lookup won't call gfs2_inode_refresh.

In addition, only initialize ip->i_no_formal_ino from no_formal_ino when
actually needed.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/inode.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index dafef10b91f1..2716d56ed0a0 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -136,7 +136,6 @@ struct inode *gfs2_inode_lookup(struct super_block *sb,=
 unsigned int type,
=20
 =09if (inode->i_state & I_NEW) {
 =09=09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
-=09=09ip->i_no_formal_ino =3D no_formal_ino;
=20
 =09=09error =3D gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE, &i=
p->i_gl);
 =09=09if (unlikely(error))
@@ -175,21 +174,22 @@ struct inode *gfs2_inode_lookup(struct super_block *s=
b, unsigned int type,
 =09=09gfs2_glock_put(io_gl);
 =09=09io_gl =3D NULL;
=20
+=09=09/* Lowest possible timestamp; will be overwritten in gfs2_dinode_in.=
 */
+=09=09inode->i_atime.tv_sec =3D 1LL << (8 * sizeof(inode->i_atime.tv_sec) =
- 1);
+=09=09inode->i_atime.tv_nsec =3D 0;
+
 =09=09if (type =3D=3D DT_UNKNOWN) {
 =09=09=09/* Inode glock must be locked already */
 =09=09=09error =3D gfs2_inode_refresh(GFS2_I(inode));
 =09=09=09if (error)
 =09=09=09=09goto fail_refresh;
 =09=09} else {
+=09=09=09ip->i_no_formal_ino =3D no_formal_ino;
 =09=09=09inode->i_mode =3D DT2IF(type);
 =09=09}
=20
 =09=09gfs2_set_iop(inode);
=20
-=09=09/* Lowest possible timestamp; will be overwritten in gfs2_dinode_in.=
 */
-=09=09inode->i_atime.tv_sec =3D 1LL << (8 * sizeof(inode->i_atime.tv_sec) =
- 1);
-=09=09inode->i_atime.tv_nsec =3D 0;
-
 =09=09unlock_new_inode(inode);
 =09}
=20
--=20
2.20.1

