Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE1418FF80
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Mar 2020 21:27:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584995259;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Zgz5UJtI8wUGHQ2e9ROMlzFL1784KHEQ0AwvosP9nP0=;
	b=CCp6MWbb0J3jtxUfcMpCcG3LBYjV6MbbPe7wuwKksZ+522l+WLR+Ve4bK5AiIgizU0futG
	zf2iGZIaU6ynPeBzLW/Mc+adBy+c1aXzER6ZWVKej7ycd4f1rmFn4Gh/pFjD3ltQt1UNsR
	cdwJk1WbAcK+BIpMVnHWM9y2+TgQ/7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-n3WjhmDAPQujnmC1Sd5e5Q-1; Mon, 23 Mar 2020 16:27:37 -0400
X-MC-Unique: n3WjhmDAPQujnmC1Sd5e5Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8345018CA24C;
	Mon, 23 Mar 2020 20:27:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F54C5DA82;
	Mon, 23 Mar 2020 20:27:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BFF486382;
	Mon, 23 Mar 2020 20:27:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NKNKuA014734 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 16:23:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F6142022EAD; Mon, 23 Mar 2020 20:23:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B6F22026D68
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 20:23:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 064388007D0
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 20:23:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-239-gHTAD8fYNgqCtgAxFJ_dew-1; Mon, 23 Mar 2020 16:23:17 -0400
X-MC-Unique: gHTAD8fYNgqCtgAxFJ_dew-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jGTbB-0003Uh-GN; Mon, 23 Mar 2020 20:23:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 23 Mar 2020 13:22:38 -0700
Message-Id: <20200323202259.13363-5-willy@infradead.org>
In-Reply-To: <20200323202259.13363-1-willy@infradead.org>
References: <20200323202259.13363-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02NKNKuA014734
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	Zi Yan <ziy@nvidia.com>, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v10 04/25] mm: Move readahead nr_pages check
	into read_pages
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

Simplify the callers by moving the check for nr_pages and the BUG_ON
into read_pages().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 mm/readahead.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 61b15b6b9e72..9fcd4e32b62d 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -119,6 +119,9 @@ static void read_pages(struct address_space *mapping, s=
truct file *filp,
 =09struct blk_plug plug;
 =09unsigned page_idx;
=20
+=09if (!nr_pages)
+=09=09return;
+
 =09blk_start_plug(&plug);
=20
 =09if (mapping->a_ops->readpages) {
@@ -138,6 +141,8 @@ static void read_pages(struct address_space *mapping, s=
truct file *filp,
=20
 out:
 =09blk_finish_plug(&plug);
+
+=09BUG_ON(!list_empty(pages));
 }
=20
 /*
@@ -180,8 +185,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09=09 * contiguous pages before continuing with the next
 =09=09=09 * batch.
 =09=09=09 */
-=09=09=09if (nr_pages)
-=09=09=09=09read_pages(mapping, filp, &page_pool, nr_pages,
+=09=09=09read_pages(mapping, filp, &page_pool, nr_pages,
 =09=09=09=09=09=09gfp_mask);
 =09=09=09nr_pages =3D 0;
 =09=09=09continue;
@@ -202,9 +206,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09 * uptodate then the caller will launch readpage again, and
 =09 * will then handle the error.
 =09 */
-=09if (nr_pages)
-=09=09read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
-=09BUG_ON(!list_empty(&page_pool));
+=09read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
 }
=20
 /*
--=20
2.25.1


