Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 97CD61E22A1
	for <lists+cluster-devel@lfdr.de>; Tue, 26 May 2020 15:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590498353;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PhNR2t0bz5/pllGjTvNUt/gt2ct791VCt+uVliH6tXE=;
	b=dmFcJ9wWx5+1XcpbD7sbxvxbXgf4Vh8kV42ZKUowFZy1MzcIsP4E2KxccAx/2Vx/s8Jqkb
	oJoAAS8qRrtwmLmJyiyuYn81BF/Xqx8rOeuUBw//bfsfYw9lvN6c4cZCxw612v2wD1x559
	XtjP3N98FyzDPaEemyyATQ2AMVpVWbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-3Rmmu1W8Mt2k6TqYFP1VNA-1; Tue, 26 May 2020 09:05:51 -0400
X-MC-Unique: 3Rmmu1W8Mt2k6TqYFP1VNA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 275E419057A8;
	Tue, 26 May 2020 13:05:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAD3C5D9E5;
	Tue, 26 May 2020 13:05:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6751B54D36;
	Tue, 26 May 2020 13:05:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04QD5f0Q010689 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 26 May 2020 09:05:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 032955D9E7; Tue, 26 May 2020 13:05:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1DC25D9E5
	for <cluster-devel@redhat.com>; Tue, 26 May 2020 13:05:40 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 26 May 2020 08:05:31 -0500
Message-Id: <20200526130536.295081-4-rpeterso@redhat.com>
In-Reply-To: <20200526130536.295081-1-rpeterso@redhat.com>
References: <20200526130536.295081-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 3/8] gfs2: add memory barriers to
	gfs2_glock_remove_revoke
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Function gfs2_glock_remove_revoke did atomic_dec_return for gl_revokes
without memory barriers. But according to Documentation/core-api/atomic_ops:

"Unlike the above routines, it is required that these primitives
include explicit memory barriers that are performed before and after
the operation.  It must be done such that all memory operations before
and after the atomic operation calls are strongly ordered with respect
to the atomic operation itself."

This patch adds the barriers.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 0644e58c6191..1d51b4781bdd 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -682,7 +682,12 @@ void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)
 
 void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
 {
-	if (atomic_dec_return(&gl->gl_revokes) == 0) {
+	int revokes;
+
+	smp_mb__before_atomic();
+	revokes = atomic_dec_return(&gl->gl_revokes);
+	smp_mb__after_atomic();
+	if (revokes == 0) {
 		clear_bit(GLF_LFLUSH, &gl->gl_flags);
 		gfs2_glock_queue_put(gl);
 	}
-- 
2.26.2

