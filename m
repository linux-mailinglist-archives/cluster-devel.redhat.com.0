Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 687FE32B8FF
	for <lists+cluster-devel@lfdr.de>; Wed,  3 Mar 2021 16:40:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614786037;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v/B/vFyvdim6DFmRje+NahSs84+dybnbCq6JUenc1xY=;
	b=V5R5Szo7WsZyPy4uUVh2e4Zq5KC66vMORDCY0ClurG9/D5YwF3xlIAaj9tweRlVQplBeXj
	YadeR5ki6e6W341rA9Uvf/qzq9z4LQfzZqFK7RXog5bOLofeQoyFZbT0Oo2YPWD4Q/6eCt
	ZIaHUiAQB+79tBaiep4aFPkk5LivZnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-7QzWGFTBMNKZN3f0BmbnIA-1; Wed, 03 Mar 2021 10:40:36 -0500
X-MC-Unique: 7QzWGFTBMNKZN3f0BmbnIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C49E91005501;
	Wed,  3 Mar 2021 15:40:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C5560BD9;
	Wed,  3 Mar 2021 15:40:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BFBB58073;
	Wed,  3 Mar 2021 15:40:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 123FeL1x015488 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 3 Mar 2021 10:40:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8002750DE6; Wed,  3 Mar 2021 15:40:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7639D6FEED;
	Wed,  3 Mar 2021 15:40:21 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B93718095CB;
	Wed,  3 Mar 2021 15:40:20 +0000 (UTC)
Date: Wed, 3 Mar 2021 10:40:20 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Message-ID: <270744488.59307524.1614786020378.JavaMail.zimbra@redhat.com>
In-Reply-To: <1614676526-102967-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1614676526-102967-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.116, 10.4.195.12]
Thread-Topic: gfs2: Remove unneeded return variable
Thread-Index: 3VuNkBJDA75kU/6FZuU1wYet5NWkVw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] gfs2: Remove unneeded return variable
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> This patch removes unneeded return variables, using only
> '0' instead.
> It fixes the following warning detected by coccinelle:
> ./fs/gfs2/super.c:592:5-10: Unneeded variable: "error". Return "0" on
> line 628
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  fs/gfs2/super.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 861ed5f..fe2dae4 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -589,7 +589,6 @@ static void gfs2_dirty_inode(struct inode *inode, int
> flags)
>  
>  int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
>  {
> -	int error = 0;
>  	int log_write_allowed = test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
>  
>  	gfs2_flush_delete_work(sdp);
> @@ -625,7 +624,7 @@ int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
>  	if (!log_write_allowed)
>  		sdp->sd_vfs->s_flags |= SB_RDONLY;
>  
> -	return error;
> +	return 0;
>  }
>  
>  /**
> --
> 1.8.3.1

Hi Yang,

Thanks for submitting your patch. I like it. However, since gfs2_make_fs_ro
always returns 0, we should also be able to make it a void function instead
of int, and change its callers to not act on any return code.

Regards,

Bob Peterson
Red Hat File Systems

