Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AFB2723DADD
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721122;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PZEQJIDpPoz9h+gryLS0KinqmPlxOlEXcRingc+qzuY=;
	b=HrX6+iXoyKrNAYl3yd9az3Xsnbq8qQYg+iAzwjEsBu9AVUbcZqO7BYYBRtZksW3nhbpBrq
	it1m73t12N8xQbvspJGPhbPgBilu7gZ3AI68agqGapUXVv2RhONInwykAdqyoT7cM4O6FP
	4DoLIaCBFi86n2ZAekzXQBrTsh5xap4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-zSPQZ5vGM8WbcOq4wJBbJQ-1; Thu, 06 Aug 2020 09:38:39 -0400
X-MC-Unique: zSPQZ5vGM8WbcOq4wJBbJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33F3879EC4;
	Thu,  6 Aug 2020 13:38:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 246F619C4F;
	Thu,  6 Aug 2020 13:38:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 117771809554;
	Thu,  6 Aug 2020 13:38:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcZoS030820 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D251460BF1; Thu,  6 Aug 2020 13:38:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E08F59
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:32 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:50 +0100
Message-Id: <20200806133807.111280-16-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 15/32] gfs2_edit: Don't use gfs2_buffer_head
	in display_block_type()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/hexedit.c  | 19 +++++++++----------
 gfs2/edit/hexedit.h  |  2 +-
 gfs2/edit/savemeta.c |  4 ++--
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 357e790a..6019996d 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -298,12 +298,11 @@ const struct lgfs2_metadata *get_block_type(char *buf)
 	return NULL;
 }
 
-/* ------------------------------------------------------------------------ */
-/* display_block_type                                                       */
-/* returns: metatype if block is a GFS2 structure block type                */
-/*          0 if block is not a GFS2 structure                              */
-/* ------------------------------------------------------------------------ */
-int display_block_type(struct gfs2_buffer_head *dbh, int from_restore)
+/**
+ * returns: metatype if block is a GFS2 structure block type
+ *          0 if block is not a GFS2 structure
+ */
+int display_block_type(char *buf, uint64_t addr, int from_restore)
 {
 	const struct lgfs2_metadata *mtype;
 	const struct gfs2_meta_header *mh;
@@ -324,7 +323,7 @@ int display_block_type(struct gfs2_buffer_head *dbh, int from_restore)
 	else if (block == JOURNALS_DUMMY_BLOCK)
 		print_gfs2("Journal Status:      ");
 	else
-		print_gfs2("%"PRIu64"    (0x%"PRIx64")", dbh->b_blocknr, dbh->b_blocknr);
+		print_gfs2("%"PRIu64"    (0x%"PRIx64")", addr, addr);
 	if (termlines) {
 		if (edit_row[dmode] == -1)
 			COLORS_NORMAL;
@@ -340,7 +339,7 @@ int display_block_type(struct gfs2_buffer_head *dbh, int from_restore)
 		ret_type = GFS2_METATYPE_DI;
 		struct_len = 0;
 	} else {
-		mtype = get_block_type(dbh->b_data);
+		mtype = get_block_type(buf);
 		if (mtype != NULL) {
 			print_gfs2("(%s)", mtype->display);
 			struct_len = mtype->size;
@@ -350,7 +349,7 @@ int display_block_type(struct gfs2_buffer_head *dbh, int from_restore)
 			ret_type = 0;
 		}
 	}
-	mh = dbh->iov.iov_base;
+	mh = (void *)buf;
 	eol(0);
 	if (from_restore)
 		return ret_type;
@@ -1035,7 +1034,7 @@ int display(int identify_only, int trunc_zeros, uint64_t flagref,
 		}
 	}
 	line = 1;
-	gfs2_struct_type = display_block_type(bh, FALSE);
+	gfs2_struct_type = display_block_type(bh->b_data, bh->b_blocknr, FALSE);
 	if (identify_only)
 		return 0;
 	indirect_blocks = 0;
diff --git a/gfs2/edit/hexedit.h b/gfs2/edit/hexedit.h
index a73c150d..1c94c901 100644
--- a/gfs2/edit/hexedit.h
+++ b/gfs2/edit/hexedit.h
@@ -222,7 +222,7 @@ extern int block_is_inum_file(uint64_t blk);
 extern int block_is_statfs_file(uint64_t blk);
 extern int block_is_quota_file(uint64_t blk);
 extern int block_is_per_node(uint64_t blk);
-extern int display_block_type(struct gfs2_buffer_head *bh, int from_restore);
+extern int display_block_type(char *buf, uint64_t addr, int from_restore);
 extern void gfs_jindex_in(struct gfs_jindex *jindex, char *buf);
 extern void gfs_log_header_in(struct gfs_log_header *head, const char *buf);
 extern void gfs_log_header_print(struct gfs_log_header *lh);
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index c42f2da0..f3c85b0d 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -1153,12 +1153,12 @@ static int restore_data(int fd, struct metafd *mfd, int printonly)
 				.b_blocknr = savedata.blk,
 			};
 			if (printonly > 1 && printonly == savedata.blk) {
-				display_block_type(&dummy_bh, TRUE);
+				display_block_type(bp, savedata.blk, TRUE);
 				display_gfs2(&dummy_bh);
 				break;
 			} else if (printonly == 1) {
 				print_gfs2("%"PRId64" (l=0x%x): ", blks_saved, savedata.siglen);
-				display_block_type(&dummy_bh, TRUE);
+				display_block_type(bp, savedata.blk, TRUE);
 			}
 		} else {
 			warm_fuzzy_stuff(savedata.blk, FALSE);
-- 
2.26.2

