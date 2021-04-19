Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 61635364A41
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 21:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618859514;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k9ZTgGhk1UQ1nnt7FZsnwkQQwBPXRj2TfVokRkxUY8g=;
	b=CzxINDd2+yuVZ+do09QkS6dXXr8/izFIclgYtiDM3H/d4pTw8IFk+0U76haVX+5gaXSutD
	UEJZ0UkOJ3Vtuoh+RywmJ3kuKNmYJVayHXItBCpIDyb+c55lDlqBSEQyZImPegp2VRe65K
	h4LnFZbvwM2eb3jqLC2wNVEvvwvTWJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-HL-ottkyN4Oe3fw_Z7ai-Q-1; Mon, 19 Apr 2021 15:11:49 -0400
X-MC-Unique: HL-ottkyN4Oe3fw_Z7ai-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 959301009E30;
	Mon, 19 Apr 2021 19:11:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 718475D9CC;
	Mon, 19 Apr 2021 19:11:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49BD744A58;
	Mon, 19 Apr 2021 19:11:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JJBaTj000974 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 15:11:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6746C7094D; Mon, 19 Apr 2021 19:11:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA98860843
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 19:11:35 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 19 Apr 2021 20:11:14 +0100
Message-Id: <20210419191117.297653-6-anprice@redhat.com>
In-Reply-To: <20210419191117.297653-1-anprice@redhat.com>
References: <20210419191117.297653-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 5/8] Remove GFS2_HAS_RG_SKIP conditionals
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

Our own gfs2_ondisk.h has rg_skip so there's no need for these
conditionals.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 configure.ac          |  2 --
 gfs2/libgfs2/meta.c   |  4 ----
 gfs2/libgfs2/ondisk.c | 12 ------------
 gfs2/libgfs2/rgrp.c   |  2 --
 4 files changed, 20 deletions(-)

diff --git a/configure.ac b/configure.ac
index a512f9dd..31cb3e49 100644
--- a/configure.ac
+++ b/configure.ac
@@ -126,8 +126,6 @@ AC_SUBST([udevdir], [$with_udevdir])
 AC_CHECK_HEADERS([fcntl.h libintl.h limits.h locale.h mntent.h stddef.h sys/file.h sys/ioctl.h sys/mount.h sys/time.h sys/vfs.h syslog.h termios.h])
 AC_CHECK_HEADER([linux/fs.h], [], [AC_MSG_ERROR([Unable to find linux/fs.h])])
 AC_CHECK_HEADER([linux/limits.h], [], [AC_MSG_ERROR([Unable to find linux/limits.h])])
-AC_CHECK_MEMBER([struct gfs2_rgrp.rg_skip],[AC_DEFINE([GFS2_HAS_RG_SKIP],[],[Next resource group pointer])],
-                [], [[#include <linux/gfs2_ondisk.h>]])
 AC_CHECK_MEMBER([struct gfs2_rgrp.rg_data0],[AC_DEFINE([GFS2_HAS_RG_RI_FIELDS],[],[Resource group fields duplicated from the rindex])],
                 [], [[#include <linux/gfs2_ondisk.h>]])
 AC_CHECK_MEMBER([struct gfs2_log_header.lh_crc],[AC_DEFINE([GFS2_HAS_LH_V2],[],[v2 log header format])],
diff --git a/gfs2/libgfs2/meta.c b/gfs2/libgfs2/meta.c
index d642424a..c209c70a 100644
--- a/gfs2/libgfs2/meta.c
+++ b/gfs2/libgfs2/meta.c
@@ -225,11 +225,7 @@ MH(rg_header)
 F(rg_flags)
 F(rg_free, .flags = LGFS2_MFF_FSBLOCKS)
 F(rg_dinodes, .flags = LGFS2_MFF_FSBLOCKS)
-#ifdef GFS2_HAS_RG_SKIP
 FP(rg_skip, .points_to = (1 << LGFS2_MT_GFS2_RGRP))
-#else
-RF(__pad)
-#endif
 F(rg_igeneration)
 #ifdef GFS2_HAS_RG_RI_FIELDS
 FP(rg_data0, .points_to = ANY_GFS2_BLOCK|(1 << LGFS2_MT_FREE))
diff --git a/gfs2/libgfs2/ondisk.c b/gfs2/libgfs2/ondisk.c
index 6e969143..cf81005e 100644
--- a/gfs2/libgfs2/ondisk.c
+++ b/gfs2/libgfs2/ondisk.c
@@ -208,11 +208,7 @@ void gfs2_rgrp_in(struct gfs2_rgrp *rg, char *buf)
 	CPIN_32(rg, str, rg_flags);
 	CPIN_32(rg, str, rg_free);
 	CPIN_32(rg, str, rg_dinodes);
-#ifdef GFS2_HAS_RG_SKIP
 	CPIN_32(rg, str, rg_skip);
-#else
-	CPIN_32(rg, str, __pad);
-#endif
 	CPIN_64(rg, str, rg_igeneration);
 #ifdef GFS2_HAS_RG_RI_FIELDS
 	CPIN_64(rg, str, rg_data0);
@@ -231,11 +227,7 @@ void gfs2_rgrp_out(const struct gfs2_rgrp *rg, char *buf)
 	CPOUT_32(rg, str, rg_flags);
 	CPOUT_32(rg, str, rg_free);
 	CPOUT_32(rg, str, rg_dinodes);
-#ifdef GFS2_HAS_RG_SKIP
 	CPOUT_32(rg, str, rg_skip);
-#else
-	CPOUT_32(rg, str, __pad);
-#endif
 	CPOUT_64(rg, str, rg_igeneration);
 #ifdef GFS2_HAS_RG_RI_FIELDS
 	CPOUT_64(rg, str, rg_data0);
@@ -254,11 +246,7 @@ void gfs2_rgrp_print(const struct gfs2_rgrp *rg)
 	pv(rg, rg_flags, "%u", "0x%x");
 	pv(rg, rg_free, "%u", "0x%x");
 	pv(rg, rg_dinodes, "%u", "0x%x");
-#ifdef GFS2_HAS_RG_SKIP
 	pv(rg, rg_skip, "%u", "0x%x");
-#else
-	pv(rg, __pad, "%u", "0x%x");
-#endif
 	pv(rg, rg_igeneration, "%llu", "0x%llx");
 #ifdef GFS2_HAS_RG_RI_FIELDS
 	pv(rg, rg_data0, "%llu", "0x%llx");
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index 75fd0ba3..f5eb88c9 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -673,9 +673,7 @@ lgfs2_rgrp_t lgfs2_rgrps_append(lgfs2_rgrps_t rgs, struct gfs2_rindex *entry, ui
 	rg->rg.rg_header.mh_type = GFS2_METATYPE_RG;
 	rg->rg.rg_header.mh_format = GFS2_FORMAT_RG;
 	rg->rg.rg_free = rg->ri.ri_data;
-#ifdef GFS2_HAS_RG_SKIP
 	rg->rg.rg_skip = rg_skip;
-#endif
 #ifdef GFS2_HAS_RG_RI_FIELDS
 	rg->rg.rg_data0 = rg->ri.ri_data0;
 	rg->rg.rg_data = rg->ri.ri_data;
-- 
2.30.2

