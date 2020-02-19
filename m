Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A439F16474A
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 15:41:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582123305;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=knnUi5LkGMDeQeEXEeP8yOZ32h7jRplZKEkU0sZlkYw=;
	b=TNAAjKDr1EYvbOT66dQbKD7+874mwfEc3rnq64HeSmMq2fyiRF+3UFmJyi68p7dlgV+DcZ
	hInPeBNiVha8YSLTk/vRDi3f7PvqzNFTZMLLk73GclbrFdGAJ/DwIkKn+LFePxUo/VpmcB
	hebDn7Jrg0a/FJCHYur6RwHdSZqYDl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-GQ4aKRjdMD6nvs35mpzWyg-1; Wed, 19 Feb 2020 09:41:43 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8AB118AB2C0;
	Wed, 19 Feb 2020 14:41:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 507715C545;
	Wed, 19 Feb 2020 14:41:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0ACB135AE2;
	Wed, 19 Feb 2020 14:41:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JEfSAq010959 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 09:41:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 04F7CF4D5A; Wed, 19 Feb 2020 14:41:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01248F4983
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 14:41:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 225BD803B22
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 14:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-189-xYtrZTCvMn21p2Ka_3t95Q-1; Wed, 19 Feb 2020 09:41:23 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4QXN-00044x-SK; Wed, 19 Feb 2020 14:41:17 +0000
Date: Wed, 19 Feb 2020 06:41:17 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200219144117.GP24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-12-willy@infradead.org>
	<e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
X-MC-Unique: xYtrZTCvMn21p2Ka_3t95Q-1
X-MC-Unique: GQ4aKRjdMD6nvs35mpzWyg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JEfSAq010959
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 07/19] mm: Put readahead pages in
	cache earlier
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 04:01:43PM -0800, John Hubbard wrote:
> How about this instead? It uses the "for" loop fully and more naturally,
> and is easier to read. And it does the same thing:
>=20
> static inline struct page *readahead_page(struct readahead_control *rac)
> {
> =09struct page *page;
>=20
> =09if (!rac->_nr_pages)
> =09=09return NULL;
>=20
> =09page =3D xa_load(&rac->mapping->i_pages, rac->_start);
> =09VM_BUG_ON_PAGE(!PageLocked(page), page);
> =09rac->_batch_count =3D hpage_nr_pages(page);
>=20
> =09return page;
> }
>=20
> static inline struct page *readahead_next(struct readahead_control *rac)
> {
> =09rac->_nr_pages -=3D rac->_batch_count;
> =09rac->_start +=3D rac->_batch_count;
>=20
> =09return readahead_page(rac);
> }
>=20
> #define readahead_for_each(rac, page)=09=09=09\
> =09for (page =3D readahead_page(rac); page !=3D NULL;=09\
> =09     page =3D readahead_page(rac))

I'll go you one better ... how about we do this instead:

static inline struct page *readahead_page(struct readahead_control *rac)
{
        struct page *page;

        BUG_ON(rac->_batch_count > rac->_nr_pages);
        rac->_nr_pages -=3D rac->_batch_count;
        rac->_index +=3D rac->_batch_count;
        rac->_batch_count =3D 0;

        if (!rac->_nr_pages)
                return NULL;

        page =3D xa_load(&rac->mapping->i_pages, rac->_index);
        VM_BUG_ON_PAGE(!PageLocked(page), page);
        rac->_batch_count =3D hpage_nr_pages(page);

        return page;
}

#define readahead_for_each(rac, page)                                   \
        while ((page =3D readahead_page(rac)))

No more readahead_next() to forget to add to filesystems which don't use
the readahead_for_each() iterator.  Ahem.


