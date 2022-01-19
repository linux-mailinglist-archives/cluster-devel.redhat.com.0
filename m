Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2A4938C8
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:44:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589081;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kutpOLVu3yhFw+aUAoZ4QmIe5tFce777qgsaDnMpilk=;
	b=dg1d06YKl/UXNQo+rEtNYNXy+uNqPTu77WiKVqCdrk4E1xAdlk0It9ub7Xut7GmbmkiOuo
	iYXt/jJLmJ6vbZj5MlFPH3c56alsGrz6zl8PeGj8oYKv28CeMQX88rX1qfE1BIl73Lu2Yy
	t0iyfe9godhCWYoHr5M6TbX/x1iI6bM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-mkqdd_CDOcGTFeeyf6zXXQ-1; Wed, 19 Jan 2022 05:44:38 -0500
X-MC-Unique: mkqdd_CDOcGTFeeyf6zXXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEDE92F45;
	Wed, 19 Jan 2022 10:44:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E08336D034;
	Wed, 19 Jan 2022 10:44:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE9604BB7C;
	Wed, 19 Jan 2022 10:44:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAiX4G024572 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:44:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9DBD478B10; Wed, 19 Jan 2022 10:44:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED02978B1F
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:44:32 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:13 +0000
Message-Id: <20220119104316.2489995-19-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 18/21] libgfs2: Namespace improvements -
	struct device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Rename to struct lgfs2_device.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/rgrepair.c           | 4 ++--
 gfs2/libgfs2/device_geometry.c | 2 +-
 gfs2/libgfs2/libgfs2.h         | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 5bfbb7da..b74eaa4a 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -696,7 +696,7 @@ out:
  *
  * Returns: the number of RGs
  */
-static uint64_t how_many_rgrps(struct lgfs2_sbd *sdp, struct device *dev)
+static uint64_t how_many_rgrps(struct lgfs2_sbd *sdp, struct lgfs2_device *dev)
 {
 	uint64_t nrgrp;
 	uint32_t rgblocks1, rgblocksn, bitblocks1, bitblocksn;
@@ -732,7 +732,7 @@ static uint64_t how_many_rgrps(struct lgfs2_sbd *sdp, struct device *dev)
  */
 static struct osi_root compute_rgrp_layout(struct lgfs2_sbd *sdp)
 {
-	struct device *dev;
+	struct lgfs2_device *dev;
 	struct rgrp_tree *rl, *rlast = NULL;
 	unsigned int rgrp = 0, nrgrp, rglength;
 	struct osi_root rgtree = {NULL};
diff --git a/gfs2/libgfs2/device_geometry.c b/gfs2/libgfs2/device_geometry.c
index c6c00c95..1950d017 100644
--- a/gfs2/libgfs2/device_geometry.c
+++ b/gfs2/libgfs2/device_geometry.c
@@ -94,7 +94,7 @@ size_check:
 
 void lgfs2_fix_device_geometry(struct lgfs2_sbd *sdp)
 {
-	struct device *device = &sdp->device;
+	struct lgfs2_device *device = &sdp->device;
 
 	device->length = sdp->dinfo.size / sdp->sd_bsize;
 }
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 3673182b..2fc831e4 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -156,7 +156,7 @@ struct lgfs2_dev_info {
 	uint64_t size;
 };
 
-struct device {
+struct lgfs2_device {
 	uint64_t length;
 };
 
@@ -361,7 +361,7 @@ struct lgfs2_sbd {
 	int64_t sd_time;
 
 	struct lgfs2_dev_info dinfo;
-	struct device device;
+	struct lgfs2_device device;
 
 	int device_fd;
 	int path_fd;
-- 
2.34.1

