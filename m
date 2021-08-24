Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 43B883F627A
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Aug 2021 18:12:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629821564;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DPZKIlT9b+7XG+Wkdicum/X4ALJnZ6iIFnRTNizQyRw=;
	b=a/+9vfm38pmHpJ5kwMl06J2atOL6zD0NvXBip6A2SRHLlkcRZcPSzNCgVmpes5rb02am2L
	gWQWaC0kzlwwaWuIwD/EhQDYkcnMKF1Tao3qkOfxxNQajr3gItMMb97eD7Gsr9TLOmr41I
	4kAVz4DelirpGWauCwu00hRqMgX8cBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-SL4UH0NcOO2ZX9sVnqsSlQ-1; Tue, 24 Aug 2021 12:12:43 -0400
X-MC-Unique: SL4UH0NcOO2ZX9sVnqsSlQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4239190A7A1;
	Tue, 24 Aug 2021 16:12:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3B6160871;
	Tue, 24 Aug 2021 16:12:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F5CC4BB7B;
	Tue, 24 Aug 2021 16:12:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OGCcLI014053 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 12:12:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38BAA11457E5; Tue, 24 Aug 2021 16:12:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 329FF11457E6
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 16:12:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21CAB800307
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 16:12:34 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-347-MbhWjrw2PqGqvuuByITLQw-1; Tue, 24 Aug 2021 12:12:32 -0400
X-MC-Unique: MbhWjrw2PqGqvuuByITLQw-1
Received: by mail-wm1-f69.google.com with SMTP id
	c4-20020a1c9a04000000b002e864b7edd1so1033571wme.6
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 09:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DPZKIlT9b+7XG+Wkdicum/X4ALJnZ6iIFnRTNizQyRw=;
	b=SykQpFqmdQ7qENG0InrLmut56mHXXCplUduLNOkB3sbIq10KSlcQkKURfXfSJ64lnT
	YtdzDWDek4K3H7BlaTUOVzmtLGQYY9rBZlwJQd9LZmHgyYLnqDqf2tqCTjkmC+1x+1WS
	+V+UuhxaMKcCePR8nbCfGtiRpltcD0xF7hsswB3L7Tr96w7ic1SENp1QTf3quQMPzRze
	x/jWJvGr5eba1K4mU6Vfraoh+uV1/VDbrqA5yC8N4pVJC8O8EjFFeWCpmkzvnM/gCQAz
	C+KWnoWWLuFPcnOJi6Cc7vloemgtcmnB0REv9X9Fatx4QwDmx3t0EtAsUfp+CKLTIlF+
	7Qmg==
X-Gm-Message-State: AOAM5339ClHNPL7s7RHevi9byB5nrayaqx+Jm1hyYvqKU6x1XOcUQf8V
	uZ1LZtSme+xKl3BFKLCOrka20DKhSM5FvsIPzP8LwvTLJq6AIvbijhrUfzDy+wM7Jf1lU39smOG
	pQ0VCf4TSXh0oRXvU8ePz53XpJKRlaDfuvlbAFg==
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr19824860wrq.377.1629821551548; 
	Tue, 24 Aug 2021 09:12:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrrGxp9rGHZrwhA5viKKJQdJbsfkT9d4WW+QWo3f9hRkbuDvRS/OjCsyFVdH6RczgcG9mKTdKhRNHm4MhZkPw=
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr19824304wrq.377.1629821546439; 
	Tue, 24 Aug 2021 09:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210824140241.149386-1-rpeterso@redhat.com>
	<20210824140241.149386-2-rpeterso@redhat.com>
In-Reply-To: <20210824140241.149386-2-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 24 Aug 2021 18:12:15 +0200
Message-ID: <CAHc6FU7SLAyoMc828JPAjb_z9YBM=dESDA3Lir5HWRt0e6ri3Q@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 1/3] gfs2: switch go_xmote_bh glop
 to pass gh not gl
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 24, 2021 at 4:02 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, the go_xmote_bh function was passed gl, the glock
> pointer. This patch switches it to gh, the holder, which points to the gl.
> This facilitates improvements for the next patch.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/glock.c  | 4 ++--
>  fs/gfs2/glops.c  | 5 +++--
>  fs/gfs2/incore.h | 2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index e0eaa9cf9fb6..d43eed1696ab 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -562,9 +562,9 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
>         if (test_and_clear_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags))
>                 gfs2_demote_wake(gl);
>         if (state != LM_ST_UNLOCKED) {
> -               if (glops->go_xmote_bh) {
> +               if (gh && glops->go_xmote_bh) {

This changes when the callback is called. Please explain why that's okay.

>                         spin_unlock(&gl->gl_lockref.lock);
> -                       rv = glops->go_xmote_bh(gl);
> +                       rv = glops->go_xmote_bh(gh);
>                         spin_lock(&gl->gl_lockref.lock);
>                         if (rv) {
>                                 do_error(gl, rv);
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 79c621c7863d..6d0770564493 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -598,10 +598,11 @@ static int freeze_go_sync(struct gfs2_glock *gl)
>
>  /**
>   * freeze_go_xmote_bh - After promoting/demoting the freeze glock
> - * @gl: the glock
> + * @gh: the holder of the glock
>   */
> -static int freeze_go_xmote_bh(struct gfs2_glock *gl)
> +static int freeze_go_xmote_bh(struct gfs2_holder *gh)
>  {
> +       struct gfs2_glock *gl = gh->gh_gl;
>         struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
>         struct gfs2_inode *ip = GFS2_I(sdp->sd_jdesc->jd_inode);
>         struct gfs2_glock *j_gl = ip->i_gl;
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index 0fe49770166e..354d6230d0f7 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -217,7 +217,7 @@ struct lm_lockname {
>
>  struct gfs2_glock_operations {
>         int (*go_sync) (struct gfs2_glock *gl);
> -       int (*go_xmote_bh)(struct gfs2_glock *gl);
> +       int (*go_xmote_bh)(struct gfs2_holder *gh);
>         void (*go_inval) (struct gfs2_glock *gl, int flags);
>         int (*go_demote_ok) (const struct gfs2_glock *gl);
>         int (*go_lock) (struct gfs2_holder *gh);
> --
> 2.31.1
>

Thanks,
Andreas

