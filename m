Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1825F28B0AA
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-jzhWMVdrN5iZ_PRTaV1rHw-1; Mon, 12 Oct 2020 04:53:20 -0400
X-MC-Unique: jzhWMVdrN5iZ_PRTaV1rHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AA51AE840;
	Mon, 12 Oct 2020 08:53:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68A195C22A;
	Mon, 12 Oct 2020 08:53:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D3C097319;
	Mon, 12 Oct 2020 08:53:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JqjMi020096 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:52:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB2062166BA4; Fri,  9 Oct 2020 19:52:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C65952166BA2
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD553858294
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:45 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-224-HWsI8nqxONWQMqmyEFL2Zg-1; Fri, 09 Oct 2020 15:52:43 -0400
X-MC-Unique: HWsI8nqxONWQMqmyEFL2Zg-1
IronPort-SDR: rSg5lgiUS7teIGvbo94i5oU5AFM9wkRUfzfIad5iGlcs7Vy0Y4c4A+EYjQkIMAxNfNy+cAg8LC
	NPXO5iLCz34A==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="229715064"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="229715064"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:51:39 -0700
IronPort-SDR: 6nDyG/rNIU8VCp7PRxt8N7VM6Ts7FaR6Cq3BMAOPdzxAbIieQhQY1hWISzmf8TSYIGXE2cP/wS
	1DDas2UbMNkw==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="345147432"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga008-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:51:37 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:49:49 -0700
Message-Id: <20201009195033.3208459-15-ira.weiny@intel.com>
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
	Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
	bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 14/58] fs/cifs: Utilize new
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

Cc: Steve French <sfrench@samba.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/cifs/cifsencrypt.c |  6 +++---
 fs/cifs/file.c        | 16 ++++++++--------
 fs/cifs/smb2ops.c     |  8 ++++----
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/cifs/cifsencrypt.c b/fs/cifs/cifsencrypt.c
index 9daa256f69d4..2f8232d01a56 100644
--- a/fs/cifs/cifsencrypt.c
+++ b/fs/cifs/cifsencrypt.c
@@ -82,17 +82,17 @@ int __cifs_calc_signature(struct smb_rqst *rqst,
 
 		rqst_page_get_length(rqst, i, &len, &offset);
 
-		kaddr = (char *) kmap(rqst->rq_pages[i]) + offset;
+		kaddr = (char *) kmap_thread(rqst->rq_pages[i]) + offset;
 
 		rc = crypto_shash_update(shash, kaddr, len);
 		if (rc) {
 			cifs_dbg(VFS, "%s: Could not update with payload\n",
 				 __func__);
-			kunmap(rqst->rq_pages[i]);
+			kunmap_thread(rqst->rq_pages[i]);
 			return rc;
 		}
 
-		kunmap(rqst->rq_pages[i]);
+		kunmap_thread(rqst->rq_pages[i]);
 	}
 
 	rc = crypto_shash_final(shash, signature);
diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index be46fab4c96d..6db2caab8852 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -2145,17 +2145,17 @@ static int cifs_partialpagewrite(struct page *page, unsigned from, unsigned to)
 	inode = page->mapping->host;
 
 	offset += (loff_t)from;
-	write_data = kmap(page);
+	write_data = kmap_thread(page);
 	write_data += from;
 
 	if ((to > PAGE_SIZE) || (from > to)) {
-		kunmap(page);
+		kunmap_thread(page);
 		return -EIO;
 	}
 
 	/* racing with truncate? */
 	if (offset > mapping->host->i_size) {
-		kunmap(page);
+		kunmap_thread(page);
 		return 0; /* don't care */
 	}
 
@@ -2183,7 +2183,7 @@ static int cifs_partialpagewrite(struct page *page, unsigned from, unsigned to)
 			rc = -EIO;
 	}
 
-	kunmap(page);
+	kunmap_thread(page);
 	return rc;
 }
 
@@ -2559,10 +2559,10 @@ static int cifs_write_end(struct file *file, struct address_space *mapping,
 		   known which we might as well	leverage */
 		/* BB check if anything else missing out of ppw
 		   such as updating last write time */
-		page_data = kmap(page);
+		page_data = kmap_thread(page);
 		rc = cifs_write(cfile, pid, page_data + offset, copied, &pos);
 		/* if (rc < 0) should we set writebehind rc? */
-		kunmap(page);
+		kunmap_thread(page);
 
 		free_xid(xid);
 	} else {
@@ -4511,7 +4511,7 @@ static int cifs_readpage_worker(struct file *file, struct page *page,
 	if (rc == 0)
 		goto read_complete;
 
-	read_data = kmap(page);
+	read_data = kmap_thread(page);
 	/* for reads over a certain size could initiate async read ahead */
 
 	rc = cifs_read(file, read_data, PAGE_SIZE, poffset);
@@ -4540,7 +4540,7 @@ static int cifs_readpage_worker(struct file *file, struct page *page,
 	rc = 0;
 
 io_error:
-	kunmap(page);
+	kunmap_thread(page);
 	unlock_page(page);
 
 read_complete:
diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 32f90dc82c84..a3e7ebab38b6 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -4068,12 +4068,12 @@ smb3_init_transform_rq(struct TCP_Server_Info *server, int num_rqst,
 
 			rqst_page_get_length(&new_rq[i], j, &len, &offset);
 
-			dst = (char *) kmap(new_rq[i].rq_pages[j]) + offset;
-			src = (char *) kmap(old_rq[i - 1].rq_pages[j]) + offset;
+			dst = (char *) kmap_thread(new_rq[i].rq_pages[j]) + offset;
+			src = (char *) kmap_thread(old_rq[i - 1].rq_pages[j]) + offset;
 
 			memcpy(dst, src, len);
-			kunmap(new_rq[i].rq_pages[j]);
-			kunmap(old_rq[i - 1].rq_pages[j]);
+			kunmap_thread(new_rq[i].rq_pages[j]);
+			kunmap_thread(old_rq[i - 1].rq_pages[j]);
 		}
 	}
 
-- 
2.28.0.rc0.12.gb6a658bd00c9

