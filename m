Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB67F44C6B0
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Nov 2021 19:15:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636568154;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PFxJxMoBysfw4lj83QwspUnHloi4hTBB4a/6jpc6KMQ=;
	b=QWqu/5fSamkRAT6OLFTFPRYE76gcbEedPaNLxNvxi7pZmKwTsB+xgiV+4uBTuWt+jBsZfV
	4cYevpg5pzRNByJ5FNFPa6X6BHCUW44NW+FBFnM+XB73SxXYDGrOS02H9hXFtAPEOsPt3v
	N5uBKI+pvcFVoFXDd618ykeAc8i3eB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-MBVxYEsQMaWDfu83lFwR4w-1; Wed, 10 Nov 2021 13:15:50 -0500
X-MC-Unique: MBVxYEsQMaWDfu83lFwR4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE1E5802C92;
	Wed, 10 Nov 2021 18:15:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD5E819D9D;
	Wed, 10 Nov 2021 18:15:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44D694EA30;
	Wed, 10 Nov 2021 18:15:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AAHxIRO032304 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 12:59:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6DC7B60936; Wed, 10 Nov 2021 17:59:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.195.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7B00BC880;
	Wed, 10 Nov 2021 17:59:17 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 10 Nov 2021 18:59:12 +0100
Message-Id: <20211110175915.534759-2-agruenba@redhat.com>
In-Reply-To: <20211110175915.534759-1-agruenba@redhat.com>
References: <20211110175915.534759-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/5] gfs2: Fix atomic bug in gfs2_instantiate
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Replace test_bit() + set_bit() with test_and_set_bit() where we need an atomic
operation.  Use clear_and_wake_up_bit() instead of open coding it.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 19f38aee1b61..258d8aae7c53 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -496,7 +496,7 @@ int gfs2_instantiate(struct gfs2_holder *gh)
 	 * Since we unlock the lockref lock, we set a flag to indicate
 	 * instantiate is in progress.
 	 */
-	if (test_bit(GLF_INSTANTIATE_IN_PROG, &gl->gl_flags)) {
+	if (test_and_set_bit(GLF_INSTANTIATE_IN_PROG, &gl->gl_flags)) {
 		wait_on_bit(&gl->gl_flags, GLF_INSTANTIATE_IN_PROG,
 			    TASK_UNINTERRUPTIBLE);
 		/*
@@ -509,14 +509,10 @@ int gfs2_instantiate(struct gfs2_holder *gh)
 		goto again;
 	}
 
-	set_bit(GLF_INSTANTIATE_IN_PROG, &gl->gl_flags);
-
 	ret = glops->go_instantiate(gh);
 	if (!ret)
 		clear_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags);
-	clear_bit(GLF_INSTANTIATE_IN_PROG, &gl->gl_flags);
-	smp_mb__after_atomic();
-	wake_up_bit(&gl->gl_flags, GLF_INSTANTIATE_IN_PROG);
+	clear_and_wake_up_bit(GLF_INSTANTIATE_IN_PROG, &gl->gl_flags);
 	return ret;
 }
 
-- 
2.31.1

