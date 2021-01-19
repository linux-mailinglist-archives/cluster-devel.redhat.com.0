Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EEC3D2FB5EA
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-g72jpmdhObieRyNR-9GqqQ-1; Tue, 19 Jan 2021 06:54:04 -0500
X-MC-Unique: g72jpmdhObieRyNR-9GqqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECFEB107ACFE;
	Tue, 19 Jan 2021 11:54:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6C3160C91;
	Tue, 19 Jan 2021 11:54:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA08D1809C9F;
	Tue, 19 Jan 2021 11:54:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J5BEHx021670 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:11:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3D7A92026D49; Tue, 19 Jan 2021 05:11:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 385622026D11
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:11:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B5D0811E86
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:11:11 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-315-4ypFHnh_PZuqXiJtb9mYYQ-1; Tue, 19 Jan 2021 00:11:07 -0500
X-MC-Unique: 4ypFHnh_PZuqXiJtb9mYYQ-1
IronPort-SDR: hYTYh1vhacz5n4sNHm7nNR302unKm4FfwnZXT3h0WBtfoPTw6zBh7KTY/NQjA2FCtwHZ1+//Y9
	nSyFs7z0Kjp+SpbfUsACVGbjfzQg5Ra0K90b7LC2fUowyMCOQMI5vxiK3mCueCQN61eB9BI9rM
	Nlq2glgKB0Jaa7nJKzKOt9xONwiNM4FT1Ww6Q3cVQQvW2WPfd01M8aEuuwmO7VCPWFebUyirOJ
	KZ/IluARu2VWIMGWa+QMbEaKHUk/bZmsbjWRJXcyTJHaUKbRcAvhfvL1wdurdWAAyb8FxuW0ca
	dWM=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940822"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:11:05 +0800
IronPort-SDR: 2wd2T5ep+Fb56QtmID46E12Mo28tR3o762k9G+ZplXKbM+BFi6d2tXU7zdlpw2t7Z3an9fHeKi
	lOhfPWDgWys1hqnimw5xSw1NzaGvEpzGWPZkFf0w9VghjrD0w2zQX9SV1SD+nb6+2JRamrW822
	l6VFbVUrcl9NsqjDPndhr9P3wLeULCO2wY+U0SK9v9wt/i2SyQZ0LURgMc8OlzedOiOYO/0r/M
	3oJ12nzkRmmPm5Gwud8xcPNR2RVoZ5vJEppORLya7r/0Ljt+Fwu0e6XzGKAIoJXnEG2xGCLxb9
	p/XDf2L5hpsEPriJSb2Dk3SI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:55:42 -0800
IronPort-SDR: JhXhgWS0+e3HTDStYfAXJ39RQBEk0euVnqe58ziJOnn1c9Zev+zyQZ1feT8Pf3jy1k/0jfejeB
	9eRQsJQYlpsXL/MQdwG+RKeojvlhwZb7/kK3K8LYVIUeWuWwf4teK/xrJ6FiTzChv1xe4/bY5+
	eWHUFZ+nWTw4YtzlPxnn6S3DZ4LcVreyfhizYCPM9a4WY7tqwq6bMPlFdYm38BooiwkcJvUlM2
	jto6KJJwnZYWpzG78qeBvec0imqsf+1kIqtJBGsfGtjSerNFR4ZUCja3e3hANc2sx71Lno1zNp
	h1M=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:11:05 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:31 -0800
Message-Id: <20210119050631.57073-38-chaitanya.kulkarni@wdc.com>
In-Reply-To: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
References: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 19 Jan 2021 06:53:48 -0500
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, snitzer@redhat.com,
	gustavo@embeddedor.com, clm@fb.com, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, hch@lst.de, naohiro.aota@wdc.com,
	sagi@grimberg.me, darrick.wong@oracle.com, osandov@fb.com,
	kent.overstreet@gmail.com, Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	josef@toxicpanda.com, efremov@linux.com, colyli@suse.de,
	tj@kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
	bvanassche@acm.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	tytso@mit.edu, martin.petersen@oracle.com, song@kernel.org,
	philipp.reisner@linbit.com, jefflexu@linux.alibaba.com,
	lars.ellenberg@linbit.com, jth@kernel.org, asml.silence@gmail.com
Subject: [Cluster-devel] [RFC PATCH 37/37] xfs: use bio_init_fields in
	xfs_log
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/xfs/xfs_log.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index fa2d05e65ff1..062ee664a910 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -1702,10 +1702,8 @@ xlog_write_iclog(
 	}
 
 	bio_init(&iclog->ic_bio, iclog->ic_bvec, howmany(count, PAGE_SIZE));
-	bio_set_dev(&iclog->ic_bio, log->l_targ->bt_bdev);
-	iclog->ic_bio.bi_iter.bi_sector = log->l_logBBstart + bno;
-	iclog->ic_bio.bi_end_io = xlog_bio_end_io;
-	iclog->ic_bio.bi_private = iclog;
+	bio_init_fields(&iclog->ic_bio, log->l_targ->bt_bdev,
+			log->l_logBBstart + bno, iclog, xlog_bio_end_io, 0, 0);
 
 	/*
 	 * We use REQ_SYNC | REQ_IDLE here to tell the block layer the are more
-- 
2.22.1

