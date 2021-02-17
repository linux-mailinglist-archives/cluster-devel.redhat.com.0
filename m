Return-Path: <cluster-devel-bounces@listman.redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id B024131D323
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Feb 2021 01:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613520147;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7re0D1DrZrHxEbPDihBasxZk75dAnsqNOwf7XSDh4XE=;
	b=A+inLGZFKgX2qUqhvc5XPC9ZgXKbim1lScMtdR1Lm+vLbNccq7CinC6xYCVPcwmuruo05w
	mPzn+nc9ds9THJsP2EQWaDiZrzdU4+CGsAiDVgnv7kgsIqNYhJ28RZ3loPY3sHi4oq5bFm
	ogWom18qTpgxD3+rGItCkf3uSoggCC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-NE9LO7KfM1q93W-uuk3UNA-1; Tue, 16 Feb 2021 19:02:24 -0500
X-MC-Unique: NE9LO7KfM1q93W-uuk3UNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACB6D80196C;
	Wed, 17 Feb 2021 00:02:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C9A560C61;
	Wed, 17 Feb 2021 00:02:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75D3E57DFD;
	Wed, 17 Feb 2021 00:02:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11H010Zt031349 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 19:01:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16B6D5C661; Wed, 17 Feb 2021 00:01:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-173.rdu2.redhat.com [10.10.115.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89E365C1B4;
	Wed, 17 Feb 2021 00:00:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Feb 2021 19:00:44 -0500
Message-Id: <20210217000046.349203-11-aahringo@redhat.com>
In-Reply-To: <20210217000046.349203-1-aahringo@redhat.com>
References: <20210217000046.349203-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 10/12] fs: dlm: remove unaligned
	memory access handling
X-BeenThere: cluster-devel@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@listman.redhat.com>
List-Help: <mailto:cluster-devel-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@listman.redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@listman.redhat.com
Errors-To: cluster-devel-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252

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
=20
-#include <asm/unaligned.h>
-
 #include "dlm_internal.h"
 #include "lowcomms.h"
 #include "config.h"
@@ -45,10 +43,18 @@ int dlm_process_incoming_buffer(int nodeid, unsigned ch=
ar *buf, int len)
 =09while (len >=3D sizeof(struct dlm_header)) {
 =09=09hd =3D (struct dlm_header *)ptr;
=20
-=09=09/* no message should be more than this otherwise we
-=09=09 * cannot deliver this message to upper layers
+=09=09/* no message should be more than DEFAULT_BUFFER_SIZE or
+=09=09 * less than dlm_header size.
+=09=09 *
+=09=09 * Some messages does not have a 8 byte length boundary yet
+=09=09 * which can occur in a unaligned memory access of some dlm
+=09=09 * messages. However this problem need to be fixed at the
+=09=09 * sending side, for now it seems nobody run into architecture
+=09=09 * related issues yet but it slows down some processing.
+=09=09 * Fixing this issue should be scheduled in future by doing
+=09=09 * the next major version bump.
 =09=09 */
-=09=09msglen =3D get_unaligned_le16(&hd->h_length);
+=09=09msglen =3D le16_to_cpu(hd->h_length);
 =09=09if (msglen > DEFAULT_BUFFER_SIZE ||
 =09=09    msglen < sizeof(struct dlm_header)) {
 =09=09=09log_print("received invalid length header: %u from node %d, will =
abort message parsing",
@@ -85,15 +91,7 @@ int dlm_process_incoming_buffer(int nodeid, unsigned cha=
r *buf, int len)
 =09=09=09goto skip;
 =09=09}
=20
-=09=09/* for aligned memory access, we just copy current message
-=09=09 * to begin of the buffer which contains already parsed buffer
-=09=09 * data and should provide align access for upper layers
-=09=09 * because the start address of the buffer has a aligned
-=09=09 * address. This memmove can be removed when the upperlayer
-=09=09 * is capable of unaligned memory access.
-=09=09 */
-=09=09memmove(buf, ptr, msglen);
-=09=09dlm_receive_buffer((union dlm_packet *)buf, nodeid);
+=09=09dlm_receive_buffer((union dlm_packet *)ptr, nodeid);
=20
 skip:
 =09=09ret +=3D msglen;
--=20
2.26.2

