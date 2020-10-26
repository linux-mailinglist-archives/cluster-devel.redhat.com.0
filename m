Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 17E47299D70
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Oct 2020 01:07:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-CAlCCcZkM1-2CtBxa11L-A-1; Mon, 26 Oct 2020 20:07:31 -0400
X-MC-Unique: CAlCCcZkM1-2CtBxa11L-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 814051800D41;
	Tue, 27 Oct 2020 00:07:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F83E60FC2;
	Tue, 27 Oct 2020 00:07:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5930B92F35;
	Tue, 27 Oct 2020 00:07:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09QNsaNV021103 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Oct 2020 19:54:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 165FC85CBE; Mon, 26 Oct 2020 23:54:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FFB485CA6
	for <cluster-devel@redhat.com>; Mon, 26 Oct 2020 23:54:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE6AA858280
	for <cluster-devel@redhat.com>; Mon, 26 Oct 2020 23:54:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-285-zYVjQ6HzNx-zBHxWRUs2oA-1;
	Mon, 26 Oct 2020 19:54:29 -0400
X-MC-Unique: zYVjQ6HzNx-zBHxWRUs2oA-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6E3C520770;
	Mon, 26 Oct 2020 23:54:27 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 26 Oct 2020 19:51:47 -0400
Message-Id: <20201026235205.1023962-115-sashal@kernel.org>
In-Reply-To: <20201026235205.1023962-1-sashal@kernel.org>
References: <20201026235205.1023962-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09QNsaNV021103
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>,
	syzbot+43fa87986bdd31df9de6@syzkaller.appspotmail.com,
	cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.8 115/132] gfs2: Fix NULL pointer
	dereference in gfs2_rgrp_dump
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Andrew Price <anprice@redhat.com>

[ Upstream commit 0e539ca1bbbe85a86549c97a30a765ada4a09df9 ]

When an rindex entry is found to be corrupt, compute_bitstructs() calls
gfs2_consist_rgrpd() which calls gfs2_rgrp_dump() like this:

    gfs2_rgrp_dump(NULL, rgd->rd_gl, fs_id_buf);

gfs2_rgrp_dump then dereferences the gl without checking it and we get

    BUG: KASAN: null-ptr-deref in gfs2_rgrp_dump+0x28/0x280

because there's no rgrp glock involved while reading the rindex on mount.

Fix this by changing gfs2_rgrp_dump to take an rgrp argument.

Reported-by: syzbot+43fa87986bdd31df9de6@syzkaller.appspotmail.com
Signed-off-by: Andrew Price <anprice@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/glops.c | 11 ++++++++++-
 fs/gfs2/rgrp.c  |  9 +++------
 fs/gfs2/rgrp.h  |  2 +-
 fs/gfs2/util.c  |  2 +-
 4 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index de1d5f1d9ff85..c2c90747d79b5 100644
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
index 074f228ea8390..1bba5a9d45fa3 100644
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
index a1d7e14fc55b9..9a587ada51eda 100644
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
index 1cd0328cae20a..0fba3bf641890 100644
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
2.25.1


