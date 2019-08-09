Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFD288312
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Aug 2019 21:00:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08C65309BF04;
	Fri,  9 Aug 2019 19:00:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 688F919C58;
	Fri,  9 Aug 2019 19:00:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C569F2551C;
	Fri,  9 Aug 2019 19:00:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79IwVAt021370 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 14:58:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 397A0608A7; Fri,  9 Aug 2019 18:58:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33CCB60872
	for <cluster-devel@redhat.com>; Fri,  9 Aug 2019 18:58:29 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11F5318005A0
	for <cluster-devel@redhat.com>; Fri,  9 Aug 2019 18:58:29 +0000 (UTC)
Date: Fri, 9 Aug 2019 14:58:29 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1717230208.7744454.1565377109013.JavaMail.zimbra@redhat.com>
In-Reply-To: <655197227.7744188.1565376946008.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.116.200, 10.4.195.11]
Thread-Topic: gfs2: eliminate circular lock dependency in inode.c
Thread-Index: G8WJ2c8+MxjK2yXqyQhaxx5QGcObZw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: eliminate circular lock
	dependency in inode.c
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 09 Aug 2019 19:00:32 +0000 (UTC)

Hi,

This patch fixes problems caused by regressions from patch
"GFS2: rm on multiple nodes causes panic" from 2008,
72dbf4790fc6736f9cb54424245114acf0b0038c, which was an earlier
attempt to fix very similar problems.

The original problem for which it was written had to do with
simultaneous link, unlink, rmdir and rename operations on
multiple nodes that interfered with one another, due to the
lock ordering. The problem was that the lock ordering was
not consistent between the operations.

The defective patch put in place to solve it (and hey, it
worked for more than 10 years) changed the lock ordering so
that the parent directory glock was always locked before the
child. This almost always worked. Almost. The rmdir version
was still wrong because the rgrp glock was added to the holder
array, which was sorted, and the locks were acquired in sorted
order. That is counter to the locking requirements documented
in: Documentation/filesystems/gfs2-glocks.txt which states the
rgrp glock glock must always be locked after the inode glocks.

The real problem came with renames, though. Function
gfs2_rename(), which locked a series of inode glocks, did so
in parent-child order due to that patch. But it was still
possible to create circular lock dependencies just by doing the
wrong combination of renames on different nodes. For example:

Node a: mv /mnt/gfs2/sub /mnt/gfs2/tmp_name (rename sub to tmp_name)

a1. Same directory, so rename glock is NOT held
a2. /mnt/gfs2 is locked
a3. Tries to lock sub for rename, but it is locked on node b

Node b: mv /mnt/gfs2/sub /mnt/gfs2/dir1/ (move sub to dir1...
        mv /mnt/gfs2/dir1/sub /mnt/gfs2/  ...then move it back)

b1. Different directory, so rename glock IS held
b2. /mnt/gfs2 is locked
b3. dir1 is locked
b4. sub is moved to dir1 and everything is unlocked
b5. Different directory, so rename glock IS held again
b6. dir1 is locked
b7. Lock for /mnt/gfs2 is requested, but cannot be granted because
    node 1 locked it in step a2.

(Note that the nodes must be different, otherwise the vfs inode
level locking prevents the problem on a single node).

Thus, we get into a glock deadlock that looks like this:

host-018:
G:  s:EX n:2/3347 f:DyIqob t:EX d:UN/2368172000 a:0 v:0 r:3 m:150 <--------root
 H: s:EX f:H e:0 p:6414 [renameat_frenzy] gfs2_rename+0x32a/0x680 [gfs2]
 I: n:20/13127 t:4 f:0x00 d:0x00000001 s:3864
G:  s:UN n:2/3348 f:ldIqob t:EX d:UN/0 a:0 v:0 r:3 m:150 <-----------------dir6
 H: s:EX f:W e:0 p:6414 [renameat_frenzy] gfs2_rename+0x18f/0x680 [gfs2]
