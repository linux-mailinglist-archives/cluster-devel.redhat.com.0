Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B70F2466AE5
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Dec 2021 21:25:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638476756;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GF9dyXpxsldlNdQF3nh9VlAOQ1F3+vELBnfasQJll98=;
	b=SGISbACY4UeGU61F9KgJdWRdF5gQArEMRbN5gGc96hhNHUxQgkV4MoCOITpQdMkdXV7ste
	odraB52TIOZAxX83U1pkIIc4BgsXWpaSFkmUjq7J91Cu6N01K5XS/a9tJ5nBekOumt9lw1
	vqHFQ9KtSWauPqNcTrKd+/JXn67gDZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-33oIGvQdMdaE06W9dntmiA-1; Thu, 02 Dec 2021 15:25:53 -0500
X-MC-Unique: 33oIGvQdMdaE06W9dntmiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6AF1835E21;
	Thu,  2 Dec 2021 20:25:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8EDA4ABAD;
	Thu,  2 Dec 2021 20:25:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B67674BB7C;
	Thu,  2 Dec 2021 20:25:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B2KL2VT028316 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 2 Dec 2021 15:21:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0AD5710016FE; Thu,  2 Dec 2021 20:21:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FC6B10016F5;
	Thu,  2 Dec 2021 20:21:01 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Dec 2021 15:20:36 -0500
Message-Id: <20211202202039.1386193-4-aahringo@redhat.com>
In-Reply-To: <20211202202039.1386193-1-aahringo@redhat.com>
References: <20211202202039.1386193-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, wferi@debian.org, vvidic@debian.org
Subject: [Cluster-devel] [PATCH dlm-tool 3/6] stonith_helper: Fix gcc build
	warnings
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Took it from the debian patches. The return value of getopt() is int not
char. This patch switches the return value which is stored in variable
c to int.

Reported-by: Valentin Vidic <vvidic@debian.org>
---
 fence/stonith_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fence/stonith_helper.c b/fence/stonith_helper.c
index b1db352a..92fe0e5d 100644
--- a/fence/stonith_helper.c
+++ b/fence/stonith_helper.c
@@ -25,8 +25,7 @@ static int get_options(int argc, char *argv[])
 	char arg[MAX_ARG_LEN];
 	char key[MAX_ARG_LEN];
 	char val[MAX_ARG_LEN];
-	char c;
-	int rv;
+	int rv, c;
 
 	if (argc > 1) {
 		while ((c = getopt(argc, argv, "n:t:")) != -1) {
-- 
2.27.0

