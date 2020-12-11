Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0452D79C0
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Dec 2020 16:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607701656;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p2NH/L4THD2wmcHahRudh3NZQqWPSrFxcFVP2AM6QMo=;
	b=WBm5EWGgaa9uOtI2SzGkZoBxmXWOgoUaOFZTKtwPBdO3jNQErQNyGQHqQZmv3iWNEg4MQT
	MbDZ9+TF+JWkwOkiquOI/Zh06JFolWoPXLPUZwxdEIiCteE8phsaStOu7RJX48ZqHnKv9X
	6pzx2bqu6SJKoxQWJhQFQ5bYRcUeeWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-FV7lpxuaNPeVurrqhJTKJw-1; Fri, 11 Dec 2020 10:47:34 -0500
X-MC-Unique: FV7lpxuaNPeVurrqhJTKJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AD2A87950C;
	Fri, 11 Dec 2020 15:47:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A7DB6E418;
	Fri, 11 Dec 2020 15:47:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FD6318095FF;
	Fri, 11 Dec 2020 15:47:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BBFlN7B013738 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Dec 2020 10:47:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8C1F257; Fri, 11 Dec 2020 15:47:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-44.rdu2.redhat.com [10.10.114.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CBDA5F9A6;
	Fri, 11 Dec 2020 15:47:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 11 Dec 2020 10:47:17 -0500
Message-Id: <20201211154718.99346-2-aahringo@redhat.com>
In-Reply-To: <20201211154718.99346-1-aahringo@redhat.com>
References: <20201211154718.99346-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 1/2] fs: dlm: check for invalid
	namelen
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds an additional check inside the dlm locking from user space
functionality that the namelen isn't above the maximum allowed dlm
resource name length.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/user.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index e5cefa90b1ce..9f2f743eeb31 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -241,6 +241,9 @@ static int device_user_lock(struct dlm_user_proc *proc,
 	uint32_t lkid;
 	int error = -ENOMEM;
 
+	if (params->namelen > DLM_RESNAME_MAXLEN)
+		return -EINVAL;
+
 	ls = dlm_find_lockspace_local(proc->lockspace);
 	if (!ls)
 		return -ENOENT;
-- 
2.26.2

