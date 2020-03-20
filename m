Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD1518D635
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 18:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584726545;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ksADaotuf51C88gk3ENKBdwzHldW3o+NyP9ocy6fgP4=;
	b=bRLxBDtabgBDcQxV+SIVv/2L4OEjDXXHMO8gFjuSUsaD2N/YPEXdFU7Oa+L4cZqFBtomty
	z4Y89qhIsuO0XkCD+2dYCOyI+i0kgEfWLTwKjTM67gWKH1+/OwXTD9AY4MVGZOiYfM3pE+
	Wjs4v2nIFdK8gEy5KvkP8l8SAXm5LPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-Xxgk1AO2Okm75LvEu72jMw-1; Fri, 20 Mar 2020 13:49:04 -0400
X-MC-Unique: Xxgk1AO2Okm75LvEu72jMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73E56107ACCA;
	Fri, 20 Mar 2020 17:49:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09B2F6269F;
	Fri, 20 Mar 2020 17:49:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 346D618089C8;
	Fri, 20 Mar 2020 17:49:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KHmvnF030015 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 13:48:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48B9E13CCAE; Fri, 20 Mar 2020 17:48:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44B62B17EA
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 17:48:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8AEA8F68E4
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 17:48:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-342-ms9Tz_0yOLyEa1hUub7VFw-1; Fri, 20 Mar 2020 13:48:52 -0400
X-MC-Unique: ms9Tz_0yOLyEa1hUub7VFw-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jFLlI-0000w5-Ps; Fri, 20 Mar 2020 17:48:48 +0000
Date: Fri, 20 Mar 2020 10:48:48 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200320174848.GC4971@bombadil.infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-21-willy@infradead.org>
	<20200320173734.GD851@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200320173734.GD851@sol.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KHmvnF030015
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Mar 20, 2020 at 10:37:34AM -0700, Eric Biggers wrote:
> On Fri, Mar 20, 2020 at 07:22:26AM -0700, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > Use the new readahead operation in ext4
> >=20
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> > ---
> >  fs/ext4/ext4.h     |  3 +--
> >  fs/ext4/inode.c    | 21 +++++++++------------
> >  fs/ext4/readpage.c | 22 ++++++++--------------
> >  3 files changed, 18 insertions(+), 28 deletions(-)
> >=20
>=20
> Reviewed-by: Eric Biggers <ebiggers@google.com>
>=20
> > +=09=09if (rac) {
> > +=09=09=09page =3D readahead_page(rac);
> >  =09=09=09prefetchw(&page->flags);
> > -=09=09=09list_del(&page->lru);
> > -=09=09=09if (add_to_page_cache_lru(page, mapping, page->index,
> > -=09=09=09=09  readahead_gfp_mask(mapping)))
> > -=09=09=09=09goto next_page;
> >  =09=09}
>=20
> Maybe the prefetchw(&page->flags) should be included in readahead_page()?
> Most of the callers do it.

I did notice that a lot of callers do that.  I wonder whether it (still)
helps or whether it's just cargo-cult programming.  It can't possibly
have helped before because we did list_del(&page->lru) as the very next
instruction after prefetchw(), and they're in the same cacheline.  It'd
be interesting to take it out and see what happens to performance.


