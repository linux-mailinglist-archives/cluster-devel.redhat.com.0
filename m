Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABD9633F31
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Nov 2022 15:48:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669128491;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PduHZvqBz2qLoFmdpkAcpMBF0U9NahqHSeI2Uc+kC1M=;
	b=JELJm/RRUWNdGavqj1DEFrFj/RPB2wFniDHpSV8yxq9Xt2yCHuNn/cz+n5dVEWKxTvGtW2
	hANDjNRdKQZCoRzLkQ/xumMc/uPBdNxPMWlIxUmEFOIoJzxr6P7szZ16QDMql0UXTK332k
	WD1rEha+n1crzC340j2BdrDlvO+cCdc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-owzjRJbrMIuX-GmNNWyPWQ-1; Tue, 22 Nov 2022 09:48:06 -0500
X-MC-Unique: owzjRJbrMIuX-GmNNWyPWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 715D38027EC;
	Tue, 22 Nov 2022 14:48:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28730C1908C;
	Tue, 22 Nov 2022 14:48:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E34B4194658F;
	Tue, 22 Nov 2022 14:48:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1220A1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Nov 2022 14:48:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F2937111F3BB; Tue, 22 Nov 2022 14:48:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A936F1121325;
 Tue, 22 Nov 2022 14:48:03 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 22 Nov 2022 09:48:01 -0500
Message-Id: <20221122144801.274121-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: fix building without
 lockdep
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, geert@linux-m68k.org, lkp@intel.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch uses assert_spin_locked() instead of lockdep_is_held()
where it's available to use because lockdep_is_held() is only available
if CONFIG_LOCKDEP is set.

In other cases like lockdep_sock_is_held() we surround it by a
CONFIG_LOCKDEP idef.

Fixes: dbb751ffab0b ("fs: dlm: parallelize lowcomms socket handling")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 799d1c36eabf..8b80ca0cd65f 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -208,7 +208,7 @@ bool dlm_lowcomms_is_running(void)
 
 static void lowcomms_queue_swork(struct connection *con)
 {
-	WARN_ON_ONCE(!lockdep_is_held(&con->writequeue_lock));
+	assert_spin_locked(&con->writequeue_lock);
 
 	if (!test_bit(CF_IO_STOP, &con->flags) &&
 	    !test_bit(CF_APP_LIMITED, &con->flags) &&
@@ -218,7 +218,9 @@ static void lowcomms_queue_swork(struct connection *con)
 
 static void lowcomms_queue_rwork(struct connection *con)
 {
+#ifdef CONFIG_LOCKDEP
 	WARN_ON_ONCE(!lockdep_sock_is_held(con->sock->sk));
+#endif
 
 	if (!test_bit(CF_IO_STOP, &con->flags) &&
 	    !test_and_set_bit(CF_RECV_PENDING, &con->flags))
@@ -618,7 +620,9 @@ static void lowcomms_error_report(struct sock *sk)
 
 static void restore_callbacks(struct sock *sk)
 {
+#ifdef CONFIG_LOCKDEP
 	WARN_ON_ONCE(!lockdep_sock_is_held(sk));
+#endif
 
 	sk->sk_user_data = NULL;
 	sk->sk_data_ready = listen_sock.sk_data_ready;
-- 
2.31.1

