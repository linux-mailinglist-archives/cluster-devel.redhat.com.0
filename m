Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 25B5E277406
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Sep 2020 16:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600957964;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ttMcK/vUdmcjkpcskGVwBwlXaktwDQJPeIpoK33Le48=;
	b=WuM7DjuRE2TgefqLs0AICNX1k6sUu5QY5bMqN7sjHy+GpUDPST8sy7qW6y1N68GTxx8QCD
	Vqr/Ifaz/1ESvYnIP22hRmmdjNwAI62ODa/b11jvO5JAy5/DudXu2OC45kOwrSq7MDMWtE
	lXDkmVdD5pFwiU6Gaq3bHUugyPEne3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359--i1vhDPdNaOqJOCjt8NRXw-1; Thu, 24 Sep 2020 10:32:41 -0400
X-MC-Unique: -i1vhDPdNaOqJOCjt8NRXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B91380B713;
	Thu, 24 Sep 2020 14:32:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AA6E5D9D3;
	Thu, 24 Sep 2020 14:32:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBF7C8C7A2;
	Thu, 24 Sep 2020 14:32:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OEWbCr001031 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 10:32:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 615105D9DD; Thu, 24 Sep 2020 14:32:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-178.rdu2.redhat.com [10.10.114.178])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1E0F5D9D3;
	Thu, 24 Sep 2020 14:32:33 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 24 Sep 2020 10:31:25 -0400
Message-Id: <20200924143126.158629-5-aahringo@redhat.com>
In-Reply-To: <20200924143126.158629-1-aahringo@redhat.com>
References: <20200924143126.158629-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 4/5] fs: dlm: disallow buffer
	size below default
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

I observed that the upper layer will not send messages above this value.
As conclusion the application receive buffer should not below that
value, otherwise we are not capable to deliver the dlm message to the
upper layer. This patch forbids to set the receive buffer below the
maximum possible dlm message size.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index e03b409a4df01..a4bed304a8430 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -166,8 +166,14 @@ static bool dlm_check_zero(unsigned int x)
 	return !x;
 }
 
+#define DEFAULT_BUFFER_SIZE     4096
+static bool dlm_check_buffer_size(unsigned int x)
+{
+	return (x < DEFAULT_BUFFER_SIZE);
+}
+
 CLUSTER_ATTR(tcp_port, dlm_check_zero);
-CLUSTER_ATTR(buffer_size, dlm_check_zero);
+CLUSTER_ATTR(buffer_size, dlm_check_buffer_size);
 CLUSTER_ATTR(rsbtbl_size, dlm_check_zero);
 CLUSTER_ATTR(recover_timer, dlm_check_zero);
 CLUSTER_ATTR(toss_secs, dlm_check_zero);
@@ -901,7 +907,6 @@ int dlm_our_addr(struct sockaddr_storage *addr, int num)
 
 /* Config file defaults */
 #define DEFAULT_TCP_PORT       21064
-#define DEFAULT_BUFFER_SIZE     4096
 #define DEFAULT_RSBTBL_SIZE     1024
 #define DEFAULT_RECOVER_TIMER      5
 #define DEFAULT_TOSS_SECS         10
-- 
2.26.2

