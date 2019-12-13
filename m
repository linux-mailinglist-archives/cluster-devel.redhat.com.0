Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9035A11E860
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Dec 2019 17:32:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576254763;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uC2qhF6Odqc2lizXIPvgKAYAeUzBK2J3qQT+utfHy4w=;
	b=JCwbXy1FBQ1tqyGf65HrNan67dzVBmRSN/pBE9PjHz9oekr/UXBV85KPsGSukrO9GuqJK0
	9/GmTGIScUj+sJn6FPSlfBChupgN9Z/tXhhz8mny6s2CeK6EJxzpW856atxAy8mGkYe9eT
	3Wsqy0WtpnjeZyFBI8BFG6WjUH1EXXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-d1gC6aWXOOikW8BzErVInw-1; Fri, 13 Dec 2019 11:32:42 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 400F01005510;
	Fri, 13 Dec 2019 16:32:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F13F060BB3;
	Fri, 13 Dec 2019 16:32:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0610D18089C8;
	Fri, 13 Dec 2019 16:32:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBDGWXvk006832 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Dec 2019 11:32:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6A7385DA2C; Fri, 13 Dec 2019 16:32:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.89] (unknown [10.33.36.89])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 388A95D9CA;
	Fri, 13 Dec 2019 16:32:27 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>
References: <292849812.969129.1576253776315.JavaMail.zimbra@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <7b864a3b-7a20-b1f7-7fc0-987dfcd2a908@redhat.com>
Date: Fri, 13 Dec 2019 16:32:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <292849812.969129.1576253776315.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v2] gfs2: eliminate ssize parameter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: d1gC6aWXOOikW8BzErVInw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2019 16:16, Bob Peterson wrote:
> Hi,
> 
> Andy Price is right; this is a much better way to manage this.
> Here is the revised patch:
> 
> Every caller of function gfs2_struct2blk specified sizeof(u64).
> 
> This patch eliminates the unnecessary parameter and replaces the
> size calculation with a new superblock variable that is computed
> to be the maximum number of block pointers we can fit inside a
> log descriptor, as is done for pointers per dinode and indirect
> block.
> 
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>

Looks good.

Reviewed-by: Andrew Price <anprice@redhat.com>

Thanks,
Andy

> ---
>   fs/gfs2/glops.c      |  2 +-
>   fs/gfs2/incore.h     |  1 +
>   fs/gfs2/log.c        | 12 ++++--------
>   fs/gfs2/log.h        |  4 ++--
>   fs/gfs2/lops.c       |  2 +-
>   fs/gfs2/ops_fstype.c |  2 ++
>   fs/gfs2/trans.c      |  3 +--
>   7 files changed, 12 insertions(+), 14 deletions(-)
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
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index 5f89c515f5bb..b5d9c11f4901 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -703,6 +703,7 @@ struct gfs2_sbd {
>   	u32 sd_fsb2bb_shift;
>   	u32 sd_diptrs;	/* Number of pointers in a dinode */
>   	u32 sd_inptrs;	/* Number of pointers in a indirect block */
> +	u32 sd_ldptrs;  /* Number of pointers in a log descriptor block */
>   	u32 sd_jbsize;	/* Size of a journaled data block */
>   	u32 sd_hash_bsize;	/* sizeof(exhash block) */
>   	u32 sd_hash_bsize_shift;
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index eb3f2e7b8085..66189ae62c1d 100644
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
> @@ -45,18 +44,16 @@ static void gfs2_log_shutdown(struct gfs2_sbd *sdp);
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
> +	first = sdp->sd_ldptrs;
>   
>   	if (nstruct > first) {
> -		second = (sdp->sd_sb.sb_bsize -
> -			  sizeof(struct gfs2_meta_header)) / ssize;
> +		second = sdp->sd_inptrs;
>   		blks += DIV_ROUND_UP(nstruct - first, second);
>   	}
>   
> @@ -473,8 +470,7 @@ static unsigned int calc_reserved(struct gfs2_sbd *sdp)
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
> index 2ff163a8dce1..c0a65e5a126b 100644
> --- a/fs/gfs2/log.h
> +++ b/fs/gfs2/log.h
> @@ -60,9 +60,9 @@ static inline void gfs2_ordered_add_inode(struct gfs2_inode *ip)
>   		spin_unlock(&sdp->sd_ordered_lock);
>   	}
>   }
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
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index e8b7b0ce8404..b3e904bcc02c 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -298,6 +298,8 @@ static int gfs2_read_sb(struct gfs2_sbd *sdp, int silent)
>   			  sizeof(struct gfs2_dinode)) / sizeof(u64);
>   	sdp->sd_inptrs = (sdp->sd_sb.sb_bsize -
>   			  sizeof(struct gfs2_meta_header)) / sizeof(u64);
> +	sdp->sd_ldptrs = (sdp->sd_sb.sb_bsize -
> +			  sizeof(struct gfs2_log_descriptor)) / sizeof(u64);
>   	sdp->sd_jbsize = sdp->sd_sb.sb_bsize - sizeof(struct gfs2_meta_header);
>   	sdp->sd_hash_bsize = sdp->sd_sb.sb_bsize / 2;
>   	sdp->sd_hash_bsize_shift = sdp->sd_sb.sb_bsize_shift - 1;
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

