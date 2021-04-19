Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 97795364A44
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 21:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618859516;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kwSpwQUCMehDXQ6edyxJ+95N67wvtktCjp/0uov3jMQ=;
	b=J7gQxMupY3Nh0AaPUXrTruZEKwMqwuZDQb49C6e4hyW522cBr02Y2Cv3b2Z2bSoPoWmEmO
	LflG5H3CXZ7T4y2epMqStddOocp+3SjgpDxXQ2ncD72CNNV3afpXf5NpFQRALy0kMlxeLf
	WMK8M0L3IVE+1kYrmD/F7CUM4sL2gRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-FQNSTaOdP3GfEMm0iMzD_Q-1; Mon, 19 Apr 2021 15:11:54 -0400
X-MC-Unique: FQNSTaOdP3GfEMm0iMzD_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38CC96D4FB;
	Mon, 19 Apr 2021 19:11:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29D695D9CA;
	Mon, 19 Apr 2021 19:11:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19AFD44A58;
	Mon, 19 Apr 2021 19:11:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JJBcCf000994 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 15:11:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B8167094D; Mon, 19 Apr 2021 19:11:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE7160843
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 19:11:37 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 19 Apr 2021 20:11:16 +0100
Message-Id: <20210419191117.297653-8-anprice@redhat.com>
In-Reply-To: <20210419191117.297653-1-anprice@redhat.com>
References: <20210419191117.297653-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 7/8] Remove GFS2_HAS_LH_V2 conditionals
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Our own gfs2_ondisk.h has v2 log headers so there's no need for these
conditionals. There aren't any users of gfs2_log_header_v1_*() functions
so fold those into gfs2_log_header*().

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 configure.ac              |  2 --
 gfs2/libgfs2/libgfs2.h    |  3 ---
 gfs2/libgfs2/meta.c       |  4 ----
 gfs2/libgfs2/ondisk.c     | 35 +++--------------------------------
 gfs2/libgfs2/recovery.c   |  2 --
 gfs2/libgfs2/structures.c | 16 ++--------------
 gfs2/mkfs/main_jadd.c     |  9 +--------
 7 files changed, 6 insertions(+), 65 deletions(-)

diff --git a/configure.ac b/configure.ac
index e356199c..bb85d65c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -126,8 +126,6 @@ AC_SUBST([udevdir], [$with_udevdir])
 AC_CHECK_HEADERS([fcntl.h libintl.h limits.h locale.h mntent.h stddef.h sys/file.h sys/ioctl.h sys/mount.h sys/time.h sys/vfs.h syslog.h termios.h])
 AC_CHECK_HEADER([linux/fs.h], [], [AC_MSG_ERROR([Unable to find linux/fs.h])])
 AC_CHECK_HEADER([linux/limits.h], [], [AC_MSG_ERROR([Unable to find linux/limits.h])])
