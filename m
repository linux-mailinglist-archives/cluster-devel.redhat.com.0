Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2FB10307
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 01:03:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AC73305390F;
	Tue, 30 Apr 2019 23:03:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7C1A1001E95;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C687618089D1;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UN3Oe8023023 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:03:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF6AC8174C; Tue, 30 Apr 2019 23:03:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-20.phx2.redhat.com [10.3.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A97CD7C850
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:03:24 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 30 Apr 2019 17:03:11 -0600
Message-Id: <20190430230319.10375-12-rpeterso@redhat.com>
In-Reply-To: <20190430230319.10375-1-rpeterso@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v3 11/19] gfs2: Allow some glocks to be
	used during withdraw
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 30 Apr 2019 23:03:31 +0000 (UTC)

Before this patch, when a file system was withdrawn, all further
attempts to enqueue or promote glocks were rejected and returned
-EIO. This is only important for media-backed glocks like inode
and rgrp glocks. All other glocks may be safely used because there
is no potential for metadata corruption. This patch allows some
glocks to be used even after the file system is withdrawn. This
is accomplished with a new glops flag, GLOF_JOURNALED, which tells
us which inodes cannot be safely manipulated after withdraw. This
facilitates future patches that enhance fs withdraw.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c      |  7 +++++--
 fs/gfs2/glops.c      | 16 +++++++++++++---
 fs/gfs2/glops.h      |  3 ++-
 fs/gfs2/incore.h     |  8 ++++++++
 fs/gfs2/inode.c      | 14 ++++++++++----
 fs/gfs2/ops_fstype.c | 14 +++++++++++---
 fs/gfs2/sys.c        | 12 ++++++++++--
 7 files changed, 59 insertions(+), 15 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index fe9f9a22426e..eeb84d8d21f3 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -548,7 +548,7 @@ __acquires(&gl->gl_lockref.lock)
 	int ret;
 
 	if (unlikely(gfs2_withdrawn(sdp)) &&
-	    target != LM_ST_UNLOCKED)
+	    (glops->go_flags & GLOF_JOURNALED) && target != LM_ST_UNLOCKED)
 		return;
 	lck_flags &= (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
 		      LM_FLAG_PRIORITY);
@@ -1096,7 +1096,8 @@ int gfs2_glock_nq(struct gfs2_holder *gh)
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	int error = 0;
 
-	if (unlikely(gfs2_withdrawn(sdp)))
+	if (unlikely(gfs2_withdrawn(sdp)) &&
+	    (gl->gl_ops->go_flags & GLOF_JOURNALED))
 		return -EIO;
 
 	if (test_bit(GLF_LRU, &gl->gl_flags))
@@ -1760,6 +1761,8 @@ static const char *gflags2str(char *buf, const struct gfs2_glock *gl)
 		*p++ = 'o';
 	if (test_bit(GLF_BLOCKING, gflags))
 		*p++ = 'b';
+	if (gl->gl_ops->go_flags & GLOF_JOURNALED)
+		*p++ = 'j';
 	*p = 0;
 	return buf;
 }
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index b9f36a85a4d4..d2b44bdca17e 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -584,7 +584,7 @@ const struct gfs2_glock_operations gfs2_meta_glops = {
 	.go_type = LM_TYPE_META,
 };
 
