Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4879E681A65
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 20:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675106753;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x0KddrhylWnp6w9bqi9o6eVWHuxERanQ4pFUWAiTM8A=;
	b=Mebq78grji/oZP8z4dGiUcJ10QD0CzV0Kx8AGzY1rd5T6RsV7wN2zL7xqPJLUJwsEnrtTc
	ZdD+CgjN9K1bNSUeAR7bZhEhZMTAu3LaBFrq37U3Q303VOtGs4y0ukV3MjmnSQxJsseThL
	OOdoJ5LnagF9wYg0Ay+lBKRz/nAZHXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-8O1Cg-g-PEu4gvbCQ6uoVQ-1; Mon, 30 Jan 2023 14:25:49 -0500
X-MC-Unique: 8O1Cg-g-PEu4gvbCQ6uoVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A377830F81;
	Mon, 30 Jan 2023 19:25:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21BAA1121315;
	Mon, 30 Jan 2023 19:25:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E331E19465A2;
	Mon, 30 Jan 2023 19:25:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 976781946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 19:24:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8A451422F2; Mon, 30 Jan 2023 19:24:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63AC1175AD;
 Mon, 30 Jan 2023 19:24:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 30 Jan 2023 14:24:32 -0500
Message-Id: <20230130192437.3330300-3-aahringo@redhat.com>
In-Reply-To: <20230130192437.3330300-1-aahringo@redhat.com>
References: <20230130192437.3330300-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH dlm-tool 3/8] dlm_controld: add plock logfile
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

The current plock logging is limited due a in-memory log buffer which
can be dumped via dlm_contol log_plock functionality. To trace plock
performance issues it's necessary to log plock activity in a bigger log
buffer such as a file. This patch will add functionality that plock
logging information will be appended into a log file.

WARNING: depending on plock activity the resulting log file can be
resulting in enormous file size. This option should be used for
debugging purpose only.
---
 dlm_controld/dlm_daemon.h |  4 ++++
 dlm_controld/logging.c    | 39 +++++++++++++++++++++++++++++++--------
 dlm_controld/main.c       |  5 +++++
 3 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index f0bad90f..c74f684a 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -76,10 +76,12 @@
 
 #define RUN_FILE_NAME            "dlm_controld.pid"
 #define LOG_FILE_NAME            "dlm_controld.log"
+#define PLOCK_LOG_FILE_NAME      "plock.log"
 #define CONF_FILE_NAME           "dlm.conf"
 
 #define RUN_FILE_PATH            RUNDIR "/" RUN_FILE_NAME
 #define LOG_FILE_PATH            LOGDIR "/" LOG_FILE_NAME
+#define PLOCK_LOG_FILE_PATH      LOGDIR "/" PLOCK_LOG_FILE_NAME
 #define CONF_FILE_PATH           CONFDIR "/" CONF_FILE_NAME
 
 #define DEFAULT_LOG_MODE         LOG_MODE_OUTPUT_FILE | LOG_MODE_OUTPUT_SYSLOG
@@ -87,6 +89,7 @@
 #define DEFAULT_SYSLOG_PRIORITY  LOG_INFO
 #define DEFAULT_LOGFILE_PRIORITY LOG_INFO
 #define DEFAULT_LOGFILE          LOG_FILE_PATH
+#define DEFAULT_PLOCK_LOGFILE	 PLOCK_LOG_FILE_PATH
 
 #define DEFAULT_NETLINK_RCVBUF	(2 * 1024 * 1024)
 
