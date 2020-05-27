Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A6FF91E3CB1
	for <lists+cluster-devel@lfdr.de>; Wed, 27 May 2020 10:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590569642;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JXLSkbthgddz0+rfCo3wcfw6xOr404GwTSInaNLXbWc=;
	b=ASrf4BWwMTKTt9/QE4mBnkSpJA5igXagsxx6aKvdPyZvjdZ1bjMAkkMN5mxMKIiRBBLDNj
	CrfVZdUC6MYauYMJNHLn394fj+yl4Pr7HW2WarsZYZNhdya1LOr5jPBpRoKyICbxocfZ+P
	neYIROGCg35aHpsTCfmPoKlLOEPS6LI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-yMJK-UDGMfeqHgmq6IK4CQ-1; Wed, 27 May 2020 04:54:00 -0400
X-MC-Unique: yMJK-UDGMfeqHgmq6IK4CQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 974D5100CC86;
	Wed, 27 May 2020 08:53:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F42C5D9E5;
	Wed, 27 May 2020 08:53:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEF3D18095FF;
	Wed, 27 May 2020 08:53:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R8rqr2024871 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 04:53:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1563274E82; Wed, 27 May 2020 08:53:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from localhost.localdomain (unknown [10.33.36.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 744B56E9F3;
	Wed, 27 May 2020 08:53:48 +0000 (UTC)
To: Andrew Price <anprice@redhat.com>, cluster-devel@redhat.com
References: <20200527082954.1235228-1-anprice@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <38694c56-7dcb-a52e-2d12-01949c20b9bd@redhat.com>
Date: Wed, 27 May 2020 09:53:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200527082954.1235228-1-anprice@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] mkfs.gfs2: Don't use optimal_io_size
 when equal to minimum
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/05/2020 09:29, Andrew Price wrote:
> Some devices report an optimal_io_size of 512 instead of 0 when it's not
> larger than the minimum_io_size. Currently mkfs.gfs2 uses the non-zero
> value to choose the block size, which is almost certainly not what we
> want when it's 512. Update the suitability check for optimal_io_size to
> avoid using it when it's the same as minimum_io_size.  The effect is
> that we fall back to using the default block size, 4096.
>
> Resolves: rhbz#1839219
> Signed-off-by: Andrew Price <anprice@redhat.com>

What about for other sizes? We don't really want to select a block size 
to be anything other than 4k in most cases, even if the block device 
offers a lower minimum/optimal I/O size,

Steve.


> ---
>   gfs2/mkfs/main_mkfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
> index 846b341f..8b97f3d2 100644
> --- a/gfs2/mkfs/main_mkfs.c
> +++ b/gfs2/mkfs/main_mkfs.c
> @@ -505,7 +505,7 @@ static unsigned choose_blocksize(struct mkfs_opts *opts)
>   	}
>   	if (!opts->got_bsize && got_topol) {
>   		if (dev->optimal_io_size <= getpagesize() &&
> -		    dev->optimal_io_size >= dev->minimum_io_size)
> +		    dev->optimal_io_size > dev->minimum_io_size)
>   			bsize = dev->optimal_io_size;
>   		else if (dev->physical_sector_size <= getpagesize() &&
>   		         dev->physical_sector_size >= GFS2_DEFAULT_BSIZE)

