Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 619B972A6A
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jul 2019 10:48:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A76F18F91F;
	Wed, 24 Jul 2019 08:48:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D9E55D71C;
	Wed, 24 Jul 2019 08:48:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0CB81800206;
	Wed, 24 Jul 2019 08:48:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6O8mhaH027872 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 04:48:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CBCB60497; Wed, 24 Jul 2019 08:48:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E8AB600D1
	for <cluster-devel@redhat.com>; Wed, 24 Jul 2019 08:48:40 +0000 (UTC)
To: cluster-devel@redhat.com
References: <20190724084303.1236-1-baijiaju1990@gmail.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <2986ed32-9aad-8e9c-1373-1402b34e65ac@redhat.com>
Date: Wed, 24 Jul 2019 09:48:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190724084303.1236-1-baijiaju1990@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] fs: gfs2: Fix a null-pointer
 dereference in gfs2_alloc_inode()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 24 Jul 2019 08:48:47 +0000 (UTC)

Hi,

On 24/07/2019 09:43, Jia-Ju Bai wrote:
> In gfs2_alloc_inode(), when kmem_cache_alloc() on line 1724 returns
> NULL, ip is assigned to NULL. In this case, "return &ip->i_inode" will
> cause a null-pointer dereference.
>
> To fix this null-pointer dereference, NULL is returned when ip is NULL.
>
> This bug is found by a static analysis tool STCheck written by us.

The bug is in the tool I'm afraid. Since i_inode is the first element of 
ip, there is no NULL dereference here. A pointer to ip->i_inode and a 
pointer to ip are one and the same (bar the differing types) which is 
the reason that we return &ip->i_inode rather than just ip,

Steve.


>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
>   fs/gfs2/super.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 0acc5834f653..c07c3f4f8451 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -1728,8 +1728,9 @@ static struct inode *gfs2_alloc_inode(struct super_block *sb)
>   		memset(&ip->i_res, 0, sizeof(ip->i_res));
>   		RB_CLEAR_NODE(&ip->i_res.rs_node);
>   		ip->i_rahead = 0;
> -	}
> -	return &ip->i_inode;
> +		return &ip->i_inode;
> +	} else
> +		return NULL;
>   }
>   
>   static void gfs2_free_inode(struct inode *inode)

