Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D097C28B0D7
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-0MF80T-HNjGxdsITkWYBhw-1; Mon, 12 Oct 2020 04:53:26 -0400
X-MC-Unique: 0MF80T-HNjGxdsITkWYBhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EC14AFD39;
	Mon, 12 Oct 2020 08:53:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C6741000239;
	Mon, 12 Oct 2020 08:53:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED0229A04E;
	Mon, 12 Oct 2020 08:53:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JsIPY020810 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:54:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FA3C2166BA0; Fri,  9 Oct 2020 19:54:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A57F2166B28
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:54:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EEE580018D
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:54:16 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-425-a8_MFBRXPm2ZvKuq-Q2-tA-1;
	Fri, 09 Oct 2020 15:54:11 -0400
X-MC-Unique: a8_MFBRXPm2ZvKuq-Q2-tA-1
IronPort-SDR: xV5StPWBVUiuROzU0usTDRsK9AsHM5Zit251ZKpf4vzIRLfBT83a9xfB5x0Q2aGZK+iCl8VHKg
	29F6j38rta3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="164744195"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="164744195"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:54:10 -0700
IronPort-SDR: LoljxrxdEbdUiebRGt6guGtjo6SPfpWGHMJuLgTgYB7BeDU8CJtiGau7DzbQyZ+Y5gpHVnCtT5
	urTwCEpflSRg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="343972696"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by fmsmga004-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:54:09 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:33 -0700
Message-Id: <20201009195033.3208459-59-ira.weiny@intel.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 58/58] [dax|pmem]: Enable stray
	access protection
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

From: Ira Weiny <ira.weiny@intel.com>

Protecting against stray writes is particularly important for PMEM
because, unlike writes to anonymous memory, writes to PMEM persists
across a reboot.  Thus data corruption could result in permanent loss of
data.

While stray writes are more serious than reads, protection is also
enabled for reads.  This helps to detect bugs in code which would
incorrectly access device memory and prevents a more serious machine
checks should those bug reads from a poison page.

Enable stray access protection by setting the flag in pgmap which
requests it.  There is no option presented to the user.  If Zone Device
Access Protection not be supported this flag will have no affect.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/dax/device.c  | 2 ++
 drivers/nvdimm/pmem.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index 1e89513f3c59..e6fb35b4f0fb 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -430,6 +430,8 @@ int dev_dax_probe(struct device *dev)
 	}
 
 	dev_dax->pgmap.type = MEMORY_DEVICE_GENERIC;
+	dev_dax->pgmap.flags |= PGMAP_PROT_ENABLED;
+
 	addr = devm_memremap_pages(dev, &dev_dax->pgmap);
 	if (IS_ERR(addr))
 		return PTR_ERR(addr);
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index e4dc1ae990fc..9fcd8338e23f 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -426,6 +426,8 @@ static int pmem_attach_disk(struct device *dev,
 		return -EBUSY;
 	}
 
+	pmem->pgmap.flags |= PGMAP_PROT_ENABLED;
+
 	q = blk_alloc_queue(dev_to_node(dev));
 	if (!q)
 		return -ENOMEM;
-- 
2.28.0.rc0.12.gb6a658bd00c9

