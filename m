Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 701B53EAA31
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Aug 2021 20:24:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-yn1DgcTkOqq-agrJnrpLjg-1; Thu, 12 Aug 2021 14:24:38 -0400
X-MC-Unique: yn1DgcTkOqq-agrJnrpLjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DF34180FCCC;
	Thu, 12 Aug 2021 18:24:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63D1160939;
	Thu, 12 Aug 2021 18:24:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 984C64BB7B;
	Thu, 12 Aug 2021 18:24:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17CIKOV9002334 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 12 Aug 2021 14:20:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC95611EB31; Thu, 12 Aug 2021 18:20:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D9611EB3C
	for <cluster-devel@redhat.com>; Thu, 12 Aug 2021 18:20:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57D1F89C7DE
	for <cluster-devel@redhat.com>; Thu, 12 Aug 2021 18:20:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-393-dwpH2L-PNV24_hDh1pQWPg-1;
	Thu, 12 Aug 2021 14:20:19 -0400
X-MC-Unique: dwpH2L-PNV24_hDh1pQWPg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFF3C6101E;
	Thu, 12 Aug 2021 18:20:17 +0000 (UTC)
Date: Thu, 12 Aug 2021 11:20:17 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210812182017.GX3601466@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-12-hch@lst.de>
	<20210811003118.GT3601466@magnolia> <20210811053856.GA1934@lst.de>
	<20210811191708.GF3601443@magnolia> <20210812064914.GA27145@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210812064914.GA27145@lst.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 12, 2021 at 08:49:14AM +0200, Christoph Hellwig wrote:
> On Wed, Aug 11, 2021 at 12:17:08PM -0700, Darrick J. Wong wrote:
> > > iter.c is also my preference, but in the end I don't care too much.
> > 
> > Ok.  My plan for this is to change this patch to add the new iter code
> > to apply.c, and change patch 24 to remove iomap_apply.  I'll add a patch
> > on the end to rename apply.c to iter.c, which will avoid breaking the
> > history.
> 
> What history?  There is no shared code, so no shared history and.

The history of the gluecode that enables us to walk a bunch of extent
mappings.  In the beginning it was the _apply function, but now in our
spectre-weary world, you've switched it to a direct loop to reduce the
number of indirect calls in the hot path by 30-50%.

As you correctly point out, there's no /code/ shared by the two
implementations, but Dave and I would like to preserve the continuity
from one to the next.

> > I'll send the updated patches as replies to this series to avoid
> > spamming the list, since I also have a patchset of bugfixes to send out
> > and don't want to overwhelm everyone.
> 
> Just as a clear statement:  I think this dance is obsfucation and doesn't
> help in any way.  But if that's what it takes..

I /would/ appreciate it if you'd rvb (or at least ack) patch 31 so I can
get the 5.15 iomap changes finalized next week.  Pretty please? :)

--D

