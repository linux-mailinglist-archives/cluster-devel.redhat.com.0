Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD9F6504EC
	for <lists+cluster-devel@lfdr.de>; Sun, 18 Dec 2022 23:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671401468;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hSKP4WbWgB/zC73JeMrFU10HKsrDmKDAGSlTQQONUe8=;
	b=FpgiK2waaGlk1FEnzrL7qwvDAkvYQFOGqyM7aUOcJUrsTWndOxQfCSwRbjJcRzx1VWf8uW
	OXWB4UH+5cAPaREAWV7ebLB10mYhjVOjDTrZ+djZL4qVqrFKg7O8zclYZeDzIabi6XMeQN
	h1mhPyC1+uLLYPFel7r0S4VWoQreDMQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-meLMSXFrOrakQm_YRvlgPw-1; Sun, 18 Dec 2022 17:11:05 -0500
X-MC-Unique: meLMSXFrOrakQm_YRvlgPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89F023C0D84F;
	Sun, 18 Dec 2022 22:11:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFE8840C945A;
	Sun, 18 Dec 2022 22:11:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 35301194658D;
	Sun, 18 Dec 2022 22:11:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1949D1946588 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 18 Dec 2022 22:10:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 50C9B2166B2B; Sun, 18 Dec 2022 22:10:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-22.brq.redhat.com [10.40.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F1AC2166B26;
 Sun, 18 Dec 2022 22:10:55 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Sun, 18 Dec 2022 23:10:47 +0100
Message-Id: <20221218221054.3946886-1-agruenba@redhat.com>
In-Reply-To: <20221216150626.670312-1-agruenba@redhat.com>
References: <20221216150626.670312-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC v4 0/7] Turn iomap_page_ops into
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Here's an updated version that changes iomap_folio_prepare() to return
an ERR_PTR() instead of NULL when the folio cannot be obtained as
suggested by Matthew Wilcox.

Thanks,
Andreas

Andreas Gruenbacher (7):
  fs: Add folio_may_straddle_isize helper
  iomap: Add iomap_folio_done helper
  iomap/gfs2: Unlock and put folio in page_done handler
  iomap: Add iomap_folio_prepare helper
  iomap/gfs2: Get page in page_prepare handler
  iomap/xfs: Eliminate the iomap_valid handler
  iomap: Rename page_ops to folio_ops

 fs/buffer.c            |  5 +--
 fs/ext4/inode.c        | 13 +++---
 fs/gfs2/bmap.c         | 43 ++++++++++++------
 fs/iomap/buffered-io.c | 98 ++++++++++++++++++++++--------------------
 fs/xfs/xfs_iomap.c     | 42 ++++++++++++------
 include/linux/iomap.h  | 46 +++++++-------------
 include/linux/mm.h     |  2 +
 mm/truncate.c          | 35 +++++++++++++++
 8 files changed, 172 insertions(+), 112 deletions(-)

-- 
2.38.1

