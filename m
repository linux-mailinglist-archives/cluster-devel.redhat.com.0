Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 758F56B95DB
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Mar 2023 14:18:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678799923;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qBzPWQgALLgaob1q/5E3QwF7/XBR1kXHpxnvUXspng8=;
	b=Yz1cuNal4gICnb7ajXiekzwjc9oasJ3ZYSxU3PpzSEouo7k4TrWA5Cy6lgdDJ7mITbHIFZ
	Rb+gr/WEJZE8ZjJi7wNM4BEiliRaGEnd2m9uK8tADICHvo6brK1c0WYXb9z+g0Z4owQAXQ
	uiP7bAQ3Zn1BYMECrEjDyqIyH6R16DU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-DdMpj2awOm-dxN7-JQwWtA-1; Tue, 14 Mar 2023 09:18:37 -0400
X-MC-Unique: DdMpj2awOm-dxN7-JQwWtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D15A23C10236;
	Tue, 14 Mar 2023 13:18:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5E38140E95F;
	Tue, 14 Mar 2023 13:18:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AA8DE19465B2;
	Tue, 14 Mar 2023 13:18:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D89831946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 14 Mar 2023 13:18:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BAA6B401042; Tue, 14 Mar 2023 13:18:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.36.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 245A3400F4F;
 Tue, 14 Mar 2023 13:18:35 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: agruenba@redhat.com,
	rpeterso@redhat.com
Date: Tue, 14 Mar 2023 13:18:29 +0000
Message-Id: <20230314131829.18515-4-anprice@redhat.com>
In-Reply-To: <20230314131829.18515-1-anprice@redhat.com>
References: <20230314131829.18515-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH 3/3] gfs2: Remove ghs[] from gfs2_unlink
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Replace the 3-item array with three variables for readability.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 fs/gfs2/inode.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 9850267b9951..17c994a0c0d0 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -1143,7 +1143,7 @@ static int gfs2_unlink(struct inode *dir, struct dentry *dentry)
 	struct gfs2_sbd *sdp = GFS2_SB(dir);
 	struct inode *inode = d_inode(dentry);
 	struct gfs2_inode *ip = GFS2_I(inode);
-	struct gfs2_holder ghs[3];
+	struct gfs2_holder d_gh, r_gh, gh;
 	struct gfs2_rgrpd *rgd;
 	int error;
 
@@ -1153,21 +1153,21 @@ static int gfs2_unlink(struct inode *dir, struct dentry *dentry)
 
 	error = -EROFS;
 
-	gfs2_holder_init(dip->i_gl, LM_ST_EXCLUSIVE, 0, ghs);
-	gfs2_holder_init(ip->i_gl,  LM_ST_EXCLUSIVE, 0, ghs + 1);
+	gfs2_holder_init(dip->i_gl, LM_ST_EXCLUSIVE, 0, &d_gh);
+	gfs2_holder_init(ip->i_gl,  LM_ST_EXCLUSIVE, 0, &gh);
 
 	rgd = gfs2_blk2rgrpd(sdp, ip->i_no_addr, 1);
 	if (!rgd)
 		goto out_inodes;
 
-	gfs2_holder_init(rgd->rd_gl, LM_ST_EXCLUSIVE, LM_FLAG_NODE_SCOPE, ghs + 2);
+	gfs2_holder_init(rgd->rd_gl, LM_ST_EXCLUSIVE, LM_FLAG_NODE_SCOPE, &r_gh);
 
 
-	error = gfs2_glock_nq(ghs); /* parent */
+	error = gfs2_glock_nq(&d_gh);
 	if (error)
 		goto out_parent;
 
-	error = gfs2_glock_nq(ghs + 1); /* child */
+	error = gfs2_glock_nq(&gh);
 	if (error)
 		goto out_child;
 
@@ -1181,7 +1181,7 @@ static int gfs2_unlink(struct inode *dir, struct dentry *dentry)
 			goto out_rgrp;
 	}
 
-	error = gfs2_glock_nq(ghs + 2); /* rgrp */
+	error = gfs2_glock_nq(&r_gh); /* rgrp */
 	if (error)
 		goto out_rgrp;
 
@@ -1197,16 +1197,16 @@ static int gfs2_unlink(struct inode *dir, struct dentry *dentry)
 	gfs2_trans_end(sdp);
 
 out_gunlock:
-	gfs2_glock_dq(ghs + 2);
+	gfs2_glock_dq(&r_gh);
 out_rgrp:
-	gfs2_glock_dq(ghs + 1);
+	gfs2_glock_dq(&gh);
 out_child:
-	gfs2_glock_dq(ghs);
+	gfs2_glock_dq(&d_gh);
 out_parent:
-	gfs2_holder_uninit(ghs + 2);
+	gfs2_holder_uninit(&r_gh);
 out_inodes:
-	gfs2_holder_uninit(ghs + 1);
-	gfs2_holder_uninit(ghs);
+	gfs2_holder_uninit(&gh);
+	gfs2_holder_uninit(&d_gh);
 	return error;
 }
 
-- 
2.39.2

