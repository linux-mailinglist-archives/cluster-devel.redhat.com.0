Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE50C44E1B4
	for <lists+cluster-devel@lfdr.de>; Fri, 12 Nov 2021 06:49:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-KbDPQAXUM2WrP9DR-P-e3A-1; Fri, 12 Nov 2021 00:49:19 -0500
X-MC-Unique: KbDPQAXUM2WrP9DR-P-e3A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5F5E1006AAA;
	Fri, 12 Nov 2021 05:49:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67C61604CC;
	Fri, 12 Nov 2021 05:49:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4EF64181A1D1;
	Fri, 12 Nov 2021 05:49:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AC5icHb026421 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Nov 2021 00:44:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A85AC4047281; Fri, 12 Nov 2021 05:44:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A296F404727C
	for <cluster-devel@redhat.com>; Fri, 12 Nov 2021 05:44:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84CF2811E8F
	for <cluster-devel@redhat.com>; Fri, 12 Nov 2021 05:44:38 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-440-rAdhTTUyPgWMr5td0PwG4w-1;
	Fri, 12 Nov 2021 00:44:36 -0500
X-MC-Unique: rAdhTTUyPgWMr5td0PwG4w-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id B2FF668AA6; Fri, 12 Nov 2021 06:44:34 +0100 (CET)
Date: Fri, 12 Nov 2021 06:44:34 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20211112054434.GC27605@lst.de>
References: <20211111140802.577144-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211111140802.577144-1-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] iomap: Fix iomap_readahead_iter error
	handling
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

On Thu, Nov 11, 2021 at 03:08:02PM +0100, Andreas Gruenbacher wrote:
> In iomap_readahead_iter, deal with potential iomap_readpage_iter errors.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/iomap/buffered-io.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 1753c26c8e76..9f1e329e8b2c 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -370,6 +370,8 @@ static loff_t iomap_readahead_iter(const struct iomap_iter *iter,
>  			ctx->cur_page_in_bio = false;
>  		}
>  		ret = iomap_readpage_iter(iter, ctx, done);
> +		if (ret < 0)
> +			return ret;

This already is part of your previous patch.

