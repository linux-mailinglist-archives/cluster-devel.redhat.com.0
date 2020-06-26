Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3B17C20B61B
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Jun 2020 18:45:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593189930;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lK73393cwYC4Z/EDNVp12E7fISw3pd9msq8K51u2A4I=;
	b=P4L2NjqXuXRUmpsdvz3AN5hZ3C5nFREY233QpjJgJL1hfGAeo7siNemONjGr8DlE3ZCU4v
	6RZb3zdS2U3h5Lhj/SACm1fnT+M00sUXilzTlE6geychAsXS8dWmLH45PKzd6atZD2AHPO
	/YZsoaV9upc0uKGDVcR4OcoILd7nEoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-IUD37rtANW2mVH9XdXOL2Q-1; Fri, 26 Jun 2020 12:45:28 -0400
X-MC-Unique: IUD37rtANW2mVH9XdXOL2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65A712D0;
	Fri, 26 Jun 2020 16:45:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5535B1A837;
	Fri, 26 Jun 2020 16:45:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 141AD180954D;
	Fri, 26 Jun 2020 16:45:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QGjNMR014835 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 12:45:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 94BD961986; Fri, 26 Jun 2020 16:45:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-78.rdu2.redhat.com [10.10.115.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A92D60E1C;
	Fri, 26 Jun 2020 16:45:15 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 26 Jun 2020 12:44:44 -0400
Message-Id: <20200626164446.114220-3-aahringo@redhat.com>
In-Reply-To: <20200626164446.114220-1-aahringo@redhat.com>
References: <20200626164446.114220-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm-tool 2/4] dlm_controld: set listen skb
	mark setting
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds support to set the skb mark value for the in-kernel DLM
listen socket.
---
 dlm_controld/action.c     | 2 ++
 dlm_controld/dlm.conf.5   | 2 ++
 dlm_controld/dlm_daemon.h | 1 +
 dlm_controld/main.c       | 5 +++++
 4 files changed, 10 insertions(+)

diff --git a/dlm_controld/action.c b/dlm_controld/action.c
index ecd0d022..e901d555 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -851,6 +851,8 @@ int setup_configfs_options(void)
 	    dlm_options[timewarn_ind].file_set)
 		set_configfs_cluster("timewarn_cs", NULL, opt(timewarn_ind));
 
+	set_configfs_cluster("mark", NULL, optu(mark_ind));
+
 	proto_name = opts(protocol_ind);
 	proto_num = -1;
 
diff --git a/dlm_controld/dlm.conf.5 b/dlm_controld/dlm.conf.5
index 09492176..771951d4 100644
--- a/dlm_controld/dlm.conf.5
+++ b/dlm_controld/dlm.conf.5
@@ -40,6 +40,8 @@ protocol
 .br
 bind_all
 .br
+mark
+.br
 debug_logfile
 .br
 enable_plock
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 3dad0bf1..8816ca75 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -97,6 +97,7 @@ enum {
         protocol_ind,
         debug_logfile_ind,
 	bind_all_ind,
+        mark_ind,
         enable_fscontrol_ind,
         enable_plock_ind,
         plock_debug_ind,
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index b4f4ffb8..022a6c7c 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1732,6 +1732,11 @@ static void set_opt_defaults(void)
 			0, NULL,
 			""); /* do not advertise */
 
+	set_opt_default(mark_ind,
+			"mark", '\0', req_arg_uint,
+			0, NULL,
+			"set mark value for the DLM in-kernel listen socket");
+
 	set_opt_default(debug_logfile_ind,
 			"debug_logfile", 'L', no_arg,
 			0, NULL,
-- 
2.26.2

