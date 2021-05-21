Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 181B138CDEC
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 21:09:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621624154;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4OR5rYv9KbRXRlh+rRU3n9arzxg8SEwicJHOcIXz03I=;
	b=i2LlU4Mbtq8sEkyAS4oqzxt7o044cuHDIDmEIFkKBfH5BIyqgzxgByilstLp6L7JFAVUT1
	jE2qst4whoeoZ6gw6eMhOu03B/mLG18WdHyl/UrfJJum70vmQlaAPCyGu9BrZDodL3EFvC
	/+xAbInYcA8tCCyejbEjpT2KPSavrXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-9I6BqaX3P46QtNXAKX7InA-1; Fri, 21 May 2021 15:09:12 -0400
X-MC-Unique: 9I6BqaX3P46QtNXAKX7InA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8E39107ACF2;
	Fri, 21 May 2021 19:09:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBADB5C890;
	Fri, 21 May 2021 19:09:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6E0C44A6C;
	Fri, 21 May 2021 19:09:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14LJ95vd005142 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 15:09:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68ABB5C890; Fri, 21 May 2021 19:09:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-19.rdu2.redhat.com [10.10.115.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D48775C1BB;
	Fri, 21 May 2021 19:09:04 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 May 2021 15:08:36 -0400
Message-Id: <20210521190848.350176-5-aahringo@redhat.com>
In-Reply-To: <20210521190848.350176-1-aahringo@redhat.com>
References: <20210521190848.350176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv6 v5.13-rc1 dlm/next 04/16] fs: dlm: set is
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

