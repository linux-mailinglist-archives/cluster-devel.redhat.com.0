Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id ACC112CA69B
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Dec 2020 16:10:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606835435;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s37yZerQrlMkT3qZXoAKOPTHUG9j+kxlK/ueVU90atY=;
	b=XAL4CJCrffT9nJWdbWGpKz9aGQ+35VLZZbJ/tUdovXPNgZ0ZuaouTzHwMs7E0zx4woNeJS
	ElIGzo66LmWDkPB6KIqClaAXc3XY9rCGHMYgy4/Nevw4u8RFK/wPtuJhGmVucsJsWXrNcn
	vYpYtkKMspejbbfqPJbZVIBm4ytTE3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-lKb6_zMhMnqtd9mClyQ5WQ-1; Tue, 01 Dec 2020 10:10:34 -0500
X-MC-Unique: lKb6_zMhMnqtd9mClyQ5WQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DBFC9A22F;
	Tue,  1 Dec 2020 15:10:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C3475C1BB;
	Tue,  1 Dec 2020 15:10:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07B951809CA2;
	Tue,  1 Dec 2020 15:10:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B1FASjo019700 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 1 Dec 2020 10:10:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 185EE5D71D; Tue,  1 Dec 2020 15:10:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-202.rdu2.redhat.com [10.10.114.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 926965D6AB;
	Tue,  1 Dec 2020 15:10:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  1 Dec 2020 10:09:54 -0500
Message-Id: <20201201150957.115068-15-aahringo@redhat.com>
In-Reply-To: <20201201150957.115068-1-aahringo@redhat.com>
References: <20201201150957.115068-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 14/17] fs: dlm: remove unaligned
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 fs/dlm/midcomms.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index e058e017c77d..76e7904c3021 100644
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
@@ -83,6 +81,8 @@ void dlm_midcomms_stop(void)
  * commands.
  */
 
+#define DLM_MSGLEN_IS_NOT_ALIGNED(len) ((len & 0x3) != 0)
+
 int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 {
 	const unsigned char *ptr = buf;
@@ -96,10 +96,12 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 		/* no message should be more than this otherwise we
 		 * cannot deliver this message to upper layers
 		 */
-		msglen = get_unaligned_le16(&hd->h_length);
-		if (msglen > DEFAULT_BUFFER_SIZE) {
-			log_print("received invalid length header: %u, will abort message parsing",
-				  msglen);
+		msglen = le16_to_cpu(hd->h_length);
+		if (msglen > DEFAULT_BUFFER_SIZE ||
+		    msglen < sizeof(struct dlm_header) ||
+		    DLM_MSGLEN_IS_NOT_ALIGNED(msglen)) {
+			log_print("received invalid length header: %u from node %d, will abort message parsing",
+				  msglen, nodeid);
 			return -EBADMSG;
 		}
 
@@ -132,14 +134,6 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
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

