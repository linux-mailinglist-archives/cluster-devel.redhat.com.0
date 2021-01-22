Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 25F77300994
	for <lists+cluster-devel@lfdr.de>; Fri, 22 Jan 2021 18:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611336205;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=kK49UrwToQ2iEzlEScLD3wr28u1jbL/hlEpc3lE5xao=;
	b=bsHTZEjWLzDzxjyWytKsFNL4N7z6cJGin0crz9ivTp6GpCQFqxjr9jj58a887y1K6rcR7U
	NAiOM6Ect+jJGAgfHIjZF12r9eUqd71oqNzPitngWq1ewnkRBtpkXQ7tVY+3Mox1gqv3tD
	lhrPWsGO0VgLjd6ExIOjuQG1zrJZ5YY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-SFdbKWBXMTe9_iNiOrABlA-1; Fri, 22 Jan 2021 12:23:23 -0500
X-MC-Unique: SFdbKWBXMTe9_iNiOrABlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2A4CA0CAB;
	Fri, 22 Jan 2021 17:23:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 841706249C;
	Fri, 22 Jan 2021 17:23:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13D964BB7B;
	Fri, 22 Jan 2021 17:23:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MHNGK7010892 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 12:23:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3C79D71D53; Fri, 22 Jan 2021 17:23:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3689B71CBE
	for <cluster-devel@redhat.com>; Fri, 22 Jan 2021 17:23:12 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97BCF4BB40
	for <cluster-devel@redhat.com>; Fri, 22 Jan 2021 17:23:12 +0000 (UTC)
Date: Fri, 22 Jan 2021 12:23:10 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1719166054.49232686.1611336190397.JavaMail.zimbra@redhat.com>
In-Reply-To: <1588376288.49232678.1611336180266.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.58, 10.4.195.29]
Thread-Topic: Revert "GFS2: Re-add a call to log_flush_wait when flushing the
	journal"
Thread-Index: qzpOViMRhI9X5skcUCaE013hKjX/RA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] Revert "GFS2: Re-add a call to
 log_flush_wait when flushing the journal"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

This reverts commit 428fd95d859b24fea448380fa21ad6d841b34241.
Patch 428fd95d85b2 added a call to log_flush_wait to function
gfs2_log_flush. Then gfs2_log_flush calls log_write_header which submits
a write request with the REQ_PREFLUSH flag which also forces it to wait.
This patch removes the unnecessary call to log_flush_wait.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 2e9314091c81..41d13f19d1b4 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1004,7 +1004,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 		goto out_withdraw;
 
 	if (sdp->sd_log_head != sdp->sd_log_flush_head) {
-		log_flush_wait(sdp);
 		log_write_header(sdp, flags);
 	} else if (sdp->sd_log_tail != current_tail(sdp) && !sdp->sd_log_idle){
 		atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buffer */

