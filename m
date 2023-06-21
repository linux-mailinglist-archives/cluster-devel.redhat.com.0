Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B37387AB
	for <lists+cluster-devel@lfdr.de>; Wed, 21 Jun 2023 16:48:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687358928;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5j0zVB8DLVLoVkgJqUF+ds8igXaCOuAY39un9+ip86U=;
	b=OZqE3YALM7Dt6EBr7YTnmtNjhtkD730GLGUhAR8SxG+5aD2WyQzEq/SWORYmFRaqGngaS9
	NLCIFx+cT5DORBml2kX9XCIYJnox90caKYUzlZnBymyN/kLkZjY3XQbqVfi1Kz4Uf9X1Uv
	bMYrO9/FRhwvXqDblXt57LuF6+4gITQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-5RyB0Jj3O6Wsw72XwSlzJA-1; Wed, 21 Jun 2023 10:48:42 -0400
X-MC-Unique: 5RyB0Jj3O6Wsw72XwSlzJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01D6C9FC4A7;
	Wed, 21 Jun 2023 14:48:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9351112132E;
	Wed, 21 Jun 2023 14:48:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A41B4194658C;
	Wed, 21 Jun 2023 14:48:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A2CC11946586 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 21 Jun 2023 14:48:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 588A5140EBB8; Wed, 21 Jun 2023 14:48:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 504E214682FA
 for <cluster-devel@redhat.com>; Wed, 21 Jun 2023 14:48:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31FB210311EC
 for <cluster-devel@redhat.com>; Wed, 21 Jun 2023 14:48:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-TLLfPeb3O6G331vj2BZG9Q-1; Wed, 21 Jun 2023 10:48:36 -0400
X-MC-Unique: TLLfPeb3O6G331vj2BZG9Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D24D6159B;
 Wed, 21 Jun 2023 14:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA21C433C8;
 Wed, 21 Jun 2023 14:48:33 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>, Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 21 Jun 2023 10:45:47 -0400
Message-ID: <20230621144735.55953-33-jlayton@kernel.org>
In-Reply-To: <20230621144735.55953-1-jlayton@kernel.org>
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621144735.55953-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 34/79] gfs2: switch to new ctime accessors
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In later patches, we're going to change how the ctime.tv_nsec field is
utilized. Switch to using accessor functions instead of raw accesses of
inode->i_ctime.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/gfs2/acl.c   |  2 +-
 fs/gfs2/bmap.c  | 11 +++++------
 fs/gfs2/dir.c   | 15 ++++++++-------
 fs/gfs2/file.c  |  2 +-
 fs/gfs2/glops.c |  4 ++--
 fs/gfs2/inode.c |  8 ++++----
 fs/gfs2/super.c |  4 ++--
 fs/gfs2/xattr.c |  8 ++++----
 8 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/fs/gfs2/acl.c b/fs/gfs2/acl.c
