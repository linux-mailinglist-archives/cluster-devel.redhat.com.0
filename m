Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F2B717F87
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 14:06:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685534798;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YluZ+/Xi9x1Fgj+DRU5BLDV3iMORhYvEbJhB/fZ3bis=;
	b=hsr8slTXRAtTgPWTOND0h4Y05OX//ufA3c5hduMdQ36QpRheyb84iy9LKQOpH9m0Dksira
	dx2oNaPNUqDQeGqbtrWjEsak7f7ZoNdcwDqY6hMklF2hs3CguTfNTRkDN29O7+5kryv+y8
	rTOpNSitO/MpkzLUSsJXF6SImtpvgGY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-c6YNki7oNlOY0l5ho6F4dA-1; Wed, 31 May 2023 08:06:33 -0400
X-MC-Unique: c6YNki7oNlOY0l5ho6F4dA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A200B3C0CEE9;
	Wed, 31 May 2023 12:06:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 973F6492B0A;
	Wed, 31 May 2023 12:06:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6BFDB19465B9;
	Wed, 31 May 2023 12:06:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D5A4119465B3 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 11:50:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C081F2029F6D; Wed, 31 May 2023 11:50:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B89F22029F6E
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:50:58 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94912811E97
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 11:50:58 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-3Tn2oU6_Ps2I2bcC4HXFnA-1; Wed, 31 May 2023 07:50:55 -0400
X-MC-Unique: 3Tn2oU6_Ps2I2bcC4HXFnA-1
X-IronPort-AV: E=Sophos;i="6.00,207,1681142400"; d="scan'208";a="344179867"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2023 19:50:52 +0800
IronPort-SDR: D1l853u/ICa/WpOo/5yRk+0m1Rf4yxViI+aPrgarvuPiN0q0stw7vwbDVGEJ+nntLqtNGlGj0C
 6pgPrNi0HYDqJ3fi0j/8xkjqJvx2kzc0pStJzTh34yM6jBKf6b2C17jWB4w/BgC9jkuU0KmF81
 qhfDyucxGvUvyB42o/OxfbwmER+thhHZxYnZndR3P9UOc6XgbL8H6OwFVjwzb6VCuol7yMConj
 FxXGq2ZuArwVL1wK/PuZFf52WzbToE1h/xaCEXgCO8bvGpasfkyWcv237lgZtREidDzQM8ovAz
 eXA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 04:00:03 -0700
IronPort-SDR: aBaTXHI9fG0yLOBPINz8tPsC3r6YDYfSeFUWj/Rk8jWbMTPrTXRa0vH3bKfIpcAQLPGli7lgPR
 YLSb9OcFMBlrCkosi2CpTFqsECBkzuv5p5Jrd02pxOPrTfbsnU9RLpQTpyompRRhsaJ47h6uI4
 HFFmIaUfh+yjrEGq8krGyD9f3JlGVP2BCq1uoUGxpapj3rkHXsTVQ9vJNkzdRx+/vCDcwtZ89Q
 47IpAVAdH8zdPYJjyDmKkai9L/bnaYPqkDkBF4KWaJslks1l4UWdEo5lNDduud2gkMCfqFjV9d
 oWk=
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 31 May 2023 04:50:50 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 31 May 2023 04:50:23 -0700
Message-Id: <cover.1685532726.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH v7 00/20] bio: check return values of
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
 Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, gouha7@uniontech.com,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Changes to v6:
- Incorporated comments from Mike and Christoph
- Collected Reviewed-bys

Changes to v5:
- Rebased onto latest Linus' master
- Removed now superfluous BUG_ON() in fs/buffer.c (Gou)
- Removed dead cleanup code in dm-crypt.c (Mikulas)

Changes to v4:
- Rebased onto latest Linus' master
- Dropped already merged patches
- Added Sergey's Reviewed-by

Changes to v3:
- Added __bio_add_folio and use it in iomap (Willy)
- Mark bio_add_folio must check (Willy)
- s/GFS/GFS2/ (Andreas)

Changes to v2:
- Removed 'wont fail' comments pointed out by Song

Changes to v1:
- Removed pointless comment pointed out by Willy
- Changed commit messages pointed out by Damien
- Colledted Damien's Reviews and Acks

Johannes Thumshirn (20):
  swap: use __bio_add_page to add page to bio
  drbd: use __bio_add_page to add page to bio
  dm: dm-zoned: use __bio_add_page for adding single metadata page
  fs: buffer: use __bio_add_page to add single page to bio
  md: use __bio_add_page to add single page
  md: raid5-log: use __bio_add_page to add single page
  md: raid5: use __bio_add_page to add single page to new bio
  jfs: logmgr: use __bio_add_page to add single page to bio
  gfs2: use __bio_add_page for adding single page to bio
  zonefs: use __bio_add_page for adding single page to bio
  zram: use __bio_add_page for adding single page to bio
  floppy: use __bio_add_page for adding single page to bio
  md: check for failure when adding pages in alloc_behind_master_bio
  md: raid1: use __bio_add_page for adding single page to bio
  md: raid1: check if adding pages to resync bio fails
  dm-crypt: use __bio_add_page to add single page to clone bio
  block: mark bio_add_page as __must_check
  block: add bio_add_folio_nofail
  fs: iomap: use bio_add_folio_nofail where possible
  block: mark bio_add_folio as __must_check

 block/bio.c                      |  8 ++++++++
 drivers/block/drbd/drbd_bitmap.c |  4 +---
 drivers/block/floppy.c           |  2 +-
 drivers/block/zram/zram_drv.c    |  2 +-
 drivers/md/dm-crypt.c            |  3 +--
 drivers/md/dm-zoned-metadata.c   |  6 +++---
 drivers/md/md.c                  |  4 ++--
 drivers/md/raid1-10.c            | 11 ++++++-----
 drivers/md/raid1.c               |  7 +++++--
 drivers/md/raid10.c              | 20 ++++++++++----------
 drivers/md/raid5-cache.c         |  2 +-
 drivers/md/raid5-ppl.c           |  4 ++--
 fs/buffer.c                      |  3 +--
 fs/gfs2/ops_fstype.c             |  2 +-
 fs/iomap/buffered-io.c           |  6 +++---
 fs/jfs/jfs_logmgr.c              |  4 ++--
 fs/zonefs/super.c                |  2 +-
 include/linux/bio.h              |  8 ++++++--
 mm/page_io.c                     |  8 ++++----
 19 files changed, 59 insertions(+), 47 deletions(-)


base-commit: 48b1320a674e1ff5de2fad8606bee38f724594dc
-- 
2.40.1

