Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 148937654D8
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 15:23:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690464199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5iHLEtxTCnfRpK7QD9hAgwPkjeJs20HtxSvFhJ5LUQ0=;
	b=E4IOe/FA5l88xSC4CjF0nT6kcLIORP/to5xPmL1u2+CXLPYHTCr/gwl9lKiUy8cNZwfGUB
	ct+5wRQZBNEg8FHBkoQkF86IJ5V3ahBfieB3sLfyBfkRFip1hQz8bROPH6CHupEiTn7wC9
	MxPNhiWM+CoQgjUcdEddVrfIRwT+iXk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-dqV_T4kPOIa9Gzx17eMBcA-1; Thu, 27 Jul 2023 09:23:14 -0400
X-MC-Unique: dqV_T4kPOIa9Gzx17eMBcA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9935E88D54A;
	Thu, 27 Jul 2023 13:23:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C146492C13;
	Thu, 27 Jul 2023 13:23:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 456A2193F504;
	Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AE1B91946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9FDE74094DC3; Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D6254094DC1;
 Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Jul 2023 09:22:56 -0400
Message-Id: <20230727132303.3352514-6-aahringo@redhat.com>
In-Reply-To: <20230727132303.3352514-1-aahringo@redhat.com>
References: <20230727132303.3352514-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-next 06/13] fs: dlm: remove
 clear_members_cb
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch is just a small cleanup to directly call
remove_remote_member() instead of going over clear_members_cb() which
just calls remove_remote_member().

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/member.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 77d202e4a02a..f303ea8bd256 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -393,14 +393,9 @@ static void remove_remote_member(int nodeid)
 	dlm_midcomms_remove_member(nodeid);
 }
 
-static void clear_members_cb(int nodeid)
-{
-	remove_remote_member(nodeid);
-}
-
 void dlm_clear_members(struct dlm_ls *ls)
 {
-	clear_memb_list(&ls->ls_nodes, clear_members_cb);
+	clear_memb_list(&ls->ls_nodes, remove_remote_member);
 	ls->ls_num_nodes = 0;
 }
 
-- 
2.31.1

