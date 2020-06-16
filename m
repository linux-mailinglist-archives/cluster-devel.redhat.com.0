Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0C27D1FBC68
	for <lists+cluster-devel@lfdr.de>; Tue, 16 Jun 2020 19:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592327270;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6y1AXQ0kBokepDWskolA/BD5B8xS8d3oah0huJfYRJE=;
	b=D8QV9lGU6L/4UFU/s56ZD9i+cLUkUorSnb/g3uKMAwF2iEa2dR/dKNvdy4B5ZjiaMclesZ
	kguNKQ53HZMjz+kH1NExdAZ9O7pMiCNviFwYD6v3XlbT3hfYjdI7XlLpeTPj6P9pbkRrAV
	YbWN/64Xv5gNZxju3eMoon2SWEJuBSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-ckgK6ITzP6Gfb8iZaOI-5Q-1; Tue, 16 Jun 2020 13:07:48 -0400
X-MC-Unique: ckgK6ITzP6Gfb8iZaOI-5Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A95580F5E4;
	Tue, 16 Jun 2020 17:07:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC9FC5D9D3;
	Tue, 16 Jun 2020 17:07:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D6EF1809543;
	Tue, 16 Jun 2020 17:07:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GH7dtx010576 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 13:07:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC0415D9E2; Tue, 16 Jun 2020 17:07:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-78.rdu2.redhat.com [10.10.114.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F14F15D9D3;
	Tue, 16 Jun 2020 17:07:38 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: ccaulfie@redhat.com
Date: Tue, 16 Jun 2020 13:07:11 -0400
Message-Id: <20200616170713.32210-2-aahringo@redhat.com>
In-Reply-To: <20200616170713.32210-1-aahringo@redhat.com>
References: <20200616170713.32210-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm 1/3] dlm_controld: add support for
	unsigned int values
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

This patch adds support for setting a unsigned integer value.
---
 dlm_controld/dlm_daemon.h | 4 ++++
 dlm_controld/main.c       | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 5b9a52da..9fe56df2 100644
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
@@ -132,6 +134,7 @@ struct dlm_option {
 	int cli_set;
 	int cli_int;
 	char *cli_str;
+	unsigned int cli_uint;
 
 	int file_set;
 	int file_int;
@@ -141,6 +144,7 @@ struct dlm_option {
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

