Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2278E2F1D64
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jan 2021 19:03:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610388233;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aTU089zDP46Bax28doEdsSr967oAySqOVrDo1THzYhQ=;
	b=aIMSzyull5r0QEOyd3s4nc0a6305va9keMa1ALPGGIx+MB8SspEsUCkqzflpkIDe7uw8RG
	66sveCsW2MiLTvZ7WNcyPq4mXzqhMxeIq7lwLn5xq2igQoiKq5Bpj+9QUMeFzu1hDvZ7gH
	QFuH9PLz+xnzUNK3k1Ls5MiiN6gq9vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-c71asyvYNTq7hiyYxFb_tQ-1; Mon, 11 Jan 2021 13:03:50 -0500
X-MC-Unique: c71asyvYNTq7hiyYxFb_tQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B393687950C;
	Mon, 11 Jan 2021 18:03:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0D7F1349A;
	Mon, 11 Jan 2021 18:03:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84A271809CA1;
	Mon, 11 Jan 2021 18:03:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10BI3huD032354 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Jan 2021 13:03:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8C53F5D9F8; Mon, 11 Jan 2021 18:03:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-187.rdu2.redhat.com [10.10.116.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 140CC5D9DB;
	Mon, 11 Jan 2021 18:03:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 11 Jan 2021 13:03:04 -0500
Message-Id: <20210111180310.122451-15-aahringo@redhat.com>
In-Reply-To: <20210111180310.122451-1-aahringo@redhat.com>
References: <20210111180310.122451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv4 dlm/next 14/20] fs: dlm: remove unaligned
	memory access handling
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch removes unaligned memory access handling for receiving
midcomms messages. This handling will not fix the unaligned memory
access in general. All messages should be length aligned to 8 bytes,
there exists cases where this isn't the case. It's part of the sending
handling to not send such messages. As the sending handling itself, with
the internal allocator of page buffers, can occur in unaligned memory
access of dlm message fields we just ignore that problem for now as it
seems this code is used by architecture which can handle it.

This patch adds a comment to take care about that problem in a major
bump of dlm protocol.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index e058e017c77d..45dd3d7d857f 100644
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
@@ -93,13 +91,22 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 	while (len >= sizeof(struct dlm_header)) {
 		hd = (struct dlm_header *)ptr;
 
-		/* no message should be more than this otherwise we
-		 * cannot deliver this message to upper layers
+		/* no message should be more than DEFAULT_BUFFER_SIZE or
+		 * less than dlm_header size.
+		 *
+		 * Some messages does not have a 8 byte length boundary yet
+		 * which can occur in a unaligned memory access of some dlm
+		 * messages. However this problem need to be fixed at the
+		 * sending side, for now it seems nobody run into architecture
+		 * related issues yet but it slows down some processing.
+		 * Fixing this issue should be scheduled in future by doing
+		 * the next major version bump.
 		 */
-		msglen = get_unaligned_le16(&hd->h_length);
-		if (msglen > DEFAULT_BUFFER_SIZE) {
-			log_print("received invalid length header: %u, will abort message parsing",
-				  msglen);
+		msglen = le16_to_cpu(hd->h_length);
+		if (msglen > DEFAULT_BUFFER_SIZE ||
+		    msglen < sizeof(struct dlm_header)) {
+			log_print("received invalid length header: %u from node %d, will abort message parsing",
+				  msglen, nodeid);
 			return -EBADMSG;
 		}
 
@@ -132,14 +139,6 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
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

