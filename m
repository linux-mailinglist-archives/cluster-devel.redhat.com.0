Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9222C1A80E3
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586876588;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G+WhnmTw5pHlx65z3X7GgHKemMXm67ivjbqvsUYIh9w=;
	b=REhqxQaVa6K+fRi1QJMI07hCLZELMG1loZQM2qp5xA2qrmkom6mD0vq8obDq4eEEBU90Ou
	rJ5ACrXBkRxumvQT7YaOo9FKfo64Wwhxui8IfKwsFe8rcrNj40PXRwVgQ1r8wslbuCf6lR
	o5P5wTXJwc6AgYjc3SdSOPkEDZXrLGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-LeLSDt5BOxqiCvrA-objdQ-1; Tue, 14 Apr 2020 11:03:06 -0400
X-MC-Unique: LeLSDt5BOxqiCvrA-objdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E3A710CE78A;
	Tue, 14 Apr 2020 15:03:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20BC8272A5;
	Tue, 14 Apr 2020 15:03:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED41D18089CD;
	Tue, 14 Apr 2020 15:03:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EF2xLj014954 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:02:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7A7D820267F2; Tue, 14 Apr 2020 15:02:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 767E72026FFE
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AA8580028B
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-479-4x3q06R0NeuQhRlcP8MGLA-1; Tue, 14 Apr 2020 11:02:56 -0400
X-MC-Unique: 4x3q06R0NeuQhRlcP8MGLA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jON59-0006OS-Vg; Tue, 14 Apr 2020 15:02:35 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:16 -0700
Message-Id: <20200414150233.24495-9-willy@infradead.org>
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EF2xLj014954
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v11 08/25] mm: rename readahead loop
	variable to 'i'
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
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
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
2.25.1


