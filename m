Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B277C3F626E
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Aug 2021 18:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629821473;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1TFWwa9TBe2ERx/BnkvQy3GkJJM6YmMqz8FB95ekfmI=;
	b=D9yYjgtRES8iAqzcr7ktda119Yma1F+4t3bDWYs2MXlA7sPBlRn35xEo53lgZkeR1kxhST
	GpMkEUrt9G3HtrDMji7lxkuaxlTbUzF+09DutWNgWSDg+D+aY1Ld0ziToUMVMWXHtjV7yN
	qdTnpscSOjBsvbazpz0WIj3PfUGZB9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-smaoX2R-MVCuOAw6HdQeHw-1; Tue, 24 Aug 2021 12:11:12 -0400
X-MC-Unique: smaoX2R-MVCuOAw6HdQeHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1D6BCC623;
	Tue, 24 Aug 2021 16:11:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA53068D95;
	Tue, 24 Aug 2021 16:11:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5B794BB7C;
	Tue, 24 Aug 2021 16:11:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OGB091013942 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 12:11:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AB754101461F; Tue, 24 Aug 2021 16:11:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E30B11457EA
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 16:10:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C104980B727
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 16:10:40 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-470-2D-QvgcoMYmsAR40qlD5yw-1; Tue, 24 Aug 2021 12:10:39 -0400
X-MC-Unique: 2D-QvgcoMYmsAR40qlD5yw-1
Received: by mail-wr1-f69.google.com with SMTP id
	t15-20020a5d42cf000000b001565f9c9ee8so5904245wrr.2
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 09:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1TFWwa9TBe2ERx/BnkvQy3GkJJM6YmMqz8FB95ekfmI=;
	b=tXfc0+2yWpfpA7vKjkP8l7bB6YN/puU4O7D3m0kN91HDznUvN2aeJ7i5kCFl9cCryU
	dScJwNKiMS/449lCoWQu6WFPrqBI5vZJTg6C9WA4Hgc5n+cW/fpQLT2W2rhXxxbjUDjk
	YFC7t8O3a/QHAKbi4YrFiZQMtfhMiYKFn8QZkSLQl9yGNU+k5ISX6XRSO0zAnXBsRV6H
	GTgnXYSdvtDGgGFex2//A3n73gJ2o3ld4Ddgw+82+OVBMu0pmmBNc705advl4gq+3xxc
	QuHiHE7uS4Ty57Ob9MFUvbQDZ8J3e812JpgYhq4cyBu2tyF3B9L7m6W5CiJbgke3RRHL
	phxw==
X-Gm-Message-State: AOAM531xKS6NEeg/tBQWaITdWxAJh7j//tAZ06oEoyuv+WpN6zXC2Tbv
	VY+euF1AXX1Tptmu1+xTEWR88KnkLrHIuwRHesHs0h39Xphc0shE+fl6xN1YfBDFCm2ypWtNBpy
	12kTkEKVYFoMF7QAwp08QRngTHxtqT2czJ/mQ5Q==
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr19812365wrq.377.1629821437841; 
	Tue, 24 Aug 2021 09:10:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX5sZ8zatLSajyRveXWQzpyywNhF6s36ppCNPZ+z+2KZh0NTsN1aiWS59WaScqs3SuwUsxc28xYhN1fCoWNB4=
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr19812285wrq.377.1629821437075; 
	Tue, 24 Aug 2021 09:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210824140241.149386-1-rpeterso@redhat.com>
	<20210824140241.149386-3-rpeterso@redhat.com>
In-Reply-To: <20210824140241.149386-3-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 24 Aug 2021 18:10:25 +0200
Message-ID: <CAHc6FU73gu-uNj7UZC0n7Di36DAFZx4PzmwRORaJNqRXdQxC6g@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 2/3] gfs2: Fix broken
	freeze_go_xmote_bh
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

On Tue, Aug 24, 2021 at 4:02 PM Bob Peterson <rpeterso@redhat.com> wrote:
> The freeze glock was used in several places whenever a gfs2 file system
> was frozen, thawed, mounted, unmounted, remounted, or withdrawn. It was
> used to prevent those things from clashing with one another.

> Function freeze_go_xmote_bh only checked if the journal was clean in
> cases where the journal was LIVE. That's wrong because if the journal is
> really live, it's a moving target and almost guaranteed to be dirty.
> If the journal was not live, the check for a clean journal was skipped.
> That's also wrong because sometimes the journal would be LIVE and
> sometimes not: It was LIVE when gfs2_reconfigure locks the freeze lock
> for "remount -o remount,ro." It was not LIVE when gfs2_fill_super called
> gfs2_freeze_lock before gfs2_make_fs_rw sets the LIVE bit.

This is confusing to a point where it's useless as documentation.
Could you please better explain what's going on?

> The problem was never noticed because gfs2_make_fs_rw had redundant code
> for the exact same checks as freeze_go_xmote_bh.
>
> This patch attempts to clean up the mess by removing the redundant code
> from gfs2_make_fs_rw and changing the callers of gfs2_freeze_lock to
> specify whether they need the journal checked for consistency:
> If the journal consistency check is unwanted, they specify GL_SKIP in
> the holder. If the check is required, they do not specify GL_SKIP.
> Most callers determine if the consistency check is needed based on if
> the journal is being transitioned from "not live" to "live": If it is
> becoming live, the check is needed, otherwise it is not.

