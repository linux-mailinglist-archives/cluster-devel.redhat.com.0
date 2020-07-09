Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4872121A772
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jul 2020 21:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594321489;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Dy8xZSdxTctVGxXqwnkSiQ9am2tjwSJXhh44KrTiTTw=;
	b=iU0a09ipziudWsrSnnJ1VqS0VqBtbGGUQ3X225rW7fk2vwEwEVRDfpbT2DQPu1fsLERBmO
	oLOodEhDUvPlXGAB0mrrVgOiSTBF3qcuM6BL1npM+bMXqHDsIaRsCQD/KWoyWeW2WWkBDa
	TZRuzE1JOnK7vUW0H4cYaTkQoEzC8+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-xovqyx16Pe-yGYk4M5rTwQ-1; Thu, 09 Jul 2020 15:04:47 -0400
X-MC-Unique: xovqyx16Pe-yGYk4M5rTwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30478106B244;
	Thu,  9 Jul 2020 19:04:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12AFF60C80;
	Thu,  9 Jul 2020 19:04:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DBB41809554;
	Thu,  9 Jul 2020 19:04:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069J0Vv6025607 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 15:00:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C3B073FF9; Thu,  9 Jul 2020 19:00:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-75.rdu2.redhat.com [10.10.114.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5F9F5BACF;
	Thu,  9 Jul 2020 19:00:30 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  9 Jul 2020 15:00:00 -0400
Message-Id: <20200709190001.102450-3-aahringo@redhat.com>
In-Reply-To: <20200709190001.102450-1-aahringo@redhat.com>
References: <20200709190001.102450-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 2/3] dlm_controld: change
	enable_waitplock_recovery default
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch sets the default value of enable_waitplock_recovery to false
as it is the same as the kernel configuration default. Note that in this
specific case dlm_controld will not set the default value on startup.
However this patch syncs the kernel and user land default behaviour.
---
 dlm_controld/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 3ec318c2..95107d09 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1754,7 +1754,7 @@ static void set_opt_defaults(void)
 
 	set_opt_default(enable_waitplock_recovery_ind,
 			"enable_waitplock_recovery", '\0', req_arg_bool,
-			1, NULL,
+			0, NULL,
 			"enable/disable posix lock to wait for dlm recovery after lock acquire");
 
 	set_opt_default(plock_debug_ind,
-- 
2.26.2

