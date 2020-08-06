Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7085523DAD8
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721114;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dWJDHTcIHB7Efq7xa1k0v78TY4eDASQ8kjpSumNnN3A=;
	b=erAMPLnvC0rOd9G1BYOn/srERq8HCdkObjL84wRiCaEREkRVnEDJkiyOluQuUQZlLKsDaj
	a5UCzPyJLvbYxUo9Ih8J7J/BiWkSSgWFFGHTHQyJ+j2XoHebEQxhbWzCzfyKouJTA7DgEO
	ypNcqrhKehirv4hD0WVCdhpHQXPCABg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-2NMqGv0jNN2eohusPzkgjA-1; Thu, 06 Aug 2020 09:38:32 -0400
X-MC-Unique: 2NMqGv0jNN2eohusPzkgjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D626E809B66;
	Thu,  6 Aug 2020 13:38:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5DF219C4F;
	Thu,  6 Aug 2020 13:38:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B14C31809554;
	Thu,  6 Aug 2020 13:38:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcQLU030752 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E06160C47; Thu,  6 Aug 2020 13:38:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFA9660BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:25 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:46 +0100
Message-Id: <20200806133807.111280-12-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 11/32] libgfs2: No need to use
	gfs2_buffer_head in metapointer()
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

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/fs_ops.c | 6 +++---
 gfs2/libgfs2/gfs1.c   | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index ee512f67..77648a16 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -15,14 +15,14 @@
 #include "libgfs2.h"
 #include "rgrp.h"
 
-static __inline__ uint64_t *metapointer(struct gfs2_buffer_head *bh,
+static __inline__ uint64_t *metapointer(char *buf,
 					unsigned int height,
 					struct metapath *mp)
 {
 	unsigned int head_size = (height > 0) ?
 		sizeof(struct gfs2_meta_header) : sizeof(struct gfs2_dinode);
 
-	return ((uint64_t *)(bh->b_data + head_size)) + mp->mp_list[height];
+	return ((uint64_t *)(buf + head_size)) + mp->mp_list[height];
 }
 
 /* Detect directory is a stuffed inode */
@@ -447,7 +447,7 @@ void lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 		  unsigned int height, struct metapath *mp,
 		  int create, int *new, uint64_t *block)
 {
-	uint64_t *ptr = metapointer(bh, height, mp);
+	uint64_t *ptr = metapointer(bh->b_data, height, mp);
 
 	if (*ptr) {
 		*block = be64_to_cpu(*ptr);
diff --git a/gfs2/libgfs2/gfs1.c b/gfs2/libgfs2/gfs1.c
index 29e4f12d..da2a0804 100644
--- a/gfs2/libgfs2/gfs1.c
+++ b/gfs2/libgfs2/gfs1.c
@@ -25,13 +25,12 @@ static __inline__ int fs_is_jdata(struct gfs2_inode *ip)
 }
 
 static __inline__ uint64_t *
-gfs1_metapointer(struct gfs2_buffer_head *bh, unsigned int height,
-		 struct metapath *mp)
+gfs1_metapointer(char *buf, unsigned int height, struct metapath *mp)
 {
 	unsigned int head_size = (height > 0) ?
 		sizeof(struct gfs_indirect) : sizeof(struct gfs_dinode);
 
-	return ((uint64_t *)(bh->b_data + head_size)) + mp->mp_list[height];
+	return ((uint64_t *)(buf + head_size)) + mp->mp_list[height];
 }
 
 int is_gfs_dir(struct gfs2_dinode *dinode)
@@ -45,7 +44,7 @@ void gfs1_lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 		  unsigned int height, struct metapath *mp,
 		  int create, int *new, uint64_t *block)
 {
-	uint64_t *ptr = gfs1_metapointer(bh, height, mp);
+	uint64_t *ptr = gfs1_metapointer(bh->b_data, height, mp);
 
 	if (*ptr) {
 		*block = be64_to_cpu(*ptr);
-- 
2.26.2

