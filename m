Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 327B6328204
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Mar 2021 16:16:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614611802;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5UigUF6K396bi7l2q/0AhmPd9amItqXnLmNW8pikgUc=;
	b=OLLZ7nT5wQV4OaEr6iUBDRSRJFHrZQMxbsMDh5NEqyByEReNzrrtRRtBJVSUvc4SzyXFjd
	MpSzzrGGApbTMk9CXX07h3CFPC9EgxLfSVzMNudFgxCtXfFsojvB3SBlXymsbIbEqiUE6Q
	xFkh/sdCnxQ1UqDvOr46/TBaTAZekKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-tBqLLwGwPeSA266R3Y77uQ-1; Mon, 01 Mar 2021 10:16:40 -0500
X-MC-Unique: tBqLLwGwPeSA266R3Y77uQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D318B107ACC7;
	Mon,  1 Mar 2021 15:16:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC7345D9E4;
	Mon,  1 Mar 2021 15:16:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9832F18095CE;
	Mon,  1 Mar 2021 15:16:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 121FGRg1020463 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Mar 2021 10:16:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2F704100239A; Mon,  1 Mar 2021 15:16:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-35.rdu2.redhat.com [10.10.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB0661002393;
	Mon,  1 Mar 2021 15:16:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  1 Mar 2021 10:16:14 -0500
Message-Id: <20210301151614.220263-2-aahringo@redhat.com>
In-Reply-To: <20210301151614.220263-1-aahringo@redhat.com>
References: <20210301151614.220263-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 2/2] dlm_controld: log receive
	buffer fail
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds additional handling to log failures of setting receive
buffer failures to ensure on debugging if dlm_controld increased the
netlink receive buffer size.
---
 dlm_controld/main.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index bcccec4c..2df305bd 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -765,8 +765,7 @@ static void process_uevent(int ci)
 static int setup_uevent(void)
 {
 	struct sockaddr_nl snl;
-	int rcvbuf;
-	int s, rv;
+	int s, rv, val;
 
 	s = socket(AF_NETLINK, SOCK_DGRAM, NETLINK_KOBJECT_UEVENT);
 	if (s < 0) {
@@ -788,9 +787,14 @@ static int setup_uevent(void)
 	 * receive ENOBUFS but it's more unlikely. May it's worth to handle ENOBUFS
 	 * errors on a different way in future.
 	 */
-	rcvbuf = DEFAULT_NETLINK_RCVBUF;
-	setsockopt(s, SOL_SOCKET, SO_RCVBUF, &rcvbuf, sizeof(rcvbuf));
-	setsockopt(s, SOL_SOCKET, SO_RCVBUFFORCE, &rcvbuf, sizeof(rcvbuf));
+	val = DEFAULT_NETLINK_RCVBUF;
+	rv = setsockopt(s, SOL_SOCKET, SO_RCVBUF, &val, sizeof(val));
+	if (rv == -1)
+		log_error("uevent netlink SO_RCVBUF errno %d", errno);
+
+	rv = setsockopt(s, SOL_SOCKET, SO_RCVBUFFORCE, &val, sizeof(val));
+	if (rv == -1)
+		log_error("uevent netlink SO_RCVBUFFORCE errno %d", errno);
 
 	memset(&snl, 0, sizeof(snl));
 	snl.nl_family = AF_NETLINK;
-- 
2.26.2

