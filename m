Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D16812A694E
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Nov 2020 17:20:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604506846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PYRj2mqxvPv7nscWvHq0PqXKQpcZzBYDydqX8nDCbZg=;
	b=RwZiq32MT2fkMEMyzY0swSGLBLEIYl0gV4BU8jE2hz1hYzEjop3+N0vGu5L+e+CWZqgKeW
	SOzFo6J4JancvblBmZbLf+czJg3T2hWY2Gp0Yx7064g5hMMUs297p8WEcJKJn3dwxxZJb2
	/HZ6aVCoyNpkoHBl+SNIZYBX73lSvdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-CxQSa4yJP665TryfAaLAsQ-1; Wed, 04 Nov 2020 11:20:45 -0500
X-MC-Unique: CxQSa4yJP665TryfAaLAsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCDFC101F7A3;
	Wed,  4 Nov 2020 16:20:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D92C55779;
	Wed,  4 Nov 2020 16:20:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E9288C7C5;
	Wed,  4 Nov 2020 16:20:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A4GKR63029012 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 11:20:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ACD381A885; Wed,  4 Nov 2020 16:20:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 626F319C4F;
	Wed,  4 Nov 2020 16:20:24 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59340181A050;
	Wed,  4 Nov 2020 16:20:24 +0000 (UTC)
Date: Wed, 4 Nov 2020 11:20:21 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Zhang Qilong <zhangqilong3@huawei.com>
Message-ID: <783856258.24540058.1604506821579.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201030101311.39674-1-zhangqilong3@huawei.com>
References: <20201030101311.39674-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.10, 10.4.195.16]
Thread-Topic: gfs2: fix possible reference leak in gfs2_check_blk_type
Thread-Index: NQjE+Q9vER66RAOVkPm7vLvu/y7vlw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: fix possible reference leak in
 gfs2_check_blk_type
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> In the fail path of gfs2_check_blk_type, forgetting to call
> gfs2_glock_dq_uninit will result in rgd_gh reference leak.
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  fs/gfs2/rgrp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index ee491bb9c1cc..dd3e888994f7 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -2526,8 +2526,10 @@ int gfs2_check_blk_type(struct gfs2_sbd *sdp, u64
> no_addr, unsigned int type)
>  
>  	rbm.rgd = rgd;
>  	error = gfs2_rbm_from_block(&rbm, no_addr);
> -	if (WARN_ON_ONCE(error))
> +	if (WARN_ON_ONCE(error)) {
> +		gfs2_glock_dq_uninit(&rgd_gh);
>  		goto fail;
> +	}
>  
>  	if (gfs2_testbit(&rbm, false) != type)
>  		error = -ESTALE;
> --
> 2.17.1

Hi,

Thanks. This is clearly a bug. Can we do something like this instead?
Andreas, which do you prefer?

 fs/gfs2/rgrp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 92d799a193b8..b26d6fcb6915 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2529,12 +2529,10 @@ int gfs2_check_blk_type(struct gfs2_sbd *sdp, u64 no_addr, unsigned int type)
 
 	rbm.rgd = rgd;
 	error = gfs2_rbm_from_block(&rbm, no_addr);
-	if (WARN_ON_ONCE(error))
-		goto fail;
-
-	if (gfs2_testbit(&rbm, false) != type)
-		error = -ESTALE;
-
+	if (!WARN_ON_ONCE(error)) {
+		if (gfs2_testbit(&rbm, false) != type)
+			error = -ESTALE;
+	}
 	gfs2_glock_dq_uninit(&rgd_gh);
 fail:
 	return error;

Regards,

Bob Peterson

