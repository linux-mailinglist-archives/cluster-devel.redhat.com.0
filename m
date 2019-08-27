Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 180809E6A8
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Aug 2019 13:21:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32A5E1089042;
	Tue, 27 Aug 2019 11:21:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B170E5D6B0;
	Tue, 27 Aug 2019 11:21:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 951B0180B536;
	Tue, 27 Aug 2019 11:21:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7RBL9F6015788 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Aug 2019 07:21:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DAE9A3CCC; Tue, 27 Aug 2019 11:21:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D521A194B2
	for <cluster-devel@redhat.com>; Tue, 27 Aug 2019 11:21:07 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
	[209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3FCA22A09A0
	for <cluster-devel@redhat.com>; Tue, 27 Aug 2019 11:21:07 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id g6so11719338otq.13
	for <cluster-devel@redhat.com>; Tue, 27 Aug 2019 04:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4MrUTAzwFi0wFsC2j36T9OOhGPBjk0vsDXFHn26q53o=;
	b=qZzxPer2q/oVBJwi4Ch4MfuQZ8LuJE6/btQuwTFWJeVtbkKj7UcoegMcdX441gn+1l
	bNy0R4iyn6OPFQ6kOkP6/t1U8ZcoK7dWKTsE6berUXDLutCluExybrIXL3K+pLLjN9Zo
	HjJLA9crRiNc70T2Y3Ym0EgoQCC5FIZUuufo/ERdxnqZJPdZqlN1aqk460vl/XA1YILF
	/DqOabqBau8uBwT0Dkza83+Vw6g3J/fw4oZSkZ5DsUuQPse1T0rEWIG/wL2m9wSIxxn+
	bhNK6jbNBDKkCzgUIEhMmE5Ymfdquxdgc3MwrTCa7vnHr5AnaygYW3haypoxNTWlt9IQ
	UPoQ==
X-Gm-Message-State: APjAAAVld25Hh+2OOpRfakTBlBWhRIGKF/4WTAaBpGkL0aPg5M8jMxbP
	6wOnDfaHqlsSARRgK06sXkgZkucd0Ia8MzJTVh+JduoKKwqEbr/hcvJPe3FI6mjSyvTDX4/BFGx
	KP1Xjk012fSi+0Gi6PIbP77u1qSZ6HgneDlujnQ==
X-Received: by 2002:a05:6808:9b6:: with SMTP id
	e22mr15940623oig.147.1566904866513; 
	Tue, 27 Aug 2019 04:21:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyaShxXYeWHVPaj6Taso1Hu7GtjWeayGCwUshWQYygWucSnksIJgQGRApEZabSqYlQdVkalvylYLsb4MJiqYpY=
X-Received: by 2002:a05:6808:9b6:: with SMTP id
	e22mr15940603oig.147.1566904866231; 
	Tue, 27 Aug 2019 04:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190523130421.21003-1-rpeterso@redhat.com>
	<20190523130421.21003-15-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-15-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 27 Aug 2019 13:20:55 +0200
Message-ID: <CAHc6FU6oXu+-5L_2PmtzPy9RXeuxNL9Sf87y7FsZxxeAff=DdQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v6 14/26] gfs2: Ignore dlm recovery
 requests if gfs2 is withdrawn
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Tue, 27 Aug 2019 11:21:17 +0000 (UTC)

Bob,

