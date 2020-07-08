Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D05D1219258
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jul 2020 23:20:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-nqGb2cDOOjqIGIxZtl75xg-1; Wed, 08 Jul 2020 17:19:59 -0400
X-MC-Unique: nqGb2cDOOjqIGIxZtl75xg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E4B2E918;
	Wed,  8 Jul 2020 21:19:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E1155C1B2;
	Wed,  8 Jul 2020 21:19:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D73393F70;
	Wed,  8 Jul 2020 21:19:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068LJnU4009683 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 17:19:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B6902026D69; Wed,  8 Jul 2020 21:19:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36A23215ADC1
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 21:19:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 073CF857CF5
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 21:19:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-509-w6aLiJZpNS-zISrO4bNcMA-1;
	Wed, 08 Jul 2020 17:19:44 -0400
X-MC-Unique: w6aLiJZpNS-zISrO4bNcMA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D73E1AC91;
	Wed,  8 Jul 2020 21:19:43 +0000 (UTC)
From: Goldwyn Rodrigues <rgoldwyn@suse.de>
To: linux-btrfs@vger.kernel.org
Date: Wed,  8 Jul 2020 16:19:20 -0500
Message-Id: <20200708211926.7706-1-rgoldwyn@suse.de>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 068LJnU4009683
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, darrick.wong@oracle.com,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, hch@lst.de
Subject: [Cluster-devel] [PATCH 0/6 v11] btrfs direct-io using iomap
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This is an effort to use iomap for direct I/O in btrfs. This would
change the call from __blockdev_direct_io() to iomap_dio_rw().
These are remanants of the series which was revoked due to page
invalidation errors and adds patches in iomap for proper buffered
fallback.

The main objective is to lose the buffer head and use bio defined by
iomap code, and to use more of generic-FS codebase.

These patches are based and tested on vanilla. I have tested it against
xfstests.

The tree is available at
https://github.com/goldwynr/linux/tree/btrfs-iomap-dio

Changes since v1
- Incorporated back the efficiency change for inode locking
- Review comments about coding style and git comments
- Merge related patches into one
- Direct read to go through btrfs_direct_IO()
- Removal of no longer used function dio_end_io()

Changes since v2
- aligning iomap offset/length to the position/length of I/O
- Removed btrfs_dio_data
- Removed BTRFS_INODE_READDIO_NEED_LOCK
- Re-incorporating write efficiency changes caused lockdep_assert() in
  iomap to be triggered, remove that code.

Changes since v3
- Fixed freeze on generic/095. Use iomap_end() to account for
  failed/incomplete dio instead of btrfs_dio_data

Changes since v4
- moved lockdep_assert_held() to functions calling iomap_dio_rw()
  This may be called immidiately after calling inode lock and
  may feel not required, but it seems important.
- Removed comments which are no longer required
- Changed commit comments to make them more appropriate

Changes since v5
- restore inode_dio_wait() in truncate
- Removed lockdep_assert_held() near callers
Changes since v6
- Fixed hangs due to underlying device failures
- Removed the patch to wait while releasing pages

Changes since v7
- Moved reservation into btrfs iomap begin()/end() for correct
  reservation cleanup in case of device error.
- Merged patches switch to iomap, and adding btrfs_iomap_end()
  for easier bisection. The switch to iomap would fail in case
  of dio after buffered writes.

Changes since v8
- Added a flag to iomap_dio_rw() to return zero for buffered fallback

Changes since v9
- flag name changes for iomap_dio_rw()

Changes since v10
- flag datatype changed to unsigned int

 fs/btrfs/Kconfig       |    1
 fs/btrfs/btrfs_inode.h |   18 --
 fs/btrfs/ctree.h       |    5
 fs/btrfs/file.c        |  116 ++++++++++++--
 fs/btrfs/inode.c       |  402 ++++++++++++++++++-------------------------------
 fs/direct-io.c         |   19 --
 fs/ext4/file.c         |   11 +
 fs/gfs2/file.c         |   14 +
 fs/iomap/direct-io.c   |   11 +
 fs/xfs/xfs_file.c      |   15 +
 fs/zonefs/super.c      |   16 +
 include/linux/fs.h     |    2
 include/linux/iomap.h  |   25 ++-
 13 files changed, 335 insertions(+), 320 deletions(-)

--
Goldwyn




