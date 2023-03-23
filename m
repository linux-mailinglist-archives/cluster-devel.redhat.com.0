Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D766C6D66
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Mar 2023 17:26:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679588775;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GiMOg19yFneGt5gmYZ5LcipPJGOLRZPu4pgOBH/w/84=;
	b=QDTk5cMXYLPAV+dTH4S5mvYNkKrqmjqm6O2q1i2dft76vnjt3BZZl+2+W+Rb656APweyWj
	H28evYKys4SrL3exur4lHSj/UtvXvRAE8PVk8G0UHuerHkXOMUMN3dQmmSnRevHlWtAd7g
	plFAvn9NWXDm+UrB7+qXf2+C9JlQ0gY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-Hq2j0uX8NECeeTX5eFMqMQ-1; Thu, 23 Mar 2023 12:26:11 -0400
X-MC-Unique: Hq2j0uX8NECeeTX5eFMqMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 150671C0950C;
	Thu, 23 Mar 2023 16:26:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE85AC15BAD;
	Thu, 23 Mar 2023 16:26:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 390BA19465BD;
	Thu, 23 Mar 2023 16:26:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3DF511946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Mar 2023 16:26:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2213E463E03; Thu, 23 Mar 2023 16:26:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.net (unknown [10.2.16.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD54B463E09
 for <cluster-devel@redhat.com>; Thu, 23 Mar 2023 16:26:04 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 Mar 2023 12:26:02 -0400
Message-Id: <20230323162602.1984912-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH] Revert "Revert "GFS2: free disk inode which
 is deleted by remote node -V2""
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

It turns out that reverting 970343cd4904 causes a regression related to
evicting inodes that were unlinked on a different cluster node.

We could also have simply added a call to d_mark_dontcache to function
gfs2_try_evict but the original pre-revert code is better tested and
proven.

This reverts commit 445cb1277e10d7e19b631ef8a64aa3f055df377d.
---
 fs/gfs2/dentry.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/gfs2/dentry.c b/fs/gfs2/dentry.c
index 6fe9ca253b70..2e215e8c3c88 100644
--- a/fs/gfs2/dentry.c
+++ b/fs/gfs2/dentry.c
@@ -83,8 +83,26 @@ static int gfs2_dhash(const struct dentry *dentry, struct qstr *str)
 	return 0;
 }
 
+static int gfs2_dentry_delete(const struct dentry *dentry)
+{
+	struct gfs2_inode *ginode;
+
+	if (d_really_is_negative(dentry))
+		return 0;
+
+	ginode = GFS2_I(d_inode(dentry));
+	if (!gfs2_holder_initialized(&ginode->i_iopen_gh))
+		return 0;
+
+	if (test_bit(GLF_DEMOTE, &ginode->i_iopen_gh.gh_gl->gl_flags))
+		return 1;
+
+	return 0;
+}
+
 const struct dentry_operations gfs2_dops = {
 	.d_revalidate = gfs2_drevalidate,
 	.d_hash = gfs2_dhash,
+	.d_delete = gfs2_dentry_delete,
 };
 
-- 
2.39.2

