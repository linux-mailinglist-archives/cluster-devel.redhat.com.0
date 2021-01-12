Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C14FD2F2E44
	for <lists+cluster-devel@lfdr.de>; Tue, 12 Jan 2021 12:47:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610452035;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DlKH6xdU1ec0i+zik7UWOX+ODsz9ls9pycRqSyeqQlk=;
	b=IdsZ1nk3h5iDYtb3pHtiP4sEzUnIGipOeCpo0dz0LAoJpzN0vHDTn5+X0s5RNpFqswHyrJ
	szMo8A8mKe1SDC2yzm2CucNpo3FQg9JOBLFdEDDc6u58Q6PzbBFulj/tYqizSvn+5ZBCGW
	BoT4azfauAIKfiSYdhRP4EpIvGW5+OY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-WZRCdGbvPRCIOkGNSyJo9A-1; Tue, 12 Jan 2021 06:47:14 -0500
X-MC-Unique: WZRCdGbvPRCIOkGNSyJo9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73E0C107ACF7;
	Tue, 12 Jan 2021 11:47:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B78895D9DB;
	Tue, 12 Jan 2021 11:47:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94A9618095C9;
	Tue, 12 Jan 2021 11:47:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10CBl3JK018048 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 12 Jan 2021 06:47:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 197A860BE5; Tue, 12 Jan 2021 11:47:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00BB460BE2
	for <cluster-devel@redhat.com>; Tue, 12 Jan 2021 11:46:59 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 12 Jan 2021 11:46:56 +0000
Message-Id: <20210112114656.655846-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Fix invalid block size message
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 fs/gfs2/ops_fstype.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 64ad19bb978c..5a0fde5e67d9 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -180,7 +180,7 @@ static int gfs2_check_sb(struct gfs2_sbd *sdp, int silent)
 
 	if (sb->sb_bsize < 512 || sb->sb_bsize > PAGE_SIZE ||
 	    (sb->sb_bsize & (sb->sb_bsize - 1))) {
-		pr_warn("Invalid superblock size\n");
+		pr_warn("Invalid block size\n");
 		return -EINVAL;
 	}
 
-- 
2.29.2

