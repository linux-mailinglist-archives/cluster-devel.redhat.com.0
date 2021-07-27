Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC343D7C43
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 19:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627407443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p1frhUmbxCxqLdJvyHlsFW/aNFT+C4TR4DMKqkZXjNA=;
	b=ESGrFTkKPc1YIzxZEMWL0lIQ0beWfBlSI69HnOWRwqWreOg/Ty4J9I04VcjztuePa7OmEI
	vfuv148YkFmfpE5bWzh1pexQ82pC3U60nHDfzkkyUbopCqZ9LlQmAozBgOZBpeO1VY+Lib
	4qYSHuUyD2dN8a/MT79/AaD7tdxU0zw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-bEtCZzTaPlOW9lOlKpd1yQ-1; Tue, 27 Jul 2021 13:37:22 -0400
X-MC-Unique: bEtCZzTaPlOW9lOlKpd1yQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C13A802C89;
	Tue, 27 Jul 2021 17:37:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F8C46060F;
	Tue, 27 Jul 2021 17:37:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C64084A7C8;
	Tue, 27 Jul 2021 17:37:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RHbFT4022790 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 13:37:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 40C581980E; Tue, 27 Jul 2021 17:37:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-120.phx2.redhat.com [10.3.112.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12CBB19630
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 17:37:15 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Jul 2021 12:36:56 -0500
Message-Id: <20210727173709.210711-3-rpeterso@redhat.com>
In-Reply-To: <20210727173709.210711-1-rpeterso@redhat.com>
References: <20210727173709.210711-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 02/15] gfs2: Fix glock recursion in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

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
-- 
2.31.1

