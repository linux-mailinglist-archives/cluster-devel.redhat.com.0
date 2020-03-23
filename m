Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id F38D718FF7D
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Mar 2020 21:27:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584995255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L/mLMsVg3VGmDyEFfRiU1U6rDNaNccPAL01Cf0gOogU=;
	b=DSlstf3lNA29VhE1cgWgWfYUpfVtcTMxkO94sNBrUqc3qhbvCAhVLRJITjedAm5cpXcUae
	esdnjtqrF3fBQKDlqgA96kfErZITlyYC4gve60IXxMxlLXyULxTOGk0f6bPqGVeYgmX0cq
	cc4sLpon2ubsYE5X7K75E6NHkbrUUzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-nw4xDkd_Oay4K9pwODCEkg-1; Mon, 23 Mar 2020 16:27:33 -0400
X-MC-Unique: nw4xDkd_Oay4K9pwODCEkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A30E18CA243;
	Mon, 23 Mar 2020 20:27:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 566E89B932;
	Mon, 23 Mar 2020 20:27:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C4C086396;
	Mon, 23 Mar 2020 20:27:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NKNGFM014651 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 16:23:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D65DF9ADB; Mon, 23 Mar 2020 20:23:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 679E1100D7D
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 20:23:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3380A185A793
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 20:23:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-263-Qo5F0ghdPpCY7XdkbVi8Aw-1; Mon, 23 Mar 2020 16:23:12 -0400
X-MC-Unique: Qo5F0ghdPpCY7XdkbVi8Aw-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jGTbC-0003W1-5P; Mon, 23 Mar 2020 20:23:02 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 23 Mar 2020 13:22:57 -0700
Message-Id: <20200323202259.13363-24-willy@infradead.org>
In-Reply-To: <20200323202259.13363-1-willy@infradead.org>
References: <20200323202259.13363-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02NKNGFM014651
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Chao Yu <yuchao0@huawei.com>,
	William Kucharski <william.kucharski@oracle.com>,
	Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v10 23/25] f2fs: Pass the inode to
	f2fs_mpage_readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2109ce23076d..4cd76973e6c8 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2148,12 +2148,11 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, =
struct bio **bio_ret,
  * use ->readpage() or do the necessary surgery to decouple ->readpages()
  * from read-ahead.
  */
-static int f2fs_mpage_readpages(struct address_space *mapping,
+static int f2fs_mpage_readpages(struct inode *inode,
 =09=09struct readahead_control *rac, struct page *page)
 {
 =09struct bio *bio =3D NULL;
 =09sector_t last_block_in_bio =3D 0;
-=09struct inode *inode =3D mapping->host;
 =09struct f2fs_map_blocks map;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 =09struct compress_ctx cc =3D {
@@ -2265,7 +2264,7 @@ static int f2fs_read_data_page(struct file *file, str=
uct page *page)
 =09if (f2fs_has_inline_data(inode))
 =09=09ret =3D f2fs_read_inline_data(inode, page);
 =09if (ret =3D=3D -EAGAIN)
-=09=09ret =3D f2fs_mpage_readpages(page_file_mapping(page), NULL, page);
+=09=09ret =3D f2fs_mpage_readpages(inode, NULL, page);
 =09return ret;
 }
=20
@@ -2282,7 +2281,7 @@ static void f2fs_readahead(struct readahead_control *=
rac)
 =09if (f2fs_has_inline_data(inode))
 =09=09return;
=20
-=09f2fs_mpage_readpages(rac->mapping, rac, NULL);
+=09f2fs_mpage_readpages(inode, rac, NULL);
 }
=20
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
--=20
2.25.1


