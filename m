Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id A8A04197D61
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576015;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G0zELcwFWzsJGDaEOatW8m5its2mkEKUFn5zGrvSMaA=;
	b=ig/YdCmXVLc2JohNocDA63Jg1uQ2fOmxfPZ9O7oSHMZnQ+jt4+jCar4cUslUzVbnc0lkdJ
	BAGYN4YU+8WRL8FKf4LfLE4g3P7yT2c6B8akEntfO4jS460DbFA8Dpwyh545ndYdDM+fJ1
	B9riZet+KdprJhq3ymkuOXS70PYZ8iM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-lvR5clZZOoGbo-VwCpbRPw-1; Mon, 30 Mar 2020 09:46:53 -0400
X-MC-Unique: lvR5clZZOoGbo-VwCpbRPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 907468010F6;
	Mon, 30 Mar 2020 13:46:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B5725D9E2;
	Mon, 30 Mar 2020 13:46:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 606A018089CD;
	Mon, 30 Mar 2020 13:46:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkg3P020648 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 940A896F88; Mon, 30 Mar 2020 13:46:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5916148
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:42 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:19 -0500
Message-Id: <20200330134624.259349-35-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 34/39] gfs2: Split gfs2_rsqa_delete
	into gfs2_rs_delete and gfs2_qa_put
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Andreas Gruenbacher <agruenba@redhat.com>

Keeping reservations and quotas separate helps reviewing the code.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c  | 3 ++-
 fs/gfs2/file.c  | 6 ++++--
 fs/gfs2/inode.c | 3 ++-
 fs/gfs2/rgrp.c  | 5 ++---
 fs/gfs2/rgrp.h  | 2 +-
 fs/gfs2/super.c | 3 ++-
 6 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index d510a453dfa8..936a8ec6b48e 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -2194,7 +2194,8 @@ int gfs2_setattr_size(struct inode *inode, u64 newsiz=
e)
=20
 =09ret =3D do_shrink(inode, newsize);
 out:
-=09gfs2_rsqa_delete(ip, NULL);
+=09gfs2_rs_delete(ip, NULL);
+=09gfs2_qa_put(ip);
 =09return ret;
 }
=20
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index f18876cdfb0f..99a75e779ac0 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -701,8 +701,10 @@ static int gfs2_release(struct inode *inode, struct fi=
le *file)
 =09kfree(file->private_data);
 =09file->private_data =3D NULL;
=20
-=09if (file->f_mode & FMODE_WRITE)
-=09=09gfs2_rsqa_delete(ip, &inode->i_writecount);
+=09if (file->f_mode & FMODE_WRITE) {
+=09=09gfs2_rs_delete(ip, &inode->i_writecount);
+=09=09gfs2_qa_put(ip);
+=09}
 =09return 0;
 }
=20
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index d1a24753c55f..980a6feb0e22 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -781,7 +781,8 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
 =09=09glock_clear_object(ip->i_gl, ip);
 =09=09gfs2_glock_put(ip->i_gl);
 =09}
-=09gfs2_rsqa_delete(ip, NULL);
+=09gfs2_rs_delete(ip, NULL);
+=09gfs2_qa_put(ip);
 fail_free_acls:
 =09posix_acl_release(default_acl);
 =09posix_acl_release(acl);
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 04e3e13a230c..692dc11d0f13 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -662,18 +662,17 @@ void gfs2_rs_deltree(struct gfs2_blkreserv *rs)
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
 =09=09gfs2_rs_deltree(&ip->i_res);
 =09up_write(&ip->i_rw_mutex);
-=09gfs2_qa_put(ip);
 }
=20
 /**
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index 92cebb785996..a1d7e14fc55b 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -45,7 +45,7 @@ extern int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *=
bn, unsigned int *n,
 =09=09=09     bool dinode, u64 *generation);
=20
 extern void gfs2_rs_deltree(struct gfs2_blkreserv *rs);
-extern void gfs2_rsqa_delete(struct gfs2_inode *ip, atomic_t *wcount);
+extern void gfs2_rs_delete(struct gfs2_inode *ip, atomic_t *wcount);
 extern void __gfs2_free_blocks(struct gfs2_inode *ip, struct gfs2_rgrpd *r=
gd,
 =09=09=09       u64 bstart, u32 blen, int meta);
 extern void gfs2_free_meta(struct gfs2_inode *ip, struct gfs2_rgrpd *rgd,
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 68d934fa0f9f..37fc41632aa2 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1403,7 +1403,8 @@ static void gfs2_evict_inode(struct inode *inode)
 =09truncate_inode_pages_final(&inode->i_data);
 =09if (ip->i_qadata)
 =09=09gfs2_assert_warn(sdp, ip->i_qadata->qa_ref =3D=3D 0);
-=09gfs2_rsqa_delete(ip, NULL);
+=09gfs2_rs_delete(ip, NULL);
+=09gfs2_qa_put(ip);
 =09gfs2_ordered_del_inode(ip);
 =09clear_inode(inode);
 =09gfs2_dir_hash_inval(ip);
--=20
2.25.1

