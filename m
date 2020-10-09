Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A46428B0C7
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-VCWLi8l0O9eLMUwc71aa_A-1; Mon, 12 Oct 2020 04:53:23 -0400
X-MC-Unique: VCWLi8l0O9eLMUwc71aa_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F4331888A32;
	Mon, 12 Oct 2020 08:53:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF82D73663;
	Mon, 12 Oct 2020 08:53:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D95F0181A870;
	Mon, 12 Oct 2020 08:53:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JrAuE020265 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:53:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0004513D2CFD; Fri,  9 Oct 2020 19:53:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEBF713D2D0E
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:53:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ECD11823609
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:53:06 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-424-NzU8Bb-APoKyDTmKEM2rMQ-1;
	Fri, 09 Oct 2020 15:53:01 -0400
X-MC-Unique: NzU8Bb-APoKyDTmKEM2rMQ-1
IronPort-SDR: 0fv1L56Fzgrb/yo3s6pL6K7DvyobsoRnLsWgi7ovsQkgdwd4st/V4/rxDhMPM6fYSGLpKvIOpC
	rL8pIBGBJn5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182976371"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="182976371"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:53:00 -0700
IronPort-SDR: Wf0Bi1Gs1P3ZgILN9Dk8+ODZhbqXc7J3tJZabe+2AUx5fg/nQYQB2E9E/9NHNQgBhyfVAmIu+q
	D7ag8zQ3enrg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="462300964"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga004-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:52:58 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:11 -0700
Message-Id: <20201009195033.3208459-37-ira.weiny@intel.com>
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
	linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 36/58] fs/ext2: Use
	ext2_put_page
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

There are 3 places in namei.c where the equivalent of ext2_put_page() is
open coded.  We want to use k[un]map_thread() instead of k[un]map() in
ext2_[get|put]_page().

Move ext2_put_page() to ext2.h and use it in namei.c in prep for
converting the k[un]map() code.

Cc: Jan Kara <jack@suse.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/ext2/dir.c   |  6 ------
 fs/ext2/ext2.h  |  8 ++++++++
 fs/ext2/namei.c | 15 +++++----------
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/fs/ext2/dir.c b/fs/ext2/dir.c
index 70355ab6740e..f3194bf20733 100644
--- a/fs/ext2/dir.c
+++ b/fs/ext2/dir.c
@@ -66,12 +66,6 @@ static inline unsigned ext2_chunk_size(struct inode *inode)
 	return inode->i_sb->s_blocksize;
 }
 
-static inline void ext2_put_page(struct page *page)
-{
-	kunmap(page);
-	put_page(page);
-}
-
 /*
  * Return the offset into page `page_nr' of the last valid
  * byte in that page, plus one.
diff --git a/fs/ext2/ext2.h b/fs/ext2/ext2.h
index 5136b7289e8d..021ec8b42ac3 100644
--- a/fs/ext2/ext2.h
+++ b/fs/ext2/ext2.h
@@ -16,6 +16,8 @@
 #include <linux/blockgroup_lock.h>
 #include <linux/percpu_counter.h>
 #include <linux/rbtree.h>
+#include <linux/mm.h>
+#include <linux/highmem.h>
 
 /* XXX Here for now... not interested in restructing headers JUST now */
 
@@ -745,6 +747,12 @@ extern int ext2_delete_entry (struct ext2_dir_entry_2 *, struct page *);
 extern int ext2_empty_dir (struct inode *);
 extern struct ext2_dir_entry_2 * ext2_dotdot (struct inode *, struct page **);
 extern void ext2_set_link(struct inode *, struct ext2_dir_entry_2 *, struct page *, struct inode *, int);
+static inline void ext2_put_page(struct page *page)
+{
+	kunmap(page);
+	put_page(page);
+}
+
 
 /* ialloc.c */
 extern struct inode * ext2_new_inode (struct inode *, umode_t, const struct qstr *);
diff --git a/fs/ext2/namei.c b/fs/ext2/namei.c
index 5bf2c145643b..ea980f1e2e99 100644
--- a/fs/ext2/namei.c
+++ b/fs/ext2/namei.c
@@ -389,23 +389,18 @@ static int ext2_rename (struct inode * old_dir, struct dentry * old_dentry,
 	if (dir_de) {
 		if (old_dir != new_dir)
 			ext2_set_link(old_inode, dir_de, dir_page, new_dir, 0);
-		else {
-			kunmap(dir_page);
-			put_page(dir_page);
-		}
+		else
+			ext2_put_page(dir_page);
 		inode_dec_link_count(old_dir);
 	}
 	return 0;
 
 
 out_dir:
-	if (dir_de) {
-		kunmap(dir_page);
-		put_page(dir_page);
-	}
+	if (dir_de)
+		ext2_put_page(dir_page);
 out_old:
-	kunmap(old_page);
-	put_page(old_page);
+	ext2_put_page(old_page);
 out:
 	return err;
 }
-- 
2.28.0.rc0.12.gb6a658bd00c9

