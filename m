Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D813A57B972
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Jul 2022 17:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658330495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A+GVCq0IKHk5M0IIvLpGnumqB2V3KEkcz72aiDaDE+Q=;
	b=dNLSZAGQ2WXaMELd7cBTwqY8tWz1/VuwVQ59GWdj9a3t0Ur1LGo+gp5HQVlE+m8yhBiImx
	aGofeCpCkvm4sqsG196uu24ks9C/x9Sbq89nvsDkiqG9JHdyP1/e+6BZjSe+t7iVGYYzQQ
	lR242jbBBo00QzbYYX8P5HTHIGWrppc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-8uMLe5soPye8E7CdwnO4vg-1; Wed, 20 Jul 2022 11:21:26 -0400
X-MC-Unique: 8uMLe5soPye8E7CdwnO4vg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 771CE80029D;
	Wed, 20 Jul 2022 15:21:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65466C44AE3;
	Wed, 20 Jul 2022 15:21:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 34154194707F;
	Wed, 20 Jul 2022 15:21:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C24741947066 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 20 Jul 2022 15:04:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9F3CF1121319; Wed, 20 Jul 2022 15:04:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 814641121314;
 Wed, 20 Jul 2022 15:04:32 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 20 Jul 2022 11:04:29 -0400
Message-Id: <20220720150429.2985107-2-aahringo@redhat.com>
In-Reply-To: <20220720150429.2985107-1-aahringo@redhat.com>
References: <20220720150429.2985107-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCHv2 dlm/next 2/2] fs: dlm: handle -EINVAL as
 log_error()
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

If the user generates a -EINVAL it's probably because the user using DLM
wrong. To give the user notice about that wrong behaviour we should
always print -EINVAL errors on the proper loglevel. In case of other
errors like -EBUSY it will be still printed on debug loglevel as the
current API handles it as "retry again".

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---

changes since v2:
 - add case 0: for successful case in we don't need to print out
   anything.

 fs/dlm/lock.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 026c203ff529..061fa96fc978 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -2900,11 +2900,23 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 #endif
 	rv = 0;
  out:
-	if (rv)
+	switch (rv) {
+	case 0:
+		break;
+	case -EINVAL:
+		log_error(ls, "%s %d %x %x %x %d %d %s", __func__,
+			  rv, lkb->lkb_id, lkb->lkb_flags, args->flags,
+			  lkb->lkb_status, lkb->lkb_wait_type,
+			  lkb->lkb_resource->res_name);
+		break;
+	default:
 		log_debug(ls, "%s %d %x %x %x %d %d %s", __func__,
 			  rv, lkb->lkb_id, lkb->lkb_flags, args->flags,
 			  lkb->lkb_status, lkb->lkb_wait_type,
 			  lkb->lkb_resource->res_name);
+		break;
+	}
+
 	return rv;
 }
 
@@ -3037,11 +3049,23 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 	lkb->lkb_astparam = args->astparam;
 	rv = 0;
  out:
-	if (rv)
+	switch (rv) {
+	case 0:
+		break;
+	case -EINVAL:
+		log_error(ls, "%s %d %x %x %x %x %d %s", __func__, rv,
+			  lkb->lkb_id, lkb->lkb_flags, lkb->lkb_exflags,
+			  args->flags, lkb->lkb_wait_type,
+			  lkb->lkb_resource->res_name);
+		break;
+	default:
 		log_debug(ls, "%s %d %x %x %x %x %d %s", __func__, rv,
 			  lkb->lkb_id, lkb->lkb_flags, lkb->lkb_exflags,
 			  args->flags, lkb->lkb_wait_type,
 			  lkb->lkb_resource->res_name);
+		break;
+	}
+
 	return rv;
 }
 
-- 
2.31.1

