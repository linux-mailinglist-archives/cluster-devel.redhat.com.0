Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A41DB5C541
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Jul 2019 23:55:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A5F08553D;
	Mon,  1 Jul 2019 21:55:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 464A11001B3C;
	Mon,  1 Jul 2019 21:55:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2581EC57E;
	Mon,  1 Jul 2019 21:55:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x61LtPTI006692 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 17:55:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 975BF189F5; Mon,  1 Jul 2019 21:55:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F62418B4D;
	Mon,  1 Jul 2019 21:55:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14F19368E6;
	Mon,  1 Jul 2019 21:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VnJ3l/G3VcEZucPv3SJlnBv3ai6y5dMzvguEQQorKk0=;
	b=ZJVYlwvv7rW4qBuEtxJKot9IzR
	d1U/BGp884th3kUbc81NF1pWwEz52oZhxCOlIjcQxscjm6jxmJwz7/9A6b+AHVP5N4vG5CJ5ERgrd
	St4akr8qDaQqxmYrx8PgmsnBtFf923xHMvvDNZr+ywYR386DoMwB3bWK/gEn0rAGxrbpibqm706bm
	+PShYs68uEuu8oJUpfw/B8ZKoiMTYNIXKV1bZflNg8tRvZuHGGAKpJMv7WZwz6evxnQi3gecNHu+t
	Qy3UFKugC0S3RO9d9U9p3Qr7qzqzdjelo+JadlW7Te+nVedn4oRYZ1owZgXV7l/VjVoLp4yI32xAp
	LOb41oYw==;
Received: from [38.98.37.141] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hi4Gb-0001k2-Mq; Mon, 01 Jul 2019 21:55:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon,  1 Jul 2019 23:54:28 +0200
Message-Id: <20190701215439.19162-5-hch@lst.de>
In-Reply-To: <20190701215439.19162-1-hch@lst.de>
References: <20190701215439.19162-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Mon, 01 Jul 2019 21:55:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Mon, 01 Jul 2019 21:55:19 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.297  (DKIM_SIGNED, DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>
Subject: [Cluster-devel] [PATCH 04/15] iomap: warn on inline maps
	iomap_writepage_map
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 01 Jul 2019 21:55:27 +0000 (UTC)

And inline mapping should never mark the page dirty and thus never end up
in writepages.  Add a check for that condition and warn if it happens.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/iomap.c b/fs/iomap.c
index 0a86aaee961f..ea5b8e7c8903 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -2541,6 +2541,8 @@ iomap_writepage_map(struct iomap_writepage_ctx *wpc,
 		error = wpc->ops->map_blocks(wpc, inode, file_offset);
 		if (error)
 			break;
+		if (WARN_ON_ONCE(wpc->iomap.type == IOMAP_INLINE))
+			continue;
 		if (wpc->iomap.type == IOMAP_HOLE)
 			continue;
 		iomap_add_to_ioend(inode, file_offset, page, iop, wpc, wbc,
-- 
2.20.1

