Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E5C1428B0B5
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-vpGZR9dNOPWvL3wcr6v37g-1; Mon, 12 Oct 2020 04:53:22 -0400
X-MC-Unique: vpGZR9dNOPWvL3wcr6v37g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0D5F1074677;
	Mon, 12 Oct 2020 08:53:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB6615F9D6;
	Mon, 12 Oct 2020 08:53:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFA599231F;
	Mon, 12 Oct 2020 08:53:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JqlTN020115 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:52:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B072313BB95; Fri,  9 Oct 2020 19:52:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6D513BB9F
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 915B480CDBF
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:47 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-53-SXLZ1kfrNW6yXaWDCPFKYg-1; Fri, 09 Oct 2020 15:52:42 -0400
X-MC-Unique: SXLZ1kfrNW6yXaWDCPFKYg-1
IronPort-SDR: QWBJUlLAbJTwO9kPB07xzqOO8eOkstRFbI3dTK2If1y9BIdAQblIGZ1T1mIksdMVq8khudeU0s
	sstGeoLQav9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="227179060"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="227179060"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:52:41 -0700
IronPort-SDR: L0Vefok2A93xih84zuFNBu3LKLwMRamDsDkR1F4Gust5uwQPsEktlHxFcxfQt1U0vxS4VptD4d
	rIp50GoBaQKg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="345148048"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga008-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:52:40 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:06 -0700
Message-Id: <20201009195033.3208459-32-ira.weiny@intel.com>
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
	linux-block@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	linux-bcache@vger.kernel.org, drbd-dev@tron.linbit.com,
	Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 31/58] fs/vboxsf: Utilize new
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/vboxsf/file.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/vboxsf/file.c b/fs/vboxsf/file.c
index c4ab5996d97a..d9c7e6b7b4cc 100644
--- a/fs/vboxsf/file.c
+++ b/fs/vboxsf/file.c
@@ -216,7 +216,7 @@ static int vboxsf_readpage(struct file *file, struct page *page)
 	u8 *buf;
 	int err;
 
-	buf = kmap(page);
+	buf = kmap_thread(page);
 
 	err = vboxsf_read(sf_handle->root, sf_handle->handle, off, &nread, buf);
 	if (err == 0) {
@@ -227,7 +227,7 @@ static int vboxsf_readpage(struct file *file, struct page *page)
 		SetPageError(page);
 	}
 
-	kunmap(page);
+	kunmap_thread(page);
 	unlock_page(page);
 	return err;
 }
@@ -268,10 +268,10 @@ static int vboxsf_writepage(struct page *page, struct writeback_control *wbc)
 	if (!sf_handle)
 		return -EBADF;
 
-	buf = kmap(page);
+	buf = kmap_thread(page);
 	err = vboxsf_write(sf_handle->root, sf_handle->handle,
 			   off, &nwrite, buf);
-	kunmap(page);
+	kunmap_thread(page);
 
 	kref_put(&sf_handle->refcount, vboxsf_handle_release);
 
@@ -302,10 +302,10 @@ static int vboxsf_write_end(struct file *file, struct address_space *mapping,
 	if (!PageUptodate(page) && copied < len)
 		zero_user(page, from + copied, len - copied);
 
-	buf = kmap(page);
+	buf = kmap_thread(page);
 	err = vboxsf_write(sf_handle->root, sf_handle->handle,
 			   pos, &nwritten, buf + from);
-	kunmap(page);
+	kunmap_thread(page);
 
 	if (err) {
 		nwritten = 0;
-- 
2.28.0.rc0.12.gb6a658bd00c9

