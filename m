Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BB1101650C5
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582146114;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C0gnLb//gTO5NE32fEECNX6ZbZtE14IJYbNZ9RwA5TM=;
	b=AVvAiMqGtGnFsP9LjPzf2lpQ13lOpYFV9ljDYilX+F9Qsf0UrzDihEotDqUOkP3pLxHmSL
	fXGe1Pry7s6c/mesgNJLA8jR0EsoUxfuGSbMUaQCajSQDKn8DyL8UzFzvNjtXLz/bTSZHT
	1zHkxDaDxLXK54cpL9an5r52xWvGh0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-kRmB18dqP0aCKWhi77hZxw-1; Wed, 19 Feb 2020 16:01:33 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35E8F108443C;
	Wed, 19 Feb 2020 21:01:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1415960BE1;
	Wed, 19 Feb 2020 21:01:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D803135AF0;
	Wed, 19 Feb 2020 21:01:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JL1N1a002004 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 16:01:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 022142166B2C; Wed, 19 Feb 2020 21:01:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F24C72166B2B
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7C3E185A78E
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-86-ZjrfQY0dOhqTxbKVMwFefQ-1; Wed, 19 Feb 2020 16:01:19 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4WSu-0008TD-Nx; Wed, 19 Feb 2020 21:01:04 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:00:39 -0800
Message-Id: <20200219210103.32400-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: ZjrfQY0dOhqTxbKVMwFefQ-1
X-MC-Unique: kRmB18dqP0aCKWhi77hZxw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JL1N1a002004
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v7 00/23] Change readahead API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

The only unconverted filesystems are those which use fscache.
Their conversion is pending Dave Howells' rewrite which will make the
conversion substantially easier.

I want to thank the reviewers; Dave Chinner, John Hubbard and Christoph
Hellwig have done a marvellous job of providing constructive criticism.
Eric Biggers pointed out how I'd broken ext4 (which led to a substantial
change).  I've tried to take it all on board, but I may have missed
something simply because you've done such a thorough job.

This series can also be found at
http://git.infradead.org/users/willy/linux-dax.git/shortlog/refs/tags/reada=
head_v7
(I also pushed the readahead_v6 tag there in case anyone wants to diff, and
they're both based on 5.6-rc2 so they're easy to diff)

v7:
 - Now passes an xfstests run on ext4!
 - Documentation improvements
 - Move the readahead prototypes out of mm.h (new patch)
 - readahead_for_each* iterators are gone; replaced with readahead_page()
   and readahead_page_batch()
 - page_cache_readahead_limit() renamed to page_cache_readahead_unbounded()
   and arguments changed
 - iomap_readahead_actor() restructured differently
 - The readahead code no longer uses the word 'offset' to reduce ambiguity
 - read_pages() now maintains the rac so we can just call it and continue
   instead of mucking around with branches
 - More assertions
 - More readahead functions return void

v6:
 - Name the private members of readahead_control with a leading underscore
   (suggested by Christoph Hellwig)
 - Fix whitespace in rst file
 - Remove misleading comment in btrfs patch
 - Add readahead_next() API and use it in iomap
 - Add iomap_readahead kerneldoc.
 - Fix the mpage_readahead kerneldoc
 - Make various readahead functions return void
 - Keep readahead_index() and readahead_offset() pointing to the start of
   this batch through the body.  No current user requires this, but it's
   less surprising.
 - Add kerneldoc for page_cache_readahead_limit
 - Make page_idx an unsigned long, and rename it to just 'i'
 - Get rid of page_offset local variable
 - Add patch to call memalloc_nofs_save() before allocating pages (suggeste=
d
   by Michal Hocko)
 - Resplit a lot of patches for more logical progression and easier review
   (suggested by John Hubbard)
 - Added sign-offs where received, and I deemed still relevant

v5 switched to passing a readahead_control struct (mirroring the
writepages_control struct passed to writepages).  This has a number of
advantages:
 - It fixes a number of bugs in various implementations, eg forgetting to
   increment 'start', an off-by-one error in 'nr_pages' or treating 'start'
   as a byte offset instead of a page offset.
 - It allows us to change the arguments without changing all the
   implementations of ->readahead which just call mpage_readahead() or
   iomap_readahead()
 - Figuring out which pages haven't been attempted by the implementation
   is more natural this way.
 - There's less code in each implementation.

