Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A48775ED3
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Aug 2023 14:24:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691583845;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iHVx+s3ZQ7XHai/gcERoeA4liJ6IOn5eIdnMhLVIdes=;
	b=VLUMqgMmpJE2YfvdIpHfisicyMMYA7H+t26/9U5PhjvlsFW5F2FB+0jQMlUCQ3vrCCg9CQ
	0mZR3tnhQdnHYK2OkH9FiZpPwwS71f9j1A+XVqJSsajNvNhJ3YD/VPA5hq66IFKQ0hpUN7
	490yndvTzwy4wTHE++oo8nUiUeraZCI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-690-oP1zLDe3NMWtuKFtrEhrxw-1; Wed, 09 Aug 2023 08:24:02 -0400
X-MC-Unique: oP1zLDe3NMWtuKFtrEhrxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D70BE8DC666;
	Wed,  9 Aug 2023 12:24:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC0A440C2076;
	Wed,  9 Aug 2023 12:24:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7E5A21946594;
	Wed,  9 Aug 2023 12:23:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DD3E3194658F for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 12:11:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A982C112131B; Wed,  9 Aug 2023 12:11:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.225.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CC201121314;
 Wed,  9 Aug 2023 12:11:29 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  9 Aug 2023 14:11:27 +0200
Message-Id: <20230809121127.1754804-3-agruenba@redhat.com>
In-Reply-To: <20230809121127.1754804-1-agruenba@redhat.com>
References: <20230809121127.1754804-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH 3/3] gfs2: conversion deadlock do_promote
 bypass
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Bob Peterson <rpeterso@redhat.com>

Consider the following case:
1. A glock is held in shared mode.
2. A process requests the glock in exclusive mode (rename).
3. Before the lock is granted, more processes (read / ls) request the
   glock in shared mode again.
4. gfs2 sends a request to dlm for the lock in exclusive mode because
   that holder is at the head of the queue.
5. Somehow the dlm request gets canceled, so dlm sends us back a
   response with state == LM_ST_SHARED and LM_OUT_CANCELED.  So at that
   point, the glock is still held in shared mode.
6. finish_xmote gets called to process the response from dlm. It detects
   that the glock is not in the requested mode and no demote is in
   progress, so it moves the canceled holder to the tail of the queue
   and finds the new holder at the head of the queue.  That holder is
   requesting the glock in shared mode.
7. finish_xmote calls do_xmote to transition the glock into shared mode,
   but the glock is already in shared mode and so do_xmote complains
   about that with:
	GLOCK_BUG_ON(gl, gl->gl_state == gl->gl_target);

Instead, in finish_xmote, after moving the canceled holder to the tail
of the queue, check if any new holders can be granted.  Only call
do_xmote to repeat the dlm request if the holder at the head of the
queue is requesting the glock in a mode that is incompatible with the
mode the glock is currently held in.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 0a3222651869..6e8200d96879 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -594,6 +594,8 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
 				list_move_tail(&gh->gh_list, &gl->gl_holders);
 				gh = find_first_waiter(gl);
 				gl->gl_target = gh->gh_state;
+				if (do_promote(gl))
+					goto out;
 				goto retry;
 			}
 			/* Some error or failed "try lock" - report it */
-- 
2.40.1

