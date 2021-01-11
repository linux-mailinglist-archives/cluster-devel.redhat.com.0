Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id ED7B92F1D5B
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jan 2021 19:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610388224;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/18R83Jxp6RepZMC5WzsHFBAbkyo7N74eMZojLSpVD0=;
	b=Qd9MViPV6Z7m3QeXy9aks/mXRlkBuGwQui45PYcTFGup/AfGXb4r2Y4tC3BS/Gg6zx8ZNv
	eX+j91nEFPo9TIcFJBOxJYZhK5tCI7t0p3t9WPqtaZ42jnj84QN6NK3UHSL6xQqi20gOx9
	Y9mHZvdLUdQrov8YxYq1aq3pnkVNltU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-HVZaY9FjO2qlXfSnk348oA-1; Mon, 11 Jan 2021 13:03:42 -0500
X-MC-Unique: HVZaY9FjO2qlXfSnk348oA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21843100C605;
	Mon, 11 Jan 2021 18:03:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 112EF1349A;
	Mon, 11 Jan 2021 18:03:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB2F74BB40;
	Mon, 11 Jan 2021 18:03:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10BI3Tv2032209 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Jan 2021 13:03:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CE20A5D9F4; Mon, 11 Jan 2021 18:03:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-187.rdu2.redhat.com [10.10.116.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52C8A5D9DB;
	Mon, 11 Jan 2021 18:03:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 11 Jan 2021 13:02:52 -0500
Message-Id: <20210111180310.122451-3-aahringo@redhat.com>
In-Reply-To: <20210111180310.122451-1-aahringo@redhat.com>
References: <20210111180310.122451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv4 dlm/next 02/20] fs: dlm: set subclass for
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

