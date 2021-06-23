Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 647BB3B1D6E
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461347;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gixGrn8swtwtnF5G6psQ4o1CW6HtC3d2DTNHSk7G8NE=;
	b=f7kQ6F4VU7v6cdvz+y/SCi72XgJ4Hb4Efx9+fToKtBA+DlDv27ZXK1lQ3UdTOa9Z1KZljY
	GJiGbIUEvjIw/2t1S4/oe+yskoFaLOJzeeWKMf3K3/Coy21OzpO+vcz+peLoJMsidV2v+A
	fOSVmKARXMJGIrFGvIF0sgM/Xza9ahk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-qsK27pVsPHiyd9Nt6kAeDw-1; Wed, 23 Jun 2021 11:15:40 -0400
X-MC-Unique: qsK27pVsPHiyd9Nt6kAeDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 846EE5074E;
	Wed, 23 Jun 2021 15:15:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6923619D7C;
	Wed, 23 Jun 2021 15:15:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 526B21801020;
	Wed, 23 Jun 2021 15:15:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFSbe024850 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA51060C05; Wed, 23 Jun 2021 15:15:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6557B60E3A;
	Wed, 23 Jun 2021 15:15:24 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:44 -0400
Message-Id: <20210623151454.176649-6-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
References: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 05/15] fs: dlm: auto load sctp module
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
index 783cfd5f63a5..fcc1094f7417 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1865,11 +1865,9 @@ static int dlm_listen_for_all(void)
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
@@ -1946,6 +1944,17 @@ static const struct dlm_proto_ops dlm_tcp_ops = {
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
@@ -1961,6 +1970,7 @@ static void dlm_sctp_sockopts(struct socket *sock)
 static const struct dlm_proto_ops dlm_sctp_ops = {
 	.name = "SCTP",
 	.proto = IPPROTO_SCTP,
+	.listen_validate = dlm_sctp_listen_validate,
 	.listen_sockopts = dlm_sctp_sockopts,
 	.listen_bind = dlm_sctp_bind_listen,
 	.connect_action = sctp_connect_to_sock,
-- 
2.26.3

