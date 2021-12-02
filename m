Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2B466AE4
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Dec 2021 21:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638476753;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JeLkRlI60Bf2kLQg3/fmZxMrjkxnzs+k/qV2RBc9rYM=;
	b=XQDUAuOtmEFsNEoG20JfsSNlcrxXMtGsr+ehS+vR9xlJAZfDCsZ49p9aedILFITOAdpDb5
	WjNKYYTUF4v5P8EX9t13rUqJBgI85fYglHrlxFjAL0dD2JWQxqnrAhtKtBXedxmY0kxlBV
	0G5aD+u1wi37NAmb8GdZexRMDCPiMgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-MnfksqAUOPOXitJ8uaH13w-1; Thu, 02 Dec 2021 15:25:50 -0500
X-MC-Unique: MnfksqAUOPOXitJ8uaH13w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F53883DD30;
	Thu,  2 Dec 2021 20:25:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5345F60843;
	Thu,  2 Dec 2021 20:25:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30A934BB7C;
	Thu,  2 Dec 2021 20:25:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B2KL0xE028287 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 2 Dec 2021 15:21:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CD6F310023AE; Thu,  2 Dec 2021 20:21:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F2C210016F5;
	Thu,  2 Dec 2021 20:21:00 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Dec 2021 15:20:34 -0500
Message-Id: <20211202202039.1386193-2-aahringo@redhat.com>
In-Reply-To: <20211202202039.1386193-1-aahringo@redhat.com>
References: <20211202202039.1386193-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, wferi@debian.org, vvidic@debian.org
Subject: [Cluster-devel] [PATCH dlm-tool 1/6] init: Enable systemctl help
	dlm to show relevant man pages
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Took it from the debian patches. This patch adds entries to the systemd
unit file to reference relevant man pages.

Reported-by: Ferenc Wágner <wferi@debian.org>
---
 init/dlm.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/dlm.service b/init/dlm.service
index 1db59251..6def985b 100644
--- a/init/dlm.service
+++ b/init/dlm.service
@@ -2,6 +2,7 @@
 Description=dlm control daemon
 Requires=corosync.service sys-kernel-config.mount
 After=corosync.service sys-kernel-config.mount
+Documentation=man:dlm_controld man:dlm.conf man:dlm_stonith
 
 [Service]
 OOMScoreAdjust=-1000
-- 
2.27.0

