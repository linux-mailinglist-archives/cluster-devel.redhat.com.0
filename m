Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 466993975FF
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Jun 2021 17:01:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622559690;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=331ry0pnnqcU0URsxv4p9cP6gMEUnGWqUazo7Z7FwH0=;
	b=abyMxaprtvl07hLO7YopWKtyKJCVbEEJmuw9enTf26JBOHzQ/u9eS2wMBUXzJag7lilbHC
	12QR8IhdLcyaj6fck7jTMLlRnOzM5WnulUcIBYtvu5PAqXceahpoMVIjJcG6T0E3piiLDL
	OINt+t/K3KlNtPWD3zUPO1ODXS7TXyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-jD5_S8JbPO-TKH2n_LwDxA-1; Tue, 01 Jun 2021 11:01:27 -0400
X-MC-Unique: jD5_S8JbPO-TKH2n_LwDxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 322CEEC1A2;
	Tue,  1 Jun 2021 15:01:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8CAA60BD8;
	Tue,  1 Jun 2021 15:01:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 379D344A57;
	Tue,  1 Jun 2021 15:01:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 151F1IST003028 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 1 Jun 2021 11:01:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1167376E; Tue,  1 Jun 2021 15:01:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB81F5D9D5
	for <cluster-devel@redhat.com>; Tue,  1 Jun 2021 15:01:15 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 955D044A57
	for <cluster-devel@redhat.com>; Tue,  1 Jun 2021 15:01:15 +0000 (UTC)
Date: Tue, 1 Jun 2021 11:01:15 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <476705118.34917344.1622559675541.JavaMail.zimbra@redhat.com>
In-Reply-To: <1185476875.34917197.1622559665475.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.53, 10.4.195.4]
Thread-Topic: gfs2: Fix glock recursion in freeze_go_xmote_bh
Thread-Index: F7rVPYetzexnO5sFkP5gIGNEnq3vxA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [gfs2 PATCH] gfs2: Fix glock recursion in
	freeze_go_xmote_bh
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

We must not call gfs2_consist (which does a file system withdraw) from
the freeze glock's freeze_go_xmote_bh function because the withdraw
will try to use the freeze glock, thus causing a glock recursion error.

This patch changes freeze_go_xmote_bh to call function
gfs2_assert_withdraw_delayed instead of gfs2_consist to avoid recursion.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 54d3fbeb3002..4939308d54f3 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -604,24 +604,24 @@ static int freeze_go_xmote_bh(struct gfs2_glock *gl)
 	struct gfs2_inode *ip = GFS2_I(sdp->sd_jdesc->jd_inode);
 	struct gfs2_glock *j_gl = ip->i_gl;
 	struct gfs2_log_header_host head;
-	int error;
+	int error = 0;
 
 	if (test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags)) {
 		j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
 
 		error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
-		if (error)
-			gfs2_consist(sdp);
-		if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT))
-			gfs2_consist(sdp);
-
-		/*  Initialize some head of the log stuff  */
-		if (!gfs2_withdrawn(sdp)) {
-			sdp->sd_log_sequence = head.lh_sequence + 1;
-			gfs2_log_pointers_init(sdp, head.lh_blkno);
+		if (gfs2_assert_withdraw_delayed(sdp, !error))
+			goto out;
+		if (gfs2_assert_withdraw_delayed(sdp, head.lh_flags &
+						 GFS2_LOG_HEAD_UNMOUNT)) {
+			error = -EIO;
+			goto out;
 		}
+		sdp->sd_log_sequence = head.lh_sequence + 1;
+		gfs2_log_pointers_init(sdp, head.lh_blkno);
 	}
-	return 0;
+out:
+	return error;
 }
 
 /**

