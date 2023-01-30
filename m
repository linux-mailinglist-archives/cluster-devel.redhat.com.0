Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F706814DD
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 16:21:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675092118;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LN2yhSp7mvvdTNfrG6SGYPO3/d6ESr4pApKADaVM7A0=;
	b=Uf62qg2DUDFazdrrWq+Q9TP7IH7Vg2YqwUmfXx7DWVFuu1qVekdeSCuJAnxe6sdzGwLfKF
	XSUx/9gjJpn1LHkganobW1EV/ziOA2grQDyxd5mRjppXJwrIgXr8ETsSlORK+ODBtqAnbK
	/Gw4ep5tjGEPWzX42tl5QSD0WSoFcBY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-uo2ItJYQM1y65ASAOzix8g-1; Mon, 30 Jan 2023 10:21:52 -0500
X-MC-Unique: uo2ItJYQM1y65ASAOzix8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E7E78030D5;
	Mon, 30 Jan 2023 15:21:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C34262166B26;
	Mon, 30 Jan 2023 15:21:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8FA411946597;
	Mon, 30 Jan 2023 15:21:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D2F861946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 15:21:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B7C4D40C2064; Mon, 30 Jan 2023 15:21:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.37.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4747040C2004
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 15:21:48 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 30 Jan 2023 15:21:41 +0000
Message-Id: <20230130152146.633484-2-anprice@redhat.com>
In-Reply-To: <20230130152146.633484-1-anprice@redhat.com>
References: <20230130152146.633484-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH 1/6] libgfs2: Return the inode from
 lgfs2_lookupi()
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Instead of returning a -errno with the inode set via a passed in
pointer, return the inode and use errno. This is more consistent and
simplifies some calling code.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c |  7 +++----
 gfs2/edit/hexedit.c         |  2 +-
 gfs2/fsck/fs_recovery.c     | 14 ++++++--------
 gfs2/fsck/initialize.c      | 18 +++++++++---------
 gfs2/fsck/pass2.c           |  8 ++++----
 gfs2/glocktop/glocktop.c    |  6 +++---
 gfs2/libgfs2/check_fs_ops.c | 18 +++++++-----------
 gfs2/libgfs2/fs_ops.c       | 38 +++++++++++++++++++------------------
 gfs2/libgfs2/gfs2l.c        |  2 +-
 gfs2/libgfs2/lang.c         | 10 ++++++----
 gfs2/libgfs2/libgfs2.h      |  3 +--
 tests/nukerg.c              |  2 +-
 12 files changed, 62 insertions(+), 66 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index e0ca7c71..bf9985ae 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -2139,11 +2139,10 @@ static void copy_quotas(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inum inum;
 	struct lgfs2_inode *oq_ip, *nq_ip;
-	int err;
 
-	err = lgfs2_lookupi(sdp->master_dir, "quota", 5, &nq_ip);
-	if (err) {
-		fprintf(stderr, _("Couldn't lookup new quota file: %d\n"), err);
+	nq_ip = lgfs2_lookupi(sdp->master_dir, "quota", 5);
+	if (nq_ip == NULL) {
+		perror(_("Failed to look up new quota file"));
 		exit(1);
 	}
 
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 553b15a5..c779433c 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -925,7 +925,7 @@ static void read_superblock(int fd)
 		if (sbd.master_dir == NULL) {
 			sbd.md.riinode = NULL;
 		} else {
-			lgfs2_lookupi(sbd.master_dir, "rindex", 6, &sbd.md.riinode);
+			sbd.md.riinode = lgfs2_lookupi(sbd.master_dir, "rindex", 6);
 		}
 	}
 	lgfs2_brelse(bh);
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index 8e572523..47433eac 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -789,10 +789,9 @@ int ji_update(struct lgfs2_sbd *sdp)
 				return -1;
 		} else {
 			/* FIXME check snprintf return code */
-			snprintf(journal_name, JOURNAL_NAME_SIZE,
-				 "journal%u", i);
-			lgfs2_lookupi(sdp->md.jiinode, journal_name,
-				     strlen(journal_name), &jip);
+			int len;
+			len = snprintf(journal_name, JOURNAL_NAME_SIZE, "journal%u", i);
+			jip = lgfs2_lookupi(sdp->md.jiinode, journal_name, len);
 			sdp->md.journal[i] = jip;
 		}
 	}
@@ -884,7 +883,7 @@ int init_jindex(struct fsck_cx *cx, int allow_ji_rebuild)
 	if (sdp->gfs1)
 		sdp->md.jiinode = lgfs2_inode_read(sdp, sdp->sd_jindex_di.in_addr);
 	else
