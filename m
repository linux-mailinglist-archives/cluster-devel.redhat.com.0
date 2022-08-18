Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E913B5995F6
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Aug 2022 09:27:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660894023;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nrxjaVE4WdIyGQTcKGgqFS8cn5mFR+Wj7Z0M9uQDl1c=;
	b=SPwA7v0nYBcXWPLIHaLiT0jE8bhhUJzM5Vd7m2IRThBhQ3ceUNllAZfyr1aOBXutcCSCIi
	nFOYRaO4bmMY9nYfycNDZLTGKhVCDkWDITKxhe2M0dPEJwm8Fu9CUJlCMEjGPCf9Zg2M7v
	JjKRhjkJIqA4oHlYjVq2dvFpISJ2Nr4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-L2yNl94DNYSjWBnvnTFpUw-1; Fri, 19 Aug 2022 03:27:02 -0400
X-MC-Unique: L2yNl94DNYSjWBnvnTFpUw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99B2A101A586;
	Fri, 19 Aug 2022 07:26:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7190C492C3B;
	Fri, 19 Aug 2022 07:26:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5F855194F845;
	Fri, 19 Aug 2022 07:26:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3A110194F4B4 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 21:19:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 29AE1400E726; Thu, 18 Aug 2022 21:19:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25C7040D2827
 for <cluster-devel@redhat.com>; Thu, 18 Aug 2022 21:19:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 851C0811E7A
 for <cluster-devel@redhat.com>; Thu, 18 Aug 2022 21:19:56 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-604-2YUDWjv1OWGcHQg-KIpldA-1; Thu,
 18 Aug 2022 17:19:54 -0400
X-MC-Unique: 2YUDWjv1OWGcHQg-KIpldA-1
Received: (qmail 3962312 invoked from network); 18 Aug 2022 23:01:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 18 Aug 2022 23:01:43 +0200
X-UD-Smtp-Session: l3s3148p1@bQXoSYrmB+Qucref
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 18 Aug 2022 23:01:43 +0200
Message-Id: <20220818210143.7891-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Fri, 19 Aug 2022 07:26:55 +0000
Subject: [Cluster-devel] [PATCH] dlm: move from strlcpy with unused retval
 to strscpy
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
Cc: cluster-devel@redhat.com, Wolfram Sang <wsa+renesas@sang-engineering.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Follow the advice of the below link and prefer 'strscpy' in this
subsystem. Conversion is 1:1 because the return value is not used.
Generated by a coccinelle script.

Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 fs/dlm/config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index ac8b62106ce0..c15425fe48e3 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -122,9 +122,9 @@ static ssize_t cluster_cluster_name_store(struct config_item *item,
 {
 	struct dlm_cluster *cl = config_item_to_cluster(item);
 
-	strlcpy(dlm_config.ci_cluster_name, buf,
+	strscpy(dlm_config.ci_cluster_name, buf,
 				sizeof(dlm_config.ci_cluster_name));
-	strlcpy(cl->cl_cluster_name, buf, sizeof(cl->cl_cluster_name));
+	strscpy(cl->cl_cluster_name, buf, sizeof(cl->cl_cluster_name));
 	return len;
 }
 
-- 
2.35.1

