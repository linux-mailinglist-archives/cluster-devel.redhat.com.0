Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0481C703385
	for <lists+cluster-devel@lfdr.de>; Mon, 15 May 2023 18:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684168690;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=shBA6NSN3EpKwEdrESKehRaJ1TNL4a7+tlDtLiMSKuk=;
	b=cMvxyoRpKk0wbNyQ2iV2GOoqM9WgzLApo8sgM4skd+jbPR2qqIx8MVgS50hE/hrNZTUld5
	FeAo6lja54Xl3AfWQs/iGFE6pb6Ne0gQAmGGAzhTTFiEo8MWov3MiEqCcyMCrcU9xYKgVX
	jYpg3xWyXN9OK5e0CGlEMd0ZZGqwOrE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-JVM8I8YsNLWCiQfgxTDhnw-1; Mon, 15 May 2023 12:38:06 -0400
X-MC-Unique: JVM8I8YsNLWCiQfgxTDhnw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D5B280080E;
	Mon, 15 May 2023 16:38:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A87FE63F3D;
	Mon, 15 May 2023 16:38:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B798919465A3;
	Mon, 15 May 2023 16:37:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 75915194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 15 May 2023 16:37:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0DBE74078906; Mon, 15 May 2023 16:37:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.22.33.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9AF140C6EC4
 for <cluster-devel@redhat.com>; Mon, 15 May 2023 16:37:57 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 15 May 2023 11:37:57 -0500
Message-Id: <20230515163757.13476-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH] gfs2: Fix gfs2_qa_get imbalance in
 gfs2_quota_hold
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

This patch fixes a case in which function gfs2_quota_hold encounters an
assert error and exits. The lack of gfs2_qa_put causes further problems
when the inode is evicted and the get/put count is non-zero.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/quota.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 1ed17226d9ed..386ca770ce2e 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -591,6 +591,7 @@ int gfs2_quota_hold(struct gfs2_inode *ip, kuid_t uid, kgid_t gid)
 	if (gfs2_assert_warn(sdp, !ip->i_qadata->qa_qd_num) ||
 	    gfs2_assert_warn(sdp, !test_bit(GIF_QD_LOCKED, &ip->i_flags))) {
 		error = -EIO;
+		gfs2_qa_put(ip);
 		goto out;
 	}
 
-- 
2.40.1

