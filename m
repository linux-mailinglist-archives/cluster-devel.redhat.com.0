Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B5757170311
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Feb 2020 16:49:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582732141;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bHtFkyEPipsqS4+j30F0dkx5z3hy4aqCosTSF/KcqxY=;
	b=bbsOz4v+3HB4zb0pQcs9Hw1OG9WVrrjA7zxcHL4yZFEICzoSmars45YACgXM7TaKRFgxpw
	XFZRc6DyoTiuzkoOCeBRJOyILmdE/2+mXbOOI7BT8aE9dHOzi+3sQBhZJxxfq86V4o+24P
	sJfp41vLAaqyTJ4Gfy+vGT1aOFiEPc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-4ks4-V9FOne6oz-n5GMViQ-1; Wed, 26 Feb 2020 10:48:59 -0500
X-MC-Unique: 4ks4-V9FOne6oz-n5GMViQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B3B9DB66;
	Wed, 26 Feb 2020 15:48:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1263E60BEF;
	Wed, 26 Feb 2020 15:48:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB6408446B;
	Wed, 26 Feb 2020 15:48:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01QFmsih014461 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 10:48:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DB2DA5C28D; Wed, 26 Feb 2020 15:48:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A19CB5C241
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 15:48:53 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 26 Feb 2020 09:48:43 -0600
Message-Id: <20200226154844.1264672-3-rpeterso@redhat.com>
In-Reply-To: <20200226154844.1264672-1-rpeterso@redhat.com>
References: <20200226154844.1264672-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 2/3] gfs2: rename gfs2_rsqa_delete to
	gfs2_rs_delete
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Now that freeing the inode's quota data structure is separate from
freeing rgrp reservations, we rename gfs2_rsqa_delete to gfs2_rs_delete.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c  | 2 +-
 fs/gfs2/file.c  | 2 +-
 fs/gfs2/inode.c | 2 +-
 fs/gfs2/rgrp.c  | 4 ++--
 fs/gfs2/rgrp.h  | 2 +-
 fs/gfs2/super.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 08f6fbb3655e..fa50482b8c92 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -2194,7 +2194,7 @@ int gfs2_setattr_size(struct inode *inode, u64 newsiz=
e)
=20
 =09ret =3D do_shrink(inode, newsize);
 out:
-=09gfs2_rsqa_delete(ip, NULL);
+=09gfs2_rs_delete(ip, NULL);
 =09return ret;
 }
=20
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index cb26be6f4351..4d19ca3e4784 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -693,7 +693,7 @@ static int gfs2_release(struct inode *inode, struct fil=
e *file)
 =09if (!(file->f_mode & FMODE_WRITE))
 =09=09return 0;
=20
-=09gfs2_rsqa_delete(ip, &inode->i_writecount);
+=09gfs2_rs_delete(ip, &inode->i_writecount);
 =09return 0;
 }
=20
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 2716d56ed0a0..a56ce1aa5f93 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -786,7 +786,7 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
 =09=09glock_clear_object(ip->i_gl, ip);
 =09=09gfs2_glock_put(ip->i_gl);
 =09}
-=09gfs2_rsqa_delete(ip, NULL);
+=09gfs2_rs_delete(ip, NULL);
 fail_free_acls:
 =09posix_acl_release(default_acl);
 =09posix_acl_release(acl);
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 7efc765ebc6a..59bc4d1a4d89 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -672,12 +672,12 @@ void gfs2_rs_deltree(struct gfs2_blkreserv *rs)
 }
=20
 /**
- * gfs2_rsqa_delete - delete a multi-block reservation and quota allocatio=
n
+ * gfs2_rs_delete - delete a multi-block reservation
  * @ip: The inode for this reservation
  * @wcount: The inode's write count, or NULL
  *
  */
-void gfs2_rsqa_delete(struct gfs2_inode *ip, atomic_t *wcount)
+void gfs2_rs_delete(struct gfs2_inode *ip, atomic_t *wcount)
 {
 =09down_write(&ip->i_rw_mutex);
 =09if ((wcount =3D=3D NULL) || (atomic_read(wcount) <=3D 1))
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index a584f3096418..008ef9736f1c 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -46,7 +46,7 @@ extern int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *=
bn, unsigned int *n,
=20
 extern int gfs2_rsqa_alloc(struct gfs2_inode *ip);
 extern void gfs2_rs_deltree(struct gfs2_blkreserv *rs);
-extern void gfs2_rsqa_delete(struct gfs2_inode *ip, atomic_t *wcount);
+extern void gfs2_rs_delete(struct gfs2_inode *ip, atomic_t *wcount);
 extern void __gfs2_free_blocks(struct gfs2_inode *ip, struct gfs2_rgrpd *r=
gd,
 =09=09=09       u64 bstart, u32 blen, int meta);
 extern void gfs2_free_meta(struct gfs2_inode *ip, struct gfs2_rgrpd *rgd,
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 3d36d8671cf6..c029a49871d3 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1409,7 +1409,7 @@ static void gfs2_evict_inode(struct inode *inode)
 =09=09fs_warn(sdp, "gfs2_evict_inode: %d\n", error);
 out:
 =09truncate_inode_pages_final(&inode->i_data);
-=09gfs2_rsqa_delete(ip, NULL);
+=09gfs2_rs_delete(ip, NULL);
 =09if (ip->i_qadata)
 =09=09kmem_cache_free(gfs2_qadata_cachep, ip->i_qadata);
 =09ip->i_qadata =3D NULL;
--=20
2.24.1

