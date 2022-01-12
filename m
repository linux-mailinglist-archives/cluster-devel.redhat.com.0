Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFB048CBEC
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015658;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AGhpMybrVgDJ94G7z8/qgsuWEjTCKFnyA5mCUwwJjko=;
	b=MUKVgMvWya9jVI/8mAPjJ0XdbxykeC3plMUvXFqdKtpzszmOKIA6Is3Kgqu6woq7BLTzxJ
	Q+xDkIE4LZY/ilHt2MffO3NMoaUxuQYefGcxRR5nSmOMo/LG5P1FbIN3i9zWIgo/kXAgQi
	YNHN5+IXxR6frAdxj3ifBtuUaolKsZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-GhQNoFbqPWG1fB1yvXXDJw-1; Wed, 12 Jan 2022 14:27:35 -0500
X-MC-Unique: GhQNoFbqPWG1fB1yvXXDJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89B6F83DD20;
	Wed, 12 Jan 2022 19:27:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77AAA4BC4A;
	Wed, 12 Jan 2022 19:27:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 631854A706;
	Wed, 12 Jan 2022 19:27:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJRUPF009402 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3DAE42B178; Wed, 12 Jan 2022 19:27:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59E0A60657
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:29 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:47 +0000
Message-Id: <20220112192650.1426415-16-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 15/18] libgfs2: Remove debugging printfs
	from fix_device_geometry()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This block never gets executed as the only utils that enable cfg_debug
don't call the function.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/device_geometry.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/gfs2/libgfs2/device_geometry.c b/gfs2/libgfs2/device_geometry.c
index 4a0aeab2..b149d2c0 100644
--- a/gfs2/libgfs2/device_geometry.c
+++ b/gfs2/libgfs2/device_geometry.c
@@ -98,10 +98,4 @@ void fix_device_geometry(struct gfs2_sbd *sdp)
 	struct device *device = &sdp->device;
 
 	device->length = sdp->dinfo.size / sdp->sd_bsize;
-
-	if (cfg_debug) {
-		printf("\nDevice Geometry:  (in FS blocks)\n");
-		printf("  length = %"PRIu64"\n", device->length);
-		printf("\nDevice Size: %"PRIu64"\n", sdp->dinfo.size);
-	}
 }
-- 
2.34.1

