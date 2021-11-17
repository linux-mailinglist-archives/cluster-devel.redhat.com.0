Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFA845488A
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Nov 2021 15:21:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637158870;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sa3/KptUHM0k6AN1TTfpFhihe9Ca4WdYEBqiGY5/R9Q=;
	b=YHk04cMirePopUwT8saRYau13IqKiHfcznomG5KKqGcB/cAfFXfFDv5w9hKBZLdMf6PJXQ
	3PRq0zL+SOZDtGiUURS2f9uAKZ7JV7R/4QWXiQN0URWDbW5UjpAC/HLoc5RZNWCGgzhMzF
	hnoKRmwfg1XD7cwYQi6y8HcvTQoM10A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-pdspISYWNea1lVOLa8B2jw-1; Wed, 17 Nov 2021 09:21:06 -0500
X-MC-Unique: pdspISYWNea1lVOLa8B2jw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C8AC81C85E;
	Wed, 17 Nov 2021 14:21:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34FF65F4E0;
	Wed, 17 Nov 2021 14:21:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81CE9180BAD2;
	Wed, 17 Nov 2021 14:20:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHEKqDl007072 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 09:20:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 866875DF56; Wed, 17 Nov 2021 14:20:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC8CD5DEFB;
	Wed, 17 Nov 2021 14:20:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 17 Nov 2021 09:20:43 -0500
Message-Id: <20211117142043.3097925-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm-next] fs: dlm: fix build with
	CONFIG_IPV6 disabled
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

This patch will surround the AF_INET6 case in sk_error_report() of dlm
with a #if IS_ENABLED(CONFIG_IPV6). The field sk->sk_v6_daddr is not
defined when CONFIG_IPV6 is disabled. If CONFIG_IPV6 is disabled, the
socket creation with AF_INET6 should already fail because a runtime
check if AF_INET6 is registered. However if there is the possibility
that AF_INET6 is set as sk_family the sk_error_report() callback will
print then an invalid family type error.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 4c3d90570bcc ("fs: dlm: don't call kernel_getpeername() in error_report()")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 203470189011..f7fc1ac76ce8 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -608,6 +608,7 @@ static void lowcomms_error_report(struct sock *sk)
 				   ntohs(inet->inet_dport), sk->sk_err,
 				   sk->sk_err_soft);
 		break;
+#if IS_ENABLED(CONFIG_IPV6)
 	case AF_INET6:
 		printk_ratelimited(KERN_ERR "dlm: node %d: socket error "
 				   "sending to node %d at %pI6c, "
@@ -616,6 +617,7 @@ static void lowcomms_error_report(struct sock *sk)
 				   ntohs(inet->inet_dport), sk->sk_err,
 				   sk->sk_err_soft);
 		break;
+#endif
 	default:
 		printk_ratelimited(KERN_ERR "dlm: node %d: socket error "
 				   "invalid socket family %d set, "
-- 
2.27.0

