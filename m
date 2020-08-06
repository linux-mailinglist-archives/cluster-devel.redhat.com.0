Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EA54123DADB
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721118;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XJ5bgeS+rjzLKAprgCoFjUjw5an3I12e4LUn0QxqGpg=;
	b=JX6KnxjQEpsmyfngZpuMYQ61e/IVdKEEILCKIbJmTceL654XRSFZN8pSDdWBe0HIrkoj18
	saSiqc3wbOBvdi/oi0JuchEPxPHEPKCji3y5pngoFAiNco2le2Kr/gfgQ2x7xZh9KnZ4M3
	9tH1fladHy2Kxl+jKHO+1IdkfuxngQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-Kc4YTzMwM72Xq08MVQdnAg-1; Thu, 06 Aug 2020 09:38:37 -0400
X-MC-Unique: Kc4YTzMwM72Xq08MVQdnAg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C70711923769;
	Thu,  6 Aug 2020 13:38:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B876B65C74;
	Thu,  6 Aug 2020 13:38:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4B951809554;
	Thu,  6 Aug 2020 13:38:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcWZp030799 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0DC16842F; Thu,  6 Aug 2020 13:38:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E38F96111F
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:31 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:49 +0100
Message-Id: <20200806133807.111280-15-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 14/32] gfs2_edit: get_block_type()
	improvements
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Use the metadata description better to clean up the interface to
get_block_type() and remove the use of gfs2_buffer_head there. Since we
already have the structure length in mtype->size there's no need to set
it separately, just return the metadata type structure instead of the
mh_type. Use the new ->display strings to simplify display_block_type().

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/gfs2hex.c |   2 +-
 gfs2/edit/hexedit.c | 147 ++++++++++++--------------------------------
 gfs2/edit/hexedit.h |   6 +-
 gfs2/edit/journal.c |  55 +++++++++--------
 4 files changed, 72 insertions(+), 138 deletions(-)

diff --git a/gfs2/edit/gfs2hex.c b/gfs2/edit/gfs2hex.c
index ea9b6d3a..7274303c 100644
--- a/gfs2/edit/gfs2hex.c
+++ b/gfs2/edit/gfs2hex.c
@@ -526,7 +526,7 @@ int display_gfs2(struct gfs2_buffer_head *dbh)
 
 		case GFS2_METATYPE_LH:
 			if (sbd.gfs1) {
-				gfs_log_header_in(&lh1, dbh);
+				gfs_log_header_in(&lh1, dbh->b_data);
 				gfs_log_header_print(&lh1);
 			} else {
 				gfs2_log_header_in(&lh, dbh->b_data);
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 8a8e0225..357e790a 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -289,24 +289,13 @@ static void print_usage(void)
 	Erase();
 }
 
-/* ------------------------------------------------------------------------ */
-/* get_block_type                                                           */
-/* returns: metatype if block is a GFS2 structure block type                */
-/*          0 if block is not a GFS2 structure                              */
-/* ------------------------------------------------------------------------ */
-uint32_t get_block_type(const struct gfs2_buffer_head *lbh, int *structlen)
+const struct lgfs2_metadata *get_block_type(char *buf)
 {
-	uint32_t ty = lgfs2_get_block_type(lbh->b_data);
+	uint32_t t = lgfs2_get_block_type(buf);
 
-	if (ty != 0 && structlen != NULL) {
-		unsigned ver = sbd.gfs1 ? LGFS2_MD_GFS1 : LGFS2_MD_GFS2;
-		const struct lgfs2_metadata *mtype = lgfs2_find_mtype(ty, ver);
-		if (mtype != NULL)
-			*structlen = mtype->size;
-		else
-			*structlen = sbd.bsize;
-	}
-	return ty;
+	if (t != 0)
+		return lgfs2_find_mtype(t, sbd.gfs1 ? LGFS2_MD_GFS1 : LGFS2_MD_GFS2);
+	return NULL;
 }
 
 /* ------------------------------------------------------------------------ */
