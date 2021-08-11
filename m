Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF8B3E98A7
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 21:22:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-YwP0PAdHNSCJrsUxVN5jcA-1; Wed, 11 Aug 2021 15:22:05 -0400
X-MC-Unique: YwP0PAdHNSCJrsUxVN5jcA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0161D801A92;
	Wed, 11 Aug 2021 19:22:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 174F15C1B4;
	Wed, 11 Aug 2021 19:22:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5877181A0F7;
	Wed, 11 Aug 2021 19:22:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17BJHHME003662 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 11 Aug 2021 15:17:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B46862087A5F; Wed, 11 Aug 2021 19:17:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B036E2087A33
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 19:17:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F273101A52C
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 19:17:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-568-qN8ZNE6_O--Wlmt30l2L4w-1;
	Wed, 11 Aug 2021 15:17:10 -0400
X-MC-Unique: qN8ZNE6_O--Wlmt30l2L4w-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2319261008;
	Wed, 11 Aug 2021 19:17:09 +0000 (UTC)
Date: Wed, 11 Aug 2021 12:17:08 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210811191708.GF3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-12-hch@lst.de>
	<20210811003118.GT3601466@magnolia> <20210811053856.GA1934@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210811053856.GA1934@lst.de>
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
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 11, 2021 at 07:38:56AM +0200, Christoph Hellwig wrote:
> On Tue, Aug 10, 2021 at 05:31:18PM -0700, Darrick J. Wong wrote:
> > > +static inline void iomap_iter_done(struct iomap_iter *iter)
> > 
> > I wonder why this is a separate function, since it only has debugging
> > warnings and tracepoints?
> 
> The reason for these two sub-helpers was to force me to structure the
> code so that Matthews original idea of replacing ->iomap_begin and
> ->iomap_end with a single next callback so that iomap_iter could
> be inlined into callers and the indirect calls could be elided is
> still possible.  This would only be useful for a few specific
> methods (probably dax and direct I/O) where we care so much, but it
> seemed like a nice idea conceptually so I would not want to break it.
> 
> OTOH we could just remove this function for now and do that once needed.

<shrug>

> > Modulo the question about iomap_iter_done, I guess this looks all right
> > to me.  As far as apply.c vs. core.c, I'm not wildly passionate about
> > either naming choice (I would have called it iter.c) but ... fmeh.
> 
> iter.c is also my preference, but in the end I don't care too much.

Ok.  My plan for this is to change this patch to add the new iter code
to apply.c, and change patch 24 to remove iomap_apply.  I'll add a patch
on the end to rename apply.c to iter.c, which will avoid breaking the
history.

I'll send the updated patches as replies to this series to avoid
spamming the list, since I also have a patchset of bugfixes to send out
and don't want to overwhelm everyone.

--D

