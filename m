Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F80F6D684A
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624295;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oD3C5F3LGtukmBxzahEExE7hRIVYDTE1CCzX3qZAvIY=;
	b=GP2EM22QHPNzd9aDgfJ5El1ObKGLZm113+cobqvqqreU9SW3FYJ8A2KrCRkTatna/DdPjp
	XWOOar+pkf1zk7Zsmw9Xe4dCAGKSmB3OUAv4cQQFdSWwZlDUWRWztJISeVOAdLW/RAyBJ7
	w8PDxX/nxUt5gzpdGhZIrGLCpot/m0I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-SPWwiFEpNyuBQCkQ-g2r_w-1; Tue, 04 Apr 2023 12:04:32 -0400
X-MC-Unique: SPWwiFEpNyuBQCkQ-g2r_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF26D89971A;
	Tue,  4 Apr 2023 16:02:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B47A4C1602A;
	Tue,  4 Apr 2023 16:02:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7A60B1946A78;
	Tue,  4 Apr 2023 16:02:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BF656194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:54:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B36B6440D6; Tue,  4 Apr 2023 14:54:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC271440BC
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:54:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B9E3101A552
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:54:42 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-dq4aBH77P3KBCGfi8u_k4A-1; Tue, 04 Apr 2023 10:54:41 -0400
X-MC-Unique: dq4aBH77P3KBCGfi8u_k4A-1
Received: by mail-qt1-f198.google.com with SMTP id
 a19-20020a05622a02d300b003e4ecb5f613so16798235qtx.21
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oD3C5F3LGtukmBxzahEExE7hRIVYDTE1CCzX3qZAvIY=;
 b=ybttDN7yjGnJkPTMCtS3LikvzkNQccn/fU8Vpvf943TlQt1vr1J4uAHW4/alkF9m3a
 6x7HWwRGPZhbfqi4bPr+j4OU8EDwajcH9+fQCDlqqoaBJRj6Rs7lfIOXwmEHBH1Y8Cc4
 OBfR32q9hayyIt+ZUesplcdsP79rtwrPR5r7NFAkdGeIPnsPHb9rx1FhNsYLXkBBk2By
 xkTTrKmI5Kmvoj9Y1gQpx+srDTFytVxzb8uECTGqgJgxDlpx6wPCN23sgn6j8wmPGRx7
 cC1I6OT3YPtW7MKSTFdHD/isTfP/aBtjT/frzdWgmrwx+GbK4IevYCPqhcTI61yjT8ru
 sHpw==
X-Gm-Message-State: AAQBX9ed1bXx5U+rc5BDV0L+0ShSpFpUs0Fng9STopUHHjKnQGRygYso
 t60kV6TFPj53WXAhfHhkNvxJiSrOjioNbJJZzaTfXVE0PyJM+QMIPGZKapt6x2pknQAnV+gI1ER
 jaiR8c29/519ut1c/O7LH
X-Received: by 2002:a05:622a:183:b0:3e4:9f9a:54b2 with SMTP id
 s3-20020a05622a018300b003e49f9a54b2mr3125039qtw.65.1680620080399; 
 Tue, 04 Apr 2023 07:54:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350aQaTUsx1W6QCtRYW4E/BPPbSUPOo7MRSxPdoArP74ywpcoKBragJvpDtJCE5UocjgeAZeoJA==
X-Received: by 2002:a05:622a:183:b0:3e4:9f9a:54b2 with SMTP id
 s3-20020a05622a018300b003e49f9a54b2mr3124990qtw.65.1680620080023; 
 Tue, 04 Apr 2023 07:54:40 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:54:39 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:52:56 +0200
Message-Id: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 00/23] fs-verity support for XFS
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
Cc: linux-ext4@vger.kernel.org, damien.lemoal@opensource.wdc.com,
 chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi all,

This is V2 of fs-verity support in XFS. In this series I did
numerous changes from V1 which are described below.

This patchset introduces fs-verity [5] support for XFS. This
implementation utilizes extended attributes to store fs-verity
metadata. The Merkle tree blocks are stored in the remote extended
attributes.

A few key points:
- fs-verity metadata is stored in extended attributes
- Direct path and DAX are disabled for inodes with fs-verity
- Pages are verified in iomap's read IO path (offloaded to
  workqueue)
- New workqueue for verification processing
- New ro-compat flag
- Inodes with fs-verity have new on-disk diflag
- xfs_attr_get() can return buffer with the attribute

The patchset is tested with xfstests -g auto on xfs_1k, xfs_4k,
xfs_1k_quota, and xfs_4k_quota. Haven't found any major failures.

Patches [6/23] and [7/23] touch ext4, f2fs, btrfs, and patch [8/23]
touches erofs, gfs2, and zonefs.

The patchset consist of four parts:
- [1..4]: Patches from Parent Pointer patchset which add binary
          xattr names with a few deps
- [5..7]: Improvements to core fs-verity
- [8..9]: Add read path verification to iomap
- [10..23]: Integration of fs-verity to xfs