-		lgfs2_lookupi(sdp->master_dir, "jindex", 6, &sdp->md.jiinode);
+		sdp->md.jiinode = lgfs2_lookupi(sdp->master_dir, "jindex", 6);
 
 	if (!sdp->md.jiinode) {
 		int err;
@@ -906,7 +905,7 @@ int init_jindex(struct fsck_cx *cx, int allow_ji_rebuild)
 			log_crit(_("Error %d rebuilding jindex\n"), err);
 			return err;
 		}
-		lgfs2_lookupi(sdp->master_dir, "jindex", 6, &sdp->md.jiinode);
+		sdp->md.jiinode = lgfs2_lookupi(sdp->master_dir, "jindex", 6);
 	}
 
 	/* check for irrelevant entries in jindex. Can't use check_dir because
@@ -938,8 +937,7 @@ int init_jindex(struct fsck_cx *cx, int allow_ji_rebuild)
 					  "index: Cannot continue.\n"));
 				return error;
 			}
-			lgfs2_lookupi(sdp->master_dir, "jindex", 6,
-				     &sdp->md.jiinode);
+			sdp->md.jiinode = lgfs2_lookupi(sdp->master_dir, "jindex", 6);
 		}
 	}
 
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index edb0b7fd..e8a8cb8b 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -597,7 +597,7 @@ static void lookup_per_node(struct fsck_cx *cx, int allow_rebuild)
 	if (sdp->md.pinode)
 		return;
 
-	lgfs2_lookupi(sdp->master_dir, "per_node", 8, &sdp->md.pinode);
+	sdp->md.pinode = lgfs2_lookupi(sdp->master_dir, "per_node", 8);
 	if (sdp->md.pinode)
 		return;
 	if (!allow_rebuild) {
@@ -618,7 +618,7 @@ static void lookup_per_node(struct fsck_cx *cx, int allow_rebuild)
 			exit(FSCK_ERROR);
 		}
 	}
-	lgfs2_lookupi(sdp->master_dir, "per_node", 8, &sdp->md.pinode);
+	sdp->md.pinode = lgfs2_lookupi(sdp->master_dir, "per_node", 8);
 	if (!sdp->md.pinode) {
 		log_err( _("Unable to rebuild per_node; aborting.\n"));
 		exit(FSCK_ERROR);
@@ -799,7 +799,7 @@ static int init_system_inodes(struct fsck_cx *cx)
 	 *******************************************************************/
 	if (!sdp->gfs1) {
 		/* Look for "inum" entry in master dinode */
-		lgfs2_lookupi(sdp->master_dir, "inum", 4, &sdp->md.inum);
+		sdp->md.inum = lgfs2_lookupi(sdp->master_dir, "inum", 4);
 		if (!sdp->md.inum) {
 			if (!query(cx, _("The gfs2 system inum inode is missing. "
 				      "Okay to rebuild it? (y/n) "))) {
@@ -850,7 +850,7 @@ static int init_system_inodes(struct fsck_cx *cx)
 			goto fail;
 		}
 	} else
-		lgfs2_lookupi(sdp->master_dir, "statfs", 6, &sdp->md.statfs);
+		sdp->md.statfs = lgfs2_lookupi(sdp->master_dir, "statfs", 6);
 	if (!sdp->gfs1 && !sdp->md.statfs) {
 		if (!query(cx, _("The gfs2 system statfs inode is missing. "
 			      "Okay to rebuild it? (y/n) "))) {
@@ -907,7 +907,7 @@ static int init_system_inodes(struct fsck_cx *cx)
 			goto fail;
 		}
 	} else
-		lgfs2_lookupi(sdp->master_dir, "quota", 5, &sdp->md.qinode);
+		sdp->md.qinode = lgfs2_lookupi(sdp->master_dir, "quota", 5);
 	if (!sdp->gfs1 && !sdp->md.qinode) {
 		if (!query(cx, _("The gfs2 system quota inode is missing. "
 			      "Okay to rebuild it? (y/n) "))) {
@@ -996,7 +996,7 @@ static void peruse_system_dinode(struct fsck_cx *cx, struct lgfs2_inode *ip)
 	} else if (!sdp->gfs1 && is_dir(ip, sdp->gfs1)) {
 		/* Check for a jindex dir entry. Only one system dir has a
 		   jindex: master */
-		lgfs2_lookupi(ip, "jindex", 6, &child_ip);
+		child_ip = lgfs2_lookupi(ip, "jindex", 6);
 		if (child_ip) {
 			if (fix_md.jiinode || is_journal_copy(ip)) {
 				lgfs2_inode_put(&child_ip);
@@ -1011,7 +1011,7 @@ static void peruse_system_dinode(struct fsck_cx *cx, struct lgfs2_inode *ip)
 
 		/* Check for a statfs_change0 dir entry. Only one system dir
 		   has a statfs_change: per_node, and its .. will be master. */
-		lgfs2_lookupi(ip, "statfs_change0", 14, &child_ip);
+		child_ip = lgfs2_lookupi(ip, "statfs_change0", 14);
 		if (child_ip) {
 			lgfs2_inode_put(&child_ip);
 			if (fix_md.pinode || is_journal_copy(ip))
@@ -1100,7 +1100,7 @@ static void peruse_user_dinode(struct fsck_cx *cx, struct lgfs2_inode *ip)
 		return;
 	}
 	while (ip) {
-		lgfs2_lookupi(ip, "..", 2, &parent_ip);
+		parent_ip = lgfs2_lookupi(ip, "..", 2);
 		if (parent_ip && parent_ip->i_num.in_addr == ip->i_num.in_addr) {
 			log_warn(_("Found the root directory at: 0x%"PRIx64"\n"),
 				 ip->i_num.in_addr);
@@ -1534,7 +1534,7 @@ static int init_rindex(struct fsck_cx *cx)
 	if (sdp->gfs1)
 		sdp->md.riinode = lgfs2_inode_read(sdp, sdp->sd_rindex_di.in_addr);
 	else
-		lgfs2_lookupi(sdp->master_dir, "rindex", 6, &sdp->md.riinode);
+		sdp->md.riinode = lgfs2_lookupi(sdp->master_dir, "rindex", 6);
 
 	if (sdp->md.riinode)
 		return 0;
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 6792f795..0c2e0146 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -1825,8 +1825,8 @@ static int check_pernode_for(struct fsck_cx *cx, int x, struct lgfs2_inode *pern
 	int error, valid_size = 1;
 
 	log_debug(_("Checking system file %s\n"), fn);
-	error = lgfs2_lookupi(pernode, fn, strlen(fn), &ip);
-	if (error) {
+	ip = lgfs2_lookupi(pernode, fn, strlen(fn));
+	if (ip == NULL) {
 		log_err(_("System file %s is missing.\n"), fn);
 		if (!query(cx, _("Rebuild the system file? (y/n) ")))
 			return 0;
@@ -1867,8 +1867,8 @@ build_it:
 		log_err(_("Error building %s\n"), fn);
 		return -1;
 	}
-	error = lgfs2_lookupi(pernode, fn, strlen(fn), &ip);
-	if (error) {
+	ip = lgfs2_lookupi(pernode, fn, strlen(fn));
+	if (ip == NULL) {
 		log_err(_("Error rebuilding %s.\n"), fn);
 		return -1;
 	}
diff --git a/gfs2/glocktop/glocktop.c b/gfs2/glocktop/glocktop.c
index f0053853..d35c841f 100644
--- a/gfs2/glocktop/glocktop.c
+++ b/gfs2/glocktop/glocktop.c
@@ -623,15 +623,15 @@ static const char *show_inode(const char *id, int fd, uint64_t block)
 	if (S_ISDIR(ip->i_mode)) {
 		struct lgfs2_inode *parent;
 		uint64_t dirarray[256];
-		int subdepth = 0, error;
+		int subdepth = 0;
 
 		inode_type = "directory ";
 		dirarray[0] = block;
 		subdepth++;
 		/* Backtrack the directory to its source */
 		while (1) {
-			error = lgfs2_lookupi(ip, "..", 2, &parent);
-			if (error)
+			parent = lgfs2_lookupi(ip, "..", 2);
+			if (parent == NULL)
 				break;
 			/* Stop at the root inode */
 			if (ip->i_num.in_addr == parent->i_num.in_addr) {
diff --git a/gfs2/libgfs2/check_fs_ops.c b/gfs2/libgfs2/check_fs_ops.c
index c93e11a4..abe31312 100644
--- a/gfs2/libgfs2/check_fs_ops.c
+++ b/gfs2/libgfs2/check_fs_ops.c
@@ -91,14 +91,13 @@ START_TEST(test_lookupi_bad_name_size)
 {
 	struct lgfs2_inode idir;
 	struct lgfs2_inode *ret = NULL;
-	int e;
 
-	e = lgfs2_lookupi(&idir, ".", 0, &ret);
-	ck_assert(e == -ENAMETOOLONG);
+	ret = lgfs2_lookupi(&idir, ".", 0);
+	ck_assert(errno == ENAMETOOLONG);
 	ck_assert(ret == NULL);
 
-	e = lgfs2_lookupi(&idir, ".", GFS2_FNAMESIZE + 1, &ret);
-	ck_assert(e == -ENAMETOOLONG);
+	ret = lgfs2_lookupi(&idir, ".", GFS2_FNAMESIZE + 1);
+	ck_assert(errno == ENAMETOOLONG);
 	ck_assert(ret == NULL);
 }
 END_TEST
@@ -107,11 +106,9 @@ START_TEST(test_lookupi_dot)
 {
 	struct lgfs2_inode idir;
 	struct lgfs2_inode *ret;
-	int e;
 
 	/* The contents of idir shouldn't matter, a "." lookup should just return it */
-	e = lgfs2_lookupi(&idir, ".", 1, &ret);
-	ck_assert(e == 0);
+	ret = lgfs2_lookupi(&idir, ".", 1);
 	ck_assert(ret == &idir);
 }
 END_TEST
@@ -133,7 +130,6 @@ START_TEST(test_lookupi_dotdot)
 	};
 	struct gfs2_dirent *dent = (void *)(buf + sizeof(struct gfs2_dinode));
 	struct lgfs2_inode *ret;
-	int e;
 
 	/* "." */
 	dent->de_inum.no_addr = cpu_to_be64(42);
@@ -153,8 +149,8 @@ START_TEST(test_lookupi_dotdot)
 	*(char *)(dent + 1) = '.';
 	*((char *)(dent + 1) + 1) = '.';
 
-	e = lgfs2_lookupi(&idir, "..", 2, &ret);
-	ck_assert(e == 0);
+	ret = lgfs2_lookupi(&idir, "..", 2);
+	ck_assert(ret != NULL);
 	ck_assert(ret != &idir);
 	lgfs2_inode_put(&ret);
 }
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index fb47e4f3..e72871ed 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -1509,7 +1509,7 @@ static struct lgfs2_inode *__createi(struct lgfs2_inode *dip,
 	int err = 0;
 	int is_dir;
 
-	lgfs2_lookupi(dip, filename, strlen(filename), &ip);
+	ip = lgfs2_lookupi(dip, filename, strlen(filename));
 	if (!ip) {
 		struct lgfs2_inum parent = dip->i_num;
 
@@ -1775,7 +1775,7 @@ int lgfs2_dir_search(struct lgfs2_inode *dip, const char *filename, int len,
 {
 	int error;
 
-	if(!S_ISDIR(dip->i_mode) && !lgfs2_is_gfs_dir(dip))
+	if (!S_ISDIR(dip->i_mode) && !lgfs2_is_gfs_dir(dip))
 		return -1;
 
 	if (dip->i_flags & GFS2_DIF_EXHASH)
@@ -1875,33 +1875,35 @@ int lgfs2_dirent_del(struct lgfs2_inode *dip, const char *filename, int len)
 }
 
 /**
- * lgfs2_lookupi - Look up a filename in a directory and return its inode
+ * Look up a filename in a directory and return its inode, which can be the
+ * the directory inode when "." is looked up.
  * @dip: The directory to search
  * @name: The name of the inode to look for
- * @ipp: Used to return the found inode if any
+ * @len: The length of name
  *
- * Returns: 0 on success, -EXXXX on failure
+ * Returns: The inode on success or NULL on failure with errno set.
  */
-int lgfs2_lookupi(struct lgfs2_inode *dip, const char *filename, int len,
-                  struct lgfs2_inode **ipp)
+struct lgfs2_inode *lgfs2_lookupi(struct lgfs2_inode *dip, const char *filename, int len)
 {
 	struct lgfs2_sbd *sdp = dip->i_sbd;
-	int error = 0;
 	struct lgfs2_inum inum;
+	int error = 0;
 
-	*ipp = NULL;
+	errno = EINVAL;
+	if (dip == NULL)
+		return NULL;
 
+	errno = ENAMETOOLONG;
 	if (!len || len > GFS2_FNAMESIZE)
-		return -ENAMETOOLONG;
-	if (gfs2_filecmp(filename, ".", 1)) {
-		*ipp = dip;
-		return 0;
-	}
-	error = lgfs2_dir_search(dip, filename, len, NULL, &inum);
-	if (!error)
-		*ipp = lgfs2_inode_read(sdp, inum.in_addr);
+		return NULL;
 
-	return error;
+	if (gfs2_filecmp(filename, ".", 1))
+		return dip;
+
+	error = lgfs2_dir_search(dip, filename, len, NULL, &inum);
+	if (error)
+		return NULL;
+	return lgfs2_inode_read(sdp, inum.in_addr);
 }
 
 /**
diff --git a/gfs2/libgfs2/gfs2l.c b/gfs2/libgfs2/gfs2l.c
index 3694a3d0..42f1b6c8 100644
--- a/gfs2/libgfs2/gfs2l.c
+++ b/gfs2/libgfs2/gfs2l.c
@@ -139,7 +139,7 @@ static int openfs(const char *path, struct lgfs2_sbd *sdp)
 	}
 
 	sdp->master_dir = lgfs2_inode_read(sdp, sdp->sd_meta_dir.in_addr);
-	lgfs2_lookupi(sdp->master_dir, "rindex", 6, &sdp->md.riinode);
+	sdp->md.riinode = lgfs2_lookupi(sdp->master_dir, "rindex", 6);
 	sdp->fssize = sdp->device.length;
 	if (sdp->md.riinode) {
 		lgfs2_rindex_read(sdp, &count, &ok);
diff --git a/gfs2/libgfs2/lang.c b/gfs2/libgfs2/lang.c
index 96ba0146..1b959671 100644
--- a/gfs2/libgfs2/lang.c
+++ b/gfs2/libgfs2/lang.c
@@ -150,7 +150,6 @@ static void ast_string_unescape(char *str)
 
 static uint64_t ast_lookup_path(char *path, struct lgfs2_sbd *sbd)
 {
-	int err = 0;
 	char *c = NULL;
 	struct lgfs2_inode *ip, *iptmp;
 	char *segment;
@@ -160,16 +159,19 @@ static uint64_t ast_lookup_path(char *path, struct lgfs2_sbd *sbd)
 	ip = lgfs2_inode_read(sbd, sbd->sd_root_dir.in_addr);
 
 	while (ip != NULL) {
+		int err = 0;
+
 		if (segment == NULL) { // No more segments
 			bn = ip->i_num.in_addr;
 			lgfs2_inode_put(&ip);
 			return bn;
 		}
 		ast_string_unescape(segment);
-		err = lgfs2_lookupi(ip, segment, strlen(segment), &iptmp);
+		iptmp = lgfs2_lookupi(ip, segment, strlen(segment));
+		err = errno;
 		lgfs2_inode_put(&ip);
-		if (err != 0) {
-			errno = -err;
+		if (iptmp == NULL) {
+			errno = err;
 			break;
 		}
 		ip = iptmp;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 6f8afe0d..bcbc5e47 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -522,8 +522,7 @@ extern void lgfs2_dirent2_del(struct lgfs2_inode *dip, struct lgfs2_buffer_head
 			struct gfs2_dirent *prev, struct gfs2_dirent *cur);
 extern int lgfs2_dir_search(struct lgfs2_inode *dip, const char *filename, int len,
 		      unsigned int *type, struct lgfs2_inum *inum);
-extern int lgfs2_lookupi(struct lgfs2_inode *dip, const char *filename, int len,
-			struct lgfs2_inode **ipp);
+extern struct lgfs2_inode *lgfs2_lookupi(struct lgfs2_inode *dip, const char *filename, int len);
 extern int lgfs2_dir_add(struct lgfs2_inode *dip, const char *filename, int len,
 		    struct lgfs2_inum *inum, unsigned int type);
 extern int lgfs2_dirent_del(struct lgfs2_inode *dip, const char *filename, int name_len);
diff --git a/tests/nukerg.c b/tests/nukerg.c
index a4c25a81..09b6dfd7 100644
--- a/tests/nukerg.c
+++ b/tests/nukerg.c
@@ -250,7 +250,7 @@ static lgfs2_rgrps_t read_rindex(struct lgfs2_sbd *sdp)
 	unsigned rgcount;
 	unsigned i;
 
-	lgfs2_lookupi(sdp->master_dir, "rindex", 6, &sdp->md.riinode);
+	sdp->md.riinode = lgfs2_lookupi(sdp->master_dir, "rindex", 6);
 	if (sdp->md.riinode == NULL) {
 		perror("Failed to look up rindex");
 		return NULL;
-- 
2.39.0

