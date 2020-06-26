Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B356420B619
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Jun 2020 18:45:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593189927;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uSgP05t5MBDCbTk4ZmwNRNDrQBiMVDPpUYJlpVP1LzI=;
	b=aICniN2cSjRoyJrGp+jEvusv47WVaKFFJE0z6oLh6huRayeMVifXn1n5ThhMLH8+/xtMCU
	UfGUhZbxaFUT7NF8EKw1PaUZPqiv0CNpJmT7z6hqkBw2K8/74+GZ8zsctOLHrWHsXzC247
	3XP+DMleDJeYUNuhzmMVc8IvS9iIsZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-nu23oAO6MZmY8A2mKWCmVA-1; Fri, 26 Jun 2020 12:45:25 -0400
X-MC-Unique: nu23oAO6MZmY8A2mKWCmVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C75918A8227;
	Fri, 26 Jun 2020 16:45:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F15F8247E;
	Fri, 26 Jun 2020 16:45:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3703875B7;
	Fri, 26 Jun 2020 16:45:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QGjFe6014819 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 12:45:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 352DD60BF4; Fri, 26 Jun 2020 16:45:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-78.rdu2.redhat.com [10.10.115.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F66860C80;
	Fri, 26 Jun 2020 16:45:14 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 26 Jun 2020 12:44:43 -0400
Message-Id: <20200626164446.114220-2-aahringo@redhat.com>
In-Reply-To: <20200626164446.114220-1-aahringo@redhat.com>
References: <20200626164446.114220-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm-tool 1/4] dlm_controld: add support
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
 dlm_controld/config.c     | 25 +++++++++++++++++++++++++
 dlm_controld/dlm_daemon.h |  5 +++++
 dlm_controld/main.c       |  3 +++
 3 files changed, 33 insertions(+)

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
index 5b9a52da..3dad0bf1 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -86,6 +86,7 @@ enum {
         req_arg_bool = 1,
         req_arg_int = 2,
         req_arg_str = 3,
+        req_arg_uint = 4,
 };
 
 enum {
@@ -125,6 +126,7 @@ struct dlm_option {
 
 	int use_int;
 	char *use_str;
+	unsigned int use_uint;
 
 	int default_int;
 	const char *default_str;
@@ -132,15 +134,18 @@ struct dlm_option {
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
index 8be6a4bc..b4f4ffb8 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1972,6 +1972,9 @@ static void set_opt_cli(int argc, char **argv)
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

