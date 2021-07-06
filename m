Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 323693BC5ED
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Jul 2021 07:07:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-wnFXCKJKMwC6Xu4AY6grxA-1; Tue, 06 Jul 2021 01:07:10 -0400
X-MC-Unique: wnFXCKJKMwC6Xu4AY6grxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE1F0343D0;
	Tue,  6 Jul 2021 05:07:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D067A60864;
	Tue,  6 Jul 2021 05:07:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BDFC4A712;
	Tue,  6 Jul 2021 05:07:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 166573JB029562 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 6 Jul 2021 01:07:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9DBED215673C; Tue,  6 Jul 2021 05:07:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 989EC215673A
	for <cluster-devel@redhat.com>; Tue,  6 Jul 2021 05:07:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24997800B34
	for <cluster-devel@redhat.com>; Tue,  6 Jul 2021 05:07:00 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-314-89HhlWaZNRK5fBCvGFjU8g-1; Tue, 06 Jul 2021 01:06:58 -0400
X-MC-Unique: 89HhlWaZNRK5fBCvGFjU8g-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1m0dFO-00Aqlb-Fi; Tue, 06 Jul 2021 05:03:54 +0000
Date: Tue, 6 Jul 2021 06:03:50 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YOPkNnQ34vRiVYs6@infradead.org>
References: <20210705181824.2174165-1-agruenba@redhat.com>
	<20210705181824.2174165-2-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210705181824.2174165-2-agruenba@redhat.com>
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
	"Darrick J . Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v2 1/2] iomap: Don't create iomap_page
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

On Mon, Jul 05, 2021 at 08:18:23PM +0200, Andreas Gruenbacher wrote:
> In iomap_readpage_actor, don't create iop objects for inline inodes.
> Otherwise, iomap_read_inline_data will set PageUptodate without setting
> iop->uptodate, and iomap_page_release will eventually complain.
> 
> To prevent this kind of bug from occurring in the future, make sure the
> page doesn't have private data attached in iomap_read_inline_data.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

As mentioned last round I'd prefer to simply not create the iomap_page
at all in the readpage/readpages path.

Also this patch needs to go after the current patch 2 to be bisection
clean.

