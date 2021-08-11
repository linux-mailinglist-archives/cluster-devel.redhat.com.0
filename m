Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 799993E89D7
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 07:41:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-_3AIicFpOiOexmpBNYH4FA-1; Wed, 11 Aug 2021 01:41:20 -0400
X-MC-Unique: _3AIicFpOiOexmpBNYH4FA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4199787180F;
	Wed, 11 Aug 2021 05:41:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 541AC69CBB;
	Wed, 11 Aug 2021 05:41:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13CD04BB7C;
	Wed, 11 Aug 2021 05:41:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17B5d56t000784 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 11 Aug 2021 01:39:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B722E204473B; Wed, 11 Aug 2021 05:39:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B34DE2044737
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 05:39:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26CB7101A529
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 05:39:03 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-236-U4Q6tZwMM0SQBehEJZDrlw-1;
	Wed, 11 Aug 2021 01:38:59 -0400
X-MC-Unique: U4Q6tZwMM0SQBehEJZDrlw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 66E0A6736F; Wed, 11 Aug 2021 07:38:56 +0200 (CEST)
Date: Wed, 11 Aug 2021 07:38:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210811053856.GA1934@lst.de>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-12-hch@lst.de>
	<20210811003118.GT3601466@magnolia>
MIME-Version: 1.0
In-Reply-To: <20210811003118.GT3601466@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 11/30] iomap: add the new iomap_iter
	model
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

On Tue, Aug 10, 2021 at 05:31:18PM -0700, Darrick J. Wong wrote:
> > +static inline void iomap_iter_done(struct iomap_iter *iter)
> 
> I wonder why this is a separate function, since it only has debugging
> warnings and tracepoints?

The reason for these two sub-helpers was to force me to structure the
code so that Matthews original idea of replacing ->iomap_begin and
->iomap_end with a single next callback so that iomap_iter could
be inlined into callers and the indirect calls could be elided is
still possible.  This would only be useful for a few specific
methods (probably dax and direct I/O) where we care so much, but it
seemed like a nice idea conceptually so I would not want to break it.

OTOH we could just remove this function for now and do that once needed.

> Modulo the question about iomap_iter_done, I guess this looks all right
> to me.  As far as apply.c vs. core.c, I'm not wildly passionate about
> either naming choice (I would have called it iter.c) but ... fmeh.

iter.c is also my preference, but in the end I don't care too much.

