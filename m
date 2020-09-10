Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 723392645E9
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Sep 2020 14:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599740597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EUu+2JYVOuRW6RuXtNStP3fAEvhSnV5CwjmGJlJfTTE=;
	b=i5KEG/cttBR96XkYFf+JPfeQ+Me+54cXIUIbbWydglgQxVPehcXNe2n6ap0inrhE3QDEcX
	pobmMDd6vtcH0T9nTvQl16QnKmDMqjq7oMBm5W1GHevEMwQM3TpOp2ftylHCQPsEk/7OG5
	bFQYJHW/Ys/ZHqZ29eg8P55pjYB++Go=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-htjQR6rtPTOWf99lf2n0GA-1; Thu, 10 Sep 2020 08:23:15 -0400
X-MC-Unique: htjQR6rtPTOWf99lf2n0GA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 510C0425E2;
	Thu, 10 Sep 2020 12:23:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76F1028547;
	Thu, 10 Sep 2020 12:23:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 556DB1826D2B;
	Thu, 10 Sep 2020 12:23:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ACN4Uw002962 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 08:23:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3FBBD5DA7B; Thu, 10 Sep 2020 12:23:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-93.rdu2.redhat.com [10.10.114.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4BB25D99B;
	Thu, 10 Sep 2020 12:22:58 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 10 Sep 2020 08:22:50 -0400
Message-Id: <20200910122250.39161-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool] dlm_controld: improve netlink
	ENOBUFS error handling
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch improves the handling for ENOBUFS for newer kernels by
setting the NETLINK_NO_ENOBUFS netlink socket option which should avoid
ENOBUFS errors regardless of the receive buffer size. If this fails
we switch to increasing the socket buffer size.
---
 dlm_controld/main.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index a82fc9c2..b3c258b5 100644
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
@@ -783,14 +782,31 @@ static int setup_uevent(void)
 	 * the  application  to  detect  when  this happens (via the ENOBUFS error
 	 * returned by recvmsg(2)) and resynchronize.
 	 *
-	 * To prevent ENOBUFS errors we just set the receive buffer to two
-	 * megabyte as other applications do it. This will not ensure that we never
-	 * receive ENOBUFS but it's more unlikely. May it's worth to handle ENOBUFS
-	 * errors on a different way in future.
+	 * To avoid ENOBUFS errors we set the netlink socket to realiable
+	 * transmission mode which can be turned on by NETLINK_NO_ENOBUFS
+	 * option. This option is available since kernel 2.6.30. If this setting
+	 * fails we fallback to increase the netlink socket receive buffer.
 	 */
-	rcvbuf = DEFAULT_NETLINK_RCVBUF;
-	setsockopt(s, SOL_SOCKET, SO_RCVBUF, &rcvbuf, sizeof(rcvbuf));
-	setsockopt(s, SOL_SOCKET, SO_RCVBUFFORCE, &rcvbuf, sizeof(rcvbuf));
+	val = 1;
+	rv = setsockopt(s, SOL_NETLINK, NETLINK_NO_ENOBUFS, &val, sizeof(val));
+	if (rv == -1) {
+		/* Fallback handling if NETLINK_NO_ENOBUFS fails to set.
+		 *
+		 * To prevent ENOBUFS errors we just set the receive buffer to
+		 * two megabyte as other applications do it. This will not
+		 * ensure that we never receive ENOBUFS but it's more unlikely.
+		 */
+		val = DEFAULT_NETLINK_RCVBUF;
+		log_error("uevent netlink NETLINK_NO_ENOBUFS errno %d, will set rcvbuf to %d bytes", errno, val);
+
+		rv = setsockopt(s, SOL_SOCKET, SO_RCVBUF, &val, sizeof(val));
+		if (rv == -1)
+			log_error("uevent netlink SO_RCVBUF errno %d", errno);
+
+		rv = setsockopt(s, SOL_SOCKET, SO_RCVBUFFORCE, &val, sizeof(val));
+		if (rv == -1)
+			log_error("uevent netlink SO_RCVBUFFORCE errno %d", errno);
+	}
 
 	memset(&snl, 0, sizeof(snl));
 	snl.nl_family = AF_NETLINK;
-- 
2.26.2

