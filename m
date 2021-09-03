Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 451E5400573
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Sep 2021 21:02:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-h9cjSXVkNKC_BkQIiaGYgQ-1; Fri, 03 Sep 2021 15:02:50 -0400
X-MC-Unique: h9cjSXVkNKC_BkQIiaGYgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2144819611AA;
	Fri,  3 Sep 2021 19:02:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B21A060C81;
	Fri,  3 Sep 2021 19:02:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65DB61809C81;
	Fri,  3 Sep 2021 19:02:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 183IspiP019237 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Sep 2021 14:54:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7787120C1667; Fri,  3 Sep 2021 18:54:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7060B20C3A90
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 18:54:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99F8680158D
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 18:54:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-357--8KmampBNY6f2NpGobYXSQ-1;
	Fri, 03 Sep 2021 14:54:44 -0400
X-MC-Unique: -8KmampBNY6f2NpGobYXSQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 888A661051;
	Fri,  3 Sep 2021 18:54:43 +0000 (UTC)
Date: Fri, 3 Sep 2021 11:54:43 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210903185443.GF9892@magnolia>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-15-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210827164926.1726765-15-agruenba@redhat.com>
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
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 14/19] iomap: Fix iomap_dio_rw return
 value for user copies
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 27, 2021 at 06:49:21PM +0200, Andreas Gruenbacher wrote:
> When a user copy fails in one of the helpers of iomap_dio_rw, fail with
> -EFAULT instead of returning 0.  This matches what iomap_dio_bio_actor
> returns when it gets an -EFAULT from bio_iov_iter_get_pages.  With these
> changes, iomap_dio_actor now consistently fails with -EFAULT when a user
> page cannot be faulted in.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/direct-io.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index 9398b8c31323..8054f5d6c273 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -370,7 +370,7 @@ iomap_dio_hole_actor(loff_t length, struct iomap_dio *dio)
>  {
>  	length = iov_iter_zero(length, dio->submit.iter);
>  	dio->size += length;
> -	return length;
> +	return length ? length : -EFAULT;
>  }
>  
>  static loff_t
> @@ -397,7 +397,7 @@ iomap_dio_inline_actor(struct inode *inode, loff_t pos, loff_t length,
>  		copied = copy_to_iter(iomap->inline_data + pos, length, iter);
>  	}
>  	dio->size += copied;
> -	return copied;
> +	return copied ? copied : -EFAULT;
>  }
>  
>  static loff_t
> -- 
> 2.26.3
> 

