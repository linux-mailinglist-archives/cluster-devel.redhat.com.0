Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E649555383
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Jun 2022 20:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655923720;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EtqZLYT9rTnQcb8XJEHsdh2RkTQKgHfDeLZz7wq/Xds=;
	b=XIYvkUyQNTPrhZLX6oxu2owV3xOKBG5aWN5jZAicNvYHbCWBuLA3x2nyRXsFpuhX8K6ERu
	Zva4+X26EaY37+F22dtTfqMH5tK8j+Rg/OppvtvCEp7KTx4MAbKocsoMr8+2oqltl5gBeH
	m/NPdDbdHgiIDwJ6tD+xcIIkcdw4drg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-AAxFjk6KOviepKiwfiUaSw-1; Wed, 22 Jun 2022 14:48:34 -0400
X-MC-Unique: AAxFjk6KOviepKiwfiUaSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EA39805B98;
	Wed, 22 Jun 2022 18:48:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1311A9D63;
	Wed, 22 Jun 2022 18:48:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CDE4D1947060;
	Wed, 22 Jun 2022 18:48:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E2DB31947054 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 22 Jun 2022 18:45:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D565440CFD0E; Wed, 22 Jun 2022 18:45:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7BA740CFD0A;
 Wed, 22 Jun 2022 18:45:28 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 22 Jun 2022 14:45:18 -0400
Message-Id: <20220622184523.1886869-16-aahringo@redhat.com>
In-Reply-To: <20220622184523.1886869-1-aahringo@redhat.com>
References: <20220622184523.1886869-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Cluster-devel] [PATCH RESEND v5.19-rc3 15/20] fs: dlm: change
 -EINVAL recovery error to -EAGAIN
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes a -EINVAL error for dlm_master_lookup() to -EAGAIN.
It is a critical error which should not happened, if it happens there
exists an issue. However we still track those issues inside the lock but
if they happen we try to run recovery again if those issues will get
resolved. If not recovery has a logic to fail this node after several
retries.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dir.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/dlm/dir.c b/fs/dlm/dir.c
index fb1981654bb2..75cf0d4b2fe4 100644
--- a/fs/dlm/dir.c
+++ b/fs/dlm/dir.c
@@ -138,6 +138,10 @@ int dlm_recover_directory(struct dlm_ls *ls)
 				if (error) {
 					log_error(ls, "recover_dir lookup %d",
 						  error);
+					/* retry recovery and hope it's gone */
+					if (error == -EINVAL)
+						error = -EAGAIN;
+
 					goto out_free;
 				}
 
-- 
2.31.1

