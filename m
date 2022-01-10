Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DC5489831
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Jan 2022 13:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641816139;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mRcM8W3O5th5S3chLzGxzfl8TM6XMkafFbBmqrI08s8=;
	b=azG0ZkppywUOGoNrhhS5Tqyzgo/uE8ZPUnkxKM2AmO1hFoicjmFwbZw7YhQ6YDyN6EgeXI
	AfXgvt2kmYglBmVnMpFAP2LGQsdrzrFImVJNSDO2s9eBUNXQYjPBzVgrxGCzWylHV+j723
	Vb4aOQ28YmgLvmddaKbfI+yjzi9mVCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-FZoq6mnjPM6Uk3eZ_U9xAA-1; Mon, 10 Jan 2022 07:02:16 -0500
X-MC-Unique: FZoq6mnjPM6Uk3eZ_U9xAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8B3083DD26;
	Mon, 10 Jan 2022 12:02:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C6237E652;
	Mon, 10 Jan 2022 12:02:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92D0E1809CB8;
	Mon, 10 Jan 2022 12:02:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20AC230a032307 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 10 Jan 2022 07:02:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8B11453C6; Mon, 10 Jan 2022 12:02:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 853E053C4
	for <cluster-devel@redhat.com>; Mon, 10 Jan 2022 12:02:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B1581C093C1
	for <cluster-devel@redhat.com>; Mon, 10 Jan 2022 12:02:00 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-257-8xlTA-dSNziaM9cFiNfQ6w-1; Mon, 10 Jan 2022 07:01:59 -0500
X-MC-Unique: 8xlTA-dSNziaM9cFiNfQ6w-1
Received: by mail-wr1-f69.google.com with SMTP id
	q16-20020adfbb90000000b001a4838099baso4111572wrg.10
	for <cluster-devel@redhat.com>; Mon, 10 Jan 2022 04:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mRcM8W3O5th5S3chLzGxzfl8TM6XMkafFbBmqrI08s8=;
	b=1Z3nJZZIANqf8WbkqL/Ftl/OPMYH77jt4RnXD6jPAO4eVdQ+LsSqZ9BnrZXrntI5Kp
	B3hwM+4al+7HKDquiwjFjS9z8iU6TDLpVLLcUNZ4M6IWSKcm5xle4qgzHKnNGeMMnolK
	vNLN9AR+nHxmi0Yl7khZgd6Jv8nsYFmt/mylgmT6wcNnCwS6a8+3cK5US5dzwuA+zuqg
	9Ba82ixMXI9LDlw5ChsQlQvM4v3Iye71KqpzglVeUkCKG1QNmNW1MscxD1brbcewkG41
	GEV+zoSyUSEbaLhmIMvK1Z2OFBS1G/BrNwstmFfxTdFc1WWWTOytxLK1Dm2xT9pTxym0
	DTbw==
X-Gm-Message-State: AOAM532ntzZK1B0+iexWigsbyzCLs1E/6p60jw3eJb1SDyKudC8ZZmkA
	l7ZOTRUjQGuZ9dno8HLSrTz9jRqxrhhyKWbY7nILy5HWSIPa/GqRVRdGZ1ENOXan6zGb91WT1Pn
	nf5jBB835SJe1cavmGbi6NofNwHns2Cpvr3dyLw==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr566050wru.640.1641816117928;
	Mon, 10 Jan 2022 04:01:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpUeUgAhO3zEwkJtc4DiD6cbDz/jIi0QFbDPUwSetL1suYGLERAeDEvgXfQax/wjP6gD+dRPtVOpIJDr6SmZs=
X-Received: by 2002:a5d:6884:: with SMTP id h4mr566030wru.640.1641816117689;
	Mon, 10 Jan 2022 04:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20220107164356.547051-1-rpeterso@redhat.com>
In-Reply-To: <20220107164356.547051-1-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 10 Jan 2022 13:01:46 +0100
Message-ID: <CAHc6FU7LSe4xXpy1RN56GDuGJmXkWvUBtZaEx9CG14aaY62sWQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] gfs2: tell dlm to cancel timed out
	iopen locks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 7, 2022 at 5:44 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Function gfs2_upgrade_iopen_glock tries to upgrade the iopen glock
> first with a "try" lock and then with an ASYNC request with timeout.
>
> Before this patch, if a timeout occurred, gfs2 dequeued the glock and
> went on its way. However, if the dlm lock request is never canceled, it
> could get stuck on dlm's "Convert" queue forever trying to convert the
> lock to EX. In some cases this led to complete cluster deadlock because
> the lock could not be granted in EX until demoted, and it couldn't be
> demoted because other nodes have the glock held in SH (until eviction).
> Dlm never took it off its conversion queue because the lock request was
> never canceled by gfs2, which let it run its course.

