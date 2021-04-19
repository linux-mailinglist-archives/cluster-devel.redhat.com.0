Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A2593364A40
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 21:11:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618859512;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EV20k5ZBDlS+CgihUkR9uJWO4W82H6Yti/n+73/RGdU=;
	b=e9pX5gTYJd+ehDU35LruWwv23vkPjW/1ayXI5cEPcXS71H70zeQQ02M8h1YN+OujyrWPDO
	SDhwnu3ZPhd5SPMk/wue9WQjKJHPlkCMc5nT0xDg5ZGlZMA6Yl68F0hQKqBHVgChRJxunf
	cSDFROHPKzdp2X3m8+EnpLhHIN76/RA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567--XpcyaTLN0GX8qgXgngjbA-1; Mon, 19 Apr 2021 15:11:49 -0400
X-MC-Unique: -XpcyaTLN0GX8qgXgngjbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E5608905E5;
	Mon, 19 Apr 2021 19:11:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8084B5D9CA;
	Mon, 19 Apr 2021 19:11:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 461BB180B617;
	Mon, 19 Apr 2021 19:11:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JJBYxR000952 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 15:11:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 135627094D; Mon, 19 Apr 2021 19:11:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6254560843
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 19:11:33 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 19 Apr 2021 20:11:12 +0100
Message-Id: <20210419191117.297653-4-anprice@redhat.com>
In-Reply-To: <20210419191117.297653-1-anprice@redhat.com>
References: <20210419191117.297653-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 3/8] Remove GFS2_HAS_LEAF_HINTS conditionals
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

Our own gfs2_ondisk.h has leaf hints so there's no need for these
conditionals.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 configure.ac          |  2 --
 gfs2/edit/extended.c  |  9 ++-------
 gfs2/libgfs2/fs_ops.c |  6 ------
 gfs2/libgfs2/ondisk.c | 10 ----------
 4 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/configure.ac b/configure.ac
index 8c60741d..5cb0770f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -126,8 +126,6 @@ AC_SUBST([udevdir], [$with_udevdir])
 AC_CHECK_HEADERS([fcntl.h libintl.h limits.h locale.h mntent.h stddef.h sys/file.h sys/ioctl.h sys/mount.h sys/time.h sys/vfs.h syslog.h termios.h])
 AC_CHECK_HEADER([linux/fs.h], [], [AC_MSG_ERROR([Unable to find linux/fs.h])])
 AC_CHECK_HEADER([linux/limits.h], [], [AC_MSG_ERROR([Unable to find linux/limits.h])])
