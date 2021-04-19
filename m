Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B4369364A43
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 21:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618859515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YzufUbIfh7Ij1PBzWH4PbmRK/Qyv4N92vW+Fz/M6FRs=;
	b=cwLOiRUUeDX3E4nUWFzL3mPzhVjgVivy9kl1Ja35yUakG+PQWPajTwwDhFMxBJvyqFm+yd
	Xdy6WNphbPWOmxNsK8DnQa4gVWQn1ndZyOssObqaidmyJgh7Vc1mydB1CJCEAqHUeAmvvn
	gqFDeo9GAXVh9h6qjgzoXvezkzKRioY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-Z23To1i-PA6iCWm5OOerQA-1; Mon, 19 Apr 2021 15:11:54 -0400
X-MC-Unique: Z23To1i-PA6iCWm5OOerQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C592A1935780;
	Mon, 19 Apr 2021 19:11:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B624E5D9CA;
	Mon, 19 Apr 2021 19:11:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4D571806D17;
	Mon, 19 Apr 2021 19:11:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JJBZ56000963 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 15:11:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 27B6A7094D; Mon, 19 Apr 2021 19:11:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7421160843
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 19:11:34 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 19 Apr 2021 20:11:13 +0100
Message-Id: <20210419191117.297653-5-anprice@redhat.com>
In-Reply-To: <20210419191117.297653-1-anprice@redhat.com>
References: <20210419191117.297653-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 4/8] Remove GFS2_HAS_DE_RAHEAD/COOKIE
	conditionals
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

Our own gfs2_ondisk.h has de_rahead and de_cookie so there's no need for
these conditionals.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 configure.ac          |  4 ----
 gfs2/edit/extended.c  |  8 ++------
 gfs2/libgfs2/meta.c   |  8 --------
 gfs2/libgfs2/ondisk.c | 16 ----------------
 4 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/configure.ac b/configure.ac
index 5cb0770f..a512f9dd 100644
--- a/configure.ac
+++ b/configure.ac
@@ -126,10 +126,6 @@ AC_SUBST([udevdir], [$with_udevdir])
 AC_CHECK_HEADERS([fcntl.h libintl.h limits.h locale.h mntent.h stddef.h sys/file.h sys/ioctl.h sys/mount.h sys/time.h sys/vfs.h syslog.h termios.h])
 AC_CHECK_HEADER([linux/fs.h], [], [AC_MSG_ERROR([Unable to find linux/fs.h])])
 AC_CHECK_HEADER([linux/limits.h], [], [AC_MSG_ERROR([Unable to find linux/limits.h])])