@@ -316,6 +305,7 @@ uint32_t get_block_type(const struct gfs2_buffer_head *lbh, int *structlen)
 /* ------------------------------------------------------------------------ */
 int display_block_type(struct gfs2_buffer_head *dbh, int from_restore)
 {
+	const struct lgfs2_metadata *mtype;
 	const struct gfs2_meta_header *mh;
 	int ret_type = 0; /* return type */
 
@@ -350,53 +340,14 @@ int display_block_type(struct gfs2_buffer_head *dbh, int from_restore)
 		ret_type = GFS2_METATYPE_DI;
 		struct_len = 0;
 	} else {
-		ret_type = get_block_type(dbh, &struct_len);
-		switch (ret_type) {
-		case GFS2_METATYPE_SB:   /* 1 */
-			print_gfs2("(superblock)");
-			break;
-		case GFS2_METATYPE_RG:   /* 2 */
-			print_gfs2("(rsrc grp hdr)");
-			break;
-		case GFS2_METATYPE_RB:   /* 3 */
-			print_gfs2("(rsrc grp bitblk)");
-			break;
-		case GFS2_METATYPE_DI:   /* 4 */
-			print_gfs2("(disk inode)");
-			break;
-		case GFS2_METATYPE_IN:   /* 5 */
-			print_gfs2("(indir blklist)");
-			break;
-		case GFS2_METATYPE_LF:   /* 6 */
-			print_gfs2("(directory leaf)");
-			break;
-		case GFS2_METATYPE_JD:
-			print_gfs2("(journal data)");
-			break;
-		case GFS2_METATYPE_LH:
-			print_gfs2("(log header)");
-			break;
-		case GFS2_METATYPE_LD:
-		 	print_gfs2("(log descriptor)");
-			break;
-		case GFS2_METATYPE_EA:
-			print_gfs2("(extended attr hdr)");
-			break;
-		case GFS2_METATYPE_ED:
-			print_gfs2("(extended attr data)");
-			break;
-		case GFS2_METATYPE_LB:
-			print_gfs2("(log buffer)");
-			break;
-		case GFS2_METATYPE_QC:
-			print_gfs2("(quota change)");
-			break;
-		case 0:
+		mtype = get_block_type(dbh->b_data);
+		if (mtype != NULL) {
+			print_gfs2("(%s)", mtype->display);
+			struct_len = mtype->size;
+			ret_type = mtype->mh_type;
+		} else {
 			struct_len = sbd.bsize;
-			break;
-		default:
-			print_gfs2("(wtf?)");
-			break;
+			ret_type = 0;
 		}
 	}
 	mh = dbh->iov.iov_base;
@@ -531,20 +482,6 @@ int display_block_type(struct gfs2_buffer_head *dbh, int from_restore)
 	return ret_type;
 }
 
