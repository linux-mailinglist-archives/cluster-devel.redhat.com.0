Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCEC3CE097
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 18:08:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-wf5fvp0vPES1TTntwATLEQ-1; Mon, 19 Jul 2021 12:08:32 -0400
X-MC-Unique: wf5fvp0vPES1TTntwATLEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0098804141;
	Mon, 19 Jul 2021 16:08:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EA9960916;
	Mon, 19 Jul 2021 16:08:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 898624EA2A;
	Mon, 19 Jul 2021 16:08:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JG8RCi000656 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 12:08:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D35F21449B7; Mon, 19 Jul 2021 16:08:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 384AA21449B2
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 16:08:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D6AE802314
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 16:08:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-454-NJRWbQvQMY28C5mVw-I3PQ-1;
	Mon, 19 Jul 2021 12:08:22 -0400
X-MC-Unique: NJRWbQvQMY28C5mVw-I3PQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7E9B61244;
	Mon, 19 Jul 2021 16:08:20 +0000 (UTC)
Date: Mon, 19 Jul 2021 09:08:20 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210719160820.GE22402@magnolia>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210719103520.495450-4-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 03/27] iomap: mark the iomap argument to
 iomap_sector const
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

On Mon, Jul 19, 2021 at 12:34:56PM +0200, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>

/me wonders, does this have any significant effect on the generated
code?

It's probably a good idea to feed the optimizer as much usage info as we
can, though I would imagine that for such a simple function it can
probably tell that we don't change *iomap.

IMHO, constifiying functions is a good way to signal to /programmers/
that they're not intended to touch the arguments, so

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  include/linux/iomap.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 093519d91cc9cc..f9c36df6a3061b 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -91,8 +91,7 @@ struct iomap {
>  	const struct iomap_page_ops *page_ops;
>  };
>  
> -static inline sector_t
> -iomap_sector(struct iomap *iomap, loff_t pos)
> +static inline sector_t iomap_sector(const struct iomap *iomap, loff_t pos)
>  {
>  	return (iomap->addr + pos - iomap->offset) >> SECTOR_SHIFT;
>  }
> -- 
> 2.30.2
> 

