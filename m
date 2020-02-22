Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 83A6C168BE5
	for <lists+cluster-devel@lfdr.de>; Sat, 22 Feb 2020 02:55:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582336505;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A8ErBMr1dOQSbr2kFEQq2sLJkM89dVBNMdszE+nxXdU=;
	b=EXfarx/KW3ewuPGCZ7HbYjIHNnYckfSq4+YTaGHeAISPI1P6liQB007neE35cZ55ZXyGYs
	jLsSaeGPi+NEV2FoUIWNjs9OkcoGZHN8Px7tBclqGyECXPJsjKlnX2Uw0JhFOnLTsxTj/K
	06Rfr3mupyOmflFaZ4ewc9KopBGsR3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-U1Jrr0d_OoO_Nc1rUjTT2A-1; Fri, 21 Feb 2020 20:55:03 -0500
X-MC-Unique: U1Jrr0d_OoO_Nc1rUjTT2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F32E0107ACC5;
	Sat, 22 Feb 2020 01:55:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9B3860BE0;
	Sat, 22 Feb 2020 01:54:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D342B1809567;
	Sat, 22 Feb 2020 01:54:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M1sqrL006545 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 20:54:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 312F816544A; Sat, 22 Feb 2020 01:54:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CFE416544F
	for <cluster-devel@redhat.com>; Sat, 22 Feb 2020 01:54:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D222800299
	for <cluster-devel@redhat.com>; Sat, 22 Feb 2020 01:54:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-28-IwsZhq-qMpCFXiWOvH25Cw-1; Fri, 21 Feb 2020 20:54:46 -0500
X-MC-Unique: IwsZhq-qMpCFXiWOvH25Cw-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j5K03-0000tY-FT; Sat, 22 Feb 2020 01:54:35 +0000
Date: Fri, 21 Feb 2020 17:54:35 -0800
From: Matthew Wilcox <willy@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200222015435.GH24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-22-willy@infradead.org>
	<20200222004425.GG9506@magnolia>
MIME-Version: 1.0
In-Reply-To: <20200222004425.GG9506@magnolia>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01M1sqrL006545
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 21/24] iomap: Restructure
	iomap_readpages_actor
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

On Fri, Feb 21, 2020 at 04:44:25PM -0800, Darrick J. Wong wrote:
> On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > By putting the 'have we reached the end of the page' condition at the e=
nd
> > of the loop instead of the beginning, we can remove the 'submit the las=
t
> > page' code from iomap_readpages().  Also check that iomap_readpage_acto=
r()
> > didn't return 0, which would lead to an endless loop.
> >=20
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > ---
> >  fs/iomap/buffered-io.c | 32 ++++++++++++++++++--------------
> >  1 file changed, 18 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index cb3511eb152a..31899e6cb0f8 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_t =
pos, loff_t length,
> >  =09=09void *data, struct iomap *iomap, struct iomap *srcmap)
> >  {
> >  =09struct iomap_readpage_ctx *ctx =3D data;
> > -=09loff_t done, ret;
> > -
> > -=09for (done =3D 0; done < length; done +=3D ret) {
> > -=09=09if (ctx->cur_page && offset_in_page(pos + done) =3D=3D 0) {
> > -=09=09=09if (!ctx->cur_page_in_bio)
> > -=09=09=09=09unlock_page(ctx->cur_page);
> > -=09=09=09put_page(ctx->cur_page);
> > -=09=09=09ctx->cur_page =3D NULL;
> > -=09=09}
> > +=09loff_t ret, done =3D 0;
> > +
> > +=09while (done < length) {
> >  =09=09if (!ctx->cur_page) {
> >  =09=09=09ctx->cur_page =3D iomap_next_page(inode, ctx->pages,
> >  =09=09=09=09=09pos, length, &done);
> > @@ -418,6 +412,20 @@ iomap_readpages_actor(struct inode *inode, loff_t =
pos, loff_t length,
> >  =09=09}
> >  =09=09ret =3D iomap_readpage_actor(inode, pos + done, length - done,
> >  =09=09=09=09ctx, iomap, srcmap);
> > +=09=09done +=3D ret;
> > +
> > +=09=09/* Keep working on a partial page */
> > +=09=09if (ret && offset_in_page(pos + done))
> > +=09=09=09continue;
> > +
> > +=09=09if (!ctx->cur_page_in_bio)
> > +=09=09=09unlock_page(ctx->cur_page);
> > +=09=09put_page(ctx->cur_page);
> > +=09=09ctx->cur_page =3D NULL;
> > +
> > +=09=09/* Don't loop forever if we made no progress */
> > +=09=09if (WARN_ON(!ret))
> > +=09=09=09break;
> >  =09}
> > =20
> >  =09return done;
> > @@ -451,11 +459,7 @@ iomap_readpages(struct address_space *mapping, str=
uct list_head *pages,
> >  done:
> >  =09if (ctx.bio)
> >  =09=09submit_bio(ctx.bio);
> > -=09if (ctx.cur_page) {
> > -=09=09if (!ctx.cur_page_in_bio)
> > -=09=09=09unlock_page(ctx.cur_page);
> > -=09=09put_page(ctx.cur_page);
> > -=09}
> > +=09BUG_ON(ctx.cur_page);
>=20
> Whoah, is the system totally unrecoverably hosed at this point?
>=20
> I get that this /shouldn't/ happen, but should we somehow end up with a
> page here, are we unable either to release it or even just leak it?  I'd
> have thought a WARN_ON would be just fine here.

If we do find a page here, we don't actually know what to do with it.
It might be (currently) locked, it might have the wrong refcount.
Whatever is going on, it's probably better that we stop everything right
here rather than allow things to go further and possibly present bad
data to the application.  I mean, we could even be leaking the previous
contents of this page to userspace.  Or maybe the future contents of a
page which shouldn't be in the page cache any more, but userspace gets
a mapping to it.

I'm not enthusiastic about putting in some code here to try to handle
a "can't happen" case, since it's never going to be tested, and might
end up causing more problems than it tries to solve.  Let's just stop.