-AC_CHECK_MEMBER([struct gfs2_leaf.lf_inode],[AC_DEFINE([GFS2_HAS_LEAF_HINTS],[],[Leaf block hints])],
-                [], [[#include <linux/gfs2_ondisk.h>]])
 AC_CHECK_MEMBER([struct gfs2_dirent.de_rahead],[AC_DEFINE([GFS2_HAS_DE_RAHEAD],[],[Dirent readahead field])],
                 [], [[#include <linux/gfs2_ondisk.h>]])
 AC_CHECK_MEMBER([struct gfs2_dirent.de_cookie],[AC_DEFINE([GFS2_HAS_DE_COOKIE],[],[Dirent cookie field])],
diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index 64e4d31f..b8c61ee1 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -294,14 +294,9 @@ static void print_inode_type(__be16 de_type)
 	}
 }
 
-#ifdef GFS2_HAS_LEAF_HINTS
-#define LEAF_HINT_FMTS "lf_inode: 0x%llx, lf_dist: %u, " \
-                       "lf_nsec: %u, lf_sec: %llu, "
+#define LEAF_HINT_FMTS "lf_inode: 0x%"PRIx64", lf_dist: %"PRIu32", " \
+                       "lf_nsec: %"PRIu32", lf_sec: %"PRIu64", "
 #define LEAF_HINT_FIELDS(lp) lp->lf_inode, lp->lf_dist, lp->lf_nsec, lp->lf_sec,
-#else
-#define LEAF_HINT_FMTS
-#define LEAF_HINT_FIELDS(lp)
-#endif
 
 static int display_leaf(struct iinfo *ind)
 {
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 1c580081..27fb43cb 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -1001,9 +1001,7 @@ void dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_no,
 	oleaf->lf_depth = cpu_to_be16(oleaf->lf_depth);
 	nleaf->lf_depth = oleaf->lf_depth;
 
-#ifdef GFS2_HAS_LEAF_HINTS
 	nleaf->lf_inode = cpu_to_be64(dip->i_di.di_num.no_addr);
-#endif
 	dip->i_di.di_blocks++;
 	bmodified(dip->i_bh);
 
@@ -1203,9 +1201,7 @@ restart:
 				nleaf = (struct gfs2_leaf *)nbh->b_data;
 				nleaf->lf_depth = leaf->lf_depth;
 				nleaf->lf_dirent_format = cpu_to_be32(GFS2_FORMAT_DE);
-#ifdef GFS2_HAS_LEAF_HINTS
 				nleaf->lf_inode = cpu_to_be64(dip->i_di.di_num.no_addr);
-#endif
 				err = dirent_alloc(dip, nbh, len, &dent);
 				if (err)
 					return err;
@@ -1257,9 +1253,7 @@ static void dir_make_exhash(struct gfs2_inode *dip)
 	leaf = (struct gfs2_leaf *)bh->b_data;
 	leaf->lf_dirent_format = cpu_to_be32(GFS2_FORMAT_DE);
 	leaf->lf_entries = cpu_to_be16(dip->i_di.di_entries);
-#ifdef GFS2_HAS_LEAF_HINTS
 	leaf->lf_inode = cpu_to_be64(dip->i_di.di_num.no_addr);
-#endif
 	buffer_copy_tail(sdp, bh, sizeof(struct gfs2_leaf),
 			 dip->i_bh, sizeof(struct gfs2_dinode));
 
diff --git a/gfs2/libgfs2/ondisk.c b/gfs2/libgfs2/ondisk.c
index 2185fd38..dffd2221 100644
--- a/gfs2/libgfs2/ondisk.c
+++ b/gfs2/libgfs2/ondisk.c
@@ -448,15 +448,11 @@ void gfs2_leaf_in(struct gfs2_leaf *lf, char *buf)
 	CPIN_16(lf, str, lf_entries);
 	CPIN_32(lf, str, lf_dirent_format);
 	CPIN_64(lf, str, lf_next);
-#ifdef GFS2_HAS_LEAF_HINTS
 	CPIN_64(lf, str, lf_inode);
 	CPIN_32(lf, str, lf_dist);
 	CPIN_32(lf, str, lf_nsec);
 	CPIN_64(lf, str, lf_sec);
 	CPIN_08(lf, str, lf_reserved2, 40);
-#else
-	CPIN_08(lf, str, lf_reserved, 32);
-#endif
 }
 
 void gfs2_leaf_out(struct gfs2_leaf *lf, char *buf)
@@ -468,15 +464,11 @@ void gfs2_leaf_out(struct gfs2_leaf *lf, char *buf)
 	CPOUT_16(lf, str, lf_entries);
 	CPOUT_32(lf, str, lf_dirent_format);
 	CPOUT_64(lf, str, lf_next);
-#ifdef GFS2_HAS_LEAF_HINTS
 	CPOUT_64(lf, str, lf_inode);
 	CPOUT_32(lf, str, lf_dist);
 	CPOUT_32(lf, str, lf_nsec);
 	CPOUT_64(lf, str, lf_sec);
 	CPOUT_08(lf, str, lf_reserved2, 40);
-#else
-	CPOUT_08(lf, str, lf_reserved, 64);
-#endif
 }
 
 void gfs2_leaf_print(const struct gfs2_leaf *lf)
@@ -486,12 +478,10 @@ void gfs2_leaf_print(const struct gfs2_leaf *lf)
 	pv(lf, lf_entries, "%u", "0x%x");
 	pv(lf, lf_dirent_format, "%u", "0x%x");
 	pv(lf, lf_next, "%llu", "0x%llx");
-#ifdef GFS2_HAS_LEAF_HINTS
 	pv(lf, lf_inode, "%llu", "0x%llx");
 	pv(lf, lf_dist, "%u", "0x%x");
 	pv(lf, lf_nsec, "%u", "0x%x");
 	pv(lf, lf_sec, "%llu", "0x%llx");
-#endif
 }
 
 void gfs2_ea_header_in(struct gfs2_ea_header *ea, char *buf)
-- 
2.30.2

