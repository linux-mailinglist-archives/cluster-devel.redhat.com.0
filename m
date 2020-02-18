Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF7616367F
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 23:53:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582066391;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+SXCyVid5eVwCeQDh4ItUMWozLxv9ApZglNzLTFNx7U=;
	b=iI8HLCoh0xzJaQfPd17C3+toijWcCTs8ABTwXUpsk6JqtjeFCe5lVK+SSztEVwARE0w+Vc
	rCQaYtygMwYnj1dCt9e1YTFl3+IETdxvW6TZSahA+rDade2o7y66JSdtATdKMqoKgYMthW
	p77TmqEiVnljio+hNgGfjNg61HJ4qBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-HfyEyG0UNIShmjhjzvGVMg-1; Tue, 18 Feb 2020 17:53:09 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0360B13E4;
	Tue, 18 Feb 2020 22:53:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD5908B561;
	Tue, 18 Feb 2020 22:53:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0465418089C8;
	Tue, 18 Feb 2020 22:53:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IMqlUV024621 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 17:52:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 60A9A2063FEA; Tue, 18 Feb 2020 22:52:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B11B2063FE6
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 22:52:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BE6E804195
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 22:52:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-4-BDWCT_s7Nr2LATOP-IVfvg-1; Tue, 18 Feb 2020 17:52:43 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4BjH-0004Ih-9n; Tue, 18 Feb 2020 22:52:35 +0000
Date: Tue, 18 Feb 2020 14:52:35 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218225235.GH24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-4-willy@infradead.org>
	<20200218050300.GI10776@dread.disaster.area>
	<20200218135618.GO7778@bombadil.infradead.org>
	<20200218224610.GT10776@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200218224610.GT10776@dread.disaster.area>
X-MC-Unique: BDWCT_s7Nr2LATOP-IVfvg-1
X-MC-Unique: HfyEyG0UNIShmjhjzvGVMg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01IMqlUV024621
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

On Wed, Feb 19, 2020 at 09:46:10AM +1100, Dave Chinner wrote:
> On Tue, Feb 18, 2020 at 05:56:18AM -0800, Matthew Wilcox wrote:
> > On Tue, Feb 18, 2020 at 04:03:00PM +1100, Dave Chinner wrote:
> > > On Mon, Feb 17, 2020 at 10:45:44AM -0800, Matthew Wilcox wrote:
> > > > +static void read_pages(struct readahead_control *rac, struct list_=
head *pages,
> > > > +=09=09gfp_t gfp)
> > > >  {
> > > > +=09const struct address_space_operations *aops =3D rac->mapping->a=
_ops;
> > > >  =09struct blk_plug plug;
> > > >  =09unsigned page_idx;
> > >=20
> > > Splitting out the aops rather than the mapping here just looks
> > > weird, especially as you need the mapping later in the function.
> > > Using aops doesn't even reduce the code side....
> >=20
> > It does in subsequent patches ... I agree it looks a little weird here,
> > but I think in the final form, it makes sense:
>=20
> Ok. Perhaps just an additional commit comment to say "read_pages() is
> changed to be aops centric as @rac abstracts away all other
> implementation details by the end of the patchset."

ACK, will add.

> > > > +=09=09=09if (readahead_count(&rac))
> > > > +=09=09=09=09read_pages(&rac, &page_pool, gfp_mask);
> > > > +=09=09=09rac._nr_pages =3D 0;
> > >=20
> > > Hmmm. Wondering ig it make sense to move the gfp_mask to the readahea=
d
> > > control structure - if we have to pass the gfp_mask down all the
> > > way along side the rac, then I think it makes sense to do that...
> >=20
> > So we end up removing it later on in this series, but I do wonder if
> > it would make sense anyway.  By the end of the series, we still have
> > this in iomap:
> >=20
> >                 if (ctx->rac) /* same as readahead_gfp_mask */
> >                         gfp |=3D __GFP_NORETRY | __GFP_NOWARN;
> >=20
> > and we could get rid of that by passing gfp flags down in the rac.  On =
the
> > other hand, I don't know why it doesn't just use readahead_gfp_mask()
> > here anyway ... Christoph?
>=20
> mapping->gfp_mask is awful. Is it a mask, or is it a valid set of
> allocation flags? Or both?  Some callers to mapping_gfp_constraint()
> uses it as a mask, some callers to mapping_gfp_constraint() use it
> as base flags that context specific flags get masked out of,
> readahead_gfp_mask() callers use it as the entire set of gfp flags
> for allocation.
>=20
> That whole API sucks - undocumented as to what it's suposed to do
> and how it's supposed to be used. Hence it's difficult to use
> correctly or understand whether it's being used correctly. And
> reading callers only leads to more confusion and crazy code like in
> do_mpage_readpage() where readahead returns a mask that are used as
> base flags and normal reads return a masked set of base flags...
>=20
> The iomap code is obviously correct when it comes to gfp flag
> manipulation. We start with GFP_KERNEL context, then constrain it
> via the mask held in mapping->gfp_mask, then if it's readahead we
> allow the allocation to silently fail.
>=20
> Simple to read and understand code, versus having weird code that
> requires the reader to decipher an undocumented and inconsistent API
> to understand how the gfp flags have been calculated and are valid.

I think a lot of this is not so much a criticism of mapping->gfp_mask
as a criticism of the whole GFP flags concept.  Some of the flags make
allocations more likely to succeed, others make them more likely to
fail.  Some of them allow the allocator to do more things; some prevent
the allocator from doing things it would otherwise do.  Some of them
aren't flags at all.  Some of them are mutually incompatible (and will
be warned about if set in combination), some of them will silently win
over other flags.

I think they made a certain amount of clunky sense when they were added,
but they've grown to a point where they don't make sense any more and
partly that's because there's nobody standing over the allocator with
a flaming sword promising certain death to anyone who adds a new flag
without thoroughly documenting its interactions with every other flag.

I am no longer a fan of GFP flags ;-)


