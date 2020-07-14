Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B7CE321F8B7
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jul 2020 20:02:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594749730;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XR2Go3HNpMmM7n1DaHcmeqxTkQwv8/Ug7YOEyYq7Jso=;
	b=EJlCpB+qwc5Q0Owi5jkxAaNiogTb/rUpjViUxdWbH7+1Qrzib0NQuzd/r/fpVKtosJgrn5
	jBKg9X2OY0vZyyKVUUm7hKvngjorvV9h9ORyEqGqzIditr2FFj59nImPOTD09TwZF8HM5B
	xSD4ytXG6FRReHGzIZvBNiZlqown4s0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-kUORoj1oPUalSupgo-0o6Q-1; Tue, 14 Jul 2020 14:02:05 -0400
X-MC-Unique: kUORoj1oPUalSupgo-0o6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21CD810AEB5C;
	Tue, 14 Jul 2020 18:01:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 121C55D9DC;
	Tue, 14 Jul 2020 18:01:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE7491809554;
	Tue, 14 Jul 2020 18:01:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EI1eeZ024248 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 14:01:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1114660CD1; Tue, 14 Jul 2020 18:01:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-119-142.rdu2.redhat.com [10.10.119.142])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8884F60BF4;
	Tue, 14 Jul 2020 18:01:39 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 14 Jul 2020 14:01:15 -0400
Message-Id: <20200714180116.18642-4-aahringo@redhat.com>
In-Reply-To: <20200714180116.18642-1-aahringo@redhat.com>
References: <20200714180116.18642-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 3/4] dlm_controld: fix may be used
	uninitialized
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch fixes the following compiler warning:

config.c:269:26: warning: ‘val’ may be used uninitialized in this function [-Wmaybe-uninitialized]
  269 |    o->file_int = val ? 1 : 0;

The fix just init's val to 0 to have a fallback if parsing fails.
---
 dlm_controld/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dlm_controld/config.c b/dlm_controld/config.c
index ec269168..323f91e9 100644
--- a/dlm_controld/config.c
+++ b/dlm_controld/config.c
@@ -189,7 +189,7 @@ void set_opt_file(int update)
 	FILE *file;
 	char line[MAX_LINE];
 	char str[MAX_LINE];
-	int i, val;
+	int i, val = 0;
 
 	if (!path_exists(CONF_FILE_PATH))
 		return;
-- 
2.26.2

