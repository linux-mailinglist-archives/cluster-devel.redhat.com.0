Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B62432948F
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Mar 2021 23:05:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614636351;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RjdhhoOdHPJR2tQ1fM6AKLoqoTnWVsK4ObPc2D3l0Z4=;
	b=iN7bA6DDwAvzHEhRsaYi/Q8v0DL4uJoZDtZuSHRcFuQsrS695FGNfx3ZUhUPpbRKLoPmJs
	RY8J1/SnH8p48fWh0ShpGqQ2MMJ7z/5O2QN0RMwDx8bLBUaCe/mcyoxKopNVGy8ar9sslD
	ntGaQ6XStZHl6OlK8FCJL5sSbs9HVOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-ALo1aglxNsS9sMI1k8YcQQ-1; Mon, 01 Mar 2021 17:05:49 -0500
X-MC-Unique: ALo1aglxNsS9sMI1k8YcQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B39FC10CE786;
	Mon,  1 Mar 2021 22:05:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4AA2608BA;
	Mon,  1 Mar 2021 22:05:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E1F618095CC;
	Mon,  1 Mar 2021 22:05:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 121M5Z4V005973 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Mar 2021 17:05:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5EAB5100239A; Mon,  1 Mar 2021 22:05:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-35.rdu2.redhat.com [10.10.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD4CE10013C1;
	Mon,  1 Mar 2021 22:05:34 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  1 Mar 2021 17:05:17 -0500
Message-Id: <20210301220520.514470-11-aahringo@redhat.com>
In-Reply-To: <20210301220520.514470-1-aahringo@redhat.com>
References: <20210301220520.514470-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 10/13] fs: dlm: check on minimum
	msglen size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds an additional check for minimum dlm header size which is
an invalid dlm message and signals a broken stream. A msglen field cannot
be less than the dlm header size because the field is inclusive header
lengths.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index fde3a6afe4be..0bedfa8606a2 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -49,9 +49,10 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
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

