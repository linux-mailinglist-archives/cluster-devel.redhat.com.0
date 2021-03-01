Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDCB328203
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Mar 2021 16:16:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614611796;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f95MC8utrjCALx08r5MwKEe+uy5lAmy3c6aYkRUPZAQ=;
	b=Qc/sez1AmTioyqELCrWsTUcbvpJ7KI1o9RNXAkNYyIEloNykbh5FIM5Tu54BgCP35uul6A
	af++KHyR30OS4Ag3EJvY/IT7mqcx9e8I0JrEiAFLQJc3FGgzDW60p3wQqvTcO0wey7CLNp
	09bTDXgLkB9lgJFMUlD8+iuxWTyQKBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-7c3KUu-KMNu8wHBP6h05pA-1; Mon, 01 Mar 2021 10:16:34 -0500
X-MC-Unique: 7c3KUu-KMNu8wHBP6h05pA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB92518B9ED1;
	Mon,  1 Mar 2021 15:16:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FE6310016FD;
	Mon,  1 Mar 2021 15:16:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8373057DFA;
	Mon,  1 Mar 2021 15:16:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 121FGQdZ020458 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Mar 2021 10:16:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 950C41001E73; Mon,  1 Mar 2021 15:16:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-35.rdu2.redhat.com [10.10.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39ABA10016FD;
	Mon,  1 Mar 2021 15:16:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  1 Mar 2021 10:16:13 -0500
Message-Id: <20210301151614.220263-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 1/2] Revert "dlm_controld: improve
	netlink ENOBUFS error handling"
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This reverts commit a9b6e5beb8c20e2f76a637327a55683efc582e1c.

The reason why this patch should be reverted is that NETLINK_NO_ENOBUFS
option will just disable ENOBUFS errors and don't put netlink in any
kind of reliable mode. It's just disable receiving this error and does
not try to avoid that such error occurs by doing any kind of additional
handling. There exists ways to make netlink reliable on top of netlink
interface implementation of the kernel, however this isn't done yet.
Another solution would be to filter inside the kernel or switch to
polling.

I need to look again into this problem, what I can say is that after
receiving such error and increasing the receive buffer size to two
megabyte (by /proc/sys/net/core/rmem_default) as temporary solution was
solving the issue for the specific case. For this reason we reverting
this patch and switching back to increase of the receiving socket buffer.
Although this is only a solution when there exists a "burst" of message,
if we constantly have a huge amount of message it will end in congestion
and ENOBUFS occurs again after some time. Therefore, is a reliable switch
(like what I was thinking what NETLINK_NO_ENOBUFS was doing in a magic
way) not the right solution as well.

Final thoughts, I don't believe a lot of people running into this issue.
The related machine which had the ENOBUFS error had a lot of udev messages
going on because registering and deregistering devices, but it is a problem.
---
 dlm_controld/main.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index c35756d4..bcccec4c 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -765,7 +765,8 @@ static void process_uevent(int ci)
 static int setup_uevent(void)
 {
 	struct sockaddr_nl snl;
-	int s, rv, val;
+	int rcvbuf;
+	int s, rv;
 
 	s = socket(AF_NETLINK, SOCK_DGRAM, NETLINK_KOBJECT_UEVENT);
 	if (s < 0) {
@@ -782,31 +783,14 @@ static int setup_uevent(void)
 	 * the  application  to  detect  when  this happens (via the ENOBUFS error
 	 * returned by recvmsg(2)) and resynchronize.
 	 *
-	 * To avoid ENOBUFS errors we set the netlink socket to realiable
-	 * transmission mode which can be turned on by NETLINK_NO_ENOBUFS
-	 * option. This option is available since kernel 2.6.30. If this setting
-	 * fails we fallback to increase the netlink socket receive buffer.
+	 * To prevent ENOBUFS errors we just set the receive buffer to two
+	 * megabyte as other applications do it. This will not ensure that we never
+	 * receive ENOBUFS but it's more unlikely. May it's worth to handle ENOBUFS
+	 * errors on a different way in future.
 	 */
-	val = 1;
-	rv = setsockopt(s, SOL_NETLINK, NETLINK_NO_ENOBUFS, &val, sizeof(val));
-	if (rv == -1) {
-		/* Fallback handling if NETLINK_NO_ENOBUFS fails to set.
-		 *
-		 * To prevent ENOBUFS errors we just set the receive buffer to
-		 * two megabyte as other applications do it. This will not
-		 * ensure that we never receive ENOBUFS but it's more unlikely.
-		 */
-		val = DEFAULT_NETLINK_RCVBUF;
-		log_error("uevent netlink NETLINK_NO_ENOBUFS errno %d, will set rcvbuf to %d bytes", errno, val);
-
-		rv = setsockopt(s, SOL_SOCKET, SO_RCVBUF, &val, sizeof(val));
-		if (rv == -1)
-			log_error("uevent netlink SO_RCVBUF errno %d", errno);
-
-		rv = setsockopt(s, SOL_SOCKET, SO_RCVBUFFORCE, &val, sizeof(val));
-		if (rv == -1)
-			log_error("uevent netlink SO_RCVBUFFORCE errno %d", errno);
-	}
+	rcvbuf = DEFAULT_NETLINK_RCVBUF;
+	setsockopt(s, SOL_SOCKET, SO_RCVBUF, &rcvbuf, sizeof(rcvbuf));
+	setsockopt(s, SOL_SOCKET, SO_RCVBUFFORCE, &rcvbuf, sizeof(rcvbuf));
 
 	memset(&snl, 0, sizeof(snl));
 	snl.nl_family = AF_NETLINK;
-- 
2.26.2

