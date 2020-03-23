Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 56B5E18FF81
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Mar 2020 21:28:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584995279;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vn+hCEOS4cRRdTkgme4WwwTbyD6CxBDAtjFL2NL5mHM=;
	b=ad/+lULHajvilBEUShX3ksVwQ9gPoOiTNNOpAFMA6dyYj82DPaA7FNqxGgoVGzQ8VM3cAL
	fQ8gUWBCUf/8Ug4HID7AaxAWlUlgxKUeHMCe65nGthvP41vWS7EptRMsu7V4KOuPB1jIRZ
	Bi4rfsgEaZHi0XRY5dn3CkVhFy9Usm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-4UqLB0PjPiOtrLWD81zKnQ-1; Mon, 23 Mar 2020 16:27:34 -0400
X-MC-Unique: 4UqLB0PjPiOtrLWD81zKnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AF2C801E5C;
	Mon, 23 Mar 2020 20:27:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0DE49B932;
	Mon, 23 Mar 2020 20:27:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D323B18089CE;
	Mon, 23 Mar 2020 20:27:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NKNIK8014694 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 16:23:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CDBD42022EAD; Mon, 23 Mar 2020 20:23:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7D392022EB0
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 20:23:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C040B8FF661
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 20:23:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-371-XgxrbqG-O8ebeBvTWqFpvQ-1; Mon, 23 Mar 2020 16:23:14 -0400
X-MC-Unique: XgxrbqG-O8ebeBvTWqFpvQ-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jGTbB-0003US-CA; Mon, 23 Mar 2020 20:23:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 23 Mar 2020 13:22:34 -0700
Message-Id: <20200323202259.13363-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02NKNIK8014694
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v10 00/25] Change readahead API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This series adds a readahead address_space operation to replace the
readpages operation.  The key difference is that pages are added to the
page cache as they are allocated (and then looked up by the filesystem)
instead of passing them on a list to the readpages operation and having
the filesystem add them to the page cache.  It's a net reduction in
code for each implementation, more efficient than walking a list, and
solves the direct-write vs buffered-read problem reported by yu kuai at
https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huawei=
.com/

The only unconverted filesystems are those which use fscache.  Their
conversion is pending Dave Howells' rewrite which will make the conversion
substantially easier.  This should be completed by the end of the year.

I want to thank the reviewers/testers; Dave Chinner, John Hubbard,
Eric Biggers, Johannes Thumshirn, Dave Sterba, Zi Yan and Christoph
Hellwig have done a marvellous job of providing constructive criticism.

These patches pass an xfstests run on ext4, xfs & btrfs with no
regressions that I can tell (some of the tests seem a little flaky before
and remain flaky afterwards).

This series can also be found at
http://git.infradead.org/users/willy/linux-dax.git/shortlog/refs/tags/reada=
head_v10

v10: Rebased on linux-next 20200323
 - Collected some more reviewed-by tags
 - Simplify nr_to_read limits (Eric Biggers)
 - Convert fs/exfat instead of drivers/staging/exfat (Namjae Jeon)
 - Explicitly convert a pointer to a boolean in f2fs (Eric Biggers)

v9: No code changes.  Fixed a changelog and added some reviewed-by tags.

v8:
 - btrfs, ext4 and xfs all survive an xfstests run (thanks to Kent Overstre=
et
   for providing the ktest framework)
 - iomap restructuring dropped due to Christoph's opposition and the
   redesign of readahead_page() meaning it wasn't needed any more.
 - f2fs_mpage_readpages() made static again
 - Made iomap_readahead() comment more useful
 - Added kernel-doc for the entire readahead_control API
 - Conditionally zero batch_count in readahead_page() (requested by John)
 - Hold RCU read lock while iterating over the xarray in readahead_page_bat=
