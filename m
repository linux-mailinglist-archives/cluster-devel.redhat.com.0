Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9154A75BC
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Feb 2022 17:26:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643819183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sQvjmXsw+ONBLZV7YwSadivF9sXilZbIVNMAoIiIqE0=;
	b=LK53J6nABZ0YG8QpFNb5OWIKkha1HOcsJBE/A+MzQpTIJwaPbSN7fBhuNMsI5zj7OhMrGB
	zIhMaSjndbrivhuT0HtH9EmjwshsunSzO2MALr/pLxIDd+PqQbSOMRHOVhfQiQgWQV0+u+
	7/G3u6MbQYYiOCPpFoFNre7BgyF6NAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-oXUy4B84M-OAmCZgcUbPlg-1; Wed, 02 Feb 2022 11:26:20 -0500
X-MC-Unique: oXUy4B84M-OAmCZgcUbPlg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B5F51B18BC3;
	Wed,  2 Feb 2022 16:26:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CBE384A10;
	Wed,  2 Feb 2022 16:26:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECAB14CA93;
	Wed,  2 Feb 2022 16:26:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 212GOsm8021715 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Feb 2022 11:24:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2A80F10A48CA; Wed,  2 Feb 2022 16:24:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.230])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 677CD10A4B21;
	Wed,  2 Feb 2022 16:24:40 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  2 Feb 2022 17:24:39 +0100
Message-Id: <20220202162439.46234-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Initialize gh_error in gfs2_glock_nq
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

The gh_error field if a glock holder is initialized to zero in
gfs2_holder_init().  When a locking operation fails, gh_error is set to
an error code; when it succeeds, the gh_error value is left unchanged.
The field isn't initialized in gfs2_holder_reinit(), which is a problem.
Instead of fixing that directly, initialize gh_error in gfs2_glock_nq().
That also obsoletes the assignment in do_flock().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c  | 1 -
 fs/gfs2/glock.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 5bac4f6e8e05..a743a9eb602f 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1497,7 +1497,6 @@ static int do_flock(struct file *file, int cmd, struct file_lock *fl)
 		if (error != GLR_TRYFAILED)
 			break;
 		fl_gh->gh_flags = LM_FLAG_TRY | GL_EXACT;
-		fl_gh->gh_error = 0;
 		msleep(sleeptime);
 	}
 	if (error) {
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index f7f296e8e506..3a4c0cca6580 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1264,7 +1264,6 @@ void __gfs2_holder_init(struct gfs2_glock *gl, unsigned int state, u16 flags,
 	gh->gh_owner_pid = get_pid(task_pid(current));
 	gh->gh_state = state;
 	gh->gh_flags = flags;
-	gh->gh_error = 0;
 	gh->gh_iflags = 0;
 	gfs2_glock_hold(gl);
 }
@@ -1570,6 +1569,7 @@ int gfs2_glock_nq(struct gfs2_holder *gh)
 	if (test_bit(GLF_LRU, &gl->gl_flags))
 		gfs2_glock_remove_from_lru(gl);
 
+	gh->gh_error = 0;
 	spin_lock(&gl->gl_lockref.lock);
 	add_to_queue(gh);
 	if (unlikely((LM_FLAG_NOEXP & gh->gh_flags) &&
-- 
2.33.1

