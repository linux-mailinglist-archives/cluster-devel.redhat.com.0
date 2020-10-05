Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EAE6F283674
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Oct 2020 15:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601904240;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YTXYdIhHk5aDsmJRXzTWqZveS0sOxEzJruj8mLHJqCU=;
	b=coXw6K+pz8he5uccD83sp/YxYgS4OjzAPB6JVp6ys6R9Q5biUZksoew0AreyDeMgcyzfF1
	0D8eAEgkgSQuwABO6bh+9SHFVIrVKrKmxqZoDAVkGGKFmvq5XcJY3M3X8hLw1yB6uJi9RB
	7C7YfUFDLN6iItCnakAyCpJGXvNtRO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-MiqkvPIbPiObXD9lRk0TMA-1; Mon, 05 Oct 2020 09:23:58 -0400
X-MC-Unique: MiqkvPIbPiObXD9lRk0TMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE2AE192AB67;
	Mon,  5 Oct 2020 13:23:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7134B7366A;
	Mon,  5 Oct 2020 13:23:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 986CC18095FF;
	Mon,  5 Oct 2020 13:23:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 095DN94a008744 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Oct 2020 09:23:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA1281002C00; Mon,  5 Oct 2020 13:23:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.138] (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 425D01002D46;
	Mon,  5 Oct 2020 13:23:04 +0000 (UTC)
To: Fox Chen <foxhlchen@gmail.com>
References: <20201003063143.13093-1-foxhlchen@gmail.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <ca694fc8-5f1b-ebf0-b891-c9a20225704f@redhat.com>
Date: Mon, 5 Oct 2020 14:23:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201003063143.13093-1-foxhlchen@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [Cluster-devel] [PATCH] gfs2: gfs2_read_sb: put gfs2_assert
 inside the loop
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/10/2020 07:31, Fox Chen wrote:
> for (x = 2;; x++) {
>          ...
>          gfs2_assert(sdp, x <= GFS2_MAX_META_HEIGHT);  <--- after
>          ...
>          if (d != sdp->sd_heightsize[x - 1] || m)
>                  break;
>          sdp->sd_heightsize[x] = space;
> }
> 
> sdp->sd_max_height = x
> gfs2_assert(sdp, sdp->sd_max_height <= GFS2_MAX_META_HEIGHT) <--- before
> 
> Before this patch, gfs2_assert is put outside of the loop of
> sdp->sd_heightsize[x] calculation. When something goes wrong,

So this looks related to one of the recent syzbot reports, where the 
"something goes wrong" is the block size in the on-disk superblock was 
zeroed and that leads eventually to this out-of-bounds write. The 
correct fix in that case would be to add a validity check for the block 
size in gfs2_check_sb().

Andy

> x exceeds the size of GFS2_MAX_META_HEIGHT, it may already crash inside
> the loop when
> 
> sdp->sd_heightsize[x] = space
> 
> tries to reach the out-of-bound
> location, gfs2_assert won't help here.
> 
> This patch fixes this by moving gfs2_assert into the loop.
> We will check x value each time to see if it exceeds GFS2_MAX_META_HEIGHT.
> 
> Signed-off-by: Fox Chen <foxhlchen@gmail.com>
> ---
>   fs/gfs2/ops_fstype.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 6d18d2c91add..6cc32e3010f2 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -333,6 +333,7 @@ static int gfs2_read_sb(struct gfs2_sbd *sdp, int silent)
>   		u64 space, d;
>   		u32 m;
>   
> +		gfs2_assert(sdp, x <= GFS2_MAX_META_HEIGHT);
>   		space = sdp->sd_heightsize[x - 1] * sdp->sd_inptrs;
>   		d = space;
>   		m = do_div(d, sdp->sd_inptrs);
> @@ -343,7 +344,6 @@ static int gfs2_read_sb(struct gfs2_sbd *sdp, int silent)
>   	}
>   	sdp->sd_max_height = x;
>   	sdp->sd_heightsize[x] = ~0;
> -	gfs2_assert(sdp, sdp->sd_max_height <= GFS2_MAX_META_HEIGHT);
>   
>   	sdp->sd_max_dents_per_leaf = (sdp->sd_sb.sb_bsize -
>   				      sizeof(struct gfs2_leaf)) /
> 

