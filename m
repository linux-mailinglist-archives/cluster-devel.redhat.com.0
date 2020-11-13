Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 030022B28E4
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Nov 2020 23:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605308327;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FzuPPMNAZfvSf17ZiuIWqIVg1Q5h3S4cdAiyxJf8ELQ=;
	b=DKbqyMjGH8Y3b3ppn8NQtHzGc4v8TZUK3DpYfacgcBOYgFqDgUrLPWK1zMeklrPD4XE64y
	XSd52W+0qHbBMUlMMa7m0FZjvl5lKYaO+eeSu6PMVhXUxYqUBOoFNUU0Motj/Mo0FQFXzn
	6MCs8S6ZYH8oQcSpNSM8NL1Db87xmes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-R2erXcdOMwmeHKRH4QObAg-1; Fri, 13 Nov 2020 17:58:45 -0500
X-MC-Unique: R2erXcdOMwmeHKRH4QObAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B4B057204;
	Fri, 13 Nov 2020 22:58:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C0636B8DF;
	Fri, 13 Nov 2020 22:58:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 480DA181A06B;
	Fri, 13 Nov 2020 22:58:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ADMwdsk004035 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Nov 2020 17:58:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8413C5C716; Fri, 13 Nov 2020 22:58:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-120.rdu2.redhat.com [10.10.117.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1225F171F4;
	Fri, 13 Nov 2020 22:58:38 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 13 Nov 2020 17:58:10 -0500
Message-Id: <20201113225814.461167-13-aahringo@redhat.com>
In-Reply-To: <20201113225814.461167-1-aahringo@redhat.com>
References: <20201113225814.461167-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC PATCH dlm/next 12/16] fs: dlm: remove
	unaligned memory access handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch removes unaligned memory access handling for receiving
midcomms messages. The allocated receive buffer is always memory aligned
as the code shows, but each dlm message length and their structure fields
are always aligned to 4 bytes addresses so it should be fine to remove
this special handling.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index e058e017c77d..b146842be54a 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -22,8 +22,6 @@
  * into packets and sends them to the comms layer.
  */
 
-#include <asm/unaligned.h>
-
 #include "dlm_internal.h"
 #include "lowcomms.h"
 #include "config.h"
@@ -96,7 +94,7 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 		/* no message should be more than this otherwise we
 		 * cannot deliver this message to upper layers
 		 */
-		msglen = get_unaligned_le16(&hd->h_length);
+		msglen = le16_to_cpu(hd->h_length);
 		if (msglen > DEFAULT_BUFFER_SIZE) {
 			log_print("received invalid length header: %u, will abort message parsing",
 				  msglen);
@@ -132,14 +130,6 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 			goto skip;
 		}
 
-		/* for aligned memory access, we just copy current message
-		 * to begin of the buffer which contains already parsed buffer
-		 * data and should provide align access for upper layers
-		 * because the start address of the buffer has a aligned
-		 * address. This memmove can be removed when the upperlayer
-		 * is capable of unaligned memory access.
-		 */
-		memmove(buf, ptr, msglen);
 		dlm_receive_buffer((union dlm_packet *)buf, nodeid);
 
 skip:
-- 
2.26.2

