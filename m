Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 955B56686B2
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 23:19:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673561953;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+NwWymCGAoav9m7AO+kSgNpAmhLroS0flxTpOahBvKU=;
	b=eZjjx4q/Y/GpUANbJFs0sFwcTXeVUYG2EdlaT3BZ1etiH0unt+yXZ9n0R0GOui83aw5evv
	8LrUZiKVkdd4UF1QAasnqmOsD22z35z2O9Jp2LSrm0Mr1n2Nprnhp9iyzBfZ5bgLC/M/eu
	Wv7uNlBmPLY9V8Ty1wS/+WZ8YyUYEiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-282tjHCHOU2uhZ2I3H915Q-1; Thu, 12 Jan 2023 17:19:12 -0500
X-MC-Unique: 282tjHCHOU2uhZ2I3H915Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CE11811E6E;
	Thu, 12 Jan 2023 22:19:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C4981121314;
	Thu, 12 Jan 2023 22:19:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4F14F1947051;
	Thu, 12 Jan 2023 22:19:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F5861947050 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 912AE40C2008; Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B34440C2064;
 Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 12 Jan 2023 17:18:43 -0500
Message-Id: <20230112221849.1883104-3-aahringo@redhat.com>
In-Reply-To: <20230112221849.1883104-1-aahringo@redhat.com>
References: <20230112221849.1883104-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm/next 2/8] fs: dlm: change to ignore
 unexpected non dlm opts msgs
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will change to ignore unexpected for RCOM_NAMES/RCOM_STATUS
messages. Those message are there to provide a version detection because
those are messages which are exchanged as first to detect the dlm
version. Due some DLM behaviour and being still backwards compatible
those messages are not part of the new reliable DLM OPTS encapsulation
header. On the other hand those message have their own retransmit
handling with a sequence number match, means if the sequence number
doesn't match DLM RCOM application layer will filter it out. When we get
a unexpected non dlm opts msg we should allow them and DLM RCOM will
filter it out if the sequence number does not match.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index ecd81018d1cf..dbc998b2748b 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -606,16 +606,8 @@ dlm_midcomms_recv_node_lookup(int nodeid, const union dlm_packet *p,
 				case DLM_ESTABLISHED:
 					break;
 				default:
-					/* some invalid state passive shutdown
-					 * was failed, we try to reset and
-					 * hope it will go on.
-					 */
-					log_print("reset node %d because shutdown stuck",
-						  node->nodeid);
-
-					midcomms_node_reset(node);
-					node->state = DLM_ESTABLISHED;
-					break;
+					spin_unlock(&node->state_lock);
+					return NULL;
 				}
 				spin_unlock(&node->state_lock);
 			}
-- 
2.31.1

