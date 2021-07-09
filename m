Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F3A063C1E43
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Jul 2021 06:27:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-czdaCWeLOUuWpnkjwnK3OQ-1; Fri, 09 Jul 2021 00:27:58 -0400
X-MC-Unique: czdaCWeLOUuWpnkjwnK3OQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB8B1100C626;
	Fri,  9 Jul 2021 04:27:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D9F260854;
	Fri,  9 Jul 2021 04:27:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AE551809C99;
	Fri,  9 Jul 2021 04:27:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1694RkCQ017069 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Jul 2021 00:27:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A322C200E666; Fri,  9 Jul 2021 04:27:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EC2D20285B5
	for <cluster-devel@redhat.com>; Fri,  9 Jul 2021 04:27:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9556858286
	for <cluster-devel@redhat.com>; Fri,  9 Jul 2021 04:27:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-287-QqkWJUVOMYmtllvuvuZQ5A-1;
	Fri, 09 Jul 2021 00:27:38 -0400
X-MC-Unique: QqkWJUVOMYmtllvuvuZQ5A-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D5E26144A;
	Fri,  9 Jul 2021 04:27:37 +0000 (UTC)
Date: Thu, 8 Jul 2021 21:27:37 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210709042737.GT11588@locust>
References: <20210707115524.2242151-1-agruenba@redhat.com>
	<20210707115524.2242151-3-agruenba@redhat.com>
	<YOW6Hz0/FgQkQDgm@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <YOW6Hz0/FgQkQDgm@casper.infradead.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2021 at 03:28:47PM +0100, Matthew Wilcox wrote:
> On Wed, Jul 07, 2021 at 01:55:23PM +0200, Andreas Gruenbacher wrote:
> > @@ -252,6 +253,7 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
> >  	}
> >  
> >  	/* zero post-eof blocks as the page may be mapped */
> > +	iop = iomap_page_create(inode, page);
> >  	iomap_adjust_read_range(inode, iop, &pos, length, &poff, &plen);
> >  	if (plen == 0)
> >  		goto done;
> 
> I /think/ a subsequent patch would look like this:
> 
> +	/* No need to create an iop if the page is within an extent */
> +	loff_t page_pos = page_offset(page);
> +	if (pos > page_pos || pos + length < page_pos + page_size(page))
> +		iop = iomap_page_create(inode, page);
> 
> but that might miss some other reasons to create an iop.

I was under the impression that for blksize<pagesize filesystems, the
page always had to have an iop attached.  In principle I think you're
right that we don't need one if all i_blocks_per_page blocks have the
same uptodate state, but someone would have to perform a close reading
of buffered-io.c to make it drop them when unnecessary and re-add them
if it becomes necessary.  That might be more cycling through kmem_alloc
than we like, but as I said, I have never studied this idea.

--D

