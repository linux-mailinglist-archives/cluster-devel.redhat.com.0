Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4C36D0ED3
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 21:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680204641;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v7bnoL9s70YxEQWS4SDllEajCXlbLKKEIRJpr5GddfE=;
	b=H5ObvVOuYnYVC9swf2h6Jc5V0QBdt6R8t+G+8LHq9dXWG2qfVYrr2/5FddweuG+iQbFk0o
	+YY6Z4qhTXaP9GK5TVqX5pvEY38KT7ZLkbxJQW4i4x7YziLrq4FNpTdzEEFDDOblGX3n9e
	TGYuk4UAv576sR/EEUMwiPQopXneTYM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-g_kDwUKyMvCGqjy4GDZxtw-1; Thu, 30 Mar 2023 15:30:35 -0400
X-MC-Unique: g_kDwUKyMvCGqjy4GDZxtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2C8B8057BF;
	Thu, 30 Mar 2023 19:30:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DB75111F3B0;
	Thu, 30 Mar 2023 19:30:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2DE2E19465A4;
	Thu, 30 Mar 2023 19:30:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 67DA41946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Mar 2023 19:30:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C6FD492B02; Thu, 30 Mar 2023 19:30:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04793492B00;
 Thu, 30 Mar 2023 19:30:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 30 Mar 2023 15:30:27 -0400
Message-Id: <20230330193027.153456-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH dlm-tool] dlm_tool: fix missing fclose calls
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

This patch will fix missing fclose() calls when fgets() of do_lockdump()
fails.
---
 dlm_tool/main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/dlm_tool/main.c b/dlm_tool/main.c
index 52fd5b89..2e6810d6 100644
--- a/dlm_tool/main.c
+++ b/dlm_tool/main.c
@@ -1177,8 +1177,9 @@ static void do_lockdump(char *name)
 	}
 
 	/* skip the header on the first line */
-	if (!fgets(line, LOCK_LINE_MAX, file))
-		return;
+	if (!fgets(line, LOCK_LINE_MAX, file)) {
+		goto out;
+	}
 
 	while (fgets(line, LOCK_LINE_MAX, file)) {
 		rv = sscanf(line, "%x %d %x %u %llu %x %x %hhd %hhd %hhd %u %d %d",
@@ -1199,7 +1200,7 @@ static void do_lockdump(char *name)
 		if (rv != 13) {
 			fprintf(stderr, "invalid debugfs line %d: %s\n",
 				rv, line);
-			return;
+			goto out;
 		}
 
 		memset(r_name, 0, sizeof(r_name));
@@ -1229,6 +1230,7 @@ static void do_lockdump(char *name)
 			ownpid, nodeid, r_name);
 	}
 
+ out:
 	fclose(file);
 }
 
-- 
2.31.1

