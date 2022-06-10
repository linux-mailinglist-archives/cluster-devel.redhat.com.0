Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D431B546B41
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jun 2022 19:06:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654880790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NyYAhuY8KUpF6zbvVN25lnb9W1+bQHvCPB4Zreu7J0U=;
	b=imVlTtKC+R3wWTOXXs8z2jDHW0DIFXCvR9Jv41hsQp9gPf9Q6YWB4WAj5ORDqmCRLd2xWm
	LQ4VRIEHaggWcQreZzNx2fPYMb3hEfZbhr2cQc7/BFW5oWzaxq/reYGpLP5rSNQcSGBpro
	cvn+osjDPMT7GMWP29Ct2KJkvnyZUn8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-ORVv616pPXuDy29sHdiVHQ-1; Fri, 10 Jun 2022 13:06:27 -0400
X-MC-Unique: ORVv616pPXuDy29sHdiVHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 790C03801F67;
	Fri, 10 Jun 2022 17:06:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E5111415103;
	Fri, 10 Jun 2022 17:06:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 30B061947058;
	Fri, 10 Jun 2022 17:06:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DA0B919466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BE5C818EA7; Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A10431131A;
 Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 10 Jun 2022 13:06:16 -0400
Message-Id: <20220610170616.3480642-8-aahringo@redhat.com>
In-Reply-To: <20220610170616.3480642-1-aahringo@redhat.com>
References: <20220610170616.3480642-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v5.19-rc1 7/7] fs: dlm: add WARN_ON for non
 waiter case
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds a WARN_ON if recovery hits a critical error but no
caller was waiting in dlm_new_lockspace(), this can occur e.g. if a
node got fences. The WARN_ON signals us to investigate into this case
that it should not occur.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/recoverd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index eeb221c175a2..240267568aab 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -311,6 +311,7 @@ static void do_ls_recovery(struct dlm_ls *ls)
 
 				/* let new_lockspace() get aware of critical error */
 				ls->ls_recovery_result = error;
+				WARN_ON(completion_done(&ls->ls_recovery_done));
 				complete(&ls->ls_recovery_done);
 				break;
 			}
-- 
2.31.1

