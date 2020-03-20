Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id D51B618D77D
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 19:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584729701;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KKWMLpvyPSkFOa6UdhagkUE3D3AXiRfxMDq6Dmdo+WM=;
	b=Xckxho2X60Rj0lr5T64cJMyA7uOtSa9gDYNhmftJNx/AzLW/F+6pcpIqsoJ5yqQlnmtEa7
	Bo65Dz/FhbJZypoDto3q/FXi7sYzcYwduJzm6H+hFEbrb9z7pBwygYam5E/a27ZLGQ/YO2
	f9uVzcLvzkolc91e90NqTkSS6b+EIdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-uWQ6dvBuPSSiFCHbI7Hwmw-1; Fri, 20 Mar 2020 14:41:16 -0400
X-MC-Unique: uWQ6dvBuPSSiFCHbI7Hwmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1545D18A8C8F;
	Fri, 20 Mar 2020 18:40:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00B355C28D;
	Fri, 20 Mar 2020 18:40:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D555A18089CD;
	Fri, 20 Mar 2020 18:40:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KIeo3j031636 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 14:40:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 243A71006B06; Fri, 20 Mar 2020 18:40:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20B601006B05
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 18:40:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D045E8CC925
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 18:40:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-147-wSQczNKkPfGs8dKnSYEj5Q-1;
	Fri, 20 Mar 2020 14:40:45 -0400
X-MC-Unique: wSQczNKkPfGs8dKnSYEj5Q-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 275D420739;
	Fri, 20 Mar 2020 18:40:43 +0000 (UTC)
Date: Fri, 20 Mar 2020 11:40:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200320184041.GG851@sol.localdomain>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-21-willy@infradead.org>
	<20200320173734.GD851@sol.localdomain>
	<20200320174848.GC4971@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200320174848.GC4971@bombadil.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KIeo3j031636
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	William Kucharski <william.kucharski@oracle.com>,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v9 20/25] ext4: Convert from readpages
	to readahead
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
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Mar 20, 2020 at 10:48:48AM -0700, Matthew Wilcox wrote:
> On Fri, Mar 20, 2020 at 10:37:34AM -0700, Eric Biggers wrote:
> > On Fri, Mar 20, 2020 at 07:22:26AM -0700, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > >=20
> > > Use the new readahead operation in ext4
> > >=20
> > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> > > ---
> > >  fs/ext4/ext4.h     |  3 +--
> > >  fs/ext4/inode.c    | 21 +++++++++------------
> > >  fs/ext4/readpage.c | 22 ++++++++--------------
> > >  3 files changed, 18 insertions(+), 28 deletions(-)
> > >=20
> >=20
> > Reviewed-by: Eric Biggers <ebiggers@google.com>
> >=20
> > > +=09=09if (rac) {
> > > +=09=09=09page =3D readahead_page(rac);
> > >  =09=09=09prefetchw(&page->flags);
> > > -=09=09=09list_del(&page->lru);
> > > -=09=09=09if (add_to_page_cache_lru(page, mapping, page->index,
> > > -=09=09=09=09  readahead_gfp_mask(mapping)))
> > > -=09=09=09=09goto next_page;
> > >  =09=09}
> >=20
> > Maybe the prefetchw(&page->flags) should be included in readahead_page(=
)?
> > Most of the callers do it.
>=20
> I did notice that a lot of callers do that.  I wonder whether it (still)
> helps or whether it's just cargo-cult programming.  It can't possibly
> have helped before because we did list_del(&page->lru) as the very next
> instruction after prefetchw(), and they're in the same cacheline.  It'd
> be interesting to take it out and see what happens to performance.

Yeah, it does look like the list_del() made the prefetchw() useless, so it
should just be removed.  The prefetchw() dates all the way back to
mpage_readpages() being added in 2002, but even then the list_del() was
immediately afterwards, and 'flags' and 'lru' were in the same cache line i=
n
'struct page' even then (assuming at least a 32-byte cache line size), so..=
.

- Eric


