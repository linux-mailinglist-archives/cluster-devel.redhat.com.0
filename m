Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2D286417EA3
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Sep 2021 02:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632529867;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JAtEPqM1dD0skvHn4X1ob/x1/Vgoo61Kt625qgCw7L8=;
	b=VODMDCG50qDlwKSiPrvC97k4uVKrwTcrU4HJWNFyjhkj6m8NzyEODT+TQXZuaF87M8jNw7
	mhAp5PHwbcuS3rFMecO2AWEyyLBlLAS5UWkXRj4GPE2vM1eRNs5BJ7aj5Jcd0jp/hQBEnu
	Ox+WfEw2GNffz+xuP0RwhsLTolG/z1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-Oj_Lo8PyMieSgyCg1Z2zwA-1; Fri, 24 Sep 2021 20:31:05 -0400
X-MC-Unique: Oj_Lo8PyMieSgyCg1Z2zwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E87D1084684;
	Sat, 25 Sep 2021 00:31:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70DB060936;
	Sat, 25 Sep 2021 00:31:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AE691809C81;
	Sat, 25 Sep 2021 00:31:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18P0V1Gs008930 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Sep 2021 20:31:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 860446060F; Sat, 25 Sep 2021 00:31:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 471BC60936;
	Sat, 25 Sep 2021 00:31:01 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 24 Sep 2021 20:30:12 -0400
Message-Id: <20210925003015.1862586-2-aahringo@redhat.com>
In-Reply-To: <20210925003015.1862586-1-aahringo@redhat.com>
References: <20210925003015.1862586-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 2/5] fs: dlm: remove check SCTP is
	loaded message
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Since commit 764ff4011424 ("fs: dlm: auto load sctp module") we try
load the sctp module before we try to create a sctp kernel socket. That
a socket creation fails now has more likely other reasons. This patch
removes the part of error to load the sctp module and instead printout
the error code.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 8f715c620e1f..bee3757eb4c7 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1775,7 +1775,7 @@ static int dlm_listen_for_all(void)
 	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
 				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
 	if (result < 0) {
-		log_print("Can't create comms socket, check SCTP is loaded");
+		log_print("Can't create comms socket: %d", result);
 		goto out;
 	}
 
-- 
2.27.0

