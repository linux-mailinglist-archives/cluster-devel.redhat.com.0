Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A1764546B43
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jun 2022 19:06:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654880792;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b8gc6em0BsB1dnPHS7GnlCR21esNh2DAkoSZjt+R/TY=;
	b=J+LzI2XBFHWDXibLxxZsaYYhUjbVDdLDS427MPbddt9dIvTDC0SuaNfHIyFFatUtS9KVOm
	s/ZOjnBDGevnD4tQWiRQEkEYKN+b0qvF0VLKoIUD1tMHfA6zhbcUT6X21Qtwi5VhwGJcG4
	i1qj+d3otTG/At15t7K29Rw7YrNjSvg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-RBpaSkevOcmO3z0sGpAXzw-1; Fri, 10 Jun 2022 13:06:27 -0400
X-MC-Unique: RBpaSkevOcmO3z0sGpAXzw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23357101E167;
	Fri, 10 Jun 2022 17:06:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39D2F492C3B;
	Fri, 10 Jun 2022 17:06:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0578C19466DF;
	Fri, 10 Jun 2022 17:06:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1EEAE19466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F157E18EA7; Fri, 10 Jun 2022 17:06:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D41DC1730C;
 Fri, 10 Jun 2022 17:06:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 10 Jun 2022 13:06:11 -0400
Message-Id: <20220610170616.3480642-3-aahringo@redhat.com>
In-Reply-To: <20220610170616.3480642-1-aahringo@redhat.com>
References: <20220610170616.3480642-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v5.19-rc1 2/7] fs: dlm: call
 dlm_lsop_recover_prep once
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes the behaviour of "dlm_lsop_recover_prep" callback. It
will be called once when locking was stopped if it was previously
running not if dlm_ls_stop() is called multiple times when locking was
already stopped. Now it will be called only if a dlm_ls_start() was before.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/member.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 7e5f5aefefb5..67b056634f03 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -679,7 +679,16 @@ int dlm_ls_stop(struct dlm_ls *ls)
 	if (!ls->ls_recover_begin)
 		ls->ls_recover_begin = jiffies;
 
-	dlm_lsop_recover_prep(ls);
+	/* call recover_prep ops only once and not multiple times
+	 * for each possible dlm_ls_stop() when recovery is already
+	 * stopped.
+	 *
+	 * If we successful was able to clear LSFL_RUNNING bit and
+	 * it was set we know it is the first dlm_ls_stop() call.
+	 */
+	if (new)
+		dlm_lsop_recover_prep(ls);
+
 	return 0;
 }
 
-- 
2.31.1

