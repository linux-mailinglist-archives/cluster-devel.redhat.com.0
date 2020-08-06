Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C271D23DAD7
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721113;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uV7u9i4x87UIJUm3Uf1suhUI8f+xgMHFeeXal8ji2/0=;
	b=GU/yZQsUzReU/lAG0x66JBjrACDqxfDgfbk9wrPLErU8GoAIf3D2XZLno1CWZXQsI2nlxq
	NTyYqNgt5UbPa0ehG0uHn68d4uMxu5wndMfosovjPit+3QwEQ20qHE2V0VLKtjCuXZ48YY
	CcVF+Pig7qsMArmgFomAavuqpK5+iZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-ES9NgoK7Pb6uxYrBUDPjsw-1; Thu, 06 Aug 2020 09:38:32 -0400
X-MC-Unique: ES9NgoK7Pb6uxYrBUDPjsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82441801A03;
	Thu,  6 Aug 2020 13:38:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70D28712F4;
	Thu,  6 Aug 2020 13:38:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D5341809554;
	Thu,  6 Aug 2020 13:38:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcRlq030758 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A496A60C47; Thu,  6 Aug 2020 13:38:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 274A260BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:26 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:47 +0100
Message-Id: <20200806133807.111280-13-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 12/32] gfs2_edit: Don't use gfs2_buffer_head
	in do_dinode_extended() args
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/gfs2hex.c  | 15 +++++++--------
 gfs2/edit/gfs2hex.h  |  3 +--
 gfs2/edit/hexedit.c  |  4 ++--
 gfs2/edit/journal.c  |  2 +-
 gfs2/edit/savemeta.c |  4 ++--
 5 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/gfs2/edit/gfs2hex.c b/gfs2/edit/gfs2hex.c
index 62d5cab5..ea9b6d3a 100644
--- a/gfs2/edit/gfs2hex.c
+++ b/gfs2/edit/gfs2hex.c
@@ -236,7 +236,7 @@ static int indirect_dirent(struct indirect_info *indir, char *ptr, int d)
 	return de.de_rec_len;
 }
 
