Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7E21E3DBE65
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Jul 2021 20:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627669992;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mSvAzhohNH1ARxLYIzAG+8GtpDcREPKkQIzbIHpOZ+U=;
	b=c+Y0gMA6z8XZqgC2mSX7pgdOD6oGJIj+lM6MDlkN77qrtaFt52ETJkszY/rDe9/qKA71Fr
	x6V0qB5XoDVGRup7/kpO0boVsCSPyiMa6kb6JCKKHDS/YUfJP/uJDm9EXlXjsQolzrns3b
	aaZUBKfSb9Z0/lpCi49/JfD2Fm4OHmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-FzvfaPGtNhK_E-Qk_uMP-Q-1; Fri, 30 Jul 2021 14:33:11 -0400
X-MC-Unique: FzvfaPGtNhK_E-Qk_uMP-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCBB0802929;
	Fri, 30 Jul 2021 18:33:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFCA75278E;
	Fri, 30 Jul 2021 18:33:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9893C4BB7C;
	Fri, 30 Jul 2021 18:33:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16UIX76X024462 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Jul 2021 14:33:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 601095D9DE; Fri, 30 Jul 2021 18:33:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-104.phx2.redhat.com [10.3.112.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3145C5D9DD
	for <cluster-devel@redhat.com>; Fri, 30 Jul 2021 18:33:03 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 30 Jul 2021 13:33:02 -0500
Message-Id: <20210730183302.427932-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Delay withdraw from atomic context
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

Before this patch, if function __gfs2_ail_flush detected an error
syncing the ail list, it call gfs2_ail_error which called gfs2_withdraw.
Since __gfs2_ail_flush deals with a specific glock, we shouldn't withdraw
immediately because the withdraw code (signal_our_withdraw) uses glocks
in its processing.

This patch changes the call from gfs2_withdraw to gfs2_withdraw_delayed
which defers the withdraw until a more appropriate context, such as the
logd daemon, discovers the intent to withdraw.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 744cacd27213..2eb03bbb2329 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -44,7 +44,7 @@ static void gfs2_ail_error(struct gfs2_glock *gl, const struct buffer_head *bh)
 	       gl->gl_name.ln_type, gl->gl_name.ln_number,
 	       gfs2_glock2aspace(gl));
 	gfs2_lm(sdp, "AIL error\n");
-	gfs2_withdraw(sdp);
+	gfs2_withdraw_delayed(sdp);
 }
 
 /**
-- 
2.31.1

