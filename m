Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D1D10324
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 01:11:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02E8181F13;
	Tue, 30 Apr 2019 23:11:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 690666E714;
	Tue, 30 Apr 2019 23:11:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA7A918089CB;
	Tue, 30 Apr 2019 23:11:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UNBUFM023956 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:11:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 43F9A18979; Tue, 30 Apr 2019 23:11:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D22878DD8
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:11:28 +0000 (UTC)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
	[209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F22EA81DF0
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:11:27 +0000 (UTC)
Received: by mail-ot1-f71.google.com with SMTP id d11so4615749otp.22
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 16:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rW0Vz0Y1MQG2AweYB9spfOD/vhLC5S6sSKzbT3NCXxs=;
	b=q1o1CeFYf0w8JXN/ar1gqdmiH88xadLnP7OF6d7nc1Qhp5KYKdDS69tNRKK/NOgkht
	NpdawH1dQHexpx7YcmoTzneFiwkCqJw6IWpfDkCRA8LRQciQsH7OV/VUdcOLNkkOmG9I
	sPKb+ZfLJSU3K1Cb2YaHiPQM1VciTDENlYCpmdANXv9UyYhcJ090fOqunOhRXBH6ha8T
	z+Umzc8FZkLXXgKR5hWvP7qGhZZDFNT8RS3GwwzovULqip3PsZbNkgh5yEeiP1co8HiC
	ij6OHu//cFyrpXC0+6V9SZPmjtlnNlR7Oe152nzvi4Bj8WyDam93L6pIOgL5wPLBPFHV
	LPvA==
X-Gm-Message-State: APjAAAVzR7BLRHw3RTTFvGuqxG/QzymTihn9a3rc4rAgBwi53HZhqcvp
	eRpVrPRaZSzxyS3iWUBLp9j0eBAbVqPlTt4xCiAaEAKAHaRs9Ky4PlDdsQCG1Xiejf5h68XQ6CW
	l0C0PpaD+wOX008ZvRNSCOcJK+EOTPFOjxAJa0w==
X-Received: by 2002:aca:dc06:: with SMTP id t6mr4733081oig.178.1556665887249; 
	Tue, 30 Apr 2019 16:11:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkocfmAKPbM22FQY686Miqjnabmv6nHsqULxczbOqVe97CSNIePyJh7wiEmTOuWbuz2xWVBOsL7Cd2AevODbE=
X-Received: by 2002:aca:dc06:: with SMTP id t6mr4733067oig.178.1556665887074; 
	Tue, 30 Apr 2019 16:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190430215347.19152-1-adas@redhat.com>
In-Reply-To: <20190430215347.19152-1-adas@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 1 May 2019 01:11:15 +0200
Message-ID: <CAHc6FU5rD08t5dDRxeaaV2DhD2i_08osv9iz4yGmTryrDw_NAg@mail.gmail.com>
To: Abhi Das <adas@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH v2] gfs2: fix race between
 gfs2_freeze_func and unmount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 30 Apr 2019 23:11:34 +0000 (UTC)

On Tue, 30 Apr 2019 at 23:54, Abhi Das <adas@redhat.com> wrote:
> As part of the freeze operation, gfs2_freeze_func() is left blocking
> on a request to hold the sd_freeze_gl in SH. This glock is held in EX
> by the gfs2_freeze() code.
>
> A subsequent call to gfs2_unfreeze() releases the EXclusively held
> sd_freeze_gl, which allows gfs2_freeze_func() to acquire it in SH and
> resume its operation.
>
> gfs2_unfreeze(), however, doesn't wait for gfs2_freeze_func() to complete.
> If a umount is issued right after unfreeze, it could result in an
> inconsistent filesystem because some journal data (statfs update) isn't
> written out.
>
> Refer to commit 24972557b12c for a more detailed explanation of how
> freeze/unfreeze work.
>
> This patch causes gfs2_unfreeze() to wait for gfs2_freeze_func() to
> complete before returning to the user.
>
> Signed-off-by: Abhi Das <adas@redhat.com>

Thanks, pushed to for-next.

Andreas

> ---
>  fs/gfs2/incore.h | 1 +
>  fs/gfs2/super.c  | 8 +++++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index 78c8e761b321..b15755068593 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -621,6 +621,7 @@ enum {
>         SDF_SKIP_DLM_UNLOCK     = 8,
>         SDF_FORCE_AIL_FLUSH     = 9,
>         SDF_AIL1_IO_ERROR       = 10,
> +       SDF_FS_FROZEN           = 11,
>  };
>
>  enum gfs2_freeze_state {
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index a6a325b2a78b..ceec631efa49 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -973,8 +973,7 @@ void gfs2_freeze_func(struct work_struct *work)
>         if (error) {
>                 printk(KERN_INFO "GFS2: couldn't get freeze lock : %d\n", error);
>                 gfs2_assert_withdraw(sdp, 0);
> -       }
> -       else {
> +       } else {
>                 atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
>                 error = thaw_super(sb);
>                 if (error) {
> @@ -987,6 +986,8 @@ void gfs2_freeze_func(struct work_struct *work)
>                 gfs2_glock_dq_uninit(&freeze_gh);
>         }
>         deactivate_super(sb);
> +       clear_bit_unlock(SDF_FS_FROZEN, &sdp->sd_flags);
> +       wake_up_bit(&sdp->sd_flags, SDF_FS_FROZEN);
>         return;
>  }
>
> @@ -1029,6 +1030,7 @@ static int gfs2_freeze(struct super_block *sb)
>                 msleep(1000);
>         }
>         error = 0;
> +       set_bit(SDF_FS_FROZEN, &sdp->sd_flags);
>  out:
>         mutex_unlock(&sdp->sd_freeze_mutex);
>         return error;
> @@ -1053,7 +1055,7 @@ static int gfs2_unfreeze(struct super_block *sb)
>
>         gfs2_glock_dq_uninit(&sdp->sd_freeze_gh);
>         mutex_unlock(&sdp->sd_freeze_mutex);
> -       return 0;
> +       return wait_on_bit(&sdp->sd_flags, SDF_FS_FROZEN, TASK_INTERRUPTIBLE);
>  }
>
>  /**
> --
> 2.20.1
>

