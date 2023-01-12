Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8896686B6
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 23:19:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673561957;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VSktyW02aa3L1DQMbX+qzr3a4Y/17uPqEVUOuoYQeJc=;
	b=XSZbT+LALm3S+d6DYDkocRIwZ3a0PbqMWvnfqXqZSCbEhnYo6O2/C+UrWxHX8KKK1P6mhq
	MBtgoZOVYZLaK8y5aLipb5Oqu5VoYJe3WLCASehiXhTPfovtfRPf+bAL4Jr+xBrrM8KilH
	YcE7cHq+szliYm10wJEm8vby1nlnebg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-_WrNoTozNiOrinIah7FBWA-1; Thu, 12 Jan 2023 17:19:13 -0500
X-MC-Unique: _WrNoTozNiOrinIah7FBWA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10FA638012DB;
	Thu, 12 Jan 2023 22:19:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05FC5492C14;
	Thu, 12 Jan 2023 22:19:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 844AA1947069;
	Thu, 12 Jan 2023 22:19:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3E5901947056 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 22:19:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4820940C200A; Thu, 12 Jan 2023 22:18:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2381640C2064;
 Thu, 12 Jan 2023 22:18:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 12 Jan 2023 17:18:47 -0500
Message-Id: <20230112221849.1883104-7-aahringo@redhat.com>
In-Reply-To: <20230112221849.1883104-1-aahringo@redhat.com>
References: <20230112221849.1883104-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm/next 6/8] fs: dlm: remove newline in
 log_print
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

There is an API difference between log_print() and other printk()s to
put a newline or not. This one was introduced by mistake because
log_print() adds a newline.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 3932c7cf0e7a..b5720042ef9d 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -467,7 +467,7 @@ static void dlm_pas_fin_ack_rcv(struct midcomms_node *node)
 		break;
 	default:
 		spin_unlock(&node->state_lock);
-		log_print("%s: unexpected state: %d\n",
+		log_print("%s: unexpected state: %d",
 			  __func__, node->state);
 		WARN_ON_ONCE(1);
 		return;
@@ -540,7 +540,7 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 				break;
 			default:
 				spin_unlock(&node->state_lock);
-				log_print("%s: unexpected state: %d\n",
+				log_print("%s: unexpected state: %d",
 					  __func__, node->state);
 				WARN_ON_ONCE(1);
 				return;
@@ -1269,7 +1269,7 @@ static void dlm_act_fin_ack_rcv(struct midcomms_node *node)
 		break;
 	default:
 		spin_unlock(&node->state_lock);
-		log_print("%s: unexpected state: %d\n",
+		log_print("%s: unexpected state: %d",
 			  __func__, node->state);
 		WARN_ON_ONCE(1);
 		return;
@@ -1369,7 +1369,7 @@ void dlm_midcomms_remove_member(int nodeid)
 			/* already gone, do nothing */
 			break;
 		default:
-			log_print("%s: unexpected state: %d\n",
+			log_print("%s: unexpected state: %d",
 				  __func__, node->state);
 			break;
 		}
-- 
2.31.1

