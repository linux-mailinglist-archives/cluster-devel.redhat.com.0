Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 289471FBC6A
	for <lists+cluster-devel@lfdr.de>; Tue, 16 Jun 2020 19:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592327273;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Fe7txS1D9eiYhYO7xNXcUG/pRFpslGV17kPSgABk5bU=;
	b=Jb1CX1wATTunkFcTE9S55Tz+/LeYuEA06Oa98krAYtISg9jCxL6VxsOwYPXMSMHiUEIfnq
	vNsTQ8ie1IHFgL7Z5TtM6QsRW8V3yYFrlv3iErAOl5q0UntN7Kgjnyk+GHUiwxebklXuma
	pYlddB/5aDOFe3tP0KYl6KILg4df52w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-jUap2Fd2N0m0tD0as-YNxA-1; Tue, 16 Jun 2020 13:07:48 -0400
X-MC-Unique: jUap2Fd2N0m0tD0as-YNxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ACE910059B2;
	Tue, 16 Jun 2020 17:07:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CDD1768DC;
	Tue, 16 Jun 2020 17:07:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C58D833C9;
	Tue, 16 Jun 2020 17:07:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GH7eln010583 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 13:07:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C9EB5D9D3; Tue, 16 Jun 2020 17:07:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-78.rdu2.redhat.com [10.10.114.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E31CE5D9D7;
	Tue, 16 Jun 2020 17:07:39 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: ccaulfie@redhat.com
Date: Tue, 16 Jun 2020 13:07:12 -0400
Message-Id: <20200616170713.32210-3-aahringo@redhat.com>
In-Reply-To: <20200616170713.32210-1-aahringo@redhat.com>
References: <20200616170713.32210-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm 2/3] dlm_controld: set listen skb mark
	setting
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
index ecd0d022..46747def 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -869,6 +869,8 @@ int setup_configfs_options(void)
 	if (proto_num == PROTO_SCTP)
 		set_proc_rmem();
 
+	set_configfs_cluster("mark", NULL, optu(mark_ind));
+
 	/* 
 	 * set clustername, recover_callbacks
 	 *
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
index 9fe56df2..86b33096 100644
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

