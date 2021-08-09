Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB7F3E4EFF
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Aug 2021 00:11:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-o6oSEvgGOqe4O8lPs5PmXQ-1; Mon, 09 Aug 2021 18:11:12 -0400
X-MC-Unique: o6oSEvgGOqe4O8lPs5PmXQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 708B26409C;
	Mon,  9 Aug 2021 22:11:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 853C41036D05;
	Mon,  9 Aug 2021 22:11:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1F974BB7C;
	Mon,  9 Aug 2021 22:11:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 179MB0FJ023811 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 18:11:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 327342141E05; Mon,  9 Aug 2021 22:11:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CAFF2141E02
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 22:10:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE028858EEC
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 22:10:55 +0000 (UTC)
Received: from mail109.syd.optusnet.com.au (mail109.syd.optusnet.com.au
	[211.29.132.80]) by relay.mimecast.com with ESMTP id
	us-mta-530-fXK_NC63MWC4ra3EDbKRPA-1; Mon, 09 Aug 2021 18:10:53 -0400
X-MC-Unique: fXK_NC63MWC4ra3EDbKRPA-1
Received: from dread.disaster.area (pa49-195-182-146.pa.nsw.optusnet.com.au
	[49.195.182.146])
	by mail109.syd.optusnet.com.au (Postfix) with ESMTPS id 919098552B;
	Tue, 10 Aug 2021 08:10:49 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1mDDTr-00GSfc-Td; Tue, 10 Aug 2021 08:10:47 +1000
Date: Tue, 10 Aug 2021 08:10:47 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210809221047.GC3657114@dread.disaster.area>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-12-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-12-hch@lst.de>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0
	a=QpfB3wCSrn/dqEBSktpwZQ==:117 a=QpfB3wCSrn/dqEBSktpwZQ==:17
	a=kj9zAlcOel0A:10 a=MhDmnRu9jo8A:10 a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8
	a=c-sO9qzMkAf5MM67-4kA:9 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22
	a=biEYGPWJfzWAr4FL6Ov7:22
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
	"Darrick J. Wong" <djwong@kernel.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 08:12:25AM +0200, Christoph Hellwig wrote:
> The iomap_iter struct provides a convenient way to package up and
> maintain all the arguments to the various mapping and operation
> functions.  It is operated on using the iomap_iter() function that
> is called in loop until the whole range has been processed.  Compared
> to the existing iomap_apply() function this avoid an indirect call
> for each iteration.
> 
> For now iomap_iter() calls back into the existing ->iomap_begin and
> ->iomap_end methods, but in the future this could be further optimized
> to avoid indirect calls entirely.
> 
> Based on an earlier patch from Matthew Wilcox <willy@infradead.org>.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/iomap/Makefile     |  1 +
>  fs/iomap/core.c       | 79 +++++++++++++++++++++++++++++++++++++++++++
>  fs/iomap/trace.h      | 37 +++++++++++++++++++-
>  include/linux/iomap.h | 56 ++++++++++++++++++++++++++++++
>  4 files changed, 172 insertions(+), 1 deletion(-)
>  create mode 100644 fs/iomap/core.c
> 
> diff --git a/fs/iomap/Makefile b/fs/iomap/Makefile
> index eef2722d93a183..6b56b10ded347a 100644
> --- a/fs/iomap/Makefile
> +++ b/fs/iomap/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_FS_IOMAP)		+= iomap.o
>  
>  iomap-y				+= trace.o \
>  				   apply.o \
> +				   core.o \

This creates a discontinuity in the iomap git history. Can you add
these new functions to iomap/apply.c, then when the old apply code
is removed later in the series rename the file to core.c? At least
that way 'git log --follow fs/iomap/core.c' will walk back into the
current history of fs/iomap/apply.c and the older pre-disaggregation
fs/iomap.c without having to take the tree back in time to find
those files...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