Hmm, before this patch, gfs2 did this:

  gfs2_holder_reinit(LM_ST_EXCLUSIVE, GL_ASYNC | GL_NOCACHE, gh);
  error = gfs2_glock_nq(gh);
  /* Wait for gh acquisition or timeout */
  if (!test_bit(HIF_HOLDER, &gh->gh_iflags))
    gfs2_glock_dq(gh);

The idea of the gfs2_glock_dq() is to cancel any pending dlm requests
that relate to this locking request.

The "try" lock request that precedes this doesn't seem to have
anything to do with the problem at hand.

> This patch makes gfs2 cancel dlm requests for iopen glocks if they time
> out. That allows dlm to remove it from its Conversion queue and grant
> the glock to other compatible SH requesters.
>
> The dlm responds to the cancel request by sending gfs2 an AST callback
> when the lock request is properly canceled. If another request is made
> for the dlm lock, dlm returns -EBUSY until the AST is sent. Therefore,
> this patch changes it from glock_dq to glock_dq_wait after the timeout,
> thereby waiting for the glock state machine to progress after receiving
> the AST from dlm.

I'd expect gfs2_glock_dq() to do the canceling and waiting itself:
those are implementation details that really shouldn't be exposed to
glock users.

Also, keep in mind that it's possible for the lock to be granted
between the HIF_HOLDER check and the gfs2_glock_dq() in
gfs2_upgrade_iopen_glock(), whereas the glock layer can take the
necessary locks to prevent that race from happening.

We probably also need to be more careful with the canceling when there
are multiple pending holders in the queue. When a holder is dequeued,
we only want to cancel the current dlm request if it is on behalf of
that holder. I'm not entirely sure how the glock layer keeps track of
that mapping: are pending dlm requests always on behalf of the first
holder in the queue?

> The purpose of the "try" lock and glock timeout was to prevent blocking
> on the lock during evict, since the order of the iopen and inode glocks
> cannot be guaranteed. However, waiting for dlm to return the cancel AST
> should be relatively quick and guaranteed, so should never result in
> deadlock.

Canceling doesn't acquire any resources, so I don't see how it could
possibly deadlock.

Thanks,
Andreas

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/glock.c  |  5 +++++
>  fs/gfs2/incore.h |  1 +
>  fs/gfs2/super.c  | 14 +++++++++++++-
>  3 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index b7ab8430333c..0874e821ab29 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -672,6 +672,9 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
>
>         /* Check for state != intended state */
>         if (unlikely(state != gl->gl_target)) {
> +               if ((ret & LM_OUT_CANCELED) &&
> +                   test_bit(GLF_CANCELING, &gl->gl_flags))
> +                       goto out;
>                 if (gh && !test_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags)) {
>                         /* move to back of queue and try next entry */
>                         if (ret & LM_OUT_CANCELED) {
> @@ -2365,6 +2368,8 @@ static const char *gflags2str(char *buf, const struct gfs2_glock *gl)
>                 *p++ = 'n';
>         if (test_bit(GLF_INSTANTIATE_IN_PROG, gflags))
>                 *p++ = 'N';
> +       if (test_bit(GLF_CANCELING, gflags))
> +               *p++ = 'c';
>         *p = 0;
>         return buf;
>  }
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index 8c00fb389ae5..3572b4a2a831 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -329,6 +329,7 @@ enum {
>         GLF_LRU                         = 13,
>         GLF_OBJECT                      = 14, /* Used only for tracing */
>         GLF_BLOCKING                    = 15,
> +       GLF_CANCELING                   = 16, /* Now canceling lock request */
>         GLF_PENDING_DELETE              = 17,
>         GLF_FREEING                     = 18, /* Wait for glock to be freed */
>  };
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 143a47359d1b..e23bc7de5248 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -1193,7 +1193,19 @@ static bool gfs2_upgrade_iopen_glock(struct inode *inode)
>                 test_bit(GLF_DEMOTE, &ip->i_gl->gl_flags),
>                 timeout);
>         if (!test_bit(HIF_HOLDER, &gh->gh_iflags)) {
> -               gfs2_glock_dq(gh);
> +               if (sdp->sd_lockstruct.ls_ops->lm_cancel) {
> +                       set_bit(GLF_CANCELING,  &gh->gh_gl->gl_flags);
> +                       sdp->sd_lockstruct.ls_ops->lm_cancel(gh->gh_gl);
> +               }
> +               /*
> +                * We canceled the dlm lock, so we must wait for dlm to send
> +                * us the AST callback, otherwise we will get -EBUSY if anyone
> +                * tries to lock the glock again while the dlm lock is still
> +                * on the dlm conversion queue.
> +                */
> +               gfs2_glock_dq_wait(gh);
> +               clear_bit(GLF_CANCELING,  &gh->gh_gl->gl_flags);
> +               smp_mb__after_atomic();
>                 return false;
>         }
>         return true;
> --
> 2.33.1
>