-AC_CHECK_MEMBER([struct gfs2_dirent.de_rahead],[AC_DEFINE([GFS2_HAS_DE_RAHEAD],[],[Dirent readahead field])],
-                [], [[#include <linux/gfs2_ondisk.h>]])
-AC_CHECK_MEMBER([struct gfs2_dirent.de_cookie],[AC_DEFINE([GFS2_HAS_DE_COOKIE],[],[Dirent cookie field])],
-                [], [[#include <linux/gfs2_ondisk.h>]])
 AC_CHECK_MEMBER([struct gfs2_rgrp.rg_skip],[AC_DEFINE([GFS2_HAS_RG_SKIP],[],[Next resource group pointer])],
                 [], [[#include <linux/gfs2_ondisk.h>]])
 AC_CHECK_MEMBER([struct gfs2_rgrp.rg_data0],[AC_DEFINE([GFS2_HAS_RG_RI_FIELDS],[],[Resource group fields duplicated from the rindex])],
diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index b8c61ee1..91609bd2 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -335,18 +335,14 @@ static int display_leaf(struct iinfo *ind)
 					strcpy(edit_fmt, "%llx");
 				}
 			}
-			print_gfs2("%d/%d [%08x] %lld/%"PRId64" (0x%llx/0x%"PRIx64") +%u: ",
+			print_gfs2("%d/%d [%08x] %lld/%"PRId64" (0x%llx/0x%"PRIx64") +%"PRIu16": ",
 				   total_dirents, d + 1,
 				   ind->ii[0].dirent[d].dirent.de_hash,
 				   ind->ii[0].dirent[d].dirent.de_inum.no_formal_ino,
 				   ind->ii[0].dirent[d].block,
 				   ind->ii[0].dirent[d].dirent.de_inum.no_formal_ino,
 				   ind->ii[0].dirent[d].block,
-#ifdef GFS2_HAS_DE_RAHEAD
-				   (unsigned int)ind->ii[0].dirent[d].dirent.de_rahead
-#else
-				   0
-#endif
+				   ind->ii[0].dirent[d].dirent.de_rahead
 			);
 		}
 		print_inode_type(ind->ii[0].dirent[d].dirent.de_type);
diff --git a/gfs2/libgfs2/meta.c b/gfs2/libgfs2/meta.c
index 2be87045..d642424a 100644
--- a/gfs2/libgfs2/meta.c
+++ b/gfs2/libgfs2/meta.c
@@ -481,17 +481,9 @@ F(de_hash, .flags = LGFS2_MFF_CHECK)
 F(de_rec_len, .flags = LGFS2_MFF_BYTES)
 F(de_name_len, .flags = LGFS2_MFF_BYTES)
 F(de_type)
-#ifdef GFS2_HAS_DE_RAHEAD
 F(de_rahead)
-#ifdef GFS2_HAS_DE_COOKIE
 F(de_cookie)
 RF(pad3)
-#else
-RF(pad2)
-#endif /* GFS2_HAS_DE_COOKIE */
-#else
-RF(__pad)
-#endif /* GFS2_HAS_DE_RAHEAD */
 };
 
 #undef STRUCT
diff --git a/gfs2/libgfs2/ondisk.c b/gfs2/libgfs2/ondisk.c
index dffd2221..6e969143 100644
--- a/gfs2/libgfs2/ondisk.c
+++ b/gfs2/libgfs2/ondisk.c
@@ -404,17 +404,9 @@ void gfs2_dirent_in(struct gfs2_dirent *de, char *buf)
 	CPIN_16(de, str, de_rec_len);
 	CPIN_16(de, str, de_name_len);
 	CPIN_16(de, str, de_type);
-#ifdef GFS2_HAS_DE_RAHEAD
 	CPIN_16(de, str, de_rahead);
-#ifdef GFS2_HAS_DE_COOKIE
 	CPIN_32(de, str, de_cookie);
 	CPIN_08(de, str, pad3, 8);
-#else
-	CPIN_08(de, str, pad2, 12);
-#endif /* GFS2_HAS_DE_COOKIE */
-#else
-	CPIN_08(de, str, __pad, 14);
-#endif /* GFS2_HAS_DE_RAHEAD */
 }
 
 void gfs2_dirent_out(struct gfs2_dirent *de, char *buf)
@@ -426,17 +418,9 @@ void gfs2_dirent_out(struct gfs2_dirent *de, char *buf)
 	CPOUT_16(de, str, de_rec_len);
 	CPOUT_16(de, str, de_name_len);
 	CPOUT_16(de, str, de_type);
-#ifdef GFS2_HAS_DE_RAHEAD
 	CPOUT_16(de, str, de_rahead);
-#ifdef GFS2_HAS_DE_COOKIE
 	CPOUT_32(de, str, de_cookie);
 	CPOUT_08(de, str, pad3, 8);
-#else
-	CPOUT_08(de, str, pad2, 12);
-#endif /* GFS2_HAS_DE_COOKIE */
-#else
-	CPOUT_08(de, str, __pad, 14);
-#endif /* GFS2_HAS_DE_RAHEAD */
 }
 
 void gfs2_leaf_in(struct gfs2_leaf *lf, char *buf)
-- 
2.30.2

