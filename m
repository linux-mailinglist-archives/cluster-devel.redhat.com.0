Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E870514929C
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Jan 2020 02:36:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579916176;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BMxiQmjTjG68GFM5WNF/8UO/1ULuxhcK2ewnzPeolNQ=;
	b=NW02qaGa4ljIl9scKhxvOOTCBV3wWSFVGiFE1l5apJJRLs9tp3J0hcSBOWwpasjrM9KzG3
	J4CdHZBtIxW0Trmir0B62T+9mJcZfeDT3W4vXp2jXzXZV9EwJ04b3fu0iPr8ab7DCsMNwV
	t71Zf1cyxnSZ8DSlD1KWaLMWNzSRj78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-8IvpuA-uMzONvjI-wqNdpw-1; Fri, 24 Jan 2020 20:36:14 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFE301882CC4;
	Sat, 25 Jan 2020 01:36:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA0B55C1BB;
	Sat, 25 Jan 2020 01:36:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3681F8595B;
	Sat, 25 Jan 2020 01:36:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00P1a703011671 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 20:36:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0AD1F2166B32; Sat, 25 Jan 2020 01:36:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0676A2166B2F
	for <cluster-devel@redhat.com>; Sat, 25 Jan 2020 01:36:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B96651019810
	for <cluster-devel@redhat.com>; Sat, 25 Jan 2020 01:36:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-257-_Xcd-6thM4WiZTKReOJXzg-1; Fri, 24 Jan 2020 20:36:02 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1ivAMd-0006VA-6E; Sat, 25 Jan 2020 01:35:55 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 24 Jan 2020 17:35:41 -0800
Message-Id: <20200125013553.24899-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: _Xcd-6thM4WiZTKReOJXzg-1
X-MC-Unique: 8IvpuA-uMzONvjI-wqNdpw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00P1a703011671
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 00/12] Change readahead API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This series adds a readahead address_space operation to eventually
replace the readpages operation.  The key difference is that
pages are added to the page cache as they are allocated (and
then looked up by the filesystem) instead of passing them on a
list to the readpages operation and having the filesystem add
them to the page cache.  It's a net reduction in code for each
implementation, more efficient than walking a list, and solves
the direct-write vs buffered-read problem reported by yu kuai at
https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huawei=
.com/

Matthew Wilcox (Oracle) (12):
  mm: Fix the return type of __do_page_cache_readahead
  readahead: Ignore return value of ->readpages
  readahead: Put pages in cache earlier
  mm: Add readahead address space operation
  fs: Convert mpage_readpages to mpage_readahead
  btrfs: Convert from readpages to readahead
  erofs: Convert uncompressed files from readpages to readahead
  erofs: Convert compressed files from readpages to readahead
  ext4: Convert from readpages to readahead
  f2fs: Convert from readpages to readahead
  fuse: Convert from readpages to readahead
  iomap: Convert from readpages to readahead

 Documentation/filesystems/locking.rst |  7 ++-
 Documentation/filesystems/vfs.rst     | 11 ++++
 drivers/staging/exfat/exfat_super.c   |  9 ++--
 fs/block_dev.c                        |  9 ++--
 fs/btrfs/extent_io.c                  | 15 ++----
 fs/btrfs/extent_io.h                  |  2 +-
 fs/btrfs/inode.c                      | 18 +++----
 fs/erofs/data.c                       | 34 +++++-------
 fs/erofs/zdata.c                      | 21 +++-----
 fs/ext2/inode.c                       | 12 ++---
 fs/ext4/ext4.h                        |  2 +-
 fs/ext4/inode.c                       | 24 ++++-----
 fs/ext4/readpage.c                    | 20 +++----
 fs/f2fs/data.c                        | 33 +++++-------
 fs/fat/inode.c                        |  8 +--
 fs/fuse/file.c                        | 35 ++++++------
 fs/gfs2/aops.c                        | 20 ++++---
 fs/hpfs/file.c                        |  8 +--
 fs/iomap/buffered-io.c                | 74 ++++++--------------------
 fs/iomap/trace.h                      |  2 +-
 fs/isofs/inode.c                      |  9 ++--
 fs/jfs/inode.c                        |  8 +--
 fs/mpage.c                            | 38 +++++---------
 fs/nilfs2/inode.c                     | 13 ++---
 fs/ocfs2/aops.c                       | 32 +++++------
 fs/omfs/file.c                        |  8 +--
 fs/qnx6/inode.c                       |  8 +--
 fs/reiserfs/inode.c                   | 10 ++--
 fs/udf/inode.c                        |  8 +--
 fs/xfs/xfs_aops.c                     | 10 ++--
 include/linux/fs.h                    |  2 +
 include/linux/iomap.h                 |  2 +-
 include/linux/mpage.h                 |  2 +-
 include/linux/pagemap.h               | 12 +++++
 include/trace/events/erofs.h          |  6 +--
 include/trace/events/f2fs.h           |  6 +--
 mm/internal.h                         |  2 +-
 mm/migrate.c                          |  2 +-
 mm/readahead.c                        | 76 +++++++++++++++++----------
 39 files changed, 289 insertions(+), 329 deletions(-)

--=20
2.24.1


