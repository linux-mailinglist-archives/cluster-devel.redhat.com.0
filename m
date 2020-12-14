Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 49F412D9469
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Dec 2020 09:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607936113;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sD5iqE0R9Nc6awKl39SnJkenbWW6Qn6sxW5HlRh7TaY=;
	b=CIx1H3n5YJVoLXg4v2zTvCkLlCL2aidnP2URmQiB/1ZxI0rP63uDaA/amGyldeJJMPTza+
	Nkh8xfnBnxioTJL3ImafG/EKNY1JLlx3WEri+zIdm0s31TdTMlmcKth/+yN5Zphlrl5NLN
	rCzYCPlENeF67taWoAVbYOaiuh3D2eA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-Y05SM6IVMiWee2VRJzFofA-1; Mon, 14 Dec 2020 03:55:11 -0500
X-MC-Unique: Y05SM6IVMiWee2VRJzFofA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 217CD100F356;
	Mon, 14 Dec 2020 08:55:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11E6660BE2;
	Mon, 14 Dec 2020 08:55:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0BF15002C;
	Mon, 14 Dec 2020 08:55:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BE8t8HN016511 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 03:55:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 54E3D62467; Mon, 14 Dec 2020 08:55:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.194])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EE426268F;
	Mon, 14 Dec 2020 08:55:03 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 14 Dec 2020 09:54:42 +0100
Message-Id: <20201214085442.45467-13-agruenba@redhat.com>
In-Reply-To: <20201214085442.45467-1-agruenba@redhat.com>
References: <20201214085442.45467-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 12/12] gfs2: Use a tighter bound in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
index c9d8247ffa19..6a6b07499d07 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -60,8 +60,14 @@ int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
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

