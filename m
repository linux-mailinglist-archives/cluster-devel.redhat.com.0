Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1603B65DE27
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672866907;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XF0rWcwOaeOy9W3XDndGOlTI6VOcqMAlw6Z0kSP+ZIE=;
	b=amYj836eLv33oqpYwuXUiPBWSQEYdrhVZpqcLpwJIkA1CID4D3sNXcb8bDABbENgoOHogg
	qljs2jwd73yQ7kvqa/SAE6egW3HdCKFo/1jGP2uPb4XpeCZI3pWsqJDoskzmhBS+gdzY1a
	+kTwu+WQfr+WKcFYhhPDRq2k/Fzp0ms=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-YrOi_nJrOB2xHBYRfFHC1A-1; Wed, 04 Jan 2023 16:15:01 -0500
X-MC-Unique: YrOi_nJrOB2xHBYRfFHC1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16086280BCA3;
	Wed,  4 Jan 2023 21:15:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DFB7C15BA0;
	Wed,  4 Jan 2023 21:15:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E461D194658F;
	Wed,  4 Jan 2023 21:14:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8B4211946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 21:14:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 69BED14171B6; Wed,  4 Jan 2023 21:14:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62011140EBF5
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:14:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45EBC80234E
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:14:58 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-IMdbbxAjPqSYuiNz2okWHw-1; Wed, 04 Jan 2023 16:14:56 -0500
X-MC-Unique: IMdbbxAjPqSYuiNz2okWHw-1
Received: by mail-pj1-f52.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so2112524pjb.0
 for <cluster-devel@redhat.com>; Wed, 04 Jan 2023 13:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XF0rWcwOaeOy9W3XDndGOlTI6VOcqMAlw6Z0kSP+ZIE=;
 b=GR8s+y1jG739NYPg/O0uZmLRs+hwxhF6ygvK3TaBvVJEr8r0/V0kprqpblILdIZVlP
 WJCNDCws2RqrQ93IOEnBEQZBDXE144NTm+hBVPBJQQW+B9E1rQcflUI1eHvLpj4E5C8C
 nme2Ia6jCiFMPxZocV44513aA+aSRCl+Vd6OWhhgsuvkI/v4vArJjqkoaoP/JMmqsR1H
 4TtieyPzOHvwRJRflC4o1GTlUvmjjXviv5QpqAkKu3NGiaSo7bsM8YCL9kQN/nacpKuD
 UD31JXhd+/rhvmdJeBQPHbedS8pz33nqKcInihxFI95AYoR6ogQiW3Wj8mmEl5QK7Mdf
 V78w==
X-Gm-Message-State: AFqh2koEFOcclUkhvt+X8EsGKXk3NLibIWAdmrVqdxaT1PKpRc0HGigK
 5hPhIbIwwvy8AEzQC/TFJX4=
X-Google-Smtp-Source: AMrXdXuHWcLr2ISD1AWLN6noveXBmNIMzDKhC6iHCDPkCElkMLkDu5P/j13SKsDU15gZnXatqrr41A==
X-Received: by 2002:a17:90a:cc0b:b0:219:5955:7570 with SMTP id
 b11-20020a17090acc0b00b0021959557570mr23943541pju.46.1672866895416; 
 Wed, 04 Jan 2023 13:14:55 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:14:54 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:25 -0800
Message-Id: <20230104211448.4804-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v5 00/23] Convert to filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch series replaces find_get_pages_range_tag() with
filemap_get_folios_tag(). This also allows the removal of multiple
calls to compound_head() throughout.
It also makes a good chunk of the straightforward conversions to folios,
and takes the opportunity to introduce a function that grabs a folio
from the pagecache.

I've run xfstests on xfs, btrfs, ext4, f2fs, and nilfs2, but more testing may
be beneficial. The page-writeback and filemap changes implicitly work. Still
looking for review of cifs, gfs2, and ext4.

---
v5:
  Rebased onto upstream 6.2-rc2
  Filesystems modified to use folio_get() instead of folio_ref_inc()
  F2fs modified to maintain use of F2FS_ONSTACK_PAGES

