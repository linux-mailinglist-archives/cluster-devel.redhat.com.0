Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CD49F28B0A5
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-2NaiA_TNPDWJEXLMG_kCoQ-1; Mon, 12 Oct 2020 04:53:19 -0400
X-MC-Unique: 2NaiA_TNPDWJEXLMG_kCoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B453100831A;
	Mon, 12 Oct 2020 08:53:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBB9519D61;
	Mon, 12 Oct 2020 08:53:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D60FB9231F;
	Mon, 12 Oct 2020 08:53:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099Jqal8020020 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:52:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F29EE2166BA2; Fri,  9 Oct 2020 19:52:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE4EE2166B28
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D501C1823602
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:35 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-398-9bJSHLX_MF25KUOBAG2rvA-2; Fri, 09 Oct 2020 15:52:33 -0400
X-MC-Unique: 9bJSHLX_MF25KUOBAG2rvA-2
IronPort-SDR: E/Ynuol/PlSaFABpH0Yi2dbJn88K1zNziz0iuocKxKa4Uz95THTFXyS4HTrU4Q2eKIUx7u3MMK
	bBb+qarK0i4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="165592074"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="165592074"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:51:29 -0700
IronPort-SDR: 0+lGONiHFSeyE/0kQGUe/v/Z0vqstKsQGCedA4TvP63fkNzDWGjPYFj9hsR1yECUQTFrwG697Z
	McTBAsxZaLwQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="298419323"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by fmsmga007-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:51:28 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:49:47 -0700
Message-Id: <20201009195033.3208459-13-ira.weiny@intel.com>
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
	Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
	David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
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
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 12/58] fs/afs: Utilize new
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

The kmap() calls in this FS are localized to a single thread.  To
avoid the over head of global PKRS updates use the new kmap_thread()
call.

Cc: David Howells <dhowells@redhat.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/afs/dir.c      | 16 ++++++++--------
 fs/afs/dir_edit.c | 16 ++++++++--------
 fs/afs/mntpt.c    |  4 ++--
 fs/afs/write.c    |  4 ++--
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 1d2e61e0ab04..5d01cdb590de 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -127,14 +127,14 @@ static bool afs_dir_check_page(struct afs_vnode *dvnode, struct page *page,
 	qty /= sizeof(union afs_xdr_dir_block);
 
 	/* check them */
-	dbuf = kmap(page);
+	dbuf = kmap_thread(page);
 	for (tmp = 0; tmp < qty; tmp++) {
 		if (dbuf->blocks[tmp].hdr.magic != AFS_DIR_MAGIC) {
 			printk("kAFS: %s(%lx): bad magic %d/%d is %04hx\n",
 			       __func__, dvnode->vfs_inode.i_ino, tmp, qty,
 			       ntohs(dbuf->blocks[tmp].hdr.magic));
 			trace_afs_dir_check_failed(dvnode, off, i_size);
-			kunmap(page);
+			kunmap_thread(page);
 			trace_afs_file_error(dvnode, -EIO, afs_file_error_dir_bad_magic);
 			goto error;
 		}
@@ -146,7 +146,7 @@ static bool afs_dir_check_page(struct afs_vnode *dvnode, struct page *page,
 		((u8 *)&dbuf->blocks[tmp])[AFS_DIR_BLOCK_SIZE - 1] = 0;
 	}
 
-	kunmap(page);
+	kunmap_thread(page);
 
 checked:
 	afs_stat_v(dvnode, n_read_dir);
@@ -177,13 +177,13 @@ static bool afs_dir_check_pages(struct afs_vnode *dvnode, struct afs_read *req)
 		req->pos, req->index, req->nr_pages, req->offset);
 
 	for (i = 0; i < req->nr_pages; i++) {
-		dbuf = kmap(req->pages[i]);
+		dbuf = kmap_thread(req->pages[i]);
 		for (j = 0; j < qty; j++) {
 			union afs_xdr_dir_block *block = &dbuf->blocks[j];
 
 			pr_warn("[%02x] %32phN\n", i * qty + j, block);
 		}
-		kunmap(req->pages[i]);
+		kunmap_thread(req->pages[i]);
 	}
 	return false;
 }
