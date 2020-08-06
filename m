Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE1723DAE3
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721132;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3NcHXZlSQhtN/EdrHNqOi2eQPWJI+dkQ/9oNsOZzTgg=;
	b=AXl1EhuxsOyj6utuxElBMmwpH09U/0ELSXBZVPYqivex0Mqet6Z2xhL3+71SL3y/2qf7Oa
	cGjS8/Jw61dljf/5KkjxX8p0+rJrAzTfkKJNrrrxltmYP9W/hPSpFprGhTaP7HY7PHki8l
	aKUqpzQcsja5R97juO4o7DAIA9q3N4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-_diyNsSdODmgczBaztj4aA-1; Thu, 06 Aug 2020 09:38:51 -0400
X-MC-Unique: _diyNsSdODmgczBaztj4aA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9157279EC1;
	Thu,  6 Aug 2020 13:38:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80BC019C71;
	Thu,  6 Aug 2020 13:38:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C9DC1809557;
	Thu,  6 Aug 2020 13:38:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076Dcj85030911 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8973159; Thu,  6 Aug 2020 13:38:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB54260C47
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:44 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:56 +0100
Message-Id: <20200806133807.111280-22-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 21/32] savemeta: Don't use gfs2_buffer_head
	in save_leaf_chain()
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

Now that we can use save_buf() without a bh, we can save some
allocations by using one buffer for every block in the chain.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 1d47f46e..47c998c9 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -658,30 +658,40 @@ static void save_indirect_blocks(struct metafd *mfd, osi_list_t *cur_list,
 
 static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, uint64_t blk)
 {
-	struct gfs2_buffer_head *bh;
 	struct gfs2_leaf leaf;
+	char *buf = calloc(1, sdp->bsize);
+
+	if (buf == NULL) {
+		perror("Failed to save leaf blocks");
+		return 1;
+	}
 
 	do {
+		ssize_t r;
+
 		if (gfs2_check_range(sdp, blk) != 0)
 			return 0;
-		bh = bread(sdp, blk);
-		if (bh == NULL) {
-			perror("Failed to read leaf block");
+
+		r = pread(sdp->device_fd, buf, sdp->bsize, sdp->bsize * blk);
+		if (r != sdp->bsize) {
+			fprintf(stderr, "Failed to read leaf block %"PRIx64": %s\n",
+			        blk, strerror(errno));
+			free(buf);
 			return 1;
 		}
 		warm_fuzzy_stuff(blk, FALSE);
-		if (gfs2_check_meta(bh->b_data, GFS2_METATYPE_LF) == 0) {
-			int ret = save_buf(mfd, bh->b_data, blk, blk, NULL);
+		if (gfs2_check_meta(buf, GFS2_METATYPE_LF) == 0) {
+			int ret = save_buf(mfd, buf, blk, blk, NULL);
 			if (ret != 0) {
-				brelse(bh);
+				free(buf);
 				return ret;
 			}
 		}
-		gfs2_leaf_in(&leaf, bh->b_data);
-		brelse(bh);
+		gfs2_leaf_in(&leaf, buf);
 		blk = leaf.lf_next;
 	} while (leaf.lf_next != 0);
 
+	free(buf);
 	return 0;
 }
 
-- 
2.26.2

