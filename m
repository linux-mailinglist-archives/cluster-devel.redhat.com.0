Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B8C992FB5E9
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Jan 2021 12:54:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-H4j7oLaWOu2r1lB6Q8_pwA-1; Tue, 19 Jan 2021 06:54:05 -0500
X-MC-Unique: H4j7oLaWOu2r1lB6Q8_pwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C316381DFB1;
	Tue, 19 Jan 2021 11:54:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB4E610023AD;
	Tue, 19 Jan 2021 11:54:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9744B5002C;
	Tue, 19 Jan 2021 11:54:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J5AhnC021493 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 00:10:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BC1F32026D12; Tue, 19 Jan 2021 05:10:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B652E2026D11
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:10:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 170BE811E76
	for <cluster-devel@redhat.com>; Tue, 19 Jan 2021 05:10:41 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-594-iF-831dpO4igBkupju2aVA-1; Tue, 19 Jan 2021 00:10:35 -0500
X-MC-Unique: iF-831dpO4igBkupju2aVA-1
IronPort-SDR: imccesmc2Sd7NFlzVhepxMiaPW/MyPoyPT5E88iUt6Ks6fVVBmkQS/d+WlsYphTRN9Vkv/HHQZ
	o5TAnrTUmMO5zMyJEeLiG07o4oMEfgngGRQKuiIEh+PzDjLD4esNAIkmtF7DUlrIvkWBr2Y34W
	ltaEsTtmGdoc0o72cyyHyyULgiUSPnQDg09ooC7r57foQQyYczKCOoc54bcQtPqs/mUETtgvSJ
	su+CkW5BySNX3KEtDqS/TG3fWC0ZnODPPAzZYlHK+YfEwRJiop7wKya11ZbXnUOnnLXENlgGGQ
	PT0=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="162201291"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:10:34 +0800
IronPort-SDR: qVT1B/xtHRz2DjV5fgpHSHQ+uiKpvFgAQ1lA7OZJvnwHpivg2HqVOMKFU2rx5MmlFGAXp+0Olm
	i2Ct439rXttOBBoa8W4CbeQrX1ojz8jE+LIVnGYhmHZxtP61Xm3m4eOeS3m4rMeTGMfLYUT7BH
	ENYL/9u+P1RO0/7ZKfWodnvKAQ7HKFSVU82jLTu1sIkeGY+BLUETY9S9Jk5+Zl+r4jwOojevRK
	1SHO82NIfMwnWVGni276qjqi30if/rM+p/6bsf6m5wBzMTFP5pVF3JecdUiAtYnqNfspuhmSQF
	06yKelSe9fBpMUX4Z9lL95Rz
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:53:09 -0800
IronPort-SDR: To60I5qpFjC/qrOYyP0e+8PtEHWn/E+IX3B/NtCL2AEGlknL6XuDdu2+0YOMCEUl9jN0+NDuzq
	dZBtHVmFs8c2MbBK6nyyqiUGvL7D/ICacqAETpUNh7sNU3jN3gr3oMEn5okCkDfyC/0Irc2Fc4
	74E8Jj0L1yozehCSNmdf8CdFJegKv/E3LC+h6Fa4Hmz/L2OxthixlGPQheihc6U0PL3qEeNS+1
	hIM5iqNNXixY/QFjQ8bMwljmNMnnwya/seW7BmRZG7IJzaltfLW+/RKR36uM7dMhYxQCE98dv2
	Nnw=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:10:34 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:27 -0800
Message-Id: <20210119050631.57073-34-chaitanya.kulkarni@wdc.com>
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
Subject: [Cluster-devel] [RFC PATCH 33/37] jfs: use bio_init_fields in
	metadata
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/jfs/jfs_metapage.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 176580f54af9..5cea9c137a48 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -417,10 +417,10 @@ static int metapage_writepage(struct page *page, struct writeback_control *wbc)
 		len = min(xlen, (int)JFS_SBI(inode->i_sb)->nbperpage);
 
 		bio = bio_alloc(GFP_NOFS, 1);
-		bio_set_dev(bio, inode->i_sb->s_bdev);
-		bio->bi_iter.bi_sector = pblock << (inode->i_blkbits - 9);
-		bio->bi_end_io = metapage_write_end_io;
-		bio->bi_private = page;
+		bio_init_fields(bio, inode->i_sb->s_bdev,
+				pblock << (inode->i_blkbits - 9),
+				page, metapage_write_end_io, 0, 0);
+
 		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 		/* Don't call bio_add_page yet, we may add to this vec */
@@ -497,11 +497,9 @@ static int metapage_readpage(struct file *fp, struct page *page)
 				submit_bio(bio);
 
 			bio = bio_alloc(GFP_NOFS, 1);
-			bio_set_dev(bio, inode->i_sb->s_bdev);
-			bio->bi_iter.bi_sector =
-				pblock << (inode->i_blkbits - 9);
-			bio->bi_end_io = metapage_read_end_io;
-			bio->bi_private = page;
+			bio_init_fields(bio, inode->i_sb->s_bdev,
+					pblock << (inode->i_blkbits - 9,
+					page, metapage_read_end_io, 0, 0);
 			bio_set_op_attrs(bio, REQ_OP_READ, 0);
 			len = xlen << inode->i_blkbits;
 			offset = block_offset << inode->i_blkbits;
-- 
2.22.1

