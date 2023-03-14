Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9DE6B95D6
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Mar 2023 14:18:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678799920;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KvKsvwbgvYiLUQVYdrJa/Ib86Qp1stkoX89C17FEKWc=;
	b=alHu4O2GiOspppyp+6XYjt/u+89hrMQ5WzFYvc/BKhjqiotUu+p3SkWEX7bxY+I3rVaGJj
	AY14B69PpZfHFWEle3qWLNZcjiQ5puvjiKovRQRgQasW5WSAF4F8t5SnvKbWSvNtEVVHx6
	MpmqpMnJQmu3SUs4vHQpGBrvzxzizyM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-WKuKXBP2PqqKfLusZ62OiA-1; Tue, 14 Mar 2023 09:18:37 -0400
X-MC-Unique: WKuKXBP2PqqKfLusZ62OiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 948EC385F373;
	Tue, 14 Mar 2023 13:18:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89CF0140EBF4;
	Tue, 14 Mar 2023 13:18:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5C38819465B6;
	Tue, 14 Mar 2023 13:18:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F328B1946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 14 Mar 2023 13:18:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E8ECA400F5D; Tue, 14 Mar 2023 13:18:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.36.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A8E1400F55;
 Tue, 14 Mar 2023 13:18:34 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: agruenba@redhat.com,
	rpeterso@redhat.com
Date: Tue, 14 Mar 2023 13:18:28 +0000
Message-Id: <20230314131829.18515-3-anprice@redhat.com>
In-Reply-To: <20230314131829.18515-1-anprice@redhat.com>
References: <20230314131829.18515-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH 2/3] gfs2: Remove ghs[] from gfs2_link
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

Replace the 2-item array with two variables for readability.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 fs/gfs2/inode.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 79eef9a0ebfc..9850267b9951 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -941,7 +941,7 @@ static int gfs2_link(struct dentry *old_dentry, struct inode *dir,
 	struct gfs2_sbd *sdp = GFS2_SB(dir);
 	struct inode *inode = d_inode(old_dentry);
 	struct gfs2_inode *ip = GFS2_I(inode);
-	struct gfs2_holder ghs[2];
+	struct gfs2_holder d_gh, gh;
 	struct buffer_head *dibh;
 	struct gfs2_diradd da = { .bh = NULL, .save_loc = 1, };
 	int error;
@@ -953,14 +953,14 @@ static int gfs2_link(struct dentry *old_dentry, struct inode *dir,
 	if (error)
 		return error;
 
-	gfs2_holder_init(dip->i_gl, LM_ST_EXCLUSIVE, 0, ghs);
-	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, ghs + 1);
+	gfs2_holder_init(dip->i_gl, LM_ST_EXCLUSIVE, 0, &d_gh);
+	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
 
-	error = gfs2_glock_nq(ghs); /* parent */
+	error = gfs2_glock_nq(&d_gh);
 	if (error)
 		goto out_parent;
 
-	error = gfs2_glock_nq(ghs + 1); /* child */
+	error = gfs2_glock_nq(&gh);
 	if (error)
 		goto out_child;
 
@@ -1046,13 +1046,13 @@ static int gfs2_link(struct dentry *old_dentry, struct inode *dir,
 		gfs2_quota_unlock(dip);
 out_gunlock:
 	gfs2_dir_no_add(&da);
-	gfs2_glock_dq(ghs + 1);
+	gfs2_glock_dq(&gh);
 out_child:
-	gfs2_glock_dq(ghs);
+	gfs2_glock_dq(&d_gh);
 out_parent:
 	gfs2_qa_put(dip);
-	gfs2_holder_uninit(ghs);
-	gfs2_holder_uninit(ghs + 1);
+	gfs2_holder_uninit(&d_gh);
+	gfs2_holder_uninit(&gh);
 	return error;
 }
 
-- 
2.39.2

