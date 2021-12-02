Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43159466AE2
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Dec 2021 21:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638476741;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L69PO43kpH5PpCqHTUJsgVdePzEPTL0VC2XRZUwUJ0Y=;
	b=fX5NgX8kh7PDNFe7CDJC0x3jYoYDo266jiN9s/FsbmJYSd3eTzCcIQlNt4HD1f+RdLcM+4
	XLhK3sJZvWaOqAdaG4mflFG9P628+ViwCIuFSUYXveF5GiyS7vBr54aqotckZOOmQtSgAx
	u5Vby2zqrnnPnphfM31MUS5Ybx1jHcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-aCVy4W1LN0G1mRXKsyHq4Q-1; Thu, 02 Dec 2021 15:25:39 -0500
X-MC-Unique: aCVy4W1LN0G1mRXKsyHq4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97A4C10168C7;
	Thu,  2 Dec 2021 20:25:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8119660C05;
	Thu,  2 Dec 2021 20:25:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D10C21809C89;
	Thu,  2 Dec 2021 20:25:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B2KL151028304 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 2 Dec 2021 15:21:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 63A98100EBBF; Thu,  2 Dec 2021 20:21:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E94AB10016F5;
	Thu,  2 Dec 2021 20:21:00 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Dec 2021 15:20:35 -0500
Message-Id: <20211202202039.1386193-3-aahringo@redhat.com>
In-Reply-To: <20211202202039.1386193-1-aahringo@redhat.com>
References: <20211202202039.1386193-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, wferi@debian.org, vvidic@debian.org
Subject: [Cluster-devel] [PATCH dlm-tool 2/6] dlm_controld: man: Fix typo:
	specfic => specific
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Took it from the debian patches. This patch fixes a typo in the dlm.conf
man page.

Reported-by: Ferenc Wágner <wferi@debian.org>
---
 dlm_controld/dlm.conf.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dlm_controld/dlm.conf.5 b/dlm_controld/dlm.conf.5
index 0eb22635..164b5b70 100644
--- a/dlm_controld/dlm.conf.5
+++ b/dlm_controld/dlm.conf.5
@@ -413,7 +413,7 @@ pairs.
 .B mark
 The mark key can be used to set a specific mark value which is then used
 by the in-kernel DLM socket creation. This can be used to match for DLM
-specfic packets for e.g. routing.
+specific packets for e.g. routing.
 
 Example of setting a per socket value for nodeid 1 and a mark value
 of 42:
-- 
2.27.0

