Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBFC44E1B3
	for <lists+cluster-devel@lfdr.de>; Fri, 12 Nov 2021 06:49:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-o82KcKZSO6SSmEZfxdx4LQ-1; Fri, 12 Nov 2021 00:49:19 -0500
X-MC-Unique: o82KcKZSO6SSmEZfxdx4LQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6F4E804140;
	Fri, 12 Nov 2021 05:49:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11B0D60C5F;
	Fri, 12 Nov 2021 05:49:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 603CB4A703;
	Fri, 12 Nov 2021 05:49:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AC5iDRM026382 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Nov 2021 00:44:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5A9BB51E3; Fri, 12 Nov 2021 05:44:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5438351E2
	for <cluster-devel@redhat.com>; Fri, 12 Nov 2021 05:44:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71BD6185A7BA
	for <cluster-devel@redhat.com>; Fri, 12 Nov 2021 05:44:10 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-267-uCMmljL2N9W0fkz0KqhD8g-1;
	Fri, 12 Nov 2021 00:44:07 -0500
X-MC-Unique: uCMmljL2N9W0fkz0KqhD8g-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1C2FC68AA6; Fri, 12 Nov 2021 06:44:05 +0100 (CET)
Date: Fri, 12 Nov 2021 06:44:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20211112054404.GB27605@lst.de>
References: <20211111161714.584718-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211111161714.584718-1-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
	stable@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [5.15 REGRESSION v2] iomap: Fix inline extent
 handling in iomap_readpage
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

On Thu, Nov 11, 2021 at 05:17:14PM +0100, Andreas Gruenbacher wrote:
> Before commit 740499c78408 ("iomap: fix the iomap_readpage_actor return
> value for inline data"), when hitting an IOMAP_INLINE extent,
> iomap_readpage_actor would report having read the entire page.  Since
> then, it only reports having read the inline data (iomap->length).
> 
> This will force iomap_readpage into another iteration, and the
> filesystem will report an unaligned hole after the IOMAP_INLINE extent.
> But iomap_readpage_actor (now iomap_readpage_iter) isn't prepared to
> deal with unaligned extents, it will get things wrong on filesystems
> with a block size smaller than the page size, and we'll eventually run
> into the following warning in iomap_iter_advance:
> 
>   WARN_ON_ONCE(iter->processed > iomap_length(iter));
> 
> Fix that by changing iomap_readpage_iter to return 0 when hitting an
> inline extent; this will cause iomap_iter to stop immediately.
> 
> To fix readahead as well, change iomap_readahead_iter to pass on
> iomap_readpage_iter return values less than or equal to zero.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

