Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2168B64ED6B
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Dec 2022 16:06:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671203196;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+u0GILR+K9NlvYK7wKkYXg0kWtYj9HkTrgQnClsscW4=;
	b=fY5J/EmA0A+HFTF07A2n2Ji8BNMpSL7XbG6ktRps8Upw6614k5vqTUczYinhngOkNDQaob
	XqJYDSJDyfIfRHKQZZl47o/q8hOeTzr5NEUgYJQI/V/EcfwvB+c7tL8R+R5uKpDwdH1Wk3
	hjMjO8fouP8rUNGZbwO6PBzV+FiXO6U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-9QTzyTL1Oh2SA51RhWMdpA-1; Fri, 16 Dec 2022 10:06:32 -0500
X-MC-Unique: 9QTzyTL1Oh2SA51RhWMdpA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9D3A101A55E;
	Fri, 16 Dec 2022 15:06:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90B7614171C0;
	Fri, 16 Dec 2022 15:06:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E6F91946A6B;
	Fri, 16 Dec 2022 15:06:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 892C61946594 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Dec 2022 15:06:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 75D3C14171C1; Fri, 16 Dec 2022 15:06:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-182.brq.redhat.com [10.40.192.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31F5414171C0;
 Fri, 16 Dec 2022 15:06:26 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Fri, 16 Dec 2022 16:06:19 +0100
Message-Id: <20221216150626.670312-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [RFC v3 0/7] Turn iomap_page_ops into
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

This is an updated proposal for changing the iomap page_ops operations
to make them more flexible so that they better suite the filesystem
needs.  It closes a race on gfs2 and cleans up the recent iomap changes
merged in the following upstream commit:

87be949912ee ("Merge tag 'xfs-6.2-merge-8' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux")

The first patch introduces a folio_may_straddle_isize() helper as a
replacement for pagecache_isize_extended() when we have a locked folio.
This still needs independent verification, but it looks like a
worthwhile improvement to me.  I've left it in this patch queue for now,
but I can moved out of the way if prefered.

Any thoughts?

Thanks,
Andreas

Andreas Gruenbacher (7):
  fs: Add folio_may_straddle_isize helper
  iomap: Add iomap_folio_done helper
  iomap/gfs2: Unlock and put folio in page_done handler
  iomap: Add iomap_folio_prepare helper
  iomap: Get page in page_prepare handler
  iomap/xfs: Eliminate the iomap_valid handler
  iomap: Rename page_ops to folio_ops

 fs/buffer.c            |  5 +--
 fs/ext4/inode.c        | 13 +++---
 fs/gfs2/bmap.c         | 43 +++++++++++++------
 fs/iomap/buffered-io.c | 95 +++++++++++++++++++++---------------------
 fs/xfs/xfs_iomap.c     | 42 +++++++++++++------
 include/linux/iomap.h  | 46 +++++++-------------
 include/linux/mm.h     |  2 +
 mm/truncate.c          | 35 ++++++++++++++++
 8 files changed, 169 insertions(+), 112 deletions(-)

-- 
2.38.1

