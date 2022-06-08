Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A57CE54360A
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jun 2022 17:06:44 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-heZLHhMRO_Cqfh3iHHwfKA-1; Wed, 08 Jun 2022 11:06:39 -0400
X-MC-Unique: heZLHhMRO_Cqfh3iHHwfKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B081185A589;
	Wed,  8 Jun 2022 15:06:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A23D09D7F;
	Wed,  8 Jun 2022 15:06:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2ABBC1947055;
	Wed,  8 Jun 2022 15:06:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CA4251947061 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  8 Jun 2022 15:03:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ADB5FC53361; Wed,  8 Jun 2022 15:03:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9C25C53360
 for <cluster-devel@redhat.com>; Wed,  8 Jun 2022 15:03:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8ACD92949BA6
 for <cluster-devel@redhat.com>; Wed,  8 Jun 2022 15:03:31 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-K3lKATHxPPWCsCOLj3zxaw-1; Wed, 08 Jun 2022 11:03:29 -0400
X-MC-Unique: K3lKATHxPPWCsCOLj3zxaw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyxCt-00CjFE-KF; Wed, 08 Jun 2022 15:02:51 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  8 Jun 2022 16:02:30 +0100
Message-Id: <20220608150249.3033815-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Cluster-devel] [PATCH v2 00/19] Convert aops->migratepage to
 aops->migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

We're getting to the last aops that take a struct page.  The only
remaining ones are ->writepage, ->write_begin, ->write_end and
->error_remove_page.

Changes from v1:
 - Remove ->isolate_page from secretmem
 - Split the movable_operations from address_space_operations
 - Drop the conversions of balloon, zsmalloc and z3fold
 - Fix the build errors with hugetlbfs
 - Fix the kerneldoc errors
 - Fix the ;; typo

Matthew Wilcox (Oracle) (19):
  secretmem: Remove isolate_page
  mm: Convert all PageMovable users to movable_operations
  fs: Add aops->migrate_folio
  mm/migrate: Convert fallback_migrate_page() to
    fallback_migrate_folio()
  mm/migrate: Convert writeout() to take a folio
  mm/migrate: Convert buffer_migrate_page() to buffer_migrate_folio()
  mm/migrate: Convert expected_page_refs() to folio_expected_refs()
  btrfs: Convert btree_migratepage to migrate_folio
  nfs: Convert to migrate_folio
  mm/migrate: Convert migrate_page() to migrate_folio()
  mm/migrate: Add filemap_migrate_folio()
  btrfs: Convert btrfs_migratepage to migrate_folio
  ubifs: Convert to filemap_migrate_folio()
  f2fs: Convert to filemap_migrate_folio()
  aio: Convert to migrate_folio
  hugetlb: Convert to migrate_folio
  secretmem: Convert to migrate_folio
  fs: Remove aops->migratepage()
  mm/folio-compat: Remove migration compatibility functions

 Documentation/filesystems/locking.rst       |   5 +-
 Documentation/filesystems/vfs.rst           |  13 +-
 Documentation/vm/page_migration.rst         |  33 +--
 arch/powerpc/platforms/pseries/cmm.c        |  60 +----
 block/fops.c                                |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |   4 +-
 drivers/misc/vmw_balloon.c                  |  61 +----
 drivers/virtio/virtio_balloon.c             |  47 +---
 fs/aio.c                                    |  36 +--
 fs/btrfs/disk-io.c                          |  22 +-
 fs/btrfs/inode.c                            |  26 +--
 fs/ext2/inode.c                             |   4 +-
 fs/ext4/inode.c                             |   4 +-
 fs/f2fs/checkpoint.c                        |   4 +-
 fs/f2fs/data.c                              |  40 +---
 fs/f2fs/f2fs.h                              |   4 -
 fs/f2fs/node.c                              |   4 +-
 fs/gfs2/aops.c                              |   2 +-
 fs/hugetlbfs/inode.c                        |  23 +-
 fs/iomap/buffered-io.c                      |  25 --
 fs/nfs/file.c                               |   4 +-
 fs/nfs/internal.h                           |   6 +-
 fs/nfs/write.c                              |  16 +-
 fs/ntfs/aops.c                              |   6 +-
 fs/ocfs2/aops.c                             |   2 +-
 fs/ubifs/file.c                             |  29 +--
 fs/xfs/xfs_aops.c                           |   2 +-
 fs/zonefs/super.c                           |   2 +-
 include/linux/balloon_compaction.h          |   6 +-
 include/linux/buffer_head.h                 |  10 +
 include/linux/fs.h                          |  20 +-
 include/linux/iomap.h                       |   6 -
 include/linux/migrate.h                     |  48 ++--
 include/linux/page-flags.h                  |   2 +-
 include/linux/pagemap.h                     |   6 +
 include/uapi/linux/magic.h                  |   4 -
 mm/balloon_compaction.c                     |  10 +-
 mm/compaction.c                             |  34 ++-
 mm/folio-compat.c                           |  22 --
 mm/ksm.c                                    |   2 +-
 mm/migrate.c                                | 238 ++++++++++++--------
 mm/migrate_device.c                         |   3 +-
 mm/secretmem.c                              |  13 +-
 mm/shmem.c                                  |   2 +-
 mm/swap_state.c                             |   2 +-
 mm/util.c                                   |   4 +-
 mm/z3fold.c                                 |  82 +------
 mm/zsmalloc.c                               | 102 ++-------
 48 files changed, 367 insertions(+), 735 deletions(-)

-- 
2.35.1

