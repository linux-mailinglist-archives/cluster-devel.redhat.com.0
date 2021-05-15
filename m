Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 411F138149F
	for <lists+cluster-devel@lfdr.de>; Sat, 15 May 2021 02:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621038976;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4OR5rYv9KbRXRlh+rRU3n9arzxg8SEwicJHOcIXz03I=;
	b=ILsvMcRsiXSGba1FkBbvfe4h2sg/Lz1UXJStoV0W8jkOqC34jzbqa9ql+EkCL4N3H6ypcG
	06ffkX0LnephSoqvkAyzh/4pCrEe6n2Mc/xZn6C8rXHB64XWNijGxUsbKF1978LHHXJxOA
	qOOeLql9mwVVknoWUjY07+zH3aGE/tU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-tIK03JkaMDuxAo0zgx1Wlg-1; Fri, 14 May 2021 20:36:14 -0400
X-MC-Unique: tIK03JkaMDuxAo0zgx1Wlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95FC5807352;
	Sat, 15 May 2021 00:36:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A0075D6D1;
	Sat, 15 May 2021 00:36:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E0E4C180102A;
	Sat, 15 May 2021 00:36:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14F0a3Ad030838 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 20:36:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B969A5D9E3; Sat, 15 May 2021 00:36:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-135.rdu2.redhat.com [10.10.115.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3CF635D9CD;
	Sat, 15 May 2021 00:36:03 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 14 May 2021 20:35:37 -0400
Message-Id: <20210515003549.1118171-4-aahringo@redhat.com>
In-Reply-To: <20210515003549.1118171-1-aahringo@redhat.com>
References: <20210515003549.1118171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv5 v5.13-rc1 dlm/next 03/15] fs: dlm: set is
	othercon flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

There is a is othercon flag which is never used, this patch will set it
and printout a warning if the othercon ever sends a dlm message which
should never be the case.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 7c7a31377f27..4944aef24aa5 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -938,6 +938,7 @@ static int accept_from_sock(struct listen_connection *con)
 			}
 
 			lockdep_set_subclass(&othercon->sock_mutex, 1);
+			set_bit(CF_IS_OTHERCON, &othercon->flags);
 			newcon->othercon = othercon;
 		} else {
 			/* close other sock con if we have something new */
@@ -1601,6 +1602,8 @@ static void process_send_sockets(struct work_struct *work)
 {
 	struct connection *con = container_of(work, struct connection, swork);
 
+	WARN_ON(test_bit(CF_IS_OTHERCON, &con->flags));
+
 	clear_bit(CF_WRITE_PENDING, &con->flags);
 	if (con->sock == NULL) /* not mutex protected so check it inside too */
 		con->connect_action(con);
-- 
2.26.3

