Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7AA1BBA6A
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Apr 2020 11:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588067795;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AylmyNf+k+bglahDysv5q5OueW+dU36iuWf1WltABkI=;
	b=OW39RBifXJsPq1jFcLztefT+hTjtxPCdCy4fJvu3tzx/kOmqKdvs4J5QniN9yFR14bSIip
	H7ZPXrCocBRnM+drp4NhKLmIUFkEy82a+B+V/outynmvGhna8OSDGEDrCZPP0xgUS8+nmW
	8IEOIzvTRijq9evI3nDlwa0fS9kNOy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-OgvG6iABN2mbHOLQg6-A5A-1; Tue, 28 Apr 2020 05:56:33 -0400
X-MC-Unique: OgvG6iABN2mbHOLQg6-A5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 377C51083E81;
	Tue, 28 Apr 2020 09:56:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B471B5D9E2;
	Tue, 28 Apr 2020 09:56:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 413B94CAA0;
	Tue, 28 Apr 2020 09:56:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03S9uHcV025195 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 05:56:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A810B2026FFE; Tue, 28 Apr 2020 09:56:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A418B2026D69
	for <cluster-devel@redhat.com>; Tue, 28 Apr 2020 09:56:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34D071859160
	for <cluster-devel@redhat.com>; Tue, 28 Apr 2020 09:56:15 +0000 (UTC)
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
	[209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-490-uTjjZxL1NhWmbREBMQpL5Q-1; Tue, 28 Apr 2020 05:56:13 -0400
X-MC-Unique: uTjjZxL1NhWmbREBMQpL5Q-1
Received: by mail-oo1-f71.google.com with SMTP id q7so19065830oom.8
	for <cluster-devel@redhat.com>; Tue, 28 Apr 2020 02:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G/W9aZ+NrlbasjS1nCPVX9FlfhgpXwkP8D2tIF11REs=;
	b=CefWBWA+9MVESHqGoADB9VJUM1/APNnEYNlWk17LIBNvTdU/p9X9UKvrH/zX7XCav0
	aJxsyvhGd9Xd8s6+tFUz4+5IEL5wel0Fmdl4Iga6FS6oaVCe3A5Jv0KWWCVlWj4aHh8B
	NsKaGrecqZL4ytue1ssbLMw+rngc1/uHa1X894P1wwoGkQSdx0LAJyAe8fpEnx+eyivd
	3rUnQIkmaLtJEyoHkJedPnIr5gJQE8Jk855oBE5tAo5l6D5cT76iF1By6IFNhTHQuWlv
	Qjb5lsPHPEQcaNvyv9UBIN1sG0GU/S5Fs8V/5rEUS9hgq9QxqhnGK+CI5hlU9YbuyzsD
	XH+g==
X-Gm-Message-State: AGi0PuYOAjUWZPtcyRnUlKWmFWjotsK/r4WV56QZZJZlPI2g4VLEja9L
	FBzvNWobG54TKkIK6tOgkeTSVX8Cjc5ISIi4w64ZTfAiiImv6fC73BkWK2YQdYFsfOhSF3ByYE4
	Kx4q7g9P43fA2MzIoZjuDWULfqmAGxtFwPg9u5Q==
X-Received: by 2002:a05:6830:1da1:: with SMTP id
	z1mr21876593oti.58.1588067772161; 
	Tue, 28 Apr 2020 02:56:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ2WfSLY+cPebgDYSk5t7c4BeA88b88ywtduzupD2vPxfItD+aL07MPiY980Fzsw+i0tHeg8+TXgc4/c659yZg=
X-Received: by 2002:a05:6830:1da1:: with SMTP id
	z1mr21876580oti.58.1588067771926; 
	Tue, 28 Apr 2020 02:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <1588044545-59405-1-git-send-email-wubo40@huawei.com>
In-Reply-To: <1588044545-59405-1-git-send-email-wubo40@huawei.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 28 Apr 2020 11:56:00 +0200
Message-ID: <CAHc6FU5PHELD9N4tdfn663ao1RqyiByGLb8JOfEJGJdyNUwpQw@mail.gmail.com>
To: Wu Bo <wubo40@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03S9uHcV025195
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, linfeilong@huawei.com,
	LKML <linux-kernel@vger.kernel.org>, liuzhiqiang26@huawei.com
Subject: Re: [Cluster-devel] [PATCH] fs/gfs2:lock a spinlock always before
	returning from do_xmote()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 28, 2020 at 5:30 AM Wu Bo <wubo40@huawei.com> wrote:
> The call stack is as follows:
> finish_xmote()
>         ...
>         spin_lock(&gl->gl_lockref.lock);
>         ...
>         --> do_xmote()
>             spin_unlock(&gl->gl_lockref.lock);
>             ...
>             return;
>         ...
>         spin_unlock(&gl->gl_lockref.lock);
>
> do_xmote function needs to be locked before returning,
> Otherwise, there will be a double release lock in finish_xmote() function=
.
>
> Signed-off-by: Wu Bo <wubo40@huawei.com>
> ---
>  fs/gfs2/glock.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index 29f9b66..7129d10 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -613,6 +613,7 @@ static void do_xmote(struct gfs2_glock *gl, struct gf=
s2_holder *gh, unsigned int
>                                 fs_err(sdp, "Error %d syncing glock \n", =
ret);
>                                 gfs2_dump_glock(NULL, gl, true);
>                         }
> +                       spin_lock(&gl->gl_lockref.lock);
>                         return;
>                 }
>         }
> --
> 1.8.3.1

this patch looks correct. We've independently discovered this bug as
well in the meantime, and we'll send the fix upstream.

Thanks,
Andreas


