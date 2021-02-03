Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A8C8A30E1F5
	for <lists+cluster-devel@lfdr.de>; Wed,  3 Feb 2021 19:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612375701;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PLanyy8/9iKcBjiD5l2yP3ZS5/Yexek2YEC8gkwEtYM=;
	b=DxAc1X5r147olRpM6ojYnAO6uqv9RsvBVl6w//j4/GVmrvJB6Qz78fhs0DplHvTMYdMR9n
	hWSOXzygSS5/eziYckpq0PhrBV+ta5zV4AlcmTRAdbEKG8y7LnI/Dpt/XBRA41V0Vz0gYZ
	rpKVSSrYPv7Qs728MONB9meod7pflbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-AWZAxXaROTqCJndyYZaq1g-1; Wed, 03 Feb 2021 13:08:20 -0500
X-MC-Unique: AWZAxXaROTqCJndyYZaq1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C21AE801970;
	Wed,  3 Feb 2021 18:08:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B16B8722CC;
	Wed,  3 Feb 2021 18:08:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 95AA457DFE;
	Wed,  3 Feb 2021 18:08:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113I8F2l028646 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 13:08:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5446760D07; Wed,  3 Feb 2021 18:08:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-112-155.ams2.redhat.com [10.36.112.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DEBE709B7;
	Wed,  3 Feb 2021 18:08:14 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  3 Feb 2021 19:07:49 +0100
Message-Id: <20210203180755.246596-15-agruenba@redhat.com>
In-Reply-To: <20210203180755.246596-1-agruenba@redhat.com>
References: <20210203180755.246596-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v4 14/20] gfs2: Use a tighter bound in
	gfs2_trans_begin
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use a tighter bound for the number of blocks required by transactions in
gfs2_trans_begin: in the worst case, we'll have mixed data and metadata,
so we'll need a log desciptor for each type.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/trans.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index cac93b2004cf..f73d6b8f3b53 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -54,8 +54,14 @@ int __gfs2_trans_begin(struct gfs2_trans *tr, struct gfs2_sbd *sdp,
 	tr->tr_blocks = blocks;
 	tr->tr_revokes = revokes;
 	tr->tr_reserved = 1;
-	if (blocks)
-		tr->tr_reserved += 6 + blocks;
+	if (blocks) {
+		/*
+		 * The reserved blocks are either used for data or metadata.
+		 * We can have mixed data and metadata, each with its own log
+		 * descriptor block; see calc_reserved().
+		 */
+		tr->tr_reserved += blocks + 1 + DIV_ROUND_UP(blocks - 1, databuf_limit(sdp));
+	}
 	if (revokes)
 		tr->tr_reserved += gfs2_struct2blk(sdp, revokes);
 	INIT_LIST_HEAD(&tr->tr_databuf);
-- 
2.26.2

