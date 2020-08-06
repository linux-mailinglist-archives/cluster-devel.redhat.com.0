Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C9F2523DAD9
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721114;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oYctCYh+Knq/w2/naQbwJ0f1lCD89mo+R69JbejWcpI=;
	b=e39kIr6fPf8MMBvJIyjvz8ksmLZ5hi7z3Rs4elFH19+ACWN43RSILH7QyMIEgLO7giimXx
	NV8i+G+5E0Av0sv/f/y4C8ZltGlBDVKMW5jCwrFp+hgRnNPJzp6hkG4uNzTrMn52myof/P
	I++cwWZPT/IG1XEh0Mq+AA37BsvBbCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-dp7jxLtUMSOqRNO64MrsRg-1; Thu, 06 Aug 2020 09:38:32 -0400
X-MC-Unique: dp7jxLtUMSOqRNO64MrsRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 791378064DD;
	Thu,  6 Aug 2020 13:38:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67D581002393;
	Thu,  6 Aug 2020 13:38:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56C5696925;
	Thu,  6 Aug 2020 13:38:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcPUw030741 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 437B87010B; Thu,  6 Aug 2020 13:38:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C8B960BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:24 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:45 +0100
Message-Id: <20200806133807.111280-11-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 10/32] gfs2l: Remove uses of
	gfs2_buffer_heads
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Required a similar treatment of lgfs2_get_block_type().

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/hexedit.c    |   2 +-
 gfs2/edit/journal.c    |   2 +-
 gfs2/libgfs2/buf.c     |   4 +-
 gfs2/libgfs2/lang.c    | 121 ++++++++++++++++++++++++-----------------
 gfs2/libgfs2/lang.h    |   2 +-
 gfs2/libgfs2/libgfs2.h |   2 +-
 6 files changed, 78 insertions(+), 55 deletions(-)

diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index b31acd8b..bc4bcc6c 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -296,7 +296,7 @@ static void print_usage(void)
 /* ------------------------------------------------------------------------ */
 uint32_t get_block_type(const struct gfs2_buffer_head *lbh, int *structlen)
 {
-	uint32_t ty = lgfs2_get_block_type(lbh);
+	uint32_t ty = lgfs2_get_block_type(lbh->b_data);
 
 	if (ty != 0 && structlen != NULL) {
 		unsigned ver = sbd.gfs1 ? LGFS2_MD_GFS1 : LGFS2_MD_GFS2;
diff --git a/gfs2/edit/journal.c b/gfs2/edit/journal.c
index 9139855b..06a5f618 100644
--- a/gfs2/edit/journal.c
+++ b/gfs2/edit/journal.c
@@ -231,7 +231,7 @@ static int print_ld_blks(const uint64_t *b, const char *end, int start_line,
 							  bcount);
 					sprintf(str, "0x%llx %2s",
 						(unsigned long long)be64_to_cpu(*b),
-						mtypes[lgfs2_get_block_type(j_bmap_bh)]);
+						mtypes[lgfs2_get_block_type(j_bmap_bh->b_data)]);
 					brelse(j_bmap_bh);
 				} else {
 					sprintf(str, "0x%llx",
diff --git a/gfs2/libgfs2/buf.c b/gfs2/libgfs2/buf.c
index 097ac33b..eb7a94cf 100644
--- a/gfs2/libgfs2/buf.c
+++ b/gfs2/libgfs2/buf.c
@@ -118,9 +118,9 @@ int brelse(struct gfs2_buffer_head *bh)
 	return error;
 }
 
-uint32_t lgfs2_get_block_type(const struct gfs2_buffer_head *lbh)
+uint32_t lgfs2_get_block_type(const char *buf)
 {
-	const struct gfs2_meta_header *mh = lbh->iov.iov_base;
+	const struct gfs2_meta_header *mh = (void *)buf;
 
 	if (be32_to_cpu(mh->mh_magic) == GFS2_MAGIC)
 		return be32_to_cpu(mh->mh_type);
diff --git a/gfs2/libgfs2/lang.c b/gfs2/libgfs2/lang.c
index 69a98aad..d48b123f 100644
--- a/gfs2/libgfs2/lang.c
+++ b/gfs2/libgfs2/lang.c
@@ -2,6 +2,7 @@
 #include <string.h>
 #include <stdlib.h>
 #include <stdio.h>
+#include <unistd.h>
 #include <sys/queue.h>
 #include <errno.h>
 #include <limits.h>
@@ -286,15 +287,14 @@ static uint64_t ast_lookup_block_num(struct ast_node *ast, struct gfs2_sbd *sbd)
 	return bn;
 }
 
-static struct gfs2_buffer_head *ast_lookup_block(struct ast_node *node, struct gfs2_sbd *sbd)
+static uint64_t ast_lookup_block(struct ast_node *node, struct gfs2_sbd *sbd)
 {
 	uint64_t bn = ast_lookup_block_num(node, sbd);
 	if (bn == 0) {
 		fprintf(stderr, "Block not found: %s\n", node->ast_text);
-		return NULL;
+		return 0;
 	}
-
-	return bread(sbd, bn);
+	return bn;
 }
 
 static const char *bitstate_strings[] = {
@@ -308,12 +308,12 @@ static const char *bitstate_strings[] = {
  * Print a representation of an arbitrary field of an arbitrary GFS2 block to stdout
  * Returns 0 if successful, 1 otherwise
  */
-static int field_print(const struct gfs2_buffer_head *bh, const struct lgfs2_metadata *mtype,
+static int field_print(char *buf, uint64_t addr, const struct lgfs2_metadata *mtype,
                       const struct lgfs2_metafield *field)
 {
-	const char *fieldp = (char *)bh->iov.iov_base + field->offset;
+	const char *fieldp = buf + field->offset;
 
-	printf("%s\t%"PRIu64"\t%u\t%u\t%s\t", mtype->name, bh->b_blocknr, field->offset, field->length, field->name);
+	printf("%s\t%"PRIu64"\t%u\t%u\t%s\t", mtype->name, addr, field->offset, field->length, field->name);
 	if (field->flags & LGFS2_MFF_UUID) {
 #ifdef GFS2_HAS_UUID
 		char readable_uuid[36+1];
@@ -356,7 +356,8 @@ int lgfs2_lang_result_print(struct lgfs2_lang_result *result)
 	int i;
 	if (result->lr_mtype != NULL) {
 		for (i = 0; i < result->lr_mtype->nfields; i++) {
-			field_print(result->lr_bh, result->lr_mtype, &result->lr_mtype->fields[i]);
+			field_print(result->lr_buf, result->lr_blocknr,
+			            result->lr_mtype, &result->lr_mtype->fields[i]);
 		}
 	} else {
 		printf("%"PRIu64": %s\n", result->lr_blocknr, bitstate_strings[result->lr_state]);
@@ -390,21 +391,37 @@ static int ast_get_bitstate(uint64_t bn, struct gfs2_sbd *sbd)
 	return state;
 }
 
-static const struct lgfs2_metadata *ast_lookup_mtype(const struct gfs2_buffer_head *bh)
+static void result_lookup_mtype(struct lgfs2_lang_result *result, int gfs1)
 {
-	const struct lgfs2_metadata *mtype;
-	const uint32_t mh_type = lgfs2_get_block_type(bh);
+	const uint32_t mh_type = lgfs2_get_block_type(result->lr_buf);
+	uint64_t addr = result->lr_blocknr;
+
+	result->lr_mtype = NULL;
 	if (mh_type == 0) {
-		fprintf(stderr, "Could not determine type for block %"PRIu64"\n", bh->b_blocknr);
-		return NULL;
+		fprintf(stderr, "Could not determine type for block %"PRIu64"\n", addr);
+		return;
 	}
+	result->lr_mtype = lgfs2_find_mtype(mh_type, gfs1 ? LGFS2_MD_GFS1 : LGFS2_MD_GFS2);
+	if (result->lr_mtype == NULL)
+		fprintf(stderr, "Could not determine meta type for block %"PRIu64"\n", addr);
+}
+
+static char *lang_read_block(int fd, unsigned bsize, uint64_t addr)
+{
+	off_t off = addr * bsize;
+	char *buf;
 
-	mtype = lgfs2_find_mtype(mh_type, bh->sdp->gfs1 ? LGFS2_MD_GFS1 : LGFS2_MD_GFS2);
-	if (mtype == NULL) {
-		fprintf(stderr, "Could not determine meta type for block %"PRIu64"\n", bh->b_blocknr);
+	buf = calloc(1, bsize);
+	if (buf == NULL) {
+		perror("Failed to read block");
 		return NULL;
 	}
-	return mtype;
+	if (pread(fd, buf, bsize, off) != bsize) {
+		fprintf(stderr, "Failed to read block %"PRIu64": %s\n", addr, strerror(errno));
+		free(buf);
+		return NULL;
+	}
+	return buf;
 }
 
 /**
@@ -420,13 +437,17 @@ static struct lgfs2_lang_result *ast_interp_get(struct lgfs2_lang_state *state,
 	}
 
 	if (ast->ast_right->ast_right == NULL) {
-		result->lr_bh = ast_lookup_block(ast->ast_right, sbd);
-		if (result->lr_bh == NULL) {
+		result->lr_blocknr = ast_lookup_block(ast->ast_right, sbd);
+		if (result->lr_blocknr == 0) {
 			free(result);
 			return NULL;
 		}
-		result->lr_blocknr = result->lr_bh->b_blocknr;
-		result->lr_mtype = ast_lookup_mtype(result->lr_bh);
+		result->lr_buf = lang_read_block(sbd->device_fd, sbd->bsize, result->lr_blocknr);
+		if (result->lr_buf == NULL) {
+			free(result);
+			return NULL;
+		}
+		result_lookup_mtype(result, sbd->gfs1);
 
 	} else if (ast->ast_right->ast_right->ast_type == AST_KW_STATE) {
 		result->lr_blocknr = ast_lookup_block_num(ast->ast_right, sbd);
@@ -444,8 +465,8 @@ static struct lgfs2_lang_result *ast_interp_get(struct lgfs2_lang_state *state,
  * Set a field of a gfs2 block of a given type to a given value.
  * Returns AST_INTERP_* to signal success, an invalid field/value or an error.
  */
-static int ast_field_set(struct gfs2_buffer_head *bh, const struct lgfs2_metafield *field,
-                                                                        struct ast_node *val)
+static int ast_field_set(char *buf, const struct lgfs2_metafield *field,
+                         struct ast_node *val)
 {
 	int err = 0;
 
@@ -457,15 +478,15 @@ static int ast_field_set(struct gfs2_buffer_head *bh, const struct lgfs2_metafie
 			fprintf(stderr, "Invalid UUID\n");
 			return AST_INTERP_INVAL;
 		}
-		err = lgfs2_field_assign(bh->b_data, field, uuid);
+		err = lgfs2_field_assign(buf, field, uuid);
 #else
 		fprintf(stderr, "No UUID support\n");
 		err = 1;
 #endif
 	} else if (field->flags & LGFS2_MFF_STRING) {
-		err = lgfs2_field_assign(bh->b_data, field, val->ast_str);
+		err = lgfs2_field_assign(buf, field, val->ast_str);
 	} else {
-		err = lgfs2_field_assign(bh->b_data, field, &val->ast_num);
+		err = lgfs2_field_assign(buf, field, &val->ast_num);
 	}
 
 	if (err) {
@@ -473,12 +494,10 @@ static int ast_field_set(struct gfs2_buffer_head *bh, const struct lgfs2_metafie
 	                field->name, field->length, val->ast_text);
 		return AST_INTERP_INVAL;
 	}
-
-	bmodified(bh);
 	return AST_INTERP_SUCCESS;
 }
 
-static const struct lgfs2_metadata *lang_find_mtype(struct ast_node *node, struct gfs2_buffer_head *bh, unsigned ver)
+static const struct lgfs2_metadata *lang_find_mtype(struct ast_node *node, const char *buf, unsigned ver)
 {
 	const struct lgfs2_metadata *mtype = NULL;
 
@@ -487,7 +506,7 @@ static const struct lgfs2_metadata *lang_find_mtype(struct ast_node *node, struc
 		if (mtype == NULL)
 			fprintf(stderr, "Invalid block type: %s\n", node->ast_text);
 	} else {
-		mtype = lgfs2_find_mtype(lgfs2_get_block_type(bh), ver);
+		mtype = lgfs2_find_mtype(lgfs2_get_block_type(buf), ver);
 		if (mtype == NULL)
 			fprintf(stderr, "Unrecognised block at: %s\n", node->ast_text);
 	}
@@ -495,6 +514,18 @@ static const struct lgfs2_metadata *lang_find_mtype(struct ast_node *node, struc
 	return mtype;
 }
 
+static int lang_write_result(int fd, unsigned bsize, struct lgfs2_lang_result *result)
+{
+	off_t off = bsize * result->lr_blocknr;
+
+	if (pwrite(fd, result->lr_buf, bsize, off) != bsize) {
+		fprintf(stderr, "Failed to write modified block %"PRIu64": %s\n",
+		                result->lr_blocknr, strerror(errno));
+		return -1;
+	}
+	return 0;
+}
+
 /**
  * Interpret an assignment (set)
  */
@@ -514,12 +545,14 @@ static struct lgfs2_lang_result *ast_interp_set(struct lgfs2_lang_state *state,
 		return NULL;
 	}
 
-	result->lr_bh = ast_lookup_block(lookup, sbd);
-	if (result->lr_bh == NULL) {
+	result->lr_blocknr = ast_lookup_block(lookup, sbd);
+	if (result->lr_blocknr == 0)
+		goto out_err;
+	result->lr_buf = lang_read_block(sbd->device_fd, sbd->bsize, result->lr_blocknr);
+	if (result->lr_buf == NULL)
 		goto out_err;
-	}
 
-	result->lr_mtype = lang_find_mtype(lookup->ast_right, result->lr_bh, ver);
+	result->lr_mtype = lang_find_mtype(lookup->ast_right, result->lr_buf, ver);
 	if (result->lr_mtype == NULL) {
 		fprintf(stderr, "Unrecognised block at: %s\n", lookup->ast_str);
 		goto out_err;
@@ -531,7 +564,7 @@ static struct lgfs2_lang_result *ast_interp_set(struct lgfs2_lang_state *state,
 			.mh_type = result->lr_mtype->mh_type,
 			.mh_format = result->lr_mtype->mh_format,
 		};
-		gfs2_meta_header_out(&mh, result->lr_bh->iov.iov_base);
+		gfs2_meta_header_out(&mh, result->lr_buf);
 		lookup = lookup->ast_right;
 	}
 
@@ -550,21 +583,17 @@ static struct lgfs2_lang_result *ast_interp_set(struct lgfs2_lang_state *state,
 			goto out_err;
 		}
 
-		ret = ast_field_set(result->lr_bh, mfield, fieldval);
+		ret = ast_field_set(result->lr_buf, mfield, fieldval);
 		if (ret != AST_INTERP_SUCCESS) {
 			goto out_err;
 		}
 	}
 
-	ret = bwrite(result->lr_bh);
-	if (ret != 0) {
-		fprintf(stderr, "Failed to write modified block %"PRIu64": %s\n",
-		                        result->lr_bh->b_blocknr, strerror(errno));
+	ret = lang_write_result(sbd->device_fd, sbd->bsize, result);
+	if (ret != 0)
 		goto out_err;
-	}
 
 	return result;
-
 out_err:
 	lgfs2_lang_result_free(&result);
 	return NULL;
@@ -606,13 +635,7 @@ void lgfs2_lang_result_free(struct lgfs2_lang_result **result)
 		fprintf(stderr, "Warning: attempted to free a null result\n");
 		return;
 	}
-
-	if ((*result)->lr_mtype != NULL) {
-		(*result)->lr_bh->b_modified = 0;
-		brelse((*result)->lr_bh);
-		(*result)->lr_bh = NULL;
-	}
-
+	free((*result)->lr_buf);
 	free(*result);
 	*result = NULL;
 }
diff --git a/gfs2/libgfs2/lang.h b/gfs2/libgfs2/lang.h
index f74a57bd..211abd46 100644
--- a/gfs2/libgfs2/lang.h
+++ b/gfs2/libgfs2/lang.h
@@ -14,7 +14,7 @@ struct lgfs2_lang_state {
 
 struct lgfs2_lang_result {
 	uint64_t lr_blocknr;
-	struct gfs2_buffer_head *lr_bh;
+	char *lr_buf;
 	const struct lgfs2_metadata *lr_mtype;
 	int lr_state; // GFS2_BLKST_*
 };
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index aa500dfd..7ede1967 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -369,7 +369,7 @@ extern struct gfs2_buffer_head *__bread(struct gfs2_sbd *sdp, uint64_t num,
 extern int __breadm(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhs, size_t n, uint64_t block, int line, const char *caller);
 extern int bwrite(struct gfs2_buffer_head *bh);
 extern int brelse(struct gfs2_buffer_head *bh);
-extern uint32_t lgfs2_get_block_type(const struct gfs2_buffer_head *lbh);
+extern uint32_t lgfs2_get_block_type(const char *buf);
 
 #define bmodified(bh) do { bh->b_modified = 1; } while(0)
 
-- 
2.26.2

