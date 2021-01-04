Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8082E9F25
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Jan 2021 22:00:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609794044;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/18R83Jxp6RepZMC5WzsHFBAbkyo7N74eMZojLSpVD0=;
	b=U5hLOb5treSYXHrU+LG5HFmDWRODcE1745G3HaSD3qXa5RRIIdIfiWZ8cFb1fTAKe7Zw+s
	TvvgkRfFrPIBbC2ObGYGRoeiM7hbS+Ym8S4jPMXrPwQ8/oT+JgWuoLeLoaCccZkIuuRjEA
	E5ABwtP5nQ9aK3lP6GDKNemlF7DhLPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-wBN-EFuMNz2s4c0A9mgMuQ-1; Mon, 04 Jan 2021 16:00:41 -0500
X-MC-Unique: wBN-EFuMNz2s4c0A9mgMuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 838A8C73A3;
	Mon,  4 Jan 2021 21:00:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72FE26F7EB;
	Mon,  4 Jan 2021 21:00:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C3234BB40;
	Mon,  4 Jan 2021 21:00:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104L0Z0e003628 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 16:00:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0BCF12719F; Mon,  4 Jan 2021 21:00:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-75.rdu2.redhat.com [10.10.115.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89F52272AD;
	Mon,  4 Jan 2021 21:00:34 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Jan 2021 16:00:06 -0500
Message-Id: <20210104210024.233765-3-aahringo@redhat.com>
In-Reply-To: <20210104210024.233765-1-aahringo@redhat.com>
References: <20210104210024.233765-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 02/20] fs: dlm: set subclass for
	othercon sock_mutex
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
index 2fd1e4c13663..d772e1d4461d 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -911,13 +911,14 @@ static int accept_from_sock(struct listen_connection *con)
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

