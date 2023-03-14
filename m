Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0856B95DA
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Mar 2023 14:18:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678799922;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nJoUVrFmL8UkBqtyQU87ISdwHHh4rZmeFrvp2vfj2w0=;
	b=iMlSdEbUrffkkHAzy66fZqb4yfUeIhWxrbjXle2/mJSf3on1AdW85J+qSyA6wIiXteroLV
	gShmViVPLeoDws8VJbZ6KzbZsG+t5HQ6cjp8puaItFG5HgdMrK84rpTToF2MoarUx3ptk4
	EmrQwIm8bU6PfKnHHizNXxBjM4UYpt4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-ActiJ3KSNoCQ9E2dX7amDw-1; Tue, 14 Mar 2023 09:18:37 -0400
X-MC-Unique: ActiJ3KSNoCQ9E2dX7amDw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84F35280AA4E;
	Tue, 14 Mar 2023 13:18:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B776400F5D;
	Tue, 14 Mar 2023 13:18:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 50E6019465B2;
	Tue, 14 Mar 2023 13:18:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 18AA61946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 14 Mar 2023 13:18:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0A0DA401042; Tue, 14 Mar 2023 13:18:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.36.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70E90400F4F;
 Tue, 14 Mar 2023 13:18:33 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: agruenba@redhat.com,
	rpeterso@redhat.com
Date: Tue, 14 Mar 2023 13:18:27 +0000
Message-Id: <20230314131829.18515-2-anprice@redhat.com>
In-Reply-To: <20230314131829.18515-1-anprice@redhat.com>
References: <20230314131829.18515-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH 1/3] gfs2: Remove duplicate i_nlink check
 from gfs2_link()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The duplication is:

    struct gfs2_inode *ip = GFS2_I(inode);
    [...]
    error = -ENOENT;
    if (inode->i_nlink == 0)
        goto out_gunlock;
    [...]
    error = -EINVAL;
    if (!ip->i_inode.i_nlink)
        goto out_gunlock;

The second check is removed. ENOENT is the correct error code for
attempts to link a deleted inode (ref: link(2)).

If we support O_TMPFILE in future the check will need to be updated with
an exception for inodes flagged I_LINKABLE so sorting out this
duplication now will make it a slightly cleaner change.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 fs/gfs2/inode.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 1291b5ee3584..79eef9a0ebfc 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -992,9 +992,6 @@ static int gfs2_link(struct dentry *old_dentry, struct inode *dir,
 	error = -EPERM;
 	if (IS_IMMUTABLE(inode) || IS_APPEND(inode))
 		goto out_gunlock;
-	error = -EINVAL;
-	if (!ip->i_inode.i_nlink)
-		goto out_gunlock;
 	error = -EMLINK;
 	if (ip->i_inode.i_nlink == (u32)-1)
 		goto out_gunlock;
-- 
2.39.2

