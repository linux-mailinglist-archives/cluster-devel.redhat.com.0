Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1676C32CC
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Mar 2023 14:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679405067;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AAqCzgjsR1FhraoEWuGMXqiqTjn3/e337zHR7kNkKAM=;
	b=jKA8QI4la3TyS/Tf5t916t7d1YRLm17objjraIgsAitww3KoB3VqoAce1MT+Id6d07AKTW
	xa21A0nUR390ccW/0FIR2O+RRfPHg1ZBe4DO6rJmnOe8iu92P0UUDY9vebuxPfSCQafKOu
	GmrgRMAzTAygE1dPp2CV7FPGs8eY1bQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-VyeZmQfrMBulbDsiyKVMLA-1; Tue, 21 Mar 2023 09:19:54 -0400
X-MC-Unique: VyeZmQfrMBulbDsiyKVMLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2F1088562C;
	Tue, 21 Mar 2023 13:17:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 127E01121314;
	Tue, 21 Mar 2023 13:17:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A499119465B3;
	Tue, 21 Mar 2023 13:17:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8F2DF19465B2 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 21 Mar 2023 13:17:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 40EF12166B2E; Tue, 21 Mar 2023 13:17:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 185CA2166B2B;
 Tue, 21 Mar 2023 13:17:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 21 Mar 2023 09:17:34 -0400
Message-Id: <20230321131734.2113556-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH] dlm_controld: set posix_lock flags to zero
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch sets another flags variable to zero which is a leftover of
commit 0834ed4b ("dlm_controld: initialize waiter->flags").
---
 dlm_controld/plock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index ad9b0f27..7f632888 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -1956,6 +1956,7 @@ void receive_plocks_data(struct lockspace *ls, struct dlm_header *hd, int len)
 			po->pid		= le32_to_cpu(pp->pid);
 			po->nodeid	= le32_to_cpu(pp->nodeid);
 			po->ex		= pp->ex;
+			po->flags	= 0;
 			list_add_tail(&po->list, &r->locks);
 		} else {
 			w = malloc(sizeof(struct lock_waiter));
-- 
2.31.1

