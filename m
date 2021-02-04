Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CD9AC30FFA5
	for <lists+cluster-devel@lfdr.de>; Thu,  4 Feb 2021 22:51:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612475486;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OSHtZV0Rt/jdRPx1BfNJ5rXr//hxgt7lKkstxU5JlkQ=;
	b=gyDJ0XvHYt2ZEmLudGAJCjwgoKNHHzYEz36H76uauZ9fQ47QuIx00njc75FdFkS5+vbOtV
	oCoYZ4E7gIXrdaqVVZyLNoekJRmtTc1w2mSvgV5Ggoiin5KoyD2mjXpjdNdYUJNvNZ28XM
	ferUEizywR6hDCMQvpnSGUE+jI9g9mM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-NJnm-LzyMW22TEwzMezKTA-1; Thu, 04 Feb 2021 16:51:18 -0500
X-MC-Unique: NJnm-LzyMW22TEwzMezKTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B33AD192D794;
	Thu,  4 Feb 2021 21:51:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A38886A252;
	Thu,  4 Feb 2021 21:51:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4753118095C7;
	Thu,  4 Feb 2021 21:51:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 114Lp9YK027517 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 4 Feb 2021 16:51:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D1421B533; Thu,  4 Feb 2021 21:51:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-190.rdu2.redhat.com [10.10.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 826A560C16;
	Thu,  4 Feb 2021 21:51:08 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  4 Feb 2021 16:50:50 -0500
Message-Id: <20210204215056.774409-4-aahringo@redhat.com>
In-Reply-To: <20210204215056.774409-1-aahringo@redhat.com>
References: <20210204215056.774409-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 3/9] fs: dlm: add errno handling to
	check callback
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

This allows to return individual errno values for the config attribute
check callback instead of returning invalid argument only.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 49c5f9407098..73e6643903af 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -125,7 +125,7 @@ static ssize_t cluster_cluster_name_store(struct config_item *item,
 CONFIGFS_ATTR(cluster_, cluster_name);
 
 static ssize_t cluster_set(struct dlm_cluster *cl, unsigned int *cl_field,
-			   int *info_field, bool (*check_cb)(unsigned int x),
+			   int *info_field, int (*check_cb)(unsigned int x),
 			   const char *buf, size_t len)
 {
 	unsigned int x;
@@ -137,8 +137,11 @@ static ssize_t cluster_set(struct dlm_cluster *cl, unsigned int *cl_field,
 	if (rc)
 		return rc;
 
-	if (check_cb && check_cb(x))
-		return -EINVAL;
+	if (check_cb) {
+		rc = check_cb(x);
+		if (rc)
+			return rc;
+	}
 
 	*cl_field = x;
 	*info_field = x;
@@ -161,14 +164,20 @@ static ssize_t cluster_##name##_show(struct config_item *item, char *buf)     \
 }                                                                             \
 CONFIGFS_ATTR(cluster_, name);
 
-static bool dlm_check_zero(unsigned int x)
+static int dlm_check_zero(unsigned int x)
 {
-	return !x;
+	if (!x)
+		return -EINVAL;
+
+	return 0;
 }
 
-static bool dlm_check_buffer_size(unsigned int x)
+static int dlm_check_buffer_size(unsigned int x)
 {
-	return (x < DEFAULT_BUFFER_SIZE);
+	if (x < DEFAULT_BUFFER_SIZE)
+		return -EINVAL;
+
+	return 0;
 }
 
 CLUSTER_ATTR(tcp_port, dlm_check_zero);
-- 
2.26.2

