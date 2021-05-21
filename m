Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 80B1238BCE2
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 05:13:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621566827;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=o+bViK+7PTgQkxKVxmLwJJadvz1EMcPfzuNvZmOXTgk=;
	b=g0WN/u5sRQnupZQyjbGr7Qu+h1ToFoUZD6SwVoctCWP017dZmWAqno54Vvs8H0fRdLI/jW
	lpX6kz3ErTAJICNi0z8h3/E9SAyj/yCIwekfk/UaYv0jBRbaGfcZCcfCdsdEcQNROvZNFw
	tMbjVUVWh1GziGg1K5ALG92VXpt+hMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-46o-iFFJPCSyxkp8z5ibKg-1; Thu, 20 May 2021 23:13:45 -0400
X-MC-Unique: 46o-iFFJPCSyxkp8z5ibKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74BA2801B13;
	Fri, 21 May 2021 03:13:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F4C45C6DF;
	Fri, 21 May 2021 03:13:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89CC044A5A;
	Fri, 21 May 2021 03:13:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14L3DU7o015044 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 23:13:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B5BF212AA9A; Fri, 21 May 2021 03:13:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 671DC21111D4
	for <cluster-devel@redhat.com>; Fri, 21 May 2021 03:13:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38553185A79C
	for <cluster-devel@redhat.com>; Fri, 21 May 2021 03:13:27 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-222-GZYINWsoNjKL2gxSNnao2w-1; Thu, 20 May 2021 23:13:25 -0400
X-MC-Unique: GZYINWsoNjKL2gxSNnao2w-1
Received: by mail-wm1-f71.google.com with SMTP id
	f8-20020a1c1f080000b0290169855914dfso3203655wmf.3
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 20:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o+bViK+7PTgQkxKVxmLwJJadvz1EMcPfzuNvZmOXTgk=;
	b=dZzun0F/q+oiMb7z37i1URqrkiEhjLbokq/HxJWRn6VZU8aqm670E6tezGpALQbOuB
	NIFjSf+mU6PQVZqWneD/h/B1M9IO/Qi2yjswCAEfBOM0PxW7smuqPj6LogiIw9tMuTp8
	WXNYXzkbHoH/sMaeoKNnjc2K6duahN4xFcbK57QfvbAwjMavsqZZhoAe2qnj9jXXEj5x
	kad3hqxMudG906uL8ChgIlei7nYv2zIx6utXEq6GRGOvtgMvysxIRXJUqVEmMjICkpTA
	e84KEwE9lcGtY7Z4YKB66dIKkmpPQGfI1AHIgrCIbPbxIZ5cgNV3UKpC+3chRlAn9Ue3
	fzMA==
X-Gm-Message-State: AOAM533HhZCTFLKjjM8iahJFdZS2IrLP3yW0VBBOjIBGIInVa0zUyJuB
	CnNzSjOFAhUhsyXPVf7UBnov8mmkQbBo4t0AU0vYmJIj4hIbUnZqzXssERImUK4Q9KW7BGaqYva
	tp78mJtsXcuQohQV1crr1zcG6U4+rZHCNenKgzw==
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr7045072wrp.182.1621566804378; 
	Thu, 20 May 2021 20:13:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmGVfnDnhXyzF/fPnKqbtcfmKRXvvxw2jCT8VeWGkK/Q9520GpMy6L+N44cxe6vao1Tg1CswfpSCoH0YDhOv8=
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr7045059wrp.182.1621566804198; 
	Thu, 20 May 2021 20:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120043.3462759-1-lee.jones@linaro.org>
	<20210520120043.3462759-3-lee.jones@linaro.org>
In-Reply-To: <20210520120043.3462759-3-lee.jones@linaro.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 21 May 2021 05:13:13 +0200
Message-ID: <CAHc6FU429=1Hzoghqo3=hqkSSmja3+ujna=mE_-Ro=KOMTPecg@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 02/15] fs: gfs2: glock: Fix some
 deficient kernel-doc headers and demote non-conformant ones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, May 20, 2021 at 2:00 PM Lee Jones <lee.jones@linaro.org> wrote:
> Fixes the following W=1 kernel build warning(s):
>
>  fs/gfs2/glock.c:365: warning: Function parameter or member 'gl' not described in 'do_error'
>  fs/gfs2/glock.c:365: warning: Function parameter or member 'ret' not described in 'do_error'
>  fs/gfs2/glock.c:461: warning: Function parameter or member 'new_state' not described in 'state_change'
>  fs/gfs2/glock.c:1277: warning: Function parameter or member 'delay' not described in 'handle_callback'
>  fs/gfs2/glock.c:1277: warning: Function parameter or member 'remote' not described in 'handle_callback'
>  fs/gfs2/glock.c:1578: warning: Function parameter or member 'p' not described in 'nq_m_sync'
>  fs/gfs2/glock.c:1993: warning: Excess function parameter 'wait' description in 'gfs2_gl_hash_clear'

What's that? Those warnings don't exist in mainline, and the two
warnings we have in mainline are fixed in for-next:

https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?h=for-next&id=75069590915f2

Andreas

> Cc: Bob Peterson <rpeterso@redhat.com>
> Cc: Andreas Gruenbacher <agruenba@redhat.com>
> Cc: cluster-devel@redhat.com
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  fs/gfs2/glock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index ea7fc5c641c7e..0b34f50b51331 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -356,7 +356,7 @@ static void gfs2_holder_wake(struct gfs2_holder *gh)
>         }
>  }
>
> -/**
> +/*
>   * do_error - Something unexpected has happened during a lock request
>   * @gl: The glock
>   * @ret: The status from the DLM
> @@ -1263,7 +1263,7 @@ int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs)
>         return ret;
>  }
>
> -/**
> +/*
>   * handle_callback - process a demote request
>   * @gl: the glock
>   * @state: the state the caller wants us to change to
> --
> 2.31.1
>

