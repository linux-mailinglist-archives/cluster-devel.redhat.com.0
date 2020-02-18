Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6206316277E
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 14:56:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582034201;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dB5A6jOimJL7TVXKn80xMUyZkBuwSISeDy0Y/Na4NoE=;
	b=QWC9Ue0S341BcEeXgx7g7QMeddoRxTTb0f1LuhuIa0mjnR1EbcD5mT8R6DCBCFE9oAZV6I
	o2Ark8ExvVbL/EN+OcpweLDxykrA2zf8WCVDNifDXL9QxOu9G+xQnBMioanahBfVKqhWi6
	hH8J1tTIgf0CZ8RvUVFaufmQrOGEAoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-lgewlNlFPCKPttfu03WD3g-1; Tue, 18 Feb 2020 08:56:39 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4291C800D6C;
	Tue, 18 Feb 2020 13:56:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1ABE19E9C;
	Tue, 18 Feb 2020 13:56:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D154918089C8;
	Tue, 18 Feb 2020 13:56:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IDuWgR023686 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 08:56:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 73AFB10DCF6D; Tue, 18 Feb 2020 13:56:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EF8A10DCF6B
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 13:56:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 630D0804804
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 13:56:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-210-kfkUdBMZMkql4CFrsWmOUQ-1; Tue, 18 Feb 2020 08:56:26 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j43MI-0000Q8-5H; Tue, 18 Feb 2020 13:56:18 +0000
Date: Tue, 18 Feb 2020 05:56:18 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218135618.GO7778@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-4-willy@infradead.org>
	<20200218050300.GI10776@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200218050300.GI10776@dread.disaster.area>
X-MC-Unique: kfkUdBMZMkql4CFrsWmOUQ-1
X-MC-Unique: lgewlNlFPCKPttfu03WD3g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01IDuWgR023686
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 03/19] mm: Use readahead_control to
	pass arguments
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

On Tue, Feb 18, 2020 at 04:03:00PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:45:44AM -0800, Matthew Wilcox wrote:
> > +static void read_pages(struct readahead_control *rac, struct list_head=
 *pages,
> > +=09=09gfp_t gfp)
> >  {
> > +=09const struct address_space_operations *aops =3D rac->mapping->a_ops=
;
> >  =09struct blk_plug plug;
> >  =09unsigned page_idx;
>=20
> Splitting out the aops rather than the mapping here just looks
> weird, especially as you need the mapping later in the function.
> Using aops doesn't even reduce the code side....

It does in subsequent patches ... I agree it looks a little weird here,
but I think in the final form, it makes sense:

static void read_pages(struct readahead_control *rac, struct list_head *pag=
es)
{
        const struct address_space_operations *aops =3D rac->mapping->a_ops=
;
        struct page *page;
        struct blk_plug plug;

        blk_start_plug(&plug);

        if (aops->readahead) {
                aops->readahead(rac);
                readahead_for_each(rac, page) {
                        unlock_page(page);
                        put_page(page);
                }
        } else if (aops->readpages) {
                aops->readpages(rac->file, rac->mapping, pages,
                                readahead_count(rac));
                /* Clean up the remaining pages */
                put_pages_list(pages);
        } else {
                readahead_for_each(rac, page) {
                        aops->readpage(rac->file, page);
                        put_page(page);
                }
        }

        blk_finish_plug(&plug);
}

It'll look even better once ->readpages goes away.

> > @@ -155,9 +158,13 @@ void __do_page_cache_readahead(struct address_spac=
e *mapping,
> >  =09unsigned long end_index;=09/* The last page we want to read */
> >  =09LIST_HEAD(page_pool);
> >  =09int page_idx;
> > -=09unsigned int nr_pages =3D 0;
> >  =09loff_t isize =3D i_size_read(inode);
> >  =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
> > +=09struct readahead_control rac =3D {
> > +=09=09.mapping =3D mapping,
> > +=09=09.file =3D filp,
> > +=09=09._nr_pages =3D 0,
> > +=09};
>=20
> No need to initialise _nr_pages to zero, leaving it out will do the
> same thing.

Yes, it does, but I wanted to make it explicit here.

> > +=09=09=09if (readahead_count(&rac))
> > +=09=09=09=09read_pages(&rac, &page_pool, gfp_mask);
> > +=09=09=09rac._nr_pages =3D 0;
>=20
> Hmmm. Wondering ig it make sense to move the gfp_mask to the readahead
> control structure - if we have to pass the gfp_mask down all the
> way along side the rac, then I think it makes sense to do that...

So we end up removing it later on in this series, but I do wonder if
it would make sense anyway.  By the end of the series, we still have
this in iomap:

                if (ctx->rac) /* same as readahead_gfp_mask */
                        gfp |=3D __GFP_NORETRY | __GFP_NOWARN;

and we could get rid of that by passing gfp flags down in the rac.  On the
other hand, I don't know why it doesn't just use readahead_gfp_mask()
here anyway ... Christoph?


