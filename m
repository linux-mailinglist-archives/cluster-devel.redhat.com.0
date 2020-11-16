Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EE1952B5239
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Nov 2020 21:15:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605557734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+wriHoULAbUDCq+siiMoua5BjeDvrrDlTCLHHQF0y6o=;
	b=M/ApzF/T2MCNOrYhQDUqMDBdMs+YloVQCc8tgiN8RvkRR+fMkBc3tXOeS/Odk3qZiOwLQR
	LqVhPiGY5BxMmjNEm7V92rjpSAB5FnQfPlsM4JO5cykmaqMnkL235AbaKT7FldTuZpnyF8
	hqNv6Lvkf8hg5TZMkZmQVNF+CcHlkG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-__-itQABOgCbhsG1aMbSnw-1; Mon, 16 Nov 2020 15:15:31 -0500
X-MC-Unique: __-itQABOgCbhsG1aMbSnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5ABC5F9CB;
	Mon, 16 Nov 2020 20:15:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15A081001901;
	Mon, 16 Nov 2020 20:15:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5927C183D020;
	Mon, 16 Nov 2020 20:15:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGKFNac023731 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 15:15:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 09DA6176BB; Mon, 16 Nov 2020 20:15:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-118-213.rdu2.redhat.com [10.10.118.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E8EA62923;
	Mon, 16 Nov 2020 20:15:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 16 Nov 2020 15:15:08 -0500
Message-Id: <20201116201508.223739-2-aahringo@redhat.com>
In-Reply-To: <20201116201508.223739-1-aahringo@redhat.com>
References: <20201116201508.223739-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 2/2] dlm_controld: add option for
	port number
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds an option to specify the port number for dlm. Although
the cluster attribute is named tcp_port, you can declare the port value
for any transport protocol. All nodes needs to have the same value,
otherwise dlm will get into a deadlock.
---
 dlm_controld/action.c     | 4 ++++
 dlm_controld/dlm_daemon.h | 1 +
 dlm_controld/main.c       | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/dlm_controld/action.c b/dlm_controld/action.c
index 9e18d286..0eff2799 100644
--- a/dlm_controld/action.c
+++ b/dlm_controld/action.c
@@ -881,6 +881,10 @@ int setup_configfs_options(void)
 	    dlm_options[timewarn_ind].file_set)
 		set_configfs_cluster("timewarn_cs", NULL, opt(timewarn_ind));
 
+	if (dlm_options[port_ind].cli_set ||
+	    dlm_options[port_ind].file_set)
+		set_configfs_cluster("tcp_port", NULL, optu(port_ind));
+
 	set_configfs_cluster("mark", NULL, optu(mark_ind));
 
 	proto_name = opts(protocol_ind);
diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index 95848201..45b295ea 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -99,6 +99,7 @@ enum {
         log_debug_ind,
         timewarn_ind,
         protocol_ind,
+        port_ind,
         debug_logfile_ind,
 	bind_all_ind,
         mark_ind,
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 41b03efb..c35756d4 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1778,6 +1778,11 @@ static void set_opt_defaults(void)
 			-1, "detect", 0,
 			"dlm kernel lowcomms protocol: tcp, sctp, detect");
 
+	set_opt_default(port_ind,
+			"port", 'R', req_arg_uint,
+			-1, NULL, 21064,
+			"dlm kernel lowcomms protocol port");
+
 	set_opt_default(bind_all_ind,
 			"bind_all", '\0', req_arg_int,
 			0, NULL, 0,
-- 
2.26.2

