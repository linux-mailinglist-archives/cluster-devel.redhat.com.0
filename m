Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFDA3D7C45
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 19:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627407444;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bf1dk/iZAfER8mmfijyAHY3yYGIiMXLJMy88EIE4LZQ=;
	b=ECrNPsKBMMs7ZCgBJN4hHtXaMINU48nVnbVveo5tmGhLw4Pcos68e0XIlcTesKRVCYuK/5
	6QRNP/Vt6u93wj62AD5uqOf6xF5WyzERa8MhM6jiAZ7YKGuG9gaXni5cPjl8Ordzfgmdiq
	LvNraGdsE3Wee//XQuBn1h67Y+qlwho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-1qS--S1xPWKyVJzFy5PZAw-1; Tue, 27 Jul 2021 13:37:22 -0400
X-MC-Unique: 1qS--S1xPWKyVJzFy5PZAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAC31A0C18;
	Tue, 27 Jul 2021 17:37:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC8A75DAA5;
	Tue, 27 Jul 2021 17:37:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3AA84A7C9;
	Tue, 27 Jul 2021 17:37:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RHbIjX022870 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 13:37:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4EB8E19630; Tue, 27 Jul 2021 17:37:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-120.phx2.redhat.com [10.3.112.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FF85179B3
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 17:37:18 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Jul 2021 12:37:06 -0500
Message-Id: <20210727173709.210711-13-rpeterso@redhat.com>
In-Reply-To: <20210727173709.210711-1-rpeterso@redhat.com>
References: <20210727173709.210711-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 12/15] gfs2: Make recovery error more
	readable
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
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

Before this patch, withdraws could cause an error that looked like:
Journal recovery skipped for 0 until next mount.
This patch changes it to a more readable:
Journal recovery skipped for jid 0 until next mount.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index f4325b44956d..34087bba88ee 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -295,7 +295,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 		fs_warn(sdp, "Journal recovery complete for jid %d.\n",
 			sdp->sd_lockstruct.ls_jid);
 	else
-		fs_warn(sdp, "Journal recovery skipped for %d until next "
+		fs_warn(sdp, "Journal recovery skipped for jid %d until next "
 			"mount.\n", sdp->sd_lockstruct.ls_jid);
 	fs_warn(sdp, "Glock dequeues delayed: %lu\n", sdp->sd_glock_dqs_held);
 	sdp->sd_glock_dqs_held = 0;
-- 
2.31.1

