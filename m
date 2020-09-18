Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3E15F26FFCF
	for <lists+cluster-devel@lfdr.de>; Fri, 18 Sep 2020 16:28:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600439280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q+2de93xHimHLqc+INj+VIXnfe4bGLHfgou1vAaNybY=;
	b=CkHnDR/3b+IupQYKs1UnfjqC0cmFwyxTi2RLV903KHhPEiMr9TNzFpbidwI986Y8pWgGBR
	Cpoi1qnIc2f+9NXfn0cc+nvpzAh2ZBLn/ig6Q0V7HGW3RvlXhC+JtaBY23XvVdx2QoiSOr
	TMI5mTgNlRggv36hgkEFsXVziBqNak8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-yt8EBH0WOlWm0BirUv4GsQ-1; Fri, 18 Sep 2020 10:27:58 -0400
X-MC-Unique: yt8EBH0WOlWm0BirUv4GsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C49D81007B35;
	Fri, 18 Sep 2020 14:27:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3E6D61177;
	Fri, 18 Sep 2020 14:27:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 999118C7AC;
	Fri, 18 Sep 2020 14:27:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08IERl30002420 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 10:27:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD00855764; Fri, 18 Sep 2020 14:27:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-112-228.rdu2.redhat.com [10.10.112.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 416D255762;
	Fri, 18 Sep 2020 14:27:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 18 Sep 2020 10:27:25 -0400
Message-Id: <20200918142728.147392-4-aahringo@redhat.com>
In-Reply-To: <20200918142728.147392-1-aahringo@redhat.com>
References: <20200918142728.147392-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 3/6] fs: dlm: disallow buffer size
	below default
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

I observed dlm messages cannot below this value delivered from upper
layers. This buffer is used inside the current receive handling to copy a
dlm message into it. However we should not allow sizes below the default
value.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 2b30104a34cef..1734f2e861924 100644
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
@@ -897,7 +903,6 @@ int dlm_our_addr(struct sockaddr_storage *addr, int num)
 
 /* Config file defaults */
 #define DEFAULT_TCP_PORT       21064
-#define DEFAULT_BUFFER_SIZE     4096
 #define DEFAULT_RSBTBL_SIZE     1024
 #define DEFAULT_RECOVER_TIMER      5
 #define DEFAULT_TOSS_SECS         10
-- 
2.26.2

