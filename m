Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DB215FE3DA
	for <lists+cluster-devel@lfdr.de>; Fri, 15 Nov 2019 18:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573838628;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RfcI22DsgGfaDMthYMWjtyYG+a3f4ZEmzwB6+xvn5sk=;
	b=gKpSsoKueeWRcP3EkdvD0rWKUHmhyWP8RDHY66X6E//IO8UIiUa59gqwm7jlTiROOr64/G
	0xGj8vf4hBBhEPMioVW1GL2QGtmiZw3nBoIOVnOHahDf1wRXEniDqnojlPU3tzEP90wuYl
	ghC85WvjVx2wigMOMltliL2ebVt1RLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-3ghmaQ7jNKOUSOSNvZvoqA-1; Fri, 15 Nov 2019 12:23:47 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 058B21005500;
	Fri, 15 Nov 2019 17:23:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB18B1036C85;
	Fri, 15 Nov 2019 17:23:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C47C18089CD;
	Fri, 15 Nov 2019 17:23:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAFHNbAU012243 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 15 Nov 2019 12:23:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A202B7D567; Fri, 15 Nov 2019 17:23:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D9ED72903
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 17:23:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D88F5801013
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 17:23:35 +0000 (UTC)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
	[209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-426-BgEnv-RUMUSkrq62qIPO_Q-1; Fri, 15 Nov 2019 12:23:34 -0500
Received: by mail-oi1-f200.google.com with SMTP id h82so1861522oif.16
	for <cluster-devel@redhat.com>; Fri, 15 Nov 2019 09:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yK4jdPJsR6oHs2Bfv9zKZaySHC/olIfEdcCxyhaSXyM=;
	b=e+lxybc6x1q+RmNqEGLp41PSogSNfmJGwsY4hUKvkl4Wl59LAPJPjFu9/H7ZL8yUZm
	829nNWaJkv3TG7N0s7TqnxhbDPfELWRMl78iyD2XFAmVJPzYDE8lIpYgAM+qe7VIL22y
	DTfpzAVfj+2bJ3x1ZhIwAT+Ewepb6BTb/1gk8YlisnnJjrJ4ed4YfMW3pBCM1g9WsHRp
	PtIaLUrGulogl1p2K+Hu3m0uA3wPQwzqKuT/Ox27LSxPaYrBQLgVWxX8zPitmsQVG16P
	SWVsINVaBID/BRsftlBg7kxbGLth3PEUWhVNQ7I8wsdaBTXSQ4YGZk7mzoAt+8aBsTZC
	KSWw==
X-Gm-Message-State: APjAAAUg03XAWuxpgR9rtcHM+XZnZuhTkqUNmqaJIvzRdw1sWlu+LXof
	KHkbH7O/hCKjxJGjGReS9Y+ibFRFk5QwpVzuPbEU+gZmkKV0Z5uCaFt6oTlOx9TciGjMQ8XraNA
	1RySWZlZ8O3kLNxtKrMwGZk73MOu0ZmcyEVdvbA==
X-Received: by 2002:a05:6830:1f12:: with SMTP id
	u18mr906806otg.58.1573838613698; 
	Fri, 15 Nov 2019 09:23:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwj9JA/4eUwup+djFbIacaWL3LTdqwz3ml0Ic6bIw+YQl8R3oRmL+vKdHaiIW40lKYsZ5pse4ANQinr9bTVRCg=
X-Received: by 2002:a05:6830:1f12:: with SMTP id
	u18mr906768otg.58.1573838613128; 
	Fri, 15 Nov 2019 09:23:33 -0800 (PST)
MIME-Version: 1.0
References: <1819526286.30262006.1573832637022.JavaMail.zimbra@redhat.com>
	<1255360710.30262128.1573832741690.JavaMail.zimbra@redhat.com>
In-Reply-To: <1255360710.30262128.1573832741690.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 15 Nov 2019 18:23:21 +0100
Message-ID: <CAHc6FU5zTfvnqjrhQ13Jid79Vfqrk68X_FusUwRyczgAfu3xMA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: BgEnv-RUMUSkrq62qIPO_Q-1
X-MC-Unique: 3ghmaQ7jNKOUSOSNvZvoqA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAFHNbAU012243
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Close timing window with
	GLF_INVALIDATE_IN_PROGRESS
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2019 at 4:45 PM Bob Peterson <rpeterso@redhat.com> wrote:
>
> Hi,
>
> This patch closes a timing window in which two processes compete
> and overlap in the execution of do_xmote for the same glock:
>
>              Process A                              Process B
>    ------------------------------------   -----------------------------
> 1. Grabs gl_lockref and calls do_xmote
> 2.                                        Grabs gl_lockref but is blocked
> 3. Sets GLF_INVALIDATE_IN_PROGRESS
> 4. Unlocks gl_lockref
> 5.                                        Calls do_xmote
> 6. Call glops->go_sync
> 7. test_and_clear_bit GLF_DIRTY
> 8. Call gfs2_log_flush                    Call glops->go_sync
> 9. (slow IO, so it blocks a long time)    test_and_clear_bit GLF_DIRTY
>                                           It's not dirty (step 7) returns
> 10.                                       Tests GLF_INVALIDATE_IN_PROGRES=
S
> 11.                                       Calls go_inval (rgrp_go_inval)
> 12.                                       gfs2_rgrp_relse does brelse
> 13.                                       truncate_inode_pages_range
> 14.                                       Calls lm_lock UN
>
> In step 14 we've just told dlm to give the glock to another node
> when, in fact, process A has not finished the IO and synced all
> buffer_heads to disk and make sure their revokes are done.
>
> This patch fixes the problem by changing the GLF_INVALIDATE_IN_PROGRESS
> to use test_and_set_bit, and if the bit is already set, process B just
> ignores it and trusts that process A will do the do_xmote in the proper
> order.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/glock.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index faa88bd594e2..4a4a390ffd00 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -558,7 +558,19 @@ __acquires(&gl->gl_lockref.lock)
>         GLOCK_BUG_ON(gl, gl->gl_state =3D=3D gl->gl_target);
>         if ((target =3D=3D LM_ST_UNLOCKED || target =3D=3D LM_ST_DEFERRED=
) &&
>             glops->go_inval) {
> -               set_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags);
> +               /*
> +                * If another process is already doing the invalidate we =
should
> +                * not interfere. If we call go_sync and it finds the glo=
ck is
> +                * not dirty, we might call go_inval prematurely before t=
he
> +                * other go_sync has finished with its revokes. If we the=
n call
> +                * lm_lock prematurely, we've really screwed up: we canno=
t tell
> +                * dlm to give the glock away until we're synced and
> +                * invalidated. Best thing is to return and trust the oth=
er
> +                * process will finish do_xmote tasks in their proper ord=
er.
> +                */

That's a bit too much information here. Can we please change that as follow=
s?

                * If another process is already doing the invalidate, let t=
hat
                * finish first.  The glock state machine will get back to t=
his
                * holder again later.

> +               if (test_and_set_bit(GLF_INVALIDATE_IN_PROGRESS,
> +                                    &gl->gl_flags))
> +                       return;
>                 do_error(gl, 0); /* Fail queued try locks */
>         }
>         gl->gl_req =3D target;
>

Thanks,
Andreas


