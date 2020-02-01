Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D299D14F83F
	for <lists+cluster-devel@lfdr.de>; Sat,  1 Feb 2020 16:13:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580569987;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rOy04demGIueQFZv2x/fQk/LhPg1H/M0+ZJhKWDMeLc=;
	b=Jb7gV4jmYOo/yG9HgAZ2JtxGoNEbxzk+z/Dhig7CsLLfBTJ6bHAgCLn9GohsrG8KCyKkXJ
	OC6PYCUHdazZ6m7T4qvSrV1ACXwzRqs9KwE6yX5HluulBPgcfmJHC8l6Y7z4PROnfnZ6Fb
	mpBiNVdr9GyhcMrVWKvNCY6SDpNbfyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-sads_o9WPJKNYdXwyHR_wQ-1; Sat, 01 Feb 2020 10:13:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05AEA100726A;
	Sat,  1 Feb 2020 15:13:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A96F8BE37;
	Sat,  1 Feb 2020 15:12:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6176718089CE;
	Sat,  1 Feb 2020 15:12:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 011FCsB9030094 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 1 Feb 2020 10:12:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 067649C61E; Sat,  1 Feb 2020 15:12:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01D24A484D
	for <cluster-devel@redhat.com>; Sat,  1 Feb 2020 15:12:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73FD6800295
	for <cluster-devel@redhat.com>; Sat,  1 Feb 2020 15:12:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-351-6y5LKTLrO2WqrOM0Me7JXA-1; Sat, 01 Feb 2020 10:12:49 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1ixuRu-0006HE-1K; Sat, 01 Feb 2020 15:12:42 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sat,  1 Feb 2020 07:12:28 -0800
Message-Id: <20200201151240.24082-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: 6y5LKTLrO2WqrOM0Me7JXA-1
X-MC-Unique: sads_o9WPJKNYdXwyHR_wQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 011FCsB9030094
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v4 00/12] Change readahead API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

I would particularly value feedback on this from the gfs2 and ocfs2
maintainers.  They have non-trivial changes, and a review on patch 5
would be greatly appreciated.

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

v4:
 - Rebase on current Linus (a62aa6f7f50a ("Merge tag 'gfs2-for-5.6'"))
 - Add comment to __do_page_cache_readahead() acknowledging we don't
   care _that_ much about setting PageReadahead.
 - Fix the return value check of add_to_page_cache_lru().
 - Add a missing call to put_page() in __do_page_cache_readahead() if
   we fail to insert the page.
 - Improve the documentation of ->readahead (including indentation
   problem identified by Randy).
 - Fix off by one error in read_pages() (Dave Chinner).
 - Fix nr_pages manipulation in btrfs (Dave Chinner).
 - Remove bogus refcount fix in erofs (Gao Xiang, Dave Chinner).
 - Update ext4 patch for Merkle tree readahead.
 - Update f2fs patch for Merkle tree readahead.
 - Reinstate next_page label in f2fs_readpages() now it's used by the
   compression code.
 - Reinstate call to fuse_wait_on_page_writeback (Miklos Szeredi).
 - Remove a double-unlock in the error path in fuse.
 - Remove an odd fly-speck in fuse_readpages().
 - Make nr_pages loop in fuse_readpages less convoluted (Dave Chinner).

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
 Documentation/filesystems/vfs.rst     | 14 +++++
 drivers/staging/exfat/exfat_super.c   |  9 +--
 fs/block_dev.c                        |  9 +--
 fs/btrfs/extent_io.c                  | 19 +++---
 fs/btrfs/extent_io.h                  |  2 +-
 fs/btrfs/inode.c                      | 18 +++---
 fs/erofs/data.c                       | 33 ++++------
 fs/erofs/zdata.c                      | 21 +++----
 fs/ext2/inode.c                       | 12 ++--
 fs/ext4/ext4.h                        |  5 +-
 fs/ext4/inode.c                       | 24 ++++----
 fs/ext4/readpage.c                    | 20 +++---
 fs/ext4/verity.c                      | 16 +++--
 fs/f2fs/data.c                        | 35 +++++------
 fs/f2fs/f2fs.h                        |  5 +-
 fs/f2fs/verity.c                      | 16 +++--
 fs/fat/inode.c                        |  8 +--
 fs/fuse/file.c                        | 37 +++++------
 fs/gfs2/aops.c                        | 20 +++---
 fs/hpfs/file.c                        |  8 +--
 fs/iomap/buffered-io.c                | 74 +++++-----------------
 fs/iomap/trace.h                      |  2 +-
 fs/isofs/inode.c                      |  9 +--
 fs/jfs/inode.c                        |  8 +--
 fs/mpage.c                            | 38 ++++--------
 fs/nilfs2/inode.c                     | 13 ++--
 fs/ocfs2/aops.c                       | 32 +++++-----
 fs/omfs/file.c                        |  8 +--
 fs/qnx6/inode.c                       |  8 +--
 fs/reiserfs/inode.c                   | 10 +--
 fs/udf/inode.c                        |  8 +--
 fs/xfs/xfs_aops.c                     | 10 +--
 include/linux/fs.h                    |  2 +
 include/linux/iomap.h                 |  2 +-
 include/linux/mpage.h                 |  2 +-
 include/linux/pagemap.h               | 12 ++++
 include/trace/events/erofs.h          |  6 +-
 include/trace/events/f2fs.h           |  6 +-
 mm/internal.h                         |  2 +-
 mm/migrate.c                          |  2 +-
 mm/readahead.c                        | 89 ++++++++++++++++++---------
 42 files changed, 332 insertions(+), 349 deletions(-)

--=20
2.24.1