Changes from V1:
- Added parent pointer patches for easier testing
- Many issues and refactoring points fixed from the V1 review
- Adjusted for recent changes in fs-verity core (folios, non-4k)
- Dropped disabling of large folios
- Completely new fsverity patches (fix, callout, log_blocksize)
- Change approach to verification in iomap to the same one as in
  write path. Callouts to fs instead of direct fs-verity use.
- New XFS workqueue for post read folio verification
- xfs_attr_get() can return underlying xfs_buf
- xfs_bufs are marked with XBF_VERITY_CHECKED to track verified
  blocks

kernel:
[1]: https://github.com/alberand/linux/tree/xfs-verity-v2

xfsprogs:
[2]: https://github.com/alberand/xfsprogs/tree/fsverity-v2

xfstests:
[3]: https://github.com/alberand/xfstests/tree/fsverity-v2

v1:
[4]: https://lore.kernel.org/linux-xfs/20221213172935.680971-1-aalbersh@redhat.com/

fs-verity:
[5]: https://www.kernel.org/doc/html/latest/filesystems/fsverity.html

Thanks,
Andrey

Allison Henderson (4):
  xfs: Add new name to attri/d
  xfs: add parent pointer support to attribute code
  xfs: define parent pointer xattr format
  xfs: Add xfs_verify_pptr

Andrey Albershteyn (19):
  fsverity: make fsverity_verify_folio() accept folio's offset and size
  fsverity: add drop_page() callout
  fsverity: pass Merkle tree block size to ->read_merkle_tree_page()
  iomap: hoist iomap_readpage_ctx from the iomap_readahead/_folio
  iomap: allow filesystem to implement read path verification
  xfs: add XBF_VERITY_CHECKED xfs_buf flag
  xfs: add XFS_DA_OP_BUFFER to make xfs_attr_get() return buffer
  xfs: introduce workqueue for post read IO work
  xfs: add iomap's readpage operations
  xfs: add attribute type for fs-verity
  xfs: add fs-verity ro-compat flag
  xfs: add inode on-disk VERITY flag
  xfs: initialize fs-verity on file open and cleanup on inode
    destruction
  xfs: don't allow to enable DAX on fs-verity sealsed inode
  xfs: disable direct read path for fs-verity sealed files
  xfs: add fs-verity support
  xfs: handle merkle tree block size != fs blocksize != PAGE_SIZE
  xfs: add fs-verity ioctls
  xfs: enable ro-compat fs-verity flag

 fs/btrfs/verity.c               |  15 +-
 fs/erofs/data.c                 |  12 +-
 fs/ext4/verity.c                |   9 +-
 fs/f2fs/verity.c                |   9 +-
 fs/gfs2/aops.c                  |  10 +-
 fs/ioctl.c                      |   4 +
 fs/iomap/buffered-io.c          |  89 ++++++-----
 fs/verity/read_metadata.c       |   7 +-
 fs/verity/verify.c              |   9 +-
 fs/xfs/Makefile                 |   1 +
 fs/xfs/libxfs/xfs_attr.c        |  81 +++++++++-
 fs/xfs/libxfs/xfs_attr.h        |   7 +-
 fs/xfs/libxfs/xfs_attr_leaf.c   |   7 +
 fs/xfs/libxfs/xfs_attr_remote.c |  13 +-
 fs/xfs/libxfs/xfs_da_btree.h    |   7 +-
 fs/xfs/libxfs/xfs_da_format.h   |  46 +++++-
 fs/xfs/libxfs/xfs_format.h      |  14 +-
 fs/xfs/libxfs/xfs_log_format.h  |   8 +-
 fs/xfs/libxfs/xfs_sb.c          |   2 +
 fs/xfs/scrub/attr.c             |   4 +-
 fs/xfs/xfs_aops.c               |  61 +++++++-
 fs/xfs/xfs_attr_item.c          | 142 +++++++++++++++---
 fs/xfs/xfs_attr_item.h          |   1 +
 fs/xfs/xfs_attr_list.c          |  17 ++-
 fs/xfs/xfs_buf.h                |  17 ++-
 fs/xfs/xfs_file.c               |  22 ++-
 fs/xfs/xfs_inode.c              |   2 +
 fs/xfs/xfs_inode.h              |   3 +-
 fs/xfs/xfs_ioctl.c              |  22 +++
 fs/xfs/xfs_iomap.c              |  14 ++
 fs/xfs/xfs_iops.c               |   4 +
 fs/xfs/xfs_linux.h              |   1 +
 fs/xfs/xfs_mount.h              |   3 +
 fs/xfs/xfs_ondisk.h             |   4 +
 fs/xfs/xfs_super.c              |  19 +++
 fs/xfs/xfs_trace.h              |   1 +
 fs/xfs/xfs_verity.c             | 256 ++++++++++++++++++++++++++++++++
 fs/xfs/xfs_verity.h             |  27 ++++
 fs/xfs/xfs_xattr.c              |   9 ++
 fs/zonefs/file.c                |  12 +-
 include/linux/fsverity.h        |  18 ++-
 include/linux/iomap.h           |  39 ++++-
 include/uapi/linux/fs.h         |   1 +
 43 files changed, 923 insertions(+), 126 deletions(-)
 create mode 100644 fs/xfs/xfs_verity.c
 create mode 100644 fs/xfs/xfs_verity.h

-- 
2.38.4

