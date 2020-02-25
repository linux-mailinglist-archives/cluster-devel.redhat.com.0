Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CDA7016F190
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Feb 2020 22:49:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582667350;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TvVnOK1WogBGyyqGoi4sosbrnpcYqxf8pRDemkE+H/g=;
	b=YM8UyEHwFdWxE7Hv/FL4Bnp0e8hXJr1rQdplTcC3fSVvMrqRZ8R2zCKZEb5TTHRCJe5/BG
	HeDwRUMJSla6goXkfpOdJPpI3IILNRP+poIGvr+aNeyep+s5R+qLfHg9Z6p0BG2fhNy55U
	Dc6i/yTQowQBiTxA2WOBeA1LY7yC+0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-eJI1_eBHNGGGXPIOZ2w9nQ-1; Tue, 25 Feb 2020 16:49:08 -0500
X-MC-Unique: eJI1_eBHNGGGXPIOZ2w9nQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FC351882CE0;
	Tue, 25 Feb 2020 21:49:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B76F92969;
	Tue, 25 Feb 2020 21:49:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0052A18089CE;
	Tue, 25 Feb 2020 21:49:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PLmtwW010629 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 16:48:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0C3AEF84C8; Tue, 25 Feb 2020 21:48:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08135F84CF
	for <cluster-devel@redhat.com>; Tue, 25 Feb 2020 21:48:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 490F3185A794
	for <cluster-devel@redhat.com>; Tue, 25 Feb 2020 21:48:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-135-b55FW6LqMsWGsZJ6UmngUg-1; Tue, 25 Feb 2020 16:48:50 -0500
X-MC-Unique: b55FW6LqMsWGsZJ6UmngUg-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6i4H-0007pj-6E; Tue, 25 Feb 2020 21:48:41 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 25 Feb 2020 13:48:21 -0800
Message-Id: <20200225214838.30017-9-willy@infradead.org>
In-Reply-To: <20200225214838.30017-1-willy@infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01PLmtwW010629
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v8 08/25] mm: rename readahead loop variable
	to 'i'
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

Change the type of page_idx to unsigned long, and rename it -- it's
just a loop counter, not a page index.

Suggested-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Dave Chinner <dchinner@redhat.com>
---
 mm/readahead.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 8a65d6bd97e0..7ce320854bad 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -163,13 +163,13 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
 =09struct page *page;
 =09unsigned long end_index;=09/* The last page we want to read */
 =09LIST_HEAD(page_pool);
-=09int page_idx;
 =09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
 =09struct readahead_control rac =3D {
 =09=09.mapping =3D mapping,
 =09=09.file =3D filp,
 =09};
+=09unsigned long i;
=20
 =09if (isize =3D=3D 0)
 =09=09return;
@@ -179,8 +179,8 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09/*
 =09 * Preallocate as many pages as we will need.
 =09 */
-=09for (page_idx =3D 0; page_idx < nr_to_read; page_idx++) {
-=09=09pgoff_t page_offset =3D index + page_idx;
+=09for (i =3D 0; i < nr_to_read; i++) {
+=09=09pgoff_t page_offset =3D index + i;
=20
 =09=09if (page_offset > end_index)
 =09=09=09break;
@@ -201,7 +201,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09=09break;
 =09=09page->index =3D page_offset;
 =09=09list_add(&page->lru, &page_pool);
-=09=09if (page_idx =3D=3D nr_to_read - lookahead_size)
+=09=09if (i =3D=3D nr_to_read - lookahead_size)
 =09=09=09SetPageReadahead(page);
 =09=09rac._nr_pages++;
 =09}
--=20
2.25.0


