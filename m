Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C3F021F5996
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Jun 2020 19:01:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591808464;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D8IDfdT1i97DQN8cTWHjFmXou2lgNZ3vj5yMxeh3q+4=;
	b=PHq2ufkC8qkfOyBEHR0H+3DatkHcyQM+8XdlB1SjFBneM7V1k0LKaighnac1dwNkIcinJE
	Qwrai48idgR9f8YqBs406L0Y9d8tzFfw7RXQ0AwyP2/8VMn3UZGsz6DNIapTWblKufaK9H
	ekzmjgyBIHz0kvUYh+Q1+WPQbaB06Xg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-Z8aqLI2-PU2YV8a8cOa0mg-1; Wed, 10 Jun 2020 13:01:02 -0400
X-MC-Unique: Z8aqLI2-PU2YV8a8cOa0mg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13309107ACF4;
	Wed, 10 Jun 2020 17:00:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1A708FF76;
	Wed, 10 Jun 2020 17:00:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F136B34AC;
	Wed, 10 Jun 2020 17:00:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05AH0ogm010722 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Jun 2020 13:00:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B90D60CC0; Wed, 10 Jun 2020 17:00:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FD4960BE2;
	Wed, 10 Jun 2020 17:00:46 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 10 Jun 2020 19:00:44 +0200
Message-Id: <20200610170044.612210-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Don't sleep during glock hash walk
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

In flush_delete_work, instead of flushing each individual pending
delayed work item, cancel and re-queue them for immediate execution.
The waiting isn't needed here because we're already waiting for all
queued work items to complete in gfs2_flush_delete_work.  This makes the
code more efficient, but more importantly, it avoids sleeping during a
rhashtable walk, inside rcu_read_lock().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 2299dcc417ea..8545024a1401 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1899,7 +1899,10 @@ bool gfs2_delete_work_queued(const struct gfs2_glock *gl)
 
 static void flush_delete_work(struct gfs2_glock *gl)
 {
-	flush_delayed_work(&gl->gl_delete);
+	if (cancel_delayed_work(&gl->gl_delete)) {
+		queue_delayed_work(gfs2_delete_workqueue,
+				   &gl->gl_delete, 0);
+	}
 	gfs2_glock_queue_work(gl, 0);
 }
 
-- 
2.26.2

