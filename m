Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CC3DB2E9C1A
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Jan 2021 18:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609781797;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M1LnAemTbBNBbqP419KX05Pp5Uzm2RZAoo+8GOCACn4=;
	b=PrItuHnh8Agqd66Pxhywst6+SVNIZhRgle5VBuOLvj2l23oSsAP19iVRFvJoBH6iMfs6Z5
	cTOtiG/4So9yD7L9GE4W95Xbf0uK9NLTLvy/Vk6/Wp7iDT3hBDfpopbSp9vxgXQjhoowUr
	FUgq5dxroULlcJ2ObyrDrvEecwofgrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-KDgkFkHlOCuUgXpAqymyoQ-1; Mon, 04 Jan 2021 12:36:36 -0500
X-MC-Unique: KDgkFkHlOCuUgXpAqymyoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 063A6107ACE3;
	Mon,  4 Jan 2021 17:36:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88981272A8;
	Mon,  4 Jan 2021 17:36:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BA2D4BB7B;
	Mon,  4 Jan 2021 17:36:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104HaMcX015347 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 12:36:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB29017250; Mon,  4 Jan 2021 17:36:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E38B55C8AA;
	Mon,  4 Jan 2021 17:36:22 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A09AE4BB40;
	Mon,  4 Jan 2021 17:36:22 +0000 (UTC)
Date: Mon, 4 Jan 2021 12:36:17 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Huangzhaoyang <huangzhaoyang@gmail.com>
Message-ID: <1782315626.42423902.1609781777002.JavaMail.zimbra@redhat.com>
In-Reply-To: <1609126800-19953-1-git-send-email-huangzhaoyang@gmail.com>
References: <1609126800-19953-1-git-send-email-huangzhaoyang@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.52, 10.4.195.21]
Thread-Topic: amend SLAB_RECLAIM_ACCOUNT on gfs2_quotad_cachep
Thread-Index: K9p1ljaFLQ5Tr93kZqn0v2ncKqiWDA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Subject: Re: [Cluster-devel] [PATCH] fs: amend SLAB_RECLAIM_ACCOUNT on
	gfs2_quotad_cachep
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> 
> As gfs2_quotad_cachep has registered the shrinker, amending
> SLAB_RECLAIM_ACCOUNT when create gfs2_quotad_cachep, which
> make the slab acount to be presiced.
> 
> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> ---
>  fs/gfs2/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
> index 136484e..db39de9 100644
> --- a/fs/gfs2/main.c
> +++ b/fs/gfs2/main.c
> @@ -136,7 +136,7 @@ static int __init init_gfs2_fs(void)
>  
>  	gfs2_quotad_cachep = kmem_cache_create("gfs2_quotad",
>  					       sizeof(struct gfs2_quota_data),
> -					       0, 0, NULL);
> +					       0, SLAB_RECLAIM_ACCOUNT, NULL);
>  	if (!gfs2_quotad_cachep)
>  		goto fail_cachep6;
>  
> --
> 1.9.1
> 
> 
Hi,

Thanks for the patch.
We should also do this for gfs2_glock_cachep. Can you add that to your patch?

Regards,

Bob Peterson

