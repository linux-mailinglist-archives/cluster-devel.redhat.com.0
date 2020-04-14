Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B7CCB1A80CB
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586876583;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IAYQOV4MZXS1vO/BjHWlkYT3aW/UZ+MS8Pr+ec7TBP0=;
	b=DqJLKb6kSv8jS4s4JIQEspd3QKYZ8c0/O0A6KYG36XEsKKIADFGhQvLSCPyILE2nrMDudB
	JwmqRfoWI88+ZDPDpQiiFJRlNcSFcZ78p9ztyc7HKpr5rpLl6StQvOvT739w8os3NJyV8e
	/z2mhEPguqq8PlM6H6MP329A+DXyPLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-mYwM_YjhN8Wc1_NizP5Csg-1; Tue, 14 Apr 2020 11:03:00 -0400
X-MC-Unique: mYwM_YjhN8Wc1_NizP5Csg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2619480256D;
	Tue, 14 Apr 2020 15:02:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E81B5DA7B;
	Tue, 14 Apr 2020 15:02:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE0F093068;
	Tue, 14 Apr 2020 15:02:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EF2p3F014818 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:02:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3BEB20230A6; Tue, 14 Apr 2020 15:02:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF9D5202A940
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C628868C9B
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-45-pW9gzb_QOKa4FEpp68AheA-1; Tue, 14 Apr 2020 11:02:49 -0400
X-MC-Unique: pW9gzb_QOKa4FEpp68AheA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jON5A-0006Ol-4U; Tue, 14 Apr 2020 15:02:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:20 -0700
Message-Id: <20200414150233.24495-13-willy@infradead.org>
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EF2p3F014818
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v11 12/25] mm: Move end_index check out of
	readahead loop
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

By reducing nr_to_read, we can eliminate this check from inside the loop.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 mm/readahead.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index d01531ef9f3c..998fdd23c0b1 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -167,8 +167,6 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09unsigned long lookahead_size)
 {
 =09struct inode *inode =3D mapping->host;
-=09struct page *page;
-=09unsigned long end_index;=09/* The last page we want to read */
 =09LIST_HEAD(page_pool);
 =09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
@@ -178,22 +176,26 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
 =09=09._index =3D index,
 =09};
 =09unsigned long i;
+=09pgoff_t end_index;=09/* The last page we want to read */
=20
 =09if (isize =3D=3D 0)
 =09=09return;
=20
-=09end_index =3D ((isize - 1) >> PAGE_SHIFT);
+=09end_index =3D (isize - 1) >> PAGE_SHIFT;
+=09if (index > end_index)
+=09=09return;
+=09/* Don't read past the page containing the last byte of the file */
+=09if (nr_to_read > end_index - index)
+=09=09nr_to_read =3D end_index - index + 1;
=20
 =09/*
 =09 * Preallocate as many pages as we will need.
 =09 */
 =09for (i =3D 0; i < nr_to_read; i++) {
-=09=09if (index + i > end_index)
-=09=09=09break;
+=09=09struct page *page =3D xa_load(&mapping->i_pages, index + i);
=20
 =09=09BUG_ON(index + i !=3D rac._index + rac._nr_pages);
=20
-=09=09page =3D xa_load(&mapping->i_pages, index + i);
 =09=09if (page && !xa_is_value(page)) {
 =09=09=09/*
 =09=09=09 * Page already present?  Kick off the current batch of
--=20
2.25.1


