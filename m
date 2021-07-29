Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3C63DADA5
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Jul 2021 22:33:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-Aonpfq0NMBaT5mi-vgwwfw-1; Thu, 29 Jul 2021 16:33:40 -0400
X-MC-Unique: Aonpfq0NMBaT5mi-vgwwfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E17F100A606;
	Thu, 29 Jul 2021 20:33:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FB501001B2C;
	Thu, 29 Jul 2021 20:33:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CC7B4BB7C;
	Thu, 29 Jul 2021 20:33:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16TKXPOf021425 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 29 Jul 2021 16:33:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 147301054594; Thu, 29 Jul 2021 20:33:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FD6310545C2
	for <cluster-devel@redhat.com>; Thu, 29 Jul 2021 20:33:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9298E8CA945
	for <cluster-devel@redhat.com>; Thu, 29 Jul 2021 20:33:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-127-8j9hQpnVMJ-SvmNpkIG3yA-1;
	Thu, 29 Jul 2021 16:33:17 -0400
X-MC-Unique: 8j9hQpnVMJ-SvmNpkIG3yA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B5F960F4A;
	Thu, 29 Jul 2021 20:33:16 +0000 (UTC)
Date: Thu, 29 Jul 2021 13:33:16 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210729203316.GF3601466@magnolia>
References: <20210719103520.495450-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210719103520.495450-1-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] RFC: switch iomap to an iterator model
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

On Mon, Jul 19, 2021 at 12:34:53PM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this series replies the existing callback-based iomap_apply to an iter based
> model.  The prime aim here is to simply the DAX reflink support, which

Jan Kara pointed out that recent gcc and clang support a magic attribute
that causes a cleanup function to be called when an automatic variable
goes out of scope.  I've ported the XFS for_each_perag* macros to use
it, but I think this would be roughly (totally untested) what you'd do
for iomap iterators:

/* automatic iteration cleanup via macro hell */
struct iomap_iter_cleanup {
	struct iomap_ops	*ops;
	struct iomap_iter	*iter;
	loff_t			*ret;
};

static inline void iomap_iter_cleanup(struct iomap_iter_cleanup *ic)
{
	struct iomap_iter *iter = ic->iter;
	int ret2 = 0;

	if (!iter->iomap.length || !ic->ops->iomap_end)
		return;

	ret2 = ops->iomap_end(iter->inode, iter->pos,
			iomap_length(iter), 0, iter->flags,
			&iter->iomap);

	if (ret2 && *ic->ret == 0)
		*ic->ret = ret2;

	iter->iomap.length = 0;
}

#define IOMAP_ITER_CLEANUP(pag)	\
	struct iomap_iter_cleanup __iomap_iter_cleanup \
			__attribute__((__cleanup__(iomap_iter_cleanup))) = \
			{ .iter = (iter), .ops = (ops), .ret = &(ret) }

#define for_each_iomap(iter, ops, ret) \
	(ret) = iomap_iter((iter), (ops)); \
	for (IOMAP_ITER_CLEANUP(iter, ops, ret); \
		(ret) > 0; \
		(ret) = iomap_iter((iter), (ops)) \

Then we actually /can/ write our iteration loops in the normal C style:

	struct iomap_iter iter = {
		.inode = ...,
		.pos = 0,
		.length = 32768,
	};
	loff_t ret = 0;

	for_each_iomap(&iter, ops, ret) {
		if (iter.iomap.type != WHAT_I_WANT)
                        break;

		ret = am_i_pissed_off(...);
		if (ret)
			return ret;
	}

	return ret;

and ->iomap_end will always get called.  There are a few sharp edges:

I can't figure out how far back clang and gcc support this attribute.
The gcc docs mention it at least far back as 3.3.6.  clang (afaict) docs
don't reference it directly, but the clang 4 docs claim that it can be
as pedantic as gcc w.r.t. attribute use.  That's more than new enough
for upstream, which requires gcc 4.9 or clang 10.

The /other/ problem is that gcc gets fussy about defining variables
inside the for loop parentheses, which means that any code using it has
to compile with -std=gnu99, which is /not/ the usual c89 that the kernel
uses.  OTOH, it's been 22 years since C99 was ratified, c'mon...

--D

