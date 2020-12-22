Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C0D1B2E1095
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Dec 2020 00:28:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608679708;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=eHtm99dp+9rQtFIr495DKQntJQtpPfU0fYigfgOF/yo=;
	b=DzGTMHLIp6+sbxtciTP9I4PK7MDo+KDY9R8UOwc6Xl3Y2efNpAyev6eXPwDER8qH0MbBKT
	e8it3907OIpgFp3fpse8VOEJfGEt7yVc4EXl3hRuTAuai57BU8vtMnNeXidQi/L/CWMiKz
	9dcPFSw3wVmU9DhNL4Fbw0LaNZapwhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-wa74nJNJMoSIf_VsCV7uTg-1; Tue, 22 Dec 2020 18:28:27 -0500
X-MC-Unique: wa74nJNJMoSIf_VsCV7uTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3ACA1005504;
	Tue, 22 Dec 2020 23:28:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C96AE2DD;
	Tue, 22 Dec 2020 23:28:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2FBD4A7C6;
	Tue, 22 Dec 2020 23:28:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BMNSGXH014907 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 22 Dec 2020 18:28:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AE3852026D5D; Tue, 22 Dec 2020 23:28:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A98AC2026D49
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 23:28:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62B83811E76
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 23:28:14 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-200-0c0War1xPGa2yqKPrEiyQg-1; Tue, 22 Dec 2020 18:28:12 -0500
X-MC-Unique: 0c0War1xPGa2yqKPrEiyQg-1
Received: by mail-wr1-f72.google.com with SMTP id v7so5247427wra.3
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 15:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eHtm99dp+9rQtFIr495DKQntJQtpPfU0fYigfgOF/yo=;
	b=orGc3PtGvKZtBGtmRD8clYDxXaw8Za9HolivXb5+Lqdi9a7SbsrD4xU0wCV6btXfd5
	s62BuMS4ftbG0vmD+qfTtRmNYbC00LTtm1DT7O2C4VYV/vQtvwLNizRsoSPNJQYIW2YQ
	v3KCDUSl+OAOIncuWOLaetrHKGa6daXORl6BNtJrTqO7fSRXnnlWRs4o0LJtk05WbjwU
	Qw/yzv7+AP9lhRzTJoff+t1kirOeTjFAk6mDekhJOEznAQ9xpiZ5D1D5m1RNnubOhjya
	nw+39Gd0vz6VO9jMyABP+VVc+kRu1riFAXEC5CHQxdXNsAUYs3YBvQjd9DPxnUyxz4dC
	qQNg==
X-Gm-Message-State: AOAM530dtxFjQ1vhMLTJmworX1eRiIcugssbULOqWP+3hnjBpWWGgCsn
	SkhqgUKaT/AFSB1POCVpoR+njoKYaIf7ge4nYBhDEsXldeOR+GM5Rtbuksu/fMzXrY+KNsWHATo
	qcsEWbjA3zhNc5Vkm1m8dGyyWzein6v8kCazmyA==
X-Received: by 2002:a1c:27c3:: with SMTP id n186mr24057565wmn.96.1608679691302;
	Tue, 22 Dec 2020 15:28:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykbpILgQBLR/ZQM2XM63RfYJN5j+bMr916eQac9nADKrRtQQOl4U+DZs+sibOqhXrGNy5FFHIVRxAyuvP5i5k=
X-Received: by 2002:a1c:27c3:: with SMTP id n186mr24057556wmn.96.1608679691119;
	Tue, 22 Dec 2020 15:28:11 -0800 (PST)
MIME-Version: 1.0
References: <290202568.38904309.1608669529163.JavaMail.zimbra@redhat.com>
	<2125295377.38904313.1608669538740.JavaMail.zimbra@redhat.com>
