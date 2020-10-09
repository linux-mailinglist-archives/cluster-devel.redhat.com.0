Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7BE28B0C2
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-H9XNZtmgO2iCj3PWg9R8qw-1; Mon, 12 Oct 2020 04:53:23 -0400
X-MC-Unique: H9XNZtmgO2iCj3PWg9R8qw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E53BC85EE94;
	Mon, 12 Oct 2020 08:53:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D29A919D61;
	Mon, 12 Oct 2020 08:53:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE5A1181A869;
	Mon, 12 Oct 2020 08:53:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JrkA5020553 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:53:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9542C207A813; Fri,  9 Oct 2020 19:53:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 902CA205EB12
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:53:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76D211021F82
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:53:46 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-416-ACnDjDgzMFabZN_546P8jQ-1; Fri, 09 Oct 2020 15:53:39 -0400
X-MC-Unique: ACnDjDgzMFabZN_546P8jQ-1
IronPort-SDR: VreB7I9/ujcWRhcMw5NDGoXM5TLAJ6zijbiwiFXN3daLOnWAngiVeoqg72AzXMH7dbl4lfy2oS
	teusD/KCJZNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="153363814"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="153363814"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:53:38 -0700
IronPort-SDR: 77OyjRxsHRqLdlwGyIEmSTWShPVNVQULX7LnGcMeG3NkwcCC4UbesWRkZ9bTTqcjV6t6jmiGf4
	lDgqS7BTpvKw==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="389237394"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga001-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:53:37 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:23 -0700
Message-Id: <20201009195033.3208459-49-ira.weiny@intel.com>
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
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
	Kent Overstreet <kent.overstreet@gmail.com>,
	Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, drbd-dev@tron.linbit.com,
	Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 48/58] drivers/md: Utilize new
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

Cc: Coly Li <colyli@suse.de> (maintainer:BCACHE (BLOCK LAYER CACHE))
Cc: Kent Overstreet <kent.overstreet@gmail.com> (maintainer:BCACHE (BLOCK LAYER CACHE))
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/md/bcache/request.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index c7cadaafa947..a4571f6d09dd 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -44,10 +44,10 @@ static void bio_csum(struct bio *bio, struct bkey *k)
 	uint64_t csum = 0;
 
 	bio_for_each_segment(bv, bio, iter) {
-		void *d = kmap(bv.bv_page) + bv.bv_offset;
+		void *d = kmap_thread(bv.bv_page) + bv.bv_offset;
 
 		csum = bch_crc64_update(csum, d, bv.bv_len);
-		kunmap(bv.bv_page);
+		kunmap_thread(bv.bv_page);
 	}
 
 	k->ptr[KEY_PTRS(k)] = csum & (~0ULL >> 1);
-- 
2.28.0.rc0.12.gb6a658bd00c9

