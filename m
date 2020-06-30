Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 61F1020F7C7
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Jun 2020 16:59:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593529159;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g7i4zFjTZgbf1SEVb4LIcbwN8+M1TgSnxuP0GVK0nRw=;
	b=Hu9xx2D4NjTp6YRF5cnIXLwkPSOHOCb6EuBheemBzkI1to2wuBHtOW3zdvUQkdayL1CX2O
	1aGntVx8yEey8qWH+I8ZrK8KvylJpwyznIhz2XB2vU6AStxzxVEKKw2zRuQ6gS8uyAmZir
	5FllhYnvt6elZw0so3AYUsCARmU3uYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-IWU_QwWmOf6-8hjcBnAXHA-1; Tue, 30 Jun 2020 10:59:17 -0400
X-MC-Unique: IWU_QwWmOf6-8hjcBnAXHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84D8C185B385;
	Tue, 30 Jun 2020 14:59:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA884B3A65;
	Tue, 30 Jun 2020 14:59:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEED31809547;
	Tue, 30 Jun 2020 14:59:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UEx3Dr001262 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 10:59:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F43A1002388; Tue, 30 Jun 2020 14:59:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7108710013C0;
	Tue, 30 Jun 2020 14:58:59 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com, Matthew Wilcox <willy@infradead.org>
Date: Tue, 30 Jun 2020 16:58:57 +0200
Message-Id: <20200630145857.1411226-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Fix readpage locking
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

The readpage address space operation is passed a locked page and is
supposed to unlock the page, either synchronously or via I/O completion.
In particular, it must never return a locked page on error.

Reported-by: Matthew Wilcox <willy@infradead.org>
Fixes: 01b7c7ae88a6 ("[GFS2] Revise readpage locking")
Cc: stable@vger.kernel.org # v2.6.27+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 6ccd478c81ff..9b257d3132dc 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -532,8 +532,6 @@ static int gfs2_readpage(struct file *file, struct page *page)
 	gfs2_glock_dq(&gh);
 out:
 	gfs2_holder_uninit(&gh);
-	if (error && error != AOP_TRUNCATED_PAGE)
-		lock_page(page);
 	return error;
 }
 
-- 
2.26.2

