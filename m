Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE36329480
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Mar 2021 23:05:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614636343;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E4YXORXwWR/TAt5A4psxhRklHo8qhqiiML6thbrUoIw=;
	b=cGd6TSF7pAHBKUaIKa4DNvJI4fBBU4J9VqWql49Rd0gbaRrUYwvUjqIPca8w7kKup0fzPA
	lCs8pTpiLLfmQDTtC6CkB/EPg5wPuhim3Q5qe3yEJdCyKAALEFMWEbYEe0FN6I7g8kp6Eq
	fSVTaDMYCuKtNdLyHTFW1/u/6vyQX1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-Bb-HosaHMuOOYPCImHag2A-1; Mon, 01 Mar 2021 17:05:40 -0500
X-MC-Unique: Bb-HosaHMuOOYPCImHag2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28F3C86A064;
	Mon,  1 Mar 2021 22:05:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A11F5D766;
	Mon,  1 Mar 2021 22:05:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AABD49;
	Mon,  1 Mar 2021 22:05:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 121M5VNe005911 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Mar 2021 17:05:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6DBBA10013D7; Mon,  1 Mar 2021 22:05:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-35.rdu2.redhat.com [10.10.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECC4010013C1;
	Mon,  1 Mar 2021 22:05:30 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  1 Mar 2021 17:05:11 -0500
Message-Id: <20210301220520.514470-5-aahringo@redhat.com>
In-Reply-To: <20210301220520.514470-1-aahringo@redhat.com>
References: <20210301220520.514470-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 04/13] fs: dlm: set subclass for
	othercon sock_mutex
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

This patch sets the lockdep subclass for the othercon socket mutex. In
various places the connection socket mutex is held while locking the
othercon socket mutex. This patch will remove lockdep warnings when such
case occurs.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index f169e35d19f4..ca9bf54b94a9 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -934,13 +934,14 @@ static int accept_from_sock(struct listen_connection *con)
 				goto accept_err;
 			}
 
+			lockdep_set_subclass(&othercon->sock_mutex, 1);
 			newcon->othercon = othercon;
 		} else {
 			/* close other sock con if we have something new */
 			close_connection(othercon, false, true, false);
 		}
 
-		mutex_lock_nested(&othercon->sock_mutex, 1);
+		mutex_lock(&othercon->sock_mutex);
 		add_sock(newsock, othercon);
 		addcon = othercon;
 		mutex_unlock(&othercon->sock_mutex);
-- 
2.26.2

