Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB1E735D00
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jun 2023 19:23:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687195419;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5iHLEtxTCnfRpK7QD9hAgwPkjeJs20HtxSvFhJ5LUQ0=;
	b=ZuD4z1akNrJiDtO5MZRxz7iGQzKvY3vwKSWnIxKC+yJoWTq8d96ntLZjEBbDa9iRahLX4y
	Qa3+cB5gVO/tpJ3RdT8S50Ob1e3U1ZCcwICn7x+Kfo607kPXVBL3E5M0D2U/l4CLH8uZWh
	ErxwHb9RyyTJKGd//zww3bE24Obu82c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591--D-w7fepPeSa__CTQHj0fQ-1; Mon, 19 Jun 2023 13:23:35 -0400
X-MC-Unique: -D-w7fepPeSa__CTQHj0fQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F51F185A7A9;
	Mon, 19 Jun 2023 17:23:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F23DF83B8B;
	Mon, 19 Jun 2023 17:23:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D502A19465A4;
	Mon, 19 Jun 2023 17:23:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C5C931946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 19 Jun 2023 17:23:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6EEA6492B0A; Mon, 19 Jun 2023 17:23:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49EDE492C1B;
 Mon, 19 Jun 2023 17:23:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 19 Jun 2023 13:23:24 -0400
Message-Id: <20230619172324.2836797-2-aahringo@redhat.com>
In-Reply-To: <20230619172324.2836797-1-aahringo@redhat.com>
References: <20230619172324.2836797-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm/next 2/2] fs: dlm: remove
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

