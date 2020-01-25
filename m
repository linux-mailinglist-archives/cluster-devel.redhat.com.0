Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 75D1E14978C
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Jan 2020 20:45:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579981516;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CsJCy7oTxEwzEHS/Vt5w7tcYKSftfVw3tzIS+iJgPhY=;
	b=DjuTOUO98C+nvR2L1kNu4MN8dl05jrBm4CIgA2owlu5QTQ7AhKF56Isffql8I0qHikMACU
	6SYZ4U7qbkQzhKywqzmeNigaVSbtf13Orvf34yX24E9zWAwqF/smwszHNRib2sn4mPVsxJ
	6jN5GLWWILSPTS40Ed5EXNWRIRQg9zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-mfCXLs3sPJeWW6XZQehaZA-1; Sat, 25 Jan 2020 14:45:13 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60C7213E6;
	Sat, 25 Jan 2020 19:45:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8B7D857A2;
	Sat, 25 Jan 2020 19:45:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9D3C85976;
	Sat, 25 Jan 2020 19:45:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00PJivA3026400 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 25 Jan 2020 14:44:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A774610DCF42; Sat, 25 Jan 2020 19:44:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A29B410DCF41
	for <cluster-devel@redhat.com>; Sat, 25 Jan 2020 19:44:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF7EC80005E
	for <cluster-devel@redhat.com>; Sat, 25 Jan 2020 19:44:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-87-CwHekChzODSyyR6Gunu7Fw-1; Sat, 25 Jan 2020 14:44:53 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1ivRMP-0004OA-SC; Sat, 25 Jan 2020 19:44:49 +0000
Date: Sat, 25 Jan 2020 11:44:49 -0800
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Message-ID: <20200125194449.GO4675@bombadil.infradead.org>
References: <20200125013553.24899-1-willy@infradead.org>
	<20200125013553.24899-4-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200125013553.24899-4-willy@infradead.org>
X-MC-Unique: CwHekChzODSyyR6Gunu7Fw-1
X-MC-Unique: mfCXLs3sPJeWW6XZQehaZA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00PJivA3026400
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 03/12] readahead: Put pages in cache
	earlier
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Jan 24, 2020 at 05:35:44PM -0800, Matthew Wilcox wrote:
> @@ -192,8 +194,18 @@ unsigned long __do_page_cache_readahead(struct addre=
ss_space *mapping,
>  =09=09page =3D __page_cache_alloc(gfp_mask);
>  =09=09if (!page)
>  =09=09=09break;
> -=09=09page->index =3D page_offset;
> -=09=09list_add(&page->lru, &page_pool);
> +=09=09if (use_list) {
> +=09=09=09page->index =3D page_offset;
> +=09=09=09list_add(&page->lru, &page_pool);
> +=09=09} else if (!add_to_page_cache_lru(page, mapping, page_offset,
> +=09=09=09=09=09gfp_mask)) {
> +=09=09=09if (nr_pages)
> +=09=09=09=09read_pages(mapping, filp, &page_pool,
> +=09=09=09=09=09=09page_offset - nr_pages,
> +=09=09=09=09=09=09nr_pages);
> +=09=09=09nr_pages =3D 0;

This is missing a call to put_page().

> +=09=09=09continue;
> +=09=09}
>  =09=09if (page_idx =3D=3D nr_to_read - lookahead_size)
>  =09=09=09SetPageReadahead(page);
>  =09=09nr_pages++;


