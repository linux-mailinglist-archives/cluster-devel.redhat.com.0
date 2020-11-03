Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E67C62A3826
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Nov 2020 02:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604365495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9XezknZzVlxNXPL0xNDAhgayDSzvrrixrEcpeZHwdC0=;
	b=hWv23lr51Mq5SCuB4dnPwaRq61aXikZ6u8sRXR0n2phcIyOO7Rkh8JmHMzkDnsmaykgYb9
	PGe7szgwra7Z4W7lelgl4099bugkDohYrZfGD3DiRSe9aYx48xL5UsoW1hrDT3tIXetMsr
	4QfigPr2BuCzVpsFZ2u+1Lqkm9HdWPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-5uhpFwigOdCex-f40vLzTQ-1; Mon, 02 Nov 2020 20:04:54 -0500
X-MC-Unique: 5uhpFwigOdCex-f40vLzTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 217705F9F5;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AB0D6FEE7;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4F68181A06B;
	Tue,  3 Nov 2020 01:04:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A314gmm003484 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 20:04:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2F9D75C5FD; Tue,  3 Nov 2020 01:04:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-45.rdu2.redhat.com [10.10.115.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA2FC5C22A;
	Tue,  3 Nov 2020 01:04:41 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 Nov 2020 20:04:18 -0500
Message-Id: <20201103010428.1009384-4-aahringo@redhat.com>
In-Reply-To: <20201103010428.1009384-1-aahringo@redhat.com>
References: <20201103010428.1009384-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 RESEND v5.10-rc2 03/13] fs: dlm: add get
	buffer error handling
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds an error handling to the get buffer functionality if the
user is requesting a buffer length which is more than possible of
the internal buffer allocator. This should never happen because specific
handling decided by compile time, but will warn if somebody forget about
to handle this limitation right.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 77382c2ce6da..620eca3979d5 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1352,6 +1352,12 @@ void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
 	struct writequeue_entry *e;
 	int offset = 0;
 
+	if (len > LOWCOMMS_MAX_TX_BUFFER_LEN) {
+		BUILD_BUG_ON(PAGE_SIZE < LOWCOMMS_MAX_TX_BUFFER_LEN);
+		log_print("failed to allocate a buffer of size %d", len);
+		return NULL;
+	}
+
 	con = nodeid2con(nodeid, allocation);
 	if (!con)
 		return NULL;
-- 
2.26.2

