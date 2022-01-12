Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E1D48CBEA
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015654;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dvefgTaW2sMQPuv2OdimK3hVpwhEw6/HRZS6QqEgWr8=;
	b=ACc9T8iFlIxmGV6CyeM738CXWUvP/Nd0owyCDHBUq0znFLFOIch4fkFMjie+wRGiAoZfws
	Dr1QSyJapWw0ztm6g82hD99wIN3K5VboPG2PEWCv+tnQ1p2dC5XwZT2Sy2tWnrccST2nuO
	rRjiOpQAFfxQIupOKt5pJ/6nQyyLB1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-jTgsDBR4PCaVT1Cbvp0ayg-1; Wed, 12 Jan 2022 14:27:31 -0500
X-MC-Unique: jTgsDBR4PCaVT1Cbvp0ayg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20AEA190B2A9;
	Wed, 12 Jan 2022 19:27:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F80F4BC4D;
	Wed, 12 Jan 2022 19:27:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEDB14A7CD;
	Wed, 12 Jan 2022 19:27:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJRRZH009380 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A8F082B88B; Wed, 12 Jan 2022 19:27:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACBC02B178
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:26 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:45 +0000
Message-Id: <20220112192650.1426415-14-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 13/18] libgfs2: Remove debugging printf from
	do_init_statfs()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Allow the caller to provide a pointer to a statfs change structure so
that it can do its own debug message printing. This is only used by
mkfs.gfs2.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c | 2 +-
 gfs2/fsck/initialize.c      | 2 +-
 gfs2/fsck/main.c            | 2 +-
 gfs2/libgfs2/libgfs2.h      | 2 +-
 gfs2/libgfs2/structures.c   | 8 +++-----
 gfs2/mkfs/main_mkfs.c       | 8 ++++++--
 6 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 8667d8fb..5bfc616b 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -2357,7 +2357,7 @@ int main(int argc, char **argv)
 			         strerror(error));
 			exit(-1);
 		}
-		do_init_statfs(&sb2);
+		do_init_statfs(&sb2, NULL);
 
 		/* Create the resource group index file */
 		ip = build_rindex(&sb2);
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index a2bc44c0..fab9a1e7 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -867,7 +867,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 				   "a valid statfs file; aborting.\n"));
 			goto fail;
 		}
-		do_init_statfs(sdp);
+		do_init_statfs(sdp, NULL);
 	}
 	if (sdp->md.statfs->i_size) {
 		buf = malloc(sdp->md.statfs->i_size);
diff --git a/gfs2/fsck/main.c b/gfs2/fsck/main.c
index 35b13950..cb667815 100644
--- a/gfs2/fsck/main.c
+++ b/gfs2/fsck/main.c
@@ -228,7 +228,7 @@ static int check_statfs(struct gfs2_sbd *sdp)
 		return 0;
 	}
 
-	do_init_statfs(sdp);
+	do_init_statfs(sdp, NULL);
 	log_err( _("The statfs file was fixed.\n"));
 	errors_corrected++;
 	return 0;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 3396ddb0..fa710a6c 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -783,7 +783,7 @@ extern struct gfs2_inode *build_rindex(struct gfs2_sbd *sdp);
 extern struct gfs2_inode *build_quota(struct gfs2_sbd *sdp);
 extern int build_root(struct gfs2_sbd *sdp);
 extern int do_init_inum(struct gfs2_sbd *sdp);
-extern int do_init_statfs(struct gfs2_sbd *sdp);
+extern int do_init_statfs(struct gfs2_sbd *sdp, struct gfs2_statfs_change *res);
 extern int gfs2_check_meta(const char *buf, int type);
 extern unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx,
 			      uint64_t *buf, uint8_t state);
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 7ac38f92..d4a08c43 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -471,7 +471,7 @@ int do_init_inum(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-int do_init_statfs(struct gfs2_sbd *sdp)
+int do_init_statfs(struct gfs2_sbd *sdp, struct gfs2_statfs_change *res)
 {
 	struct gfs2_inode *ip = sdp->md.statfs;
 	struct gfs2_statfs_change sc;
@@ -485,10 +485,8 @@ int do_init_statfs(struct gfs2_sbd *sdp)
 	if (count != sizeof(sc))
 		return -1;
 
-	if (cfg_debug) {
-		printf("\nStatfs:\n");
-		lgfs2_statfs_change_print(&sc);
-	}
+	if (res)
+		*res = sc;
 	return 0;
 }
 
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 9a73ff7b..36341d99 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -1196,6 +1196,7 @@ static int open_dev(struct mkfs_dev *dev, int withprobe)
 #ifndef UNITTESTS
 int main(int argc, char *argv[])
 {
+	struct gfs2_statfs_change sc;
 	struct gfs2_sbd sbd;
 	struct mkfs_opts opts;
 	struct gfs2_inode *ip;
@@ -1355,8 +1356,11 @@ int main(int argc, char *argv[])
 	sbd.sd_locktable[GFS2_LOCKNAME_LEN - 1] = '\0';
 
 	do_init_inum(&sbd);
-	do_init_statfs(&sbd);
-
+	do_init_statfs(&sbd, &sc);
+	if (opts.debug) {
+		printf("\nStatfs:\n");
+		lgfs2_statfs_change_print(&sc);
+	}
 	inode_put(&sbd.md.rooti);
 	inode_put(&sbd.master_dir);
 	inode_put(&sbd.md.inum);
-- 
2.34.1

