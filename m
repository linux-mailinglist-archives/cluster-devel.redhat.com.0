Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CDC02364A45
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 21:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618859516;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nVz+p95CUdjl//Y4aV1Jd0lQX2WVEQLQeyzFcQ88kDU=;
	b=akStmY0aUZDYpgbF4cbdxvtkhFtAd+4bL4LbhboIjryB9XUOLCcUJlu+Bg6AUhXlWns9rh
	ZnpCJlU6qKiDPrbKqQ4MNdPD5rPwUaPlx2/NlVDzb3eToy5liOO4TDw99cS1+3U5qZGl4Y
	872U0YmQe/YhRWJwgGIz2xCD2UY0pig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-Y_GVA977MFun4leLZo2S6A-1; Mon, 19 Apr 2021 15:11:55 -0400
X-MC-Unique: Y_GVA977MFun4leLZo2S6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8CFB1084427;
	Mon, 19 Apr 2021 19:11:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA42863622;
	Mon, 19 Apr 2021 19:11:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B76B944A58;
	Mon, 19 Apr 2021 19:11:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JJBbFJ000980 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 15:11:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 624DB60843; Mon, 19 Apr 2021 19:11:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA2BB7095A
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 19:11:36 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 19 Apr 2021 20:11:15 +0100
Message-Id: <20210419191117.297653-7-anprice@redhat.com>
In-Reply-To: <20210419191117.297653-1-anprice@redhat.com>
References: <20210419191117.297653-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 6/8] Remove GFS2_HAS_RG_RI_FIELDS
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Our own gfs2_ondisk.h has the new rgrp fields so there's no need for
these conditionals.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 configure.ac          | 2 --
 gfs2/libgfs2/meta.c   | 2 --
 gfs2/libgfs2/ondisk.c | 8 --------
 gfs2/libgfs2/rgrp.c   | 6 ------
 4 files changed, 18 deletions(-)

diff --git a/configure.ac b/configure.ac
index 31cb3e49..e356199c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -126,8 +126,6 @@ AC_SUBST([udevdir], [$with_udevdir])
 AC_CHECK_HEADERS([fcntl.h libintl.h limits.h locale.h mntent.h stddef.h sys/file.h sys/ioctl.h sys/mount.h sys/time.h sys/vfs.h syslog.h termios.h])
 AC_CHECK_HEADER([linux/fs.h], [], [AC_MSG_ERROR([Unable to find linux/fs.h])])
 AC_CHECK_HEADER([linux/limits.h], [], [AC_MSG_ERROR([Unable to find linux/limits.h])])
