Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B76873FD01
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jun 2023 15:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687873224;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F331Ulx2clTsF3yxcTOQkA/OzQCfSp7uWGYpcxEFvtM=;
	b=h9Jkbl0fDt9o/Y19AEGAda01D53lGTRGCxWNGVM9Quk62V2KhCR/rYiXzgn/dIqFTkkbce
	OHRexN/lBkcg95DmuioEsoKfwl+Hy+Uf31JNly7d0w9Y4Su36ZOiuKRyKa6vQ9o32COtZi
	pPMisVYUh2nLCNpuJSiPcDGWjEvUKBY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-LEqKth_8N5uaZTrvDs9H2g-1; Tue, 27 Jun 2023 09:40:18 -0400
X-MC-Unique: LEqKth_8N5uaZTrvDs9H2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDBD138008BF;
	Tue, 27 Jun 2023 13:40:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2D99F5CC7;
	Tue, 27 Jun 2023 13:40:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 736551946589;
	Tue, 27 Jun 2023 13:40:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0314F1946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 27 Jun 2023 13:40:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E084140C2070; Tue, 27 Jun 2023 13:40:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.226.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FFFB40C2063;
 Tue, 27 Jun 2023 13:40:09 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 27 Jun 2023 15:40:08 +0200
Message-Id: <20230627134008.2625442-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH] gfs: Get rid of unnucessary locking in
 inode_go_dump
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Commit 27a2660f1ef9 ("gfs2: Dump nrpages for inodes and their glocks")
added some locking around reading inode->i_data.nrpages.  That locking
doesn't do anything really, so get rid of it.

With that, the glock argument to ->go_dump() can be made const again as
well.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glops.c  | 17 ++++++-----------
 fs/gfs2/incore.h |  2 +-
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 7c48c7afd6a4..54319328b16b 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -236,7 +236,7 @@ static void rgrp_go_inval(struct gfs2_glock *gl, int flags)
 	truncate_inode_pages_range(mapping, start, end);
 }
 
-static void gfs2_rgrp_go_dump(struct seq_file *seq, struct gfs2_glock *gl,
+static void gfs2_rgrp_go_dump(struct seq_file *seq, const struct gfs2_glock *gl,
 			      const char *fs_id_buf)
 {
 	struct gfs2_rgrpd *rgd = gl->gl_object;
@@ -536,28 +536,23 @@ static int inode_go_held(struct gfs2_holder *gh)
  *
  */
 
-static void inode_go_dump(struct seq_file *seq, struct gfs2_glock *gl,
+static void inode_go_dump(struct seq_file *seq, const struct gfs2_glock *gl,
 			  const char *fs_id_buf)
 {
 	struct gfs2_inode *ip = gl->gl_object;
-	struct inode *inode;
-	unsigned long nrpages;
+	const struct inode *inode = &ip->i_inode;
 
 	if (ip == NULL)
 		return;
 
-	inode = &ip->i_inode;
-	xa_lock_irq(&inode->i_data.i_pages);
-	nrpages = inode->i_data.nrpages;
-	xa_unlock_irq(&inode->i_data.i_pages);
-
 	gfs2_print_dbg(seq, "%s I: n:%llu/%llu t:%u f:0x%02lx d:0x%08x s:%llu "
 		       "p:%lu\n", fs_id_buf,
 		  (unsigned long long)ip->i_no_formal_ino,
 		  (unsigned long long)ip->i_no_addr,
-		  IF2DT(ip->i_inode.i_mode), ip->i_flags,
+		  IF2DT(inode->i_mode), ip->i_flags,
 		  (unsigned int)ip->i_diskflags,
-		  (unsigned long long)i_size_read(inode), nrpages);
+		  (unsigned long long)i_size_read(inode),
+		  inode->i_data.nrpages);
 }
 
 /**
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 8b1b50d19de1..04f2d78e8658 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -221,7 +221,7 @@ struct gfs2_glock_operations {
 	int (*go_demote_ok) (const struct gfs2_glock *gl);
 	int (*go_instantiate) (struct gfs2_glock *gl);
 	int (*go_held)(struct gfs2_holder *gh);
-	void (*go_dump)(struct seq_file *seq, struct gfs2_glock *gl,
+	void (*go_dump)(struct seq_file *seq, const struct gfs2_glock *gl,
 			const char *fs_id_buf);
 	void (*go_callback)(struct gfs2_glock *gl, bool remote);
 	void (*go_free)(struct gfs2_glock *gl);
-- 
2.40.0

