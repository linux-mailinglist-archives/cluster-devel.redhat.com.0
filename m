Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8A72D23A3E7
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Aug 2020 14:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596457041;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3mek2A6PIw6FAWa9UG6mFGYnYOJu239mNTyE80MC8Tk=;
	b=EXxWWLharY8c2sqA0I5Wle/oQcNjcKUIeQFqVChZ4WZ/CXfp6qbfcUevx8Q6wyVC8kTWRJ
	HXHbwkAl0DUx8G9Zic/SIjExpIRJ5TAwvlqTAKQVA5hXLCndMgaSufbnhdDFIMWU1fV6vx
	bwQjmosA+sHbup1tOOABlCAz5Ffdmko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-FNPGNZlMOvqm3ynhXdXSEA-1; Mon, 03 Aug 2020 08:17:19 -0400
X-MC-Unique: FNPGNZlMOvqm3ynhXdXSEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A79EB194094C;
	Mon,  3 Aug 2020 12:17:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8665C71778;
	Mon,  3 Aug 2020 12:17:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA1901809547;
	Mon,  3 Aug 2020 12:17:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073CHDkn002246 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 08:17:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4A7D570A10; Mon,  3 Aug 2020 12:17:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E311270110;
	Mon,  3 Aug 2020 12:17:09 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11F9C9A109;
	Mon,  3 Aug 2020 12:17:09 +0000 (UTC)
Date: Mon, 3 Aug 2020 08:17:08 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1760387650.10412850.1596457028715.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200803115213.432367-1-agruenba@redhat.com>
References: <20200803115213.432367-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.61, 10.4.195.26]
Thread-Topic: gfs2: Fix refcount leak in gfs2_glock_poke
Thread-Index: ifhzwx7+YGgdX/sov0CLnDenNThApw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix refcount leak in
 gfs2_glock_poke
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
> In gfs2_glock_poke, make sure gfs2_holder_uninit is called on the local
> glock holder.  Without that, we're leaking a glock and a pid reference.
> 
> Fixes: 9e8990dea926 ("gfs2: Smarter iopen glock waiting")
> Cc: stable@vger.kernel.org # v5.8+
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/gfs2/glock.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index 57134d326cfa..f13b136654ca 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -790,9 +790,11 @@ static void gfs2_glock_poke(struct gfs2_glock *gl)
>  	struct gfs2_holder gh;
>  	int error;
>  
> -	error = gfs2_glock_nq_init(gl, LM_ST_SHARED, flags, &gh);
> +	gfs2_holder_init(gl, LM_ST_SHARED, flags, &gh);
> +	error = gfs2_glock_nq(&gh);
>  	if (!error)
>  		gfs2_glock_dq(&gh);
> +	gfs2_holder_uninit(&gh);
>  }
>  
>  static bool gfs2_try_evict(struct gfs2_glock *gl)
> --
> 2.26.2

Hi,

Looks okay.
I'd rather use nq_init and dq_uninit (and change similar code throughout
to use it more consistently) but in the past you've expressed a
concern that the compiler generates less efficient code.

Maybe it makes more sense to rework gfs2_glock_nq_init and dq_uninit
so the compiler does a more reasonable job? Or I suppose we could
delay that work for later.

Regards,

Bob Peterson

