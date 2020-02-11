Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C6207158745
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Feb 2020 02:04:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581383055;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y5vEzsDjylX42HotPsEBDp6sATTemJtI8HgrAbQClSA=;
	b=VijejoW8wCUhOxH5mB03+h5fqqWv97c36bklwkjY/047OjMnGo6NJCpvYaYDwo/WdGkbIn
	s1QW/m8wFjAG6facsoMDuO2Lv8SZQDsDnsXXBRMBCfwngjrajX7UTQb+QOugVPF4Z9Y9yv
	6tBdzxbJA34YaPQeOP6a5e04uR+sc9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-qUouepcQPmqTGBIMFZgjeA-1; Mon, 10 Feb 2020 20:04:13 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E27F107ACC7;
	Tue, 11 Feb 2020 01:04:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A9805DA2C;
	Tue, 11 Feb 2020 01:04:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A5EE18089C8;
	Tue, 11 Feb 2020 01:04:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B145kD019380 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 20:04:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 24274C6906; Tue, 11 Feb 2020 01:04:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FD95B3517
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 01:04:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0613E802FF7
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 01:04:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-384-MT9ZYRkAMha08U3PO9uu_w-1; Mon, 10 Feb 2020 20:04:02 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j1Jxu-0001nl-BQ; Tue, 11 Feb 2020 01:03:50 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 10 Feb 2020 17:03:37 -0800
Message-Id: <20200211010348.6872-3-willy@infradead.org>
In-Reply-To: <20200211010348.6872-1-willy@infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: MT9ZYRkAMha08U3PO9uu_w-1
X-MC-Unique: qUouepcQPmqTGBIMFZgjeA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B145kD019380
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v5 02/13] mm: Ignore return value of
	->readpages
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

We used to assign the return value to a variable, which we then ignored.
Remove the pretence of caring.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/readahead.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 6bf73ef33b7e..fc77d13af556 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -113,17 +113,16 @@ int read_cache_pages(struct address_space *mapping, s=
truct list_head *pages,
=20
 EXPORT_SYMBOL(read_cache_pages);
=20
-static int read_pages(struct address_space *mapping, struct file *filp,
+static void read_pages(struct address_space *mapping, struct file *filp,
 =09=09struct list_head *pages, unsigned int nr_pages, gfp_t gfp)
 {
 =09struct blk_plug plug;
 =09unsigned page_idx;
-=09int ret;
=20
 =09blk_start_plug(&plug);
=20
 =09if (mapping->a_ops->readpages) {
-=09=09ret =3D mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
+=09=09mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
 =09=09/* Clean up the remaining pages */
 =09=09put_pages_list(pages);
 =09=09goto out;
@@ -136,12 +135,9 @@ static int read_pages(struct address_space *mapping, s=
truct file *filp,
 =09=09=09mapping->a_ops->readpage(filp, page);
 =09=09put_page(page);
 =09}
-=09ret =3D 0;
=20
 out:
 =09blk_finish_plug(&plug);
-
-=09return ret;
 }
=20
 /*
--=20
2.25.0


