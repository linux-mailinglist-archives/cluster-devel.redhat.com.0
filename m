Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DDBA83CBDB5
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Jul 2021 22:23:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626466992;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ogFOBMjGGO69sMYR2g33mvXrla/NsorPqMqUpw8WF8w=;
	b=RDBEShb+P4F7+pt9QKu30paKwdKKvEY82ymxiP//s/0pv4wFCQMM4wsUUEzpZXXXD3Tohm
	TSKN2wClPxraPymM4ZE9U0wlCuDt7RnfnPJZFXuk8TP2bbVbGUs4Jw5ieYQCjE0RWZ5xAp
	SU4TwYsudAvlGiLhxH3OmWzu/zcSh74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-pgCpan4ZMi6ROGMM6-BGSw-1; Fri, 16 Jul 2021 16:23:10 -0400
X-MC-Unique: pgCpan4ZMi6ROGMM6-BGSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4990100CCC7;
	Fri, 16 Jul 2021 20:23:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9233C5D9C6;
	Fri, 16 Jul 2021 20:23:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80BF01809C99;
	Fri, 16 Jul 2021 20:23:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16GKN6rd026094 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 16 Jul 2021 16:23:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0EF655D719; Fri, 16 Jul 2021 20:23:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C25E35D6AB;
	Fri, 16 Jul 2021 20:23:05 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Jul 2021 16:22:42 -0400
Message-Id: <20210716202245.1262791-10-aahringo@redhat.com>
In-Reply-To: <20210716202245.1262791-1-aahringo@redhat.com>
References: <20210716202245.1262791-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v5.14-rc1 09/12] fs: dlm: auto load sctp
	module
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds a "for now" better handling of missing SCTP support in
the kernel and try to load the sctp module if SCTP is set.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index a042ea413f74..f23682da7b56 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1864,11 +1864,9 @@ static int dlm_listen_for_all(void)
 	log_print("Using %s for communications",
 		  dlm_proto_ops->name);
 
-	if (dlm_proto_ops->listen_validate) {
-		result = dlm_proto_ops->listen_validate();
-		if (result < 0)
-			return result;
-	}
+	result = dlm_proto_ops->listen_validate();
+	if (result < 0)
+		return result;
 
 	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
 				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
@@ -1945,6 +1943,17 @@ static const struct dlm_proto_ops dlm_tcp_ops = {
 	.eof_condition = tcp_eof_condition,
 };
 
+static int dlm_sctp_listen_validate(void)
+{
+	if (!IS_ENABLED(CONFIG_IP_SCTP)) {
+		log_print("SCTP is not enabled by this kernel\n");
+		return -EOPNOTSUPP;
+	}
+
+	request_module("sctp");
+	return 0;
+}
+
 static int dlm_sctp_bind_listen(struct socket *sock)
 {
 	return sctp_bind_addrs(sock, dlm_config.ci_tcp_port);
@@ -1960,6 +1969,7 @@ static void dlm_sctp_sockopts(struct socket *sock)
 static const struct dlm_proto_ops dlm_sctp_ops = {
 	.name = "SCTP",
 	.proto = IPPROTO_SCTP,
+	.listen_validate = dlm_sctp_listen_validate,
 	.listen_sockopts = dlm_sctp_sockopts,
 	.listen_bind = dlm_sctp_bind_listen,
 	.connect_action = sctp_connect_to_sock,
-- 
2.27.0

