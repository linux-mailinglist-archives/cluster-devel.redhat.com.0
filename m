Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B1AFF3CEEF6
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Jul 2021 00:10:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-jldh5itHPjG9Fzxujn2zSw-1; Mon, 19 Jul 2021 18:10:25 -0400
X-MC-Unique: jldh5itHPjG9Fzxujn2zSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D595801B0C;
	Mon, 19 Jul 2021 22:10:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B05001001281;
	Mon, 19 Jul 2021 22:10:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94EC14EA2A;
	Mon, 19 Jul 2021 22:10:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JMAE8J028567 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 18:10:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30CF7B3007; Mon, 19 Jul 2021 22:10:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B993B301E
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 22:10:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40946800B28
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 22:10:11 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-292-SfW1W2zTMheWsbrvGG2TJw-1; Mon, 19 Jul 2021 18:10:09 -0400
X-MC-Unique: SfW1W2zTMheWsbrvGG2TJw-1
Received: from dread.disaster.area (pa49-181-34-10.pa.nsw.optusnet.com.au
	[49.181.34.10])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 608471045436;
	Tue, 20 Jul 2021 08:10:06 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1m5bSf-008Ug1-At; Tue, 20 Jul 2021 08:10:05 +1000
Date: Tue, 20 Jul 2021 08:10:05 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210719221005.GL664593@dread.disaster.area>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-21-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210719103520.495450-21-hch@lst.de>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0
	a=hdaoRb6WoHYrV466vVKEyw==:117 a=hdaoRb6WoHYrV466vVKEyw==:17
	a=kj9zAlcOel0A:10 a=e_q4qTt1xDgA:10 a=7-415B0cAAAA:8
	a=ptF0LWpzHeEXjmLxdvQA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
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
Subject: Re: [Cluster-devel] [PATCH 20/27] fsdax: switch dax_iomap_rw to use
	iomap_iter
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

On Mon, Jul 19, 2021 at 12:35:13PM +0200, Christoph Hellwig wrote:
> Switch the dax_iomap_rw implementation to use iomap_iter.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/dax.c | 49 ++++++++++++++++++++++++-------------------------
>  1 file changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/dax.c b/fs/dax.c
> index 4d63040fd71f56..51da45301350a6 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -1103,20 +1103,21 @@ s64 dax_iomap_zero(loff_t pos, u64 length, struct iomap *iomap)
>  	return size;
>  }
>  
> -static loff_t
> -dax_iomap_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
> -		struct iomap *iomap, struct iomap *srcmap)
> +static loff_t dax_iomap_iter(const struct iomap_iter *iomi,
> +		struct iov_iter *iter)

At first I wondered "iomi? Strange name, why is this one-off name
used?" and then I realised it's because this function also takes an
struct iov_iter named "iter".

That's going to cause confusion in the long run - iov_iter and
iomap_iter both being generally named "iter", and then one or the
other randomly changing when both are used in the same function.

Would it be better to avoid any possible confusion simply by using
"iomi" for all iomap_iter variables throughout the patchset from the
start? That way nobody is going to confuse iov_iter with iomap_iter
iteration variables and code that uses both types will naturally
have different, well known names...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

