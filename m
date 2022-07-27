Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 45420582B5A
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jul 2022 18:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658939533;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sD7dw/XUKRumiV92Lvsnho3Dhg7ZwzSoKOedQc0FDVo=;
	b=SW6rFUT/pi/NPsZWkgDrNCNG4rjYSvXYq+kmlT84cZqOGgTSz1BHOopsv48/fBGg6vMm0S
	i8SnfCSy2Qj0S2GeknI/eRujnfP8S28cWfk23mFo1c0lLX5qWBygrD/BKkjLA2zBQqHUeg
	q+xO6AI7O3cf6W9PBxuRWgGUvTJVxAw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-3eQBZ19ZNCyc5rhQXlN1Pw-1; Wed, 27 Jul 2022 12:32:08 -0400
X-MC-Unique: 3eQBZ19ZNCyc5rhQXlN1Pw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65FBB280F2B1;
	Wed, 27 Jul 2022 16:32:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29F8A492CA2;
	Wed, 27 Jul 2022 16:32:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0350C1945DA9;
	Wed, 27 Jul 2022 16:32:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 29C8C1945DA2 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 27 Jul 2022 16:02:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1BB4B403D0E0; Wed, 27 Jul 2022 16:02:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.16.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E887D4010E4D
 for <cluster-devel@redhat.com>; Wed, 27 Jul 2022 16:02:22 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 27 Jul 2022 11:02:20 -0500
Message-Id: <20220727160222.227803-2-rpeterso@redhat.com>
In-Reply-To: <20220727160222.227803-1-rpeterso@redhat.com>
References: <20220727160222.227803-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 1/3] gfs2: Prevent double iput for journal
 on error
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

When a gfs2 file system is withdrawn, it requests recovery from another
cluster node. To do that, it evicts its journal from memory, but it
keeps the journal entry queued to the journals queue, jindex_list. After
recovery it tries to grab a new inode for its (recovered) journal. If it
cannot, it skips further recovery but its evicted journal is still on
the jindex list, which means unmount will try to iput it a second time
after it's been evicted. This second iput causes vfs to complain and BUG
out:

kernel BUG at fs/inode.c:1680!

To prevent this, this patch takes steps to dequeue the journal
descriptor from the list when it cannot get a replacement inode. So
unmount won't find it on the list and try to iput it again.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/util.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 8241029a2a5d..78cb12d0fba1 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -275,6 +275,17 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 	if (IS_ERR(inode)) {
 		fs_warn(sdp, "Reprocessing of jid %d failed with %ld.\n",
 			sdp->sd_lockstruct.ls_jid, PTR_ERR(inode));
+		/*
+		 * We couldn't get a replacement inode for our journal but we
+		 * evicted the old one. So dequeue it from the journals queue,
+		 * jindex_list, so that unmount doesn't do iput on it twice.
+		 */
+		spin_lock(&sdp->sd_jindex_spin);
+		list_del(&sdp->sd_jdesc->jd_list);
+		sdp->sd_journals--;
+		spin_unlock(&sdp->sd_jindex_spin);
+		kfree(sdp->sd_jdesc);
+		sdp->sd_jdesc = NULL;
 		goto skip_recovery;
 	}
 	sdp->sd_jdesc->jd_inode = inode;
-- 
2.36.1

