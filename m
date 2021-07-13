Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6113C763F
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jul 2021 20:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626199817;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4HJwJiO/0T2TzVKWkAVOFOCp4J5vfrvtjusutUD9jjM=;
	b=CWBFOd7wDVr5DZx9z4KTttNxvz7r8cezPqIpGu0hR+uvv9h2xd6ICAx3wkOXHda6aByPB3
	OURhMbz7JuY/vLrBPUdFSkK2EDnwfzfHM32stll29PR9bp0sTEn8EzUFS44fcAhF34KEsy
	CEtK6K+5jXdWsvx4Hpwpbb+ZyqaMY7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-ecxcLAtmPFq1ndjLsXUxWg-1; Tue, 13 Jul 2021 14:10:16 -0400
X-MC-Unique: ecxcLAtmPFq1ndjLsXUxWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 163C71800D41;
	Tue, 13 Jul 2021 18:10:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 059B119C44;
	Tue, 13 Jul 2021 18:10:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E342A4EA2F;
	Tue, 13 Jul 2021 18:10:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16DIA4cw022109 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Jul 2021 14:10:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E3B64100F49F; Tue, 13 Jul 2021 18:10:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2CEA100EB3D
	for <cluster-devel@redhat.com>; Tue, 13 Jul 2021 18:10:04 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 13 Jul 2021 13:09:53 -0500
Message-Id: <20210713180958.66995-6-rpeterso@redhat.com>
In-Reply-To: <20210713180958.66995-1-rpeterso@redhat.com>
References: <20210713180958.66995-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 05/10] gfs2: tiny cleanup in
	gfs2_log_reserve
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

Function gfs2_log_reserve was setting revoke_blks to 0. There's no
need because it calculates it shortly thereafter. This patch removes
the unnecessary set.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 42c15cfc0821..f0ee3ff6f9a8 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -594,7 +594,7 @@ void gfs2_log_reserve(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
 {
 	unsigned int blks = tr->tr_reserved;
 	unsigned int revokes = tr->tr_revokes;
-	unsigned int revoke_blks = 0;
+	unsigned int revoke_blks;
 
 	*extra_revokes = 0;
 	if (revokes) {
-- 
2.31.1