On Thu, May 23, 2019 at 3:05 PM Bob Peterson <rpeterso@redhat.com> wrote:
> When a node fails, user space informs dlm of the node failure,
> and dlm instructs gfs2 on the surviving nodes to perform journal
> recovery. It does this by calling various callback functions in
> lock_dlm.c. To mark its progress, it keeps generation numbers
> and recover bits in a dlm "control" lock lvb, which is seen by
> all nodes to determine which journals need to be replayed.
>
> The gfs2 on all nodes get the same recovery requests from dlm,
> so they all try to do the recovery, but only one will be
> granted the exclusive lock on the journal. The others fail
> with a "Busy" message on their "try lock."
>
> However, when a node is withdrawn, it cannot safely do any
> recovery or safely replay any journals. To make matters worse,
> gfs2 might withdraw as a result of attempting recovery. For
> example, this might happen if the device goes offline, or if
> an hba fails. But in today's gfs2 code, it doesn't check for
> being withdrawn at any step in the recovery process. What's
> worse if that these callbacks from dlm have no return code,
> so there is no way to indicate failure back to dlm. We can
> send a "Recovery failed" uevent eventually, but that tells
> user space what happened, not dlm's kernel code.
>
> Before this patch, lock_dlm would perform its recovery steps but
> ignore the result, and eventually it would still update its
> generation number in the lvb, despite the fact that it may have
> withdrawn or encountered an error. The other nodes would then
> see the newer generation number in the lvb and conclude that
> they don't need to do recovery because the generation number
> is newer than the last one they saw. They think a different
> node has already recovered the journal.
>
> This patch adds checks to several of the callbacks used by dlm
> in its recovery state machine so that the functions are ignored
> and skipped if an io error has occurred or if the file system
> is withdrawn. That prevents the lvb bits from being updated, and
> therefore dlm and user space still see the need for recovery to
> take place.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/lock_dlm.c | 18 ++++++++++++++++++
>  fs/gfs2/recovery.c |  5 +++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
> index 31df26ed7854..9329f86ffcbe 100644
> --- a/fs/gfs2/lock_dlm.c
> +++ b/fs/gfs2/lock_dlm.c
> @@ -1081,6 +1081,10 @@ static void gdlm_recover_prep(void *arg)
>         struct gfs2_sbd *sdp = arg;
>         struct lm_lockstruct *ls = &sdp->sd_lockstruct;
>
> +       if (gfs2_withdrawn(sdp)) {
> +               fs_err(sdp, "recover_prep ignored due to withdraw.\n");
> +               return;
> +       }
>         spin_lock(&ls->ls_recover_spin);
>         ls->ls_recover_block = ls->ls_recover_start;
>         set_bit(DFL_DLM_RECOVERY, &ls->ls_recover_flags);
> @@ -1103,6 +1107,11 @@ static void gdlm_recover_slot(void *arg, struct dlm_slot *slot)
>         struct lm_lockstruct *ls = &sdp->sd_lockstruct;
>         int jid = slot->slot - 1;
>
> +       if (gfs2_withdrawn(sdp)) {
> +               fs_err(sdp, "recover_slot jid %d ignored due to withdraw.\n",
> +                      jid);
> +               return;
> +       }
>         spin_lock(&ls->ls_recover_spin);
>         if (ls->ls_recover_size < jid + 1) {
>                 fs_err(sdp, "recover_slot jid %d gen %u short size %d\n",
> @@ -1127,6 +1136,10 @@ static void gdlm_recover_done(void *arg, struct dlm_slot *slots, int num_slots,
>         struct gfs2_sbd *sdp = arg;
>         struct lm_lockstruct *ls = &sdp->sd_lockstruct;
>
> +       if (gfs2_withdrawn(sdp)) {
> +               fs_err(sdp, "recover_done ignored due to withdraw.\n");
> +               return;
> +       }

In gdlm_recover_prep, we're setting the DFL_DLM_RECOVERY flag to
indicate that we're in recovery. Assume that a withdraw occurs after
that. We'll then skip clearing the DFL_DLM_RECOVERY flag because of
the above check. Won't that leave waiters on DFL_DLM_RECOVERY stuck?

>         /* ensure the ls jid arrays are large enough */
>         set_recover_size(sdp, slots, num_slots);
>
> @@ -1154,6 +1167,11 @@ static void gdlm_recovery_result(struct gfs2_sbd *sdp, unsigned int jid,
>  {
>         struct lm_lockstruct *ls = &sdp->sd_lockstruct;
>
> +       if (gfs2_withdrawn(sdp)) {
> +               fs_err(sdp, "recovery_result jid %d ignored due to withdraw.\n",
> +                      jid);
> +               return;
> +       }
>         if (test_bit(DFL_NO_DLM_OPS, &ls->ls_recover_flags))
>                 return;
>
> diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> index 4ce2bfdbefdc..9e15b5aa2cfb 100644
> --- a/fs/gfs2/recovery.c
> +++ b/fs/gfs2/recovery.c
> @@ -307,6 +307,11 @@ void gfs2_recover_func(struct work_struct *work)
>         int jlocked = 0;
>
>         t_start = ktime_get();
> +       if (gfs2_withdrawn(sdp)) {
> +               fs_err(sdp, "jid=%u: Recovery not attempted due to withdraw.\n",
> +                      jd->jd_jid);
> +               goto fail;
> +       }
>         if (sdp->sd_args.ar_spectator)
>                 goto fail;
>         if (jd->jd_jid != sdp->sd_lockstruct.ls_jid) {
> --
> 2.21.0
>

Thanks,
Andreas

