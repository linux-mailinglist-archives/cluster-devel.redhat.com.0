Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EA2153C233B
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Jul 2021 14:02:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-EUXd6a3iOH-wTjsOsl2_Eg-1; Fri, 09 Jul 2021 08:02:08 -0400
X-MC-Unique: EUXd6a3iOH-wTjsOsl2_Eg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E8AC9126D;
	Fri,  9 Jul 2021 12:02:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3434175B9;
	Fri,  9 Jul 2021 12:02:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1CCB1832E6F;
	Fri,  9 Jul 2021 12:02:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 169C21K3022823 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Jul 2021 08:02:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1364F20A3D50; Fri,  9 Jul 2021 12:02:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EE3520A3D51
	for <cluster-devel@redhat.com>; Fri,  9 Jul 2021 12:01:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DFC5805F11
	for <cluster-devel@redhat.com>; Fri,  9 Jul 2021 12:01:57 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-464-mXmKJ9JXPsuyccTIFhjn9g-1; Fri, 09 Jul 2021 08:01:55 -0400
X-MC-Unique: mXmKJ9JXPsuyccTIFhjn9g-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1m1pCR-00ETWy-P5; Fri, 09 Jul 2021 12:01:45 +0000
Date: Fri, 9 Jul 2021 13:01:43 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <YOg6p6zzGHdyiIvt@casper.infradead.org>
References: <20210707115524.2242151-1-agruenba@redhat.com>
	<20210707115524.2242151-3-agruenba@redhat.com>
	<YOW6Hz0/FgQkQDgm@casper.infradead.org>
	<20210709042737.GT11588@locust>
MIME-Version: 1.0
In-Reply-To: <20210709042737.GT11588@locust>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH v3 2/3] iomap: Don't create iomap_page
 objects for inline files
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 08, 2021 at 09:27:37PM -0700, Darrick J. Wong wrote:
> On Wed, Jul 07, 2021 at 03:28:47PM +0100, Matthew Wilcox wrote:
> > On Wed, Jul 07, 2021 at 01:55:23PM +0200, Andreas Gruenbacher wrote:
> > > @@ -252,6 +253,7 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
> > >  	}
> > >  
> > >  	/* zero post-eof blocks as the page may be mapped */
> > > +	iop = iomap_page_create(inode, page);
> > >  	iomap_adjust_read_range(inode, iop, &pos, length, &poff, &plen);
> > >  	if (plen == 0)
> > >  		goto done;
> > 
> > I /think/ a subsequent patch would look like this:
> > 
> > +	/* No need to create an iop if the page is within an extent */
> > +	loff_t page_pos = page_offset(page);
> > +	if (pos > page_pos || pos + length < page_pos + page_size(page))
> > +		iop = iomap_page_create(inode, page);
> > 
> > but that might miss some other reasons to create an iop.
> 
> I was under the impression that for blksize<pagesize filesystems, the
> page always had to have an iop attached.  In principle I think you're
> right that we don't need one if all i_blocks_per_page blocks have the
> same uptodate state, but someone would have to perform a close reading
> of buffered-io.c to make it drop them when unnecessary and re-add them
> if it becomes necessary.  That might be more cycling through kmem_alloc
> than we like, but as I said, I have never studied this idea.

I wouldn't free them unnecessarily; that is, once we've determined that
we need an iop, we should just keep it, even once the entire page is
Uptodate (because we'll need it for write-out eventually anyway).

I haven't noticed any ill-effects from discarding iops while running
xfstests on the THP/multipage folio patches.  That will discard iops
when splitting a page (the page must be entirely uptodate at that point).

