Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 79FF821A777
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jul 2020 21:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594321504;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WrekSHBCa7iAmbvg5uxh+ET193Yf7Xg/Z7u9ZkKhakc=;
	b=CSIEPCv2TOmOlaDRFffZVq0v+DTnXkKXkHQT8pZEZv2bE/5EV5oB4Pon92MPEcpWR7Kbo5
	B1MRdQRoRG/yJ7Ge5akdD4jlE0Xz1X6lrZIC4LHpLvw3RtVugGhOFOkWiqrF/FqfIDOagl
	/Pc+BumRP0vlzwyQAIK4pgUcCYP3BRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-OKRAu7r5NhGaE7j2ZjCJNA-1; Thu, 09 Jul 2020 15:05:01 -0400
X-MC-Unique: OKRAu7r5NhGaE7j2ZjCJNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0796F106B242;
	Thu,  9 Jul 2020 19:04:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA9F260C80;
	Thu,  9 Jul 2020 19:04:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D919B1809554;
	Thu,  9 Jul 2020 19:04:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069J0Wat025623 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 15:00:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E0A37F8C6; Thu,  9 Jul 2020 19:00:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-75.rdu2.redhat.com [10.10.114.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 875265BACF;
	Thu,  9 Jul 2020 19:00:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  9 Jul 2020 15:00:01 -0400
Message-Id: <20200709190001.102450-4-aahringo@redhat.com>
In-Reply-To: <20200709190001.102450-1-aahringo@redhat.com>
References: <20200709190001.102450-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 3/3] dlm_controld: add default
	value handling for unsigned int
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds suppot to handle default values for unsigned int.
---
 dlm_controld/dlm_daemon.h |  1 +
 dlm_controld/main.c       | 61 +++++++++++++++++++++------------------
 2 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 979aab7a..ee21c256 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -134,6 +134,7 @@ struct dlm_option {
 
 	int default_int;
 	const char *default_str;
+	unsigned int default_uint;
 
 	int cli_set;
 	int cli_int;
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 95107d09..8023f4b0 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1678,6 +1678,8 @@ static void print_usage(void)
 			printf(" [%d]\n", o->default_int);
 		else if (o->req_arg == req_arg_bool)
 			printf(" [%d]\n", o->default_int);
+		else if (o->req_arg == req_arg_uint)
+			printf(" [%u]\n", o->default_uint);
 		else if (o->req_arg == no_arg && !o->default_int)
 			printf(" [0]\n");
 		else
@@ -1688,7 +1690,8 @@ static void print_usage(void)
 }
 
 static void set_opt_default(int ind, const char *name, char letter, int arg_type,
-			    int default_int, const char *default_str, const char *desc)
+			    int default_int, const char *default_str,
+			    unsigned int default_uint, const char *desc)
 {
 	dlm_options[ind].name = name;
 	dlm_options[ind].letter = letter;
@@ -1696,145 +1699,147 @@ static void set_opt_default(int ind, const char *name, char letter, int arg_type
 	dlm_options[ind].desc = desc;
 	dlm_options[ind].default_int = default_int;
 	dlm_options[ind].default_str = default_str;
+	dlm_options[ind].default_uint = default_uint;
 	dlm_options[ind].use_int = default_int;
 	dlm_options[ind].use_str = (char *)default_str;
+	dlm_options[ind].use_uint = default_uint;
 }
 
 static void set_opt_defaults(void)
 {
 	set_opt_default(daemon_debug_ind,
 			"daemon_debug", 'D', no_arg,
-			0, NULL,
+			0, NULL, 0,
 			"enable debugging to stderr and don't fork");
 
 	set_opt_default(foreground_ind,
 			"foreground", '\0', no_arg,
-			0, NULL,
+			0, NULL, 0,
 			"don't fork");
 
 	set_opt_default(log_debug_ind,
 			"log_debug", 'K', no_arg,
-			0, NULL,
+			0, NULL, 0,
 			"enable kernel dlm debugging messages");
 
 	set_opt_default(timewarn_ind,
 			"timewarn", '\0', req_arg_int,
-			0, NULL,
+			0, NULL, 0,
 			""); /* do not advertise */
 
 	set_opt_default(protocol_ind,
 			"protocol", 'r', req_arg_str,
-			-1, "detect",
+			-1, "detect", 0,
 			"dlm kernel lowcomms protocol: tcp, sctp, detect");
 
 	set_opt_default(bind_all_ind,
 			"bind_all", '\0', req_arg_int,
-			0, NULL,
+			0, NULL, 0,
 			""); /* do not advertise */
 
 	set_opt_default(mark_ind,
 			"mark", '\0', req_arg_uint,
-			0, NULL,
+			0, NULL, 0,
 			"set mark value for the DLM in-kernel listen socket");
 
 	set_opt_default(debug_logfile_ind,
 			"debug_logfile", 'L', no_arg,
-			0, NULL,
+			0, NULL, 0,
 			"write debugging to log file");
 
 	set_opt_default(enable_fscontrol_ind,
 			"enable_fscontrol", '\0', req_arg_bool,
-			0, NULL,
+			0, NULL, 0,
 			""); /* do not advertise */
 
 	set_opt_default(enable_plock_ind,
 			"enable_plock", 'p', req_arg_bool,
-			1, NULL,
+			1, NULL, 0,
 			"enable/disable posix lock support for cluster fs");
 
 	set_opt_default(enable_waitplock_recovery_ind,
 			"enable_waitplock_recovery", '\0', req_arg_bool,
-			0, NULL,
+			0, NULL, 0,
 			"enable/disable posix lock to wait for dlm recovery after lock acquire");
 
 	set_opt_default(plock_debug_ind,
 			"plock_debug", 'P', no_arg,
-			0, NULL,
+			0, NULL, 0,
 			"enable plock debugging");
 
 	set_opt_default(plock_rate_limit_ind,
 			"plock_rate_limit", 'l', req_arg_int,
-			0, NULL,
+			0, NULL, 0,
 			"limit rate of plock operations (0 for none)");
 
 	set_opt_default(plock_ownership_ind,
 			"plock_ownership", 'o', req_arg_bool,
-			0, NULL,
+			0, NULL, 0,
 			"enable/disable plock ownership");
 
 	set_opt_default(drop_resources_time_ind,
 			"drop_resources_time", 't', req_arg_int,
-			10000, NULL,
+			10000, NULL, 0,
 			"plock ownership drop resources time (milliseconds)");
 
 	set_opt_default(drop_resources_count_ind,
 			"drop_resources_count", 'c', req_arg_int,
-			10, NULL,
+			10, NULL, 0,
 			"plock ownership drop resources count");
 
 	set_opt_default(drop_resources_age_ind,
 			"drop_resources_age", 'a', req_arg_int,
-			10000, NULL,
+			10000, NULL, 0,
 			"plock ownership drop resources age (milliseconds)");
 
 	set_opt_default(post_join_delay_ind,
 			"post_join_delay", 'j', req_arg_int,
-			30, NULL,
+			30, NULL, 0,
 			"seconds to delay fencing after cluster join");
 
 	set_opt_default(enable_fencing_ind,
 			"enable_fencing", 'f', req_arg_bool,
-			1, NULL,
+			1, NULL, 0,
 			"enable/disable fencing");
 
 	set_opt_default(enable_concurrent_fencing_ind,
 			"enable_concurrent_fencing", '\0', req_arg_bool,
-			0, NULL,
+			0, NULL, 0,
 			"enable/disable concurrent fencing");
 
 	set_opt_default(enable_startup_fencing_ind,
 			"enable_startup_fencing", 's', req_arg_bool,
-			1, NULL,
+			1, NULL, 0,
 			"enable/disable startup fencing");
 
 	set_opt_default(repeat_failed_fencing_ind,
 			"repeat_failed_fencing", '\0', req_arg_bool,
-			1, NULL,
+			1, NULL, 0,
 			"enable/disable retrying after fencing fails");
 
 	set_opt_default(enable_quorum_fencing_ind,
 			"enable_quorum_fencing", 'q', req_arg_bool,
-			1, NULL,
+			1, NULL, 0,
 			"enable/disable quorum requirement for fencing");
 
 	set_opt_default(enable_quorum_lockspace_ind,
 			"enable_quorum_lockspace", '\0', req_arg_bool,
-			1, NULL,
+			1, NULL, 0,
 			"enable/disable quorum requirement for lockspace operations");
 
 	set_opt_default(enable_helper_ind,
 			"enable_helper", '\0', req_arg_bool,
-			1, NULL,
+			1, NULL, 0,
 			"enable/disable helper process for running commands");
 
 	set_opt_default(help_ind,
 			"help", 'h', no_arg,
-			-1, NULL,
+			-1, NULL, 0,
 			"print this help, then exit");
 
 	set_opt_default(version_ind,
 			"version", 'V', no_arg,
-			-1, NULL,
+			-1, NULL, 0,
 			"Print program version information, then exit");
 }
 
-- 
2.26.2

