Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1558638CDEB
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 21:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621624154;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WsH0yc3/nsS/VAkvUUSGEPIHpKZ6nGcJTLgRW81JpR4=;
	b=FJXQloWnwSlFVHOo0Zu07VO0jRIS7qnhMlxdHIH/ZNCbNtF1NghWOJEYYf6wQcf41RxOQM
	xGVsoZmnXc8B7bHSfF45hoLBPkXYZp3dBlLcBV+Sgrul4sYw/CSWAvcZ2QlZky7nGdmdPj
	UeVlVSqs+rfn5oL9CD/d1O44AdjmO4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-ACF9ZoOBMjee2swmJmzGlA-1; Fri, 21 May 2021 15:09:12 -0400
X-MC-Unique: ACF9ZoOBMjee2swmJmzGlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0CEC107AFB1;
	Fri, 21 May 2021 19:09:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C09505D6DC;
	Fri, 21 May 2021 19:09:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B09B44A6A;
	Fri, 21 May 2021 19:09:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14LJ93r5005116 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 15:09:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 26B3D5C8AA; Fri, 21 May 2021 19:09:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-19.rdu2.redhat.com [10.10.115.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 927265C1BB;
	Fri, 21 May 2021 19:09:02 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 May 2021 15:08:33 -0400
Message-Id: <20210521190848.350176-2-aahringo@redhat.com>
In-Reply-To: <20210521190848.350176-1-aahringo@redhat.com>
References: <20210521190848.350176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv6 v5.13-rc1 dlm/next 01/16] fs: dlm: always
	run complete for possible waiters
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch changes the ping_members() result that we always run
complete() for possible waiters. We handle the -EINTR error code as
successful. This error code is returned if the recovery is stopped which
is likely that a new recovery is triggered with a new members
configuration and ping_members() runs again.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/member.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index ceef3f2074ff..48245ba3c640 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -576,12 +576,18 @@ int dlm_recover_members(struct dlm_ls *ls, struct dlm_recover *rv, int *neg_out)
 	*neg_out = neg;
 
 	error = ping_members(ls);
-	if (!error || error == -EPROTO) {
-		/* new_lockspace() may be waiting to know if the config
-		   is good or bad */
-		ls->ls_members_result = error;
-		complete(&ls->ls_members_done);
-	}
+	/* error -EINTR means that a new recovery action is triggered.
+	 * We ignore this recovery action and let run the new one which might
+	 * have new member configuration.
+	 */
+	if (error == -EINTR)
+		error = 0;
+
+	/* new_lockspace() may be waiting to know if the config
+	 * is good or bad
+	 */
+	ls->ls_members_result = error;
+	complete(&ls->ls_members_done);
 
 	log_rinfo(ls, "dlm_recover_members %d nodes", ls->ls_num_nodes);
 	return error;
-- 
2.26.3

