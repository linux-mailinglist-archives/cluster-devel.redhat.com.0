Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id ED6823CBDAF
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Jul 2021 22:23:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626466987;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YIc9yqJW4BH2Z5jRUr0ZfunysNeJmeoQXC7zepX71Sk=;
	b=empqV36+SosuL0K9y/oYrPpHUApEeU38Syd5kC2hwGkL6oK8uYcsBT1fYwOVWfjogkXvpB
	L6fPyGwaFJET3IzwryWql1x3+pCmvcqF1TNtl7UraLFyv7kBF3Wmzvtw7VC6V17cPcvxf3
	bJeseIZqrew/MoJY14Ni4x4jGDUl35w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-7hcd_u-kNUGL_Qvmh64wyA-1; Fri, 16 Jul 2021 16:23:04 -0400
X-MC-Unique: 7hcd_u-kNUGL_Qvmh64wyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C3A1100CCCD;
	Fri, 16 Jul 2021 20:23:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 330A160C0F;
	Fri, 16 Jul 2021 20:23:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB30A1809CB2;
	Fri, 16 Jul 2021 20:22:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16GKMunx026019 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 16 Jul 2021 16:22:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74BF95D741; Fri, 16 Jul 2021 20:22:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 337455D6D5;
	Fri, 16 Jul 2021 20:22:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Jul 2021 16:22:34 -0400
Message-Id: <20210716202245.1262791-2-aahringo@redhat.com>
In-Reply-To: <20210716202245.1262791-1-aahringo@redhat.com>
References: <20210716202245.1262791-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v5.14-rc1 01/12] fs: dlm: use sk->sk_socket
	instead of con->sock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Instead of dereference "con->sock" we can get the socket structure over
"sk->sk_socket" as well. This patch will switch to this behaviour.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 0ea9ae35da0b..bf309c12a2c0 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -583,8 +583,7 @@ static void lowcomms_error_report(struct sock *sk)
 		goto out;
 
 	orig_report = listen_sock.sk_error_report;
-	if (con->sock == NULL ||
-	    kernel_getpeername(con->sock, (struct sockaddr *)&saddr) < 0) {
+	if (kernel_getpeername(sk->sk_socket, (struct sockaddr *)&saddr) < 0) {
 		printk_ratelimited(KERN_ERR "dlm: node %d: socket error "
 				   "sending to node %d, port %d, "
 				   "sk_err=%d/%d\n", dlm_our_nodeid(),
-- 
2.27.0

