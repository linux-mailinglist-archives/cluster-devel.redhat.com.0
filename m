Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 179633065B0
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jan 2021 22:11:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611781916;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UcLTAddk/9miZ/O4SCycQ3bxWj49YA7plXcTNuXzG5Q=;
	b=CZ5KtqBdhmh3R4KWlBExDp1Lr2aHMv1TUz/JA5ViFLGOeQbkfRdcSPlJN3lVQwZgd4iI/n
	fyjqB0yPC97bc2cD3yfR8ef0ScTGYsfS8kfv27mLBrQc4KPx5nmtibfEUMLJtwi2LlBoso
	f2p9tfFuGMw+n0Yncmj+uox6UcZ20TM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-1Ssmbnb5OI63Kfj97UIx2A-1; Wed, 27 Jan 2021 16:11:53 -0500
X-MC-Unique: 1Ssmbnb5OI63Kfj97UIx2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F89091205;
	Wed, 27 Jan 2021 21:11:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00B6877BFB;
	Wed, 27 Jan 2021 21:11:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E08131809CAB;
	Wed, 27 Jan 2021 21:11:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RL7vHw013781 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 16:07:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 39CD52BFE9; Wed, 27 Jan 2021 21:07:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7476F6F451;
	Wed, 27 Jan 2021 21:07:56 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 Jan 2021 22:07:31 +0100
Message-Id: <20210127210746.16958-6-agruenba@redhat.com>
In-Reply-To: <20210127210746.16958-1-agruenba@redhat.com>
References: <20210127210746.16958-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 05/20] gfs2: Minor debugging improvement
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Split the assert in gfs2_trans_end into two parts.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/trans.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 6d4bf7ea7b3b..7705f04621f4 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -109,8 +109,8 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 	nbuf -= tr->tr_num_buf_rm;
 	nbuf -= tr->tr_num_databuf_rm;
 
-	if (gfs2_assert_withdraw(sdp, (nbuf <= tr->tr_blocks) &&
-				       (tr->tr_num_revoke <= tr->tr_revokes)))
+	if (gfs2_assert_withdraw(sdp, nbuf <= tr->tr_blocks) ||
+	    gfs2_assert_withdraw(sdp, tr->tr_num_revoke <= tr->tr_revokes))
 		gfs2_print_trans(sdp, tr);
 
 	gfs2_log_commit(sdp, tr);
-- 
2.26.2

