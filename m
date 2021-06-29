Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A561D3B6E06
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Jun 2021 07:47:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-2acqv8wjOl2usC6k8_w0Zw-1; Tue, 29 Jun 2021 01:47:09 -0400
X-MC-Unique: 2acqv8wjOl2usC6k8_w0Zw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37FE218414AC;
	Tue, 29 Jun 2021 05:47:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F9A160C81;
	Tue, 29 Jun 2021 05:47:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECF191809C99;
	Tue, 29 Jun 2021 05:47:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15T5l3pl008770 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 29 Jun 2021 01:47:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2445B3006; Tue, 29 Jun 2021 05:47:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD3B99C059
	for <cluster-devel@redhat.com>; Tue, 29 Jun 2021 05:47:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DACBC1064E6B
	for <cluster-devel@redhat.com>; Tue, 29 Jun 2021 05:47:00 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-548-zdZNZPbFOB-DFymK-gp3qg-1; Tue, 29 Jun 2021 01:46:57 -0400
X-MC-Unique: zdZNZPbFOB-DFymK-gp3qg-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1ly6Jg-003n4a-1T; Tue, 29 Jun 2021 05:29:59 +0000
Date: Tue, 29 Jun 2021 06:29:48 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YNqvzNd+7+YtXfQj@infradead.org>
References: <20210628172727.1894503-1-agruenba@redhat.com>
	<YNoJPZ4NWiqok/by@casper.infradead.org>
	<YNoLTl602RrckQND@infradead.org>
	<YNpGW2KNMF9f77bk@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <YNpGW2KNMF9f77bk@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
	"Darrick J . Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 0/2] iomap: small block problems
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 28, 2021 at 10:59:55PM +0100, Matthew Wilcox wrote:
> > > so permit pages without an iop to enter writeback and create an iop
> > > *then*.  Would that solve your problem?
> > 
> > It is the right thing to do, especially when combined with a feature
> > patch to not bother to create the iomap_page structure on small
> > block size file systems when the extent covers the whole page.
> 
> We don't know the extent layout at the point where *this* patch creates
> iomap_pages during writeback.  I imagine we can delay creating one until
> we find out what our destination layout will be?

Hmm.  Actually ->page_mkwrite is always is always called on an uptodate
page and we even assert that.  I should have remembered the whole page
fault path better.

So yeah, I think we should take patch 1 from Andreas, then a non-folio
version of your patch as a start.  The next steps then would be in
approximate order:

 1. remove the iomap_page_create in iomap_page_mkwrite_actor as it
    clearly is not needed at that point
 2. don't bother to create an iomap_page in iomap_readpage_actor when
    the iomap spans the whole page
 3. don't create the iomap_page in __iomap_write_begin when the
    page is marked uptodate or the write covers the whole page 

delaying the creation further in iomap_writepage_map will be harder
as the loop around iomap_add_to_ioend is still fundamentally block
based.

