Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5B685352EE8
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Apr 2021 20:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617386651;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bAM+9A25NtyyTvbHXHA330irTLzbAV1bvnKUfrqAzaM=;
	b=ene2AlBssYGkqrEgcEhy11aoKFwSBS3sk10too031qoIYuAA74v3E0b0gi+AaGHAWO/fQQ
	wSOtcTYBpTrqn3BC0wi6O69o4HN/JuI6SHDYF8icMhjf2CuQgEJJjEhXellQBPSZ6SBnvs
	9FWjlH8tqlrCiCbS4J9SR91NR/SwT88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-e9PLX6tTO4SLgY_RLrk-jA-1; Fri, 02 Apr 2021 14:04:10 -0400
X-MC-Unique: e9PLX6tTO4SLgY_RLrk-jA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FBCA87A826;
	Fri,  2 Apr 2021 18:04:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A96685946D;
	Fri,  2 Apr 2021 18:04:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D2124A7C8;
	Fri,  2 Apr 2021 18:04:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 132I3qFg020455 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 2 Apr 2021 14:03:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 037E75D9F2; Fri,  2 Apr 2021 18:03:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A555E5D9DC;
	Fri,  2 Apr 2021 18:03:47 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri,  2 Apr 2021 20:03:45 +0200
Message-Id: <20210402180345.2296163-1-agruenba@redhat.com>
In-Reply-To: <20210329004759.GH4176174@shao2-debian>
References: 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] fs/gfs2/rgrp.c:1772:53: warning: Possible null
	pointer dereference: minext [nullPointer]
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

gfs2: Silence possible null pointer dereference warning

In gfs2_rbm_find, rs is always NULL when minext is NULL, so
gfs2_reservation_check_and_update will never be called on a NULL minext.
This isn't immediately obvious though, so also check for a NULL minext
for better code readability.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 89c37a845e64..2dab313442a7 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1783,7 +1783,7 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 			goto next_bitmap;
 		}
 		rbm->offset = offset;
-		if (!rs)
+		if (!rs || !minext)
 			return 0;
 
 		ret = gfs2_reservation_check_and_update(rbm, rs, *minext,
-- 
2.27.0

