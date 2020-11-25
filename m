Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 84A722C3B51
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Nov 2020 09:49:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606294152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jl1MF9c1G3dofIODBVBvs1CErr5Ca2RooFYO45R5uDo=;
	b=AQJ4KH3wDazglGYtbsfDdhESRMzz5AcE2IrNCFvnfWInNRZmN1x3RBqnWSUvF8uMxXm+rd
	jv9w9502b41uKmGw3DVkrkmxwS6R/whKQk6zYrF8elgwrcioxJnGAWLJ28lS6xewtRWdZQ
	VU1l8ZfeE4YRxWycwu8kqjzFKMVfP2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-2pENHI5FOl6XoC3EKI831w-1; Wed, 25 Nov 2020 03:49:10 -0500
X-MC-Unique: 2pENHI5FOl6XoC3EKI831w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F9DE3E747;
	Wed, 25 Nov 2020 08:49:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 738AC5D9C0;
	Wed, 25 Nov 2020 08:49:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 551674BB7B;
	Wed, 25 Nov 2020 08:49:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AP8n0FF001109 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 03:49:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BC4E510021B3; Wed, 25 Nov 2020 08:49:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 184AE10016FB;
	Wed, 25 Nov 2020 08:48:57 +0000 (UTC)
To: Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com
References: <20201124164240.436553-1-agruenba@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <90580131-3d14-3620-d397-2b8754bbaa92@redhat.com>
Date: Wed, 25 Nov 2020 08:48:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201124164240.436553-1-agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Take inode glock exclusively when
 mounted without noatime
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 24/11/2020 16:42, Andreas Gruenbacher wrote:
> Commit 20f829999c38 ("gfs2: Rework read and page fault locking") has lifted the
> glock lock taking from the low-level ->readpage and ->readahead address space
> operations to the higher-level ->read_iter file and ->fault vm operations.  The
> glocks are still taken in LM_ST_SHARED mode only.  On filesystems mounted
> without the noatime option, ->read_iter needs to update the atime as well
> though, so we currently run into a failed locking mode assertion in
> gfs2_dirty_inode.  Fix that by taking the glock in LM_ST_EXCLUSIVE mode on
> filesystems mounted without the noatime mount option.
>
> Faulting in pages doesn't update the atime, so in the ->fault vm operation,
> taking the glock in LM_ST_SHARED mode is enough.

I don't think this makes any sense to do. It is going to reduce the 
scalibility quite a lot I suspect. Even if you have multiple nodes 
reading a file, the atime updates would not be synchronous with the 
reads, so why insist on an exclusive lock here?

Steve.


>
> Reported-by: Alexander Aring <aahringo@redhat.com>
> Fixes: 20f829999c38 ("gfs2: Rework read and page fault locking")
> Cc: stable@vger.kernel.org # v5.8+
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
>
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index b39b339feddc..162a81873dcd 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -849,6 +849,7 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>   	struct gfs2_inode *ip;
>   	struct gfs2_holder gh;
>   	size_t written = 0;
> +	unsigned int state;
>   	ssize_t ret;
>   
>   	if (iocb->ki_flags & IOCB_DIRECT) {
> @@ -871,7 +872,8 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>   			return ret;
>   	}
>   	ip = GFS2_I(iocb->ki_filp->f_mapping->host);
> -	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
> +	state = IS_NOATIME(&ip->i_inode) ? LM_ST_SHARED : LM_ST_EXCLUSIVE;
> +	gfs2_holder_init(ip->i_gl, state, 0, &gh);
>   	ret = gfs2_glock_nq(&gh);
>   	if (ret)
>   		goto out_uninit;
>

