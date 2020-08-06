Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7F723DAE1
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721126;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HRisM/AuA6NG0hiJMkrtxfI3yBgcRFAYFfE5S8KtYc0=;
	b=YFAZ8i2PiAFS4ru/K7ke5055HNBb4bglwI44VzVIDTfOuG81r2tDkUf/PB0MyfL99sCjJ0
	pySYlE0i4aYjNgeX1FHaqWmN5s1orm+8hvb+kon/p4+XmNcBsRQgYnMSUFSwvWE5oMxCzX
	VPK8AMsknKpzgQaKhvGEt4tn3rtBoOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-laybCkqEMeOa_LUGRPPWtA-1; Thu, 06 Aug 2020 09:38:44 -0400
X-MC-Unique: laybCkqEMeOa_LUGRPPWtA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B7DC79EC2;
	Thu,  6 Aug 2020 13:38:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ADFB5DA6A;
	Thu,  6 Aug 2020 13:38:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1831496939;
	Thu,  6 Aug 2020 13:38:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DceVH030864 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B0CB59; Thu,  6 Aug 2020 13:38:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E790860C47
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:39 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:54 +0100
Message-Id: <20200806133807.111280-20-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 19/32] savemeta: Remove gfs2_buffer_head
	from get_gfs_struct_info()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Now that di_save_len() accepts a char* this function can too.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 249b49af..937fed48 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -320,7 +320,7 @@ static size_t di_save_len(const char *buf, uint64_t owner)
 /*
  * get_gfs_struct_info - get block type and structure length
  *
- * @lbh - The block buffer to examine
+ * @buf - The block buffer to examine
  * @owner - The block address of the parent structure
  * @block_type - pointer to integer to hold the block type
  * @gstruct_len - pointer to integer to hold the structure length
@@ -328,8 +328,8 @@ static size_t di_save_len(const char *buf, uint64_t owner)
  * returns: 0 if successful
  *          -1 if this isn't gfs metadata.
  */
-static int get_gfs_struct_info(struct gfs2_buffer_head *lbh, uint64_t owner,
-                               int *block_type, size_t *gstruct_len)
+static int get_gfs_struct_info(const char *buf, uint64_t owner, int *block_type,
+                               size_t *gstruct_len)
 {
 	struct gfs2_meta_header mh;
 
@@ -337,7 +337,7 @@ static int get_gfs_struct_info(struct gfs2_buffer_head *lbh, uint64_t owner,
 		*block_type = 0;
 	*gstruct_len = sbd.bsize;
 
-	gfs2_meta_header_in(&mh, lbh->b_data);
+	gfs2_meta_header_in(&mh, buf);
 	if (mh.mh_magic != GFS2_MAGIC)
 		return -1;
 
@@ -355,7 +355,7 @@ static int get_gfs_struct_info(struct gfs2_buffer_head *lbh, uint64_t owner,
 		*gstruct_len = sbd.bsize;
 		break;
 	case GFS2_METATYPE_DI:   /* 4 (disk inode) */
-		*gstruct_len = di_save_len(lbh->b_data, owner);
+		*gstruct_len = di_save_len(buf, owner);
 		break;
 	case GFS2_METATYPE_IN:   /* 5 (indir inode blklst) */
 		*gstruct_len = sbd.bsize; /*sizeof(struct gfs_indirect);*/
@@ -563,7 +563,7 @@ static int save_bh(struct metafd *mfd, struct gfs2_buffer_head *savebh, uint64_t
 	   because we want to know if the source inode is a system inode
 	   not the block within the inode "blk". They may or may not
 	   be the same thing. */
-	if (get_gfs_struct_info(savebh, owner, blktype, &blklen) &&
+	if (get_gfs_struct_info(savebh->b_data, owner, blktype, &blklen) &&
 	    !block_is_systemfile(owner) && owner != 0)
 		return 0; /* Not metadata, and not system file, so skip it */
 
-- 
2.26.2

