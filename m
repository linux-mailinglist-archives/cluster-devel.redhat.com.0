Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CBB0628B0CC
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-cvaIXpbfP_mm9kKLD2ui2A-1; Mon, 12 Oct 2020 04:53:25 -0400
X-MC-Unique: cvaIXpbfP_mm9kKLD2ui2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C230A1018F78;
	Mon, 12 Oct 2020 08:53:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B000C19D61;
	Mon, 12 Oct 2020 08:53:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9BF119231C;
	Mon, 12 Oct 2020 08:53:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JrhFw020475 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:53:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 730972017E80; Fri,  9 Oct 2020 19:53:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B022207AD4A
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:53:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9153811E76
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:53:40 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-478-IpDcvd1TNIGNdU8RvgXJEA-2;
	Fri, 09 Oct 2020 15:53:35 -0400
X-MC-Unique: IpDcvd1TNIGNdU8RvgXJEA-2
IronPort-SDR: 6UqgkCAXCptdiLAm1rCH0H5HCAdqPmFwuifgmKIm3cxXdPHyP0RvwKgkxZrSoao6k1M7vCGy0w
	tjoHWZL+sDNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="145397622"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="145397622"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:53:35 -0700
IronPort-SDR: 1BDjhBWRiZHjmax0H5jHPL9Ee2R7VPzFxt4XNyUZ5d5LafdvLgy40B0wtQFVU3AX2TCQgDyRso
	HhmDRI33qIDA==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="345148602"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga008-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:34 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:22 -0700
Message-Id: <20201009195033.3208459-48-ira.weiny@intel.com>
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
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
X-Mailman-Approved-At: Mon, 12 Oct 2020 04:53:05 -0400
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
	samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
	ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-rdma@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	x86@kernel.org, amd-gfx@lists.freedesktop.org,
	linux-afs@lists.infradead.org, cluster-devel@redhat.com,
	linux-cachefs@redhat.com, intel-wired-lan@lists.osuosl.org,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	drbd-dev@tron.linbit.com, Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 47/58] drivers/mtd: Utilize new
	kmap_thread()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/mtd/mtd_blkdevs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 0c05f77f9b21..4b18998273fa 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -88,14 +88,14 @@ static blk_status_t do_blktrans_request(struct mtd_blktrans_ops *tr,
 			return BLK_STS_IOERR;
 		return BLK_STS_OK;
 	case REQ_OP_READ:
-		buf = kmap(bio_page(req->bio)) + bio_offset(req->bio);
+		buf = kmap_thread(bio_page(req->bio)) + bio_offset(req->bio);
 		for (; nsect > 0; nsect--, block++, buf += tr->blksize) {
 			if (tr->readsect(dev, block, buf)) {
-				kunmap(bio_page(req->bio));
+				kunmap_thread(bio_page(req->bio));
 				return BLK_STS_IOERR;
 			}
 		}
-		kunmap(bio_page(req->bio));
+		kunmap_thread(bio_page(req->bio));
 		rq_flush_dcache_pages(req);
 		return BLK_STS_OK;
 	case REQ_OP_WRITE:
@@ -103,14 +103,14 @@ static blk_status_t do_blktrans_request(struct mtd_blktrans_ops *tr,
 			return BLK_STS_IOERR;
 
 		rq_flush_dcache_pages(req);
-		buf = kmap(bio_page(req->bio)) + bio_offset(req->bio);
+		buf = kmap_thread(bio_page(req->bio)) + bio_offset(req->bio);
 		for (; nsect > 0; nsect--, block++, buf += tr->blksize) {
 			if (tr->writesect(dev, block, buf)) {
-				kunmap(bio_page(req->bio));
+				kunmap_thread(bio_page(req->bio));
 				return BLK_STS_IOERR;
 			}
 		}
-		kunmap(bio_page(req->bio));
+		kunmap_thread(bio_page(req->bio));
 		return BLK_STS_OK;
 	default:
 		return BLK_STS_IOERR;
-- 
2.28.0.rc0.12.gb6a658bd00c9

