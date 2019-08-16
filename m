Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AEC906EA
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Aug 2019 19:32:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D16F300CB70;
	Fri, 16 Aug 2019 17:32:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C4B98F6DA;
	Fri, 16 Aug 2019 17:32:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CDB1180B536;
	Fri, 16 Aug 2019 17:32:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GHW16o004721 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 13:32:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E4B9D87C9; Fri, 16 Aug 2019 17:32:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF9CE12A41
	for <cluster-devel@redhat.com>; Fri, 16 Aug 2019 17:31:59 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
	[209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53FC211A0E
	for <cluster-devel@redhat.com>; Fri, 16 Aug 2019 17:31:59 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id c18so2958016oig.22
	for <cluster-devel@redhat.com>; Fri, 16 Aug 2019 10:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+aWrb6bkEyRJ9ljqtUOtJ0J5JLJy+MWVMX/WZQyVm9g=;
	b=R8sw/V0hIyrYZlNsn7FrNQL3kQx7JvQCq9Z/fcAM1yZqn7OcQT9Z1RW7qDWBgrwhYS
	imQX8qdZlDHz3YbIrQ9r+ljWFPDctmPntlrOYXnlt09mvLLYtrSozMV7yoKaSkVjUSmS
	GfyMvz+FnxPNvnMkUZm+ZgSz0UrQ4Q/BAD5HhaA0aUQY6YUHw4DozlmTSJOfZ6o19J0q
	p9fFYcuNuUiVKsPUUv7x1U0Pj5djhcTuU6huG5kYnRQTAi4FmC8X/OoUY/VXXkmHgLZy
	fRs8g0Re0YajlDCWlAZQFZWkSbQ4ekMhNZe4xPdQayL7zA69+1TRhgrp3YrUuIGhsOFX
	owpA==
X-Gm-Message-State: APjAAAWxSLg//YPakS21fEwTbKgLeFSYl9FaMxVPn1jmqFcGyTWGVB/f
	tjt2Z/fOZbg65L8988XPyXJwrJYdVXoFwzH6H15YSKhlJ7wr3is8X6V2F7HIPuYDv5L4DTAvUe3
	92Z5NsreXqwi1yqdLoGdGLgkepVBy9B2nzFA4Qw==
X-Received: by 2002:a05:6830:1059:: with SMTP id
	b25mr7653750otp.95.1565976718615; 
	Fri, 16 Aug 2019 10:31:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycU9L1CyczxoX8AM684B7eb5/zv26MRRPFQPy46rYv/5hpKCXEkTvf6oVtJZxFalBczLDjZVwglqRSaUR1Lak=
X-Received: by 2002:a05:6830:1059:: with SMTP id
	b25mr7653740otp.95.1565976718425; 
	Fri, 16 Aug 2019 10:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190814204259.120942-1-arnd@arndb.de>
	<20190814204259.120942-4-arnd@arndb.de>
In-Reply-To: <20190814204259.120942-4-arnd@arndb.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 16 Aug 2019 19:31:47 +0200
Message-ID: <CAHc6FU5n9rBZuH=chOdmGCwyrX-B-Euq8oFrnu3UHHKSm5A5gQ@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <darrick.wong@oracle.com>,
	LKML <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>,
	cluster-devel <cluster-devel@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH v5 03/18] gfs2: add compat_ioctl support
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 16 Aug 2019 17:32:09 +0000 (UTC)

Arnd,

On Wed, Aug 14, 2019 at 10:45 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Out of the four ioctl commands supported on gfs2, only FITRIM
> works in compat mode.
>
> Add a proper handler based on the ext4 implementation.
>
> Fixes: 6ddc5c3ddf25 ("gfs2: getlabel support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  fs/gfs2/file.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index 52fa1ef8400b..49287f0b96d0 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -6,6 +6,7 @@
>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/compat.h>
>  #include <linux/completion.h>
>  #include <linux/buffer_head.h>
>  #include <linux/pagemap.h>
> @@ -354,6 +355,25 @@ static long gfs2_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>         return -ENOTTY;
>  }
>
> +#ifdef CONFIG_COMPAT
> +static long gfs2_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> +{
> +       /* These are just misnamed, they actually get/put from/to user an int */
> +       switch(cmd) {
> +       case FS_IOC32_GETFLAGS:
> +               cmd = FS_IOC_GETFLAGS;
> +               break;
> +       case FS_IOC32_SETFLAGS:
> +               cmd = FS_IOC_SETFLAGS;
> +               break;

I'd like the code to be more explicit here:

        case FITRIM:
        case FS_IOC_GETFSLABEL:
              break;
        default:
              return -ENOIOCTLCMD;

> +       }
> +
> +       return gfs2_ioctl(filp, cmd, (unsigned long)compat_ptr(arg));
> +}
> +#else
> +#define gfs2_compat_ioctl NULL
> +#endif
> +
>  /**
>   * gfs2_size_hint - Give a hint to the size of a write request
>   * @filep: The struct file
> @@ -1294,6 +1314,7 @@ const struct file_operations gfs2_file_fops = {
>         .write_iter     = gfs2_file_write_iter,
>         .iopoll         = iomap_dio_iopoll,
>         .unlocked_ioctl = gfs2_ioctl,
> +       .compat_ioctl   = gfs2_compat_ioctl,
>         .mmap           = gfs2_mmap,
>         .open           = gfs2_open,
>         .release        = gfs2_release,
> @@ -1309,6 +1330,7 @@ const struct file_operations gfs2_file_fops = {
>  const struct file_operations gfs2_dir_fops = {
>         .iterate_shared = gfs2_readdir,
>         .unlocked_ioctl = gfs2_ioctl,
> +       .compat_ioctl   = gfs2_compat_ioctl,
>         .open           = gfs2_open,
>         .release        = gfs2_release,
>         .fsync          = gfs2_fsync,
> @@ -1325,6 +1347,7 @@ const struct file_operations gfs2_file_fops_nolock = {
>         .write_iter     = gfs2_file_write_iter,
>         .iopoll         = iomap_dio_iopoll,
>         .unlocked_ioctl = gfs2_ioctl,
> +       .compat_ioctl   = gfs2_compat_ioctl,
>         .mmap           = gfs2_mmap,
>         .open           = gfs2_open,
>         .release        = gfs2_release,
> @@ -1338,6 +1361,7 @@ const struct file_operations gfs2_file_fops_nolock = {
>  const struct file_operations gfs2_dir_fops_nolock = {
>         .iterate_shared = gfs2_readdir,
>         .unlocked_ioctl = gfs2_ioctl,
> +       .compat_ioctl   = gfs2_compat_ioctl,
>         .open           = gfs2_open,
>         .release        = gfs2_release,
>         .fsync          = gfs2_fsync,
> --
> 2.20.0
>

Should we feed this through the gfs2 tree?

Thanks,
Andreas

