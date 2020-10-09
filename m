Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDA828B0B0
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-Off4caXwMKu2iFpK6cCJvw-1; Mon, 12 Oct 2020 04:53:20 -0400
X-MC-Unique: Off4caXwMKu2iFpK6cCJvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5123835B75;
	Mon, 12 Oct 2020 08:53:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B59C61177;
	Mon, 12 Oct 2020 08:53:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 770809731F;
	Mon, 12 Oct 2020 08:53:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JqL52019838 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:52:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D5D4C2166BCC; Fri,  9 Oct 2020 19:52:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0FC52166BA0
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7297811E83
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:21 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-565-yFB5G3--NGyDrvSkRk16OQ-1;
	Fri, 09 Oct 2020 15:52:14 -0400
X-MC-Unique: yFB5G3--NGyDrvSkRk16OQ-1
IronPort-SDR: 2lf0+1F7pKir81J48xUfsw2J8XAJzXZgo9qaJ9v8r0D+s6x0CCWdgqrNUOkEP2KrTTydBIcJgr
	pGnBsr/RxyOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="145397405"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="145397405"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:52:05 -0700
IronPort-SDR: UirI0CQIu4U61+QlSzJhUSBnMwMbOjm+hcyTouEwvOwx6I0trp+50TKD6KEUa5cRPFVp+hPY69
	eHlTO5RS+u4A==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="343972211"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by fmsmga004-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:52:04 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:49:57 -0700
Message-Id: <20201009195033.3208459-23-ira.weiny@intel.com>
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
	Fenghua Yu <fenghua.yu@intel.com>, ecryptfs@vger.kernel.org,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, drbd-dev@tron.linbit.com,
	Jaegeuk Kim <jaegeuk@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 22/58] fs/f2fs: Utilize new
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

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/f2fs/f2fs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d9e52a7f3702..ff72a45a577e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2410,12 +2410,12 @@ static inline struct page *f2fs_pagecache_get_page(
 
 static inline void f2fs_copy_page(struct page *src, struct page *dst)
 {
-	char *src_kaddr = kmap(src);
-	char *dst_kaddr = kmap(dst);
+	char *src_kaddr = kmap_thread(src);
+	char *dst_kaddr = kmap_thread(dst);
 
 	memcpy(dst_kaddr, src_kaddr, PAGE_SIZE);
-	kunmap(dst);
-	kunmap(src);
+	kunmap_thread(dst);
+	kunmap_thread(src);
 }
 
 static inline void f2fs_put_page(struct page *page, int unlock)
-- 
2.28.0.rc0.12.gb6a658bd00c9

