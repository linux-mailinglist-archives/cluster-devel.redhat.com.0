Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2636C34C7
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Mar 2023 15:52:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679410327;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=622AGiFZz6VWlfGuJ1O/4DT6j6fHTMv8oSvAkEis97g=;
	b=V7OLzgtVa7OjMK4AIPrLlIqZdOgCeSw9aG0B3qs+NjcT5zOcqGd0TJQEnoM23i3CDGmH+j
	XgTY0ICqgc+huiv6puP/o2KpGb60I/lNnXwGBUP6kjvSNuym5bwi62jsotTY1dt0Mn7Aib
	boWFyDsOGnxIBvlFGNZblWgrbLsgn3U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-vSaVCZA9O4uMeOc0Wn8tqw-1; Tue, 21 Mar 2023 10:52:03 -0400
X-MC-Unique: vSaVCZA9O4uMeOc0Wn8tqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 062783C11780;
	Tue, 21 Mar 2023 14:52:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00EC2C15BA0;
	Tue, 21 Mar 2023 14:52:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AA18619465B3;
	Tue, 21 Mar 2023 14:51:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7556D1946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 21 Mar 2023 14:51:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4E4542027062; Tue, 21 Mar 2023 14:51:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 254E02027047;
 Tue, 21 Mar 2023 14:51:58 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 21 Mar 2023 10:51:54 -0400
Message-Id: <20230321145154.2222461-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH] dlm_controld: init plocks_data to zero
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Inits plocks_data to zero in case of send_all_plocks_data() does not set
plocks_data to any value or nodes_added() returns false. This patch fixes
cppcheck warning:

cpg.c:1299:27: error: Uninitialized variable: plocks_data [uninitvar]
 send_plocks_done(ls, cg, plocks_data);
---
 dlm_controld/cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dlm_controld/cpg.c b/dlm_controld/cpg.c
index b85fef5f..32aad924 100644
--- a/dlm_controld/cpg.c
+++ b/dlm_controld/cpg.c
@@ -1244,8 +1244,8 @@ static int nodes_added(struct lockspace *ls)
 static void prepare_plocks(struct lockspace *ls)
 {
 	struct change *cg = list_first_entry(&ls->changes, struct change, list);
+	uint32_t plocks_data = 0;
 	struct member *memb;
-	uint32_t plocks_data;
 
 	if (!opt(enable_plock_ind) || ls->disable_plock)
 		return;
-- 
2.31.1

