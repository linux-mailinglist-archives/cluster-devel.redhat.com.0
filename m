Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6421B3A4716
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Jun 2021 18:56:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623430574;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qkENHN/bHSHQfBafmSYuv04pRfy7bhOrjA56z5Da3D8=;
	b=IoXoio+qWvZvn+12OZznTl4+OwP1regrxVFj+knBsmdU9yYduVEWVUu5V+h4dVANWGB8lx
	CSZEW6vVcIuJEXUN4I1R33s3Cwh2q3VSsm+0mrxlrwwlPxnXZhnmRUv3+uisHZ+hsSNAd8
	nAJk8YmPca8/cPhUtMzQprDU09gCErk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-5x3NoXs5OUK_WLVKaWaJaw-1; Fri, 11 Jun 2021 12:56:13 -0400
X-MC-Unique: 5x3NoXs5OUK_WLVKaWaJaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EA8D18D6A37;
	Fri, 11 Jun 2021 16:56:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 131F160936;
	Fri, 11 Jun 2021 16:56:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 307AC1809CAF;
	Fri, 11 Jun 2021 16:56:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BGu88F020545 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 12:56:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23E685D9F0; Fri, 11 Jun 2021 16:56:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-112-77.rdu2.redhat.com [10.10.112.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 996B05D9E2;
	Fri, 11 Jun 2021 16:56:07 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 11 Jun 2021 12:55:41 -0400
Message-Id: <20210611165541.377603-2-aahringo@redhat.com>
In-Reply-To: <20210611165541.377603-1-aahringo@redhat.com>
References: <20210611165541.377603-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 2/2] fs: dlm: invalid buffer access
	in lookup error
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

This patch will evaluate the message length if a dlm opts header can fit
in before accessing it if a node lookup fails. The invalid sequence
error means that the version detection failed and an unexpected message
arrived. For debugging such situation the type of arrived message is
important to know.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 92f95ee7003a..e3de268898ed 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -621,8 +621,23 @@ dlm_midcomms_recv_node_lookup(int nodeid, const union dlm_packet *p,
 
 	node = nodeid2node(nodeid, allocation);
 	if (!node) {
-		log_print_ratelimited("received dlm message cmd %d nextcmd %d from node %d in an invalid sequence",
-				      p->header.h_cmd, p->opts.o_nextcmd, nodeid);
+		switch (p->header.h_cmd) {
+		case DLM_OPTS:
+			if (msglen < sizeof(struct dlm_opts)) {
+				log_print("opts msg too small: %u, will skip this message from node %d",
+					  msglen, nodeid);
+				return NULL;
+			}
+
+			log_print_ratelimited("received dlm opts message nextcmd %d from node %d in an invalid sequence",
+					      p->opts.o_nextcmd, nodeid);
+			break;
+		default:
+			log_print_ratelimited("received dlm message cmd %d from node %d in an invalid sequence",
+					      p->header.h_cmd, nodeid);
+			break;
+		}
+
 		return NULL;
 	}
 
-- 
2.26.3

