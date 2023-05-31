Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1637179BD
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 10:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685520961;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rTj30peRJt6m0YoKqBvWmseSjfUD4Z/EcECC7rWKQqY=;
	b=YqA3V4lONyY6U+0gPtXDgF5Jk1BvBetYpSAsnUQ3OG/y/sCPF+ftHFNKgLyVyDKSOoSYdw
	x1EczNvZxKNTIJDT4GSHaDYKcHgwEvAPsbuMjtq35oc28EPxISWsPfclt1VEB2E1R0HA2F
	NWAQ7ESgcjY3mRi4G4+3ODtc53OxWPo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-clJ7jnrxPwiearEz6TxPsQ-1; Wed, 31 May 2023 04:15:58 -0400
X-MC-Unique: clJ7jnrxPwiearEz6TxPsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C344800B2A;
	Wed, 31 May 2023 08:15:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 357F8140E963;
	Wed, 31 May 2023 08:15:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 121DD19465A8;
	Wed, 31 May 2023 08:15:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA0CE1946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 07:57:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BD28640CFD47; Wed, 31 May 2023 07:57:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B559540CFD45
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 07:57:12 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 956F31C05AA7
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 07:57:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-GEAJtLNaMTKeijbX2YnVZA-1; Wed, 31 May 2023 03:57:10 -0400
X-MC-Unique: GEAJtLNaMTKeijbX2YnVZA-1
Received: from [2001:4bb8:182:6d06:f5c3:53d7:b5aa:b6a7] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4G7t-00GPh2-1k; Wed, 31 May 2023 07:20:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 31 May 2023 09:19:58 +0200
Message-Id: <20230531072006.476386-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] cleanup the filemap / direct I/O interaction v3
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi all,

this series cleans up some of the generic write helper calling
conventions and the page cache writeback / invalidation for
direct I/O.  This is a spinoff from the no-bufferhead kernel
project, for which we'll want to an use iomap based buffered
write path in the block layer.

Changes since v2:
 - stick to the existing behavior of returning a short write
   if the buffer fallback write or sync fails
 - bring back "fuse: use direct_write_fallback" which accidentally
   got lost in v2

Changes since v1:
 - remove current->backing_dev_info entirely
 - fix the pos/end calculation in direct_write_fallback
 - rename kiocb_invalidate_post_write to
   kiocb_invalidate_post_direct_write
 - typo fixes

diffstat:
 block/fops.c            |   18 +-----
 fs/btrfs/file.c         |    6 --
 fs/ceph/file.c          |    6 --
 fs/direct-io.c          |   10 ---
 fs/ext4/file.c          |   11 +---
 fs/f2fs/file.c          |    3 -
 fs/fuse/file.c          |    4 -
 fs/gfs2/file.c          |    6 --
 fs/iomap/buffered-io.c  |    9 ++-
 fs/iomap/direct-io.c    |   88 ++++++++++++---------------------
 fs/nfs/file.c           |    6 --
 fs/ntfs/file.c          |    2 
 fs/ntfs3/file.c         |    3 -
 fs/xfs/xfs_file.c       |    6 --
 fs/zonefs/file.c        |    4 -
 include/linux/fs.h      |    5 -
 include/linux/pagemap.h |    4 +
 include/linux/sched.h   |    3 -
 mm/filemap.c            |  126 ++++++++++++++++++++++++++----------------------
 19 files changed, 125 insertions(+), 195 deletions(-)

