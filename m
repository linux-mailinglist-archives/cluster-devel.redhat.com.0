Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E29661899
	for <lists+cluster-devel@lfdr.de>; Sun,  8 Jan 2023 20:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673206846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RnHdpHKPjRbgtteLZNatBvGeLtifDpTNmLxdoQh5COI=;
	b=i+s2tsnTVydHLxQB8uxJxxzwKWLI0h1/VDzsrnkemzNjQpVyM1zGaFHTVAX/n4iXSpKyVR
	+hu2NRc4Hk1KQbbj7akGevMVLjK3LuXcv7I4F2HWpko6YQjH0k/Vh9OERpOyMbznjXwoSD
	0VIwm+A1C8GeX+wK0hQ4gfVhkaaH2KA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-1hOcJo4vMqCDlSMfjgQTlQ-1; Sun, 08 Jan 2023 14:40:43 -0500
X-MC-Unique: 1hOcJo4vMqCDlSMfjgQTlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0175E811E9C;
	Sun,  8 Jan 2023 19:40:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B19061415126;
	Sun,  8 Jan 2023 19:40:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6C5A51947062;
	Sun,  8 Jan 2023 19:40:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 038871946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  8 Jan 2023 19:40:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 044EC492B07; Sun,  8 Jan 2023 19:40:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-3.brq.redhat.com [10.40.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE474492B06;
 Sun,  8 Jan 2023 19:40:35 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Sun,  8 Jan 2023 20:40:24 +0100
Message-Id: <20230108194034.1444764-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [RFC v6 00/10] Turn iomap_page_ops into
 iomap_folio_ops
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Here's an updated version of this patch queue.  Changes since v5 [*]:

* A new iomap-internal __iomap_get_folio() helper was added.

* The previous iomap-internal iomap_put_folio() helper was renamed to
  __iomap_put_folio() to mirror __iomap_get_folio().

* The comment describing struct iomap_folio_ops was still referring to
  pages instead of folios in two places.

Is this good enough for iomap-for-next now, please?

Thanks,
Andreas

[*] https://lore.kernel.org/linux-xfs/20221231150919.659533-1-agruenba@redhat.com/

Andreas Gruenbacher (10):
  iomap: Add __iomap_put_folio helper
  iomap/gfs2: Unlock and put folio in page_done handler
  iomap: Rename page_done handler to put_folio
  iomap: Add iomap_get_folio helper
  iomap/gfs2: Get page in page_prepare handler
  iomap: Add __iomap_get_folio helper
  iomap: Rename page_prepare handler to get_folio
  iomap/xfs: Eliminate the iomap_valid handler
  iomap: Rename page_ops to folio_ops
  xfs: Make xfs_iomap_folio_ops static

 fs/gfs2/bmap.c         |  38 ++++++++++-----
 fs/iomap/buffered-io.c | 105 +++++++++++++++++++++++------------------
 fs/xfs/xfs_iomap.c     |  41 +++++++++++-----
 include/linux/iomap.h  |  50 +++++++++-----------
 4 files changed, 134 insertions(+), 100 deletions(-)

-- 
2.38.1

