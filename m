Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6006F7157
	for <lists+cluster-devel@lfdr.de>; Thu,  4 May 2023 19:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683222211;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cmH/Kt1CfHEQ380HskmGnC0Y0N2wj08VMYHCg3fodw8=;
	b=Dj92sTjU8PCYIF7wHbSCzCoFVOwzu8Llfm/IlPVArAETx97WSWMolTXMIiJ5GXE/oI4yyf
	FAKivyXZyZqv/TanwbWcNfGDorZRwLCKmrGJ89c5bAHLpBeksnM02fqS56Q99MfD0vsVyA
	kBFDdXIrpyLEfcg1UXUrwLGAIMHFedM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-Kj5ZxLjfPXeY2fLHa8u5Ng-1; Thu, 04 May 2023 13:43:28 -0400
X-MC-Unique: Kj5ZxLjfPXeY2fLHa8u5Ng-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE94C811E7B;
	Thu,  4 May 2023 17:43:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6599E492C3E;
	Thu,  4 May 2023 17:43:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1ECE71946A47;
	Thu,  4 May 2023 17:43:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C73CA19465BB for <cluster-devel@listman.corp.redhat.com>;
 Thu,  4 May 2023 17:43:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 948224020963; Thu,  4 May 2023 17:43:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.22.34.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DB7A4020960
 for <cluster-devel@redhat.com>; Thu,  4 May 2023 17:43:23 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu,  4 May 2023 13:43:22 -0400
Message-Id: <20230504174322.384715-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH] gfs2: ignore rindex_update failure in
 dinode_dealloc
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Before this patch function gfs2_dinode_dealloc would abort if it got a
bad return code from gfs2_rindex_update. The problem is that it left the
dinode in the unlinked (not free) state, which meant subsequent fsck
would clean it up and flag an error. That meant some of our QE tests
would fail.

The sole purpose of gfs2_rindex_update, in this code path, is to read in
any newer rgrps added by gfs2_grow. But since this is a delete operation
it won't actually use any of those new rgrps. It can really only twiddle
the bits from "Unlinked" to "Free" in an existing rgrp. Therefore the
error should not prevent the transition from unlinked to free.

This patch makes gfs2_dinode_dealloc ignore the bad return code and
proceed with freeing the dinode so the QE tests will not be tripped up.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index d3b5c6278be0..1f23d7845123 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1131,9 +1131,7 @@ static int gfs2_dinode_dealloc(struct gfs2_inode *ip)
 		return -EIO;
 	}
 
-	error = gfs2_rindex_update(sdp);
-	if (error)
-		return error;
+	gfs2_rindex_update(sdp);
 
 	error = gfs2_quota_hold(ip, NO_UID_QUOTA_CHANGE, NO_GID_QUOTA_CHANGE);
 	if (error)
-- 
2.40.0

