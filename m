Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AB37E20B623
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Jun 2020 18:46:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593189999;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xVTlCyuXuIxc/j8NFpFxQztXxpcBoyrAET/a/Lgi3AI=;
	b=e0awhGlEw2FUgKd7uoCY+L5uI/TJtKIEOsYgn7o4dz6rmAct9weG1xk6hSR8p3T3tQ+t1Z
	eKy4OZw2RLtlvKyy1cIGiP/z5Hvth/9VuAGjnsqpuDPFm2XXMjfD4yrDGvJrKp2Cas/f46
	WLWWlNHlsSc5pinxloNcb8w/9oOd2CM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-H0Q3hjj5Ma-eNudDqWtPBg-1; Fri, 26 Jun 2020 12:46:37 -0400
X-MC-Unique: H0Q3hjj5Ma-eNudDqWtPBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED440EC1A2;
	Fri, 26 Jun 2020 16:46:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE56A5D9CC;
	Fri, 26 Jun 2020 16:46:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62B73180954D;
	Fri, 26 Jun 2020 16:46:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QGjgG6014867 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 12:45:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0860D1E8; Fri, 26 Jun 2020 16:45:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-78.rdu2.redhat.com [10.10.115.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23AA761985;
	Fri, 26 Jun 2020 16:45:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 26 Jun 2020 12:44:46 -0400
Message-Id: <20200626164446.114220-5-aahringo@redhat.com>
In-Reply-To: <20200626164446.114220-1-aahringo@redhat.com>
References: <20200626164446.114220-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm-tool 4/4] dlm_controld: add support
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
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
index 126e3b62..63040227 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -876,6 +876,11 @@ int setup_configfs_options(void)
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
index 9e7a5fbf..979aab7a 100644
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
index b330f88d..3ec318c2 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1752,6 +1752,11 @@ static void set_opt_defaults(void)
 			1, NULL,
 			"enable/disable posix lock support for cluster fs");
 
+	set_opt_default(enable_waitplock_recovery_ind,
+			"enable_waitplock_recovery", '\0', req_arg_bool,
+			1, NULL,
+			"enable/disable posix lock to wait for dlm recovery after lock acquire");
+
 	set_opt_default(plock_debug_ind,
 			"plock_debug", 'P', no_arg,
 			0, NULL,
-- 
2.26.2

