Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC2A21A5B3
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jul 2020 19:22:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594315331;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2CdAKUg1GoH1w6gzGrTclVusgpEALiMDnIAzKowYFzM=;
	b=B7iZ/qj7wsaW6cCj+CXQRj/yRQ6klYM6Dvyqlx6WTK6Baw3laAdy8PiAlGANawN+oRJAEq
	VW7Cl8pvoDPGTG5g4+QEdY9iGNEbTVTWV7I3Dmf0+/H4K3SGv/6Y606S6uSdPB9jTrUK1R
	FTmrz9rd5kiARAcO/39xqGdeT1nhoZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-0EqjDFMKP5OJPcfrxzDYJg-1; Thu, 09 Jul 2020 13:22:09 -0400
X-MC-Unique: 0EqjDFMKP5OJPcfrxzDYJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9573A18FF662;
	Thu,  9 Jul 2020 17:22:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F036A7F8BF;
	Thu,  9 Jul 2020 17:22:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A44984353;
	Thu,  9 Jul 2020 17:22:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069HM0Wg016175 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 13:22:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68C2E610AF; Thu,  9 Jul 2020 17:22:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-75.rdu2.redhat.com [10.10.114.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB5A160C80;
	Thu,  9 Jul 2020 17:21:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  9 Jul 2020 13:21:47 -0400
Message-Id: <20200709172150.53643-2-aahringo@redhat.com>
In-Reply-To: <20200709172150.53643-1-aahringo@redhat.com>
References: <20200709172150.53643-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm-tool 1/4] dlm_controld: add support
	for unsigned int values
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds support for setting a unsigned integer value.
---
 dlm_controld/config.c     | 25 ++++++++++++++++
 dlm_controld/dlm_daemon.h |  6 ++++
 dlm_controld/main.c       | 60 ++++++++++++++++++++++-----------------
 3 files changed, 65 insertions(+), 26 deletions(-)

diff --git a/dlm_controld/config.c b/dlm_controld/config.c
index 3ba8a53b..ec269168 100644
--- a/dlm_controld/config.c
+++ b/dlm_controld/config.c
@@ -156,6 +156,19 @@ static void get_val_int(char *line, int *val_out)
 	*val_out = atoi(val);
 }
 
+static void get_val_uint(char *line, unsigned int *val_out)
+{
+	char key[MAX_LINE];
+	char val[MAX_LINE];
+	int rv;
+
+	rv = sscanf(line, "%[^=]=%s", key, val);
+	if (rv != 2)
+		return;
+
+	*val_out = strtoul(val, NULL, 0);
+}
+
 static void get_val_str(char *line, char *val_out)
 {
 	char key[MAX_LINE];
@@ -171,6 +184,7 @@ static void get_val_str(char *line, char *val_out)
 
 void set_opt_file(int update)
 {
+	unsigned int uval = 0;
 	struct dlm_option *o;
 	FILE *file;
 	char line[MAX_LINE];
@@ -238,6 +252,17 @@ void set_opt_file(int update)
 			log_debug("config file %s = %d cli_set %d use %d",
 				  o->name, o->file_int, o->cli_set, o->use_int);
 
+		} else if (o->req_arg == req_arg_uint) {
+			get_val_uint(line, &uval);
+
+			o->file_uint = uval;
+
+			if (!o->cli_set)
+				o->use_uint = o->file_uint;
+
+			log_debug("config file %s = %u cli_set %d use %u",
+				  o->name, o->file_uint, o->cli_set, o->use_uint);
+
 		} else if (o->req_arg == req_arg_bool) {
 			get_val_int(line, &val);
 
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 5b9a52da..47557a7c 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -86,6 +86,7 @@ enum {
         req_arg_bool = 1,
         req_arg_int = 2,
         req_arg_str = 3,
+        req_arg_uint = 4,
 };
 
 enum {
@@ -125,22 +126,27 @@ struct dlm_option {
 
 	int use_int;
 	char *use_str;
+	unsigned int use_uint;
 
 	int default_int;
 	const char *default_str;
+	unsigned int default_uint;
 
 	int cli_set;
 	int cli_int;
 	char *cli_str;
+	unsigned int cli_uint;
 
 	int file_set;
 	int file_int;
 	char *file_str;
+	unsigned int file_uint;
 };
 
 EXTERN struct dlm_option dlm_options[dlm_options_max];
 #define opt(x) dlm_options[x].use_int
 #define opts(x) dlm_options[x].use_str
+#define optu(x) dlm_options[x].use_uint
 
 
 /* DLM_LOCKSPACE_LEN: maximum lockspace name length, from linux/dlmconstants.h.
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 8be6a4bc..6129b8a6 100644
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
@@ -1696,135 +1699,137 @@ static void set_opt_default(int ind, const char *name, char letter, int arg_type
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
 
@@ -1972,6 +1977,9 @@ static void set_opt_cli(int argc, char **argv)
 		} else if (o->req_arg == req_arg_bool) {
 			o->cli_int = atoi(arg_str) ? 1 : 0;
 			o->use_int = o->cli_int;
+		} else if (o->req_arg == req_arg_uint) {
+			o->cli_uint = strtoul(arg_str, NULL, 0);
+			o->use_uint = o->cli_uint;
 		}
 	}
 
-- 
2.26.2

