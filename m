Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB776CF107
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Mar 2023 19:27:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680110860;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q0vXrB3YpVAqkHmAwqjSYymJe2xmB6NI0kEVCyloRK4=;
	b=RCtgu5q3oC+f6H8A1D5MSfBbjoeBcGif1cHfCXXaEU4uheP5Ye3lSnkLNAUZWIUxBOZH1H
	ccGUkulKCdnLHhgN6Il5h0fBMake20MOmleN41EEI+M+IblMKePeCN76Q3V57MWahS8ri/
	QSS40VDS3cvGjGhLWJRcEPeqJDqX99Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-PkpOM-WrOqeYYnExUS7Bow-1; Wed, 29 Mar 2023 13:27:38 -0400
X-MC-Unique: PkpOM-WrOqeYYnExUS7Bow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92249886068;
	Wed, 29 Mar 2023 17:27:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC627C15BA0;
	Wed, 29 Mar 2023 17:27:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 90BD31946595;
	Wed, 29 Mar 2023 17:27:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A262F1946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 17:07:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 592F91121331; Wed, 29 Mar 2023 17:07:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5211D1121330
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 17:07:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 349FE855300
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 17:07:31 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-iYxqBEa5MKWuvED6LBcWTA-1; Wed, 29 Mar 2023 13:07:27 -0400
X-MC-Unique: iYxqBEa5MKWuvED6LBcWTA-1
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="338882547"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 01:06:21 +0800
IronPort-SDR: o6fZHY/R3qixZuXwjzg6EExp6a4Q3HLJp5tjSVo3Ld9Mb4xB1PQYzh6cKnDyEl6B9Sm7ORdE9T
 cM8fG+Rl6tsAGQwU07DaD3Ushc79MM2d+xBw/rBt9v5X50gZHthDB6u2JTjhoXSti9zuG+Kuks
 Ev++MjvbZ0yYK23J6GHZUNS/LYpxskB5QdpYRwgN70Uhprw7oubuL7NdIHLOyzCb4GE8anycHM
 A+GLikqsOXrvpXam8RwuJP8+fRF9NWrxjFtP71iSFdgptCpl7KUsJy1qB4lPc9JRiplL94uxze
 2bY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 09:22:30 -0700
IronPort-SDR: 5o43zE44ApvlLKedTs27i6ZN/lELa7pMrmIJQK40gUpdn2C4UtQdcwlIfjiKh1n/bPpGX2YXq8
 YJJVJzgPqspxZi96lPe0WBzcRw9V0Z9BQK2DV4YAFsTQkHP1VrCBf6vXbgxIZ7J5vpxE0lTn/0
 xSGPZVtghIG7ljFrff33/jPHtv9RuCOmJLd+y2rtbDipZfTukm+09qiddbRkAF472QN1YGPAI9
 JwRocCI6ASGu/e1WbcS3qvfbyDLv4KkKB37h7xOPvZEpnFh7bqGxuER/H3ZfH5Gd/fUWjoHgjr
 ZXs=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.72])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Mar 2023 10:06:20 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 29 Mar 2023 10:05:46 -0700
Message-Id: <cover.1680108414.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH 00/19] bio: check return values of
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

 drivers/block/drbd/drbd_bitmap.c |  8 +++++---
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
 19 files changed, 54 insertions(+), 31 deletions(-)

-- 
2.39.2

