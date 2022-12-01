Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2460A63F726
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Dec 2022 19:10:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669918216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+zmVq6FIgm1N+PBpIIwnONX7Od2TKKR0G3ALNNt9PAE=;
	b=IJjMH7KYxXbgbIHnF788vyvf1m7Sw+AXFMoY+pDQUh6gT3IAHiDC8I5ZLJKo5lmTB0hLU1
	BdIjsSWkwOBgT5e2GaAi7aYxWkFZYTKVQJIGo6kijR7TKZbswpyCzy3Rh46tTLjMKwX8y0
	ML6nwE4BhBEyn2Rh7mKUAn57D43eo0Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-pvKLi8CwMb2E831yn9TJQw-1; Thu, 01 Dec 2022 13:10:12 -0500
X-MC-Unique: pvKLi8CwMb2E831yn9TJQw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 042AD1C0896B;
	Thu,  1 Dec 2022 18:10:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 295834B3FC8;
	Thu,  1 Dec 2022 18:10:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D1B3E19465B2;
	Thu,  1 Dec 2022 18:10:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D294219465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Dec 2022 18:10:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B0992C1908C; Thu,  1 Dec 2022 18:10:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-141.brq.redhat.com [10.40.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D21EC15BB4;
 Thu,  1 Dec 2022 18:09:58 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Thu,  1 Dec 2022 19:09:54 +0100
Message-Id: <20221201180957.1268079-1-agruenba@redhat.com>
In-Reply-To: <20221201160619.1247788-1-agruenba@redhat.com>
References: <20221201160619.1247788-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [RFC v2 0/3] Turn iomap_page_ops into
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi again,

[Same thing, but with the patches split correctly this time.]

we're seeing a race between journaled data writes and the shrinker on
gfs2.  What's happening is that gfs2_iomap_page_done() is called after
the page has been unlocked, so try_to_free_buffers() can come in and
free the buffers while gfs2_iomap_page_done() is trying to add them to
the transaction.  Not good.

This is a proposal to change iomap_page_ops so that page_prepare()
prepares the write and grabs the locked page, and page_done() unlocks
and puts that page again.  While at it, this also converts the hooks
from pages to folios.

To move the pagecache_isize_extended() call in iomap_write_end() out of
the way, a new folio_may_straddle_isize() helper is introduced that
takes a locked folio.  That is then used when the inode size is updated,
before the folio is unlocked.

I've also converted the other applicable folio_may_straddle_isize()
users, namely generic_write_end(), ext4_write_end(), and
ext4_journalled_write_end().

Any thoughts?

Thanks,
Andreas

Andreas Gruenbacher (3):
  fs: Add folio_may_straddle_isize helper
  iomap: Turn iomap_page_ops into iomap_folio_ops
  gfs2: Fix race between shrinker and gfs2_iomap_folio_done

 fs/buffer.c            |  5 ++---
 fs/ext4/inode.c        | 13 +++++------
 fs/gfs2/bmap.c         | 39 +++++++++++++++++++++++---------
 fs/iomap/buffered-io.c | 51 +++++++++++++++++++++---------------------
 include/linux/iomap.h  | 24 ++++++++++----------
 include/linux/mm.h     |  2 ++
 mm/truncate.c          | 34 ++++++++++++++++++++++++++++
 7 files changed, 110 insertions(+), 58 deletions(-)

-- 
2.38.1