Matthew Wilcox (Oracle) (24):
  mm: Move readahead prototypes from mm.h
  mm: Return void from various readahead functions
  mm: Ignore return value of ->readpages
  mm: Move readahead nr_pages check into read_pages
  mm: Use readahead_control to pass arguments
  mm: Rename various 'offset' parameters to 'index'
  mm: rename readahead loop variable to 'i'
  mm: Remove 'page_offset' from readahead loop
  mm: Put readahead pages in cache earlier
  mm: Add readahead address space operation
  mm: Move end_index check out of readahead loop
  mm: Add page_cache_readahead_unbounded
  fs: Convert mpage_readpages to mpage_readahead
  btrfs: Convert from readpages to readahead
  erofs: Convert uncompressed files from readpages to readahead
  erofs: Convert compressed files from readpages to readahead
  ext4: Convert from readpages to readahead
  ext4: Pass the inode to ext4_mpage_readpages
  f2fs: Convert from readpages to readahead
  fuse: Convert from readpages to readahead
  iomap: Restructure iomap_readpages_actor
  iomap: Convert from readpages to readahead
  mm: Document why we don't set PageReadahead
  mm: Use memalloc_nofs_save in readahead path

 Documentation/filesystems/locking.rst |   6 +-
 Documentation/filesystems/vfs.rst     |  15 ++
 block/blk-core.c                      |   1 +
 drivers/staging/exfat/exfat_super.c   |   7 +-
 fs/block_dev.c                        |   7 +-
 fs/btrfs/extent_io.c                  |  46 ++---
 fs/btrfs/extent_io.h                  |   3 +-
 fs/btrfs/inode.c                      |  16 +-
 fs/erofs/data.c                       |  39 ++--
 fs/erofs/zdata.c                      |  29 +--
 fs/ext2/inode.c                       |  10 +-
 fs/ext4/ext4.h                        |   5 +-
 fs/ext4/inode.c                       |  21 +-
 fs/ext4/readpage.c                    |  25 +--
 fs/ext4/verity.c                      |  35 +---
 fs/f2fs/data.c                        |  50 ++---
 fs/f2fs/f2fs.h                        |   5 +-
 fs/f2fs/verity.c                      |  35 +---
 fs/fat/inode.c                        |   7 +-
 fs/fuse/file.c                        |  46 ++---
 fs/gfs2/aops.c                        |  23 +--
 fs/hpfs/file.c                        |   7 +-
 fs/iomap/buffered-io.c                | 124 +++++-------
 fs/iomap/trace.h                      |   2 +-
 fs/isofs/inode.c                      |   7 +-
 fs/jfs/inode.c                        |   7 +-
 fs/mpage.c                            |  38 +---
 fs/nilfs2/inode.c                     |  15 +-
 fs/ocfs2/aops.c                       |  34 ++--
 fs/omfs/file.c                        |   7 +-
 fs/qnx6/inode.c                       |   7 +-
 fs/reiserfs/inode.c                   |   8 +-
 fs/udf/inode.c                        |   7 +-
 fs/xfs/xfs_aops.c                     |  13 +-
 fs/zonefs/super.c                     |   7 +-
 include/linux/fs.h                    |   2 +
 include/linux/iomap.h                 |   3 +-
 include/linux/mm.h                    |  19 --
 include/linux/mpage.h                 |   4 +-
 include/linux/pagemap.h               | 103 ++++++++++
 include/trace/events/erofs.h          |   6 +-
 include/trace/events/f2fs.h           |   6 +-
 mm/fadvise.c                          |   6 +-
 mm/internal.h                         |  12 +-
 mm/migrate.c                          |   2 +-
 mm/readahead.c                        | 277 ++++++++++++++++----------
 46 files changed, 551 insertions(+), 603 deletions(-)


base-commit: 11a48a5a18c63fd7621bb050228cebf13566e4d8
--=20
2.25.0


