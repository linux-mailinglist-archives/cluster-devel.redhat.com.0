Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DA7032A108A
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N1ZItQRNfz+1tTXUB5urTwHi+WosTmuvs7jNdI3UHGM=;
	b=fkbapbHpsMWwWn8Mnw+OlNw6KX34y0/Q4CCtoyE4UhSjdgK9Ghpkc5OYqctaQhHHIdJE8z
	ZD0Yych8uBW78zA7UuKSnCRbKBL5wkoDWG8Ej9y7ZyD3K2hJlg68nkGV88nuBDESz6BMEb
	0ag18quVyzSM9m7VmBHWCp7DiCWpCSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-IW0MGLC6NIa07cM8WtKrow-1; Fri, 30 Oct 2020 17:52:13 -0400
X-MC-Unique: IW0MGLC6NIa07cM8WtKrow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 989EA803623;
	Fri, 30 Oct 2020 21:52:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A6D95D9D5;
	Fri, 30 Oct 2020 21:52:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05E8558133;
	Fri, 30 Oct 2020 21:52:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULq7ES024053 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:52:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 328B5672CF; Fri, 30 Oct 2020 21:52:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65791672C0;
	Fri, 30 Oct 2020 21:52:02 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:40 +0100
Message-Id: <20201030215152.1567790-6-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 05/17] Revert "gfs2: Don't reject a
	supposedly full bitmap if we have blocks reserved"
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

This reverts commit e79e0e1428188b24c3b57309ffa54a33c4ae40c4.

It turns out that we're only setting the GBF_FULL flag of a bitmap if we've
been scanning from the beginning of the bitmap until the end and we haven't
found a single free block, and we're not skipping reservations in that process,
either.  This means that in gfs2_rbm_find, we can always skip bitmaps with the
GBF_FULL flag set.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 13b3bb04ca3a..207fbeb7b670 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1747,8 +1747,7 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 
 	while(1) {
 		bi = rbm_bi(rbm);
-		if ((ip == NULL || !gfs2_rs_active(&ip->i_res)) &&
-		    test_bit(GBF_FULL, &bi->bi_flags) &&
+		if (test_bit(GBF_FULL, &bi->bi_flags) &&
 		    (state == GFS2_BLKST_FREE))
 			goto next_bitmap;
 
-- 
2.26.2