-static const struct lgfs2_metadata *find_mtype(uint32_t mtype, const unsigned versions)
-{
-	const struct lgfs2_metadata *m = lgfs2_metadata;
-	unsigned n = 0;
-
-	do {
-		if ((m[n].versions & versions) && m[n].mh_type == mtype)
-			return &m[n];
-		n++;
-	} while (n < lgfs2_metadata_size);
-
-	return NULL;
-}
-
 static int get_pnum(int ptroffset)
 {
 	int pnum;
@@ -568,7 +505,7 @@ static int hexdump(uint64_t startaddr, int len, int trunc_zeros,
 	const char *lpBuffer = bh->b_data;
 	const char *zeros_strt = lpBuffer + sbd.bsize;
 	int print_field, cursor_line;
-	const uint32_t block_type = get_block_type(bh, NULL);
+	const struct lgfs2_metadata *m = get_block_type(bh->b_data);
 	uint64_t *ref;
 	int ptroffset = 0;
 
@@ -673,8 +610,6 @@ static int hexdump(uint64_t startaddr, int len, int trunc_zeros,
 		}
 		print_gfs2("] ");
 		if (print_field >= 0) {
-			const struct lgfs2_metadata *m = find_mtype(block_type,
-			               sbd.gfs1 ? LGFS2_MD_GFS1 : LGFS2_MD_GFS2);
 			if (m) {
 				const struct lgfs2_metafield *f;
 				unsigned n;
@@ -689,7 +624,9 @@ static int hexdump(uint64_t startaddr, int len, int trunc_zeros,
 			}
 
 		}
-		if (cursor_line) {
+		if (m && cursor_line) {
+			const uint32_t block_type = m->mh_type;
+
 			if (block_type == GFS2_METATYPE_IN ||
 			    block_type == GFS2_METATYPE_LD ||
 			    ((block_type == GFS2_METATYPE_DI) &&
@@ -723,7 +660,7 @@ static int hexdump(uint64_t startaddr, int len, int trunc_zeros,
 		if ((const char *)pointer >= zeros_strt)
 			break;
 	} /* while */
-	if (block_type == GFS2_METATYPE_LD && ptroffset >= struct_len) {
+	if (m && m->mh_type == GFS2_METATYPE_LD && ptroffset >= struct_len) {
 		COLORS_NORMAL;
 		eol(0);
 		print_gfs2("         * 'j' will jump to the journaled block, "
@@ -1637,8 +1574,12 @@ static void jump(void)
 	if (dmode == HEX_MODE) {
 		unsigned int col2;
 		uint64_t *b;
-		const uint32_t block_type = get_block_type(bh, NULL);
-		
+		const struct lgfs2_metadata *mtype = get_block_type(bh->b_data);
+		uint32_t block_type = 0;
+
+		if (mtype != NULL)
+			block_type = mtype->mh_type;
+
 		/* special exception for log descriptors: jump the journaled
 		   version of the block, not the "real" block */
 		if (block_type == GFS2_METATYPE_LD) {
@@ -1667,33 +1608,26 @@ static void jump(void)
 	}
 }
 
-/* ------------------------------------------------------------------------ */
-/* print block type                                                         */
-/* ------------------------------------------------------------------------ */
-static void print_block_type(uint64_t tblock, int type, const char *additional)
+static void print_block_type(uint64_t tblock, const struct lgfs2_metadata *type)
 {
-	if (type <= GFS2_METATYPE_QC)
-		printf("%d (Block %lld is type %d: %s%s)\n", type,
-		       (unsigned long long)tblock, type, block_type_str[type],
-		       additional);
+	if (type != NULL && type->nfields > 0)
+		printf("%d (Block %"PRIu64" is type %d: %s)\n", type->mh_type,
+		       tblock, type->mh_type, type->display);
 	else
-		printf("%d (Block %lld is type %d: unknown%s)\n", type,
-		       (unsigned long long)tblock, type, additional);
+		printf("%d (Block %"PRIu64" is type %d: unknown)\n", type->mh_type,
+		       tblock, type->mh_type);
 }
 
-/* ------------------------------------------------------------------------ */
-/* find_print block type                                                    */
-/* ------------------------------------------------------------------------ */
 static void find_print_block_type(void)
 {
 	uint64_t tblock;
 	struct gfs2_buffer_head *lbh;
-	int type;
+	const struct lgfs2_metadata *type;
 
 	tblock = blockstack[blockhist % BLOCK_STACK_SIZE].block;
 	lbh = bread(&sbd, tblock);
-	type = get_block_type(lbh, NULL);
-	print_block_type(tblock, type, "");
+	type = get_block_type(lbh->b_data);
+	print_block_type(tblock, type);
 	brelse(lbh);
 	gfs2_rgrp_free(&sbd, &sbd.rgtree);
 	exit(0);
@@ -1803,17 +1737,15 @@ static void process_field(const char *field, const char *nstr)
 {
 	uint64_t fblock;
 	struct gfs2_buffer_head *rbh;
-	int type;
 	const struct lgfs2_metadata *mtype;
 	const struct lgfs2_metafield *mfield;
 
 	fblock = blockstack[blockhist % BLOCK_STACK_SIZE].block;
 	rbh = bread(&sbd, fblock);
-	type = get_block_type(rbh, NULL);
-
-	mtype = lgfs2_find_mtype(type, sbd.gfs1 ? LGFS2_MD_GFS1 : LGFS2_MD_GFS2);
+	mtype = get_block_type(rbh->b_data);
 	if (mtype == NULL) {
-		fprintf(stderr, "Metadata type '%d' invalid\n", type);
+		fprintf(stderr, "Metadata type of block %"PRIx64" not recognised\n",
+		        fblock);
 		exit(1);
 	}
 
@@ -2116,12 +2048,11 @@ static void interactive_mode(void)
 /* ------------------------------------------------------------------------ */
 /* gfs_log_header_in - read in a gfs1-style log header                      */
 /* ------------------------------------------------------------------------ */
-void gfs_log_header_in(struct gfs_log_header *head,
-		       struct gfs2_buffer_head *lbh)
+void gfs_log_header_in(struct gfs_log_header *head, const char *buf)
 {
-	struct gfs_log_header *str = lbh->iov.iov_base;
+	const struct gfs_log_header *str = (void *)buf;
 
-	gfs2_meta_header_in(&head->lh_header, lbh->b_data);
+	gfs2_meta_header_in(&head->lh_header, buf);
 
 	head->lh_flags = be32_to_cpu(str->lh_flags);
 	head->lh_pad = be32_to_cpu(str->lh_pad);
diff --git a/gfs2/edit/hexedit.h b/gfs2/edit/hexedit.h
index ab2d44d6..a73c150d 100644
--- a/gfs2/edit/hexedit.h
+++ b/gfs2/edit/hexedit.h
@@ -224,8 +224,7 @@ extern int block_is_quota_file(uint64_t blk);
 extern int block_is_per_node(uint64_t blk);
 extern int display_block_type(struct gfs2_buffer_head *bh, int from_restore);
 extern void gfs_jindex_in(struct gfs_jindex *jindex, char *buf);
-extern void gfs_log_header_in(struct gfs_log_header *head,
-			      struct gfs2_buffer_head *bh);
+extern void gfs_log_header_in(struct gfs_log_header *head, const char *buf);
 extern void gfs_log_header_print(struct gfs_log_header *lh);
 extern void savemeta(char *out_fn, int saveoption, int gziplevel);
 extern void restoremeta(const char *in_fn, const char *out_device,
@@ -236,7 +235,6 @@ extern uint64_t check_keywords(const char *kword);
 extern uint64_t masterblock(const char *fn);
 extern void gfs_rgrp_print(struct gfs_rgrp *rg);
 extern int has_indirect_blocks(void);
-extern uint32_t get_block_type(const struct gfs2_buffer_head *lbh,
-			       int *structlen);
+extern const struct lgfs2_metadata *get_block_type(char *buf);
 
 #endif /* __HEXVIEW_DOT_H__ */
diff --git a/gfs2/edit/journal.c b/gfs2/edit/journal.c
index aa945920..1adbc4b1 100644
--- a/gfs2/edit/journal.c
+++ b/gfs2/edit/journal.c
@@ -306,14 +306,14 @@ static int print_ld_blks(const uint64_t *b, const char *end, int start_line,
 
 static int is_wrap_pt(char *buf, uint64_t *highest_seq)
 {
-	struct gfs2_buffer_head tbh = { .b_data = buf };
+	const struct lgfs2_metadata *mtype = get_block_type(buf);
 
-	if (get_block_type(&tbh, NULL) == GFS2_METATYPE_LH) {
+	if (mtype != NULL && mtype->mh_type == GFS2_METATYPE_LH) {
 		uint64_t seq;
 
 		if (sbd.gfs1) {
 			struct gfs_log_header lh;
-			gfs_log_header_in(&lh, &tbh);
+			gfs_log_header_in(&lh, buf);
 			seq = lh.lh_sequence;
 		} else {
 			struct gfs2_log_header lh;
@@ -421,20 +421,24 @@ static int process_ld(uint64_t abs_block, uint64_t wrappt, uint64_t j_size,
  */
 static int meta_has_ref(uint64_t abs_block, int tblk)
 {
+	const struct lgfs2_metadata *mtype;
 	struct gfs2_buffer_head *mbh;
-	int structlen, ty, has_ref = 0;
+	int structlen = 0, has_ref = 0;
 	uint64_t *b;
 	struct gfs2_dinode *dinode;
 
 	mbh = bread(&sbd, abs_block);
-	ty = get_block_type(mbh, &structlen);
-	if (ty == GFS2_METATYPE_DI) {
-		dinode = (struct gfs2_dinode *)mbh->b_data;
-		if (be64_to_cpu(dinode->di_eattr) == tblk)
-			has_ref = 1;
+	mtype = get_block_type(mbh->b_data);
+	if (mtype != NULL) {
+		structlen = mtype->size;
+		if (mtype->mh_type == GFS2_METATYPE_DI) {
+			dinode = (struct gfs2_dinode *)mbh->b_data;
+			if (be64_to_cpu(dinode->di_eattr) == tblk)
+				has_ref = 1;
+		}
 	}
 	b = (uint64_t *)(mbh->b_data + structlen);
-	while (!has_ref && ty && (char *)b < mbh->b_data + sbd.bsize) {
+	while (!has_ref && mtype && (char *)b < mbh->b_data + sbd.bsize) {
 		if (be64_to_cpu(*b) == tblk)
 			has_ref = 1;
 		b++;
@@ -478,7 +482,7 @@ void dump_journal(const char *journal, int tblk)
 {
 	const struct lgfs2_metadata *mtype;
 	const struct lgfs2_metafield *lh_flags_field;
-	struct gfs2_buffer_head *j_bh = NULL, dummy_bh;
+	struct gfs2_buffer_head *j_bh = NULL;
 	uint64_t jblock, j_size, jb, abs_block, saveblk, wrappt = 0;
 	int start_line, journal_num;
 	struct gfs2_inode *j_inode = NULL;
@@ -486,6 +490,7 @@ void dump_journal(const char *journal, int tblk)
 	uint64_t tblk_off = 0, bblk_off = 0, bitblk = 0;
 	uint64_t highest_seq = 0;
 	char *jbuf = NULL;
+	char *buf = NULL;
 	struct rgrp_tree *rgd = NULL;
 	uint64_t abs_ld = 0;
 
@@ -564,20 +569,23 @@ void dump_journal(const char *journal, int tblk)
 				brelse(j_bh);
 			abs_block = jblock + ((jb + wrappt) % j_size);
 			j_bh = bread(&sbd, abs_block);
-			dummy_bh.b_data = j_bh->b_data;
+			buf = j_bh->b_data;
 		} else {
 			int error = fsck_readi(j_inode, (void *)jbuf,
 					   ((jb + wrappt) % j_size),
 					   sbd.bsize, &abs_block);
 			if (!error) /* end of file */
 				break;
-			dummy_bh.b_data = jbuf;
+			buf = jbuf;
 		}
 		offset_from_ld++;
-		block_type = get_block_type(&dummy_bh, NULL);
+		mtype = get_block_type(buf);
+		if (mtype != NULL)
+			block_type = mtype->mh_type;
+
 		if (block_type == GFS2_METATYPE_LD) {
 			ld_blocks = process_ld(abs_block, wrappt, j_size, jb,
-					       dummy_bh.b_data, tblk, &tblk_off,
+					       buf, tblk, &tblk_off,
 					       bitblk, rgd, &is_pertinent,
 					       &bblk_off);
 			offset_from_ld = 0;
@@ -587,7 +595,7 @@ void dump_journal(const char *journal, int tblk)
 			struct gfs_log_header lh1;
 
 			if (sbd.gfs1) {
-				gfs_log_header_in(&lh1, &dummy_bh);
+				gfs_log_header_in(&lh1, buf);
 				check_journal_wrap(lh1.lh_sequence,
 						   &highest_seq);
 				print_gfs2("0x%"PRIx64" (j+%4"PRIx64"): Log header: "
@@ -600,11 +608,11 @@ void dump_journal(const char *journal, int tblk)
 			} else {
 				char flags_str[256];
 
-				gfs2_log_header_in(&lh, dummy_bh.b_data);
+				gfs2_log_header_in(&lh, buf);
 				check_journal_wrap(lh.lh_sequence,
 						   &highest_seq);
 				lgfs2_field_str(flags_str, sizeof(flags_str),
-						dummy_bh.b_data, lh_flags_field,
+						buf, lh_flags_field,
 						(dmode == HEX_MODE));
 				print_gfs2("0x%"PRIx64" (j+%4"PRIx64"): Log header: Seq"
 					   ": 0x%llx, tail: 0x%x, blk: 0x%x [%s]",
@@ -616,18 +624,15 @@ void dump_journal(const char *journal, int tblk)
 			eol(0);
 		} else if ((ld_blocks > 0) &&
 			   (sbd.gfs1 || block_type == GFS2_METATYPE_LB)) {
+			uint64_t *b = (uint64_t *)(buf + (sbd.gfs1 ? 0 : sizeof(struct gfs2_meta_header)));
+
 			print_gfs2("0x%"PRIx64" (j+%4"PRIx64"): Log descriptor"
 				   " continuation block", abs_block,
 				   ((jb + wrappt) % j_size) / sbd.bsize);
 			eol(0);
 			print_gfs2("                    ");
-			ld_blocks -= print_ld_blks((uint64_t *)dummy_bh.b_data +
-						   (sbd.gfs1 ? 0 :
-						    sizeof(struct gfs2_meta_header)),
-						   (dummy_bh.b_data +
-						    sbd.bsize), start_line,
-						   tblk, &tblk_off, 0, rgd,
-						   0, 1, NULL, 0);
+			ld_blocks -= print_ld_blks(b, (buf + sbd.bsize), start_line,
+			                     tblk, &tblk_off, 0, rgd, 0, 1, NULL, 0);
 		} else if (block_type == 0) {
 			continue;
 		}
-- 
2.26.2

