Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 41DCC3CEF03
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Jul 2021 00:22:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-Y9YH_KNeNdWjG94QOZFqmA-1; Mon, 19 Jul 2021 18:22:37 -0400
X-MC-Unique: Y9YH_KNeNdWjG94QOZFqmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4405310168D9;
	Mon, 19 Jul 2021 22:22:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 023AA5D9D3;
	Mon, 19 Jul 2021 22:22:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B16BA1809C99;
	Mon, 19 Jul 2021 22:22:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JMKjHe029183 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 18:20:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8ABAD1DB3B; Mon, 19 Jul 2021 22:20:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84702B3022
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 22:20:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC9311857F03
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 22:20:41 +0000 (UTC)
Received: from mail107.syd.optusnet.com.au (mail107.syd.optusnet.com.au
	[211.29.132.53]) by relay.mimecast.com with ESMTP id
	us-mta-127--Qv3rD5OMGq0Kz0N_WZxTw-1; Mon, 19 Jul 2021 18:20:39 -0400
X-MC-Unique: -Qv3rD5OMGq0Kz0N_WZxTw-1
Received: from dread.disaster.area (pa49-181-34-10.pa.nsw.optusnet.com.au
	[49.181.34.10])
	by mail107.syd.optusnet.com.au (Postfix) with ESMTPS id D3E955E74;
	Tue, 20 Jul 2021 07:48:38 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1m5b7u-008UI5-A0; Tue, 20 Jul 2021 07:48:38 +1000
Date: Tue, 20 Jul 2021 07:48:38 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210719214838.GK664593@dread.disaster.area>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-9-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210719103520.495450-9-hch@lst.de>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0
	a=hdaoRb6WoHYrV466vVKEyw==:117 a=hdaoRb6WoHYrV466vVKEyw==:17
	a=kj9zAlcOel0A:10 a=e_q4qTt1xDgA:10 a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8
	a=7pAWPZz2LBkM90URnJoA:9 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22
	a=biEYGPWJfzWAr4FL6Ov7:22
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
	"Darrick J. Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 08/27] iomap: add the new iomap_iter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2021 at 12:35:01PM +0200, Christoph Hellwig wrote:
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
>  fs/iomap/iter.c       | 74 +++++++++++++++++++++++++++++++++++++++++++
>  fs/iomap/trace.h      | 37 +++++++++++++++++++++-
>  include/linux/iomap.h | 56 ++++++++++++++++++++++++++++++++
>  4 files changed, 167 insertions(+), 1 deletion(-)
>  create mode 100644 fs/iomap/iter.c
> 
> diff --git a/fs/iomap/Makefile b/fs/iomap/Makefile
> index eef2722d93a183..85034deb5a2f19 100644
> --- a/fs/iomap/Makefile
> +++ b/fs/iomap/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_FS_IOMAP)		+= iomap.o
>  
>  iomap-y				+= trace.o \
>  				   apply.o \
> +				   iter.o \

Can we break this cycle of creating new files and removing old files
when changing the iomap core code? It breaks the ability to troll
git history easily through git blame and other techniques that are
file based.

If we are going to create a new file, then the core iomap code that
every thing depends on should just be in a neutrally names file such
as "iomap.c" so that we don't need to play these games in future.

....

> +/**
> + * iomap_iter - iterate over a ranges in a file
> + * @iter: iteration structue
> + * @ops: iomap ops provided by the file system
> + *
> + * Iterate over file system provided contiguous ranges of blocks with the same
> + * state.  Should be called in a loop that continues as long as this function
> + * returns a positive value.  If 0 or a negative value is returned the caller
> + * should break out of the loop - a negative value is an error either from the
> + * file system or from the last iteration stored in @iter.copied.
> + */
> +int iomap_iter(struct iomap_iter *iter, const struct iomap_ops *ops)
> +{

We should avoid namespace conflicts where function names shadow
object types. iomap_iterate() is fine as the function name - there's
no need for abbreviation here because it's not an overly long name.
This will makes it clearly different to the struct iomap_iter that
is passed to it and it will also make grep, cscope and other
code searching tools much more precise...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

