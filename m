Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 386DF3B6AB6
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Jun 2021 00:01:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-Tl9cl9s3OJOOAmsgFMASlQ-1; Mon, 28 Jun 2021 18:01:46 -0400
X-MC-Unique: Tl9cl9s3OJOOAmsgFMASlQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C397DA40CC;
	Mon, 28 Jun 2021 22:01:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4C4B604CC;
	Mon, 28 Jun 2021 22:01:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 096AC1809C98;
	Mon, 28 Jun 2021 22:01:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SM1cUD005889 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 18:01:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C6F72031A42; Mon, 28 Jun 2021 22:01:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37A4D2031A41
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 22:01:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 671D710AC3A8
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 22:01:34 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-38-PAK2QP25NvWfzwx0wvGS7A-1; Mon, 28 Jun 2021 18:01:32 -0400
X-MC-Unique: PAK2QP25NvWfzwx0wvGS7A-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lxzIJ-003Th8-41; Mon, 28 Jun 2021 22:00:08 +0000
Date: Mon, 28 Jun 2021 22:59:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YNpGW2KNMF9f77bk@casper.infradead.org>
References: <20210628172727.1894503-1-agruenba@redhat.com>
	<YNoJPZ4NWiqok/by@casper.infradead.org>
	<YNoLTl602RrckQND@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YNoLTl602RrckQND@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 28, 2021 at 06:47:58PM +0100, Christoph Hellwig wrote:
> On Mon, Jun 28, 2021 at 06:39:09PM +0100, Matthew Wilcox wrote:
> > Not hugely happy with either of these options, tbh.  I'd rather we apply
> > a patch akin to this one (plucked from the folio tree), so won't apply:
> 
> > so permit pages without an iop to enter writeback and create an iop
> > *then*.  Would that solve your problem?
> 
> It is the right thing to do, especially when combined with a feature
> patch to not bother to create the iomap_page structure on small
> block size file systems when the extent covers the whole page.

We don't know the extent layout at the point where *this* patch creates
iomap_pages during writeback.  I imagine we can delay creating one until
we find out what our destination layout will be?