@@ -110,6 +113,7 @@ enum {
         enable_fscontrol_ind,
         enable_plock_ind,
         plock_debug_ind,
+        plock_debug_logfile_ind,
         plock_rate_limit_ind,
         plock_ownership_ind,
         drop_resources_time_ind,
diff --git a/dlm_controld/logging.c b/dlm_controld/logging.c
index 3298ef99..83de2da4 100644
--- a/dlm_controld/logging.c
+++ b/dlm_controld/logging.c
@@ -12,7 +12,9 @@ static int syslog_facility;
 static int syslog_priority;
 static int logfile_priority;
 static char logfile[PATH_MAX];
+static char plock_logfile[PATH_MAX];
 static FILE *logfile_fp;
+static FILE *plock_logfile_fp;
 
 /* logfile_priority is the only one of these options that
    can be controlled from command line, environment variable
@@ -35,6 +37,7 @@ void init_logging(void)
 	syslog_priority = DEFAULT_SYSLOG_PRIORITY;
 	logfile_priority = DEFAULT_LOGFILE_PRIORITY;
 	strcpy(logfile, DEFAULT_LOGFILE);
+	strcpy(plock_logfile, DEFAULT_PLOCK_LOGFILE);
 
 	set_logfile_priority();
 
@@ -66,6 +69,15 @@ void init_logging(void)
 		}
 	}
 
+	if (dlm_options[plock_debug_logfile_ind].use_int &&
+	    plock_logfile[0]) {
+		plock_logfile_fp = fopen(plock_logfile, "a+");
+		if (plock_logfile_fp != NULL) {
+			int fd = fileno(plock_logfile_fp);
+			fcntl(fd, F_SETFD, fcntl(fd, F_GETFD, 0) | FD_CLOEXEC);
+		}
+	}
+
 skip_logfile:
 	openlog(DAEMON_NAME, LOG_CONS | LOG_PID, syslog_facility);
 }
@@ -75,6 +87,8 @@ void close_logging(void)
 	closelog();
 	if (logfile_fp)
 		fclose(logfile_fp);
+	if (plock_logfile_fp)
+		fclose(plock_logfile_fp);
 }
 
 #define NAME_ID_SIZE 32
@@ -151,6 +165,16 @@ static void log_save_str(int len, char *log_buf, unsigned int *point,
 	*wrap = w;
 }
 
+static void log_str_to_file(FILE *fp)
+{
+	time_t logtime = time(NULL);
+	char tbuf[64];
+
+	strftime(tbuf, sizeof(tbuf), "%b %d %T", localtime(&logtime));
+	fprintf(fp, "%s %s", tbuf, log_str);
+	fflush(fp);
+}
+
 void log_level(char *name_in, uint32_t level_in, const char *fmt, ...)
 {
 	va_list ap;
@@ -191,19 +215,18 @@ void log_level(char *name_in, uint32_t level_in, const char *fmt, ...)
 
 	if (level < LOG_NONE)
 		log_save_str(pos - 1, log_dump, &log_point, &log_wrap);
-	if (plock)
+	if (plock) {
 		log_save_str(pos - 1, log_dump_plock, &log_point_plock, &log_wrap_plock);
 
+		if (plock_logfile_fp)
+			log_str_to_file(plock_logfile_fp);
+	}
+
 	if (level <= syslog_priority)
 		syslog(level, "%s", log_str);
 
-	if (level <= logfile_priority && logfile_fp) {
-		time_t logtime = time(NULL);
-		char tbuf[64];
-		strftime(tbuf, sizeof(tbuf), "%b %d %T", localtime(&logtime));
-		fprintf(logfile_fp, "%s %s", tbuf, log_str);
-		fflush(logfile_fp);
-	}
+	if (level <= logfile_priority && logfile_fp)
+		log_str_to_file(logfile_fp);
 
 	if (!dlm_options[daemon_debug_ind].use_int)
 		return;
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index c9d1c5f1..8e8d4038 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1854,6 +1854,11 @@ static void set_opt_defaults(void)
 			0, NULL, 0, 1,
 			"enable plock debugging");
 
+	set_opt_default(plock_debug_logfile_ind,
+			"plock_debug_logfile", 'O', req_arg_bool,
+			0, NULL, 0, 1,
+			"write plock debugging to log file. Note: resulting log file can take enormous space.");
+
 	set_opt_default(plock_rate_limit_ind,
 			"plock_rate_limit", 'l', req_arg_int,
 			0, NULL, 0, 1,
-- 
2.31.1

