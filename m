Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4240628B0A2
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-hTqekqYQPuqKfRkI3Xtkwg-1; Mon, 12 Oct 2020 04:53:18 -0400
X-MC-Unique: hTqekqYQPuqKfRkI3Xtkwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F681108088A;
	Mon, 12 Oct 2020 08:53:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F60F6EF55;
	Mon, 12 Oct 2020 08:53:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0942D181A050;
	Mon, 12 Oct 2020 08:53:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JqIBh019786 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:52:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E13913D2CFE; Fri,  9 Oct 2020 19:52:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6849313D2CF3
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8D07811E95
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:17 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-215-BtJwu9VfPAyeYBk8JAhN7g-1;
	Fri, 09 Oct 2020 15:52:15 -0400
X-MC-Unique: BtJwu9VfPAyeYBk8JAhN7g-1
IronPort-SDR: +iwjIwu59mNwYgiyCDT6w6Iy+qmC9keUo8R4lZ/yfxxlmtYGyc0EL2BS3xmSGuMbQvhGYgrdce
	ZegIW8nyxl4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="144850644"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="144850644"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:51:11 -0700
IronPort-SDR: 7ZsxuYrd4RIh+I9L87qE8QKpDxHdxlIArpw96UL8x0WQ0i4hLag3NZ1m816qhb9i0FMTl4f1za
	dG2KA2sC/NWA==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="312652519"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga003-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:51:09 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:49:42 -0700
Message-Id: <20201009195033.3208459-8-ira.weiny@intel.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 12 Oct 2020 04:53:05 -0400
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, kexec@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org,
	x86@kernel.org, amd-gfx@lists.freedesktop.org,
	linux-afs@lists.infradead.org, cluster-devel@redhat.com,
	linux-cachefs@redhat.com, intel-wired-lan@lists.osuosl.org,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	drbd-dev@tron.linbit.com, Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 07/58] drivers/drbd: Utilize
	new kmap_thread()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this driver are localized to a single thread.  To
avoid the over head of global PKRS updates use the new kmap_thread()
call.

Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/block/drbd/drbd_main.c     |  4 ++--
 drivers/block/drbd/drbd_receiver.c | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 573dbf6f0c31..f0d0c6b0745e 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -1532,9 +1532,9 @@ static int _drbd_no_send_page(struct drbd_peer_device *peer_device, struct page
 	int err;
 
 	socket = peer_device->connection->data.socket;
-	addr = kmap(page) + offset;
+	addr = kmap_thread(page) + offset;
 	err = drbd_send_all(peer_device->connection, socket, addr, size, msg_flags);
-	kunmap(page);
+	kunmap_thread(page);
 	if (!err)
 		peer_device->device->send_cnt += size >> 9;
 	return err;
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 422363daa618..4704bc0564e2 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1951,13 +1951,13 @@ read_in_block(struct drbd_peer_device *peer_device, u64 id, sector_t sector,
 	page = peer_req->pages;
 	page_chain_for_each(page) {
 		unsigned len = min_t(int, ds, PAGE_SIZE);
-		data = kmap(page);
+		data = kmap_thread(page);
 		err = drbd_recv_all_warn(peer_device->connection, data, len);
 		if (drbd_insert_fault(device, DRBD_FAULT_RECEIVE)) {
 			drbd_err(device, "Fault injection: Corrupting data on receive\n");
 			data[0] = data[0] ^ (unsigned long)-1;
 		}
-		kunmap(page);
+		kunmap_thread(page);
 		if (err) {
 			drbd_free_peer_req(device, peer_req);
 			return NULL;
@@ -1992,7 +1992,7 @@ static int drbd_drain_block(struct drbd_peer_device *peer_device, int data_size)
 
 	page = drbd_alloc_pages(peer_device, 1, 1);
 
-	data = kmap(page);
+	data = kmap_thread(page);
 	while (data_size) {
 		unsigned int len = min_t(int, data_size, PAGE_SIZE);
 
@@ -2001,7 +2001,7 @@ static int drbd_drain_block(struct drbd_peer_device *peer_device, int data_size)
 			break;
 		data_size -= len;
 	}
-	kunmap(page);
+	kunmap_thread(page);
 	drbd_free_pages(peer_device->device, page, 0);
 	return err;
 }
@@ -2033,10 +2033,10 @@ static int recv_dless_read(struct drbd_peer_device *peer_device, struct drbd_req
 	D_ASSERT(peer_device->device, sector == bio->bi_iter.bi_sector);
 
 	bio_for_each_segment(bvec, bio, iter) {
-		void *mapped = kmap(bvec.bv_page) + bvec.bv_offset;
+		void *mapped = kmap_thread(bvec.bv_page) + bvec.bv_offset;
 		expect = min_t(int, data_size, bvec.bv_len);
 		err = drbd_recv_all_warn(peer_device->connection, mapped, expect);
-		kunmap(bvec.bv_page);
+		kunmap_thread(bvec.bv_page);
 		if (err)
 			return err;
 		data_size -= expect;
-- 
2.28.0.rc0.12.gb6a658bd00c9