-AC_CHECK_MEMBER([struct gfs2_log_header.lh_crc],[AC_DEFINE([GFS2_HAS_LH_V2],[],[v2 log header format])],
-                [], [[#include <linux/gfs2_ondisk.h>]])
 
 # *FLAGS handling
 ENV_CFLAGS="$CFLAGS"
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 6346b74a..b59b72b7 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -715,9 +715,7 @@ extern void gfs2_dirent_out(struct gfs2_dirent *de, char *buf);
 extern void gfs2_leaf_in(struct gfs2_leaf *lf, char *buf);
 extern void gfs2_leaf_out(struct gfs2_leaf *lf, char *buf);
 extern void gfs2_ea_header_in(struct gfs2_ea_header *ea, char *buf);
-extern void gfs2_log_header_v1_in(struct gfs2_log_header *lh, char *buf);
 extern void gfs2_log_header_in(struct gfs2_log_header *lh, char *buf);
-extern void gfs2_log_header_v1_out(struct gfs2_log_header *lh, char *buf);
 extern void gfs2_log_header_out(struct gfs2_log_header *lh, char *buf);
 extern void gfs2_log_descriptor_in(struct gfs2_log_descriptor *ld, char *buf);
 extern void gfs2_log_descriptor_out(struct gfs2_log_descriptor *ld, char *buf);
@@ -737,7 +735,6 @@ extern void gfs2_quota_print(const struct gfs2_quota *qu);
 extern void gfs2_dinode_print(const struct gfs2_dinode *di);
 extern void gfs2_leaf_print(const struct gfs2_leaf *lf);
 extern void gfs2_ea_header_print(const struct gfs2_ea_header *ea, char *name);
-extern void gfs2_log_header_v1_print(const struct gfs2_log_header *lh);
 extern void gfs2_log_header_print(const struct gfs2_log_header *lh);
 extern void gfs2_log_descriptor_print(const struct gfs2_log_descriptor *ld);
 extern void gfs2_statfs_change_print(const struct gfs2_statfs_change *sc);
diff --git a/gfs2/libgfs2/meta.c b/gfs2/libgfs2/meta.c
index 771b1f13..db5f37b1 100644
--- a/gfs2/libgfs2/meta.c
+++ b/gfs2/libgfs2/meta.c
@@ -69,7 +69,6 @@ const unsigned lgfs2_di_flag_size = ARRAY_SIZE(lgfs2_di_flags);
 
 const struct lgfs2_symbolic lgfs2_lh_flags[] = {
 PREFIX_SYM(GFS2_LOG_HEAD_, UNMOUNT)
-#ifdef GFS2_HAS_LH_V2
 PREFIX_SYM(GFS2_LOG_HEAD_FLUSH_, NORMAL)
 PREFIX_SYM(GFS2_LOG_HEAD_FLUSH_, SYNC)
 PREFIX_SYM(GFS2_LOG_HEAD_FLUSH_, SHUTDOWN)
@@ -97,7 +96,6 @@ PREFIX_SYM(GFS2_LFC_, EVICT_INODE)
 PREFIX_SYM(GFS2_LFC_, TRANS_END)
 PREFIX_SYM(GFS2_LFC_, LOGD_JFLUSH_REQD)
 PREFIX_SYM(GFS2_LFC_, LOGD_AIL_FLUSH_REQD)
-#endif
 };
 
 const unsigned int lgfs2_lh_flag_size = ARRAY_SIZE(lgfs2_lh_flags);
@@ -381,7 +379,6 @@ F(lh_flags, .flags = LGFS2_MFF_MASK, .symtab = lgfs2_lh_flags, .nsyms = ARRAY_SI
 F(lh_tail)
 F(lh_blkno)
 F(lh_hash, .flags = LGFS2_MFF_CHECK)
-#ifdef GFS2_HAS_LH_V2
 F(lh_crc, .flags = LGFS2_MFF_CHECK)
 F(lh_nsec, .flags = LGFS2_MFF_NSECS)
 F(lh_sec, .flags = LGFS2_MFF_SECS)
@@ -392,7 +389,6 @@ FP(lh_quota_addr, .points_to = (1 << LGFS2_MT_GFS2_DINODE))
 F(lh_local_total, .flags = LGFS2_MFF_FSBLOCKS)
 F(lh_local_free, .flags = LGFS2_MFF_FSBLOCKS)
 F(lh_local_dinodes, .flags = LGFS2_MFF_FSBLOCKS)
-#endif
 };
 
 #undef STRUCT
diff --git a/gfs2/libgfs2/ondisk.c b/gfs2/libgfs2/ondisk.c
index 157f3358..0d68de8f 100644
--- a/gfs2/libgfs2/ondisk.c
+++ b/gfs2/libgfs2/ondisk.c
@@ -476,7 +476,7 @@ void gfs2_ea_header_print(const struct gfs2_ea_header *ea, char *name)
 	print_it("  name", "%s", NULL, buf);
 }
 
-void gfs2_log_header_v1_in(struct gfs2_log_header *lh, char *buf)
+void gfs2_log_header_in(struct gfs2_log_header *lh, char *buf)
 {
 	struct gfs2_log_header *str = (struct gfs2_log_header *)buf;
 
@@ -486,15 +486,6 @@ void gfs2_log_header_v1_in(struct gfs2_log_header *lh, char *buf)
 	CPIN_32(lh, str, lh_tail);
 	CPIN_32(lh, str, lh_blkno);
 	CPIN_32(lh, str, lh_hash);
-}
-
-void gfs2_log_header_in(struct gfs2_log_header *lh, char *buf)
-{
-	gfs2_log_header_v1_in(lh, buf);
-#ifdef GFS2_HAS_LH_V2
-	{
-	struct gfs2_log_header *str = (struct gfs2_log_header *)buf;
-
 	CPIN_32(lh, str, lh_crc);
 	CPIN_32(lh, str, lh_nsec);
 	CPIN_64(lh, str, lh_sec);
@@ -505,11 +496,9 @@ void gfs2_log_header_in(struct gfs2_log_header *lh, char *buf)
 	CPIN_64(lh, str, lh_local_total);
 	CPIN_64(lh, str, lh_local_free);
 	CPIN_64(lh, str, lh_local_dinodes);
-	}
-#endif
 }
 
-void gfs2_log_header_v1_out(struct gfs2_log_header *lh, char *buf)
+void gfs2_log_header_out(struct gfs2_log_header *lh, char *buf)
 {
 	struct gfs2_log_header *str = (struct gfs2_log_header *)buf;
 
@@ -519,15 +508,6 @@ void gfs2_log_header_v1_out(struct gfs2_log_header *lh, char *buf)
 	CPOUT_32(lh, str, lh_tail);
 	CPOUT_32(lh, str, lh_blkno);
 	CPOUT_32(lh, str, lh_hash);
-}
-
-void gfs2_log_header_out(struct gfs2_log_header *lh, char *buf)
-{
-	gfs2_log_header_v1_out(lh, buf);
-#ifdef GFS2_HAS_LH_V2
-	{
-	struct gfs2_log_header *str = (struct gfs2_log_header *)buf;
-
 	CPOUT_32(lh, str, lh_crc);
 	CPOUT_32(lh, str, lh_nsec);
 	CPOUT_64(lh, str, lh_sec);
@@ -538,11 +518,9 @@ void gfs2_log_header_out(struct gfs2_log_header *lh, char *buf)
 	CPOUT_64(lh, str, lh_local_total);
 	CPOUT_64(lh, str, lh_local_free);
 	CPOUT_64(lh, str, lh_local_dinodes);
-	}
-#endif
 }
 
-void gfs2_log_header_v1_print(const struct gfs2_log_header *lh)
+void gfs2_log_header_print(const struct gfs2_log_header *lh)
 {
 	gfs2_meta_header_print(&lh->lh_header);
 	pv(lh, lh_sequence, "%llu", "0x%llx");
@@ -550,12 +528,6 @@ void gfs2_log_header_v1_print(const struct gfs2_log_header *lh)
 	pv(lh, lh_tail, "%u", "0x%x");
 	pv(lh, lh_blkno, "%u", "0x%x");
 	pv(lh, lh_hash, "0x%.8X", NULL);
-}
-
-void gfs2_log_header_print(const struct gfs2_log_header *lh)
-{
-	gfs2_log_header_v1_print(lh);
-#ifdef GFS2_HAS_LH_V2
 	pv(lh, lh_crc, "0x%.8X", NULL);
 	pv(lh, lh_nsec, "%u", "0x%x");
 	pv(lh, lh_sec, "%llu", "0x%llx");
@@ -566,7 +538,6 @@ void gfs2_log_header_print(const struct gfs2_log_header *lh)
 	pv(lh, lh_local_total, "%lld", "0x%llx");
 	pv(lh, lh_local_free, "%lld", "0x%llx");
 	pv(lh, lh_local_dinodes, "%lld", "0x%llx");
-#endif
 }
 
 void gfs2_log_descriptor_in(struct gfs2_log_descriptor *ld, char *buf)
diff --git a/gfs2/libgfs2/recovery.c b/gfs2/libgfs2/recovery.c
index b711cdfa..78136ac2 100644
--- a/gfs2/libgfs2/recovery.c
+++ b/gfs2/libgfs2/recovery.c
@@ -72,9 +72,7 @@ int get_log_header(struct gfs2_inode *ip, unsigned int blk,
 	crc = lgfs2_log_header_crc(bh->b_data, ip->i_sbd->bsize);
 	gfs2_log_header_in(&lh, bh->b_data);
 	brelse(bh);
-#ifdef GFS2_HAS_LH_V2
 	lh_crc = lh.lh_crc;
-#endif
 	if (error || lh.lh_blkno != blk || lh.lh_hash != hash)
 		return 1;
 	/* Don't check the crc if it's zero, as it is in pre-v2 log headers */
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 789b9a63..d5d12ef1 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -107,15 +107,11 @@ uint32_t lgfs2_log_header_hash(char *buf)
 
 uint32_t lgfs2_log_header_crc(char *buf, unsigned bsize)
 {
-#ifdef GFS2_HAS_LH_V2
 	/* lh_crc CRCs the rest of the block starting after lh_crc */
 	const off_t v1_end = offsetof(struct gfs2_log_header, lh_hash) + 4;
 	const unsigned char *lb = (const unsigned char *)buf;
 
 	return crc32c(~0, lb + v1_end + 4, bsize - v1_end - 4);
-#else
-	return 0;
-#endif
 }
 
 /**
@@ -135,7 +131,6 @@ int lgfs2_write_journal_data(struct gfs2_inode *ip)
 		.lh_tail = 0,
 		.lh_blkno = 0,
 		.lh_hash = 0,
-#ifdef GFS2_HAS_LH_V2
 		.lh_flags = GFS2_LOG_HEAD_UNMOUNT | GFS2_LOG_HEAD_USERSPACE,
 		.lh_crc = 0,
 		.lh_nsec = 0,
@@ -146,9 +141,6 @@ int lgfs2_write_journal_data(struct gfs2_inode *ip)
 		.lh_local_total = 0,
 		.lh_local_free = 0,
 		.lh_local_dinodes = 0,
-#else
-		.lh_flags = GFS2_LOG_HEAD_UNMOUNT,
-#endif
 	};
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	unsigned blocks = (ip->i_di.di_size + sdp->bsize - 1) / sdp->bsize;
@@ -170,10 +162,9 @@ int lgfs2_write_journal_data(struct gfs2_inode *ip)
 		gfs2_log_header_out(&lh, buf);
 
 		buflh->lh_hash = cpu_to_be32(lgfs2_log_header_hash(buf));
-#ifdef GFS2_HAS_LH_V2
 		buflh->lh_addr = cpu_to_be64(jblk);
 		buflh->lh_crc = cpu_to_be32(lgfs2_log_header_crc(buf, sdp->bsize));
-#endif
+
 		if (pwrite(sdp->device_fd, buf, sdp->bsize, jblk * sdp->bsize) != sdp->bsize) {
 			free(buf);
 			return -1;
@@ -230,10 +221,9 @@ int write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blocks)
 	lh.lh_header.mh_type = GFS2_METATYPE_LH;
 	lh.lh_header.mh_format = GFS2_FORMAT_LH;
 	lh.lh_flags = GFS2_LOG_HEAD_UNMOUNT;
-#ifdef GFS2_HAS_LH_V2
 	lh.lh_flags |= GFS2_LOG_HEAD_USERSPACE;
 	lh.lh_jinode = jnl->i_di.di_num.no_addr;
-#endif
+
 	for (x = 0; x < blocks; x++) {
 		struct gfs2_buffer_head *bh = get_file_buf(jnl, x, 1);
 		if (!bh)
@@ -253,11 +243,9 @@ int write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blocks)
 		gfs2_log_header_out(&lh, bh->b_data);
 		hash = lgfs2_log_header_hash(bh->b_data);
 		((struct gfs2_log_header *)bh->b_data)->lh_hash = cpu_to_be32(hash);
-#ifdef GFS2_HAS_LH_V2
 		((struct gfs2_log_header *)bh->b_data)->lh_addr = cpu_to_be64(bh->b_blocknr);
 		hash = lgfs2_log_header_crc(bh->b_data, bsize);
 		((struct gfs2_log_header *)bh->b_data)->lh_crc = cpu_to_be32(hash);
-#endif
 		bmodified(bh);
 		brelse(bh);
 
diff --git a/gfs2/mkfs/main_jadd.c b/gfs2/mkfs/main_jadd.c
index 33bd5127..bad7db25 100644
--- a/gfs2/mkfs/main_jadd.c
+++ b/gfs2/mkfs/main_jadd.c
@@ -456,7 +456,6 @@ out:
 	return ret;
 }
 
-#ifdef GFS2_HAS_LH_V2
 static uint64_t find_block_address(int fd, off_t offset, unsigned bsize)
 {
 	struct {
@@ -477,7 +476,6 @@ static uint64_t find_block_address(int fd, off_t offset, unsigned bsize)
 	}
 	return fme.fe.fe_physical / bsize;
 }
-#endif
 
 static int alloc_new_journal(int fd, unsigned bytes)
 {
@@ -551,21 +549,17 @@ static int add_j(struct gfs2_sbd *sdp, struct jadd_opts *opts)
 	lh.lh_header.mh_type = GFS2_METATYPE_LH;
 	lh.lh_header.mh_format = GFS2_FORMAT_LH;
 	lh.lh_flags = GFS2_LOG_HEAD_UNMOUNT;
-#ifdef GFS2_HAS_LH_V2
 	lh.lh_flags |= GFS2_LOG_HEAD_USERSPACE;
 	lh.lh_jinode = addr;
-#endif
+
 	for (x=0; x<blocks; x++) {
 		uint32_t hash;
-#ifdef GFS2_HAS_LH_V2
 		uint64_t blk_addr = 0;
-#endif
 		lh.lh_sequence = seq;
 		lh.lh_blkno = x;
 		gfs2_log_header_out(&lh, buf);
 		hash = lgfs2_log_header_hash(buf);
 		((struct gfs2_log_header *)buf)->lh_hash = cpu_to_be32(hash);
-#ifdef GFS2_HAS_LH_V2
 		if (!(blk_addr = find_block_address(fd, off, sdp->bsize))) {
 			error = -1;
 			goto close_fd;
@@ -573,7 +567,6 @@ static int add_j(struct gfs2_sbd *sdp, struct jadd_opts *opts)
 		((struct gfs2_log_header *)buf)->lh_addr = cpu_to_be64(blk_addr);
 		hash = lgfs2_log_header_crc(buf, sdp->bsize);
 		((struct gfs2_log_header *)buf)->lh_crc = cpu_to_be32(hash);
-#endif
 		if (write(fd, buf, sdp->bsize) != sdp->bsize) {
 			perror("add_j write");
 			error = -1;
-- 
2.30.2

