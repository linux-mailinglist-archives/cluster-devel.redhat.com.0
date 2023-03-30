Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA156D0190
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 12:44:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680173058;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4c14CSmBtLh/HzpUYK0sfFAMpnWnZ9ahyS+6TCPJU1k=;
	b=PiyCspJeJGdYsCeX0VQo2Mfr4JbUraAVsabSvp+blTg7LUfijOigr+qKEs8/rfu78Hn6sL
	51hMo2rDoUd57vF7e047QQp9xp4fu408RLgzN6WGWSyZoF3C5qnr5BkGZ9gpv4LB0MM8hw
	jPHtlhO3LFAwlkc0t1+XeA2TzFsvxxM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-LWCAvSveOASmHHjXeKtRhg-1; Thu, 30 Mar 2023 06:44:15 -0400
X-MC-Unique: LWCAvSveOASmHHjXeKtRhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97BB028135A4;
	Thu, 30 Mar 2023 10:44:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88A942166B34;
	Thu, 30 Mar 2023 10:44:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 42DED19465A2;
	Thu, 30 Mar 2023 10:44:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 94ECC1946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Mar 2023 10:44:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 71B98C15BB8; Thu, 30 Mar 2023 10:44:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A5A4C15BA0
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 10:44:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A36A858F0E
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 10:44:12 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-jJZraR6vNyqm55S1_QJAPw-1; Thu, 30 Mar 2023 06:44:08 -0400
X-MC-Unique: jJZraR6vNyqm55S1_QJAPw-1
X-IronPort-AV: E=Sophos;i="5.98,303,1673884800"; d="scan'208";a="338948060"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 18:44:06 +0800
IronPort-SDR: LMA19PMHZQczmcUKFUYaWF4AF/7t5pHQ0E+YCOrR1pQzsN06NfisNPh7Gf7rkby6xioyzTIlLZ
 FK6+shiNVu3wy/icfZQU6LFXawh+LZFjDjaIKoGSr78Dv0jG1M9DGXLjI6y/YdAACCyS2rWrao
 XsejyIVtr2Up5WanqPPTU0e+FBPX+QvKRJ6WYZwhrrPjVSORrnIK0QOiwdsodlrBaodThn51Ms
 fi4/TgVWUCmCl1O2U8ltxjJhI+wNBGXmCx7RuugPMt5FwubFNWw2Y6AxC203qMm4PehkWS9CwP
 p9M=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 02:54:33 -0700
IronPort-SDR: 7gJ8K2GWS1teEbx0EpcTaAq94qX8hrpZe2o+rF7L8m3YPiilRNcRHQOtOnWBcq5Kei46943ftQ
 AatOKxtS7MFwij2h5iQz2mMf16oXYsi9K+DB6MmYEWH2/wKf6Jhq67kl7/JyCoJSGg9MiCS+W9
 mrW9LYIwkiiSRZtD5ihMJA2XMHB607JeeUDkojW0OuDyFEQQTb0fVeDCKSKcOQwZLNq8tnSX6N
 qQnaGAEAQ/tKNJ8ofe6AZpbyjdYyM/XDWamw0cI3BKjamWYlDUpPV17GiKF2irYNfORElYpHoT
 AxU=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.72])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Mar 2023 03:44:04 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 30 Mar 2023 03:43:42 -0700
Message-Id: <cover.1680172791.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH v2 00/19] bio: check return values of
 bio_add_page
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
Cc: linux-raid@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 cluster-devel@redhat.com, Chaitanya Kulkarni <kch@nvidia.com>,
 Song Liu <song@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 David Sterba <dsterba@suse.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: wdc.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

We have two functions for adding a page to a bio, __bio_add_page() which is
used to add a single page to a freshly created bio and bio_add_page() which is
used to add a page to an existing bio.

While __bio_add_page() is expected to succeed, bio_add_page() can fail.

This series converts the callers of bio_add_page() which can easily use
__bio_add_page() to using it and checks the return of bio_add_page() for
callers that don't work on a freshly created bio.

Lastly it marks bio_add_page() as __must_check so we don't have to go again
and audit all callers.

Changes to v1:
- Removed pointless comment pointed out by Willy
- Changed commit messages pointed out by Damien
- Colledted Damien's Reviews and Acks

Johannes Thumshirn (19):
  swap: use __bio_add_page to add page to bio
  drbd: use __bio_add_page to add page to bio
  dm: dm-zoned: use __bio_add_page for adding single metadata page
  fs: buffer: use __bio_add_page to add single page to bio
  md: use __bio_add_page to add single page
  md: raid5-log: use __bio_add_page to add single page
  md: raid5: use __bio_add_page to add single page to new bio
  btrfs: repair: use __bio_add_page for adding single page
  btrfs: raid56: use __bio_add_page to add single page
  jfs: logmgr: use __bio_add_page to add single page to bio
  gfs: use __bio_add_page for adding single page to bio
  zonefs: use __bio_add_page for adding single page to bio
  zram: use __bio_add_page for adding single page to bio
  floppy: use __bio_add_page for adding single page to bio
  md: check for failure when adding pages in alloc_behind_master_bio
  md: raid1: use __bio_add_page for adding single page to bio
  md: raid1: check if adding pages to resync bio fails
  dm-crypt: check if adding pages to clone bio fails
  block: mark bio_add_page as __must_check

 drivers/block/drbd/drbd_bitmap.c |  4 +---
 drivers/block/floppy.c           |  2 +-
 drivers/block/zram/zram_drv.c    |  2 +-
 drivers/md/dm-crypt.c            |  9 ++++++++-
 drivers/md/dm-zoned-metadata.c   |  6 +++---
 drivers/md/md.c                  |  4 ++--
 drivers/md/raid1-10.c            |  7 ++++++-
 drivers/md/raid1.c               |  5 +++--
 drivers/md/raid10.c              | 12 ++++++++++--
 drivers/md/raid5-cache.c         |  2 +-
 drivers/md/raid5-ppl.c           |  4 ++--
 fs/btrfs/bio.c                   |  2 +-
 fs/btrfs/raid56.c                |  2 +-
 fs/buffer.c                      |  2 +-
 fs/gfs2/ops_fstype.c             |  2 +-
 fs/jfs/jfs_logmgr.c              |  4 ++--
 fs/zonefs/super.c                |  2 +-
 include/linux/bio.h              |  2 +-
 mm/page_io.c                     |  8 ++++----
 19 files changed, 50 insertions(+), 31 deletions(-)

-- 
2.39.2