@@ -481,7 +481,7 @@ static int afs_dir_iterate(struct inode *dir, struct dir_context *ctx,
 
 		limit = blkoff & ~(PAGE_SIZE - 1);
 
-		dbuf = kmap(page);
+		dbuf = kmap_thread(page);
 
 		/* deal with the individual blocks stashed on this page */
 		do {
@@ -489,7 +489,7 @@ static int afs_dir_iterate(struct inode *dir, struct dir_context *ctx,
 					       sizeof(union afs_xdr_dir_block)];
 			ret = afs_dir_iterate_block(dvnode, ctx, dblock, blkoff);
 			if (ret != 1) {
-				kunmap(page);
+				kunmap_thread(page);
 				goto out;
 			}
 
@@ -497,7 +497,7 @@ static int afs_dir_iterate(struct inode *dir, struct dir_context *ctx,
 
 		} while (ctx->pos < dir->i_size && blkoff < limit);
 
-		kunmap(page);
+		kunmap_thread(page);
 		ret = 0;
 	}
 
diff --git a/fs/afs/dir_edit.c b/fs/afs/dir_edit.c
index b108528bf010..35ed6828e205 100644
--- a/fs/afs/dir_edit.c
+++ b/fs/afs/dir_edit.c
@@ -218,7 +218,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
 	need_slots = round_up(12 + name->len + 1 + 4, AFS_DIR_DIRENT_SIZE);
 	need_slots /= AFS_DIR_DIRENT_SIZE;
 
-	meta_page = kmap(page0);
+	meta_page = kmap_thread(page0);
 	meta = &meta_page->blocks[0];
 	if (i_size == 0)
 		goto new_directory;
@@ -247,7 +247,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
 				set_page_private(page, 1);
 				SetPagePrivate(page);
 			}
-			dir_page = kmap(page);
+			dir_page = kmap_thread(page);
 		}
 
 		/* Abandon the edit if we got a callback break. */
@@ -284,7 +284,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
 
 		if (page != page0) {
 			unlock_page(page);
-			kunmap(page);
+			kunmap_thread(page);
 			put_page(page);
 		}
 	}
@@ -323,7 +323,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
 	afs_set_contig_bits(block, slot, need_slots);
 	if (page != page0) {
 		unlock_page(page);
-		kunmap(page);
+		kunmap_thread(page);
 		put_page(page);
 	}
 
@@ -337,7 +337,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
 
 out_unmap:
 	unlock_page(page0);
-	kunmap(page0);
+	kunmap_thread(page0);
 	put_page(page0);
 	_leave("");
 	return;
@@ -346,7 +346,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
 	trace_afs_edit_dir(vnode, why, afs_edit_dir_create_inval, 0, 0, 0, 0, name->name);
 	clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags);
 	if (page != page0) {
-		kunmap(page);
+		kunmap_thread(page);
 		put_page(page);
 	}
 	goto out_unmap;
@@ -398,7 +398,7 @@ void afs_edit_dir_remove(struct afs_vnode *vnode,
 	need_slots = round_up(12 + name->len + 1 + 4, AFS_DIR_DIRENT_SIZE);
 	need_slots /= AFS_DIR_DIRENT_SIZE;
 
-	meta_page = kmap(page0);
+	meta_page = kmap_thread(page0);
 	meta = &meta_page->blocks[0];
 
 	/* Find a page that has sufficient slots available.  Each VM page
@@ -410,7 +410,7 @@ void afs_edit_dir_remove(struct afs_vnode *vnode,
 			page = find_lock_page(vnode->vfs_inode.i_mapping, index);
 			if (!page)
 				goto error;
-			dir_page = kmap(page);
+			dir_page = kmap_thread(page);
 		} else {
 			page = page0;
 			dir_page = meta_page;
diff --git a/fs/afs/mntpt.c b/fs/afs/mntpt.c
index 79bc5f1338ed..562454e2fd5c 100644
--- a/fs/afs/mntpt.c
+++ b/fs/afs/mntpt.c
@@ -139,11 +139,11 @@ static int afs_mntpt_set_params(struct fs_context *fc, struct dentry *mntpt)
 			return ret;
 		}
 
-		buf = kmap(page);
+		buf = kmap_thread(page);
 		ret = -EINVAL;
 		if (buf[size - 1] == '.')
 			ret = vfs_parse_fs_string(fc, "source", buf, size - 1);
-		kunmap(page);
+		kunmap_thread(page);
 		put_page(page);
 		if (ret < 0)
 			return ret;
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 4b2265cb1891..c56e5b4db4ae 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -38,9 +38,9 @@ static int afs_fill_page(struct afs_vnode *vnode, struct key *key,
 	if (pos >= vnode->vfs_inode.i_size) {
 		p = pos & ~PAGE_MASK;
 		ASSERTCMP(p + len, <=, PAGE_SIZE);
-		data = kmap(page);
+		data = kmap_thread(page);
 		memset(data + p, 0, len);
-		kunmap(page);
+		kunmap_thread(page);
 		return 0;
 	}
 
-- 
2.28.0.rc0.12.gb6a658bd00c9

