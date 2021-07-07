Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7853A3BE77B
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Jul 2021 13:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625658944;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=01t/M19/kHw7B+xIPC9qD3IENRynioNr014CNoPUsY8=;
	b=dwK3EcY+QYr+dVjIX5kNjt8mLxfkGlsLUaccnWfPamBOXH1Crxn8eXqpy/bs5GmYvArmul
	JQURV+IZF2ty1ekHpcos2N4L7WnZeBJEm8wOgLNf8aCzsX+U7rwwA8SJSGXLN65fz5+EmQ
	fiGCQN73E4PLvYE23/kiH6hdLeBSu5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-xh6TclBjPcCVqH62J4Zwuw-1; Wed, 07 Jul 2021 07:55:43 -0400
X-MC-Unique: xh6TclBjPcCVqH62J4Zwuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BB0180414B;
	Wed,  7 Jul 2021 11:55:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CED4419C79;
	Wed,  7 Jul 2021 11:55:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3924F1809CB2;
	Wed,  7 Jul 2021 11:55:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 167BtcNW030192 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 7 Jul 2021 07:55:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 22FA75D741; Wed,  7 Jul 2021 11:55:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.108])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 799885D6AB;
	Wed,  7 Jul 2021 11:55:36 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Wed,  7 Jul 2021 13:55:24 +0200
Message-Id: <20210707115524.2242151-4-agruenba@redhat.com>
In-Reply-To: <20210707115524.2242151-1-agruenba@redhat.com>
References: <20210707115524.2242151-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [Cluster-devel] [PATCH v3 3/3] iomap: Don't create iomap_page
	objects in iomap_page_mkwrite_actor
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

Now that we create those objects in iomap_writepage_map when needed,
there's no need to pre-create them in iomap_page_mkwrite_actor anymore.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 6330dabc451e..9f45050b61dd 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -999,7 +999,6 @@ iomap_page_mkwrite_actor(struct inode *inode, loff_t pos, loff_t length,
 		block_commit_write(page, 0, length);
 	} else {
 		WARN_ON_ONCE(!PageUptodate(page));
-		iomap_page_create(inode, page);
 		set_page_dirty(page);
 	}
 
-- 
2.26.3