[root@host-018 ~]# cat /proc/6414/stack
[<ffffffffc04b621e>] gfs2_glock_wait+0x3e/0x80 [gfs2]
[<ffffffffc04b7d00>] gfs2_glock_nq+0x250/0x420 [gfs2]
[<ffffffffc04c7908>] gfs2_rename+0x228/0x680 [gfs2]
[<ffffffffc04c7d7d>] gfs2_rename2+0x1d/0x40 [gfs2]
[<ffffffff81e57245>] vfs_rename+0x575/0x880

So host-018 is holding root, and waiting for dir6

host-019:
G:  s:EX n:1/3 f:Iqb t:EX d:EX/0 a:0 v:0 r:3 m:200 <---------------------rename
 H: s:EX f:H e:0 p:6414 [renameat_frenzy] gfs2_rename+0xe7/0x680 [gfs2]
G:  s:UN n:2/3347 f:lIqob t:EX d:EX/0 a:0 v:0 r:3 m:10 <-------------------root
 H: s:EX f:W e:0 p:6414 [renameat_frenzy] gfs2_rename+0x162/0x680 [gfs2]
G:  s:EX n:2/3348 f:DIqob t:EX d:UN/2377079000 a:0 v:0 r:3 m:200 <---------dir6
 H: s:EX f:H e:0 p:6414 [renameat_frenzy] gfs2_rename+0x140/0x680 [gfs2]
 I: n:1/13128 t:4 f:0x00 d:0x00000001 s:3864
[root@host-019 ~]# cat /proc/6414/stack
[<ffffffffc05e621e>] gfs2_glock_wait+0x3e/0x80 [gfs2]
[<ffffffffc05e7d00>] gfs2_glock_nq+0x250/0x420 [gfs2]
[<ffffffffc05f7908>] gfs2_rename+0x228/0x680 [gfs2]
[<ffffffffc05f7d7d>] gfs2_rename2+0x1d/0x40 [gfs2]
[<ffffffff90e57245>] vfs_rename+0x575/0x880

So host-019 is holding dir6, waiting for root

Before the defective patch, many of the functions like gfs2_rename
used gfs2_glock_nq_m to acquire their inode glocks, which acquires
them in sorted order. That means dependencies should always be
heirarchical and never circular, even across multiple nodes.

This patch reintroduces the use of gfs2_glock_nq_m for many of
the inode operations in inode.c. It also separates the rgrp glocks
from the others so the correct locking order is properly enforced.
This consistency in locking should prevent any deadlocks.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/inode.c | 114 ++++++++++++++++++++++++--------------------------------
 1 file changed, 49 insertions(+), 65 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 2e2a8a2fb51d..d7a80b35910f 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -912,13 +912,9 @@ static int gfs2_link(struct dentry *old_dentry, struct inode *dir,
 	gfs2_holder_init(dip->i_gl, LM_ST_EXCLUSIVE, 0, ghs);
 	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, ghs + 1);
 
-	error = gfs2_glock_nq(ghs); /* parent */
+	error = gfs2_glock_nq_m(2, ghs); /* inodes */
 	if (error)
-		goto out_parent;
-
-	error = gfs2_glock_nq(ghs + 1); /* child */
-	if (error)
-		goto out_child;
+		goto out_uninit;
 
 	error = -ENOENT;
 	if (inode->i_nlink == 0)
