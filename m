Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA922AAA76
	for <lists+cluster-devel@lfdr.de>; Sun,  8 Nov 2020 10:59:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604829559;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pY20cyCIQ+bwaEC227dgzqzI0VGIh8IPj4NpYSoXtek=;
	b=BWOBNHtdhfTw6J3EYe4UVFgknQ3N9Zs0PWku/mBHMe4rGOf61baMm5SdkWu6Q/oK2MWBO7
	IOsC8uglPiqtAi+0tJjA1hvXNv4w7l44Cwsvr4mQWD001IDjCMkyBn7aBctm9B/a6FZld2
	Bj/dGUHo7A0Z5wSimSSs3ge3kVHLRjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-QDg6Xp1oPYye8I1fTMAXFw-1; Sun, 08 Nov 2020 04:59:17 -0500
X-MC-Unique: QDg6Xp1oPYye8I1fTMAXFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83814107AFB6;
	Sun,  8 Nov 2020 09:59:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F37915C1D7;
	Sun,  8 Nov 2020 09:59:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5847CF54;
	Sun,  8 Nov 2020 09:59:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A89x59o013321 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 8 Nov 2020 04:59:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 56458112D41C; Sun,  8 Nov 2020 09:59:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5285B112D41B
	for <cluster-devel@redhat.com>; Sun,  8 Nov 2020 09:59:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3790B101A53F
	for <cluster-devel@redhat.com>; Sun,  8 Nov 2020 09:59:03 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-287-MvQ12s8PPFatrdNlCOax1g-1; Sun, 08 Nov 2020 04:59:01 -0500
X-MC-Unique: MvQ12s8PPFatrdNlCOax1g-1
Received: by mail-wr1-f72.google.com with SMTP id w6so2802873wrk.1
	for <cluster-devel@redhat.com>; Sun, 08 Nov 2020 01:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pY20cyCIQ+bwaEC227dgzqzI0VGIh8IPj4NpYSoXtek=;
	b=qlB055ZRZjccv9kWE3UIR6OgoQiABN7Sk/8XZw+XjiHeXUZPlsJoPkH2/ibvDW0k7M
	KeFC8CTTAsuZa/MBUF+gFDRUxOuCTkpBMzw7JU2QFXPXS87Bx57nBRjo+hOAOeVIrmRP
	hLMS2xnrlvzbY2B7lIc+KrUldn6LFHF32IynFSMAwf0K35oqgFl52f1iqLvHwNlj0DGE
	wwpCOMnQ9WDVO1AyB1p0xf44AtjwVXSYOS6wexL55jZRFDO+k6b9xwK7FK0PPlBwN/lI
	3U8ZUmZiy95zmiDjQOhKYKBGc/krO4ZF9cyHYzE6uPztox5BozU1C4LY8KhhBcl/3cUm
	nTUw==
X-Gm-Message-State: AOAM531i9UE8dGhpQ7drcVmWyjnYjfEx29GN61DIRjIY0mg25TvR8SCo
	gqjLmk5rBIxEx8lBiQVJaGgk61JIGegQ0BFpVO83bicKQpfvc5b698ADRBCgnzm+UPppz82T9ZK
	48ly/BtRD5KsoQFJSepaTdbifEXPxT4tF86c/3w==
X-Received: by 2002:adf:a3d1:: with SMTP id m17mr2642049wrb.289.1604829540250; 
	Sun, 08 Nov 2020 01:59:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEiIYOfAXAyAniuK6yqiWve0wH6Wcyoq/f0Hc6kDL+8cSN7o0VO7C8Twr4gLrtlCs+9ThPqSK7Oglv0kRsm6U=
X-Received: by 2002:adf:a3d1:: with SMTP id m17mr2642040wrb.289.1604829540122; 
	Sun, 08 Nov 2020 01:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20201108092741.2857920-1-zhangqilong3@huawei.com>
In-Reply-To: <20201108092741.2857920-1-zhangqilong3@huawei.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sun, 8 Nov 2020 10:58:48 +0100
Message-ID: <CAHc6FU5A6kmP_tU4JOkDNoF4760cOj--AW=TgAfvwKBye8xvDw@mail.gmail.com>
To: Zhang Qilong <zhangqilong3@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH v2] gfs2: fix possible reference leak in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 8, 2020 at 10:24 AM Zhang Qilong <zhangqilong3@huawei.com> wrote:
> In the fail path of gfs2_check_blk_type, forgetting to call
> gfs2_glock_dq_uninit will result in rgd_gh reference leak.
>
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
> Changelog
> v2
> - adjusted the position of gfs2_testbit.
> ---
>  fs/gfs2/rgrp.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index 92d799a193b8..f7addc6197ed 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -2529,13 +2529,13 @@ int gfs2_check_blk_type(struct gfs2_sbd *sdp, u64 no_addr, unsigned int type)
>
>         rbm.rgd = rgd;
>         error = gfs2_rbm_from_block(&rbm, no_addr);
> -       if (WARN_ON_ONCE(error))
> -               goto fail;
> -
> -       if (gfs2_testbit(&rbm, false) != type)
> -               error = -ESTALE;
> +       if (!WARN_ON_ONCE(error)) {
> +               if (gfs2_testbit(&rbm, false) != type)
> +                       error = -ESTALE;
> +       }
>
>         gfs2_glock_dq_uninit(&rgd_gh);
> +
>  fail:
>         return error;
>  }

Added to for-next, thanks.

Andreas

