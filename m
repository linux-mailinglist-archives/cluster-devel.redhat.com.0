Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 310EA33BBE0
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Mar 2021 15:33:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615818780;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=k8bBVsB/YdRijXonGjfj4dKerPZ5Z5xT2w/hZeKRBEI=;
	b=cBqqXzdmxw7Hfpn5uR5MmuWZGB3DDfKF0psGZ1X1iWk13oDGbTW/ICoaO5f9/mwV6Y9Sbh
	t+sKKc4flECCAvav8rSLaiJSUunu2G9lLtOxlnMr8Hgr/o0faacdrEJ+A9QTPwq8Rg7pIR
	+GDtx2/JMPyLwQcuVKoc1BsLU3+0c+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-DOg2jEg8OKeks6NYnqCosQ-1; Mon, 15 Mar 2021 10:32:57 -0400
X-MC-Unique: DOg2jEg8OKeks6NYnqCosQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07055640A0;
	Mon, 15 Mar 2021 14:32:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDCB019701;
	Mon, 15 Mar 2021 14:32:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4362818155DE;
	Mon, 15 Mar 2021 14:32:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12FEWjsj013256 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 15 Mar 2021 10:32:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B2572026D07; Mon, 15 Mar 2021 14:32:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45A3A2026D6A
	for <cluster-devel@redhat.com>; Mon, 15 Mar 2021 14:32:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A1D884853B
	for <cluster-devel@redhat.com>; Mon, 15 Mar 2021 14:32:42 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-493-nMusHk0VNM-80nr4vLtAXw-1; Mon, 15 Mar 2021 10:32:37 -0400
X-MC-Unique: nMusHk0VNM-80nr4vLtAXw-1
Received: by mail-wm1-f69.google.com with SMTP id a3so2911018wmm.0
	for <cluster-devel@redhat.com>; Mon, 15 Mar 2021 07:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k8bBVsB/YdRijXonGjfj4dKerPZ5Z5xT2w/hZeKRBEI=;
	b=oTasgmPw2NJMSP/uIcOplBDmksAr2kewgDSfY0eE943pJQrNNwzawqJqCFrDBNhMyV
	1xc1N9xMCk6FmenBgo2zyNCUMPAeppXcFe2CQfdzqzQBZYReD1T9IwV420HdwRepH8wm
	6t079tGUsAVObf5Pd7620yaJiQjNOSNeQUXYJreQhyVFBM6mm5v5razxjoYAIKI6YY8L
	ZFMkIxAVe/nClhAFa1pg+F/U6Xxqrb6QYdy3owG5UJMTHi04WkomZkfLE2aEup2sx/Q1
	pl/M+E3f0tsjzBMAgkyBVUw5kSQzDyellS3ElKNirzMcOi24bk9uxPtwUXO1cuNTXdIT
	w2Jw==
X-Gm-Message-State: AOAM533ulcODcFY5V0PpwvFZHn+CrMvbcdflkKpaEyDlkwsZEdvld/bL
	B4DdARdPQ+EXgmcJl9yvjFPMfeR0DxOSvjnZj0Ia/0DP18v7Pdpek84WoAwMU1ED3V50yHkwXdu
	FiF/cvUdIfeZLH9kHy6Z88D0YiUjv18oriakcxw==
X-Received: by 2002:a05:600c:364c:: with SMTP id
	y12mr15351wmq.96.1615818756386; 
	Mon, 15 Mar 2021 07:32:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4zrY7dXNaT2xLwg2+OnwqYXjLMhTgHcGfWM9uTMbIeokhdvxef2gg6Z1kexBlmcrZyz10Q7hGRe5yu8xm17Y=
X-Received: by 2002:a05:600c:364c:: with SMTP id
	y12mr15343wmq.96.1615818756202; 
	Mon, 15 Mar 2021 07:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210315122400.1636159-1-anprice@redhat.com>
In-Reply-To: <20210315122400.1636159-1-anprice@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 15 Mar 2021 15:32:25 +0100
Message-ID: <CAHc6FU5X3=7YF65Tspn2zrpMzzTmz_NknsQfZYUPYRWiQADm_Q@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Flag a withdraw if init_threads()
	fails
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 15, 2021 at 1:24 PM Andrew Price <anprice@redhat.com> wrote:
> Interrupting mount with ^C quickly enough can cause the kthread_run()
> calls in gfs2's init_threads() to fail and the error path leads to a
> deadlock on the s_umount rwsem. The abridged chain of events is:
>
>   [mount path]
>   get_tree_bdev()
>     sget_fc()
>       alloc_super()
>         down_write_nested(&s->s_umount, SINGLE_DEPTH_NESTING); [acquired]
>     gfs2_fill_super()
>       gfs2_make_fs_rw()
>         init_threads()
>           kthread_run()
>             ( Interrupted )
>       [Error path]
>       gfs2_gl_hash_clear()
>         flush_workqueue(glock_workqueue)
>           wait_for_completion()
>
>   [workqueue context]
>   glock_work_func()
>     run_queue()
>       do_xmote()
>         freeze_go_sync()
>           freeze_super()
>             down_write(&sb->s_umount) [deadlock]
>
> In freeze_go_sync() there is a gfs2_withdrawn() check that we can use to
> make sure freeze_super() is not called in the error path, so add a
> gfs2_withdraw_delayed() call when init_threads() fails.
>
> Ref: https://bugzilla.kernel.org/show_bug.cgi?id=212231
>
> Reported-by: Alexander Aring <aahringo@redhat.com>
> Signed-off-by: Andrew Price <anprice@redhat.com>
> ---
>  fs/gfs2/super.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 97076d3f562f..9e91c9d92bd6 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -162,8 +162,10 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
>         int error;
>
>         error = init_threads(sdp);
> -       if (error)
> +       if (error) {
> +               gfs2_withdraw_delayed(sdp);

Hmm, marking the filesystem as withdrawing before we've even started
looks a bit odd, but given that we're already checking for withdrawing
/ withdrawn filesystems all over the place, it should be okay. I'll
push this to for-next.

>                 return error;
> +       }
>
>         j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
>         if (gfs2_withdrawn(sdp)) {
> --
> 2.29.2

Thanks,
Andreas

