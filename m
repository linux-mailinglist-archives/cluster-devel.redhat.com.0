Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D8BB340CE66
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Sep 2021 22:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631738827;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DwNI6cxZxbApv2Qqwf26cfOwbBFa8lwkbssaeXdZGPQ=;
	b=WFzXIIUwKUSY4OtEQd5Fy9bQu1O6egwp7C4RpW/lyn6tx1MxZcfnXfMhihaQgVEfv+CnNS
	RjHzuHjqQOsG0FRN6ei1dobm0LpzwhJGQHgNjtHp5mGl63fLGUkIid/0MjBqTneImVzRaU
	wjZ0N4JSSNbbleltVZYFBAsp0vipOz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-SuaJq1oWPo-UsZCKqKn86Q-1; Wed, 15 Sep 2021 16:47:05 -0400
X-MC-Unique: SuaJq1oWPo-UsZCKqKn86Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97351835DEC;
	Wed, 15 Sep 2021 20:47:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89E6B77BF5;
	Wed, 15 Sep 2021 20:47:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A6A91809C81;
	Wed, 15 Sep 2021 20:47:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18FKdTUY032317 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 16:39:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 618031981F; Wed, 15 Sep 2021 20:39:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 216CB604CC;
	Wed, 15 Sep 2021 20:39:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 15 Sep 2021 16:39:15 -0400
Message-Id: <20210915203916.3661690-3-aahringo@redhat.com>
In-Reply-To: <20210915203916.3661690-1-aahringo@redhat.com>
References: <20210915203916.3661690-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 2/3] fs: dlm: call
	dlm_lsop_recover_prep once
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

This patch changes the behaviour of "dlm_lsop_recover_prep" callback. It
will be called once when locking was stopped if it was previously
running not if dlm_ls_stop() is called multiple times when locking was
already stopped. Now it will be called only if a dlm_ls_start() was before.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/member.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 5f5b07bdbcc3..446e1635229d 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -685,7 +685,16 @@ int dlm_ls_stop(struct dlm_ls *ls)
 	if (!ls->ls_recover_begin)
 		ls->ls_recover_begin = jiffies;
 
-	dlm_lsop_recover_prep(ls);
+	/* call recover_prep ops only once and not multiple times
+	 * for each possible dlm_ls_stop() when recovery is already
+	 * stopped.
+	 *
+	 * If we successful was able to clear LSFL_RUNNING bit and
+	 * it was set we know it is the first dlm_ls_stop() call.
+	 */
+	if (new)
+		dlm_lsop_recover_prep(ls);
+
 	return 0;
 }
 
-- 
2.27.0

