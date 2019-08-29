Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D391A1957
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Aug 2019 13:49:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1EE933082E66;
	Thu, 29 Aug 2019 11:49:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67A0B5D9D3;
	Thu, 29 Aug 2019 11:49:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C35A2551B;
	Thu, 29 Aug 2019 11:49:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7TBniHk006073 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 29 Aug 2019 07:49:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE5AB5D71C; Thu, 29 Aug 2019 11:49:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7FC25D712;
	Thu, 29 Aug 2019 11:49:42 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A018DC0021D3;
	Thu, 29 Aug 2019 11:49:41 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id p12so6291434iog.5;
	Thu, 29 Aug 2019 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ebi6DvryipDbJMt7Vs5Y6UzNPCCfjozPAm+m3gRZ1cY=;
	b=HnQVcABTef4wmDs+EEBqAROiuUJ/fDy5haGSBWNMqg0NyQEcuu3kMeOtyJK3LLYX87
	97PGFzvGKf5em+PrI8Q4mUkHKPD3A6Wps0Wb6HJM5OpKbp8tlsekl5obLa6vti/pUQv8
	k4rwFFOJcg5+v/GQUbRaOXaQcTwfidXLu8zkeLfERuauyWsazilRoiBkD1RrercIaaU+
	IsgvbSbifqYV70hFWGZP7QXrGk3GBSTON+oM6ft4TQM63fOm7IYqOL6X3iSGQ9oCHdE7
	JAuoLdWYFiS4VQgFsP2lDQbZza3261q60moRPMIsTdBCAW6LRqrvYOB0mC683lLWiiNu
	ZTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ebi6DvryipDbJMt7Vs5Y6UzNPCCfjozPAm+m3gRZ1cY=;
	b=fsfl/5MuYNSlNtYNDPTIi2+xGe310DksImlctIyOAhsjx/avd8vKRnQDigDZUUvzIT
	k0uBBmAbWfhwwgNvTU+wlhJIEyp1tLkaMBuT6F61hcsiEkzJkK6M7WFXHuFWSVkPyGuo
	4s8mY8N4IXyOS9mGopTfP0Xb7RGQUi/N0FAvlnKKzjkRXlawfxQeAOsyb5fy2FMYPRx5
	1UIVIxjnj64XJBh6t/gGAsMAKTCgAC3BOrijZjf9/Rc6cnWEeiYY0s4IiYPDyWFRTWrj
	jVeq6z65hIUtuY5U6TaGzxa7LKmj6Pc6Kx3GU3IwYHwwTu5V27nOVCIUSLBzenBleXWi
	CEMg==
X-Gm-Message-State: APjAAAXpQKqoy9q6gnCu/rgtETD4qZxxKerDfJrKmuPgp7+aFvphREsX
	w23AdOmDiLD3Ll/Qb4r3lypspB+rrz75KsXm+Wc=
X-Google-Smtp-Source: APXvYqwENsRASBmSEOl6YE44hcCuRaYScqwow/qESu/tkVMsG2dt16pzNKaq9E5EKUIWbFl1OAlxQl2yEGWsVIScfz8=
X-Received: by 2002:a6b:7002:: with SMTP id l2mr2304538ioc.300.1567079380885; 
	Thu, 29 Aug 2019 04:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20181202180832.GR8125@magnolia> <20181202181045.GS8125@magnolia>
	<CAHpGcM+WQYFHOOC8SzKq+=DuHVZ4fw4RHLTMUDN-o6GX3YtGvQ@mail.gmail.com>
	<20190828142332.GT1037422@magnolia>
	<CAHpGcMLGWVssWAC1PqBJevr1+1rE_hj4QN27D26j7-Fp_Kzpsg@mail.gmail.com>
	<20190829031216.GW1037422@magnolia>
In-Reply-To: <20190829031216.GW1037422@magnolia>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Thu, 29 Aug 2019 13:49:29 +0200
Message-ID: <CAHpGcM+Aq+BxD0_TPx9sqTCt8N6X3Q+UO6CkyfV3NZMaN8AU8w@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 29 Aug 2019 11:49:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Thu, 29 Aug 2019 11:49:41 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'andreas.gruenbacher@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <andreas.gruenbacher@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: jencce.kernel@gmail.com, Zorro Lang <zlang@redhat.com>,
	Dave Chinner <david@fromorbit.com>,
	overlayfs <linux-unionfs@vger.kernel.org>,
	fstests <fstests@vger.kernel.org>, linux-xfs <linux-xfs@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Amir Goldstein <amir73il@gmail.com>
