Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 87C48161A31
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581965207;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nsYSv688m4mLcPu0DvKlP6gpOjSVHpnm0f+/RnI84js=;
	b=b2n+Hsbb26CaS+RNty0npZuRAH1gfqVYVZ7wiRxwM1iWrBPWJNvCEd3F7HSzQscu6bTJ9R
	lCWxqoaxjdYL0VkIrjOz1uCE2zln1Y+lxT0c3rrErviTdlCyIOki4efyg64j+06NgEUl5s
	u5KF2XbIMG0vNwvn1/P9mhr9feuf14E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-teChRvK1OVqBa3JGLu3NEQ-1; Mon, 17 Feb 2020 13:46:45 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CB531408;
	Mon, 17 Feb 2020 18:46:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B92F90761;
	Mon, 17 Feb 2020 18:46:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2047F35AF0;
	Mon, 17 Feb 2020 18:46:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HIkbwQ025089 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:46:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CCADF2166B2E; Mon, 17 Feb 2020 18:46:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C88B52166B2A
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6B24101929F
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-245-zhAovRxyMoSPSKhC5-0H9A-1; Mon, 17 Feb 2020 13:46:34 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3lPL-00059K-JQ; Mon, 17 Feb 2020 18:46:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:45:50 -0800
Message-Id: <20200217184613.19668-10-willy@infradead.org>
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: zhAovRxyMoSPSKhC5-0H9A-1
X-MC-Unique: teChRvK1OVqBa3JGLu3NEQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HIkbwQ025089
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v6 06/19] mm: rename readahead loop variable
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Change the type of page_idx to unsigned long, and rename it -- it's
just a loop counter, not a page index.

Suggested-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/readahead.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 74791b96013f..bdc5759000d3 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -156,7 +156,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09struct inode *inode =3D mapping->host;
 =09unsigned long end_index;=09/* The last page we want to read */
 =09LIST_HEAD(page_pool);
-=09int page_idx;
+=09unsigned long i;
 =09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
 =09struct readahead_control rac =3D {
@@ -174,7 +174,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09/*
 =09 * Preallocate as many pages as we will need.
 =09 */
-=09for (page_idx =3D 0; page_idx < nr_to_read; page_idx++) {
+=09for (i =3D 0; i < nr_to_read; i++) {
 =09=09struct page *page;
=20
 =09=09if (offset > end_index)
@@ -198,7 +198,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09=09break;
 =09=09page->index =3D offset;
 =09=09list_add(&page->lru, &page_pool);
-=09=09if (page_idx =3D=3D nr_to_read - lookahead_size)
+=09=09if (i =3D=3D nr_to_read - lookahead_size)
 =09=09=09SetPageReadahead(page);
 =09=09rac._nr_pages++;
 =09=09offset++;
--=20
2.25.0


