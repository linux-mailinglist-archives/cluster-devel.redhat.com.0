Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2273F16365A
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 23:46:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582065992;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zhuL+I2Oyr6RYnX6U/C2oBVO101LwNAiZAx6WxwE2II=;
	b=ZMj2zsH3+0BqFHK1yYcCgth99WKoC7bk9Tc1Lre/7oPbdy9a9dDyvhfRO5um5VsF+LHHj+
	DwUl3hsITODi/T6MPGSwpQNcpxqCd36a7efZ4EPbWVSG8UwVNmbvC8U6P0sYqdsY/tEY/1
	JUzSWLxkeU4Ifww3ruZsWfXd/Uy1lVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-i04AHfpLPICYS-XPYhIAPw-1; Tue, 18 Feb 2020 17:46:27 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8A0118AB2C0;
	Tue, 18 Feb 2020 22:46:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ECDA60BE1;
	Tue, 18 Feb 2020 22:46:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F21AD35AF5;
	Tue, 18 Feb 2020 22:46:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IMkK48024273 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 17:46:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 22A8210CD639; Tue, 18 Feb 2020 22:46:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DE6910CD618
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 22:46:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FE9C8012CC
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 22:46:18 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-404-gM8BHxaqPUClqGcbARwTyw-1; Tue, 18 Feb 2020 17:46:14 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 2C6AA3A311C;
	Wed, 19 Feb 2020 09:46:11 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j4Bd4-0003kz-H7; Wed, 19 Feb 2020 09:46:10 +1100
Date: Wed, 19 Feb 2020 09:46:10 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218224610.GT10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-4-willy@infradead.org>
	<20200218050300.GI10776@dread.disaster.area>
	<20200218135618.GO7778@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200218135618.GO7778@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=7-415B0cAAAA:8 a=-669WvyOGAhHUzcTJR8A:9 a=CjuIK1q_8ugA:10
	a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: gM8BHxaqPUClqGcbARwTyw-1
X-MC-Unique: i04AHfpLPICYS-XPYhIAPw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01IMkK48024273
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 05:56:18AM -0800, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 04:03:00PM +1100, Dave Chinner wrote:
> > On Mon, Feb 17, 2020 at 10:45:44AM -0800, Matthew Wilcox wrote:
> > > +static void read_pages(struct readahead_control *rac, struct list_he=
ad *pages,
> > > +=09=09gfp_t gfp)
> > >  {
> > > +=09const struct address_space_operations *aops =3D rac->mapping->a_o=
ps;
> > >  =09struct blk_plug plug;
> > >  =09unsigned page_idx;
> >=20
> > Splitting out the aops rather than the mapping here just looks
> > weird, especially as you need the mapping later in the function.
> > Using aops doesn't even reduce the code side....
>=20
> It does in subsequent patches ... I agree it looks a little weird here,
> but I think in the final form, it makes sense:

Ok. Perhaps just an additional commit comment to say "read_pages() is
changed to be aops centric as @rac abstracts away all other
implementation details by the end of the patchset."

> > > +=09=09=09if (readahead_count(&rac))
> > > +=09=09=09=09read_pages(&rac, &page_pool, gfp_mask);
> > > +=09=09=09rac._nr_pages =3D 0;
> >=20
> > Hmmm. Wondering ig it make sense to move the gfp_mask to the readahead
> > control structure - if we have to pass the gfp_mask down all the
> > way along side the rac, then I think it makes sense to do that...
>=20
> So we end up removing it later on in this series, but I do wonder if
> it would make sense anyway.  By the end of the series, we still have
> this in iomap:
>=20
>                 if (ctx->rac) /* same as readahead_gfp_mask */
>                         gfp |=3D __GFP_NORETRY | __GFP_NOWARN;
>=20
> and we could get rid of that by passing gfp flags down in the rac.  On th=
e
> other hand, I don't know why it doesn't just use readahead_gfp_mask()
> here anyway ... Christoph?

mapping->gfp_mask is awful. Is it a mask, or is it a valid set of
allocation flags? Or both?  Some callers to mapping_gfp_constraint()
uses it as a mask, some callers to mapping_gfp_constraint() use it
as base flags that context specific flags get masked out of,
readahead_gfp_mask() callers use it as the entire set of gfp flags
for allocation.

That whole API sucks - undocumented as to what it's suposed to do
and how it's supposed to be used. Hence it's difficult to use
correctly or understand whether it's being used correctly. And
reading callers only leads to more confusion and crazy code like in
do_mpage_readpage() where readahead returns a mask that are used as
base flags and normal reads return a masked set of base flags...

The iomap code is obviously correct when it comes to gfp flag
manipulation. We start with GFP_KERNEL context, then constrain it
via the mask held in mapping->gfp_mask, then if it's readahead we
allow the allocation to silently fail.

Simple to read and understand code, versus having weird code that
requires the reader to decipher an undocumented and inconsistent API
to understand how the gfp flags have been calculated and are valid.

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


