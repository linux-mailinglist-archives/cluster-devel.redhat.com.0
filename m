Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 115346EAE45
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Apr 2023 17:48:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682092128;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wuX3SnKRvwyLo2DPUcGxBCtBvLAWYd2bhSudIY6ptNc=;
	b=gS0wldwtNzcwFj6oR2ft2KdleV5Dfg3mEP/f8WrXuhcFm5Bjv+n27J3w/buwVvoYd9Sc0a
	4SKL6rq9XUN+U8AM451btjvi+VBd5k/PN9Z+seatEwVs6S1kgq3JtM2s7h2ozUPUAdJeF2
	CMwWFC7WnJCOzFUP3y7ARFj4Q8f0WT0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-IPLyXLpGODWrw-hOhEm42A-1; Fri, 21 Apr 2023 11:48:45 -0400
X-MC-Unique: IPLyXLpGODWrw-hOhEm42A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74093885624;
	Fri, 21 Apr 2023 15:48:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9868E40BC799;
	Fri, 21 Apr 2023 15:48:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E1D31946A47;
	Fri, 21 Apr 2023 15:48:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8F4491946A40 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Apr 2023 15:48:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6B7FC1410F1E; Fri, 21 Apr 2023 15:48:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45734140EBF4;
 Fri, 21 Apr 2023 15:48:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 Apr 2023 11:48:20 -0400
Message-Id: <20230421154820.1146844-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: stop unnessecarly filling
 zero ms_extra bytes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Commit 7175e131ebba ("fs: dlm: fix invalid derefence of sb_lvbptr")
fixes an issue when the lkb->lkb_lvbptr set to an dangled pointer and an
followed memcpy() would fail. It was fixed by an additional check of
DLM_LKF_VALBLK flag. The mentioned commit forgot to add an additional check
if DLM_LKF_VALBLK is set for the additional amount of LVB data allocated
in a dlm message. This patch is changing the message allocation to check
additionally if DLM_LKF_VALBLK is set otherwise a dangled lkb->lkb_lvbptr
pointer would allocated zero LVB message data which not gets filled with
actual data.

This patch is however only a cleanup to reduce the amount of zero bytes
transmitted over network as receive_lvb() will only evaluates message LVB
data if DLM_LKF_VALBLK is set.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 1582c8b1404c..debf8a55ad7d 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3381,7 +3381,7 @@ static int create_message(struct dlm_rsb *r, struct dlm_lkb *lkb,
 	case DLM_MSG_REQUEST_REPLY:
 	case DLM_MSG_CONVERT_REPLY:
 	case DLM_MSG_GRANT:
-		if (lkb && lkb->lkb_lvbptr)
+		if (lkb && lkb->lkb_lvbptr && (lkb->lkb_exflags & DLM_LKF_VALBLK))
 			mb_len += r->res_ls->ls_lvblen;
 		break;
 	}
-- 
2.31.1