Subject: Re: [Cluster-devel] [PATCH v2 2/2] iomap: partially revert
 4721a601099 (simulated directio short read on EFAULT)
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 29 Aug 2019 11:49:53 +0000 (UTC)

Hi Darrick,

Am Do., 29. Aug. 2019 um 05:12 Uhr schrieb Darrick J. Wong
<darrick.wong@oracle.com>:
> Hm, so I made an xfstest out of the program you sent me, and indeed
> reverting that chunk makes the failure go away, but that got me
> wondering -- that iomap kludge was a workaround for the splice code
> telling iomap to try to stuff XXXX bytes into a pipe that only has X
> bytes of free buffer space.  We fixed splice_direct_to_actor to clamp
> the length parameter to the available pipe space, but we never did the
> same to do_splice:
>
>         /* Don't try to read more the pipe has space for. */
>         read_len = min_t(size_t, len,
>                          (pipe->buffers - pipe->nrbufs) << PAGE_SHIFT);
>         ret = do_splice_to(in, &pos, pipe, read_len, flags);
>
> Applying similar logic to the two (opipe != NULL) cases of do_splice()
> seem to make the EAGAIN problem go away too.  So why don't we teach
> do_splice to only ask for as many bytes as the pipe has space here too?
>
> Does the following patch fix it for you?

Yes, that works, thank you.

> From: Darrick J. Wong <darrick.wong@oracle.com>
> Subject: [PATCH] splice: only read in as much information as there is pipe buffer space
>
> Andreas Gruenbacher reports that on the two filesystems that support
> iomap directio, it's possible for splice() to return -EAGAIN (instead of
> a short splice) if the pipe being written to has less space available in
> its pipe buffers than the length supplied by the calling process.
>
> Months ago we fixed splice_direct_to_actor to clamp the length of the
> read request to the size of the splice pipe.  Do the same to do_splice.

Can you add a reference to that commit here (17614445576b6)?

> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> ---
>  fs/splice.c |   12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/fs/splice.c b/fs/splice.c
> index 98412721f056..50335515d7c1 100644
> --- a/fs/splice.c
> +++ b/fs/splice.c
> @@ -1101,6 +1101,7 @@ static long do_splice(struct file *in, loff_t __user *off_in,
>         struct pipe_inode_info *ipipe;
>         struct pipe_inode_info *opipe;
>         loff_t offset;
> +       unsigned int pipe_pages;
>         long ret;
>
>         ipipe = get_pipe_info(in);
> @@ -1123,6 +1124,10 @@ static long do_splice(struct file *in, loff_t __user *off_in,
>                 if ((in->f_flags | out->f_flags) & O_NONBLOCK)
>                         flags |= SPLICE_F_NONBLOCK;
>
> +               /* Don't try to read more the pipe has space for. */
> +               pipe_pages = opipe->buffers - opipe->nrbufs;
> +               len = min_t(size_t, len, pipe_pages << PAGE_SHIFT);

This should probably be min(len, (size_t)pipe_pages << PAGE_SHIFT).
Same for the second min_t here and the one added by commit
17614445576b6.

> +
>                 return splice_pipe_to_pipe(ipipe, opipe, len, flags);
>         }
>
> @@ -1180,8 +1185,13 @@ static long do_splice(struct file *in, loff_t __user *off_in,
>
>                 pipe_lock(opipe);
>                 ret = wait_for_space(opipe, flags);
> -               if (!ret)
> +               if (!ret) {
> +                       /* Don't try to read more the pipe has space for. */
> +                       pipe_pages = opipe->buffers - opipe->nrbufs;
> +                       len = min_t(size_t, len, pipe_pages << PAGE_SHIFT);
> +
>                         ret = do_splice_to(in, &offset, opipe, len, flags);
> +               }
>                 pipe_unlock(opipe);
>                 if (ret > 0)
>                         wakeup_pipe_readers(opipe);

Thanks,
Andreas

