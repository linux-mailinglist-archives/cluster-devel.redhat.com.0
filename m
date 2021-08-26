Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 486FA3F89C3
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Aug 2021 16:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629986816;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RezraJwQ8Umm1MDDAebPD9KXbFyRgzCCRpLqUhzYG2w=;
	b=c56xx7kUeM4Rrk80VbsgQrIJwgPqk3un2d3jjocl6/qWrukgvTwRnqY/+d8s24DcUUqMaF
	63F2kOIiDIcVK/hq/8hxm+kmOwPS0yWU+0Ko02ep/oAJiA0H4LoKzcFyeLBeOOJZJrgWNo
	psQuRg4bZRGC8aFlqLXcvKL9D0YISW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-OOnLcS48Mvm0PlIqra5xng-1; Thu, 26 Aug 2021 10:06:54 -0400
X-MC-Unique: OOnLcS48Mvm0PlIqra5xng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A1C4192D785;
	Thu, 26 Aug 2021 14:06:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 402BA67C99;
	Thu, 26 Aug 2021 14:06:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45F65180084A;
	Thu, 26 Aug 2021 14:06:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17QE6il1026572 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Aug 2021 10:06:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25D625E274; Thu, 26 Aug 2021 14:06:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B38A5DF21;
	Thu, 26 Aug 2021 14:06:38 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 26 Aug 2021 10:06:31 -0400
Message-Id: <20210826140631.3428232-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, cmackows@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: fix possible stuck in
	shutdown
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

In case of releasing the last lockspace we make a clean shutdown to
synchronize cluster manager membership with the dlm kernel protocol.
In some cases when a passive shutdown (membership removal during
lockspace operational) is interrupted by a active shutdown (releasing
last lockspace) this synchronize can stuck because the active shutdown
waits until passive shutdown is done. In case of passive shutdown we
wait for the membership remove event. If active shutdown interrupts
passive shutdown and such event didn't happened before the shutdown gets
stuck because dlm recovery (which handles cluster manager membership
events) is already stopped. To avoid it we trigger the event before
calling the active shutdown so a possible wait for a passive shutdown
can wake up the shutdown waiter.

Reported-by: Chris Mackowski <cmackows@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lockspace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 23c2d7308050..10eddfa6c3d7 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -793,6 +793,7 @@ static int release_lockspace(struct dlm_ls *ls, int force)
 
 	if (ls_count == 1) {
 		dlm_scand_stop();
+		dlm_clear_members(ls);
 		dlm_midcomms_shutdown();
 	}
 
-- 
2.27.0

