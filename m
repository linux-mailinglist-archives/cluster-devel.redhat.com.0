Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 318D1718844
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 19:14:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685553281;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Eflkb+bIz1+PTSsa51SiAtcKnaQ0Q+0LpcKxgeUWakA=;
	b=enAkZi3qvX7FESZZYNWMxSbbLAk49zjz27QfvKV8z2JbdiH5h+QBboUqYYF8Oz9IxasYzd
	501vtogEDxbGycSykxRCejujLZ6zQvYUIAN9eP6y7tTS5WbxqaF5qRl+VsxCAMVSxX+/iw
	MnAcTr5lbyM82v0b5CgDQHTBt1jpNXw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-ixrNfFANOhOdOi7huh-PQA-1; Wed, 31 May 2023 13:14:35 -0400
X-MC-Unique: ixrNfFANOhOdOi7huh-PQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5908E380350A;
	Wed, 31 May 2023 17:14:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BE6F40C6EC4;
	Wed, 31 May 2023 17:14:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E81B919465A8;
	Wed, 31 May 2023 17:14:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 485271946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 17:12:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 29C6640CFD47; Wed, 31 May 2023 17:12:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F35540CFD45;
 Wed, 31 May 2023 17:12:45 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 31 May 2023 13:12:43 -0400
Message-Id: <20230531171243.3089821-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm-tool] Revert "dlm_controld: bind to all
 interfaces for failover"
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This reverts commit 7a273b8714da400d292d6c9762acedcde1997e52.

The "bind_all" per comms configfs never came upstream.
---
 dlm_controld/action.c     | 19 -------------------
 dlm_controld/dlm.conf.5   |  2 --
 dlm_controld/dlm_daemon.h |  1 -
 dlm_controld/main.c       |  5 -----
 4 files changed, 27 deletions(-)

diff --git a/dlm_controld/action.c b/dlm_controld/action.c
index 67aa6896..60eb22a7 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -692,25 +692,6 @@ skip_non_required:
 		return -1;
 	}
 	close(fd);
-
-	if (opt(bind_all_ind)) {
-		memset(path, 0, PATH_MAX);
-		snprintf(path, PATH_MAX, "%s/%d/bind_all", COMMS_DIR, nodeid);
-
-		fd = open(path, O_WRONLY);
-		if (fd < 0) {
-			log_error("%s: open failed: %d", path, errno);
-			return -1;
-		}
-
-		rv = do_write(fd, (void *)"1", strlen("1"));
-		if (rv < 0) {
-			log_error("%s: write failed: %d", path, errno);
-			close(fd);
-			return -1;
-		}
-		close(fd);
-	}
  out:
 	return 0;
 }
diff --git a/dlm_controld/dlm.conf.5 b/dlm_controld/dlm.conf.5
index 164b5b70..cb13eaf0 100644
--- a/dlm_controld/dlm.conf.5
+++ b/dlm_controld/dlm.conf.5
@@ -40,8 +40,6 @@ log_debug(*)
 .br
 protocol
 .br
-bind_all
-.br
 mark
 .br
 debug_logfile(*)
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 86b37603..4a533e34 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -105,7 +105,6 @@ enum {
         protocol_ind,
         port_ind,
         debug_logfile_ind,
-	bind_all_ind,
         mark_ind,
         enable_fscontrol_ind,
         enable_plock_ind,
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 14be5edd..24f0b3f8 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1823,11 +1823,6 @@ static void set_opt_defaults(void)
 			-1, NULL, 21064, 0,
 			"dlm kernel lowcomms protocol port");
 
-	set_opt_default(bind_all_ind,
-			"bind_all", '\0', req_arg_int,
-			0, NULL, 0, 0,
-			""); /* do not advertise */
-
 	set_opt_default(mark_ind,
 			"mark", '\0', req_arg_uint,
 			0, NULL, 0, 0,
-- 
2.31.1

