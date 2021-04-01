Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5037F3512A5
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Apr 2021 11:46:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617270372;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X7EjvpSf/OLKlLx9A7tpwx4QUdPhzFZ+JaE4K8gyQBU=;
	b=h7vfhiLilwfLNpp78LYZMfDrAJoKZbzaxcN0UNlruBQ9peULdH65ezBjyw7B7qOYUhPATY
	MUMAUJdhk9zpzvH5zXXX+E93RCQt8WDeXlAaavXqqjjJ/R3VKYnZzrwtgxhAcRLVP6fO+u
	eT2QpZ83wSfZguH1cT6XEyPKPCJ/ycE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-KXPW-FfBMQezUY9JKPCi1w-1; Thu, 01 Apr 2021 05:46:10 -0400
X-MC-Unique: KXPW-FfBMQezUY9JKPCi1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08960180FCA9;
	Thu,  1 Apr 2021 09:46:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB9445944F;
	Thu,  1 Apr 2021 09:46:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A7244BB7B;
	Thu,  1 Apr 2021 09:46:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1319k506031697 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 05:46:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A464F17B15; Thu,  1 Apr 2021 09:46:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.189] (unknown [10.33.36.189])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AC765C649;
	Thu,  1 Apr 2021 09:45:57 +0000 (UTC)
To: Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com
References: <20210401091839.2251916-1-agruenba@redhat.com>
	<20210401091839.2251916-3-agruenba@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <4bdf64ec-835e-6d97-b1d9-b34defacb694@redhat.com>
