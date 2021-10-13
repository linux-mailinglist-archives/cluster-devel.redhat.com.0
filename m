Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BD03C42C205
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Oct 2021 16:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634133743;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ETcopg0s7Fegu/OoaWiDMLEDYW+OQ1yOsDnGASptbvA=;
	b=MGaXvXsLJjoP+RjTPMMDoRcEFpPywab6y6//Zeug3tUkShxbLWqkQZGDgVxLgFkpoNKutO
	DRnOK1BjJbLmUPgA8U6sXiX5rCiaK/hq/e+gCPFAwUJWFjgv+CdFesEteVca572OMTkJ1t
	ugZXV3ziTuKwYViOd5VxdubG34m7vLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-0KfD_E-8PSyIQCFrJ-k3Ig-1; Wed, 13 Oct 2021 10:02:20 -0400
X-MC-Unique: 0KfD_E-8PSyIQCFrJ-k3Ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9871510151E0;
	Wed, 13 Oct 2021 14:02:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEF975D705;
	Wed, 13 Oct 2021 14:02:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0FAF1800FE4;
	Wed, 13 Oct 2021 14:02:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19DE28Or013495 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Oct 2021 10:02:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 375B15F4EB; Wed, 13 Oct 2021 14:02:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBEAE5D705;
	Wed, 13 Oct 2021 14:02:07 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: rpeterso@redhat.com
Date: Wed, 13 Oct 2021 10:02:00 -0400
Message-Id: <20211013140200.516387-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH gfs2/for-next] gfs2: check context on
	gfs2_glock_put
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

This patch adds a might_sleep() call into gfs2_glock_put() which could
sleep if last reference is released. A comment leaves a note for the
programmer that the only reason why it might can sleep is that the DLM
api is called which is currently sleepable context. Checking on
sleepable context in gfs2_glock_put() will show us problems earlier
instead of seeing issues only if the last put occurred.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/gfs2/glock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index ccbfbc93e954..689dbe37fd91 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -294,6 +294,9 @@ void gfs2_glock_queue_put(struct gfs2_glock *gl)
 
 void gfs2_glock_put(struct gfs2_glock *gl)
 {
+	/* last put could call sleepable dlm api */
+	might_sleep();
+
 	if (lockref_put_or_lock(&gl->gl_lockref))
 		return;
 
-- 
2.27.0

