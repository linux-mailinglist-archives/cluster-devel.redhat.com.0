Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0224528E231
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 16:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602685828;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cBqMzeS1V/yAHxJvEIGMi68D3Bq/9VMIW7yoDMdIv9A=;
	b=QmHVkBultbUxLzNkGKdmL68MB6fQ9Dqeu93jE09lO7Ypyvul6LZ9yxSsxxbynnFBMxz4Jj
	avUwocKiIyNXHrXOPNAkDaiu0J5yW68KEbj90FeHKSebFVXQfoPW3SCDg3qiVbtuNLIaT2
	B8Xt48MT2wErsBouFCxV2DA4O3ywp/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-eNk2jWbYOVChZ1YCLupWew-1; Wed, 14 Oct 2020 10:30:26 -0400
X-MC-Unique: eNk2jWbYOVChZ1YCLupWew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46D79802B72;
	Wed, 14 Oct 2020 14:30:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F2235C1BD;
	Wed, 14 Oct 2020 14:30:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA49B181A06C;
	Wed, 14 Oct 2020 14:30:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EEUCuA009993 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 10:30:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 736B35DA33; Wed, 14 Oct 2020 14:30:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 752D95D9CD;
	Wed, 14 Oct 2020 14:30:08 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Andrew Price <anprice@redhat.com>
Date: Wed, 14 Oct 2020 16:30:06 +0200
Message-Id: <20201014143006.1045233-1-agruenba@redhat.com>
In-Reply-To: <20201007113058.2128527-1-anprice@redhat.com>
References: 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Null-check gl in gfs2_rgrp_dump()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi Andy,

> When an rindex entry is found to be corrupt, compute_bitstructs() calls
> gfs2_consist_rgrpd() which calls gfs2_rgrp_dump() like this:
> 
>     gfs2_rgrp_dump(NULL, rgd->rd_gl, fs_id_buf);
> 
> gfs2_rgrp_dump then dereferences the gl without checking it and we get
> 
>     BUG: KASAN: null-ptr-deref in gfs2_rgrp_dump+0x28/0x280
> 
> because there's no rgrp glock involved while reading the rindex on mount.
> 
> Add a NULL check for gl in gfs2_rgrp_dump() to allow the withdraw to
> continue cleanly.

thanks for looking into this.  Shouldn't gfs2_rgrp_dump just take an
rgrp argument as below though?

Thanks,
Andreas

---
 fs/gfs2/glops.c | 11 ++++++++++-
 fs/gfs2/rgrp.c  |  9 +++------
 fs/gfs2/rgrp.h  |  2 +-
 fs/gfs2/util.c  |  2 +-
 4 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index de1d5f1d9ff8..c2c90747d79b 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -227,6 +227,15 @@ static void rgrp_go_inval(struct gfs2_glock *gl, int flags)
 		rgd->rd_flags &= ~GFS2_RDF_UPTODATE;
 }
 
+static void gfs2_rgrp_go_dump(struct seq_file *seq, struct gfs2_glock *gl,
+			      const char *fs_id_buf)
+{
+	struct gfs2_rgrpd *rgd = gfs2_glock2rgrp(gl);
+
+	if (rgd)
+		gfs2_rgrp_dump(seq, rgd, fs_id_buf);
+}
+
 static struct gfs2_inode *gfs2_glock2inode(struct gfs2_glock *gl)
 {
 	struct gfs2_inode *ip;
@@ -712,7 +721,7 @@ const struct gfs2_glock_operations gfs2_rgrp_glops = {
 	.go_sync = rgrp_go_sync,
 	.go_inval = rgrp_go_inval,
 	.go_lock = gfs2_rgrp_go_lock,
-	.go_dump = gfs2_rgrp_dump,
+	.go_dump = gfs2_rgrp_go_dump,
 	.go_type = LM_TYPE_RGRP,
 	.go_flags = GLOF_LVB,
 };
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 074f228ea839..1bba5a9d45fa 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2209,20 +2209,17 @@ static void rgblk_free(struct gfs2_sbd *sdp, struct gfs2_rgrpd *rgd,
 /**
  * gfs2_rgrp_dump - print out an rgrp
  * @seq: The iterator
- * @gl: The glock in question
+ * @rgd: The rgrp in question
  * @fs_id_buf: pointer to file system id (if requested)
  *
  */
 
-void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_glock *gl,
+void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_rgrpd *rgd,
 		    const char *fs_id_buf)
 {
-	struct gfs2_rgrpd *rgd = gl->gl_object;
 	struct gfs2_blkreserv *trs;
 	const struct rb_node *n;
 
-	if (rgd == NULL)
-		return;
 	gfs2_print_dbg(seq, "%s R: n:%llu f:%02x b:%u/%u i:%u r:%u e:%u\n",
 		       fs_id_buf,
 		       (unsigned long long)rgd->rd_addr, rgd->rd_flags,
@@ -2253,7 +2250,7 @@ static void gfs2_rgrp_error(struct gfs2_rgrpd *rgd)
 		(unsigned long long)rgd->rd_addr);
 	fs_warn(sdp, "umount on all nodes and run fsck.gfs2 to fix the error\n");
 	sprintf(fs_id_buf, "fsid=%s: ", sdp->sd_fsname);
-	gfs2_rgrp_dump(NULL, rgd->rd_gl, fs_id_buf);
+	gfs2_rgrp_dump(NULL, rgd, fs_id_buf);
 	rgd->rd_flags |= GFS2_RDF_ERROR;
 }
 
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index a1d7e14fc55b..9a587ada51ed 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -67,7 +67,7 @@ extern void gfs2_rlist_add(struct gfs2_inode *ip, struct gfs2_rgrp_list *rlist,
 extern void gfs2_rlist_alloc(struct gfs2_rgrp_list *rlist);
 extern void gfs2_rlist_free(struct gfs2_rgrp_list *rlist);
 extern u64 gfs2_ri_total(struct gfs2_sbd *sdp);
-extern void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_glock *gl,
+extern void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_rgrpd *rgd,
 			   const char *fs_id_buf);
 extern int gfs2_rgrp_send_discards(struct gfs2_sbd *sdp, u64 offset,
 				   struct buffer_head *bh,
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 1cd0328cae20..0fba3bf64189 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -419,7 +419,7 @@ void gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd,
 	char fs_id_buf[sizeof(sdp->sd_fsname) + 7];
 
 	sprintf(fs_id_buf, "fsid=%s: ", sdp->sd_fsname);
-	gfs2_rgrp_dump(NULL, rgd->rd_gl, fs_id_buf);
+	gfs2_rgrp_dump(NULL, rgd, fs_id_buf);
 	gfs2_lm(sdp,
 		"fatal: filesystem consistency error\n"
 		"  RG = %llu\n"
-- 
2.26.2

