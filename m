Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4351B13BBA0
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 09:58:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579078704;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LX7tx4Sjls1BVfNTkDv7rF7R/icBrYaqyT7AMMuOji0=;
	b=A/69wLr2qqHdiYNV9p721dAFayDNhobc05Y/b49UnrGrptg0ncfVaG8QT1zyXd59lqd+rR
	oFHymOoCEYNjyNSBnedvm/VrZc9uty/UZPajMyavf2SS8p7dtVESYUTWKqiS8joO1SNC4K
	1ft9jbQrXtF3m6qtRIOje716rirkv4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-MfLvUJoZPxuNZbk4cJ1WyA-1; Wed, 15 Jan 2020 03:58:22 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8D401005510;
	Wed, 15 Jan 2020 08:58:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 326EC811F2;
	Wed, 15 Jan 2020 08:58:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9064C824EC;
	Wed, 15 Jan 2020 08:58:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00F8wH0i019478 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 03:58:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1CB0A8248B; Wed, 15 Jan 2020 08:58:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9254D84325
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 08:58:14 +0000 (UTC)
To: cluster-devel@redhat.com
References: <20200115084956.7405-1-agruenba@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <d7d86bca-522a-48f5-bee3-bae50cd04485@redhat.com>
Date: Wed, 15 Jan 2020 08:58:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200115084956.7405-1-agruenba@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] Move struct gfs2_rgrp_lvb out of
 gfs2_ondisk.h
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
X-MC-Unique: MfLvUJoZPxuNZbk4cJ1WyA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/01/2020 08:49, Andreas Gruenbacher wrote:
> There's no point in sharing the internal structure of lock value blocks
> with user space.

The reason that is in ondisk is that changing that structure is 
something that needs to follow the same rules as changing the on disk 
structures. So it is there as a reminder of that,

Steve.


>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>   fs/gfs2/glock.h                  |  1 +
>   fs/gfs2/incore.h                 |  1 +
>   fs/gfs2/rgrp.c                   | 10 ++++++++++
>   include/uapi/linux/gfs2_ondisk.h | 10 ----------
>   4 files changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
> index b8adaf80e4c5..d2f2dba05a94 100644
> --- a/fs/gfs2/glock.h
> +++ b/fs/gfs2/glock.h
> @@ -306,4 +306,5 @@ static inline void glock_clear_object(struct gfs2_glock *gl, void *object)
>   	spin_unlock(&gl->gl_lockref.lock);
>   }
>   
> +
>   #endif /* __GLOCK_DOT_H__ */
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index b5d9c11f4901..5155389e9b5c 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -33,6 +33,7 @@ struct gfs2_trans;
>   struct gfs2_jdesc;
>   struct gfs2_sbd;
>   struct lm_lockops;
> +struct gfs2_rgrp_lvb;
>   
>   typedef void (*gfs2_glop_bh_t) (struct gfs2_glock *gl, unsigned int ret);
>   
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index 2466bb44a23c..1165627274cf 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -46,6 +46,16 @@
>   #define LBITSKIP00 (0x0000000000000000UL)
>   #endif
>   
> +struct gfs2_rgrp_lvb {
> +	__be32 rl_magic;
> +	__be32 rl_flags;
> +	__be32 rl_free;
> +	__be32 rl_dinodes;
> +	__be64 rl_igeneration;
> +	__be32 rl_unlinked;
> +	__be32 __pad;
> +};
> +
>   /*
>    * These routines are used by the resource group routines (rgrp.c)
>    * to keep track of block allocation.  Each block is represented by two
> diff --git a/include/uapi/linux/gfs2_ondisk.h b/include/uapi/linux/gfs2_ondisk.h
> index 2dc10a034de1..4e9a80941bec 100644
> --- a/include/uapi/linux/gfs2_ondisk.h
> +++ b/include/uapi/linux/gfs2_ondisk.h
> @@ -171,16 +171,6 @@ struct gfs2_rindex {
>   #define GFS2_RGF_NOALLOC	0x00000008
>   #define GFS2_RGF_TRIMMED	0x00000010
>   
> -struct gfs2_rgrp_lvb {
> -	__be32 rl_magic;
> -	__be32 rl_flags;
> -	__be32 rl_free;
> -	__be32 rl_dinodes;
> -	__be64 rl_igeneration;
> -	__be32 rl_unlinked;
> -	__be32 __pad;
> -};
> -
>   struct gfs2_rgrp {
>   	struct gfs2_meta_header rg_header;
>   

