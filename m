Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BE16F1426D0
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jan 2020 10:13:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579511622;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NuRUpNgJqMb0gYxNZ7Hf/X0xrH86O0umMtWCnmj9GGY=;
	b=J1dPeA58HzJq0yWke+V4n+ein1xykeebErL2+KyzN6spqd8DxaFujR/GCEoo7pNlYSKNeW
	RsoiCOOj+1gB7wfs6UiENNEptqBjNZuaKDZV+uMp8lmt784fGuxzqpwjH4LSdgYLLEWaXh
	xdIqqXsYgImQXfagZhhdypHg4fWmCQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-vuQulEFYPQeekiEIc4hLXA-1; Mon, 20 Jan 2020 04:13:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47B018010CF;
	Mon, 20 Jan 2020 09:13:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 320C65C21A;
	Mon, 20 Jan 2020 09:13:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0808B81964;
	Mon, 20 Jan 2020 09:13:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00K9DbOv031754 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 04:13:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2AD6A84DAB; Mon, 20 Jan 2020 09:13:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B9F284D9F;
	Mon, 20 Jan 2020 09:13:34 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 20 Jan 2020 10:13:01 +0100
Message-Id: <20200120091305.24997-8-agruenba@redhat.com>
In-Reply-To: <20200120091305.24997-1-agruenba@redhat.com>
References: <20200120091305.24997-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 07/11] gfs2: Minor gfs2_lookup_by_inum
	cleanup
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
X-MC-Unique: vuQulEFYPQeekiEIc4hLXA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Use a zero no_formal_ino instead of a NULL pointer to indicate that any ino=
de
generation number will qualify: a valid inode never has a zero no_formal_in=
o.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/export.c |  4 +++-
 fs/gfs2/glock.c  |  2 +-
 fs/gfs2/inode.c  | 11 +++++++++--
 fs/gfs2/inode.h  |  2 +-
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/export.c b/fs/gfs2/export.c
index 3f717285ee48..756d05779200 100644
--- a/fs/gfs2/export.c
+++ b/fs/gfs2/export.c
@@ -134,7 +134,9 @@ static struct dentry *gfs2_get_dentry(struct super_bloc=
k *sb,
 =09struct gfs2_sbd *sdp =3D sb->s_fs_info;
 =09struct inode *inode;
=20
-=09inode =3D gfs2_lookup_by_inum(sdp, inum->no_addr, &inum->no_formal_ino,
+=09if (!inum->no_formal_ino)
+=09=09return ERR_PTR(-ESTALE);
+=09inode =3D gfs2_lookup_by_inum(sdp, inum->no_addr, inum->no_formal_ino,
 =09=09=09=09    GFS2_BLKST_DINODE);
 =09if (IS_ERR(inode))
 =09=09return ERR_CAST(inode);
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 38ba77b35b50..58da551ecb5c 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -762,7 +762,7 @@ static void delete_work_func(struct work_struct *work)
 =09=09}
 =09}
=20
-=09inode =3D gfs2_lookup_by_inum(sdp, no_addr, NULL, GFS2_BLKST_UNLINKED);
+=09inode =3D gfs2_lookup_by_inum(sdp, no_addr, 0, GFS2_BLKST_UNLINKED);
 =09if (!IS_ERR_OR_NULL(inode)) {
 =09=09d_prune_aliases(inode);
 =09=09iput(inode);
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index dafef10b91f1..41fc23710529 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -212,8 +212,15 @@ struct inode *gfs2_inode_lookup(struct super_block *sb=
, unsigned int type,
 =09return ERR_PTR(error);
 }
=20
+/**
+ * gfs2_lookup_by_inum - look up an inode by inode number
+ * @sdp: The super block
+ * @no_addr: The inode number
+ * @no_formal_ino: The inode generation number (0 for any)
+ * @blktype: Requested block type (see gfs2_inode_lookup)
+ */
 struct inode *gfs2_lookup_by_inum(struct gfs2_sbd *sdp, u64 no_addr,
-=09=09=09=09  u64 *no_formal_ino, unsigned int blktype)
+=09=09=09=09  u64 no_formal_ino, unsigned int blktype)
 {
 =09struct super_block *sb =3D sdp->sd_vfs;
 =09struct inode *inode;
@@ -226,7 +233,7 @@ struct inode *gfs2_lookup_by_inum(struct gfs2_sbd *sdp,=
 u64 no_addr,
 =09/* Two extra checks for NFS only */
 =09if (no_formal_ino) {
 =09=09error =3D -ESTALE;
-=09=09if (GFS2_I(inode)->i_no_formal_ino !=3D *no_formal_ino)
+=09=09if (GFS2_I(inode)->i_no_formal_ino !=3D no_formal_ino)
 =09=09=09goto fail_iput;
=20
 =09=09error =3D -EIO;
diff --git a/fs/gfs2/inode.h b/fs/gfs2/inode.h
index 580adbf0b5e1..b52ecf4ffe63 100644
--- a/fs/gfs2/inode.h
+++ b/fs/gfs2/inode.h
@@ -92,7 +92,7 @@ extern struct inode *gfs2_inode_lookup(struct super_block=
 *sb, unsigned type,
 =09=09=09=09       u64 no_addr, u64 no_formal_ino,
 =09=09=09=09       unsigned int blktype);
 extern struct inode *gfs2_lookup_by_inum(struct gfs2_sbd *sdp, u64 no_addr=
,
-=09=09=09=09=09 u64 *no_formal_ino,
+=09=09=09=09=09 u64 no_formal_ino,
 =09=09=09=09=09 unsigned int blktype);
=20
 extern int gfs2_inode_refresh(struct gfs2_inode *ip);
--=20
2.20.1

