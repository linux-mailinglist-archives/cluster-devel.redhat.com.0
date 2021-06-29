Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F1D8A3B6E05
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Jun 2021 07:45:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-gXwdF6kfNfCYdPc79cYJ7g-1; Tue, 29 Jun 2021 01:45:08 -0400
X-MC-Unique: gXwdF6kfNfCYdPc79cYJ7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5EB81005523;
	Tue, 29 Jun 2021 05:45:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 438611000358;
	Tue, 29 Jun 2021 05:45:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA6254EA2A;
	Tue, 29 Jun 2021 05:44:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15T5im0h008654 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 29 Jun 2021 01:44:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADC6A10F8E1C; Tue, 29 Jun 2021 05:44:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A99DC10F8E19
	for <cluster-devel@redhat.com>; Tue, 29 Jun 2021 05:44:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25F80866DF4
	for <cluster-devel@redhat.com>; Tue, 29 Jun 2021 05:44:45 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-529-WcRwQX1FMJOfr9tpIzM4fQ-1; Tue, 29 Jun 2021 01:44:43 -0400
X-MC-Unique: WcRwQX1FMJOfr9tpIzM4fQ-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1ly6W8-003nYz-Ut; Tue, 29 Jun 2021 05:43:00 +0000
Date: Tue, 29 Jun 2021 06:42:40 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YNqy0E4xFwHDhK32@infradead.org>
References: <20210628172727.1894503-1-agruenba@redhat.com>
	<YNoJPZ4NWiqok/by@casper.infradead.org>
	<YNoLTl602RrckQND@infradead.org>
	<YNpGW2KNMF9f77bk@casper.infradead.org>
	<YNqvzNd+7+YtXfQj@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YNqvzNd+7+YtXfQj@infradead.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 29, 2021 at 06:29:48AM +0100, Christoph Hellwig wrote:
> Hmm.  Actually ->page_mkwrite is always is always called on an uptodate
> page and we even assert that.  I should have remembered the whole page
> fault path better.
> 
> So yeah, I think we should take patch 1 from Andreas, then a non-folio
> version of your patch as a start.  The next steps then would be in
> approximate order:
> 
>  1. remove the iomap_page_create in iomap_page_mkwrite_actor as it
>     clearly is not needed at that point
>  2. don't bother to create an iomap_page in iomap_readpage_actor when
>     the iomap spans the whole page
>  3. don't create the iomap_page in __iomap_write_begin when the
>     page is marked uptodate or the write covers the whole page 

Further thoughts for a better series:

 1. create iomap_page if needed in iomap_writepage_map
 2. do not create the iomap_page at all in iomap_readpage_actor.
    ->readahead is always called on newly allocated pages, and
    ->readpage either on a clean !uptodate page or on one that
    has seen a write leading to a partial uptodate state.  That
    is for the case that cares about the iomap_page it is present
    already
 3. don't create the iomap_page in iomap_page_mkwrite_actor

I think this is the simple initial series that should solve Andreas'
problem.  Then we can look into optimizing __iomap_write_begin
and iomap_writepage_map further as needed.

