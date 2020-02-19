Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3C21650B4
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582146107;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YL0y1vH6MzfuyqxxDuSwFJ4HSRLZgVGUwZ7wLppq4xQ=;
	b=MFIYNw2m3ncbG9T8DRIZiK9+VHRAFbCDDN+Nz5OUl4g0stgBiIJYQg/t82ZFOH6ohUfEeb
	P9SCsH/iYNuSC9ucmnfByIcyA5Eg8lF24TLECJbO1vZVXh9cbsDWi7bAlrPC9OpiTs7N1o
	dPVkQn/CnKRJpXVitVJrtWG7NPfmr68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-6_0lVN67NR-nPaAW0fdldg-1; Wed, 19 Feb 2020 16:01:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B491310CE780;
	Wed, 19 Feb 2020 21:01:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E17584779;
	Wed, 19 Feb 2020 21:01:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A0CA35B17;
	Wed, 19 Feb 2020 21:01:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JL1Kks001943 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 16:01:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BE62FF9AA2; Wed, 19 Feb 2020 21:01:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA66DF8A1D
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A149C85A304
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-103-PvdlhjeYP5GACgHLRmfOww-1; Wed, 19 Feb 2020 16:01:11 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4WSu-0008TS-SZ; Wed, 19 Feb 2020 21:01:04 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:00:43 -0800
Message-Id: <20200219210103.32400-5-willy@infradead.org>
In-Reply-To: <20200219210103.32400-1-willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: PvdlhjeYP5GACgHLRmfOww-1
X-MC-Unique: 6_0lVN67NR-nPaAW0fdldg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JL1Kks001943
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v7 04/24] mm: Move readahead nr_pages check
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Simplify the callers by moving the check for nr_pages and the BUG_ON
into read_pages().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
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
2.25.0