The patch itself looks good at first sight.

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/glops.c      | 31 ++++++++++++++++++++-----------
>  fs/gfs2/ops_fstype.c |  5 +++--
>  fs/gfs2/recovery.c   |  3 ++-
>  fs/gfs2/super.c      | 34 ++++++++++++----------------------
>  4 files changed, 37 insertions(+), 36 deletions(-)
>
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 6d0770564493..8ae2f33e014e 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -609,18 +609,27 @@ static int freeze_go_xmote_bh(struct gfs2_holder *gh)
>         struct gfs2_log_header_host head;
>         int error;
>
> -       if (test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags)) {
> -               j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
> +       if (gh->gh_flags & GL_SKIP)
> +               return 0;
>
> -               error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
> -               if (gfs2_assert_withdraw_delayed(sdp, !error))
> -                       return error;
> -               if (gfs2_assert_withdraw_delayed(sdp, head.lh_flags &
> -                                                GFS2_LOG_HEAD_UNMOUNT))
> -                       return -EIO;
> -               sdp->sd_log_sequence = head.lh_sequence + 1;
> -               gfs2_log_pointers_init(sdp, head.lh_blkno);
> -       }
> +       /*
> +        * If our journal is truly live, rw, it is guaranteed to be dirty.
> +        * If our journal is ro, and we are soon to make it live, we need to
> +        * check whether it was cleanly unmounted. If not, we withdraw.
> +        */
> +       if (gfs2_assert_withdraw_delayed(sdp,
> +                                !test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags)))
> +               return -EIO;
> +       j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
> +
> +       error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
> +       if (gfs2_assert_withdraw_delayed(sdp, !error))
> +               return error;
> +       if (gfs2_assert_withdraw_delayed(sdp, head.lh_flags &
> +                                        GFS2_LOG_HEAD_UNMOUNT))
> +               return -EIO;
> +       sdp->sd_log_sequence = head.lh_sequence + 1;
> +       gfs2_log_pointers_init(sdp, head.lh_blkno);
>         return 0;
>  }
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 7f8410d8fdc1..6f4be312bd34 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -1263,7 +1263,7 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
>                 }
>         }
>
> -       error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
> +       error = gfs2_freeze_lock(sdp, &freeze_gh, sb_rdonly(sb) ? GL_SKIP : 0);
>         if (error)
>                 goto fail_per_node;
>
> @@ -1584,7 +1584,8 @@ static int gfs2_reconfigure(struct fs_context *fc)
>         if ((sb->s_flags ^ fc->sb_flags) & SB_RDONLY) {
>                 struct gfs2_holder freeze_gh;
>
> -               error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
> +               error = gfs2_freeze_lock(sdp, &freeze_gh,
> +                                fc->sb_flags & SB_RDONLY ? GL_SKIP : 0);
>                 if (error)
>                         return -EINVAL;
>
> diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> index 016ed1b2ca1d..be0037da3bb4 100644
> --- a/fs/gfs2/recovery.c
> +++ b/fs/gfs2/recovery.c
> @@ -472,7 +472,8 @@ void gfs2_recover_func(struct work_struct *work)
>
>                 /* Acquire a shared hold on the freeze lock */
>
> -               error = gfs2_freeze_lock(sdp, &thaw_gh, LM_FLAG_PRIORITY);
> +               error = gfs2_freeze_lock(sdp, &thaw_gh, LM_FLAG_PRIORITY |
> +                                        GL_SKIP);
>                 if (error)
>                         goto fail_gunlock_ji;
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 6e00d15ef0a8..fe6cea188199 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -128,28 +128,8 @@ int gfs2_jdesc_check(struct gfs2_jdesc *jd)
>
>  int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
>  {
> -       struct gfs2_inode *ip = GFS2_I(sdp->sd_jdesc->jd_inode);
> -       struct gfs2_glock *j_gl = ip->i_gl;
> -       struct gfs2_log_header_host head;
>         int error;
>
> -       j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
> -       if (gfs2_withdrawn(sdp))
> -               return -EIO;
> -
> -       error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
> -       if (error || gfs2_withdrawn(sdp))
> -               return error;
> -
> -       if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
> -               gfs2_consist(sdp);
> -               return -EIO;
> -       }
> -
> -       /*  Initialize some head of the log stuff  */
> -       sdp->sd_log_sequence = head.lh_sequence + 1;
> -       gfs2_log_pointers_init(sdp, head.lh_blkno);
> -
>         error = gfs2_quota_init(sdp);
>         if (!error && !gfs2_withdrawn(sdp))
>                 set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
> @@ -346,7 +326,8 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp)
>         }
>
>         error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_EXCLUSIVE,
> -                                  LM_FLAG_NOEXP, &sdp->sd_freeze_gh);
> +                                  LM_FLAG_NOEXP | GL_SKIP,
> +                                  &sdp->sd_freeze_gh);
>         if (error)
>                 goto out;
>
> @@ -654,7 +635,16 @@ void gfs2_freeze_func(struct work_struct *work)
>         struct super_block *sb = sdp->sd_vfs;
>
>         atomic_inc(&sb->s_active);
> -       error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
> +       /*
> +        * Here we take the freeze lock in SH to wait until a freeze operation
> +        * (that began with gfs2_freeze's call to gfs2_lock_fs_check_clean
> +        * which takes the freeze gl in EX) has been thawed. Function
> +        * gfs2_lock_fs_check_clean checks that all the journals are clean,
> +        * so we don't need to do it again with this gfs2_freeze_lock.
> +        * In fact, our journal is live when this glock is granted, so the
> +        * freeze_go_xmote_bh will withdraw unless we specify GL_SKIP.
> +        */
> +       error = gfs2_freeze_lock(sdp, &freeze_gh, GL_SKIP);
>         if (error) {
>                 gfs2_assert_withdraw(sdp, 0);
>         } else {
> --
> 2.31.1
>

Thanks,
Andreas

