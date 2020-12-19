Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E48602DF19E
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410953;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UcLTAddk/9miZ/O4SCycQ3bxWj49YA7plXcTNuXzG5Q=;
	b=iBp3DjkclhyeFxFpAoJX5iZwf9D9EKMy7bUHH8JtM3VULja13pUQ7zH2nWntRrKUCFzXmo
	HCjF5eNhzFU6nBak3gUvfOnyzvq8chIs9/Hkipp3hbZUr5Nw7UJSehcKzLFcVOZXwPKdT9
	+fv+wYKbybPUnj/Z2vu1j+58+fwHYgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-7J34L1lIPW2J6LM9TA0-QQ-1; Sat, 19 Dec 2020 15:49:09 -0500
X-MC-Unique: 7J34L1lIPW2J6LM9TA0-QQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C250107ACF6;
	Sat, 19 Dec 2020 20:49:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DF065C22A;
	Sat, 19 Dec 2020 20:49:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDDA5180954D;
	Sat, 19 Dec 2020 20:49:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKn52h020135 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:49:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D633450C0A; Sat, 19 Dec 2020 20:49:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B77AD2DAD0;
	Sat, 19 Dec 2020 20:49:04 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:33 +0100
Message-Id: <20201219204848.285781-6-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 05/20] gfs2: A minor debugging improvement
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

Split the assert in gfs2_trans_end into two parts.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/trans.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 6d4bf7ea7b3b..7705f04621f4 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -109,8 +109,8 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 	nbuf -= tr->tr_num_buf_rm;
 	nbuf -= tr->tr_num_databuf_rm;
 
-	if (gfs2_assert_withdraw(sdp, (nbuf <= tr->tr_blocks) &&
-				       (tr->tr_num_revoke <= tr->tr_revokes)))
+	if (gfs2_assert_withdraw(sdp, nbuf <= tr->tr_blocks) ||
+	    gfs2_assert_withdraw(sdp, tr->tr_num_revoke <= tr->tr_revokes))
 		gfs2_print_trans(sdp, tr);
 
 	gfs2_log_commit(sdp, tr);
-- 
2.26.2

