Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5BB2CD832
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Dec 2020 14:51:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607003513;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=kBFuvY6AVzdMpvBZo3VGlDK7t5LwBdz3ZLBPyZ3pvPA=;
	b=IjKT+GXhty9LrNaCv9k4gT6mSlWbWnleL5qOO8HucOgJlW4bzD/KvmvgcMEsFdTO2miNUD
	D+6XsT8n5IiMj0ICl9PQS+cNrsXTMfHZm9Iahci16teO/nMSYgG1FLPpRmNdM+0Gq6emTC
	5nCRlgYlbsr1KmLoma6pEj3GUEQJ6bc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-4MH5RB2VOaKKJks424N19g-1; Thu, 03 Dec 2020 08:51:51 -0500
X-MC-Unique: 4MH5RB2VOaKKJks424N19g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 905101012749;
	Thu,  3 Dec 2020 13:51:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D3E75D9D7;
	Thu,  3 Dec 2020 13:51:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A52501809CA3;
	Thu,  3 Dec 2020 13:51:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3DpiiY013036 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 08:51:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EE82D5D6D1; Thu,  3 Dec 2020 13:51:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAE345D6AC;
	Thu,  3 Dec 2020 13:51:41 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D11F7180954D;
	Thu,  3 Dec 2020 13:51:41 +0000 (UTC)
Date: Thu, 3 Dec 2020 08:51:41 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1216298448.31310284.1607003501812.JavaMail.zimbra@redhat.com>
In-Reply-To: <491862057.31310216.1607003471778.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.72, 10.4.195.8]
Thread-Topic: gfs2: in signal_our_withdraw wait for unfreeze of _this_ fs only
Thread-Index: 3bqD7l98kIp4RsO8cJkfLcp6nwcYNg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: in signal_our_withdraw wait for
 unfreeze of _this_ fs only
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Function signal_our_withdraw needs to work on file systems that have been
partially frozen. To do this, it called flush_workqueue(gfs2_freeze_wq).
This this wrong because it waits for *ALL* file systems to be unfrozen, not
just the one we're withdrawing from. It should only wait for the targetted
file system to be unfrozen. Otherwise it would wait until ALL file systems
are thawed before signaling the withdraw.

This patch changes signal_our_withdraw so it calls flush_work() for the target
file system's freeze work (only) to be completed.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 0fba3bf64189..a374397f4273 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -137,7 +137,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 	gfs2_glock_dq(&sdp->sd_jinode_gh);
 	if (test_bit(SDF_FS_FROZEN, &sdp->sd_flags)) {
 		/* Make sure gfs2_unfreeze works if partially-frozen */
-		flush_workqueue(gfs2_freeze_wq);
+		flush_work(&sdp->sd_freeze_work);
 		atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
 		thaw_super(sdp->sd_vfs);
 	} else {

