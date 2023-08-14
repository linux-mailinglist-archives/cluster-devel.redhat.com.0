Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4AF77C224
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Aug 2023 23:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692047492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pArjaDFSJm/PaSO+le75amYj6A0iIy9B3F5/c/CEF10=;
	b=QXWtt6yR60slIKzAZSoNeG8qjGkumuwCi8PNIX3nKv+5x9SmQ5lu4ESS7ZAjm461oMbvyM
	KBBVJPCjax7mzPYq1ziJRlVXvVbh5GEfd7IQykdXgM6A22prqdLPv091maOx58LcmaqU/B
	1yvfeI3VMSo2ruzJzryBWqDF05BjNAw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-8TDjYQeVNkab2_Kp2eJldg-1; Mon, 14 Aug 2023 17:11:27 -0400
X-MC-Unique: 8TDjYQeVNkab2_Kp2eJldg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCD4185C70F;
	Mon, 14 Aug 2023 21:11:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41452492C13;
	Mon, 14 Aug 2023 21:11:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0B6BE19465B2;
	Mon, 14 Aug 2023 21:11:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C2D181946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 14 Aug 2023 21:11:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A3EB5C159F2; Mon, 14 Aug 2023 21:11:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54666C15BAE;
 Mon, 14 Aug 2023 21:11:24 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: linux-nfs@vger.kernel.org
Date: Mon, 14 Aug 2023 17:11:16 -0400
Message-Id: <20230814211116.3224759-8-aahringo@redhat.com>
In-Reply-To: <20230814211116.3224759-1-aahringo@redhat.com>
References: <20230814211116.3224759-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [RFCv2 7/7] dlm: implement EXPORT_OP_SAFE_ASYNC_LOCK
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
Cc: jlayton@kernel.org, cluster-devel@redhat.com, ocfs2-devel@lists.linux.dev,
 chuck.lever@oracle.com, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch is activating the EXPORT_OP_SAFE_ASYNC_LOCK export flag to
signal lockd that both filesystems are able to handle async lock
requests. The cluster filesystems gfs2 and ocfs2 will redirect their
lock requests to DLMs plock implementation that can handle async lock
requests.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/gfs2/export.c  | 1 +
 fs/ocfs2/export.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fs/gfs2/export.c b/fs/gfs2/export.c
index cf40895233f5..36bc43b9d141 100644
--- a/fs/gfs2/export.c
+++ b/fs/gfs2/export.c
@@ -192,5 +192,6 @@ const struct export_operations gfs2_export_ops = {
 	.fh_to_parent = gfs2_fh_to_parent,
 	.get_name = gfs2_get_name,
 	.get_parent = gfs2_get_parent,
+	.flags = EXPORT_OP_SAFE_ASYNC_LOCK,
 };
 
diff --git a/fs/ocfs2/export.c b/fs/ocfs2/export.c
index eaa8c80ace3c..8a1169e01dd9 100644
--- a/fs/ocfs2/export.c
+++ b/fs/ocfs2/export.c
@@ -280,4 +280,5 @@ const struct export_operations ocfs2_export_ops = {
 	.fh_to_dentry	= ocfs2_fh_to_dentry,
 	.fh_to_parent	= ocfs2_fh_to_parent,
 	.get_parent	= ocfs2_get_parent,
+	.flags		= EXPORT_OP_SAFE_ASYNC_LOCK,
 };
-- 
2.31.1

