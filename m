Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C75356DB281
	for <lists+cluster-devel@lfdr.de>; Fri,  7 Apr 2023 20:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680891000;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tmyysGP4nojy7mqvg4JpAIwd4kK+OFFvCZ5wIq5cXfU=;
	b=TUgZSalxvIujsF5rrc1ZQgEG09m2JD6edatuJ7lsoaEHiQif9XEo3D5XAWsWOfz5mdFTO6
	AJzSLC4OUl4Nwe19m2MWc5z0I9ITU1tO0Nkeshey1mzWRu9pOpBKHr1/kaFD712H0DKHUB
	H9KndWqnYgiCAeVjMhYyV3B2DnGNGNA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-6C_M5dAmPf-xwtN2slIYRg-1; Fri, 07 Apr 2023 14:09:56 -0400
X-MC-Unique: 6C_M5dAmPf-xwtN2slIYRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5158B185A78F;
	Fri,  7 Apr 2023 18:09:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 472381415127;
	Fri,  7 Apr 2023 18:09:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F1E3E1946A40;
	Fri,  7 Apr 2023 18:09:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 139FC19465BB for <cluster-devel@listman.corp.redhat.com>;
 Fri,  7 Apr 2023 18:09:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B41BD1121315; Fri,  7 Apr 2023 18:09:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.net (unknown [10.2.17.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A00F1121314
 for <cluster-devel@redhat.com>; Fri,  7 Apr 2023 18:09:53 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  7 Apr 2023 14:09:51 -0400
Message-Id: <20230407180951.106963-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH] gfs2: Eliminate gfs2_trim_blocks
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Function gfs2_trim_blocks is not referenced. Eliminate it.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c | 8 --------
 fs/gfs2/bmap.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index eedf6926c652..c739b258a2d9 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -2035,14 +2035,6 @@ static int do_shrink(struct inode *inode, u64 newsize)
 	return error;
 }
 
-void gfs2_trim_blocks(struct inode *inode)
-{
-	int ret;
-
-	ret = do_shrink(inode, inode->i_size);
-	WARN_ON(ret != 0);
-}
-
 /**
  * do_grow - Touch and update inode size
  * @inode: The inode
diff --git a/fs/gfs2/bmap.h b/fs/gfs2/bmap.h
index 53cce6c08e81..e5b7d17131ed 100644
--- a/fs/gfs2/bmap.h
+++ b/fs/gfs2/bmap.h
@@ -58,7 +58,6 @@ extern int gfs2_get_extent(struct inode *inode, u64 lblock, u64 *dblock,
 extern int gfs2_alloc_extent(struct inode *inode, u64 lblock, u64 *dblock,
 			     unsigned *extlen, bool *new);
 extern int gfs2_setattr_size(struct inode *inode, u64 size);
-extern void gfs2_trim_blocks(struct inode *inode);
 extern int gfs2_truncatei_resume(struct gfs2_inode *ip);
 extern int gfs2_file_dealloc(struct gfs2_inode *ip);
 extern int gfs2_write_alloc_required(struct gfs2_inode *ip, u64 offset,
-- 
2.39.2

