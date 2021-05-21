Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9C27B38CDEE
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 21:09:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621624155;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=orZJ7KfE/9Uf7Cq+fIOrkCJhSOsWwUIJcVSJ1V2SrHc=;
	b=iGHn0Iz2o/ity8WZjjHYzZtNIj51kd6IaX3XbODCkfoYjpBTr0uQf5blcnbViFJKus2W56
	n+2b5BHj9vml+wdkFgyf2/vKIKaj1u8qxT8vLdCIhHm0n3Fj/egoa3e9ceo+Kl9mlMPQG1
	uybOloV4HzlNh/p7pv2XcW2RF26oyXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-ktyfKmewOlumUm2k8tkqlQ-1; Fri, 21 May 2021 15:09:13 -0400
X-MC-Unique: ktyfKmewOlumUm2k8tkqlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4A83E7B72;
	Fri, 21 May 2021 19:09:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9723C5C1BB;
	Fri, 21 May 2021 19:09:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86C8D1800BB4;
	Fri, 21 May 2021 19:09:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14LJ96jg005154 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 15:09:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D81CE5C67A; Fri, 21 May 2021 19:09:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-19.rdu2.redhat.com [10.10.115.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F57C5C1BB;
	Fri, 21 May 2021 19:09:06 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 May 2021 15:08:38 -0400
Message-Id: <20210521190848.350176-7-aahringo@redhat.com>
In-Reply-To: <20210521190848.350176-1-aahringo@redhat.com>
References: <20210521190848.350176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv6 v5.13-rc1 dlm/next 06/16] fs: dlm: cancel
	work sync othercon
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

These rx tx flags arguments are for signaling close_connection() from
which worker they are called. Obviously the receive worker cannot cancel
itself and vice versa for swork. For the othercon the receive worker
should only be used, however to avoid deadlocks we should pass the same
flags as the original close_connection() was called.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 051f22dbb83a..0a4851b3cd4b 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -715,7 +715,7 @@ static void close_connection(struct connection *con, bool and_other,
 
 	if (con->othercon && and_other) {
 		/* Will only re-enter once. */
-		close_connection(con->othercon, false, true, true);
+		close_connection(con->othercon, false, tx, rx);
 	}
 
 	con->rx_leftover = 0;
-- 
2.26.3

