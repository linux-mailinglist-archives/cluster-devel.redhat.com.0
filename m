Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 80D62310E55
	for <lists+cluster-devel@lfdr.de>; Fri,  5 Feb 2021 18:10:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612545036;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8CrmGXAPWCLnV6Z2uvDnjdNaqMyMbg9AKpbqYwABu5U=;
	b=Crw1GYWXj0NZR1MYFno89XaY83ThsE+3o9XsJhBTzxKksAMU8DJaOBldmViLuGfl7RRkbC
	wbGPMfqHt3Ik1cN8hMYcwUjqGxtYN4Suz5mKcoiscEhEyb2DdnMpBRDu02yxuH8Kfu+CQa
	twhznMddhUgRwGE9KJoAkpjoKGh2rMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-Pb2nrgDtPzqD2X1ogIWm1g-1; Fri, 05 Feb 2021 12:10:34 -0500
X-MC-Unique: Pb2nrgDtPzqD2X1ogIWm1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9409B107ACC7;
	Fri,  5 Feb 2021 17:10:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E656C6F452;
	Fri,  5 Feb 2021 17:10:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D9BC57DFA;
	Fri,  5 Feb 2021 17:10:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 115HAQfq000641 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Feb 2021 12:10:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16F0C5C261; Fri,  5 Feb 2021 17:10:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6391A5C1B4
	for <cluster-devel@redhat.com>; Fri,  5 Feb 2021 17:10:25 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Fri,  5 Feb 2021 17:10:17 +0000
Message-Id: <20210205171018.1677127-2-anprice@redhat.com>
In-Reply-To: <20210205171018.1677127-1-anprice@redhat.com>
References: <20210205171018.1677127-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/2] gfs2: Enable rgrplvb for sb_fs_format
	1802
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Turn on rgrplvb by default for sb_fs_format > 1801.

Mount options still have to override this so a new args field to
differentiate between 'off' and 'not specified' is added, and the new
default is applied only when it's not specified.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 fs/gfs2/incore.h     |  1 +
 fs/gfs2/ops_fstype.c | 13 ++++++++++---
 fs/gfs2/super.h      |  4 ++++
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 8e1ab8ed4abc..ac4d5e619ecf 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -585,6 +585,7 @@ struct gfs2_args {
 	unsigned int ar_errors:2;               /* errors=withdraw | panic */
 	unsigned int ar_nobarrier:1;            /* do not send barriers */
 	unsigned int ar_rgrplvb:1;		/* use lvbs for rgrp info */
+	unsigned int ar_got_rgrplvb:1;		/* Was the rgrplvb opt given? */
 	unsigned int ar_loccookie:1;		/* use location based readdir
 						   cookies */
 	s32 ar_commit;				/* Commit interval */
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 61fce59cb4d3..52fe78378faa 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -171,7 +171,8 @@ static int gfs2_check_sb(struct gfs2_sbd *sdp, int silent)
 		return -EINVAL;
 	}
 
-	if (sb->sb_fs_format != GFS2_FORMAT_FS ||
+	if (sb->sb_fs_format < GFS2_FS_FORMAT_MIN ||
+	    sb->sb_fs_format > GFS2_FS_FORMAT_MAX ||
 	    sb->sb_multihost_format != GFS2_FORMAT_MULTI) {
 		fs_warn(sdp, "Unknown on-disk format, unable to mount\n");
 		return -EINVAL;
@@ -1032,13 +1033,14 @@ static int gfs2_lm_mount(struct gfs2_sbd *sdp, int silent)
 	}
 
 	if (lm->lm_mount == NULL) {
-		fs_info(sdp, "Now mounting FS...\n");
+		fs_info(sdp, "Now mounting FS (format %u)...\n", sdp->sd_sb.sb_fs_format);
 		complete_all(&sdp->sd_locking_init);
 		return 0;
 	}
 	ret = lm->lm_mount(sdp, table);
 	if (ret == 0)
-		fs_info(sdp, "Joined cluster. Now mounting FS...\n");
+		fs_info(sdp, "Joined cluster. Now mounting FS (format %u)...\n",
+		        sdp->sd_sb.sb_fs_format);
 	complete_all(&sdp->sd_locking_init);
 	return ret;
 }
@@ -1156,6 +1158,10 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (error)
 		goto fail_locking;
 
+	/* Turn rgrplvb on by default if fs format is recent enough */
+	if (!sdp->sd_args.ar_got_rgrplvb && sdp->sd_sb.sb_fs_format > 1801)
+		sdp->sd_args.ar_rgrplvb = 1;
+
 	error = wait_on_journal(sdp);
 	if (error)
 		goto fail_sb;
@@ -1456,6 +1462,7 @@ static int gfs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_rgrplvb:
 		args->ar_rgrplvb = result.boolean;
+		args->ar_got_rgrplvb = 1;
 		break;
 	case Opt_loccookie:
 		args->ar_loccookie = result.boolean;
diff --git a/fs/gfs2/super.h b/fs/gfs2/super.h
index c9fb2a654181..977079693bdc 100644
--- a/fs/gfs2/super.h
+++ b/fs/gfs2/super.h
@@ -11,6 +11,10 @@
 #include <linux/dcache.h>
 #include "incore.h"
 
+/* Supported fs format version range */
+#define GFS2_FS_FORMAT_MIN (1801)
+#define GFS2_FS_FORMAT_MAX (1802)
+
 extern void gfs2_lm_unmount(struct gfs2_sbd *sdp);
 
 static inline unsigned int gfs2_jindex_size(struct gfs2_sbd *sdp)
-- 
2.29.2

