Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 215A429B310
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Oct 2020 15:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603810511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gohJK+wAu9/jW8Ns76d7kRs134KF1jjlxGUGUU3btus=;
	b=G4SMI2vYyP0xjbCIPZ+zrm/H1s9SYRtia7J3+z1oMSer8EvCaC0mO0cnz0+0W/Sz4QdNW7
	TNAzxpMAI53UGiwK5mBVK8xijpPJb89bGqBeO41V/yttnWoOnafXqlGNqfQdC+wc+38fer
	csGb2J70qKOgbo1HaRYDUnQNxpedp4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-OYLDZ6UGMa2Y8jEhKAeROg-1; Tue, 27 Oct 2020 10:55:09 -0400
X-MC-Unique: OYLDZ6UGMa2Y8jEhKAeROg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1294D10430C8;
	Tue, 27 Oct 2020 14:55:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A4FF5D9F1;
	Tue, 27 Oct 2020 14:55:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCEDF1832FB7;
	Tue, 27 Oct 2020 14:55:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09REr7TS005391 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Oct 2020 10:53:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 97AE3709F6; Tue, 27 Oct 2020 14:53:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-113-104.phx2.redhat.com [10.3.113.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D552F756CE
	for <cluster-devel@redhat.com>; Tue, 27 Oct 2020 14:52:28 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Oct 2020 09:52:20 -0500
Message-Id: <20201027145222.363422-2-rpeterso@redhat.com>
In-Reply-To: <20201027145222.363422-1-rpeterso@redhat.com>
References: <20201027145222.363422-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/3] gfs2: Free rd_bits later in
	gfs2_clear-rgrpd to fix use-after-free
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, function gfs2_clear_rgrpd ran through all the rgrps doing
cleanup, but it called kfree(rgd->rd_bits) then return_all_reservations().
But return_all_reservations calls __rs_deltree, which calls rbm_bi, and
rbm_bi references: rbm->rgd->rd_bits + rbm->bii. This is use-after-free.

This patch moves the call to kfree after the call to return_all_reservations
so it can reference it before it is freed.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/rgrp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index ee491bb9c1cc..eb1b29734b7f 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -719,9 +719,9 @@ void gfs2_clear_rgrpd(struct gfs2_sbd *sdp)
 		}
 
 		gfs2_free_clones(rgd);
+		return_all_reservations(rgd);
 		kfree(rgd->rd_bits);
 		rgd->rd_bits = NULL;
-		return_all_reservations(rgd);
 		kmem_cache_free(gfs2_rgrpd_cachep, rgd);
 	}
 }
-- 
2.26.2

