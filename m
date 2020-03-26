Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB7919469D
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Mar 2020 19:36:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585247780;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u8pvZhaw0teH4FHWPn+DHXRJKyrGU0C2xh6MV2oPWxQ=;
	b=PRROkldWW7GgCH+4gGDlrJzfuoBe/RMFm1ug4dfDbXw+Lq7RMcsLXPQo+rnG7SvpQ71bBi
	XII/e54EFczhUMke7l3YWHhuiQ3cP5kMrRZikqe6JiwQ/YRK/jp3hEtq5zlGje2JFW/bq3
	kFrXWCoTjYhr1KU5pinDmjEA2lrrCVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-my96DHjlO2G3udpFO5m1oQ-1; Thu, 26 Mar 2020 14:36:18 -0400
X-MC-Unique: my96DHjlO2G3udpFO5m1oQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E284B107B7D4;
	Thu, 26 Mar 2020 18:36:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C84E3A0A60;
	Thu, 26 Mar 2020 18:36:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE57A18089CD;
	Thu, 26 Mar 2020 18:36:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02QIa8Qa004763 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 14:36:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E28B7E311; Thu, 26 Mar 2020 18:36:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60F2A5C1BA
	for <cluster-devel@redhat.com>; Thu, 26 Mar 2020 18:36:08 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 26 Mar 2020 13:36:02 -0500
Message-Id: <20200326183603.123323-4-rpeterso@redhat.com>
In-Reply-To: <20200326183603.123323-1-rpeterso@redhat.com>
References: <20200326183603.123323-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 3/4] gfs2: Split gfs2_rsqa_delete into
	gfs2_rs_delete and gfs2_qa_put
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
index bb67d2ee1b40..41b9a281d7ed 100644
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
index 6c5f527dafc4..36fe96d10256 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -787,7 +787,8 @@ static int gfs2_create_inode(struct inode *dir, struct =
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
index 709dd80d4ebe..8778dd4d9424 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1411,7 +1411,8 @@ static void gfs2_evict_inode(struct inode *inode)
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

