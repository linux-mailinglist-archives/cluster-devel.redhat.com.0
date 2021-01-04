Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A2B732E9F39
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Jan 2021 22:00:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609794058;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WtN3QuTqKg7nxEcTPH53eHAj4REKoeWTAfkVdINhWQg=;
	b=Fb59UDb0Jj4a6kISt0dSZHB83HMbSCZ7315YTaFNoO8F2KlUQ1EP5GiFcRxY9gG6t1wR9f
	EejxTIhyMe1wimA3npqCP2zjM61EUNH0viFhL/wGKhNBvUDuTf/s4sFKIj4gkCGZCqy4/e
	rwBA4aqqidTehFE6CirmJFcnIaKAdUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-CWm4siynN9eMyRi8S3hBfw-1; Mon, 04 Jan 2021 16:00:56 -0500
X-MC-Unique: CWm4siynN9eMyRi8S3hBfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DC61107ACE8;
	Mon,  4 Jan 2021 21:00:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F4D06FEE2;
	Mon,  4 Jan 2021 21:00:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 29773180954D;
	Mon,  4 Jan 2021 21:00:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104L0q3W003850 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 16:00:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4B4DF272AB; Mon,  4 Jan 2021 21:00:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-75.rdu2.redhat.com [10.10.115.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D599D272AD;
	Mon,  4 Jan 2021 21:00:48 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Jan 2021 16:00:23 -0500
Message-Id: <20210104210024.233765-20-aahringo@redhat.com>
In-Reply-To: <20210104210024.233765-1-aahringo@redhat.com>
References: <20210104210024.233765-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 19/20] fs: dlm: remove obsolete
	code and comment
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

This patch removes obsolete macros and a comment. The macro was there
for temporary copy a dlm message on a stack buffer, nowadays we operate
directly on receive buffer which was given to the socket receive API.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index da2297705713..a735f2816ef7 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -41,12 +41,6 @@
 #include <linux/dlm.h>
 #include "config.h"
 
-/* Size of the temp buffer midcomms allocates on the stack.
-   We try to make this large enough so most messages fit.
-   FIXME: should sctp make this unnecessary? */
-
-#define DLM_INBUF_LEN		148
-
 struct dlm_ls;
 struct dlm_lkb;
 struct dlm_rsb;
-- 
2.26.2

