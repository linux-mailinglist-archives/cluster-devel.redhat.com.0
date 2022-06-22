Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC39555384
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Jun 2022 20:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655923721;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LITR8E0QE0Rjq6dwj+M87Xtgsto13ytwYCic9RJsF5Y=;
	b=Zu3Xm7rk9iO6IXayeZqNGKQtLiukwjVc39TJQu4CWv+ul682gTCU402pa6TGL1rEZX6HdW
	w5TiqulDNF/kfJDBwIcYQacmw21fEIHekYotOhXlpyXzVt80eKu4zGfzOZCfJr2brCPRpl
	uCm4GOBJeDiuqNI3jBpkEtgOoLVDfYA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-g2MdQU2qPzqUJqoQmPWlTw-1; Wed, 22 Jun 2022 14:48:34 -0400
X-MC-Unique: g2MdQU2qPzqUJqoQmPWlTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF1568032F2;
	Wed, 22 Jun 2022 18:48:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2A4E40D0166;
	Wed, 22 Jun 2022 18:48:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 55D4E1947071;
	Wed, 22 Jun 2022 18:48:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 14C8F1947051 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 22 Jun 2022 18:45:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0697940CFD0D; Wed, 22 Jun 2022 18:45:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDA3840CFD0A;
 Wed, 22 Jun 2022 18:45:28 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 22 Jun 2022 14:45:19 -0400
Message-Id: <20220622184523.1886869-17-aahringo@redhat.com>
In-Reply-To: <20220622184523.1886869-1-aahringo@redhat.com>
References: <20220622184523.1886869-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Cluster-devel] [PATCH RESEND v5.19-rc3 16/20] fs: dlm: add comment
 about lkb IFL flags
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds comments about the difference between the lower 2 bytes
of lkb flags and the 2 upper bytes of the lkb IFL flags. In short the
upper 2 bytes will be handled as internal flags whereas the lower 2
bytes are part of the DLM protocol and are used to exchange messages.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index c03388a3875c..afec22b1a65f 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -207,6 +207,14 @@ struct dlm_args {
 #define DLM_IFL_TIMEOUT_CANCEL	0x00800000
 #define DLM_IFL_DEADLOCK_CANCEL	0x01000000
 #define DLM_IFL_STUB_MS		0x02000000 /* magic number for m_flags */
+/* least significant 2 bytes are message changed, they are full transmitted
+ * but at receive side only the 2 bytes LSB will be set.
+ *
+ * Even wireshark dlm dissector does only evaluate the lower bytes and note
+ * that they may not be used on transceiver side, we assume the higher bytes
+ * are for internal use or reserved so long they are not parsed on receiver
+ * side.
+ */
 #define DLM_IFL_USER		0x00000001
 #define DLM_IFL_ORPHAN		0x00000002
 
-- 
2.31.1

