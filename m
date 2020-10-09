Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B9A5328B0B3
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-5P-FUQcvMMSK3xDeK7D3Xw-1; Mon, 12 Oct 2020 04:53:21 -0400
X-MC-Unique: 5P-FUQcvMMSK3xDeK7D3Xw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44EBC180C5C3;
	Mon, 12 Oct 2020 08:53:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32D0660C07;
	Mon, 12 Oct 2020 08:53:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CE61181A720;
	Mon, 12 Oct 2020 08:53:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099Jqrip020174 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:52:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C198F13BB95; Fri,  9 Oct 2020 19:52:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBEA713BB85
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A41998582B1
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:53 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-528-poW2VSIGPcikDdOPMO4V4g-1;
	Fri, 09 Oct 2020 15:52:49 -0400
X-MC-Unique: poW2VSIGPcikDdOPMO4V4g-1
IronPort-SDR: +xcurE7/5ZE7KucqWiL7oKvm0j4YDs3x4BVZWHVkmGBum8MtvSLgwly+k1Ca60Xp4O2i1cCMMk
	tg3BugPKSBTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182976340"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="182976340"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:52:47 -0700
IronPort-SDR: 0rzHuL4N+KM4WVW+vmL+eEj1y192PC4ThPKt2jdycOAoxaq6uEUOpoOJAuFDFbsfnCMTEcEeiF
	lMErav9d18Iw==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="419537108"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by fmsmga001-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:52:47 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:08 -0700
Message-Id: <20201009195033.3208459-34-ira.weiny@intel.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
	Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	drbd-dev@tron.linbit.com, Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize new
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: Nicolas Pitre <nico@fluxnic.net>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/cramfs/inode.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index 912308600d39..003c014a42ed 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -247,8 +247,8 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
 		struct page *page = pages[i];
 
 		if (page) {
-			memcpy(data, kmap(page), PAGE_SIZE);
-			kunmap(page);
+			memcpy(data, kmap_thread(page), PAGE_SIZE);
+			kunmap_thread(page);
 			put_page(page);
 		} else
 			memset(data, 0, PAGE_SIZE);
@@ -826,7 +826,7 @@ static int cramfs_readpage(struct file *file, struct page *page)
 
 	maxblock = (inode->i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	bytes_filled = 0;
-	pgdata = kmap(page);
+	pgdata = kmap_thread(page);
 
 	if (page->index < maxblock) {
 		struct super_block *sb = inode->i_sb;
@@ -914,13 +914,13 @@ static int cramfs_readpage(struct file *file, struct page *page)
 
 	memset(pgdata + bytes_filled, 0, PAGE_SIZE - bytes_filled);
 	flush_dcache_page(page);
-	kunmap(page);
+	kunmap_thread(page);
 	SetPageUptodate(page);
 	unlock_page(page);
 	return 0;
 
 err:
-	kunmap(page);
+	kunmap_thread(page);
 	ClearPageUptodate(page);
 	SetPageError(page);
 	unlock_page(page);
-- 
2.28.0.rc0.12.gb6a658bd00c9

