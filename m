Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0D621A5B4
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jul 2020 19:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594315337;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dLL5E8AMwELRXr6FGuP5UBU5eK/+FjrIy61A/GSOhZU=;
	b=S/DKIqnaEimADJJc/A3ta18EIDwgyot+WsKRft/xRpG0KdVgdQskKSAnEYptZnFJvM7rp7
	y4+XtR2vQi3ZsstQB5Eo3YLy0gUwWlY7NelLjMgK0U/oL7FTvpxKZWgbz0SL6R/mRRB6a9
	vLrvxyMvRi6OjR5NLzL6Gktiqve+pSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-bmsFTrS0P-WVB0atFGAh_w-1; Thu, 09 Jul 2020 13:22:15 -0400
X-MC-Unique: bmsFTrS0P-WVB0atFGAh_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB9FA18FF661;
	Thu,  9 Jul 2020 17:22:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD9225D9C9;
	Thu,  9 Jul 2020 17:22:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 743051809554;
	Thu,  9 Jul 2020 17:22:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069HMAlx016246 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 13:22:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A50C760C80; Thu,  9 Jul 2020 17:22:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-75.rdu2.redhat.com [10.10.114.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C110860F8D;
	Thu,  9 Jul 2020 17:22:02 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  9 Jul 2020 13:21:50 -0400
Message-Id: <20200709172150.53643-5-aahringo@redhat.com>
In-Reply-To: <20200709172150.53643-1-aahringo@redhat.com>
References: <20200709172150.53643-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm-tool 4/4] dlm_controld: add support
	for waitplock_recovery switch
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds support to set the cluster attribute waitplock_recovery
via enable_waitplock_recover arg or config file attribute.
---
 dlm_controld/action.c     | 5 +++++
 dlm_controld/dlm.conf.5   | 2 ++
 dlm_controld/dlm_daemon.h | 1 +
 dlm_controld/main.c       | 5 +++++
 4 files changed, 13 insertions(+)

diff --git a/dlm_controld/action.c b/dlm_controld/action.c
index 9e18d286..bc9c44f2 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -881,6 +881,11 @@ int setup_configfs_options(void)
 	    dlm_options[timewarn_ind].file_set)
 		set_configfs_cluster("timewarn_cs", NULL, opt(timewarn_ind));
 
+	if (dlm_options[enable_waitplock_recovery_ind].cli_set ||
+	    dlm_options[enable_waitplock_recovery_ind].file_set)
+		set_configfs_cluster("waitplock_recovery", NULL,
+				     opt(enable_waitplock_recovery_ind));
+
 	set_configfs_cluster("mark", NULL, optu(mark_ind));
 
 	proto_name = opts(protocol_ind);
diff --git a/dlm_controld/dlm.conf.5 b/dlm_controld/dlm.conf.5
index 1ce0c644..e92dfc8e 100644
--- a/dlm_controld/dlm.conf.5
+++ b/dlm_controld/dlm.conf.5
@@ -46,6 +46,8 @@ debug_logfile
 .br
 enable_plock
 .br
+enable_waitplock_recovery
+.br
 plock_debug
 .br
 plock_rate_limit
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 0b4ae5f2..ee21c256 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -102,6 +102,7 @@ enum {
         mark_ind,
         enable_fscontrol_ind,
         enable_plock_ind,
+        enable_waitplock_recovery_ind,
         plock_debug_ind,
         plock_rate_limit_ind,
         plock_ownership_ind,
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 8a5a2ad1..8023f4b0 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1757,6 +1757,11 @@ static void set_opt_defaults(void)
 			1, NULL, 0,
 			"enable/disable posix lock support for cluster fs");
 
+	set_opt_default(enable_waitplock_recovery_ind,
+			"enable_waitplock_recovery", '\0', req_arg_bool,
+			0, NULL, 0,
+			"enable/disable posix lock to wait for dlm recovery after lock acquire");
+
 	set_opt_default(plock_debug_ind,
 			"plock_debug", 'P', no_arg,
 			0, NULL, 0,
-- 
2.26.2

