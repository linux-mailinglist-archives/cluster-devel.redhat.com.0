Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBDD25DBB8
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Sep 2020 16:30:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-miThapLZMhCfj7h-EFBqew-1; Fri, 04 Sep 2020 10:30:39 -0400
X-MC-Unique: miThapLZMhCfj7h-EFBqew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B99DD18BA297;
	Fri,  4 Sep 2020 14:30:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91EAD68433;
	Fri,  4 Sep 2020 14:30:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5595118561B2;
	Fri,  4 Sep 2020 14:30:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084EUVY1010850 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 10:30:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B64619D7D; Fri,  4 Sep 2020 14:30:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-30.rdu2.redhat.com [10.10.117.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00EAE19C59;
	Fri,  4 Sep 2020 14:30:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri,  4 Sep 2020 10:29:45 -0400
Message-Id: <20200904142946.8684-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 1/2] Revert "dlm_controld: add
	support for waitplock_recovery switch"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This reverts commit 0e9d0a6563f4acef5a27eade8eb29c7e6748c8d2.
---
 dlm_controld/action.c     | 5 -----
 dlm_controld/dlm.conf.5   | 2 --
 dlm_controld/dlm_daemon.h | 1 -
 dlm_controld/main.c       | 5 -----
 4 files changed, 13 deletions(-)

diff --git a/dlm_controld/action.c b/dlm_controld/action.c
index bc9c44f2..9e18d286 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -881,11 +881,6 @@ int setup_configfs_options(void)
 	    dlm_options[timewarn_ind].file_set)
 		set_configfs_cluster("timewarn_cs", NULL, opt(timewarn_ind));
 
-	if (dlm_options[enable_waitplock_recovery_ind].cli_set ||
-	    dlm_options[enable_waitplock_recovery_ind].file_set)
-		set_configfs_cluster("waitplock_recovery", NULL,
-				     opt(enable_waitplock_recovery_ind));
-
 	set_configfs_cluster("mark", NULL, optu(mark_ind));
 
 	proto_name = opts(protocol_ind);
diff --git a/dlm_controld/dlm.conf.5 b/dlm_controld/dlm.conf.5
index e92dfc8e..1ce0c644 100644
--- a/dlm_controld/dlm.conf.5
+++ b/dlm_controld/dlm.conf.5
@@ -46,8 +46,6 @@ debug_logfile
 .br
 enable_plock
 .br
-enable_waitplock_recovery
-.br
 plock_debug
 .br
 plock_rate_limit
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index ee21c256..0b4ae5f2 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -102,7 +102,6 @@ enum {
         mark_ind,
         enable_fscontrol_ind,
         enable_plock_ind,
-        enable_waitplock_recovery_ind,
         plock_debug_ind,
         plock_rate_limit_ind,
         plock_ownership_ind,
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 645bd26b..470a067c 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1768,11 +1768,6 @@ static void set_opt_defaults(void)
 			1, NULL, 0,
 			"enable/disable posix lock support for cluster fs");
 
-	set_opt_default(enable_waitplock_recovery_ind,
-			"enable_waitplock_recovery", '\0', req_arg_bool,
-			0, NULL, 0,
-			"enable/disable posix lock to wait for dlm recovery after lock acquire");
-
 	set_opt_default(plock_debug_ind,
 			"plock_debug", 'P', no_arg,
 			0, NULL, 0,
-- 
2.26.2

