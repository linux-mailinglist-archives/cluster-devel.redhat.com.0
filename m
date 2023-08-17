Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7404E77FC7F
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Aug 2023 19:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692292048;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AVxUIdd3NK9gRtDAKQX45jAh6hQdBYP4mJZR6FxeRbo=;
	b=HQ9IMdf6CJEBH2DWUw1FumwFN9witNwHUyKGrdH+IsJrA0oQsPJBj1/X88ZT439tzoMr7w
	C5/iym4iwIx4vWQIUYU1tpCBnWsB54WcZmAxcBecv1KkHmX9dfrnIWeRmMcbQr/GRwniHU
	aaBVKkhxlVAI2momuRbMwafoVpqRIiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-SNj1rcAHN8yY_wk1EgurgQ-1; Thu, 17 Aug 2023 13:07:23 -0400
X-MC-Unique: SNj1rcAHN8yY_wk1EgurgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E974101B44E;
	Thu, 17 Aug 2023 17:07:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4753140E950;
	Thu, 17 Aug 2023 17:07:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 70193194658D;
	Thu, 17 Aug 2023 17:07:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BA8B21946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Aug 2023 17:07:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9358040D283A; Thu, 17 Aug 2023 17:07:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DB6D40D2839;
 Thu, 17 Aug 2023 17:07:07 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Aug 2023 13:07:06 -0400
Message-Id: <20230817170706.3977893-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-tool] dlm_controld: fix various deadcode
 issues
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fix various deadcode issues discovered by coverity. The flags
from the shutdown_callback() aren't flags, we need to use == to get the
shutdown request type. The value COROSYNC_CFG_SHUTDOWN_FLAG_REQUEST is 0
and will never be true in this case.

The strstr() need to be incremented after checking on NULL.

The &dlm_options[ind] can't never be NULL, we check if name is check to
indicate an entry which is not being used.
---
 dlm_controld/config.c |  2 +-
 dlm_controld/lib.c    | 10 ++++++++--
 dlm_controld/member.c |  2 +-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/dlm_controld/config.c b/dlm_controld/config.c
index b15527b9..9332bd28 100644
--- a/dlm_controld/config.c
+++ b/dlm_controld/config.c
@@ -286,7 +286,7 @@ void set_opt_file(int update)
 		if (ind < 0)
 			continue;
 		o = &dlm_options[ind];
-		if (!o)
+		if (!o->name)
 			continue;
 
 		scanned_dlm_opt[ind] = 1;
diff --git a/dlm_controld/lib.c b/dlm_controld/lib.c
index a21150f2..3ff0680e 100644
--- a/dlm_controld/lib.c
+++ b/dlm_controld/lib.c
@@ -269,10 +269,13 @@ static unsigned int kv(char *str, const char *k)
 	if (!p)
 		return 0;
 
-	p = strstr(p, "=") + 1;
+	p = strstr(p, "=");
 	if (!p)
 		return 0;
 
+	/* move pointer after '=' */
+	p++;
+
 	memset(valstr, 0, 64);
 
 	for (i = 0; i < 64; i++) {
@@ -299,10 +302,13 @@ static char *ks(char *str, const char *k)
 	if (!p)
 		return 0;
 
-	p = strstr(p, "=") + 1;
+	p = strstr(p, "=");
 	if (!p)
 		return 0;
 
+	/* move pointer after '=' */
+	p++;
+
 	memset(valstr, 0, 64);
 
 	for (i = 0; i < 64; i++) {
diff --git a/dlm_controld/member.c b/dlm_controld/member.c
index d567c114..f297b457 100644
--- a/dlm_controld/member.c
+++ b/dlm_controld/member.c
@@ -345,7 +345,7 @@ void kick_node_from_cluster(int nodeid)
 static void shutdown_callback(corosync_cfg_handle_t h,
 			      corosync_cfg_shutdown_flags_t flags)
 {
-	if (flags & COROSYNC_CFG_SHUTDOWN_FLAG_REQUEST) {
+	if (flags == COROSYNC_CFG_SHUTDOWN_FLAG_REQUEST) {
 		if (list_empty(&lockspaces)) {
 			log_debug("shutdown request yes");
 			corosync_cfg_replyto_shutdown(ch, COROSYNC_CFG_SHUTDOWN_FLAG_YES);
-- 
2.31.1

