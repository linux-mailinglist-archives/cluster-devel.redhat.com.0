Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 098BE163C7A
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 06:23:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582089829;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/wbqmJukBCbZsW6dKggFRHcmU+Yti658ntq+MU3m5I0=;
	b=KcravKIJmjoxjUjHmouLJ1v2NU9E3SsJ8nGpjNibyeali9euTXyGoVzLdm3H9CO43sPkWy
	8x+vUr5HAZFB5fcJVem0Slr2ggT05TBVCJcYPVuMwFudlt7FrjJKJkMV3+vBX/sx85J5kY
	uVmEqZAhNq0evMZF60XS1GVgnnp1ecI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-38OIyQ6BOqCyiS5131L0UA-1; Wed, 19 Feb 2020 00:23:48 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9894D107ACCA;
	Wed, 19 Feb 2020 05:23:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B1A5D9E5;
	Wed, 19 Feb 2020 05:23:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A936335B12;
	Wed, 19 Feb 2020 05:23:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J5MlRu012375 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 00:22:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 767E22063206; Wed, 19 Feb 2020 05:22:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71D382026D67
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 05:22:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C3618028A6
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 05:22:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-340-0p2XciMnO1Ox5wp1UDnO6g-1; Wed, 19 Feb 2020 00:22:43 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4Hoc-0008Pr-3p; Wed, 19 Feb 2020 05:22:30 +0000
Date: Tue, 18 Feb 2020 21:22:30 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200219052230.GM24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-33-willy@infradead.org>
	<20200219034324.GG10776@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200219034324.GG10776@dread.disaster.area>
X-MC-Unique: 0p2XciMnO1Ox5wp1UDnO6g-1
X-MC-Unique: 38OIyQ6BOqCyiS5131L0UA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J5MlRu012375
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org,
	Cong Wang <xiyou.wangcong@gmail.com>, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 19/19] mm: Use memalloc_nofs_save in
	readahead path
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Feb 19, 2020 at 02:43:24PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:46:13AM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > Ensure that memory allocations in the readahead path do not attempt to
> > reclaim file-backed pages, which could lead to a deadlock.  It is
> > possible, though unlikely this is the root cause of a problem observed
> > by Cong Wang.
> >=20
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Reported-by: Cong Wang <xiyou.wangcong@gmail.com>
> > Suggested-by: Michal Hocko <mhocko@suse.com>
> > ---
> >  mm/readahead.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >=20
> > diff --git a/mm/readahead.c b/mm/readahead.c
> > index 94d499cfb657..8f9c0dba24e7 100644
> > --- a/mm/readahead.c
> > +++ b/mm/readahead.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/mm_inline.h>
> >  #include <linux/blk-cgroup.h>
> >  #include <linux/fadvise.h>
> > +#include <linux/sched/mm.h>
> > =20
> >  #include "internal.h"
> > =20
> > @@ -174,6 +175,18 @@ void page_cache_readahead_limit(struct address_spa=
ce *mapping,
> >  =09=09._nr_pages =3D 0,
> >  =09};
> > =20
> > +=09/*
> > +=09 * Partway through the readahead operation, we will have added
> > +=09 * locked pages to the page cache, but will not yet have submitted
> > +=09 * them for I/O.  Adding another page may need to allocate memory,
> > +=09 * which can trigger memory reclaim.  Telling the VM we're in
> > +=09 * the middle of a filesystem operation will cause it to not
> > +=09 * touch file-backed pages, preventing a deadlock.  Most (all?)
> > +=09 * filesystems already specify __GFP_NOFS in their mapping's
> > +=09 * gfp_mask, but let's be explicit here.
> > +=09 */
> > +=09unsigned int nofs =3D memalloc_nofs_save();
> > +
>=20
> So doesn't this largely remove the need for all the gfp flag futzing
> in the readahead path? i.e. almost all readahead allocations are now
> going to be GFP_NOFS | GFP_NORETRY | GFP_NOWARN ?

I don't think it ensures the GFP_NORETRY | GFP_NOWARN, just the GFP_NOFS
part.  IOW, we'll still need a readahead_gfp() macro at some point ... I
don't want to add that to this already large series though.

Michal also wants to kill mapping->gfp_mask, btw.


