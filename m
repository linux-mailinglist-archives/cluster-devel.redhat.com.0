Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 317DE1A80DE
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586876587;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DGiblKwOQRpsawySJP5211TE1xLfAxodT5RFblGbLB4=;
	b=JmkHqkVZvjsCaSR8Gmh/iYZWJXWCVMEEFVn7sOYpFM79HGNiBNTMaTMjGYQ1MgO+38rHsm
	I98iQjZVkoBcxNaGQnuX36Wxw30Mh9Z1VzJ5YC4aMi3xGL+O/d/Fgu8y6EKWns5lxjACxS
	+ZrOmtDPwl8VGSZpFGpQdXXe9jaNUAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-WxAnzHdNPb2hIA6-olpSjg-1; Tue, 14 Apr 2020 11:03:05 -0400
X-MC-Unique: WxAnzHdNPb2hIA6-olpSjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D1E6108838C;
	Tue, 14 Apr 2020 15:03:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BFC4116D8A;
	Tue, 14 Apr 2020 15:03:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BF9A18095FF;
	Tue, 14 Apr 2020 15:03:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EF2qvm014840 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:02:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CABD210CD61B; Tue, 14 Apr 2020 15:02:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6DC710CD619
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB8B58FF68D
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-405-BjBBl0d-OPqXtTrFt7FxhQ-1; Tue, 14 Apr 2020 11:02:47 -0400
X-MC-Unique: BjBBl0d-OPqXtTrFt7FxhQ-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jON5A-0006PS-Fc; Tue, 14 Apr 2020 15:02:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:29 -0700
Message-Id: <20200414150233.24495-22-willy@infradead.org>
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EF2qvm014840
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v11 21/25] ext4: Pass the inode to
	ext4_mpage_readpages
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This function now only uses the mapping argument to look up the inode,
and both callers already have the inode, so just pass the inode instead
of the mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ext4.h     | 2 +-
 fs/ext4/inode.c    | 4 ++--
 fs/ext4/readpage.c | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 9f2d3cd1df81..a47a98942626 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3316,7 +3316,7 @@ static inline void ext4_set_de_type(struct super_bloc=
k *sb,
 }
=20
 /* readpages.c */
-extern int ext4_mpage_readpages(struct address_space *mapping,
+extern int ext4_mpage_readpages(struct inode *inode,
 =09=09struct readahead_control *rac, struct page *page);
 extern int __init ext4_init_post_read_processing(void);
 extern void ext4_exit_post_read_processing(void);
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index fafd2862d7cd..604ad98758fe 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3224,7 +3224,7 @@ static int ext4_readpage(struct file *file, struct pa=
ge *page)
 =09=09ret =3D ext4_readpage_inline(inode, page);
=20
 =09if (ret =3D=3D -EAGAIN)
-=09=09return ext4_mpage_readpages(page->mapping, NULL, page);
+=09=09return ext4_mpage_readpages(inode, NULL, page);
=20
 =09return ret;
 }
@@ -3237,7 +3237,7 @@ static void ext4_readahead(struct readahead_control *=
rac)
 =09if (ext4_has_inline_data(inode))
 =09=09return;
=20
-=09ext4_mpage_readpages(rac->mapping, rac, NULL);
+=09ext4_mpage_readpages(inode, rac, NULL);
 }
=20
 static void ext4_invalidatepage(struct page *page, unsigned int offset,
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index 66275f25235d..5761e9961682 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -221,13 +221,12 @@ static inline loff_t ext4_readpage_limit(struct inode=
 *inode)
 =09return i_size_read(inode);
 }
=20
-int ext4_mpage_readpages(struct address_space *mapping,
+int ext4_mpage_readpages(struct inode *inode,
 =09=09struct readahead_control *rac, struct page *page)
 {
 =09struct bio *bio =3D NULL;
 =09sector_t last_block_in_bio =3D 0;
=20
-=09struct inode *inode =3D mapping->host;
 =09const unsigned blkbits =3D inode->i_blkbits;
 =09const unsigned blocks_per_page =3D PAGE_SIZE >> blkbits;
 =09const unsigned blocksize =3D 1 << blkbits;
--=20
2.25.1


