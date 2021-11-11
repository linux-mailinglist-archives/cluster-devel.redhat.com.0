Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2BA44D7D7
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Nov 2021 15:08:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636639713;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bs6l8BRCwMtsoM2Wdbgw5at/O+nPht7nUCbKrMdH2m8=;
	b=FjUZdhiHxmSTxQyfhVaL8XRQYrdnB0/Y1llzid80Q8tVCAUm/a82fF/P8jeJaoN5o5oy9e
	impgU7HOojVNtm+B/d4ENOfMf3NSxLDWA3kQeVmd9mWGnDBBX3ZDU+wA1YcPzwQ6S5MEGt
	AJJtU3AxDlJpe4eCYspaSw+lpBOOKYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-T5WGtL2VOKKIawxNeU9yVQ-1; Thu, 11 Nov 2021 09:08:30 -0500
X-MC-Unique: T5WGtL2VOKKIawxNeU9yVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57734100CCC0;
	Thu, 11 Nov 2021 14:08:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DACDC19C59;
	Thu, 11 Nov 2021 14:08:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE8AA1800FDD;
	Thu, 11 Nov 2021 14:08:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ABE8Gs2026571 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 11 Nov 2021 09:08:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AF3D356A90; Thu, 11 Nov 2021 14:08:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.195.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A2815D6B1;
	Thu, 11 Nov 2021 14:08:02 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>, "Darrick J . Wong" <djwong@kernel.org>
Date: Thu, 11 Nov 2021 15:08:02 +0100
Message-Id: <20211111140802.577144-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] iomap: Fix iomap_readahead_iter error
	handling
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

In iomap_readahead_iter, deal with potential iomap_readpage_iter errors.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 1753c26c8e76..9f1e329e8b2c 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -370,6 +370,8 @@ static loff_t iomap_readahead_iter(const struct iomap_iter *iter,
 			ctx->cur_page_in_bio = false;
 		}
 		ret = iomap_readpage_iter(iter, ctx, done);
+		if (ret < 0)
+			return ret;
 	}
 
 	return done;
-- 
2.31.1

