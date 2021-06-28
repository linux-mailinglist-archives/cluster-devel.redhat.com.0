Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D93413B6810
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Jun 2021 20:07:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-Qok6laWqNSOOM4ufqCoTLg-1; Mon, 28 Jun 2021 14:07:10 -0400
X-MC-Unique: Qok6laWqNSOOM4ufqCoTLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50FB05074C;
	Mon, 28 Jun 2021 18:07:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CA4060C0F;
	Mon, 28 Jun 2021 18:07:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA30F1809C98;
	Mon, 28 Jun 2021 18:07:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SI74IK020287 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 14:07:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 07EE621449DE; Mon, 28 Jun 2021 18:07:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03C6821449DD
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 18:07:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 320709676E5
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 18:07:01 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-49-dgmbleXbOPWIeeeeGdfHkA-1; Mon, 28 Jun 2021 14:06:57 -0400
X-MC-Unique: dgmbleXbOPWIeeeeGdfHkA-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1lxvMU-003J0p-Q2; Mon, 28 Jun 2021 17:48:10 +0000
Date: Mon, 28 Jun 2021 18:47:58 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YNoLTl602RrckQND@infradead.org>
References: <20210628172727.1894503-1-agruenba@redhat.com>
	<YNoJPZ4NWiqok/by@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <YNoJPZ4NWiqok/by@casper.infradead.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

On Mon, Jun 28, 2021 at 06:39:09PM +0100, Matthew Wilcox wrote:
> Not hugely happy with either of these options, tbh.  I'd rather we apply
> a patch akin to this one (plucked from the folio tree), so won't apply:

> so permit pages without an iop to enter writeback and create an iop
> *then*.  Would that solve your problem?

It is the right thing to do, especially when combined with a feature
patch to not bother to create the iomap_page structure on small
block size file systems when the extent covers the whole page.

> 
> > (3) We're not yet using iomap_page_mkwrite, so iomap_page objects don't
> > get created on .page_mkwrite, either.  Part of the reason is that
> > iomap_page_mkwrite locks the page and then calls into the filesystem for
> > uninlining and for allocating backing blocks.  This conflicts with the
> > gfs2 locking order: on gfs2, transactions must be started before locking
> > any pages.  We can fix that by calling iomap_page_create from
> > gfs2_page_mkwrite, or by doing the uninlining and allocations before
> > calling iomap_page_mkwrite.  I've implemented option 2 for now; see
> > here:
> 
> I think this might also solve this problem?

We'll still need to create the iomap_page structure for page_mkwrite
if there is an extent boundary inside the page.

