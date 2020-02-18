Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 520D916278B
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 14:57:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582034272;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Efwc1eSz4Alh54CG019+oLjnn61+4w1UgbZ94xhhjms=;
	b=DH6zZEwminjsnz86/R7e2TSnhDFkhb54E/T+HmhgqiS2kaV5c1GZ5HuU3vpM9ukQllVKKw
	ArjYG4O/wvaGVCLve3J2hmufZ2fYpBTmFkcSNqpmg9PSJnUi9nCqI0cywJ4eRppJEHYmzW
	LCO4Mnr3NuuYoadykaitmDw9epkjwh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-d6Q51UEoNZ67axEZbj7acA-1; Tue, 18 Feb 2020 08:57:50 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11EE4107B7D6;
	Tue, 18 Feb 2020 13:57:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D46E860C87;
	Tue, 18 Feb 2020 13:57:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 863B118095FF;
	Tue, 18 Feb 2020 13:57:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IDviNW023770 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 08:57:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B053D2166B28; Tue, 18 Feb 2020 13:57:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC4732166B27
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 13:57:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A460E8012D8
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 13:57:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-107-gB2JZGHeOdyA5P-xa9mxFw-1; Tue, 18 Feb 2020 08:57:40 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j43NY-0000gx-Gn; Tue, 18 Feb 2020 13:57:36 +0000
Date: Tue, 18 Feb 2020 05:57:36 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218135736.GP7778@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-5-willy@infradead.org>
	<20200218050824.GJ10776@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200218050824.GJ10776@dread.disaster.area>
X-MC-Unique: gB2JZGHeOdyA5P-xa9mxFw-1
X-MC-Unique: d6Q51UEoNZ67axEZbj7acA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01IDviNW023770
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 04/19] mm: Rearrange readahead loop
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 04:08:24PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:45:45AM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > Move the declaration of 'page' to inside the loop and move the 'kick
> > off a fresh batch' code to the end of the function for easier use in
> > subsequent patches.
>=20
> Stale? the "kick off" code is moved to the tail of the loop, not the
> end of the function.

Braino; I meant to write end of the loop.

> > @@ -183,14 +183,14 @@ void __do_page_cache_readahead(struct address_spa=
ce *mapping,
> >  =09=09page =3D xa_load(&mapping->i_pages, page_offset);
> >  =09=09if (page && !xa_is_value(page)) {
> >  =09=09=09/*
> > -=09=09=09 * Page already present?  Kick off the current batch of
> > -=09=09=09 * contiguous pages before continuing with the next
> > -=09=09=09 * batch.
> > +=09=09=09 * Page already present?  Kick off the current batch
> > +=09=09=09 * of contiguous pages before continuing with the
> > +=09=09=09 * next batch.  This page may be the one we would
> > +=09=09=09 * have intended to mark as Readahead, but we don't
> > +=09=09=09 * have a stable reference to this page, and it's
> > +=09=09=09 * not worth getting one just for that.
> >  =09=09=09 */
> > -=09=09=09if (readahead_count(&rac))
> > -=09=09=09=09read_pages(&rac, &page_pool, gfp_mask);
> > -=09=09=09rac._nr_pages =3D 0;
> > -=09=09=09continue;
> > +=09=09=09goto read;
> >  =09=09}
> > =20
> >  =09=09page =3D __page_cache_alloc(gfp_mask);
> > @@ -201,6 +201,11 @@ void __do_page_cache_readahead(struct address_spac=
e *mapping,
> >  =09=09if (page_idx =3D=3D nr_to_read - lookahead_size)
> >  =09=09=09SetPageReadahead(page);
> >  =09=09rac._nr_pages++;
> > +=09=09continue;
> > +read:
> > +=09=09if (readahead_count(&rac))
> > +=09=09=09read_pages(&rac, &page_pool, gfp_mask);
> > +=09=09rac._nr_pages =3D 0;
> >  =09}
>=20
> Also, why? This adds a goto from branched code that continues, then
> adds a continue so the unbranched code doesn't execute the code the
> goto jumps to. In absence of any explanation, this isn't an
> improvement and doesn't make any sense...

I thought I was explaining it ... "for easier use in subsequent patches".


