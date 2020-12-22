Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 15A5A2E10AC
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Dec 2020 00:58:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608681509;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5ManLAE/KZx5rXxWyOe00NJizDOMK4zc/R46uAN6VN4=;
	b=NUbzYeiTSWMscr5nGeBLWeH2P2FbqDzACnmgYiBRBscRg8lkHwvrICnoHaCSW10NdVV0sS
	s85jPQmlOVNQO1A677qtn0Wq0ZsQa9uKYPJKfLqSBuNucSzmv1Dt+HSmaA77oPDfDDY9HG
	O+GjX8DMLZb0L68IjIzmjlBTGvxvUe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-4ZtpMeFDOOSiNpCVrOnYbQ-1; Tue, 22 Dec 2020 18:58:27 -0500
X-MC-Unique: 4ZtpMeFDOOSiNpCVrOnYbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80F0D1005504;
	Tue, 22 Dec 2020 23:58:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F4AB5D705;
	Tue, 22 Dec 2020 23:58:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5808E180954D;
	Tue, 22 Dec 2020 23:58:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BMNwJ3r017815 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 22 Dec 2020 18:58:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DBC20112D437; Tue, 22 Dec 2020 23:58:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7BAE112D436
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 23:58:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E875858280
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 23:58:16 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-204-w_cxUXORMYa65ZW68IqAYA-1; Tue, 22 Dec 2020 18:58:14 -0500
X-MC-Unique: w_cxUXORMYa65ZW68IqAYA-1
Received: by mail-wr1-f71.google.com with SMTP id j5so11959228wro.12
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 15:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5ManLAE/KZx5rXxWyOe00NJizDOMK4zc/R46uAN6VN4=;
	b=mkeq6i6TYOalDx2bDSo6LKuNNfL+3ERal/ZPNAx8Yg9XrFGzUMzIk/V9g+CiujpJKp
	ht9yyc6qmnHL2rsT0oHQXdpmojP+Lv/Wg2fwqgDIYlqpvN+PZoYkeNevFCCvU93+Loht
	oqP1mta58eycr8IGt5GnQERhKN0uJ+0gKJsqARAZ/wa4cbz9i96ivHgllbv5Ksjp0sXq
	3x+DuL7Z6A+qvlXjwrR5n//xIjDHS2QjCjSVLxkkN+DHVBiJugdPClhKyFVTTPzsAErt
	s1PpjEDaYxgFicvkiThDEAH6pH8hHRsu1eKZqGaoEH91jt/m3eBB0zQJlywVLhj2F7Bg
	hs9A==
X-Gm-Message-State: AOAM530ZFzPzp9bE7KhkOZyfDN9YpPIU4F5QxPS/dC/SDpj4ZikiKu9/
	1YarSkpPzHxExkCluPOCeG/up1fGfwncX1AvQCLgygt47UR6dY2ma2fPQUs7Q/ksuT/PWffsx95
	F4ud6KYsnjk1FLclLpDQiY0Nl0zCMDATM2Ar2uw==
X-Received: by 2002:a7b:c145:: with SMTP id z5mr23842308wmi.164.1608681493549; 
	Tue, 22 Dec 2020 15:58:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaS8i0EUdMHhS5p2ZzZdV2BNfcnIhmTByYiE281Y30CZLcqUm7MSnUg52LkMxOLbwdnCmeujzKYkgeTq7Ryrc=
X-Received: by 2002:a7b:c145:: with SMTP id z5mr23842298wmi.164.1608681493348; 
	Tue, 22 Dec 2020 15:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20201222204328.78528-1-rpeterso@redhat.com>
	<20201222204328.78528-3-rpeterso@redhat.com>
In-Reply-To: <20201222204328.78528-3-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 23 Dec 2020 00:58:01 +0100
Message-ID: <CAHc6FU7WC1j=_xtMk2GZTLng05_VdcGmmBAdB1AWJ_pjUtwi0w@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 2/2] gfs2: move freeze glock
 outside the make_fs_rw and _ro functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 22, 2020 at 9:43 PM Bob Peterson <rpeterso@redhat.com> wrote:
