Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6073E0336
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Aug 2021 16:31:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628087507;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8RssR23Nn3y/Rx/03bDg75hOkEE3QL27I+qBAqhq/mI=;
	b=ggBL2VJr9Bjn6ABHS7Huywhv6mE/yDdwUa5f/GqmVkq9+P+Am+jWeHMXmqYNttYCzjEL3P
	YZyf4sDwEBcAntVWDnr+/5Lq90tJ8sd8NGgPzBgIk92C6ds5SRhvNisV3R0FYYa+xb/2K9
	1y6rHt8Zmn2o64/dHiwpvbJ+2d+Z60g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-7Ewjna2uO5KRjGn8GpCJMw-1; Wed, 04 Aug 2021 10:31:46 -0400
X-MC-Unique: 7Ewjna2uO5KRjGn8GpCJMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B1D81940920;
	Wed,  4 Aug 2021 14:31:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AE4C19CBA;
	Wed,  4 Aug 2021 14:31:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23256180BAB0;
	Wed,  4 Aug 2021 14:31:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 174EVYN6007669 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 4 Aug 2021 10:31:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AB9E0369A; Wed,  4 Aug 2021 14:31:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E894F60BD9;
	Wed,  4 Aug 2021 14:31:30 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  4 Aug 2021 10:31:25 -0400
Message-Id: <20210804143125.687417-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/tool] plock: move clear waiter to debug
	info
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch moves the clear waiter log message for a killed/interrupted
posix lock of a user space from error to debug. It can be confused to
see it as error in the log but it's necessary to cleanup all waiters who
are waiting for the lock.

Reported-by: Shane Bradley <sbradley@redhat.com>
---
 dlm_controld/plock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index 992fb16f..692787e2 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -660,7 +660,7 @@ static void clear_waiters(struct lockspace *ls, struct resource *r,
 
 		list_del(&w->list);
 
-		log_elock(ls, "clear waiter %llx %llx-%llx %d/%u/%llx",
+		log_dlock(ls, "clear waiter %llx %llx-%llx %d/%u/%llx",
 			  (unsigned long long)in->number,
 			  (unsigned long long)in->start,
 			  (unsigned long long)in->end,
-- 
2.27.0

