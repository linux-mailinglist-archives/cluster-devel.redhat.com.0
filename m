Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 828083511C6
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Apr 2021 11:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617268736;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OU8Ry5rlEDD3WL5XNAWR0vLmRooS2N+6XobLk64lDXQ=;
	b=IgB5XqAC7Tx2rS6FLcphqI5yMtRy+G2z41cQgMZnfr+McEEZvYXf6K9j/8upa6j2ykBH3T
	22PDsmbFJTJzN4EBuvsrYmzwUcHnoEV8K10Tl4Fu3Vvg1/ZsITVuBjaEMMOnG7h3oDFE4e
	YgYyoOyO4TmMFyE9qrgFiqeTaNTDxWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-kdMfgKl-NdGhBnYE9YNsVQ-1; Thu, 01 Apr 2021 05:18:55 -0400
X-MC-Unique: kdMfgKl-NdGhBnYE9YNsVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B113835BC3;
	Thu,  1 Apr 2021 09:18:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 296276F44D;
	Thu,  1 Apr 2021 09:18:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C5204A7CB;
	Thu,  1 Apr 2021 09:18:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1319InZF028085 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 05:18:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A6F626F13A; Thu,  1 Apr 2021 09:18:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2138614FC;
	Thu,  1 Apr 2021 09:18:48 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  1 Apr 2021 11:18:39 +0200
Message-Id: <20210401091839.2251916-5-agruenba@redhat.com>
In-Reply-To: <20210401091839.2251916-1-agruenba@redhat.com>
References: <20210401091839.2251916-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 4/4] gfs2: Turn gfs2_meta_indirect_buffer
	into gfs2_meta_buffer
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Instead of only supporting GFS2_METATYPE_DI and GFS2_METATYPE_IN blocks,
make the block type a parameter of gfs2_meta_indirect_buffer and rename
the function to gfs2_meta_buffer.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c    | 2 +-
 fs/gfs2/meta_io.c | 9 ++++-----
 fs/gfs2/meta_io.h | 6 +++---
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index bad5dc641bbd..ae9ba03fbd48 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -331,7 +331,7 @@ static int __fillup_metapath(struct gfs2_inode *ip, struct metapath *mp,
 
 		if (!dblock)
 			break;
-		ret = gfs2_meta_indirect_buffer(ip, x + 1, dblock, &mp->mp_bh[x + 1]);
+		ret = gfs2_meta_buffer(ip, GFS2_METATYPE_IN, dblock, &mp->mp_bh[x + 1]);
 		if (ret)
 			return ret;
 	}
diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 2db573e31f78..4946cbce1ab6 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -462,23 +462,22 @@ void gfs2_journal_wipe(struct gfs2_inode *ip, u64 bstart, u32 blen)
 }
 
 /**
- * gfs2_meta_indirect_buffer - Get a metadata buffer
+ * gfs2_meta_buffer - Get a metadata buffer
  * @ip: The GFS2 inode
- * @height: The level of this buf in the metadata (indir addr) tree (if any)
+ * @mtype: The block type (GFS2_METATYPE_*)
  * @num: The block number (device relative) of the buffer
  * @bhp: the buffer is returned here
  *
  * Returns: errno
  */
 
-int gfs2_meta_indirect_buffer(struct gfs2_inode *ip, int height, u64 num,
-			      struct buffer_head **bhp)
+int gfs2_meta_buffer(struct gfs2_inode *ip, u32 mtype, u64 num,
+		     struct buffer_head **bhp)
 {
 	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
 	struct gfs2_glock *gl = ip->i_gl;
 	struct buffer_head *bh;
 	int ret = 0;
-	u32 mtype = height ? GFS2_METATYPE_IN : GFS2_METATYPE_DI;
 	int rahead = 0;
 
 	if (num == ip->i_no_addr)
diff --git a/fs/gfs2/meta_io.h b/fs/gfs2/meta_io.h
index 4a8c01929b79..21880d72081a 100644
--- a/fs/gfs2/meta_io.h
+++ b/fs/gfs2/meta_io.h
@@ -61,13 +61,13 @@ enum {
 
 extern void gfs2_remove_from_journal(struct buffer_head *bh, int meta);
 extern void gfs2_journal_wipe(struct gfs2_inode *ip, u64 bstart, u32 blen);
-extern int gfs2_meta_indirect_buffer(struct gfs2_inode *ip, int height, u64 num,
-				     struct buffer_head **bhp);
+extern int gfs2_meta_buffer(struct gfs2_inode *ip, u32 mtype, u64 num,
+			    struct buffer_head **bhp);
 
 static inline int gfs2_meta_inode_buffer(struct gfs2_inode *ip,
 					 struct buffer_head **bhp)
 {
-	return gfs2_meta_indirect_buffer(ip, 0, ip->i_no_addr, bhp);
+	return gfs2_meta_buffer(ip, GFS2_METATYPE_DI, ip->i_no_addr, bhp);
 }
 
 struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl, u64 dblock, u32 extlen);
-- 
2.26.2