-const struct gfs2_glock_operations gfs2_inode_glops = {
+const struct gfs2_glock_operations gfs2_sys_inode_glops = {
 	.go_sync = inode_go_sync,
 	.go_inval = inode_go_inval,
 	.go_demote_ok = inode_go_demote_ok,
@@ -594,6 +594,16 @@ const struct gfs2_glock_operations gfs2_inode_glops = {
 	.go_flags = GLOF_ASPACE | GLOF_LRU,
 };
 
+const struct gfs2_glock_operations gfs2_user_inode_glops = {
+	.go_sync = inode_go_sync,
+	.go_inval = inode_go_inval,
+	.go_demote_ok = inode_go_demote_ok,
+	.go_lock = inode_go_lock,
+	.go_dump = inode_go_dump,
+	.go_type = LM_TYPE_INODE,
+	.go_flags = GLOF_ASPACE | GLOF_LRU | GLOF_JOURNALED,
+};
+
 const struct gfs2_glock_operations gfs2_rgrp_glops = {
 	.go_sync = rgrp_go_sync,
 	.go_inval = rgrp_go_inval,
@@ -601,7 +611,7 @@ const struct gfs2_glock_operations gfs2_rgrp_glops = {
 	.go_unlock = gfs2_rgrp_go_unlock,
 	.go_dump = gfs2_rgrp_dump,
 	.go_type = LM_TYPE_RGRP,
-	.go_flags = GLOF_LVB,
+	.go_flags = GLOF_LVB | GLOF_JOURNALED,
 };
 
 const struct gfs2_glock_operations gfs2_freeze_glops = {
@@ -637,7 +647,7 @@ const struct gfs2_glock_operations gfs2_journal_glops = {
 
 const struct gfs2_glock_operations *gfs2_glops_list[] = {
 	[LM_TYPE_META] = &gfs2_meta_glops,
-	[LM_TYPE_INODE] = &gfs2_inode_glops,
+	[LM_TYPE_INODE] = &gfs2_user_inode_glops,
 	[LM_TYPE_RGRP] = &gfs2_rgrp_glops,
 	[LM_TYPE_IOPEN] = &gfs2_iopen_glops,
 	[LM_TYPE_FLOCK] = &gfs2_flock_glops,
diff --git a/fs/gfs2/glops.h b/fs/gfs2/glops.h
index 8ed1857c1a8d..63130a5959e1 100644
--- a/fs/gfs2/glops.h
+++ b/fs/gfs2/glops.h
@@ -15,7 +15,8 @@
 extern struct workqueue_struct *gfs2_freeze_wq;
 
 extern const struct gfs2_glock_operations gfs2_meta_glops;
-extern const struct gfs2_glock_operations gfs2_inode_glops;
+extern const struct gfs2_glock_operations gfs2_user_inode_glops;
+extern const struct gfs2_glock_operations gfs2_sys_inode_glops;
 extern const struct gfs2_glock_operations gfs2_rgrp_glops;
 extern const struct gfs2_glock_operations gfs2_freeze_glops;
 extern const struct gfs2_glock_operations gfs2_iopen_glops;
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index e16ab4c98072..b16b82e5b85a 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -250,6 +250,14 @@ struct gfs2_glock_operations {
 #define GLOF_ASPACE 1
 #define GLOF_LVB    2
 #define GLOF_LRU    4
+/**
+ * The GLOF_JOURNALED flag marks objects that are journaled, which means we
+ * need to treat them specially when a file system withdraw occurs. Inodes
+ * like the journal inode itself are okay to manipulate after withdraw, but
+ * user files need to be protected from journal replay after their glock has
+ * been granted to another node.
+ */
+#define GLOF_JOURNALED 8
 };
 
 enum {
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 998051c4aea7..2fefd8581965 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -141,7 +141,8 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
 		struct gfs2_sbd *sdp = GFS2_SB(inode);
 		ip->i_no_formal_ino = no_formal_ino;
 
-		error = gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE, &ip->i_gl);
+		error = gfs2_glock_get(sdp, no_addr, &gfs2_user_inode_glops,
+				       CREATE, &ip->i_gl);
 		if (unlikely(error))
 			goto fail;
 		flush_delayed_work(&ip->i_gl->gl_work);
@@ -248,6 +249,8 @@ struct inode *gfs2_lookup_simple(struct inode *dip, const char *name)
 {
 	struct qstr qstr;
 	struct inode *inode;
+	struct gfs2_inode *ip;
+
 	gfs2_str2qstr(&qstr, name);
 	inode = gfs2_lookupi(dip, &qstr, 1);
 	/* gfs2_lookupi has inconsistent callers: vfs
@@ -257,8 +260,10 @@ struct inode *gfs2_lookup_simple(struct inode *dip, const char *name)
 	 */
 	if (inode == NULL)
 		return ERR_PTR(-ENOENT);
-	else
-		return inode;
+
+	ip = GFS2_I(inode);
+	ip->i_gl->gl_ops = &gfs2_sys_inode_glops;
+	return inode;
 }
 
 
@@ -703,7 +708,8 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
 
 	gfs2_set_inode_blocks(inode, blocks);
 
-	error = gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_inode_glops, CREATE, &ip->i_gl);
+	error = gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_user_inode_glops,
+			       CREATE, &ip->i_gl);
 	if (error)
 		goto fail_free_inode;
 	flush_delayed_work(&ip->i_gl->gl_work);
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 8a09f3aa609c..531c1870de8e 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -431,7 +431,7 @@ static int init_locking(struct gfs2_sbd *sdp, struct gfs2_holder *mount_gh,
 }
 
 static int gfs2_lookup_root(struct super_block *sb, struct dentry **dptr,
-			    u64 no_addr, const char *name)
+			    u64 no_addr, const char *name, int journaled)
 {
 	struct gfs2_sbd *sdp = sb->s_fs_info;
 	struct dentry *dentry;
@@ -443,6 +443,11 @@ static int gfs2_lookup_root(struct super_block *sb, struct dentry **dptr,
 		fs_err(sdp, "can't read in %s inode: %ld\n", name, PTR_ERR(inode));
 		return PTR_ERR(inode);
 	}
+	if (!journaled) {
+		struct gfs2_inode *ip = GFS2_I(inode);
+
+		ip->i_gl->gl_ops = &gfs2_sys_inode_glops;
+	}
 	dentry = d_make_root(inode);
 	if (!dentry) {
 		fs_err(sdp, "can't alloc %s dentry\n", name);
@@ -491,13 +496,13 @@ static int init_sb(struct gfs2_sbd *sdp, int silent)
 
 	/* Get the root inode */
 	no_addr = sdp->sd_sb.sb_root_dir.no_addr;
-	ret = gfs2_lookup_root(sb, &sdp->sd_root_dir, no_addr, "root");
+	ret = gfs2_lookup_root(sb, &sdp->sd_root_dir, no_addr, "root", 1);
 	if (ret)
 		goto out;
 
 	/* Get the master inode */
 	no_addr = sdp->sd_sb.sb_master_dir.no_addr;
-	ret = gfs2_lookup_root(sb, &sdp->sd_master_dir, no_addr, "master");
+	ret = gfs2_lookup_root(sb, &sdp->sd_master_dir, no_addr, "master", 0);
 	if (ret) {
 		dput(sdp->sd_root_dir);
 		goto out;
@@ -532,6 +537,7 @@ static void gfs2_others_may_mount(struct gfs2_sbd *sdp)
 static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struct gfs2_holder *ji_gh)
 {
 	struct gfs2_inode *dip = GFS2_I(sdp->sd_jindex);
+	struct gfs2_inode *ip;
 	struct qstr name;
 	char buf[20];
 	struct gfs2_jdesc *jd;
@@ -579,6 +585,8 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struct gfs2_holder *ji_gh)
 			break;
 		}
 
+		ip = GFS2_I(jd->jd_inode);
+		ip->i_gl->gl_ops = &gfs2_sys_inode_glops;
 		spin_lock(&sdp->sd_jindex_spin);
 		jd->jd_jid = sdp->sd_journals++;
 		list_add_tail(&jd->jd_list, &sdp->sd_jindex_list);
diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index b772ff5509bb..dd32e266fd2e 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -264,8 +264,16 @@ static ssize_t demote_rq_store(struct gfs2_sbd *sdp, const char *buf, size_t len
 	if (!test_and_set_bit(SDF_DEMOTE, &sdp->sd_flags))
 		fs_info(sdp, "demote interface used\n");
 	rv = gfs2_glock_get(sdp, glnum, glops, 0, &gl);
-	if (rv)
-		return rv;
+	if (rv) {
+		/* If the glock is not found and it's supposed to be an inode,
+		 * check if it's one of the system inodes. */
+		if (gltype == LM_TYPE_INODE) {
+			glops = &gfs2_sys_inode_glops;
+			rv = gfs2_glock_get(sdp, glnum, glops, 0, &gl);
+			if (rv)
+				return rv;
+		}
+	}
 	gfs2_glock_cb(gl, glmode);
 	gfs2_glock_put(gl);
 	return len;
-- 
2.20.1