v4:
  Fixed a bug with reference counting in cifs changes
  - Reported-by: kernel test robot <oliver.sang@intel.com> 
  Improved commit messages to be more meaningful
  Got some Acked-bys and Reviewed-bys

v3:
  Rebased onto upstream 6.1
  Simplified the ceph patch to only necessary changes
  Changed commit messages throughout to be clearer
  Got an Acked-by for another nilfs patch
  Got Tested-by for afs

v2:
  Got Acked-By tags for nilfs and btrfs changes
  Fixed an error arising in f2fs
  - Reported-by: kernel test robot <lkp@intel.com>

Vishal Moola (Oracle) (23):
  pagemap: Add filemap_grab_folio()
  filemap: Added filemap_get_folios_tag()
  filemap: Convert __filemap_fdatawait_range() to use
    filemap_get_folios_tag()
  page-writeback: Convert write_cache_pages() to use
    filemap_get_folios_tag()
  afs: Convert afs_writepages_region() to use filemap_get_folios_tag()
  btrfs: Convert btree_write_cache_pages() to use
    filemap_get_folio_tag()
  btrfs: Convert extent_write_cache_pages() to use
    filemap_get_folios_tag()
  ceph: Convert ceph_writepages_start() to use filemap_get_folios_tag()
  cifs: Convert wdata_alloc_and_fillpages() to use
    filemap_get_folios_tag()
  ext4: Convert mpage_prepare_extent_to_map() to use
    filemap_get_folios_tag()
  f2fs: Convert f2fs_fsync_node_pages() to use filemap_get_folios_tag()
  f2fs: Convert f2fs_flush_inline_data() to use filemap_get_folios_tag()
  f2fs: Convert f2fs_sync_node_pages() to use filemap_get_folios_tag()
  f2fs: Convert f2fs_write_cache_pages() to use filemap_get_folios_tag()
  f2fs: Convert last_fsync_dnode() to use filemap_get_folios_tag()
  f2fs: Convert f2fs_sync_meta_pages() to use filemap_get_folios_tag()
  gfs2: Convert gfs2_write_cache_jdata() to use filemap_get_folios_tag()
  nilfs2: Convert nilfs_lookup_dirty_data_buffers() to use
    filemap_get_folios_tag()
  nilfs2: Convert nilfs_lookup_dirty_node_buffers() to use
    filemap_get_folios_tag()
  nilfs2: Convert nilfs_btree_lookup_dirty_buffers() to use
    filemap_get_folios_tag()
  nilfs2: Convert nilfs_copy_dirty_pages() to use
    filemap_get_folios_tag()
  nilfs2: Convert nilfs_clear_dirty_pages() to use
    filemap_get_folios_tag()
  filemap: Remove find_get_pages_range_tag()

 fs/afs/write.c          | 116 ++++++++++++++++++++--------------------
 fs/btrfs/extent_io.c    |  57 ++++++++++----------
 fs/ceph/addr.c          |  58 ++++++++++----------
 fs/cifs/file.c          |  32 +++++++++--
 fs/ext4/inode.c         |  65 +++++++++++-----------
 fs/f2fs/checkpoint.c    |  49 +++++++++--------
 fs/f2fs/data.c          |  84 ++++++++++++++++++++---------
 fs/f2fs/node.c          |  72 +++++++++++++------------
 fs/gfs2/aops.c          |  64 ++++++++++++----------
 fs/nilfs2/btree.c       |  14 ++---
 fs/nilfs2/page.c        |  59 ++++++++++----------
 fs/nilfs2/segment.c     |  44 +++++++--------
 include/linux/pagemap.h |  32 +++++++----
 include/linux/pagevec.h |   8 ---
 mm/filemap.c            |  84 ++++++++++++++---------------
 mm/page-writeback.c     |  44 +++++++--------
 mm/swap.c               |  10 ----
 17 files changed, 481 insertions(+), 411 deletions(-)

-- 
2.38.1

