Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A46A87A7
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Mar 2023 18:15:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677777318;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mCeE2C79m8sZQDWLtRPn43RkcDwvMCDgzxkUiJvLJAA=;
	b=BaDiISFHcxSs/HlfPv4tTAQPHWBD+IXSzi46w/eEQ5t2UGMnamJPgKtXpjGuRkMvHczDTP
	ePCSQqWtJcQlxWj4AxQzohvUg8EoA15Nw7jgB1xiiyIPN4hcaSHk9KZ+H5/a5odwiKYHh+
	EiOn/YjIw6UnypwTYlzPqEnfJxQcfsQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-wpW8Er0nM3Se1aJ8pE3Bpw-1; Thu, 02 Mar 2023 12:15:15 -0500
X-MC-Unique: wpW8Er0nM3Se1aJ8pE3Bpw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45A3A3C0E21C;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 393FC2026D4B;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 845301943BE5;
	Thu,  2 Mar 2023 17:15:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F03B1948646 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 17:15:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 63A94492B02; Thu,  2 Mar 2023 17:14:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40194492B00;
 Thu,  2 Mar 2023 17:14:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Mar 2023 12:14:37 -0500
Message-Id: <20230302171441.1509914-10-aahringo@redhat.com>
In-Reply-To: <20230302171441.1509914-1-aahringo@redhat.com>
References: <20230302171441.1509914-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm-tool 10/14] dlm_controld: be sure we
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

