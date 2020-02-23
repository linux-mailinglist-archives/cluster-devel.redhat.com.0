Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 808C7169945
	for <lists+cluster-devel@lfdr.de>; Sun, 23 Feb 2020 18:58:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582480715;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nv0z1sZMYzP3RJY1J6uyRnZx/zLgHOqZWam/W2htxAg=;
	b=BWOhN42xDVfJD80bghKLfrBu6aCLXb6AD6A7IOEA9EZK5OGnXHPrXw1+KeWSRUmodGGNmW
	tArrtjsr4rSHSrTd3B/8xsywV02JnUcGcXh3lIaSQ/4ODNCqe0JU/8SR36J3Zsom3YNeZI
	JmZT+V21p0o01JbXBcyfHnDYURRbeP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-JzCE_F0zPWOgcjD1pmbjYQ-1; Sun, 23 Feb 2020 12:58:33 -0500
X-MC-Unique: JzCE_F0zPWOgcjD1pmbjYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5810D100550E;
	Sun, 23 Feb 2020 17:58:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E52FC9183D;
	Sun, 23 Feb 2020 17:58:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A03918089CD;
	Sun, 23 Feb 2020 17:58:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01NHwGxi017512 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 23 Feb 2020 12:58:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 324C62166B2E; Sun, 23 Feb 2020 17:58:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D5E32166B2B
	for <cluster-devel@redhat.com>; Sun, 23 Feb 2020 17:58:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6CC380028B
	for <cluster-devel@redhat.com>; Sun, 23 Feb 2020 17:58:13 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-321-pJsF5XHfM_-Kw47FURYCAQ-1; Sun, 23 Feb 2020 12:58:11 -0500
X-MC-Unique: pJsF5XHfM_-Kw47FURYCAQ-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01NHvWju073441; Sun, 23 Feb 2020 17:57:32 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 2yavxrbtp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 23 Feb 2020 17:57:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01NHq2br019936; Sun, 23 Feb 2020 17:55:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3020.oracle.com with ESMTP id 2ybe3cnq93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Sun, 23 Feb 2020 17:55:31 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01NHtVwC036442;
	Sun, 23 Feb 2020 17:55:31 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3020.oracle.com with ESMTP id 2ybe3cnq8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 23 Feb 2020 17:55:31 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01NHtP55027269;
	Sun, 23 Feb 2020 17:55:25 GMT
Received: from localhost (/10.159.228.17)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sun, 23 Feb 2020 09:55:25 -0800
Date: Sun, 23 Feb 2020 09:55:23 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200223175523.GK9506@magnolia>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-22-willy@infradead.org>
	<20200222004425.GG9506@magnolia>
	<20200222015435.GH24185@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200222015435.GH24185@bombadil.infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9540
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
	lowpriorityscore=0
	spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=999
	malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002230148
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01NHwGxi017512
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Feb 21, 2020 at 05:54:35PM -0800, Matthew Wilcox wrote:
> On Fri, Feb 21, 2020 at 04:44:25PM -0800, Darrick J. Wong wrote:
> > On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > >=20
> > > By putting the 'have we reached the end of the page' condition at the=
 end
> > > of the loop instead of the beginning, we can remove the 'submit the l=
ast
> > > page' code from iomap_readpages().  Also check that iomap_readpage_ac=
tor()
> > > didn't return 0, which would lead to an endless loop.
> > >=20
> > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > ---
> > >  fs/iomap/buffered-io.c | 32 ++++++++++++++++++--------------
> > >  1 file changed, 18 insertions(+), 14 deletions(-)
> > >=20
> > > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > > index cb3511eb152a..31899e6cb0f8 100644
> > > --- a/fs/iomap/buffered-io.c
> > > +++ b/fs/iomap/buffered-io.c
> > > @@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_=
t pos, loff_t length,
> > >  =09=09void *data, struct iomap *iomap, struct iomap *srcmap)
> > >  {
> > >  =09struct iomap_readpage_ctx *ctx =3D data;
> > > -=09loff_t done, ret;
> > > -
> > > -=09for (done =3D 0; done < length; done +=3D ret) {
> > > -=09=09if (ctx->cur_page && offset_in_page(pos + done) =3D=3D 0) {
> > > -=09=09=09if (!ctx->cur_page_in_bio)
> > > -=09=09=09=09unlock_page(ctx->cur_page);
> > > -=09=09=09put_page(ctx->cur_page);
> > > -=09=09=09ctx->cur_page =3D NULL;
> > > -=09=09}
> > > +=09loff_t ret, done =3D 0;
> > > +
> > > +=09while (done < length) {
> > >  =09=09if (!ctx->cur_page) {
> > >  =09=09=09ctx->cur_page =3D iomap_next_page(inode, ctx->pages,
> > >  =09=09=09=09=09pos, length, &done);
> > > @@ -418,6 +412,20 @@ iomap_readpages_actor(struct inode *inode, loff_=
t pos, loff_t length,
> > >  =09=09}
> > >  =09=09ret =3D iomap_readpage_actor(inode, pos + done, length - done,
> > >  =09=09=09=09ctx, iomap, srcmap);
> > > +=09=09done +=3D ret;
> > > +
> > > +=09=09/* Keep working on a partial page */
> > > +=09=09if (ret && offset_in_page(pos + done))
> > > +=09=09=09continue;
> > > +
> > > +=09=09if (!ctx->cur_page_in_bio)
> > > +=09=09=09unlock_page(ctx->cur_page);
> > > +=09=09put_page(ctx->cur_page);
> > > +=09=09ctx->cur_page =3D NULL;
> > > +
> > > +=09=09/* Don't loop forever if we made no progress */
> > > +=09=09if (WARN_ON(!ret))
> > > +=09=09=09break;
> > >  =09}
> > > =20
> > >  =09return done;
> > > @@ -451,11 +459,7 @@ iomap_readpages(struct address_space *mapping, s=
truct list_head *pages,
> > >  done:
> > >  =09if (ctx.bio)
> > >  =09=09submit_bio(ctx.bio);
> > > -=09if (ctx.cur_page) {
> > > -=09=09if (!ctx.cur_page_in_bio)
> > > -=09=09=09unlock_page(ctx.cur_page);
> > > -=09=09put_page(ctx.cur_page);
> > > -=09}
> > > +=09BUG_ON(ctx.cur_page);
> >=20
> > Whoah, is the system totally unrecoverably hosed at this point?
> >=20
> > I get that this /shouldn't/ happen, but should we somehow end up with a
> > page here, are we unable either to release it or even just leak it?  I'=
d
> > have thought a WARN_ON would be just fine here.
>=20
> If we do find a page here, we don't actually know what to do with it.
> It might be (currently) locked, it might have the wrong refcount.
> Whatever is going on, it's probably better that we stop everything right
> here rather than allow things to go further and possibly present bad
> data to the application.  I mean, we could even be leaking the previous
> contents of this page to userspace.  Or maybe the future contents of a
> page which shouldn't be in the page cache any more, but userspace gets
> a mapping to it.
>=20
> I'm not enthusiastic about putting in some code here to try to handle
> a "can't happen" case, since it's never going to be tested, and might
> end up causing more problems than it tries to solve.  Let's just stop.

Seeing how Linus (and others like myself) are a bit allergic to BUG
these days, could you add the first paragraph of the above justification
as a comment adjacent to the BUG_ON(), please? :)

--D


