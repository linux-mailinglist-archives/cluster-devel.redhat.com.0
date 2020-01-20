Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABE61426D1
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jan 2020 10:13:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579511624;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jot+nyzr0IGsmf6trN4JF9dFWmyiGpelNZszFm8woIQ=;
	b=I01G7+PrT5ekTR7x5hiZbDWlT9SNdWh6te8w41KoMadzopORGNjVyoxJR53A0pyK/h57J9
	laJd2GgLOnmedcATRP8FQT4/ipgCH98LF/FzO9uieFnVeSCdYAbA3n8PRujLXxrftpP6/S
	gSAh+uuex98snFkO6g0Gc+I3wbSubvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-5NjSVr3pOH-4RS9lSLY32Q-1; Mon, 20 Jan 2020 04:13:43 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4E9218AAFA5;
	Mon, 20 Jan 2020 09:13:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C29D484D9F;
	Mon, 20 Jan 2020 09:13:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6CD818089CF;
	Mon, 20 Jan 2020 09:13:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00K9DcU8031759 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 04:13:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4CBFA84D9F; Mon, 20 Jan 2020 09:13:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8417884DAD;
	Mon, 20 Jan 2020 09:13:37 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 20 Jan 2020 10:13:02 +0100
Message-Id: <20200120091305.24997-9-agruenba@redhat.com>
In-Reply-To: <20200120091305.24997-1-agruenba@redhat.com>
References: <20200120091305.24997-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 08/11] gfs2: Move inode generation number
	check into gfs2_inode_lookup
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
X-MC-Unique: 5NjSVr3pOH-4RS9lSLY32Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Move the inode generation number check from gfs2_lookup_by_inum into
gfs2_inode_lookup: gfs2_inode_lookup may be able to decide that an inode wi=
th
the given inode generation number cannot exist without having to verify the
block type or reading the inode from disk.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/inode.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 41fc23710529..e12e694a1bbb 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -114,6 +114,10 @@ static void gfs2_set_iop(struct inode *inode)
  * placeholder because it doesn't otherwise make sense), the on-disk block=
 type
  * is verified to be @blktype.
  *
+ * When @no_formal_ino is non-zero, this function will return ERR_PTR(-EST=
ALE)
+ * if it detects that @no_formal_ino doesn't match the actual inode genera=
tion
+ * number.  However, it doesn't always know unless @type is DT_UNKNOWN.
+ *
  * Returns: A VFS inode, or an error
  */
=20
@@ -158,6 +162,11 @@ struct inode *gfs2_inode_lookup(struct super_block *sb=
, unsigned int type,
 =09=09=09if (error)
 =09=09=09=09goto fail_put;
=20
+=09=09=09error =3D -ESTALE;
+=09=09=09if (no_formal_ino &&
+=09=09=09    gfs2_inode_already_deleted(ip->i_gl, no_formal_ino))
+=09=09=09=09goto fail_put;
+
 =09=09=09if (blktype !=3D GFS2_BLKST_FREE) {
 =09=09=09=09error =3D gfs2_check_blk_type(sdp, no_addr,
 =09=09=09=09=09=09=09    blktype);
@@ -189,9 +198,15 @@ struct inode *gfs2_inode_lookup(struct super_block *sb=
, unsigned int type,
 =09=09/* Lowest possible timestamp; will be overwritten in gfs2_dinode_in.=
 */
 =09=09inode->i_atime.tv_sec =3D 1LL << (8 * sizeof(inode->i_atime.tv_sec) =
- 1);
 =09=09inode->i_atime.tv_nsec =3D 0;
+=09}
=20
+=09error =3D -ESTALE;
+=09if (no_formal_ino && ip->i_no_formal_ino &&
+=09    no_formal_ino !=3D ip->i_no_formal_ino)
+=09=09goto fail_refresh;
+
+=09if (inode->i_state & I_NEW)
 =09=09unlock_new_inode(inode);
-=09}
=20
 =09if (gfs2_holder_initialized(&i_gh))
 =09=09gfs2_glock_dq_uninit(&i_gh);
@@ -226,16 +241,12 @@ struct inode *gfs2_lookup_by_inum(struct gfs2_sbd *sd=
p, u64 no_addr,
 =09struct inode *inode;
 =09int error;
=20
-=09inode =3D gfs2_inode_lookup(sb, DT_UNKNOWN, no_addr, 0, blktype);
+=09inode =3D gfs2_inode_lookup(sb, DT_UNKNOWN, no_addr, no_formal_ino,
+=09=09=09=09  blktype);
 =09if (IS_ERR(inode))
 =09=09return inode;
=20
-=09/* Two extra checks for NFS only */
 =09if (no_formal_ino) {
-=09=09error =3D -ESTALE;
-=09=09if (GFS2_I(inode)->i_no_formal_ino !=3D no_formal_ino)
-=09=09=09goto fail_iput;
-
 =09=09error =3D -EIO;
 =09=09if (GFS2_I(inode)->i_diskflags & GFS2_DIF_SYSTEM)
 =09=09=09goto fail_iput;
--=20
2.20.1