>
> Before this patch, sister functions gfs2_make_fs_rw and gfs2_make_fs_ro locked
> (held) the freeze glock by calling gfs2_freeze_lock and gfs2_freeze_unlock.
> The problem is, not all the callers of gfs2_make_fs_ro should be doing this.
> The three callers of gfs2_make_fs_ro are: remount (gfs2_reconfigure),
> signal_our_withdraw, and unmount (gfs2_put_super). But when unmounting the
> file system we can get into the following circular lock dependency:
>
> deactivate_super
>    down_write(&s->s_umount); <-------------------------------------- s_umount
>    deactivate_locked_super
>       gfs2_kill_sb
>          kill_block_super
>             generic_shutdown_super
>                gfs2_put_super
>                   gfs2_make_fs_ro
>                      gfs2_glock_nq_init sd_freeze_gl
>                         freeze_go_sync
>                            if (freeze glock in SH)
>                               freeze_super (vfs)
>                                  down_write(&sb->s_umount); <------- s_umount
>
> This patch moves the hold of the freeze glock outside the two sister rw/ro
> functions to their callers, but it doesn't request the glock from
> gfs2_put_super, thus eliminating the circular dependency.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/ops_fstype.c | 31 +++++++++++++++++--------------
>  fs/gfs2/super.c      | 23 -----------------------
>  fs/gfs2/util.c       | 18 ++++++++++++++++--
>  3 files changed, 33 insertions(+), 39 deletions(-)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index c71c7beb9257..cd3fd252c771 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -1084,6 +1084,7 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
>         int silent = fc->sb_flags & SB_SILENT;
>         struct gfs2_sbd *sdp;
>         struct gfs2_holder mount_gh;
> +       struct gfs2_holder freeze_gh;
>         int error;
>
>         sdp = init_sbd(sb);
> @@ -1195,23 +1196,18 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
>                 goto fail_per_node;
>         }
>
> -       if (sb_rdonly(sb)) {
> -               struct gfs2_holder freeze_gh;
> +       error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
> +       if (error)
> +               goto fail_per_node;
>
> -               error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
> -               if (error) {
> -                       fs_err(sdp, "can't make FS RO: %d\n", error);
> -                       goto fail_per_node;
> -               }
> -               gfs2_freeze_unlock(&freeze_gh);
> -       } else {
> +       if (!sb_rdonly(sb))
>                 error = gfs2_make_fs_rw(sdp);
> -               if (error) {
> -                       fs_err(sdp, "can't make FS RW: %d\n", error);
> -                       goto fail_per_node;
> -               }
> -       }
>
> +       gfs2_freeze_unlock(&freeze_gh);
> +       if (error) {
> +               fs_err(sdp, "can't make FS RW: %d\n", error);
> +               goto fail_per_node;
> +       }
>         gfs2_glock_dq_uninit(&mount_gh);
>         gfs2_online_uevent(sdp);
>         return 0;
> @@ -1512,6 +1508,12 @@ static int gfs2_reconfigure(struct fs_context *fc)
>                 fc->sb_flags |= SB_RDONLY;
>
>         if ((sb->s_flags ^ fc->sb_flags) & SB_RDONLY) {
> +               struct gfs2_holder freeze_gh;
> +
> +               error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
> +               if (error)
> +                       return -EINVAL;
> +
>                 if (fc->sb_flags & SB_RDONLY) {
>                         error = gfs2_make_fs_ro(sdp);
>                         if (error)
> @@ -1521,6 +1523,7 @@ static int gfs2_reconfigure(struct fs_context *fc)
>                         if (error)
>                                 errorfc(fc, "unable to remount read-write");
>                 }
> +               gfs2_freeze_unlock(&freeze_gh);
>         }
>         sdp->sd_args = *newargs;
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index ea312a94ce69..754ea2a137b4 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -165,7 +165,6 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
>  {
>         struct gfs2_inode *ip = GFS2_I(sdp->sd_jdesc->jd_inode);
>         struct gfs2_glock *j_gl = ip->i_gl;
> -       struct gfs2_holder freeze_gh;
>         struct gfs2_log_header_host head;
>         int error;
>
> @@ -173,10 +172,6 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
>         if (error)
>                 return error;
>
> -       error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
> -       if (error)
> -               goto fail_threads;
> -
>         j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
>         if (gfs2_withdrawn(sdp)) {
>                 error = -EIO;
> @@ -203,13 +198,9 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
>
>         set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
>
> -       gfs2_freeze_unlock(&freeze_gh);
> -
>         return 0;
>
>  fail:
> -       gfs2_freeze_unlock(&freeze_gh);
> -fail_threads:
>         if (sdp->sd_quotad_process)
>                 kthread_stop(sdp->sd_quotad_process);
>         sdp->sd_quotad_process = NULL;
> @@ -607,21 +598,9 @@ static void gfs2_dirty_inode(struct inode *inode, int flags)
>
>  int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
>  {
> -       struct gfs2_holder freeze_gh;
>         int error = 0;
>         int log_write_allowed = test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
>
> -       gfs2_holder_mark_uninitialized(&freeze_gh);
> -       if (sdp->sd_freeze_gl &&
> -           !gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl)) {
> -               error = gfs2_freeze_lock(sdp, &freeze_gh,
> -                                        log_write_allowed ? 0 : LM_FLAG_TRY);
> -               if (error == GLR_TRYFAILED)
> -                       error = 0;
> -               if (error && !gfs2_withdrawn(sdp))
> -                       return error;
> -       }
> -
>         gfs2_flush_delete_work(sdp);
>         if (!log_write_allowed && current == sdp->sd_quotad_process)
>                 fs_warn(sdp, "The quotad daemon is withdrawing.\n");
> @@ -650,8 +629,6 @@ int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
>                                    atomic_read(&sdp->sd_reserving_log) == 0,
>                                    HZ * 5);
>         }
> -       gfs2_freeze_unlock(&freeze_gh);
> -
>         gfs2_quota_cleanup(sdp);
>
>         if (!log_write_allowed)
> diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
> index a115c441e2a1..87070e433f96 100644
> --- a/fs/gfs2/util.c
> +++ b/fs/gfs2/util.c
> @@ -122,6 +122,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
>         struct inode *inode = sdp->sd_jdesc->jd_inode;
>         struct gfs2_inode *ip = GFS2_I(inode);
>         u64 no_formal_ino = ip->i_no_formal_ino;
> +       int log_write_allowed = test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
>         int ret = 0;
>         int tries;
>
> @@ -142,8 +143,21 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
>          * therefore we need to clear SDF_JOURNAL_LIVE manually.
>          */
>         clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
> -       if (!sb_rdonly(sdp->sd_vfs))
> -               ret = gfs2_make_fs_ro(sdp);
> +       if (!sb_rdonly(sdp->sd_vfs)) {
> +               struct gfs2_holder freeze_gh;
> +
> +               gfs2_holder_mark_uninitialized(&freeze_gh);
> +               if (sdp->sd_freeze_gl &&
> +                   !gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl))

