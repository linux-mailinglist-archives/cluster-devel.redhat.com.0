Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEF017C39D
	for <lists+cluster-devel@lfdr.de>; Fri,  6 Mar 2020 18:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583514356;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4Y4unUFsdv9HD3P46BrzyEjSevLkBamPkH3/5h8hx/Q=;
	b=cxP4gP7D4Z1urgSYn1oh4eHiqlG6Ah/LppPCESjATpSgbvW2hzUBJUrHQ0eiUCQ9S767ml
	WYjeoP3D9y3WE9XaWMN892sGz+lJg8mXfcJL3Nk37n8fIlOBRrdZfIH4TxDCA5H0SqP/fY
	G+TAh8u3PEHdxfUdwhiJ8AUK79DGqaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-OqomnAYNNr2BcMSusAfevQ-1; Fri, 06 Mar 2020 12:05:54 -0500
X-MC-Unique: OqomnAYNNr2BcMSusAfevQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EF4D800D50;
	Fri,  6 Mar 2020 17:05:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AD7860BE0;
	Fri,  6 Mar 2020 17:05:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7277286A05;
	Fri,  6 Mar 2020 17:05:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 026H5nrd028743 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 12:05:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC3AD8B75D; Fri,  6 Mar 2020 17:05:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1B9E8B74D
	for <cluster-devel@redhat.com>; Fri,  6 Mar 2020 17:05:48 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  6 Mar 2020 11:05:32 -0600
Message-Id: <20200306170534.1772544-5-rpeterso@redhat.com>
In-Reply-To: <20200306170534.1772544-1-rpeterso@redhat.com>
References: <20200306170534.1772544-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 4/6] gfs2: Split gfs2_rsqa_delete into
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
index 3fd45df224aa..adaaca98a884 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -693,8 +693,10 @@ static int gfs2_release(struct inode *inode, struct fi=
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
2.24.1

