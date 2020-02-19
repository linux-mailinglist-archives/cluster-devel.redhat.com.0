Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 13378163CE0
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 07:04:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582092277;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JB3HdOdue6XfdqC/56MStI1EY6tyzMlOkEWnpenB890=;
	b=NeUuyPUxMhahXQlgd7/LJc4aXUBfAu1EPiagQzWDJeG3L1gtDQjeQnnqihbl8rrg7oeEj7
	jAB4VkMweu6g57VnoaZHklyENR5xUIAg6dMjUpjUp6IGQWOCiC45UKzkUmUxjLTmbGCTqo
	p75cAHmDGC6QyB7cMgwbu4O0ZYHbP/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-yUuIH7W0M_aUBdvg2JLRTA-1; Wed, 19 Feb 2020 01:04:35 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61987800D5B;
	Wed, 19 Feb 2020 06:04:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D2088AC30;
	Wed, 19 Feb 2020 06:04:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F4AF35B13;
	Wed, 19 Feb 2020 06:04:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J64SEA013818 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:04:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 13A3FEC4C9; Wed, 19 Feb 2020 06:04:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F384EC4C4
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 06:04:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D766B803877
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 06:04:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-301-BnJEkk0FO_y2gmTGF45Whw-1; Wed, 19 Feb 2020 01:04:24 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4IT1-0003R9-8O; Wed, 19 Feb 2020 06:04:15 +0000
Date: Tue, 18 Feb 2020 22:04:15 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200219060415.GO24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-31-willy@infradead.org>
	<20200219032900.GE10776@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200219032900.GE10776@dread.disaster.area>
X-MC-Unique: BnJEkk0FO_y2gmTGF45Whw-1
X-MC-Unique: yUuIH7W0M_aUBdvg2JLRTA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J64SEA013818
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 17/19] iomap: Restructure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Feb 19, 2020 at 02:29:00PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:46:11AM -0800, Matthew Wilcox wrote:
> > @@ -418,6 +412,15 @@ iomap_readpages_actor(struct inode *inode, loff_t =
pos, loff_t length,
> >  =09=09}
> >  =09=09ret =3D iomap_readpage_actor(inode, pos + done, length - done,
> >  =09=09=09=09ctx, iomap, srcmap);
> > +=09=09if (WARN_ON(ret =3D=3D 0))
> > +=09=09=09break;
>=20
> This error case now leaks ctx->cur_page....

Yes ... and I see the consequence.  I mean, this is a "shouldn't happen",
so do we want to put effort into cleanup here ...

> > @@ -451,11 +454,7 @@ iomap_readpages(struct address_space *mapping, str=
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
> And so will now trigger both a warn and a bug....

... or do we just want to run slap bang into this bug?

Option 1: Remove the check for 'ret =3D=3D 0' altogether, as we had it befo=
re.
That puts us into endless loop territory for a failure mode, and it's not
parallel with iomap_readpage().

Option 2: Remove the WARN_ON from the check.  Then we just hit the BUG_ON,
but we don't know why we did it.

Option 3: Set cur_page to NULL.  We'll hit the WARN_ON, avoid the BUG_ON,
might end up with a page in the page cache which is never unlocked.

Option 4: Do the unlock/put page dance before setting the cur_page to NULL.
We might double-unlock the page.

There are probably other options here too.