Date: Thu, 1 Apr 2021 10:45:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401091839.2251916-3-agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 2/4] gfs2: Turn gfs2_extent_map into
 gfs2_{get, alloc}_extent
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/04/2021 10:18, Andreas Gruenbacher wrote:
> Convert gfs2_extent_map to iomap and split it into gfs2_get_extent and
> gfs2_alloc_extent.  Instead of hardcoding the extent size, pass it in
> via the extlen parameter.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>   fs/gfs2/bmap.c     | 59 ++++++++++++++++++++++++++++++----------------
>   fs/gfs2/bmap.h     |  6 +++--
>   fs/gfs2/dir.c      | 13 +++++-----
>   fs/gfs2/quota.c    |  4 ++--
>   fs/gfs2/recovery.c |  4 ++--
>   5 files changed, 53 insertions(+), 33 deletions(-)
> 
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index cc12dc0d6955..ac959a99ea81 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -1320,28 +1320,47 @@ int gfs2_block_map(struct inode *inode, sector_t lblock,
>   	return ret;
>   }
>   
> -/*
> - * Deprecated: do not use in new code
> - */
> -int gfs2_extent_map(struct inode *inode, u64 lblock, int *new, u64 *dblock, unsigned *extlen)
> +int gfs2_get_extent(struct inode *inode, u64 lblock, u64 *dblock,
> +		    unsigned int *extlen)
>   {
> -	struct buffer_head bh = { .b_state = 0, .b_blocknr = 0 };
> +	unsigned int blkbits = inode->i_blkbits;
> +	struct iomap iomap = { };
> +	unsigned int len;
>   	int ret;
> -	int create = *new;
> -
> -	BUG_ON(!extlen);
> -	BUG_ON(!dblock);
> -	BUG_ON(!new);
> -
> -	bh.b_size = BIT(inode->i_blkbits + (create ? 0 : 5));
> -	ret = gfs2_block_map(inode, lblock, &bh, create);
> -	*extlen = bh.b_size >> inode->i_blkbits;
> -	*dblock = bh.b_blocknr;
> -	if (buffer_new(&bh))
> -		*new = 1;
> -	else
> -		*new = 0;
> -	return ret;
> +
> +	ret = gfs2_iomap_get(inode, lblock << blkbits, *extlen << blkbits,
> +			     &iomap);
> +	if (ret)
> +		return ret;
> +	if (iomap.type != IOMAP_MAPPED)
> +		return -EIO;
> +	*dblock = iomap.addr >> blkbits;
> +	len = iomap.length >> blkbits;
> +	if (len < *extlen)
> +		*extlen = len;
> +	return 0;
> +}
> +
> +int gfs2_alloc_extent(struct inode *inode, u64 lblock, u64 *dblock,
> +		      unsigned int *extlen, bool *new)
> +{
> +	unsigned int blkbits = inode->i_blkbits;
> +	struct iomap iomap = { };
> +	unsigned int len;
> +	int ret;
> +
> +	ret = gfs2_iomap_alloc(inode, lblock << blkbits, *extlen << blkbits,
> +			       &iomap);
> +	if (ret)
> +		return ret;
> +	if (iomap.type != IOMAP_MAPPED)
> +		return -EIO;
> +	*dblock = iomap.addr >> blkbits;
> +	len = iomap.length >> blkbits;
> +	if (len < *extlen)
> +		*extlen = len;
> +	*new = iomap.flags & IOMAP_F_NEW;

As *new is bool, shouldn't this be !!(iomap.flags & IOMAP_F_NEW) or similar?

Otherwise, the set looks good to me.

Andy

> +	return 0;
>   }
>   
>   /*
> diff --git a/fs/gfs2/bmap.h b/fs/gfs2/bmap.h
> index c63efee8aaa4..67ef7cf7fdac 100644
> --- a/fs/gfs2/bmap.h
> +++ b/fs/gfs2/bmap.h
> @@ -53,8 +53,10 @@ extern int gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
>   			  struct iomap *iomap);
>   extern int gfs2_iomap_alloc(struct inode *inode, loff_t pos, loff_t length,
>   			    struct iomap *iomap);
> -extern int gfs2_extent_map(struct inode *inode, u64 lblock, int *new,
> -			   u64 *dblock, unsigned *extlen);
> +extern int gfs2_get_extent(struct inode *inode, u64 lblock, u64 *dblock,
> +			   unsigned int *extlen);
> +extern int gfs2_alloc_extent(struct inode *inode, u64 lblock, u64 *dblock,
> +			     unsigned *extlen, bool *new);
>   extern int gfs2_setattr_size(struct inode *inode, u64 size);
>   extern void gfs2_trim_blocks(struct inode *inode);
>   extern int gfs2_truncatei_resume(struct gfs2_inode *ip);
> diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
> index c0f2875c946c..4517ffb7c13d 100644
> --- a/fs/gfs2/dir.c
> +++ b/fs/gfs2/dir.c
> @@ -159,7 +159,7 @@ static int gfs2_dir_write_data(struct gfs2_inode *ip, const char *buf,
>   	unsigned int o;
>   	int copied = 0;
>   	int error = 0;
> -	int new = 0;
> +	bool new = false;
>   
>   	if (!size)
>   		return 0;
> @@ -189,9 +189,9 @@ static int gfs2_dir_write_data(struct gfs2_inode *ip, const char *buf,
>   			amount = sdp->sd_sb.sb_bsize - o;
>   
>   		if (!extlen) {
> -			new = 1;
> -			error = gfs2_extent_map(&ip->i_inode, lblock, &new,
> -						&dblock, &extlen);
> +			extlen = 1;
> +			error = gfs2_alloc_extent(&ip->i_inode, lblock, &dblock,
> +						  &extlen, &new);
>   			if (error)
>   				goto fail;
>   			error = -EIO;
> @@ -286,15 +286,14 @@ static int gfs2_dir_read_data(struct gfs2_inode *ip, __be64 *buf,
>   	while (copied < size) {
>   		unsigned int amount;
>   		struct buffer_head *bh;
> -		int new;
>   
>   		amount = size - copied;
>   		if (amount > sdp->sd_sb.sb_bsize - o)
>   			amount = sdp->sd_sb.sb_bsize - o;
>   
>   		if (!extlen) {
> -			new = 0;
> -			error = gfs2_extent_map(&ip->i_inode, lblock, &new,
> +			extlen = 32;
> +			error = gfs2_get_extent(&ip->i_inode, lblock,
>   						&dblock, &extlen);
>   			if (error || !dblock)
>   				goto fail;
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index 6e173ae378c4..9b1aca7e1264 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -1375,8 +1375,8 @@ int gfs2_quota_init(struct gfs2_sbd *sdp)
>   		unsigned int y;
>   
>   		if (!extlen) {
> -			int new = 0;
> -			error = gfs2_extent_map(&ip->i_inode, x, &new, &dblock, &extlen);
> +			extlen = 32;
> +			error = gfs2_get_extent(&ip->i_inode, x, &dblock, &extlen);
>   			if (error)
>   				goto fail;
>   		}
> diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> index 282173774005..4ab4cdbf774a 100644
> --- a/fs/gfs2/recovery.c
> +++ b/fs/gfs2/recovery.c
> @@ -34,12 +34,12 @@ int gfs2_replay_read_block(struct gfs2_jdesc *jd, unsigned int blk,
>   {
>   	struct gfs2_inode *ip = GFS2_I(jd->jd_inode);
>   	struct gfs2_glock *gl = ip->i_gl;
> -	int new = 0;
>   	u64 dblock;
>   	u32 extlen;
>   	int error;
>   
> -	error = gfs2_extent_map(&ip->i_inode, blk, &new, &dblock, &extlen);
> +	extlen = 32;
> +	error = gfs2_get_extent(&ip->i_inode, blk, &dblock, &extlen);
>   	if (error)
>   		return error;
>   	if (!dblock) {
> 

