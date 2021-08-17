Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8B33EE480
	for <lists+cluster-devel@lfdr.de>; Tue, 17 Aug 2021 04:39:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-h-Iic7TOPP6zZYSzhABD_A-1; Mon, 16 Aug 2021 22:39:10 -0400
X-MC-Unique: h-Iic7TOPP6zZYSzhABD_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC610801E72;
	Tue, 17 Aug 2021 02:39:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFB186091B;
	Tue, 17 Aug 2021 02:39:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90030181A137;
	Tue, 17 Aug 2021 02:39:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17H2bDao000682 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 16 Aug 2021 22:37:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 212A3B34EB; Tue, 17 Aug 2021 02:37:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BFF16D9EF
	for <cluster-devel@redhat.com>; Tue, 17 Aug 2021 02:37:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D0A38482CF
	for <cluster-devel@redhat.com>; Tue, 17 Aug 2021 02:37:10 +0000 (UTC)
Received: from mail108.syd.optusnet.com.au (mail108.syd.optusnet.com.au
	[211.29.132.59]) by relay.mimecast.com with ESMTP id
	us-mta-343-nWe0vND1O6q9SpwkhdJPSw-1; Mon, 16 Aug 2021 22:37:06 -0400
X-MC-Unique: nWe0vND1O6q9SpwkhdJPSw-1
Received: from dread.disaster.area (pa49-195-182-146.pa.nsw.optusnet.com.au
	[49.195.182.146])
	by mail108.syd.optusnet.com.au (Postfix) with ESMTPS id F26771B4722;
	Tue, 17 Aug 2021 12:37:03 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1mFoyN-001amD-2Z; Tue, 17 Aug 2021 12:37:03 +1000
Date: Tue, 17 Aug 2021 12:37:02 +1000
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210817023702.GJ3657114@dread.disaster.area>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210811191926.GJ3601443@magnolia>
MIME-Version: 1.0
In-Reply-To: <20210811191926.GJ3601443@magnolia>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=F8MpiZpN c=1 sm=1 tr=0
	a=QpfB3wCSrn/dqEBSktpwZQ==:117 a=QpfB3wCSrn/dqEBSktpwZQ==:17
	a=kj9zAlcOel0A:10 a=MhDmnRu9jo8A:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
	a=7-415B0cAAAA:8 a=q_jVzwUvvCIIwZNgioUA:9 a=CjuIK1q_8ugA:10
	a=AjGcO6oz07-iQ99wixmX:22 a=biEYGPWJfzWAr4FL6Ov7:22
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
	Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 31/30] iomap: move iomap iteration code
	to iter.c
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

On Wed, Aug 11, 2021 at 12:19:26PM -0700, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Now that we've moved iomap to the iterator model, rename this file to be
> in sync with the functions contained inside of it.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/iomap/Makefile |    2 +-
>  fs/iomap/iter.c   |    0 
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename fs/iomap/{apply.c => iter.c} (100%)
> 
> diff --git a/fs/iomap/Makefile b/fs/iomap/Makefile
> index e46f936dde81..bb64215ae256 100644
> --- a/fs/iomap/Makefile
> +++ b/fs/iomap/Makefile
> @@ -26,9 +26,9 @@ ccflags-y += -I $(srctree)/$(src)		# needed for trace events
>  obj-$(CONFIG_FS_IOMAP)		+= iomap.o
>  
>  iomap-y				+= trace.o \
> -				   apply.o \
>  				   buffered-io.o \
>  				   direct-io.o \
>  				   fiemap.o \
> +				   iter.o \
>  				   seek.o
>  iomap-$(CONFIG_SWAP)		+= swapfile.o
> diff --git a/fs/iomap/apply.c b/fs/iomap/iter.c
> similarity index 100%
> rename from fs/iomap/apply.c
> rename to fs/iomap/iter.c

LGTM,

Reviewed-by: Dave Chinner <dchinner@redhat.com>
-- 
Dave Chinner
david@fromorbit.com

