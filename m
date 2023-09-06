Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BBB793EE3
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Sep 2023 16:32:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694010765;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7sTd2aOjCdDj7oPoRDfwu4hNaQkZ2+ekIDpy6F7/rnE=;
	b=RRYP2Ia6p0IKPpp2fURm7zUErY+sdyTRljDggBqXp/bVGPChIruSvOdyYQpxyw/IjL0QXe
	5i1sWPoGScDJABC/pzrVXhLYAVLa/xH6k7GIbVUQ2KYNcIPJGPHNIpQ1HZiTt+gXYp/sV/
	VajEnBO1iruxnpQuzzAgFIQk/06DsVY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-GMUBFKnINaCyxUCdwnh5Zg-1; Wed, 06 Sep 2023 10:32:37 -0400
X-MC-Unique: GMUBFKnINaCyxUCdwnh5Zg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92D8910487A1;
	Wed,  6 Sep 2023 14:32:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78DFC6B5AA;
	Wed,  6 Sep 2023 14:32:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 288FE1946595;
	Wed,  6 Sep 2023 14:32:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 88C40194658C for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Sep 2023 14:32:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5BFF2140E967; Wed,  6 Sep 2023 14:32:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DD67140E950;
 Wed,  6 Sep 2023 14:32:33 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  6 Sep 2023 10:31:51 -0400
Message-Id: <20230906143153.1353077-4-aahringo@redhat.com>
In-Reply-To: <20230906143153.1353077-1-aahringo@redhat.com>
References: <20230906143153.1353077-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH dlm/next 4/6] dlm: fix no ack after final
 message
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In case of an final DLM message we can't should not send an ack out
after the final message. This patch moves the ack message before the
messages will be transmitted. If it's the final message and the
receiving node turns into DLM_CLOSED state another ack messages will
being received and turning the receiving node into DLM_ESTABLISHED
again.

Cc: stable@vger.kernel.org
Fixes: 1696c75f1864 ("fs: dlm: add send ack threshold and append acks to msgs")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 6bc8d7f89b2c..2247ebb61be1 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1038,15 +1038,15 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 
 		break;
 	case DLM_VERSION_3_2:
+		/* send ack back if necessary */
+		dlm_send_ack_threshold(node, DLM_SEND_ACK_BACK_MSG_THRESHOLD);
+
 		msg = dlm_midcomms_get_msg_3_2(mh, nodeid, len, allocation,
 					       ppc);
 		if (!msg) {
 			dlm_free_mhandle(mh);
 			goto err;
 		}
-
-		/* send ack back if necessary */
-		dlm_send_ack_threshold(node, DLM_SEND_ACK_BACK_MSG_THRESHOLD);
 		break;
 	default:
 		dlm_free_mhandle(mh);
-- 
2.31.1

