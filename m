Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B7F6322843F
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jul 2020 17:52:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-gTARBjkvOp2rVyPTTtNloQ-1; Tue, 21 Jul 2020 11:52:36 -0400
X-MC-Unique: gTARBjkvOp2rVyPTTtNloQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4678BE91D;
	Tue, 21 Jul 2020 15:52:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 366C572684;
	Tue, 21 Jul 2020 15:52:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB381730C5;
	Tue, 21 Jul 2020 15:52:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LFqFfR031117 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 11:52:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6AF3B2157F25; Tue, 21 Jul 2020 15:52:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EDE42156A51
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 15:52:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7A84800A13
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 15:52:09 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-267-HNJLC8qkOuaF41JvbaVqbA-1; Tue, 21 Jul 2020 11:52:07 -0400
X-MC-Unique: HNJLC8qkOuaF41JvbaVqbA-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jxuYj-00054a-SC; Tue, 21 Jul 2020 15:52:02 +0000
Date: Tue, 21 Jul 2020 16:52:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200721155201.GL15516@casper.infradead.org>
References: <20200713074633.875946-1-hch@lst.de>
	<20200720215125.bfz7geaftocy4r5l@fiona>
	<20200721145313.GA9217@lst.de>
	<20200721150432.GH15516@casper.infradead.org>
	<20200721150615.GA10330@lst.de>
	<20200721151437.GI15516@casper.infradead.org>
	<20200721151616.GA11074@lst.de>
	<20200721153136.GJ15516@casper.infradead.org>
	<20200721154240.GB11652@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200721154240.GB11652@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, linux-man@vger.kernel.org,
	Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>, cluster-devel@redhat.com,
	Michael Kerrisk <mtk.manpages@gmail.com>, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] RFC: iomap write invalidation
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2020 at 05:42:40PM +0200, Christoph Hellwig wrote:
> On Tue, Jul 21, 2020 at 04:31:36PM +0100, Matthew Wilcox wrote:
> > > Umm, no.  -ENOTBLK is internal - the file systems will retry using
> > > buffered I/O and the error shall never escape to userspace (or even the
> > > VFS for that matter).
> > 
> > Ah, I made the mistake of believing the comments that I could see in
> > your patch instead of reading the code.
> > 
> > Can I suggest deleting this comment:
> > 
> >         /*
> >          * No fallback to buffered IO on errors for XFS, direct IO will either
> >          * complete fully or fail.
> >          */
> > 
> > and rewording this one:
> > 
> >                 /*
> >                  * Allow a directio write to fall back to a buffered
> >                  * write *only* in the case that we're doing a reflink
> >                  * CoW.  In all other directio scenarios we do not
> >                  * allow an operation to fall back to buffered mode.
> >                  */
> > 
> > as part of your revised patchset?
> 
> That isn't actually true.  In current mainline we only fallback on
> reflink RMW cases, but with this series we also fall back for
> invalidation failures.

... that's why I'm suggesting that you delete the first one and rewrite
the second one.  Because they aren't true.