In-Reply-To: <2125295377.38904313.1608669538740.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 23 Dec 2020 00:27:59 +0100
Message-ID: <CAHc6FU5w=7CLrqYzE==4Vt39+Mfv4ZNX_PVi7KShqNYzedLeag@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: make recovery workqueue
 operate on a gfs2 mount point, not journal
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 22, 2020 at 9:39 PM Bob Peterson <rpeterso@redhat.com> wrote:
>
> Hi,
>
> Before this patch, journal recovery was done by a workqueue function that
> operated on a per-journal basis. The problem is, these could run simultaneously
> which meant that they could all use the same bio, sd_log_bio, to do their
> writing to all the various journals. These operations overwrote one another
> eventually causing memory corruption.
>
> This patch makes the recovery workqueue operate on a per-superblock basis,
> which means a mount point using, for example journal0, could do recovery
> for all journals that need recovery. This is done consecutively so the
> sd_log_bio is only referenced by one recovery at a time, thus avoiding the
> chaos.
>
> Since the journal recovery requests can come in any order, and unpredictably,
> the new work func loops until there are no more journals to be recovered.
>
> Since multiple processes may request recovery of a journal, and since they
> all now use the same sdp-based workqueue, it's okay for them to get an
> error from queue_work: Queueing work while there's already work queued.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/incore.h     |  2 +-
>  fs/gfs2/ops_fstype.c |  2 +-
>  fs/gfs2/recovery.c   | 32 ++++++++++++++++++++++++++++----
>  3 files changed, 30 insertions(+), 6 deletions(-)
>
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index 8e1ab8ed4abc..b393cbf9efeb 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -529,7 +529,6 @@ struct gfs2_jdesc {
>         struct list_head jd_list;
>         struct list_head extent_list;
>         unsigned int nr_extents;
> -       struct work_struct jd_work;
>         struct inode *jd_inode;
>         unsigned long jd_flags;
>  #define JDF_RECOVERY 1
> @@ -746,6 +745,7 @@ struct gfs2_sbd {
>         struct completion sd_locking_init;
>         struct completion sd_wdack;
>         struct delayed_work sd_control_work;
> +       struct work_struct sd_recovery_work;
>
>         /* Inode Stuff */
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 61fce59cb4d3..3d9a6d6d42cb 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -93,6 +93,7 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
>         init_completion(&sdp->sd_locking_init);
>         init_completion(&sdp->sd_wdack);
>         spin_lock_init(&sdp->sd_statfs_spin);
> +       INIT_WORK(&sdp->sd_recovery_work, gfs2_recover_func);
>
>         spin_lock_init(&sdp->sd_rindex_spin);
>         sdp->sd_rindex_tree.rb_node = NULL;
> @@ -586,7 +587,6 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struct gfs2_holder *ji_gh)
>                 INIT_LIST_HEAD(&jd->extent_list);
>                 INIT_LIST_HEAD(&jd->jd_revoke_list);
>
> -               INIT_WORK(&jd->jd_work, gfs2_recover_func);
>                 jd->jd_inode = gfs2_lookupi(sdp->sd_jindex, &name, 1);
>                 if (IS_ERR_OR_NULL(jd->jd_inode)) {
>                         if (!jd->jd_inode)
> diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> index c26c68ebd29d..cd3e66cdb560 100644
> --- a/fs/gfs2/recovery.c
> +++ b/fs/gfs2/recovery.c
> @@ -399,9 +399,8 @@ static void recover_local_statfs(struct gfs2_jdesc *jd,
>         return;
>  }
>
> -void gfs2_recover_func(struct work_struct *work)
> +static void gfs2_recover_one(struct gfs2_jdesc *jd)
>  {
> -       struct gfs2_jdesc *jd = container_of(work, struct gfs2_jdesc, jd_work);
>         struct gfs2_inode *ip = GFS2_I(jd->jd_inode);
>         struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
>         struct gfs2_log_header_host head;
> @@ -562,16 +561,41 @@ void gfs2_recover_func(struct work_struct *work)
>         wake_up_bit(&jd->jd_flags, JDF_RECOVERY);
>  }
>
> +void gfs2_recover_func(struct work_struct *work)
> +{
> +       struct gfs2_sbd *sdp = container_of(work, struct gfs2_sbd,
> +                                           sd_recovery_work);
> +       struct gfs2_jdesc *jd;
> +       int count, recovered = 0;
> +
> +       do {
> +               count = 0;
> +               spin_lock(&sdp->sd_jindex_spin);
> +               list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
> +                       if (test_bit(JDF_RECOVERY, &jd->jd_flags)) {
> +                               spin_unlock(&sdp->sd_jindex_spin);
> +                               gfs2_recover_one(jd);
> +                               spin_lock(&sdp->sd_jindex_spin);
> +                               count++;
> +                               recovered++;
> +                       }
> +               }
> +               spin_unlock(&sdp->sd_jindex_spin);
> +       } while (count);

Can't this be a simple loop like below?

repeat:
        spin_lock(&sdp->sd_jindex_spin);
        list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
                if (test_bit(JDF_RECOVERY, &jd->jd_flags)) {
                        spin_unlock(&sdp->sd_jindex_spin);
                        gfs2_recover_one(jd);
                        goto repeat;
                }
        }
        spin_unlock(&sdp->sd_jindex_spin);

> +       if (recovered > 1)
> +               fs_err(sdp, "Journals recovered: %d\n", recovered);
> +}
> +
>  int gfs2_recover_journal(struct gfs2_jdesc *jd, bool wait)
>  {
> +       struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
>         int rv;
>
>         if (test_and_set_bit(JDF_RECOVERY, &jd->jd_flags))
>                 return -EBUSY;
>
>         /* we have JDF_RECOVERY, queue should always succeed */
> -       rv = queue_work(gfs_recovery_wq, &jd->jd_work);
> -       BUG_ON(!rv);
> +       rv = queue_work(gfs_recovery_wq, &sdp->sd_recovery_work);
>
>         if (wait)
>                 wait_on_bit(&jd->jd_flags, JDF_RECOVERY,

Thanks,
Andreas

