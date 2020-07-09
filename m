Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFBA21A776
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jul 2020 21:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594321502;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hnvHOP/DzHKgtviAY24ue7zSqLjUjg3UEUfLZn32sg8=;
	b=a2n64J8eT4io65KQnx1Hstp0IWnwik1N6hq5xKZdT4CrBReiwsvv1jMDr5GMx8oq3u8b1K
	Ns8RyRKdj9Kj/8+MAqPNr+QAmNCoLMowpnsJXcj8pzf0Gg5fEXrIGYm9SXwBYXSbMzjVhO
	9s4amwdtaFuxhKbOKHJgYkQ4/RgmZFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-Ih53Eu40O16gNEuL1UOIZA-1; Thu, 09 Jul 2020 15:04:58 -0400
X-MC-Unique: Ih53Eu40O16gNEuL1UOIZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9AD71800D42;
	Thu,  9 Jul 2020 19:04:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AB096FEC6;
	Thu,  9 Jul 2020 19:04:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8722E180954D;
	Thu,  9 Jul 2020 19:04:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069J0U1s025600 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 15:00:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9BCDB7F8A5; Thu,  9 Jul 2020 19:00:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-75.rdu2.redhat.com [10.10.114.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 108D25BACF;
	Thu,  9 Jul 2020 19:00:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  9 Jul 2020 14:59:59 -0400
Message-Id: <20200709190001.102450-2-aahringo@redhat.com>
In-Reply-To: <20200709190001.102450-1-aahringo@redhat.com>
References: <20200709190001.102450-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 1/3] dlm_controld: don't abort node
	configuration
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

In case of not having mark value file we don't abort the whole
configuration if any error on open fails. We skip this specific setting
and jump to the next one since it's not mandatory to have a correct mark
setting. It will still appear inside the logs.
---
 dlm_controld/action.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/dlm_controld/action.c b/dlm_controld/action.c
index 63040227..bc9c44f2 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -642,6 +642,9 @@ int add_configfs_node(int nodeid, char *addr, int addrlen, int local,
 
 	/*
 	 * set skb mark for nodeid
+	 *
+	 * If open() fails we skip it because kernel doesn't support it.
+	 * It's not a required confiuration. It will show up in the log.
 	 */
 
 	memset(path, 0, PATH_MAX);
@@ -650,7 +653,7 @@ int add_configfs_node(int nodeid, char *addr, int addrlen, int local,
 	fd = open(path, O_WRONLY);
 	if (fd < 0) {
 		log_error("%s: open failed: %d", path, errno);
-		return -1;
+		goto skip_non_required;
 	}
 
 	memset(buf, 0, sizeof(buf));
@@ -664,6 +667,8 @@ int add_configfs_node(int nodeid, char *addr, int addrlen, int local,
 	}
 	close(fd);
 
+skip_non_required:
+
 	/*
 	 * set local
 	 */
-- 
2.26.2

