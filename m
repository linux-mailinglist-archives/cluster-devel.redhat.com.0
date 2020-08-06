Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4C323DADC
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721122;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D6ZAjoV2rFXXQ4Ud/0RoZSaMTlA1j2QZ2b+dZDyfm5Q=;
	b=gwPDJS5jwEJBnyfz45BewLLYIaABrRyoSiIfMd2wInqqf6WGKF9ynfyl6fckLhwyEC3grZ
	Es9Jr/h6DaPPCH/FsNQI/5S5Gxb3UcdqtUA1/qXX7i262dMy1/tN14JcoV6MwFzd308FpP
	NPfqz88UkYRj8I5B7Koc/pU6Mp4RC48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-khe9UsstPvi_aUX5fEZMGQ-1; Thu, 06 Aug 2020 09:38:25 -0400
X-MC-Unique: khe9UsstPvi_aUX5fEZMGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 704158064AC;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F26A7B90B;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B9C41809557;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcGqt030649 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4043259; Thu,  6 Aug 2020 13:38:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C69E60BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:15 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:38 +0100
Message-Id: <20200806133807.111280-4-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 03/32] libgfs2: Separate out gfs2l's
	language API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

It doesn't really make sense to have this interpreter be part of
libgfs2, at least while the language isn't rich enough to be broadly
useful.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/Makefile.am | 14 ++++++++------
 gfs2/libgfs2/gfs2l.c     |  1 +
 gfs2/libgfs2/lang.h      | 15 +++++++++++++++
 gfs2/libgfs2/libgfs2.h   | 19 -------------------
 4 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/gfs2/libgfs2/Makefile.am b/gfs2/libgfs2/Makefile.am
index 76df920e..03a955f2 100644
--- a/gfs2/libgfs2/Makefile.am
+++ b/gfs2/libgfs2/Makefile.am
@@ -41,10 +41,7 @@ libgfs2_la_SOURCES = \
 	fs_ops.c \
 	recovery.c \
 	structures.c \
-	meta.c \
-	lang.c \
-	parser.y \
-	lexer.l
+	meta.c
 
 libgfs2_la_CPPFLAGS = \
 	-D_FILE_OFFSET_BITS=64 \
@@ -53,13 +50,18 @@ libgfs2_la_CPPFLAGS = \
 	-I$(top_srcdir)/gfs2/include \
 	$(uuid_CFLAGS)
 
-gfs2l_SOURCES = gfs2l.c
+gfs2l_SOURCES = \
+	gfs2l.c \
+	lang.c \
+	parser.y \
+	lexer.l
 gfs2l_LDADD = \
 	libgfs2.la \
 	$(uuid_LIBS)
 gfs2l_CPPFLAGS = \
 	-I$(top_srcdir)/gfs2/include \
-	-D_FILE_OFFSET_BITS=64
+	-D_FILE_OFFSET_BITS=64 \
+	$(uuid_CFLAGS)
 
 # Autotools can't handle header files output by flex so we have to generate it manually
 lexer.h: lexer.l
diff --git a/gfs2/libgfs2/gfs2l.c b/gfs2/libgfs2/gfs2l.c
index ba2d5f15..bc42e888 100644
--- a/gfs2/libgfs2/gfs2l.c
+++ b/gfs2/libgfs2/gfs2l.c
@@ -1,6 +1,7 @@
 #include <fcntl.h>
 #include <unistd.h>
 #include <string.h>
+#include "lang.h"
 #include "libgfs2.h"
 
 static void usage(const char *cmd)
diff --git a/gfs2/libgfs2/lang.h b/gfs2/libgfs2/lang.h
index 7d9a6e98..f74a57bd 100644
--- a/gfs2/libgfs2/lang.h
+++ b/gfs2/libgfs2/lang.h
@@ -12,6 +12,21 @@ struct lgfs2_lang_state {
 	struct ast_node *ls_interp_curr;
 };
 
+struct lgfs2_lang_result {
+	uint64_t lr_blocknr;
+	struct gfs2_buffer_head *lr_bh;
+	const struct lgfs2_metadata *lr_mtype;
+	int lr_state; // GFS2_BLKST_*
+};
+
+extern struct lgfs2_lang_state *lgfs2_lang_init(void);
+extern int lgfs2_lang_parsef(struct lgfs2_lang_state *state, FILE *script);
+extern int lgfs2_lang_parses(struct lgfs2_lang_state *state, const char *script);
+extern struct lgfs2_lang_result *lgfs2_lang_result_next(struct lgfs2_lang_state *state, struct gfs2_sbd *sbd);
+extern int lgfs2_lang_result_print(struct lgfs2_lang_result *result);
+extern void lgfs2_lang_result_free(struct lgfs2_lang_result **result);
+extern void lgfs2_lang_free(struct lgfs2_lang_state **state);
+
 typedef enum {
 	AST_NONE,
 	// Statements
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index cf225af5..59fb18e8 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -769,25 +769,6 @@ extern void gfs2_log_descriptor_print(const struct gfs2_log_descriptor *ld);
 extern void gfs2_statfs_change_print(const struct gfs2_statfs_change *sc);
 extern void gfs2_quota_change_print(const struct gfs2_quota_change *qc);
 
-/* Language functions */
-
-struct lgfs2_lang_state;
-
-struct lgfs2_lang_result {
-	uint64_t lr_blocknr;
-	struct gfs2_buffer_head *lr_bh;
-	const struct lgfs2_metadata *lr_mtype;
-	int lr_state; // GFS2_BLKST_*
-};
-
-extern struct lgfs2_lang_state *lgfs2_lang_init(void);
-extern int lgfs2_lang_parsef(struct lgfs2_lang_state *state, FILE *script);
-extern int lgfs2_lang_parses(struct lgfs2_lang_state *state, const char *script);
-extern struct lgfs2_lang_result *lgfs2_lang_result_next(struct lgfs2_lang_state *state, struct gfs2_sbd *sbd);
-extern int lgfs2_lang_result_print(struct lgfs2_lang_result *result);
-extern void lgfs2_lang_result_free(struct lgfs2_lang_result **result);
-extern void lgfs2_lang_free(struct lgfs2_lang_state **state);
-
 __END_DECLS
 
 #endif /* __LIBGFS2_DOT_H__ */
-- 
2.26.2

