Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3772F1D58
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jan 2021 19:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610388223;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hxs4GC8eW+Z23eah/A+LU8txMf+sWa+dBsRSboV4b5o=;
	b=DbEjoLIWKr7UMwXw21Dwia2467cIm2cHUQlWItgYencLPDux/IQG0xJ4T1szIp/tJGkote
	LK4B8uErXXm0bEwKM6Rf7DgWGaGpXcuCLxVRYPgowB2Se4MIbD7x7kXyc7aBbRfd3belGl
	/kcg0PP/FUdZt0HyzK5+dOa8QGaLbAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-ysiHWR88Np67W2pjwE9TtQ-1; Mon, 11 Jan 2021 13:03:41 -0500
X-MC-Unique: ysiHWR88Np67W2pjwE9TtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DAE48030A0;
	Mon, 11 Jan 2021 18:03:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BA2C60BE2;
	Mon, 11 Jan 2021 18:03:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C9AA4BB7B;
	Mon, 11 Jan 2021 18:03:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10BI3VTI032237 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Jan 2021 13:03:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E05195D9F8; Mon, 11 Jan 2021 18:03:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-187.rdu2.redhat.com [10.10.116.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 651CC5D9DB;
	Mon, 11 Jan 2021 18:03:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 11 Jan 2021 13:02:55 -0500
Message-Id: <20210111180310.122451-6-aahringo@redhat.com>
In-Reply-To: <20210111180310.122451-1-aahringo@redhat.com>
References: <20210111180310.122451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv4 dlm/next 05/20] fs: dlm: change allocation
	limits
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

While running tcpkill I experienced invalid header length values while
receiving to check that a node doesn't try to send a invalid dlm message
we also check on applications minimum allocation limit. Also use
DEFAULT_BUFFER_SIZE as maximum allocation limit. The define
LOWCOMMS_MAX_TX_BUFFER_LEN is to calculate maximum buffer limits on
application layer, future midcomms layer will subtract their needs from
this define.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index d25b9132c593..2b468fbb2b43 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1357,8 +1357,9 @@ void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
 	struct writequeue_entry *e;
 	int offset = 0;
 
-	if (len > LOWCOMMS_MAX_TX_BUFFER_LEN) {
-		BUILD_BUG_ON(PAGE_SIZE < LOWCOMMS_MAX_TX_BUFFER_LEN);
+	if (len > DEFAULT_BUFFER_SIZE ||
+	    len < sizeof(struct dlm_header)) {
+		BUILD_BUG_ON(PAGE_SIZE < DEFAULT_BUFFER_SIZE);
 		log_print("failed to allocate a buffer of size %d", len);
 		return NULL;
 	}
-- 
2.26.2

