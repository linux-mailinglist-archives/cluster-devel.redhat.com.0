Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 91B8123DAE2
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721130;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DlGCSpq35j9zI854o6WYaZk8wdrUBHBJH+F58+byKhg=;
	b=Q18XHXywGcLDzI7NG9qvUT/xJFEz2juKpVwA+3g9ulBY/BXeigv9pDESDOC41FCjpdraYE
	4MTLoC9ryy5wVm4voosqmkK0wmmzKa3ultZi9xLt4X/Q8V4SKZrXFFbaQzwK5baJUlR7Td
	+8LpSy3UsAtdjjPX3kzbSk0ZOzclqlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-qeAAAgK7N-ixGOGtEszBIQ-1; Thu, 06 Aug 2020 09:38:49 -0400
X-MC-Unique: qeAAAgK7N-ixGOGtEszBIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF48979ED0;
	Thu,  6 Aug 2020 13:38:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F9FC6111F;
	Thu,  6 Aug 2020 13:38:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D39496925;
	Thu,  6 Aug 2020 13:38:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DciZt030900 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70DE560C47; Thu,  6 Aug 2020 13:38:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DF9B70110
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:40 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:55 +0100
Message-Id: <20200806133807.111280-21-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 20/32] savemeta: Remove gfs2_buffer_head
	from save_bh() (and rename it)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Now that get_gfs_struct_info() accepts a char* we can make save_bh() the
true save_buf().

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 937fed48..1d47f46e 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -522,7 +522,7 @@ static int savemetaclose(struct metafd *mfd)
 	return close(mfd->fd);
 }
 
-static int save_buf(struct metafd *mfd, char *buf, uint64_t addr, unsigned blklen)
+static int do_save_buf(struct metafd *mfd, const char *buf, uint64_t addr, unsigned blklen)
 {
 	struct saved_metablock *savedata;
 	size_t outsz;
@@ -554,7 +554,7 @@ static int save_buf(struct metafd *mfd, char *buf, uint64_t addr, unsigned blkle
 	return 0;
 }
 
-static int save_bh(struct metafd *mfd, struct gfs2_buffer_head *savebh, uint64_t owner, int *blktype)
+static int save_buf(struct metafd *mfd, const char *buf, uint64_t addr, uint64_t owner, int *blktype)
 {
 	size_t blklen;
 
@@ -563,11 +563,11 @@ static int save_bh(struct metafd *mfd, struct gfs2_buffer_head *savebh, uint64_t
 	   because we want to know if the source inode is a system inode
 	   not the block within the inode "blk". They may or may not
 	   be the same thing. */
-	if (get_gfs_struct_info(savebh->b_data, owner, blktype, &blklen) &&
+	if (get_gfs_struct_info(buf, owner, blktype, &blklen) &&
 	    !block_is_systemfile(owner) && owner != 0)
 		return 0; /* Not metadata, and not system file, so skip it */
 
-	return save_buf(mfd, savebh->b_data, savebh->b_blocknr, blklen);
+	return do_save_buf(mfd, buf, addr, blklen);
 }
 
 static int save_block(int fd, struct metafd *mfd, uint64_t blk, uint64_t owner, int *blktype)
@@ -583,7 +583,7 @@ static int save_block(int fd, struct metafd *mfd, uint64_t blk, uint64_t owner,
 	savebh = bread(&sbd, blk);
 	if (savebh == NULL)
 		return 1;
-	err = save_bh(mfd, savebh, owner, blktype);
+	err = save_buf(mfd, savebh->b_data, blk, owner, blktype);
 	brelse(savebh);
 	return err;
 }
@@ -671,7 +671,7 @@ static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, uint64_t bl
 		}
 		warm_fuzzy_stuff(blk, FALSE);
 		if (gfs2_check_meta(bh->b_data, GFS2_METATYPE_LF) == 0) {
-			int ret = save_bh(mfd, bh, blk, NULL);
+			int ret = save_buf(mfd, bh->b_data, blk, blk, NULL);
 			if (ret != 0) {
 				brelse(bh);
 				return ret;
@@ -912,7 +912,7 @@ static void save_rgrp(struct gfs2_sbd *sdp, struct metafd *mfd, struct rgrp_tree
 	/* Save the rg and bitmaps */
 	for (unsigned i = 0; i < rgd->ri.ri_length; i++) {
 		warm_fuzzy_stuff(rgd->ri.ri_addr + i, FALSE);
-		save_buf(mfd, buf + (i * sdp->bsize), rgd->ri.ri_addr + i, sdp->bsize);
+		do_save_buf(mfd, buf + (i * sdp->bsize), rgd->ri.ri_addr + i, sdp->bsize);
 	}
 	/* Save the other metadata: inodes, etc. if mode is not 'savergs' */
 	if (withcontents)
-- 
2.26.2

