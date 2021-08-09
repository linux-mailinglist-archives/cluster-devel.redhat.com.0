Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2893E3FC6
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Aug 2021 08:22:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-LnHAjJ5qMYqbVfeUcuAxHQ-1; Mon, 09 Aug 2021 02:22:21 -0400
X-MC-Unique: LnHAjJ5qMYqbVfeUcuAxHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 034BA760C0;
	Mon,  9 Aug 2021 06:22:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E559C5D6A1;
	Mon,  9 Aug 2021 06:22:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFB36180BAB1;
	Mon,  9 Aug 2021 06:22:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1796JfDw001930 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 02:19:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F7D063F8E; Mon,  9 Aug 2021 06:19:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0891A637A1
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:19:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EE03100B8E0
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:19:29 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-587-8sid8aqcNUWeooDgvKAgKQ-1; Mon, 09 Aug 2021 02:19:26 -0400
X-MC-Unique: 8sid8aqcNUWeooDgvKAgKQ-1
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCyb7-00Agb9-0j; Mon, 09 Aug 2021 06:17:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon,  9 Aug 2021 08:12:20 +0200
Message-Id: <20210809061244.1196573-7-hch@lst.de>
In-Reply-To: <20210809061244.1196573-1-hch@lst.de>
References: <20210809061244.1196573-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 06/30] fs: mark the iomap argument to
	__block_write_begin_int const
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
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

__block_write_begin_int never modifies the passed in iomap, so mark it
const.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/buffer.c   | 4 ++--
 fs/internal.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 6290c3afdba488..bd6a9e9fbd64c9 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1912,7 +1912,7 @@ EXPORT_SYMBOL(page_zero_new_buffers);
 
 static void
 iomap_to_bh(struct inode *inode, sector_t block, struct buffer_head *bh,
-		struct iomap *iomap)
+		const struct iomap *iomap)
 {
 	loff_t offset = block << inode->i_blkbits;
 
@@ -1966,7 +1966,7 @@ iomap_to_bh(struct inode *inode, sector_t block, struct buffer_head *bh,
 }
 
 int __block_write_begin_int(struct page *page, loff_t pos, unsigned len,
-		get_block_t *get_block, struct iomap *iomap)
+		get_block_t *get_block, const struct iomap *iomap)
 {
 	unsigned from = pos & (PAGE_SIZE - 1);
 	unsigned to = from + len;
diff --git a/fs/internal.h b/fs/internal.h
index 82e8eb32ff3dd8..54c2928d39ec72 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -48,8 +48,8 @@ static inline int emergency_thaw_bdev(struct super_block *sb)
 /*
  * buffer.c
  */
-extern int __block_write_begin_int(struct page *page, loff_t pos, unsigned len,
-		get_block_t *get_block, struct iomap *iomap);
+int __block_write_begin_int(struct page *page, loff_t pos, unsigned len,
+		get_block_t *get_block, const struct iomap *iomap);
 
 /*
  * char_dev.c
-- 
2.30.2