-void do_dinode_extended(struct gfs2_dinode *dine, struct gfs2_buffer_head *lbh)
+void do_dinode_extended(struct gfs2_dinode *dine, char *buf)
 {
 	unsigned int x, y, ptroff = 0;
 	uint64_t p, last;
@@ -249,7 +249,7 @@ void do_dinode_extended(struct gfs2_dinode *dine, struct gfs2_buffer_head *lbh)
 		/* Indirect pointers */
 		for (x = sizeof(struct gfs2_dinode); x < sbd.bsize;
 			 x += sizeof(uint64_t)) {
-			p = be64_to_cpu(*(uint64_t *)(lbh->b_data + x));
+			p = be64_to_cpu(*(uint64_t *)(buf + x));
 			if (p) {
 				indirect->ii[indirect_blocks].block = p;
 				indirect->ii[indirect_blocks].mp.mp_list[0] =
@@ -270,7 +270,7 @@ void do_dinode_extended(struct gfs2_dinode *dine, struct gfs2_buffer_head *lbh)
 		indirect->ii[0].block = block;
 		indirect->ii[0].is_dir = TRUE;
 		for (x = sizeof(struct gfs2_dinode); x < sbd.bsize; x += skip) {
-			skip = indirect_dirent(indirect->ii, lbh->b_data + x,
+			skip = indirect_dirent(indirect->ii, buf + x,
 					       indirect->ii[0].dirents);
 			if (skip <= 0)
 				break;
@@ -280,14 +280,13 @@ void do_dinode_extended(struct gfs2_dinode *dine, struct gfs2_buffer_head *lbh)
 			 (dine->di_flags & GFS2_DIF_EXHASH) &&
 			 dine->di_height == 0) {
 		/* Leaf Pointers: */
-		
-		last = be64_to_cpu(*(uint64_t *)(lbh->b_data +
-						 sizeof(struct gfs2_dinode)));
-    
+
+		last = be64_to_cpu(*(uint64_t *)(buf + sizeof(struct gfs2_dinode)));
+
 		for (x = sizeof(struct gfs2_dinode), y = 0;
 			 y < (1 << dine->di_depth);
 			 x += sizeof(uint64_t), y++) {
-			p = be64_to_cpu(*(uint64_t *)(lbh->b_data + x));
+			p = be64_to_cpu(*(uint64_t *)(buf + x));
 
 			if (p != last || ((y + 1) * sizeof(uint64_t) == dine->di_size)) {
 				struct gfs2_buffer_head *tmp_bh;
diff --git a/gfs2/edit/gfs2hex.h b/gfs2/edit/gfs2hex.h
index c3efb27e..6c6ddde3 100644
--- a/gfs2/edit/gfs2hex.h
+++ b/gfs2/edit/gfs2hex.h
@@ -5,8 +5,7 @@
 
 extern int display_gfs2(struct gfs2_buffer_head *dbh);
 extern int edit_gfs2(void);
-extern void do_dinode_extended(struct gfs2_dinode *di,
-			       struct gfs2_buffer_head *lbh);
+extern void do_dinode_extended(struct gfs2_dinode *di, char *buf);
 extern void print_gfs2(const char *fmt, ...) __attribute__((format (printf, 1, 2)));
 extern uint64_t do_leaf_extended(char *dlebuf, struct iinfo *indir);
 extern void eol(int col);
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index bc4bcc6c..8a8e0225 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -1057,7 +1057,7 @@ static int read_master_dir(void)
 	if (bh == NULL)
 		return 1;
 	gfs2_dinode_in(&di, bh->b_data);
-	do_dinode_extended(&di, bh); /* get extended data, if any */
+	do_dinode_extended(&di, bh->b_data); /* get extended data, if any */
 	memcpy(&masterdir, &indirect[0], sizeof(struct indirect_info));
 	return 0;
 }
@@ -1128,7 +1128,7 @@ int display(int identify_only, int trunc_zeros, uint64_t flagref,
 	}
 	else if (gfs2_struct_type == GFS2_METATYPE_DI) {
 		gfs2_dinode_in(&di, bh->b_data);
-		do_dinode_extended(&di, bh); /* get extended data, if any */
+		do_dinode_extended(&di, bh->b_data); /* get extended data, if any */
 	}
 	else if (gfs2_struct_type == GFS2_METATYPE_IN) { /* indirect block list */
 		if (blockhist) {
diff --git a/gfs2/edit/journal.c b/gfs2/edit/journal.c
index 06a5f618..aa945920 100644
--- a/gfs2/edit/journal.c
+++ b/gfs2/edit/journal.c
@@ -57,7 +57,7 @@ uint64_t find_journal_block(const char *journal, uint64_t *j_size)
 	gfs2_dinode_in(&di, jindex_bh->b_data);
 
 	if (!sbd.gfs1)
-		do_dinode_extended(&di, jindex_bh); /* parse dir. */
+		do_dinode_extended(&di, jindex_bh->b_data); /* parse dir. */
 
 	if (sbd.gfs1) {
 		struct gfs2_inode *jiinode;
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index cbecf281..c42f2da0 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -274,7 +274,7 @@ static int init_per_node_lookup(void)
 		return 1;
 	}
 
-	do_dinode_extended(&per_node_di->i_di, per_node_di->i_bh);
+	do_dinode_extended(&per_node_di->i_di, per_node_di->i_bh->b_data);
 	inode_put(&per_node_di);
 
 	for (i = 0; i < indirect_blocks; i++) {
@@ -993,7 +993,7 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 	lbh = bread(&sbd, jindex_block);
 	gfs2_dinode_in(&di, lbh->b_data);
 	if (!sbd.gfs1)
-		do_dinode_extended(&di, lbh);
+		do_dinode_extended(&di, lbh->b_data);
 	brelse(lbh);
 
 	printf("Filesystem size: %.2fGB\n", (sbd.fssize * sbd.bsize) / ((float)(1 << 30)));
-- 
2.26.2

