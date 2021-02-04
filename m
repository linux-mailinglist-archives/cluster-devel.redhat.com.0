Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5608630FFB5
	for <lists+cluster-devel@lfdr.de>; Thu,  4 Feb 2021 22:51:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612475512;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Huve5J9iHi/0ckwoGRVBuN7X/1lHcQOc9gviGEMf4ko=;
	b=R2vdTmJiMNz8zmtWulzLdONd4tokX5t8Ft5zQLIfcBCBHaBlV2lUZH3y9JskkQhBJAGSYQ
	ZF+DP+BVpZ+orOqDnPeJ3rxKgMnzFrOGbSJqjvSZuWCi3h/FGBUD7Suxn3ot7iIHak49ru
	nZsj3MyZsw75G5yvV4RsLulzyBPO2Tw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-RB9b4u7JOf6bX2na6v4NNQ-1; Thu, 04 Feb 2021 16:51:50 -0500
X-MC-Unique: RB9b4u7JOf6bX2na6v4NNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1970B100F341;
	Thu,  4 Feb 2021 21:51:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A2845DA2D;
	Thu,  4 Feb 2021 21:51:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAD4518095CC;
	Thu,  4 Feb 2021 21:51:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 114LpDZx027575 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 4 Feb 2021 16:51:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2674760CD7; Thu,  4 Feb 2021 21:51:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-190.rdu2.redhat.com [10.10.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8AEFD60CCF;
	Thu,  4 Feb 2021 21:51:12 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  4 Feb 2021 16:50:55 -0500
Message-Id: <20210204215056.774409-9-aahringo@redhat.com>
In-Reply-To: <20210204215056.774409-1-aahringo@redhat.com>
References: <20210204215056.774409-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 8/9] fs: dlm: check on dlm header
	size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds checks for the dlm header size that the parsing loop
will not stop on messages which are dlm header only and rejects msglen
field of the dlm header which are less than dlm header size. A msglen
field cannot be less than the dlm header size because the field is
inclusive header lengths.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index fde3a6afe4be..7cda8e4be6fc 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -42,16 +42,17 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 	uint16_t msglen;
 	int ret = 0;
 
-	while (len >= sizeof(struct dlm_header)) {
+	while (len > sizeof(struct dlm_header)) {
 		hd = (struct dlm_header *)ptr;
 
 		/* no message should be more than this otherwise we
 		 * cannot deliver this message to upper layers
 		 */
 		msglen = get_unaligned_le16(&hd->h_length);
-		if (msglen > DEFAULT_BUFFER_SIZE) {
-			log_print("received invalid length header: %u, will abort message parsing",
-				  msglen);
+		if (msglen > DEFAULT_BUFFER_SIZE ||
+		    msglen < sizeof(struct dlm_header)) {
+			log_print("received invalid length header: %u from node %d, will abort message parsing",
+				  msglen, nodeid);
 			return -EBADMSG;
 		}
 
-- 
2.26.2

