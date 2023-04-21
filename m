Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B44086EAE56
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Apr 2023 17:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682092561;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BCtydKIVT8xTz/KNxC6yHW7GKMRmmvZK561Ab4pU8BY=;
	b=FxJ7tclG556YhqCkozL94/rbijDVD9L0+TCkHJtKJtGTcFSLtQTEG4YF5AyNaYA1x3nPKw
	mNi76RtHy70o2QVS8n/ZES3YkEcWeUHOLZzmDEpr75R4qQPay8nI0+RJ8moTHvsToDDhcT
	kdvFAPPMWeZYZLQO1ECk1AVJnnahXIg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-hz1UsPqfP7GGtHNOs4huNg-1; Fri, 21 Apr 2023 11:55:57 -0400
X-MC-Unique: hz1UsPqfP7GGtHNOs4huNg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6382D2A59556;
	Fri, 21 Apr 2023 15:55:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5397A40C2064;
	Fri, 21 Apr 2023 15:55:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EA7CD1946A47;
	Fri, 21 Apr 2023 15:55:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 67DC519466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Apr 2023 15:55:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 53C191121319; Fri, 21 Apr 2023 15:55:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C9191121318;
 Fri, 21 Apr 2023 15:55:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 Apr 2023 11:55:52 -0400
Message-Id: <20230421155552.1147751-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCHv2 dlm/next] fs: dlm: stop unnecessarily
 filling zero ms_extra bytes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
changes since v2:
 - fix typo in subject

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