index a392aa0f041d..b267dae0dc63 100644
--- a/fs/gfs2/acl.c
+++ b/fs/gfs2/acl.c
@@ -142,7 +142,7 @@ int gfs2_set_acl(struct mnt_idmap *idmap, struct dentry=
 *dentry,
=20
 =09ret =3D __gfs2_set_acl(inode, acl, type);
 =09if (!ret && mode !=3D inode->i_mode) {
-=09=09inode->i_ctime =3D current_time(inode);
+=09=09inode_ctime_set_current(inode);
 =09=09inode->i_mode =3D mode;
 =09=09mark_inode_dirty(inode);
 =09}
diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 8d611fbcf0bd..743b09a0b196 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1386,7 +1386,7 @@ static int trunc_start(struct inode *inode, u64 newsi=
ze)
 =09=09ip->i_diskflags |=3D GFS2_DIF_TRUNC_IN_PROG;
=20
 =09i_size_write(inode, newsize);
-=09ip->i_inode.i_mtime =3D ip->i_inode.i_ctime =3D current_time(&ip->i_ino=
de);
+=09inode->i_mtime =3D inode_ctime_set_current(inode);
 =09gfs2_dinode_out(ip, dibh->b_data);
=20
 =09if (journaled)
@@ -1583,8 +1583,7 @@ static int sweep_bh_for_rgrps(struct gfs2_inode *ip, =
struct gfs2_holder *rd_gh,
=20
 =09=09=09/* Every transaction boundary, we rewrite the dinode
 =09=09=09   to keep its di_blocks current in case of failure. */
-=09=09=09ip->i_inode.i_mtime =3D ip->i_inode.i_ctime =3D
-=09=09=09=09current_time(&ip->i_inode);
+=09=09=09ip->i_inode.i_mtime =3D inode_ctime_set_current(&ip->i_inode);
 =09=09=09gfs2_trans_add_meta(ip->i_gl, dibh);
 =09=09=09gfs2_dinode_out(ip, dibh->b_data);
 =09=09=09brelse(dibh);
@@ -1950,7 +1949,7 @@ static int punch_hole(struct gfs2_inode *ip, u64 offs=
et, u64 length)
 =09=09gfs2_statfs_change(sdp, 0, +btotal, 0);
 =09=09gfs2_quota_change(ip, -(s64)btotal, ip->i_inode.i_uid,
 =09=09=09=09  ip->i_inode.i_gid);
-=09=09ip->i_inode.i_mtime =3D ip->i_inode.i_ctime =3D current_time(&ip->i_=
inode);
+=09=09ip->i_inode.i_mtime =3D inode_ctime_set_current(&ip->i_inode);
 =09=09gfs2_trans_add_meta(ip->i_gl, dibh);
 =09=09gfs2_dinode_out(ip, dibh->b_data);
 =09=09up_write(&ip->i_rw_mutex);
@@ -1993,7 +1992,7 @@ static int trunc_end(struct gfs2_inode *ip)
 =09=09gfs2_buffer_clear_tail(dibh, sizeof(struct gfs2_dinode));
 =09=09gfs2_ordered_del_inode(ip);
 =09}
-=09ip->i_inode.i_mtime =3D ip->i_inode.i_ctime =3D current_time(&ip->i_ino=
de);
+=09ip->i_inode.i_mtime =3D inode_ctime_set_current(&ip->i_inode);
 =09ip->i_diskflags &=3D ~GFS2_DIF_TRUNC_IN_PROG;
=20
 =09gfs2_trans_add_meta(ip->i_gl, dibh);
@@ -2094,7 +2093,7 @@ static int do_grow(struct inode *inode, u64 size)
 =09=09goto do_end_trans;
=20
 =09truncate_setsize(inode, size);
-=09ip->i_inode.i_mtime =3D ip->i_inode.i_ctime =3D current_time(&ip->i_ino=
de);
+=09ip->i_inode.i_mtime =3D inode_ctime_set_current(&ip->i_inode);
 =09gfs2_trans_add_meta(ip->i_gl, dibh);
 =09gfs2_dinode_out(ip, dibh->b_data);
 =09brelse(dibh);
diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index 54a6d17b8c25..c07cb9883ea1 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -130,7 +130,7 @@ static int gfs2_dir_write_stuffed(struct gfs2_inode *ip=
, const char *buf,
 =09memcpy(dibh->b_data + offset + sizeof(struct gfs2_dinode), buf, size);
 =09if (ip->i_inode.i_size < offset + size)
 =09=09i_size_write(&ip->i_inode, offset + size);
-=09ip->i_inode.i_mtime =3D ip->i_inode.i_ctime =3D current_time(&ip->i_ino=
de);
+=09ip->i_inode.i_mtime =3D inode_ctime_set_current(&ip->i_inode);
 =09gfs2_dinode_out(ip, dibh->b_data);
=20
 =09brelse(dibh);
@@ -227,7 +227,7 @@ static int gfs2_dir_write_data(struct gfs2_inode *ip, c=
onst char *buf,
=20
 =09if (ip->i_inode.i_size < offset + copied)
 =09=09i_size_write(&ip->i_inode, offset + copied);
-=09ip->i_inode.i_mtime =3D ip->i_inode.i_ctime =3D current_time(&ip->i_ino=
de);
+=09ip->i_inode.i_mtime =3D inode_ctime_set_current(&ip->i_inode);
=20
 =09gfs2_trans_add_meta(ip->i_gl, dibh);
 =09gfs2_dinode_out(ip, dibh->b_data);
@@ -1814,7 +1814,7 @@ int gfs2_dir_add(struct inode *inode, const struct qs=
tr *name,
 =09=09=09gfs2_inum_out(nip, dent);
 =09=09=09dent->de_type =3D cpu_to_be16(IF2DT(nip->i_inode.i_mode));
 =09=09=09dent->de_rahead =3D cpu_to_be16(gfs2_inode_ra_len(nip));
-=09=09=09tv =3D current_time(&ip->i_inode);
+=09=09=09tv =3D inode_ctime_set_current(&ip->i_inode);
 =09=09=09if (ip->i_diskflags & GFS2_DIF_EXHASH) {
 =09=09=09=09leaf =3D (struct gfs2_leaf *)bh->b_data;
 =09=09=09=09be16_add_cpu(&leaf->lf_entries, 1);
@@ -1825,7 +1825,7 @@ int gfs2_dir_add(struct inode *inode, const struct qs=
tr *name,
 =09=09=09da->bh =3D NULL;
 =09=09=09brelse(bh);
 =09=09=09ip->i_entries++;
-=09=09=09ip->i_inode.i_mtime =3D ip->i_inode.i_ctime =3D tv;
+=09=09=09ip->i_inode.i_mtime =3D tv;
 =09=09=09if (S_ISDIR(nip->i_inode.i_mode))
 =09=09=09=09inc_nlink(&ip->i_inode);
 =09=09=09mark_inode_dirty(inode);
@@ -1876,7 +1876,7 @@ int gfs2_dir_del(struct gfs2_inode *dip, const struct=
 dentry *dentry)
 =09const struct qstr *name =3D &dentry->d_name;
 =09struct gfs2_dirent *dent, *prev =3D NULL;
 =09struct buffer_head *bh;
-=09struct timespec64 tv =3D current_time(&dip->i_inode);
+=09struct timespec64 tv;
=20
 =09/* Returns _either_ the entry (if its first in block) or the
 =09   previous entry otherwise */
@@ -1895,6 +1895,7 @@ int gfs2_dir_del(struct gfs2_inode *dip, const struct=
 dentry *dentry)
 =09=09dent =3D (struct gfs2_dirent *)((char *)dent + be16_to_cpu(prev->de_=
rec_len));
 =09}
=20
+=09tv =3D inode_ctime_set_current(&dip->i_inode);
 =09dirent_del(dip, bh, prev, dent);
 =09if (dip->i_diskflags & GFS2_DIF_EXHASH) {
 =09=09struct gfs2_leaf *leaf =3D (struct gfs2_leaf *)bh->b_data;
@@ -1910,7 +1911,7 @@ int gfs2_dir_del(struct gfs2_inode *dip, const struct=
 dentry *dentry)
 =09if (!dip->i_entries)
 =09=09gfs2_consist_inode(dip);
 =09dip->i_entries--;
-=09dip->i_inode.i_mtime =3D dip->i_inode.i_ctime =3D tv;
+=09dip->i_inode.i_mtime =3D tv;
 =09if (d_is_dir(dentry))
 =09=09drop_nlink(&dip->i_inode);
 =09mark_inode_dirty(&dip->i_inode);
@@ -1951,7 +1952,7 @@ int gfs2_dir_mvino(struct gfs2_inode *dip, const stru=
ct qstr *filename,
 =09dent->de_type =3D cpu_to_be16(new_type);
 =09brelse(bh);
=20
-=09dip->i_inode.i_mtime =3D dip->i_inode.i_ctime =3D current_time(&dip->i_=
inode);
+=09dip->i_inode.i_mtime =3D inode_ctime_set_current(&dip->i_inode);
 =09mark_inode_dirty_sync(&dip->i_inode);
 =09return 0;
 }
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 1bf3c4453516..cb754c5f1d2d 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -260,7 +260,7 @@ static int do_gfs2_set_flags(struct inode *inode, u32 r=
eqflags, u32 mask)
 =09error =3D gfs2_meta_inode_buffer(ip, &bh);
 =09if (error)
 =09=09goto out_trans_end;
-=09inode->i_ctime =3D current_time(inode);
+=09inode_ctime_set_current(inode);
 =09gfs2_trans_add_meta(ip->i_gl, bh);
 =09ip->i_diskflags =3D new_flags;
 =09gfs2_dinode_out(ip, bh->b_data);
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 7c48c7afd6a4..2aba6f82194f 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -437,8 +437,8 @@ static int gfs2_dinode_in(struct gfs2_inode *ip, const =
void *buf)
 =09=09inode->i_atime =3D atime;
 =09inode->i_mtime.tv_sec =3D be64_to_cpu(str->di_mtime);
 =09inode->i_mtime.tv_nsec =3D be32_to_cpu(str->di_mtime_nsec);
-=09inode->i_ctime.tv_sec =3D be64_to_cpu(str->di_ctime);
-=09inode->i_ctime.tv_nsec =3D be32_to_cpu(str->di_ctime_nsec);
+=09inode_ctime_set_sec(inode, be64_to_cpu(str->di_ctime));
+=09inode_ctime_set_nsec(inode, be32_to_cpu(str->di_ctime_nsec));
=20
 =09ip->i_goal =3D be64_to_cpu(str->di_goal_meta);
 =09ip->i_generation =3D be64_to_cpu(str->di_generation);
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 17c994a0c0d0..3a9c9b6ea456 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -690,7 +690,7 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
 =09set_nlink(inode, S_ISDIR(mode) ? 2 : 1);
 =09inode->i_rdev =3D dev;
 =09inode->i_size =3D size;
-=09inode->i_atime =3D inode->i_mtime =3D inode->i_ctime =3D current_time(i=
node);
+=09inode->i_atime =3D inode->i_mtime =3D inode_ctime_set_current(inode);
 =09munge_mode_uid_gid(dip, inode);
 =09check_and_update_goal(dip);
 =09ip->i_goal =3D dip->i_goal;
@@ -1029,7 +1029,7 @@ static int gfs2_link(struct dentry *old_dentry, struc=
t inode *dir,
=20
 =09gfs2_trans_add_meta(ip->i_gl, dibh);
 =09inc_nlink(&ip->i_inode);
-=09ip->i_inode.i_ctime =3D current_time(&ip->i_inode);
+=09inode_ctime_set_current(&ip->i_inode);
 =09ihold(inode);
 =09d_instantiate(dentry, inode);
 =09mark_inode_dirty(inode);
@@ -1114,7 +1114,7 @@ static int gfs2_unlink_inode(struct gfs2_inode *dip,
 =09=09return error;
=20
 =09ip->i_entries =3D 0;
-=09inode->i_ctime =3D current_time(inode);
+=09inode_ctime_set_current(inode);
 =09if (S_ISDIR(inode->i_mode))
 =09=09clear_nlink(inode);
 =09else
@@ -1371,7 +1371,7 @@ static int update_moved_ino(struct gfs2_inode *ip, st=
ruct gfs2_inode *ndip,
 =09if (dir_rename)
 =09=09return gfs2_dir_mvino(ip, &gfs2_qdotdot, ndip, DT_DIR);
=20
-=09ip->i_inode.i_ctime =3D current_time(&ip->i_inode);
+=09inode_ctime_set_current(&ip->i_inode);
 =09mark_inode_dirty_sync(&ip->i_inode);
 =09return 0;
 }
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 9be72d5aafea..fc495df15e71 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -412,7 +412,7 @@ void gfs2_dinode_out(const struct gfs2_inode *ip, void =
*buf)
 =09str->di_blocks =3D cpu_to_be64(gfs2_get_inode_blocks(inode));
 =09str->di_atime =3D cpu_to_be64(inode->i_atime.tv_sec);
 =09str->di_mtime =3D cpu_to_be64(inode->i_mtime.tv_sec);
-=09str->di_ctime =3D cpu_to_be64(inode->i_ctime.tv_sec);
+=09str->di_ctime =3D cpu_to_be64(inode_ctime_peek(inode).tv_sec);
=20
 =09str->di_goal_meta =3D cpu_to_be64(ip->i_goal);
 =09str->di_goal_data =3D cpu_to_be64(ip->i_goal);
@@ -429,7 +429,7 @@ void gfs2_dinode_out(const struct gfs2_inode *ip, void =
*buf)
 =09str->di_eattr =3D cpu_to_be64(ip->i_eattr);
 =09str->di_atime_nsec =3D cpu_to_be32(inode->i_atime.tv_nsec);
 =09str->di_mtime_nsec =3D cpu_to_be32(inode->i_mtime.tv_nsec);
-=09str->di_ctime_nsec =3D cpu_to_be32(inode->i_ctime.tv_nsec);
+=09str->di_ctime_nsec =3D cpu_to_be32(inode_ctime_peek(inode).tv_nsec);
 }
=20
 /**
diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
index 93b36d026bb4..8f807d18ec52 100644
--- a/fs/gfs2/xattr.c
+++ b/fs/gfs2/xattr.c
@@ -311,7 +311,7 @@ static int ea_dealloc_unstuffed(struct gfs2_inode *ip, =
struct buffer_head *bh,
 =09=09ea->ea_num_ptrs =3D 0;
 =09}
=20
-=09ip->i_inode.i_ctime =3D current_time(&ip->i_inode);
+=09inode_ctime_set_current(&ip->i_inode);
 =09__mark_inode_dirty(&ip->i_inode, I_DIRTY_DATASYNC);
=20
 =09gfs2_trans_end(sdp);
@@ -763,7 +763,7 @@ static int ea_alloc_skeleton(struct gfs2_inode *ip, str=
uct gfs2_ea_request *er,
 =09if (error)
 =09=09goto out_end_trans;
=20
-=09ip->i_inode.i_ctime =3D current_time(&ip->i_inode);
+=09inode_ctime_set_current(&ip->i_inode);
 =09__mark_inode_dirty(&ip->i_inode, I_DIRTY_DATASYNC);
=20
 out_end_trans:
@@ -888,7 +888,7 @@ static int ea_set_simple_noalloc(struct gfs2_inode *ip,=
 struct buffer_head *bh,
 =09if (es->es_el)
 =09=09ea_set_remove_stuffed(ip, es->es_el);
=20
-=09ip->i_inode.i_ctime =3D current_time(&ip->i_inode);
+=09inode_ctime_set_current(&ip->i_inode);
 =09__mark_inode_dirty(&ip->i_inode, I_DIRTY_DATASYNC);
=20
 =09gfs2_trans_end(GFS2_SB(&ip->i_inode));
@@ -1106,7 +1106,7 @@ static int ea_remove_stuffed(struct gfs2_inode *ip, s=
truct gfs2_ea_location *el)
 =09=09ea->ea_type =3D GFS2_EATYPE_UNUSED;
 =09}
=20
-=09ip->i_inode.i_ctime =3D current_time(&ip->i_inode);
+=09inode_ctime_set_current(&ip->i_inode);
 =09__mark_inode_dirty(&ip->i_inode, I_DIRTY_DATASYNC);
=20
 =09gfs2_trans_end(GFS2_SB(&ip->i_inode));
--=20
2.41.0

