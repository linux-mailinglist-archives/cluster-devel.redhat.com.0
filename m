Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 41A2223DAEF
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:39:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721151;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EV+694mUN7CnYb8DcP6bTalLFjTS1c3M85TaUAmem5M=;
	b=Sqdv3WV4GUdes1jmzvO8QTUrBknDhNHGeE1Y/CzulP9QRgxD8TWnMt9UjtR4F8RoOT4nPc
	EZ/ly53mAJrztEosz0yTQubqX/z0R37R2WenbanxUPAzz0Q4a3m3sP3sva5h3/v8LXaszH
	LLw62zdoxmi9zjCAGbrKI+nZJCiP4Bo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-QK8mb6o0O1GVEiujSOrYsg-1; Thu, 06 Aug 2020 09:39:08 -0400
X-MC-Unique: QK8mb6o0O1GVEiujSOrYsg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CABD19253C6;
	Thu,  6 Aug 2020 13:39:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E0DE87A63;
	Thu,  6 Aug 2020 13:39:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 785891809561;
	Thu,  6 Aug 2020 13:39:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076Dd1Nd031076 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:39:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CBFC860BF1; Thu,  6 Aug 2020 13:39:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 239E16111F
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:39:00 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:38:07 +0100
Message-Id: <20200806133807.111280-33-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 32/32] restoremeta: Fix up superblock
	processing
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

Prior to 933c03b 'restoremeta: Metadata file reading overhaul'
restoremeta restored the superblock to gather information, did a seek
back to before the superblock and then carried on to restore the
superblock properly. When that commit removed the seeks it didn't add
new printing code for the superblock (for gfs2_edit printsavedmeta).
Add that missing printing code and make sure the filesystem information
is printed in the right order.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 759113fd..80c11c90 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -351,7 +351,10 @@ static int get_gfs_struct_info(const char *buf, uint64_t owner, unsigned *block_
 
 	switch (mh.mh_type) {
 	case GFS2_METATYPE_SB:   /* 1 (superblock) */
-		*gstruct_len = sizeof(struct gfs_sb);
+		if (sbd.gfs1)
+			*gstruct_len = sizeof(struct gfs_sb);
+		else
+			*gstruct_len = sizeof(struct gfs2_sb);
 		break;
 	case GFS2_METATYPE_RG:   /* 2 (rsrc grp hdr) */
 		*gstruct_len = sbd.bsize; /*sizeof(struct gfs_rgrp);*/
@@ -1151,7 +1154,10 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 	sb_addr = GFS2_SB_ADDR * GFS2_BASIC_BLOCK / sbd.bsize;
 	buf = check_read_block(sbd.device_fd, sb_addr, 0, NULL, NULL);
 	if (buf != NULL) {
-		save_buf(&mfd, buf, sb_addr, sizeof(struct gfs_sb));
+		if (sbd.gfs1)
+			save_buf(&mfd, buf, sb_addr, sizeof(struct gfs_sb));
+		else
+			save_buf(&mfd, buf, sb_addr, sizeof(struct gfs2_sb));
 		free(buf);
 	}
 	/* If this is gfs1, save off the rindex because it's not
@@ -1263,7 +1269,7 @@ static int restore_super(struct metafd *mfd, char *buf, int printonly)
 		fprintf(stderr, "Failed to write superblock\n");
 		return -1;
 	}
-	printf("Block size is %uB\n", sbd.bsize);
+	blks_saved++;
 	return 0;
 }
 
@@ -1279,7 +1285,6 @@ static int restore_data(int fd, struct metafd *mfd, int printonly)
 		exit(1);
 	}
 
-	blks_saved = 0;
 	while (TRUE) {
 		char *bp;
 
@@ -1338,6 +1343,7 @@ static int restore_init(const char *path, struct metafd *mfd, struct savemeta_he
 	char *bp;
 	int ret;
 
+	blks_saved = 0;
 	restore_buf = malloc(RESTORE_BUF_SIZE);
 	if (restore_buf == NULL) {
 		perror("Restore failed");
@@ -1379,11 +1385,26 @@ static int restore_init(const char *path, struct metafd *mfd, struct savemeta_he
 		fprintf(stderr, "No superblock found in metadata file\n");
 		return -1;
 	}
-	ret = restore_super(mfd, bp + sizeof(struct saved_metablock), printonly);
+	bp += sizeof(struct saved_metablock);
+	ret = restore_super(mfd, bp, printonly);
 	if (ret != 0)
 		return ret;
 
-	bp += sizeof(struct saved_metablock) + sb_siglen;
+	if (smh->sh_fs_bytes > 0) {
+		sbd.fssize = smh->sh_fs_bytes / sbd.bsize;
+		printf("Saved file system size is %"PRIu64" blocks, %.2fGB\n",
+		       sbd.fssize, smh->sh_fs_bytes / ((float)(1 << 30)));
+	}
+	printf("Block size is %uB\n", sbd.bsize);
+	printf("This is gfs%c metadata.\n", sbd.gfs1 ? '1': '2');
+	if (printonly > 1 && printonly == LGFS2_SB_ADDR(&sbd)) {
+		display_block_type(bp, LGFS2_SB_ADDR(&sbd), TRUE);
+		display_gfs2(bp);
+	} else if (printonly == 1) {
+		print_gfs2("0 (l=0x%x): ", sb_siglen);
+		display_block_type(bp, LGFS2_SB_ADDR(&sbd), TRUE);
+	}
+	bp += sb_siglen;
 	restore_off = bp - restore_buf;
 	restore_left -= restore_off;
 	return 0;
@@ -1414,14 +1435,6 @@ void restoremeta(const char *in_fn, const char *out_device, uint64_t printonly)
 	if (error != 0)
 		exit(error);
 
-	if (smh.sh_fs_bytes > 0) {
-		sbd.fssize = smh.sh_fs_bytes / sbd.bsize;
-		printf("Saved file system size is %"PRIu64" blocks, %.2fGB\n",
-		       sbd.fssize, smh.sh_fs_bytes / ((float)(1 << 30)));
-	}
-
-	printf("This is gfs%c metadata.\n", sbd.gfs1 ? '1': '2');
-
 	if (!printonly) {
 		uint64_t space = lseek(sbd.device_fd, 0, SEEK_END) / sbd.bsize;
 		printf("There are %"PRIu64" free blocks on the destination device.\n", space);
-- 
2.26.2

