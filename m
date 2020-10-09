Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6221228B09A
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-b2XollNpP7S2KF43-6lJqg-1; Mon, 12 Oct 2020 04:53:15 -0400
X-MC-Unique: b2XollNpP7S2KF43-6lJqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D37180B721;
	Mon, 12 Oct 2020 08:53:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA6A375138;
	Mon, 12 Oct 2020 08:53:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80F479A04F;
	Mon, 12 Oct 2020 08:53:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JptXA019658 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:51:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 26863205EB12; Fri,  9 Oct 2020 19:51:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 214D0207ABFD
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:51:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 074BF811E90
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:51:55 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-507-I8JUVUELMf6HC5Zul_amtg-3; Fri, 09 Oct 2020 15:51:52 -0400
X-MC-Unique: I8JUVUELMf6HC5Zul_amtg-3
IronPort-SDR: NZB+RrV6SXspdX1O7fJl7+C/8CCji/PpXnIdhbmwMwfHLo5NLtlSD44t52Wimh6yQ0USbttSpK
	ec6c6IIoEUyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="229715099"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="229715099"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:51:51 -0700
IronPort-SDR: OASmflq+Rx+yTtbdwfMJ0o3fYX/22afbp7t4aASuh19KdC4DJdh+fKQIdVVFr7y3ZwUlZzPFTz
	pRsXSfU26jow==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="529053257"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga005-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:51:50 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:49:53 -0700
Message-Id: <20201009195033.3208459-19-ira.weiny@intel.com>
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
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 18/58] fs/hfs: Utilize new
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/hfs/bnode.c | 14 +++++++-------
 fs/hfs/btree.c | 20 ++++++++++----------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/hfs/bnode.c b/fs/hfs/bnode.c
index b63a4df7327b..8b4d02576405 100644
--- a/fs/hfs/bnode.c
+++ b/fs/hfs/bnode.c
@@ -23,8 +23,8 @@ void hfs_bnode_read(struct hfs_bnode *node, void *buf,
 	off += node->page_offset;
 	page = node->page[0];
 
-	memcpy(buf, kmap(page) + off, len);
-	kunmap(page);
+	memcpy(buf, kmap_thread(page) + off, len);
+	kunmap_thread(page);
 }
 
 u16 hfs_bnode_read_u16(struct hfs_bnode *node, int off)
@@ -108,9 +108,9 @@ void hfs_bnode_copy(struct hfs_bnode *dst_node, int dst,
 	src_page = src_node->page[0];
 	dst_page = dst_node->page[0];
 
-	memcpy(kmap(dst_page) + dst, kmap(src_page) + src, len);
-	kunmap(src_page);
-	kunmap(dst_page);
+	memcpy(kmap_thread(dst_page) + dst, kmap_thread(src_page) + src, len);
+	kunmap_thread(src_page);
+	kunmap_thread(dst_page);
 	set_page_dirty(dst_page);
 }
 
@@ -125,9 +125,9 @@ void hfs_bnode_move(struct hfs_bnode *node, int dst, int src, int len)
 	src += node->page_offset;
 	dst += node->page_offset;
 	page = node->page[0];
-	ptr = kmap(page);
+	ptr = kmap_thread(page);
 	memmove(ptr + dst, ptr + src, len);
-	kunmap(page);
+	kunmap_thread(page);
 	set_page_dirty(page);
 }
 
diff --git a/fs/hfs/btree.c b/fs/hfs/btree.c
index 19017d296173..bd4a6d35e361 100644
--- a/fs/hfs/btree.c
+++ b/fs/hfs/btree.c
@@ -80,7 +80,7 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id, btree_keycmp ke
 		goto free_inode;
 
 	/* Load the header */
-	head = (struct hfs_btree_header_rec *)(kmap(page) + sizeof(struct hfs_bnode_desc));
+	head = (struct hfs_btree_header_rec *)(kmap_thread(page) + sizeof(struct hfs_bnode_desc));
 	tree->root = be32_to_cpu(head->root);
 	tree->leaf_count = be32_to_cpu(head->leaf_count);
 	tree->leaf_head = be32_to_cpu(head->leaf_head);
@@ -119,7 +119,7 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id, btree_keycmp ke
 	tree->node_size_shift = ffs(size) - 1;
 	tree->pages_per_bnode = (tree->node_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
 
-	kunmap(page);
+	kunmap_thread(page);
 	put_page(page);
 	return tree;
 
@@ -268,7 +268,7 @@ struct hfs_bnode *hfs_bmap_alloc(struct hfs_btree *tree)
 
 	off += node->page_offset;
 	pagep = node->page + (off >> PAGE_SHIFT);
-	data = kmap(*pagep);
+	data = kmap_thread(*pagep);
 	off &= ~PAGE_MASK;
 	idx = 0;
 
@@ -281,7 +281,7 @@ struct hfs_bnode *hfs_bmap_alloc(struct hfs_btree *tree)
 						idx += i;
 						data[off] |= m;
 						set_page_dirty(*pagep);
-						kunmap(*pagep);
+						kunmap_thread(*pagep);
 						tree->free_nodes--;
 						mark_inode_dirty(tree->inode);
 						hfs_bnode_put(node);
@@ -290,14 +290,14 @@ struct hfs_bnode *hfs_bmap_alloc(struct hfs_btree *tree)
 				}
 			}
 			if (++off >= PAGE_SIZE) {
-				kunmap(*pagep);
-				data = kmap(*++pagep);
+				kunmap_thread(*pagep);
+				data = kmap_thread(*++pagep);
 				off = 0;
 			}
 			idx += 8;
 			len--;
 		}
-		kunmap(*pagep);
+		kunmap_thread(*pagep);
 		nidx = node->next;
 		if (!nidx) {
 			printk(KERN_DEBUG "create new bmap node...\n");
@@ -313,7 +313,7 @@ struct hfs_bnode *hfs_bmap_alloc(struct hfs_btree *tree)
 		off = off16;
 		off += node->page_offset;
 		pagep = node->page + (off >> PAGE_SHIFT);
-		data = kmap(*pagep);
+		data = kmap_thread(*pagep);
 		off &= ~PAGE_MASK;
 	}
 }
@@ -360,7 +360,7 @@ void hfs_bmap_free(struct hfs_bnode *node)
 	}
 	off += node->page_offset + nidx / 8;
 	page = node->page[off >> PAGE_SHIFT];
-	data = kmap(page);
+	data = kmap_thread(page);
 	off &= ~PAGE_MASK;
 	m = 1 << (~nidx & 7);
 	byte = data[off];
@@ -373,7 +373,7 @@ void hfs_bmap_free(struct hfs_bnode *node)
 	}
 	data[off] = byte & ~m;
 	set_page_dirty(page);
-	kunmap(page);
+	kunmap_thread(page);
 	hfs_bnode_put(node);
 	tree->free_nodes++;
 	mark_inode_dirty(tree->inode);
-- 
2.28.0.rc0.12.gb6a658bd00c9

