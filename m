Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3E64A23DAE0
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721126;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PVLZKN07qq+/q1h7U8esSTd0S3IW8EPQzE/fB6KtwLU=;
	b=dEz8XFPZgds8EVNeenPOANAZcliX5gEfI/YzJiNWb0Qy2cPcZCunLWKMCEjXtFpt4VPmzi
	dTxdzraQnlt5I0tDuBJ+dFNyeZ41wnxa1aqHfreXbxhSI5zRts5GxCslH/8B9ujBePoCfJ
	hbXEfPJ/Hj17g+WO25b8Jk/JAXPOID0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-Pb3MQe-dOA6iXq6jzZPMbQ-1; Thu, 06 Aug 2020 09:38:44 -0400
X-MC-Unique: Pb3MQe-dOA6iXq6jzZPMbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D62681923761;
	Thu,  6 Aug 2020 13:38:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C65A510021B3;
	Thu,  6 Aug 2020 13:38:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4EB396925;
	Thu,  6 Aug 2020 13:38:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076Dccdi030844 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 168DD59; Thu,  6 Aug 2020 13:38:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3711060C47
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:37 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:52 +0100
Message-Id: <20200806133807.111280-18-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 17/32] gfs2_edit: restore_block()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

No need for maxlen and checklen as the only caller passes in the block
size which is always used as the check length. Return the buffer instead
of an error flag to fix an uninitialised 'bp' warning in restore_data()
and just check mfd->eof again in the caller.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 43 ++++++++++++++++---------------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 43ac4251..0c541553 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -1054,15 +1054,15 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 	exit(0);
 }
 
-static int restore_block(struct metafd *mfd, struct saved_metablock *svb, char **buf, uint16_t maxlen)
+static char *restore_block(struct metafd *mfd, struct saved_metablock *svb)
 {
 	struct saved_metablock *svb_be;
 	const char *errstr;
-	uint16_t checklen;
+	char *buf = NULL;
 
 	svb_be = (struct saved_metablock *)(restore_buf_next(mfd, sizeof(*svb)));
 	if (svb_be == NULL)
-		goto read_err;
+		goto nobuffer;
 	svb->blk = be64_to_cpu(svb_be->blk);
 	svb->siglen = be16_to_cpu(svb_be->siglen);
 
@@ -1070,34 +1070,25 @@ static int restore_block(struct metafd *mfd, struct saved_metablock *svb, char *
 		fprintf(stderr, "Error: File system is too small to restore this metadata.\n");
 		fprintf(stderr, "File system is %llu blocks. Restore block = %llu\n",
 		        (unsigned long long)sbd.fssize, (unsigned long long)svb->blk);
-		return -1;
+		return NULL;
 	}
 
-	if (maxlen)
-		checklen = maxlen;
-	else
-		checklen = sbd.bsize;
-
-	if (checklen && svb->siglen > checklen) {
+	if (svb->siglen > sbd.bsize) {
 		fprintf(stderr, "Bad record length: %u for block %"PRIu64" (0x%"PRIx64").\n",
 			svb->siglen, svb->blk, svb->blk);
-		return -1;
-	}
-
-	if (buf != NULL && maxlen != 0) {
-		*buf = restore_buf_next(mfd, svb->siglen);
-		if (*buf == NULL)
-			goto read_err;
+		return NULL;
 	}
-	return 0;
 
-read_err:
+	buf = restore_buf_next(mfd, svb->siglen);
+	if (buf != NULL)
+		return buf;
+nobuffer:
 	if (mfd->eof)
-		return 1;
+		return NULL;
 
 	errstr = mfd->strerr(mfd);
 	fprintf(stderr, "Failed to restore block: %s\n", errstr);
-	return -1;
+	return NULL;
 }
 
 static int restore_super(struct metafd *mfd, char *buf, int printonly)
@@ -1127,7 +1118,6 @@ static int restore_data(int fd, struct metafd *mfd, int printonly)
 	struct saved_metablock savedata = {0};
 	uint64_t writes = 0;
 	char *buf;
-	char *bp;
 
 	buf = calloc(1, sbd.bsize);
 	if (buf == NULL) {
@@ -1137,16 +1127,15 @@ static int restore_data(int fd, struct metafd *mfd, int printonly)
 
 	blks_saved = 0;
 	while (TRUE) {
-		int err;
+		char *bp;
 
-		err = restore_block(mfd, &savedata, &bp, sbd.bsize);
-		if (err == 1)
+		bp = restore_block(mfd, &savedata);
+		if (bp == NULL && mfd->eof)
 			break;
-		if (err != 0) {
+		if (bp == NULL) {
 			free(buf);
 			return -1;
 		}
-
 		if (printonly) {
 			if (printonly > 1 && printonly == savedata.blk) {
 				display_block_type(bp, savedata.blk, TRUE);
-- 
2.26.2

