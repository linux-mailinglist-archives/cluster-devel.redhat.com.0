Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 069292A382C
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Nov 2020 02:04:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604365499;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BoWOsm8aEEDA6GJjduZNzM0YMnZwmTcJclmzb5WorcA=;
	b=ZwrSAieGOPWKRVc00xF05cqqsVndVMEAidw+R3q1XGxyQjjpijgJb1W/EXgX2dRT9zjgu+
	o8sLdQ50lAWcZFoI2lmAbBCD7zqlAtoLRGwJ6TJyd5h/08cRiwsWsI9jjiSXlG7R/NdO3B
	o+0zXP+r+DLn7Sf3XatLDKmtKZbNIIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-vPmqF7gDNeKrBECMKB0EJA-1; Mon, 02 Nov 2020 20:04:56 -0500
X-MC-Unique: vPmqF7gDNeKrBECMKB0EJA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A59F5809DE6;
	Tue,  3 Nov 2020 01:04:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94FAC5C5DE;
	Tue,  3 Nov 2020 01:04:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81C0F181A06D;
	Tue,  3 Nov 2020 01:04:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A314pxS003587 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 20:04:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 09D305C5DE; Tue,  3 Nov 2020 01:04:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-45.rdu2.redhat.com [10.10.115.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9486E5C706;
	Tue,  3 Nov 2020 01:04:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 Nov 2020 20:04:26 -0500
Message-Id: <20201103010428.1009384-12-aahringo@redhat.com>
In-Reply-To: <20201103010428.1009384-1-aahringo@redhat.com>
References: <20201103010428.1009384-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 RESEND v5.10-rc2 11/13] fs: dlm: fix check
	for multi-homed hosts
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will use the runtime array size dlm_local_count variable
to check the actual size of the dlm_local_addr array. There exists
currently a cleanup bug, because the tcp_listen_for_all() functionality
might check on a dangled pointer.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b042ef56eba6..f7e86791a082 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1288,7 +1288,7 @@ static int sctp_listen_for_all(struct listen_connection *con)
 static int tcp_listen_for_all(void)
 {
 	/* We don't support multi-homed hosts */
-	if (dlm_local_addr[1] != NULL) {
+	if (dlm_local_count > 1) {
 		log_print("TCP protocol can't handle multi-homed hosts, "
 			  "try SCTP");
 		return -EINVAL;
-- 
2.26.2

