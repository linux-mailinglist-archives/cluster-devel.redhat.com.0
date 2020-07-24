Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C612322CDD2
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jul 2020 20:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595615603;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sd+iXl9H1RFaKun0Ro02nix5aEfd+RVMpweEW/e52Xk=;
	b=UBfUy76Ccx2JgpVck8Fxc2dpXPUki0oUPfd5thOJLDmE8coSkdrnRhZdEygLr6QMD60Rnh
	2GYFrcsQqdhcpdj3jKPFh2VPgAjolsiUME627AlTkpgOiBhwTWPSKNCb9SuAjsnrPVnd1x
	UNuB9EDb/ZmHlKxwBBB/BkxobM3rgNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-cbIthHMQM5q7tLNiU_Ezhg-1; Fri, 24 Jul 2020 14:33:21 -0400
X-MC-Unique: cbIthHMQM5q7tLNiU_Ezhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58B66800494;
	Fri, 24 Jul 2020 18:33:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6C5F171F9;
	Fri, 24 Jul 2020 18:33:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2756096259;
	Fri, 24 Jul 2020 18:33:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OIXBu5016276 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 14:33:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC0DC6FEFE; Fri, 24 Jul 2020 18:33:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D2E8705A0
	for <cluster-devel@redhat.com>; Fri, 24 Jul 2020 18:33:11 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 24 Jul 2020 13:32:56 -0500
Message-Id: <20200724183304.366913-4-rpeterso@redhat.com>
In-Reply-To: <20200724183304.366913-1-rpeterso@redhat.com>
References: <20200724183304.366913-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 03/11] gfs2: Fix inaccurate comment
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

The comment regarding journal flush thresholds is wrong. This patch fixes it.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index a76e55bc28eb..a58333e3980d 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1092,7 +1092,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
  * or the total number of used blocks (pinned blocks plus AIL blocks)
  * is greater than thresh2.
  *
- * At mount time thresh1 is 1/3rd of journal size, thresh2 is 2/3rd of
+ * At mount time thresh1 is 2/5ths of journal size, thresh2 is 4/5ths of
  * journal size.
  *
  * Returns: errno
-- 
2.26.2

