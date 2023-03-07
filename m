Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B506AE826
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Mar 2023 18:13:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678209201;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mCeE2C79m8sZQDWLtRPn43RkcDwvMCDgzxkUiJvLJAA=;
	b=YEkDr4R6os9ogDAam3TIBjse8nQxUXuzoL64uQ5Pyxq/YMfqcEZKZt3AT35P/RRmiK49Rg
	StDcrkb3jK626XKFwogv5sfaqBRvTJXCIYnfEpIw/NgASYKP9CAzrTmPBOwJoMzqPosNnY
	kQY7o2qWkX5hCuGKZOS4ESz8xAdXB0g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247--b2HxfEaOqigXl-tkq025A-1; Tue, 07 Mar 2023 12:13:16 -0500
X-MC-Unique: -b2HxfEaOqigXl-tkq025A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7359C87B2AD;
	Tue,  7 Mar 2023 17:13:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20AA635454;
	Tue,  7 Mar 2023 17:13:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E839A19465B5;
	Tue,  7 Mar 2023 17:13:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B0BF21946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A3DCD14171B6; Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F3C6140EBF4;
 Tue,  7 Mar 2023 17:13:11 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  7 Mar 2023 12:13:06 -0500
Message-Id: <20230307171307.2785162-9-aahringo@redhat.com>
In-Reply-To: <20230307171307.2785162-1-aahringo@redhat.com>
References: <20230307171307.2785162-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCHv2 dlm-tool 8/9] dlm_controld: be sure we
 stop lockspaces before shutdown
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

The dlm_controld shutdown process will drop all dlm configfs entries of
dlm communication settings regarding corosync address configuration.
This will end in an socket close in the dlm subsystem of the connection
which belongs to it. Newly introduced kernel warnings will check if the
lockspace is stopped before we close the socket connection. This is
necessary because no new dlm messages should be triggered afterwards. To
be sure dlm_controld does stop the lockspaces we will make sure that it
does it always in close_cpg_daemon. Currently there is a missing handle
to stop all lockspaces when there is no cpg_handle_daemon anymore.
---
 dlm_controld/daemon_cpg.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/dlm_controld/daemon_cpg.c b/dlm_controld/daemon_cpg.c
index 2e0634d4..10c80ddc 100644
--- a/dlm_controld/daemon_cpg.c
+++ b/dlm_controld/daemon_cpg.c
@@ -2527,6 +2527,15 @@ int setup_cpg_daemon(void)
 	return -1;
 }
 
+static void stop_lockspaces(void)
+{
+	struct lockspace *ls;
+
+	list_for_each_entry(ls, &lockspaces, list) {
+		cpg_stop_kernel(ls);
+	}
+}
+
 void close_cpg_daemon(void)
 {
 	struct lockspace *ls;
@@ -2534,8 +2543,11 @@ void close_cpg_daemon(void)
 	struct cpg_name name;
 	int i = 0;
 
-	if (!cpg_handle_daemon)
+	if (!cpg_handle_daemon) {
+		stop_lockspaces();
 		return;
+	}
+
 	if (cluster_down)
 		goto fin;
 
-- 
2.31.1

