Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AEAD6243F90
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Aug 2020 22:01:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597348889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tr3iVcOrUZJOoEANvcgfAdDfpowPUbuHsReegFtN66E=;
	b=Cu063T9ranhUGbeKL98XTv8cm8hSEb9zjS4Ybxj/39W6Ly/dHTp00FQ9mm0wSolYy1XjFb
	p3BdaTirmqrU3tJD+nzrdk0oHu1q1JrLpAwsx7heeNuEETgrSVvr+XluGFq4UWps+hBLNX
	5PHnM/l/CiaIynkV3dQcFBESaQBAjzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-aAPaSjy2OLifDKhvXFXM0A-1; Thu, 13 Aug 2020 16:01:27 -0400
X-MC-Unique: aAPaSjy2OLifDKhvXFXM0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8167285B67B;
	Thu, 13 Aug 2020 20:01:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 401545C1A3;
	Thu, 13 Aug 2020 20:01:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B58011826D2B;
	Thu, 13 Aug 2020 20:01:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DK1JWI024965 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 16:01:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B5A35D9F3; Thu, 13 Aug 2020 20:01:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D0DA5D9D2
	for <cluster-devel@redhat.com>; Thu, 13 Aug 2020 20:01:19 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 13 Aug 2020 15:01:12 -0500
Message-Id: <20200813200114.5665-2-adas@redhat.com>
In-Reply-To: <20200813200114.5665-1-adas@redhat.com>
References: <20200813200114.5665-1-adas@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/3] gfs2: Don't write updates to local
	statfs file
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

We store the local statfs info in the journal header now so
there's no need to write to the local statfs file anymore.

Signed-off-by: Abhi Das <adas@redhat.com>
---
 fs/gfs2/lops.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index cb2a11b458c6..53d2dbf6605e 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -104,7 +104,15 @@ static void gfs2_unpin(struct gfs2_sbd *sdp, struct buffer_head *bh,
 	BUG_ON(!buffer_pinned(bh));
 
 	lock_buffer(bh);
-	mark_buffer_dirty(bh);
+	/*
+	 * We want to eliminate the local statfs file eventually.
+	 * But, for now, we're simply not going to update it by
+	 * never marking its buffers dirty
+	 */
+	if (!(bd->bd_gl->gl_name.ln_type == LM_TYPE_INODE &&
+	      bd->bd_gl->gl_object == GFS2_I(sdp->sd_sc_inode)))
+		mark_buffer_dirty(bh);
+
 	clear_buffer_pinned(bh);
 
 	if (buffer_is_rgrp(bd))
-- 
2.20.1

