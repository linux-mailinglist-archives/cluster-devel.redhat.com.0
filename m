Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E4FC926A844
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Sep 2020 17:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600182297;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ImW/1oR6y1qwAEixno/JsZ09Fi2F7kidEiWSFKC7co0=;
	b=MjEstQpq9a9Iw6rM7YdmzyHigwipK277AkiuTAAibpjl6NIc20rGQUfIfj3e7yUCADqwg7
	HqdrnMYPpoFZQSzhYcy7AGpLUiUHnry2uAeRGE0wCKnxZZw86v69q+lsq0Iiy/WA7r1GfQ
	UPJYUqJHs/rdDh6lz6ZDdEL7ZcMyf1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-6-2gUecrMjKX1KLL8TX0lQ-1; Tue, 15 Sep 2020 11:04:50 -0400
X-MC-Unique: 6-2gUecrMjKX1KLL8TX0lQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DE251021C4D;
	Tue, 15 Sep 2020 15:03:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70C807513D;
	Tue, 15 Sep 2020 15:03:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C08B183D022;
	Tue, 15 Sep 2020 15:03:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FF3P42016487 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 11:03:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F9387513D; Tue, 15 Sep 2020 15:03:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB8D775141
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 15:03:24 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 15 Sep 2020 16:03:22 +0100
Message-Id: <20200915150322.943522-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] savemeta: Progress reporting cleanup
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Simplify the progress report message to only display the number of
blocks saved and the progress percentage (which is based on the
previously-printed highest block number). Remove the word "saved" as
it's also used by restoremeta and change the function name to be more
descriptive.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 32e1f70d..a13e6a5f 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -399,13 +399,13 @@ static int get_gfs_struct_info(const char *buf, uint64_t owner, unsigned *block_
 	return 0;
 }
 
-/* Put out a warm, fuzzy message every second so the user     */
-/* doesn't think we hung.  (This may take a long time).       */
-/* We only check whether to report every one percent because  */
-/* checking every block kills performance.  We only report    */
-/* every second because we don't need 100 extra messages in   */
-/* logs made from verbose mode.                               */
-static void warm_fuzzy_stuff(uint64_t wfsblock, int force)
+/**
+ * Print a progress message if one second has elapsed since the last time.
+ * pblock: The latest block number processed
+ * force:  If this is non-zero, print immediately and add a newline after the
+ *         progress message.
+ */
+static void report_progress(uint64_t pblock, int force)
 {
         static struct timeval tv;
         static uint32_t seconds = 0;
@@ -419,11 +419,9 @@ static void warm_fuzzy_stuff(uint64_t wfsblock, int force)
 		seconds = tv.tv_sec;
 		if (sbd.fssize) {
 			printf("\r");
-			percent = (wfsblock * 100) / sbd.fssize;
-			printf("%llu blocks processed, %llu saved (%llu%%)",
-			       (unsigned long long)wfsblock,
-			       (unsigned long long)blks_saved,
-			       (unsigned long long)percent);
+			percent = (pblock * 100) / sbd.fssize;
+			printf("%"PRIu64" blocks saved (%"PRIu64"%% complete)",
+			       blks_saved, percent);
 			if (force)
 				printf("\n");
 			fflush(stdout);
@@ -810,7 +808,7 @@ static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, char *buf)
 			free(buf);
 			return 1;
 		}
-		warm_fuzzy_stuff(blk, FALSE);
+		report_progress(blk, 0);
 		if (gfs2_check_meta(buf, GFS2_METATYPE_LF) == 0) {
 			int ret = save_buf(mfd, buf, blk, sdp->bsize);
 			if (ret != 0) {
@@ -898,7 +896,7 @@ static void save_inode_data(struct metafd *mfd, char *ibuf, uint64_t iblk)
 
 				save_indirect_blocks(mfd, _buf, iblk, nextq, sizeof(_di.di_header));
 			}
-			warm_fuzzy_stuff(q->start + q->len, 0);
+			report_progress(q->start + q->len, 0);
 			block_range_free(&q);
 		}
 	}
@@ -1009,7 +1007,7 @@ static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
 				br.start = blk;
 				br.len = 1;
 			}
-			warm_fuzzy_stuff(blk, FALSE);
+			report_progress(blk, 0);
 		}
 		if (br.start != 0)
 			save_allocated_range(mfd, &br);
@@ -1072,7 +1070,7 @@ static void save_rgrp(struct gfs2_sbd *sdp, struct metafd *mfd, struct rgrp_tree
 	log_debug("RG at %"PRIu64" is %"PRIu32" long\n", addr, (uint32_t)rgd->ri.ri_length);
 	/* Save the rg and bitmaps */
 	for (unsigned i = 0; i < rgd->ri.ri_length; i++) {
-		warm_fuzzy_stuff(rgd->ri.ri_addr + i, FALSE);
+		report_progress(rgd->ri.ri_addr + i, 0);
 		save_buf(mfd, buf + (i * sdp->bsize), rgd->ri.ri_addr + i, sdp->bsize);
 	}
 	/* Save the other metadata: inodes, etc. if mode is not 'savergs' */
@@ -1199,7 +1197,7 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 	/* Clean up */
 	/* There may be a gap between end of file system and end of device */
 	/* so we tell the user that we've processed everything. */
-	warm_fuzzy_stuff(sbd.fssize, TRUE);
+	report_progress(sbd.fssize, 1);
 	printf("\nMetadata saved to file %s ", mfd.filename);
 	if (mfd.gziplevel) {
 		printf("(gzipped, level %d).\n", mfd.gziplevel);
@@ -1305,7 +1303,7 @@ static int restore_data(int fd, struct metafd *mfd, int printonly)
 				display_block_type(bp, savedata.blk, TRUE);
 			}
 		} else {
-			warm_fuzzy_stuff(savedata.blk, FALSE);
+			report_progress(savedata.blk, 0);
 			memcpy(buf, bp, savedata.siglen);
 			memset(buf + savedata.siglen, 0, sbd.bsize - savedata.siglen);
 			if (pwrite(fd, buf, sbd.bsize, savedata.blk * sbd.bsize) != sbd.bsize) {
@@ -1323,7 +1321,7 @@ static int restore_data(int fd, struct metafd *mfd, int printonly)
 		blks_saved++;
 	}
 	if (!printonly)
-		warm_fuzzy_stuff(sbd.fssize, 1);
+		report_progress(sbd.fssize, 1);
 	free(buf);
 	return 0;
 }
-- 
2.26.2