ch()
 - Iterate over the correct pages in readahead_page_batch()
 - Correct the return type of readahead_index() (spotted by Zi Yan)
 - Added a 'skip_page' parameter to read_pages for better documentation
   purposes and so we can reuse the readahead_control higher in the call
   chain in future.
 - Removed the use_list bool (requested by Christoph)
 - Removed the explicit initialisation of _nr_pages to 0 (requested by
   Christoph & John)
 - Add comments explaining why nr_to_read is being capped (requested by Joh=
n)
 - Reshuffled some of the patches:
   - Split out adding the readahead_control API from the three patches whic=
h
     added it piecemeal
   - Shift the final two mm patches to be with the other mm patches
   - Split the f2fs "pass the inode" patch from the "convert to readahead"
     patch, like ext4

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

Matthew Wilcox (Oracle) (25):
  mm: Move readahead prototypes from mm.h
  mm: Return void from various readahead functions
  mm: Ignore return value of ->readpages
  mm: Move readahead nr_pages check into read_pages
  mm: Add new readahead_control API
  mm: Use readahead_control to pass arguments
  mm: Rename various 'offset' parameters to 'index'
  mm: rename readahead loop variable to 'i'
  mm: Remove 'page_offset' from readahead loop
  mm: Put readahead pages in cache earlier
  mm: Add readahead address space operation
  mm: Move end_index check out of readahead loop
  mm: Add page_cache_readahead_unbounded
  mm: Document why we don't set PageReadahead
  mm: Use memalloc_nofs_save in readahead path
  fs: Convert mpage_readpages to mpage_readahead
  btrfs: Convert from readpages to readahead
  erofs: Convert uncompressed files from readpages to readahead
  erofs: Convert compressed files from readpages to readahead
  ext4: Convert from readpages to readahead
  ext4: Pass the inode to ext4_mpage_readpages
  f2fs: Convert from readpages to readahead
  f2fs: Pass the inode to f2fs_mpage_readpages
  fuse: Convert from readpages to readahead
  iomap: Convert from readpages to readahead

 Documentation/filesystems/locking.rst |   6 +-
 Documentation/filesystems/vfs.rst     |  15 ++
 block/blk-core.c                      |   1 +
 fs/block_dev.c                        |   7 +-
 fs/btrfs/extent_io.c                  |  43 ++--
 fs/btrfs/extent_io.h                  |   3 +-
 fs/btrfs/inode.c                      |  16 +-
 fs/erofs/data.c                       |  39 ++--
 fs/erofs/zdata.c                      |  29 +--
 fs/exfat/inode.c                      |   7 +-
 fs/ext2/inode.c                       |  10 +-
 fs/ext4/ext4.h                        |   5 +-
 fs/ext4/inode.c                       |  21 +-
 fs/ext4/readpage.c                    |  25 +--
 fs/ext4/verity.c                      |  35 +---
 fs/f2fs/data.c                        |  50 ++---
 fs/f2fs/f2fs.h                        |   3 -
 fs/f2fs/verity.c                      |  35 +---
 fs/fat/inode.c                        |   7 +-
 fs/fuse/file.c                        |  46 ++---
 fs/gfs2/aops.c                        |  23 +--
 fs/hpfs/file.c                        |   7 +-
 fs/iomap/buffered-io.c                |  92 +++------
 fs/iomap/trace.h                      |   2 +-
 fs/isofs/inode.c                      |   7 +-
 fs/jfs/inode.c                        |   7 +-
 fs/mpage.c                            |  38 ++--
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
 include/linux/pagemap.h               | 151 ++++++++++++++
 include/trace/events/erofs.h          |   6 +-
 include/trace/events/f2fs.h           |   6 +-
 mm/fadvise.c                          |   6 +-
 mm/internal.h                         |  12 +-
 mm/migrate.c                          |   2 +-
 mm/readahead.c                        | 275 ++++++++++++++++----------
 46 files changed, 575 insertions(+), 588 deletions(-)

base-commit: 5149100c3aebe5e640d6ff68e0b5e5a7eb8638e0
--=20
2.25.1


