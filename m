Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 573BB593A7E
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Aug 2022 21:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660592621;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SZrPHWvxVIEBbwb7DO4HXFxU9EFA5wZIhkskyiVlrx4=;
	b=LDNuIDjsRxBFH64pamE1PE7j53dMTUFBM2IQ70DL3vev2nit1vmfDiXvlpNgp5PQAqOnX9
	CTCtJ5drb/bc5S/9cER98QOGyG4ZrtLRBI137wQc6LfGgDbQ3iiAA0OWjt7H75XrfrM0pL
	Eb6g7DT7NbA4vZvGsLZVFypNCuRiQiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-JRYWGMEOO6eULFSgJ0GOAw-1; Mon, 15 Aug 2022 15:43:38 -0400
X-MC-Unique: JRYWGMEOO6eULFSgJ0GOAw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A771E802525;
	Mon, 15 Aug 2022 19:43:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C469492C3B;
	Mon, 15 Aug 2022 19:43:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A8DB31940371;
	Mon, 15 Aug 2022 19:43:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BE6FB1940351 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 15 Aug 2022 19:43:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B04BC112131B; Mon, 15 Aug 2022 19:43:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97FC31121319;
 Mon, 15 Aug 2022 19:43:30 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 15 Aug 2022 15:43:18 -0400
Message-Id: <20220815194328.2208580-7-aahringo@redhat.com>
In-Reply-To: <20220815194328.2208580-1-aahringo@redhat.com>
References: <20220815194328.2208580-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [RESEND dlm/next 06/16] fs: dlm: handle -EINVAL as
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

If the user generates a -EINVAL it's probably because the user using DLM
wrong. To give the user notice about that wrong behaviour we should
always print -EINVAL errors on the proper loglevel. In case of other
errors like -EBUSY it will be still printed on debug loglevel as the
current API handles it from user view as "retry again".

We add a WARN_ON(1) as well to see if dlm user reports about hitting
such case and we can investigate it.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 026c203ff529..354f79254d62 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -2900,11 +2900,25 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 #endif
 	rv = 0;
  out:
-	if (rv)
+	switch (rv) {
+	case 0:
+		break;
+	case -EINVAL:
+		/* annoy the user because dlm usage is wrong */
+		WARN_ON(1);
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
 
@@ -3037,11 +3051,25 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 	lkb->lkb_astparam = args->astparam;
 	rv = 0;
  out:
-	if (rv)
+	switch (rv) {
+	case 0:
+		break;
+	case -EINVAL:
+		/* annoy the user because dlm usage is wrong */
+		WARN_ON(1);
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