I'm adding a little cleanup here, but otherwise this patch looks good now:

--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -148,15 +148,15 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)

         gfs2_holder_mark_uninitialized(&freeze_gh);
         if (sdp->sd_freeze_gl &&
-            !gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl))
+            !gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl)) {
             ret = gfs2_freeze_lock(sdp, &freeze_gh,
                        log_write_allowed ? 0 : LM_FLAG_TRY);
-        if (ret == GLR_TRYFAILED)
-            ret = 0;
-        if (!ret) {
-            ret = gfs2_make_fs_ro(sdp);
-            gfs2_freeze_unlock(&freeze_gh);
+            if (ret == GLR_TRYFAILED)
+                ret = 0;
         }
+        if (!ret)
+            ret = gfs2_make_fs_ro(sdp);
+        gfs2_freeze_unlock(&freeze_gh);
     }

     if (sdp->sd_lockstruct.ls_ops->lm_lock == NULL) { /* lock_nolock */

> +                       ret = gfs2_freeze_lock(sdp, &freeze_gh,
> +                                      log_write_allowed ? 0 : LM_FLAG_TRY);
> +               if (ret == GLR_TRYFAILED)
> +                       ret = 0;
> +               if (!ret) {
> +                       ret = gfs2_make_fs_ro(sdp);
> +                       gfs2_freeze_unlock(&freeze_gh);
> +               }
> +       }
>
>         if (sdp->sd_lockstruct.ls_ops->lm_lock == NULL) { /* lock_nolock */
>                 if (!ret)
> --
> 2.29.2
>

Thanks,
Andreas