-AC_CHECK_MEMBER([struct gfs2_rgrp.rg_data0],[AC_DEFINE([GFS2_HAS_RG_RI_FIELDS],[],[Resource group fields duplicated from the rindex])],
-                [], [[#include <linux/gfs2_ondisk.h>]])
 AC_CHECK_MEMBER([struct gfs2_log_header.lh_crc],[AC_DEFINE([GFS2_HAS_LH_V2],[],[v2 log header format])],
                 [], [[#include <linux/gfs2_ondisk.h>]])
 
diff --git a/gfs2/libgfs2/meta.c b/gfs2/libgfs2/meta.c
index c209c70a..771b1f13 100644
--- a/gfs2/libgfs2/meta.c
+++ b/gfs2/libgfs2/meta.c
@@ -227,12 +227,10 @@ F(rg_free, .flags = LGFS2_MFF_FSBLOCKS)
 F(rg_dinodes, .flags = LGFS2_MFF_FSBLOCKS)
 FP(rg_skip, .points_to = (1 << LGFS2_MT_GFS2_RGRP))
 F(rg_igeneration)
-#ifdef GFS2_HAS_RG_RI_FIELDS
 FP(rg_data0, .points_to = ANY_GFS2_BLOCK|(1 << LGFS2_MT_FREE))
 F(rg_data, .flags = LGFS2_MFF_FSBLOCKS)
 F(rg_bitbytes, .flags = LGFS2_MFF_BYTES)
 F(rg_crc, .flags = LGFS2_MFF_CHECK)
-#endif
 RF(rg_reserved)
 };
 
diff --git a/gfs2/libgfs2/ondisk.c b/gfs2/libgfs2/ondisk.c
index cf81005e..157f3358 100644
--- a/gfs2/libgfs2/ondisk.c
+++ b/gfs2/libgfs2/ondisk.c
@@ -210,12 +210,10 @@ void gfs2_rgrp_in(struct gfs2_rgrp *rg, char *buf)
 	CPIN_32(rg, str, rg_dinodes);
 	CPIN_32(rg, str, rg_skip);
 	CPIN_64(rg, str, rg_igeneration);
-#ifdef GFS2_HAS_RG_RI_FIELDS
 	CPIN_64(rg, str, rg_data0);
 	CPIN_32(rg, str, rg_data);
 	CPIN_32(rg, str, rg_bitbytes);
 	CPIN_32(rg, str, rg_crc);
-#endif
 	CPIN_08(rg, str, rg_reserved, sizeof(rg->rg_reserved));
 }
 
@@ -229,15 +227,11 @@ void gfs2_rgrp_out(const struct gfs2_rgrp *rg, char *buf)
 	CPOUT_32(rg, str, rg_dinodes);
 	CPOUT_32(rg, str, rg_skip);
 	CPOUT_64(rg, str, rg_igeneration);
-#ifdef GFS2_HAS_RG_RI_FIELDS
 	CPOUT_64(rg, str, rg_data0);
 	CPOUT_32(rg, str, rg_data);
 	CPOUT_32(rg, str, rg_bitbytes);
 	CPOUT_08(rg, str, rg_reserved, sizeof(rg->rg_reserved));
 	lgfs2_rgrp_crc_set(buf);
-#else
-	CPOUT_08(rg, str, rg_reserved, sizeof(rg->rg_reserved));
-#endif
 }
 
 void gfs2_rgrp_print(const struct gfs2_rgrp *rg)
@@ -248,12 +242,10 @@ void gfs2_rgrp_print(const struct gfs2_rgrp *rg)
 	pv(rg, rg_dinodes, "%u", "0x%x");
 	pv(rg, rg_skip, "%u", "0x%x");
 	pv(rg, rg_igeneration, "%llu", "0x%llx");
-#ifdef GFS2_HAS_RG_RI_FIELDS
 	pv(rg, rg_data0, "%llu", "0x%llx");
 	pv(rg, rg_data, "%u", "0x%x");
 	pv(rg, rg_bitbytes, "%u", "0x%x");
 	pv(rg, rg_crc, "%u", "0x%x");
-#endif
 }
 
 void gfs2_quota_in(struct gfs2_quota *qu, char *buf)
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index f5eb88c9..aa5eadf2 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -156,7 +156,6 @@ void lgfs2_rgrp_bitbuf_free(lgfs2_rgrp_t rg)
 int lgfs2_rgrp_crc_check(char *buf)
 {
 	int ret = 0;
-#ifdef GFS2_HAS_RG_RI_FIELDS
 	struct gfs2_rgrp *rg = (struct gfs2_rgrp *)buf;
 	uint32_t crc = rg->rg_crc;
 
@@ -167,7 +166,6 @@ int lgfs2_rgrp_crc_check(char *buf)
 	if (be32_to_cpu(crc) != gfs2_disk_hash(buf, sizeof(struct gfs2_rgrp)))
 		ret = 1;
 	rg->rg_crc = crc;
-#endif
 	return ret;
 }
 
@@ -176,14 +174,12 @@ int lgfs2_rgrp_crc_check(char *buf)
  */
 void lgfs2_rgrp_crc_set(char *buf)
 {
-#ifdef GFS2_HAS_RG_RI_FIELDS
 	struct gfs2_rgrp *rg = (struct gfs2_rgrp *)buf;
 	uint32_t crc;
 
 	rg->rg_crc = 0;
 	crc = gfs2_disk_hash(buf, sizeof(struct gfs2_rgrp));
 	rg->rg_crc = cpu_to_be32(crc);
-#endif
 }
 
 /**
@@ -674,12 +670,10 @@ lgfs2_rgrp_t lgfs2_rgrps_append(lgfs2_rgrps_t rgs, struct gfs2_rindex *entry, ui
 	rg->rg.rg_header.mh_format = GFS2_FORMAT_RG;
 	rg->rg.rg_free = rg->ri.ri_data;
 	rg->rg.rg_skip = rg_skip;
-#ifdef GFS2_HAS_RG_RI_FIELDS
 	rg->rg.rg_data0 = rg->ri.ri_data0;
 	rg->rg.rg_data = rg->ri.ri_data;
 	rg->rg.rg_bitbytes = rg->ri.ri_bitbytes;
 	rg->rg.rg_crc = 0;
-#endif
 	compute_bitmaps(rg, rgs->sdp->bsize);
 	rg->rgrps = rgs;
 	return rg;
-- 
2.30.2

