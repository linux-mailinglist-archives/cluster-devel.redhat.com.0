Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0041426C9
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jan 2020 10:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579511604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u95m87iNXU3dj9XVO0ZfI+ZdYrlO5h8hCNkr0Eguiak=;
	b=gvoPDz6YI93wtEzhW1YGmBZBhQMh/5HYZXCyG091/B1JWU7j56MFP5VeRRuAwEZfIa1BVw
	tIrtEW7l2jpMNqu43g/NpqY290WKdaEbRrFcOlhkMhYu//pJ1kU5isr1sAclSj18otqraq
	8YvulSI1Oyx7M6K9pukQjQ/hikiVxig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-QviC-2krMp2G4fz_5iR3Dw-1; Mon, 20 Jan 2020 04:13:23 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B6DCDB66;
	Mon, 20 Jan 2020 09:13:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90EE784790;
	Mon, 20 Jan 2020 09:13:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6352618089C8;
	Mon, 20 Jan 2020 09:13:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00K9DFBR031678 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 04:13:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 38CF984DAB; Mon, 20 Jan 2020 09:13:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6FFB784D9F;
	Mon, 20 Jan 2020 09:13:14 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 20 Jan 2020 10:12:57 +0100
Message-Id: <20200120091305.24997-4-agruenba@redhat.com>
In-Reply-To: <20200120091305.24997-1-agruenba@redhat.com>
References: <20200120091305.24997-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 03/11] gfs2: Keep track of deletes in inode
	LVBs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: QviC-2krMp2G4fz_5iR3Dw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

When deleting an inode, keep track of the generation of the deleted inode i=
n
the inode glock Lock Value Block (LVB).  When trying to delete an inode
remotely, check the last-known inode generation against the deleted inode
generation to skip duplicate remote deletes.  This avoids taking the resour=
ce
group glock in order to verify the block type.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c                  | 19 +++++++++++++++++++
 fs/gfs2/glock.h                  |  3 +++
 fs/gfs2/glops.c                  |  2 +-
 fs/gfs2/super.c                  |  3 +++
 include/uapi/linux/gfs2_ondisk.h |  6 ++++++
 5 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 2aa21bab8e1c..3a9502af895b 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -677,6 +677,25 @@ __acquires(&gl->gl_lockref.lock)
 =09return;
 }
=20
+void gfs2_inode_remember_delete(struct gfs2_glock *gl, u64 generation)
+{
+=09struct gfs2_inode_lvb *ri =3D (void *)gl->gl_lksb.sb_lvbptr;
+
+=09if (ri->ri_magic =3D=3D 0)
+=09=09ri->ri_magic =3D cpu_to_be32(GFS2_MAGIC);
+=09if (ri->ri_magic =3D=3D cpu_to_be32(GFS2_MAGIC))
+=09=09ri->ri_generation_deleted =3D cpu_to_be64(generation);
+}
+
+bool gfs2_inode_already_deleted(struct gfs2_glock *gl, u64 generation)
+{
+=09struct gfs2_inode_lvb *ri =3D (void *)gl->gl_lksb.sb_lvbptr;
+
+=09if (ri->ri_magic !=3D cpu_to_be32(GFS2_MAGIC))
+=09=09return false;
+=09return generation <=3D be64_to_cpu(ri->ri_generation_deleted);
+}
+
 static void delete_work_func(struct work_struct *work)
 {
 =09struct gfs2_glock *gl =3D container_of(work, struct gfs2_glock, gl_dele=
te);
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index dc23cbf6ae7a..63d0486bdbc4 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -305,4 +305,7 @@ static inline void glock_clear_object(struct gfs2_glock=
 *gl, void *object)
 =09spin_unlock(&gl->gl_lockref.lock);
 }
=20
+extern void gfs2_inode_remember_delete(struct gfs2_glock *gl, u64 generati=
on);
+extern bool gfs2_inode_already_deleted(struct gfs2_glock *gl, u64 generati=
on);
+
 #endif /* __GLOCK_DOT_H__ */
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4ede1f18de85..4b4676fb8c3e 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -593,7 +593,7 @@ const struct gfs2_glock_operations gfs2_inode_glops =3D=
 {
 =09.go_lock =3D inode_go_lock,
 =09.go_dump =3D inode_go_dump,
 =09.go_type =3D LM_TYPE_INODE,
-=09.go_flags =3D GLOF_ASPACE | GLOF_LRU,
+=09.go_flags =3D GLOF_ASPACE | GLOF_LRU | GLOF_LVB,
 };
=20
 const struct gfs2_glock_operations gfs2_rgrp_glops =3D {
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 2621d925812b..b108b6379fb7 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1278,6 +1278,8 @@ static void gfs2_evict_inode(struct inode *inode)
 =09=09goto out;
 =09}
=20
+=09if (gfs2_inode_already_deleted(ip->i_gl, ip->i_no_formal_ino))
+=09=09goto out_truncate;
 =09error =3D gfs2_check_blk_type(sdp, ip->i_no_addr, GFS2_BLKST_UNLINKED);
 =09if (error)
 =09=09goto out_truncate;
@@ -1331,6 +1333,7 @@ static void gfs2_evict_inode(struct inode *inode)
 =09   that subsequent inode creates don't see an old gl_object. */
 =09glock_clear_object(ip->i_gl, ip);
 =09error =3D gfs2_dinode_dealloc(ip);
+=09gfs2_inode_remember_delete(ip->i_gl, ip->i_no_formal_ino);
 =09goto out_unlock;
=20
 out_truncate:
diff --git a/include/uapi/linux/gfs2_ondisk.h b/include/uapi/linux/gfs2_ond=
isk.h
index 2dc10a034de1..07e508e6691b 100644
--- a/include/uapi/linux/gfs2_ondisk.h
+++ b/include/uapi/linux/gfs2_ondisk.h
@@ -171,6 +171,12 @@ struct gfs2_rindex {
 #define GFS2_RGF_NOALLOC=090x00000008
 #define GFS2_RGF_TRIMMED=090x00000010
=20
+struct gfs2_inode_lvb {
+=09__be32 ri_magic;
+=09__be32 __pad;
+=09__be64 ri_generation_deleted;
+};
+
 struct gfs2_rgrp_lvb {
 =09__be32 rl_magic;
 =09__be32 rl_flags;
--=20
2.20.1

