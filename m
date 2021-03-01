Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 104DF329485
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Mar 2021 23:05:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614636345;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q50wxkXmDSTgFkSafXvFXzU4x0UBjM8f/bL9j2gytSI=;
	b=S9Lh410noXNIf8c6ZzY85i3w3VrHYu5nTeRuO3YCpH5uLS/h4bquAXe1O0/xgYOu+MSEwd
	N1PrD92pWwP+DVKu6puGBCX19p34yO1eWZCYrAqdTSwZh0lD/9tlQoTLCp4sbajr3ZUqML
	vIv2tzJTLVsEozwfbM3FSrfBokf6OW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-Exx9C4nPNo2g65TY7dwQLA-1; Mon, 01 Mar 2021 17:05:43 -0500
X-MC-Unique: Exx9C4nPNo2g65TY7dwQLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11556801980;
	Mon,  1 Mar 2021 22:05:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01CA560C05;
	Mon,  1 Mar 2021 22:05:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1DD657DFD;
	Mon,  1 Mar 2021 22:05:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 121M5acH005979 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Mar 2021 17:05:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0D813100239A; Mon,  1 Mar 2021 22:05:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-35.rdu2.redhat.com [10.10.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8827C10013C1;
	Mon,  1 Mar 2021 22:05:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  1 Mar 2021 17:05:18 -0500
Message-Id: <20210301220520.514470-12-aahringo@redhat.com>
In-Reply-To: <20210301220520.514470-1-aahringo@redhat.com>
References: <20210301220520.514470-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 11/13] fs: dlm: remove unaligned
	memory access handling
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
 fs/dlm/midcomms.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 0bedfa8606a2..1c6654a21ec4 100644
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
@@ -45,10 +43,18 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
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
+		msglen = le16_to_cpu(hd->h_length);
 		if (msglen > DEFAULT_BUFFER_SIZE ||
 		    msglen < sizeof(struct dlm_header)) {
 			log_print("received invalid length header: %u from node %d, will abort message parsing",
@@ -85,15 +91,7 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
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
-		dlm_receive_buffer((union dlm_packet *)buf, nodeid);
+		dlm_receive_buffer((union dlm_packet *)ptr, nodeid);
 
 skip:
 		ret += msglen;
-- 
2.26.2

