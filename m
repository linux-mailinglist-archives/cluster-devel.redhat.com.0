Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 752DA6686B8
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 23:19:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673561958;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sDv53uGGcOpp+WgJxCCDLUa/xcqRpb4FRHXq32hNxfk=;
	b=ivAbAZz8Wq1d/dic7dvqmnZRTV6fqlNSwtIYkn4thDfjG3ZMVPv+gM/faFaz9LWKQxQWPE
	CCdmz/6efQ68CdxBAX7ypGCH2bejaxz+ql2FlLqlWGsXfVe0ALKTCtm3pn9iatLmXKiRSz
	7RPuOtKcVnZELk1gaIjqh4m50cG1rLI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-qgD7ufBcPfioneZOHT0PNw-1; Thu, 12 Jan 2023 17:19:13 -0500
X-MC-Unique: qgD7ufBcPfioneZOHT0PNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0132F857F82;
	Thu, 12 Jan 2023 22:19:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8DD31121314;
	Thu, 12 Jan 2023 22:19:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6D492194705F;
	Thu, 12 Jan 2023 22:19:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3E1641946A78 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 22:19:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9DDF240C200B; Thu, 12 Jan 2023 22:18:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77F7A40C2064;
 Thu, 12 Jan 2023 22:18:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 12 Jan 2023 17:18:49 -0500
Message-Id: <20230112221849.1883104-9-aahringo@redhat.com>
In-Reply-To: <20230112221849.1883104-1-aahringo@redhat.com>
References: <20230112221849.1883104-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm/next 8/8] fs: dlm: remove unnecessary
 waker_up() calls
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

The wake_up() is already handled inside of midcomms_node_reset() when
switching the state to CLOSED state. So there is not need to call it
after midcomms_node_reset() again.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 2a9177f3d468..42ab77f0b28b 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -534,7 +534,6 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 				midcomms_node_reset(node);
 				pr_debug("switch node %d to state %s\n",
 					 node->nodeid, dlm_state_str(node->state));
-				wake_up(&node->shutdown_wait);
 				break;
 			case DLM_LAST_ACK:
 				/* probably remove_member caught it, do nothing */
@@ -1262,7 +1261,6 @@ static void dlm_act_fin_ack_rcv(struct midcomms_node *node)
 		midcomms_node_reset(node);
 		pr_debug("switch node %d to state %s\n",
 			 node->nodeid, dlm_state_str(node->state));
-		wake_up(&node->shutdown_wait);
 		break;
 	case DLM_CLOSED:
 		/* not valid but somehow we got what we want */
-- 
2.31.1

