Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 558EB1650A4
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582146095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3UmIrmBlsLH/wgazf8ddF0Pr/kUonTj1vpJx0U9RyQY=;
	b=NJP84C6BFdrWdJjAfz0GHgrDZRlf0hIHesX641a9QjXuv1X2PopFJkeip9IQutK9w0YJ8b
	tPwWVmFza6tVxkbf7ROHyAfJQWGIIkkeDCh2ziDI7TdeQ7KDEZQx5dmUE5D+rZRs6Za6zG
	OS6aiGjHUsOkbXM3erjKPMxoHvrel0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-glccL7suO5abjM2e-KrPRw-1; Wed, 19 Feb 2020 16:01:31 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61A0E1882CDB;
	Wed, 19 Feb 2020 21:01:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 485535C1B0;
	Wed, 19 Feb 2020 21:01:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24CB41803C37;
	Wed, 19 Feb 2020 21:01:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JL1LF4001953 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 16:01:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0B1582028CD4; Wed, 19 Feb 2020 21:01:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06A512028CD3
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E15E88007AC
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-62-_AtyA6JJPxiPkNRHE3UzCw-1; Wed, 19 Feb 2020 16:01:17 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4WSv-0008Tu-3k; Wed, 19 Feb 2020 21:01:05 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:00:50 -0800
Message-Id: <20200219210103.32400-12-willy@infradead.org>
In-Reply-To: <20200219210103.32400-1-willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: _AtyA6JJPxiPkNRHE3UzCw-1
X-MC-Unique: glccL7suO5abjM2e-KrPRw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JL1LF4001953
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v7 11/24] mm: Move end_index check out of
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

By reducing nr_to_read, we can eliminate this check from inside the loop.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/readahead.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 07cdfbf00f4b..ace611f4bf05 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -166,8 +166,6 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09unsigned long lookahead_size)
 {
 =09struct inode *inode =3D mapping->host;
-=09struct page *page;
-=09unsigned long end_index;=09/* The last page we want to read */
 =09LIST_HEAD(page_pool);
 =09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
@@ -179,22 +177,27 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
 =09=09._nr_pages =3D 0,
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
+=09if (index + nr_to_read < index)
+=09=09nr_to_read =3D ULONG_MAX - index + 1;
+=09if (index + nr_to_read >=3D end_index)
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
2.25.0