@@ -1004,10 +1000,8 @@ static int gfs2_link(struct dentry *old_dentry, struct inode *dir,
 		gfs2_quota_unlock(dip);
 out_gunlock:
 	gfs2_dir_no_add(&da);
-	gfs2_glock_dq(ghs + 1);
-out_child:
-	gfs2_glock_dq(ghs);
-out_parent:
+	gfs2_glock_dq_m(2, ghs);
+out_uninit:
 	gfs2_holder_uninit(ghs);
 	gfs2_holder_uninit(ghs + 1);
 	return error;
@@ -1100,7 +1094,7 @@ static int gfs2_unlink(struct inode *dir, struct dentry *dentry)
 	struct gfs2_sbd *sdp = GFS2_SB(dir);
 	struct inode *inode = d_inode(dentry);
 	struct gfs2_inode *ip = GFS2_I(inode);
-	struct gfs2_holder ghs[3];
+	struct gfs2_holder ghs[2], rd_gh;
 	struct gfs2_rgrpd *rgd;
 	int error;
 
@@ -1108,60 +1102,48 @@ static int gfs2_unlink(struct inode *dir, struct dentry *dentry)
 	if (error)
 		return error;
 
-	error = -EROFS;
-
-	gfs2_holder_init(dip->i_gl, LM_ST_EXCLUSIVE, 0, ghs);
-	gfs2_holder_init(ip->i_gl,  LM_ST_EXCLUSIVE, 0, ghs + 1);
-
 	rgd = gfs2_blk2rgrpd(sdp, ip->i_no_addr, 1);
 	if (!rgd)
-		goto out_inodes;
-
-	gfs2_holder_init(rgd->rd_gl, LM_ST_EXCLUSIVE, 0, ghs + 2);
+		return -EROFS;
 
+	gfs2_holder_init(dip->i_gl, LM_ST_EXCLUSIVE, 0, ghs);
+	gfs2_holder_init(ip->i_gl,  LM_ST_EXCLUSIVE, 0, ghs + 1);
 
-	error = gfs2_glock_nq(ghs); /* parent */
+	error = gfs2_glock_nq_m(2, ghs); /* inodes */
 	if (error)
-		goto out_parent;
+		goto out_uninit;
 
-	error = gfs2_glock_nq(ghs + 1); /* child */
+	error = gfs2_glock_nq_init(rgd->rd_gl, LM_ST_EXCLUSIVE, 0, &rd_gh);
 	if (error)
-		goto out_child;
+		goto out_gunlock;
 
-	error = -ENOENT;
-	if (inode->i_nlink == 0)
-		goto out_rgrp;
+	if (inode->i_nlink == 0) {
+		error = -ENOENT;
+		goto out_rgunlock;
+	}
 
-	if (S_ISDIR(inode->i_mode)) {
+	if (S_ISDIR(inode->i_mode) &&
+	    (ip->i_entries > 2 || inode->i_nlink > 2)) {
 		error = -ENOTEMPTY;
-		if (ip->i_entries > 2 || inode->i_nlink > 2)
-			goto out_rgrp;
+		goto out_rgunlock;
 	}
 
-	error = gfs2_glock_nq(ghs + 2); /* rgrp */
-	if (error)
-		goto out_rgrp;
-
 	error = gfs2_unlink_ok(dip, &dentry->d_name, ip);
 	if (error)
-		goto out_gunlock;
+		goto out_rgunlock;
 
 	error = gfs2_trans_begin(sdp, 2*RES_DINODE + 3*RES_LEAF + RES_RG_BIT, 0);
 	if (error)
-		goto out_gunlock;
+		goto out_rgunlock;
 
 	error = gfs2_unlink_inode(dip, dentry);
 	gfs2_trans_end(sdp);
 
+out_rgunlock:
+	gfs2_glock_dq_uninit(&rd_gh);
 out_gunlock:
-	gfs2_glock_dq(ghs + 2);
-out_rgrp:
-	gfs2_glock_dq(ghs + 1);
-out_child:
-	gfs2_glock_dq(ghs);
-out_parent:
-	gfs2_holder_uninit(ghs + 2);
-out_inodes:
+	gfs2_glock_dq_m(2, ghs);
+out_uninit:
 	gfs2_holder_uninit(ghs + 1);
 	gfs2_holder_uninit(ghs);
 	return error;
@@ -1348,15 +1330,15 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 	struct gfs2_inode *ip = GFS2_I(d_inode(odentry));
 	struct gfs2_inode *nip = NULL;
 	struct gfs2_sbd *sdp = GFS2_SB(odir);
-	struct gfs2_holder ghs[5], r_gh;
-	struct gfs2_rgrpd *nrgd;
+	struct gfs2_holder ghs[4], r_gh, rd_gh;
+	struct gfs2_rgrpd *nrgd = NULL;
 	unsigned int num_gh;
 	int dir_rename = 0;
 	struct gfs2_diradd da = { .nr_blocks = 0, .save_loc = 0, };
-	unsigned int x;
 	int error;
 
 	gfs2_holder_mark_uninitialized(&r_gh);
+	gfs2_holder_mark_uninitialized(&rd_gh);
 	if (d_really_is_positive(ndentry)) {
 		nip = GFS2_I(d_inode(ndentry));
 		if (ip == nip)
@@ -1403,12 +1385,15 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 		 * so we unlink before doing the rename
 		 */
 		nrgd = gfs2_blk2rgrpd(sdp, nip->i_no_addr, 1);
-		if (nrgd)
-			gfs2_holder_init(nrgd->rd_gl, LM_ST_EXCLUSIVE, 0, ghs + num_gh++);
 	}
 
-	for (x = 0; x < num_gh; x++) {
-		error = gfs2_glock_nq(ghs + x);
+	error = gfs2_glock_nq_m(num_gh, ghs);
+	if (error)
+		goto out_uninit;
+
+	if (nrgd) {
+		error = gfs2_glock_nq_init(nrgd->rd_gl, LM_ST_EXCLUSIVE, 0,
+					   &rd_gh);
 		if (error)
 			goto out_gunlock;
 	}
@@ -1541,10 +1526,12 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 		gfs2_quota_unlock(ndip);
 out_gunlock:
 	gfs2_dir_no_add(&da);
-	while (x--) {
-		gfs2_glock_dq(ghs + x);
-		gfs2_holder_uninit(ghs + x);
-	}
+	if (gfs2_holder_initialized(&rd_gh))
+		gfs2_glock_dq_uninit(&rd_gh);
+	gfs2_glock_dq_m(num_gh, ghs);
+out_uninit:
+	while (num_gh--)
+		gfs2_holder_uninit(ghs + num_gh);
 out_gunlock_r:
 	if (gfs2_holder_initialized(&r_gh))
 		gfs2_glock_dq_uninit(&r_gh);
@@ -1572,9 +1559,8 @@ static int gfs2_exchange(struct inode *odir, struct dentry *odentry,
 	struct gfs2_inode *oip = GFS2_I(odentry->d_inode);
 	struct gfs2_inode *nip = GFS2_I(ndentry->d_inode);
 	struct gfs2_sbd *sdp = GFS2_SB(odir);
-	struct gfs2_holder ghs[5], r_gh;
+	struct gfs2_holder ghs[4], r_gh;
 	unsigned int num_gh;
-	unsigned int x;
 	umode_t old_mode = oip->i_inode.i_mode;
 	umode_t new_mode = nip->i_inode.i_mode;
 	int error;
@@ -1617,11 +1603,9 @@ static int gfs2_exchange(struct inode *odir, struct dentry *odentry,
 	gfs2_holder_init(nip->i_gl, LM_ST_EXCLUSIVE, 0, ghs + num_gh);
 	num_gh++;
 
-	for (x = 0; x < num_gh; x++) {
-		error = gfs2_glock_nq(ghs + x);
-		if (error)
-			goto out_gunlock;
-	}
+	error = gfs2_glock_nq_m(num_gh, ghs);
+	if (error)
+		goto out_guninit;
 
 	error = -ENOENT;
 	if (oip->i_inode.i_nlink == 0 || nip->i_inode.i_nlink == 0)
@@ -1682,10 +1666,10 @@ static int gfs2_exchange(struct inode *odir, struct dentry *odentry,
 out_end_trans:
 	gfs2_trans_end(sdp);
 out_gunlock:
-	while (x--) {
-		gfs2_glock_dq(ghs + x);
-		gfs2_holder_uninit(ghs + x);
-	}
+	gfs2_glock_dq_m(num_gh, ghs);
+out_guninit:
+	while (num_gh--)
+		gfs2_holder_uninit(ghs + num_gh);
 out_gunlock_r:
 	if (gfs2_holder_initialized(&r_gh))
 		gfs2_glock_dq_uninit(&r_gh);

