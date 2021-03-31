Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B9F2735089D
	for <lists+cluster-devel@lfdr.de>; Wed, 31 Mar 2021 22:56:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617224168;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=evIEQ+RgIB3xOnMF7tGhmyzc3wZeRuX+rQpJ4y++R2A=;
	b=Lydu+k5ofH6xYlbOsuSOzQoG2yW8Mmo/ANyyorujrNFqMHaNhArlmQj5IeMMAMT0I3FnEi
	rBou3JQaPKNiuvBwBPF1cDTG72pqIjeF5wu5s+CPIFDh6UgEw2GpBZFtPa+p3f1NuY7SGv
	4V7Cm+5VPDGEnuX1nxl4Fa5iT90jVkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-uEIkNRSsNCS2LhXFm61Ldw-1; Wed, 31 Mar 2021 16:56:06 -0400
X-MC-Unique: uEIkNRSsNCS2LhXFm61Ldw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0FF18189CE;
	Wed, 31 Mar 2021 20:56:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DAAE5C1B4;
	Wed, 31 Mar 2021 20:56:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D84D4BB7C;
	Wed, 31 Mar 2021 20:56:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12VKtq0p019652 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 31 Mar 2021 16:55:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7C1C2B0A5; Wed, 31 Mar 2021 20:55:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-7.rdu2.redhat.com [10.10.117.7])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E044C60CCD;
	Wed, 31 Mar 2021 20:55:45 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 31 Mar 2021 16:55:26 -0400
Message-Id: <20210331205526.351253-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool] dlm_controld: create var parent
	directories
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch creates /var/log/dlm_controld and /var/run/dlm_controld
and it's parents if not exists before. In case of logging there was a
likely issue no log file is created when /var/log/dlm_controld didn't
exists before starting dlm_controld.

Reported-by: Bob Peterson <rpeterso@redhat.com>
---
 dlm_controld/dlm_daemon.h |  8 ++++++--
 dlm_controld/logging.c    | 24 ++++++++++++++++++++++++
 dlm_controld/main.c       | 20 ++++++++++++++++----
 3 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 45b295ea..436fc910 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -65,8 +65,12 @@
 
 /* TODO: get CONFDIR, LOGDIR, RUNDIR from build */
 
-#define RUNDIR                   "/var/run/dlm_controld"
-#define LOGDIR                   "/var/log/dlm_controld"
+#define SYS_VARDIR              "/var"
+#define SYS_RUNDIR              SYS_VARDIR "/run"
+#define SYS_LOGDIR              SYS_VARDIR "/log"
+
+#define RUNDIR                  SYS_RUNDIR "/dlm_controld"
+#define LOGDIR                  SYS_LOGDIR "/dlm_controld"
 #define CONFDIR                  "/etc/dlm"
 
 #define RUN_FILE_NAME            "dlm_controld.pid"
diff --git a/dlm_controld/logging.c b/dlm_controld/logging.c
index 4aa3406c..d48b8aeb 100644
--- a/dlm_controld/logging.c
+++ b/dlm_controld/logging.c
@@ -16,6 +16,9 @@ static FILE *logfile_fp;
 
 void init_logging(void)
 {
+	mode_t old_umask;
+	int rv;
+
 	syslog_facility = DEFAULT_SYSLOG_FACILITY;
 	syslog_priority = DEFAULT_SYSLOG_PRIORITY;
 	logfile_priority = DEFAULT_LOGFILE_PRIORITY;
@@ -28,6 +31,26 @@ void init_logging(void)
 		logfile_priority = LOG_DEBUG;
 
 	if (logfile[0]) {
+		old_umask = umask(0077);
+		rv = mkdir(SYS_VARDIR, 0700);
+		if (rv < 0 && errno != EEXIST) {
+			umask(old_umask);
+			goto skip_logfile;
+		}
+
+		rv = mkdir(SYS_LOGDIR, 0700);
+		if (rv < 0 && errno != EEXIST) {
+			umask(old_umask);
+			goto skip_logfile;
+		}
+
+		rv = mkdir(LOGDIR, 0700);
+		if (rv < 0 && errno != EEXIST) {
+			umask(old_umask);
+			goto skip_logfile;
+		}
+		umask(old_umask);
+
 		logfile_fp = fopen(logfile, "a+");
 		if (logfile_fp != NULL) {
 			int fd = fileno(logfile_fp);
@@ -35,6 +58,7 @@ void init_logging(void)
 		}
 	}
 
+skip_logfile:
 	openlog(DAEMON_NAME, LOG_CONS | LOG_PID, syslog_facility);
 }
 
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index c35756d4..504cafa1 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1598,7 +1598,7 @@ static int loop(void)
 	return rv;
 }
 
-static int lockfile(const char *dir, const char *name)
+static int lockfile(const char *name)
 {
 	char path[PATH_MAX];
 	char buf[16];
@@ -1607,14 +1607,26 @@ static int lockfile(const char *dir, const char *name)
 	int fd, rv;
 
 	old_umask = umask(0022);
-	rv = mkdir(dir, 0775);
+	rv = mkdir(SYS_VARDIR, 0775);
+	if (rv < 0 && errno != EEXIST) {
+		umask(old_umask);
+		return rv;
+	}
+
+	rv = mkdir(SYS_RUNDIR, 0775);
+	if (rv < 0 && errno != EEXIST) {
+		umask(old_umask);
+		return rv;
+	}
+
+	rv = mkdir(RUNDIR, 0775);
 	if (rv < 0 && errno != EEXIST) {
 		umask(old_umask);
 		return rv;
 	}
 	umask(old_umask);
 
-	snprintf(path, PATH_MAX, "%s/%s", dir, name);
+	snprintf(path, PATH_MAX, "%s/%s", RUNDIR, name);
 
 	fd = open(path, O_CREAT|O_WRONLY|O_CLOEXEC, 0644);
 	if (fd < 0) {
@@ -2125,7 +2137,7 @@ int main(int argc, char **argv)
 
 	init_logging();
 
-	fd = lockfile(RUNDIR, RUN_FILE_NAME);
+	fd = lockfile(RUN_FILE_NAME);
 	if (fd < 0)
 		return 1;
 
-- 
2.26.3

