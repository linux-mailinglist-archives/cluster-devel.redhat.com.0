Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A451511E67D
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Dec 2019 16:24:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576250670;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LcpboWPy0rL6ZWHA39rRLH1g/I5655waqArza8EuaQA=;
	b=dWtfsQ+4mCdPTALlPQwP6l1Wb8eBs5ekZE7zPnFwpRN1X+OKX0JukkYpX1LwDuNrSfwFfm
	0RkXnYxfU93ZqDcsYNhGsFYxk7SLHgb6pixF93QxOBHGZeZk8g9tA3TZ1ckx6/T40+hWfn
	hyDn9mFaIiA78rSMdET7HAF2pGih/2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-DvsnthuGPxqyvzLiKHY8lQ-1; Fri, 13 Dec 2019 10:24:28 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9020107ACC7;
	Fri, 13 Dec 2019 15:24:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9E2E46E93;
	Fri, 13 Dec 2019 15:24:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01E5018559;
	Fri, 13 Dec 2019 15:24:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBDFONDO002234 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Dec 2019 10:24:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0875660C87; Fri, 13 Dec 2019 15:24:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.89] (unknown [10.33.36.89])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5073E60BF3;
	Fri, 13 Dec 2019 15:24:19 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>
References: <1020871924.948951.1576248371181.JavaMail.zimbra@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <9177e388-e804-03fe-92d2-a7669071022e@redhat.com>
Date: Fri, 13 Dec 2019 15:24:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1020871924.948951.1576248371181.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: eliminate ssize parameter
 from gfs2_struct2blk
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
X-MC-Unique: DvsnthuGPxqyvzLiKHY8lQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bob,

On 13/12/2019 14:46, Bob Peterson wrote:
> Hi,
> 
> Every caller of function gfs2_struct2blk specified sizeof(u64).
> This patch eliminates the unnecessary parameter and replaces the
> size calculation with a new inline function gfs2_ptrs_per_ld to
> compute the maximum number of block pointers we can fit inside a
> log descriptor. This new function will be used later to fix some
> revoke calculations.
> 
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>   fs/gfs2/glops.c |  2 +-
>   fs/gfs2/log.c   | 11 ++++-------
>   fs/gfs2/log.h   | 14 ++++++++++++--
>   fs/gfs2/lops.c  |  2 +-
>   fs/gfs2/trans.c |  3 +--
>   5 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 4ede1f18de85..061d22e1ceb6 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -95,7 +95,7 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
>   	/* A shortened, inline version of gfs2_trans_begin()
>            * tr->alloced is not set since the transaction structure is
>            * on the stack */
> -	tr.tr_reserved = 1 + gfs2_struct2blk(sdp, tr.tr_revokes, sizeof(u64));
> +	tr.tr_reserved = 1 + gfs2_struct2blk(sdp, tr.tr_revokes);
>   	tr.tr_ip = _RET_IP_;
>   	if (gfs2_log_reserve(sdp, tr.tr_reserved) < 0)
>   		return;
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index eb3f2e7b8085..fe1c35004b10 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -37,7 +37,6 @@ static void gfs2_log_shutdown(struct gfs2_sbd *sdp);
>    * gfs2_struct2blk - compute stuff
>    * @sdp: the filesystem
>    * @nstruct: the number of structures
> - * @ssize: the size of the structures
>    *
>    * Compute the number of log descriptor blocks needed to hold a certain number
>    * of structures of a certain size.
> @@ -45,18 +44,17 @@ static void gfs2_log_shutdown(struct gfs2_sbd *sdp);
>    * Returns: the number of blocks needed (minimum is always 1)
>    */
>   
> -unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct,
> -			     unsigned int ssize)
> +unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct)
>   {
>   	unsigned int blks;
>   	unsigned int first, second;
>   
>   	blks = 1;
> -	first = (sdp->sd_sb.sb_bsize - sizeof(struct gfs2_log_descriptor)) / ssize;
> +	first = gfs2_ptrs_per_ld(sdp);
>   
>   	if (nstruct > first) {
>   		second = (sdp->sd_sb.sb_bsize -
> -			  sizeof(struct gfs2_meta_header)) / ssize;
> +			  sizeof(struct gfs2_meta_header)) / sizeof(u64);

Could it be worth storing this value in the sbd (or in jdesc or 
something) so that it only needs to be calculated once?

>   		blks += DIV_ROUND_UP(nstruct - first, second);
>   	}
>   
> @@ -473,8 +471,7 @@ static unsigned int calc_reserved(struct gfs2_sbd *sdp)
>   	}
>   
>   	if (sdp->sd_log_commited_revoke > 0)
> -		reserved += gfs2_struct2blk(sdp, sdp->sd_log_commited_revoke,
> -					  sizeof(u64));
> +		reserved += gfs2_struct2blk(sdp, sdp->sd_log_commited_revoke);
>   	/* One for the overall header */
>   	if (reserved)
>   		reserved++;
> diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
> index 2ff163a8dce1..910fb97f34a1 100644
> --- a/fs/gfs2/log.h
> +++ b/fs/gfs2/log.h
> @@ -60,9 +60,19 @@ static inline void gfs2_ordered_add_inode(struct gfs2_inode *ip)
>   		spin_unlock(&sdp->sd_ordered_lock);
>   	}
>   }
> +
> +/**
> + * gfs2_ptrs_per_ld - compute max number of pointers we can fit in a log desc
> + * @sdp: the filesystem
> + */
> +static inline unsigned int gfs2_ptrs_per_ld(struct gfs2_sbd *sdp)
> +{
> +	return (sdp->sd_sb.sb_bsize - sizeof(struct gfs2_log_descriptor)) /
> +		sizeof(u64);
> +}

This one too?

Andy

> +
>   extern void gfs2_ordered_del_inode(struct gfs2_inode *ip);
> -extern unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct,
> -			    unsigned int ssize);
> +extern unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct);
>   
>   extern void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks);
>   extern int gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks);
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index 12696133618c..3200a6b82487 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -866,7 +866,7 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
>   	if (!sdp->sd_log_num_revoke)
>   		return;
>   
> -	length = gfs2_struct2blk(sdp, sdp->sd_log_num_revoke, sizeof(u64));
> +	length = gfs2_struct2blk(sdp, sdp->sd_log_num_revoke);
>   	page = gfs2_get_log_desc(sdp, GFS2_LOG_DESC_REVOKE, length, sdp->sd_log_num_revoke);
>   	offset = sizeof(struct gfs2_log_descriptor);
>   
> diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
> index 9d4227330de4..4d01fe19c125 100644
> --- a/fs/gfs2/trans.c
> +++ b/fs/gfs2/trans.c
> @@ -49,8 +49,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
>   	if (blocks)
>   		tr->tr_reserved += 6 + blocks;
>   	if (revokes)
> -		tr->tr_reserved += gfs2_struct2blk(sdp, revokes,
> -						   sizeof(u64));
> +		tr->tr_reserved += gfs2_struct2blk(sdp, revokes);
>   	INIT_LIST_HEAD(&tr->tr_databuf);
>   	INIT_LIST_HEAD(&tr->tr_buf);
>   
> 

