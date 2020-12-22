Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 908522E0C81
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Dec 2020 16:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608649984;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=erMLYWoXGjl8jsMLHafAMuRWai8QSGAmg830hLIpEig=;
	b=N4M9Dl/14l3VUpgH//27RZoxqJXK7M4ZwUIkMCX+tvkYofN5mi4EMoHBjpxqA6kVdaiXv1
	ZipfJ4wkBdImw1uyOLrC/xfeuhFyinKYF0YilVjbj/puRquRY81C2RPPyfDXA6wv5WZ62G
	BQiNBI4Bg8v4H/WviDPg5eSxiWlrSew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-Ytuk_SoLOJSGVQ9Nlwd-0Q-1; Tue, 22 Dec 2020 10:13:02 -0500
X-MC-Unique: Ytuk_SoLOJSGVQ9Nlwd-0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC28E801817;
	Tue, 22 Dec 2020 15:12:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26DDA19D9C;
	Tue, 22 Dec 2020 15:12:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2726318095C9;
	Tue, 22 Dec 2020 15:12:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BMFCs74024344 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 22 Dec 2020 10:12:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C3604110F749; Tue, 22 Dec 2020 15:12:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE00E110F747
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 15:12:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FB1E8007D9
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 15:12:52 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-234-kZZYKVfuM5WLuXq2CPdU3A-1; Tue, 22 Dec 2020 10:12:50 -0500
X-MC-Unique: kZZYKVfuM5WLuXq2CPdU3A-1
Received: by mail-wr1-f69.google.com with SMTP id u29so11496012wru.6
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 07:12:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=erMLYWoXGjl8jsMLHafAMuRWai8QSGAmg830hLIpEig=;
	b=KC2zrrWt43AfQ2zSftCiE1CKUB+VeeKmojkeJK2/ugZ5a7Hn5tE42YW2hWp9FapSRW
	x/z5QUgweLSo5lzJAk7kSAe4VFP7GjeNE1aXCRVFpAlM+G0F7x6c6yPGo2yiJpsst+bf
	esFvHJBkvj8569IVv1P79SnUuRhUngxbByBXCddU0e4bIblip1AKsiIwzoKudmIJYBBw
	Hb9N5AoE8OnRg4PfznivvepqfIzcqRCbHjmOd4GCebFc1TkipGkD2aKtU45qg6b0bhVR
	RXLLushwfwqsY791bsgKc7WPAfuFw8V0AO+bQDAi4a4r9k/P0+C6hP+zwmCj5OA1KPC2
	9rVQ==
X-Gm-Message-State: AOAM530GO+ke2XCXYubdTVjAMMqkdyKmQWUO/OGRVAxsKvpjO9SljMc5
	xRMX7e5AC/xPAox1sbKlBv+TPfPtGIAKCwttv+eBu5RE/MJzoPwBQahZu9rNX7K0GdSs5ZtyNJM
	0bGRNBKH6o0g8n+Hpu5kmTDF5CjhsslpujmSTPQ==
X-Received: by 2002:a1c:f715:: with SMTP id v21mr22748867wmh.2.1608649968618; 
	Tue, 22 Dec 2020 07:12:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaN0D4kMsBLkzKhYfV+DkQ/yo11OhUT/BZXgTlCOyhdKkH4xoXbLFh6ykCVWtZN16AdnS7x9jIV5S0RLQweTY=
X-Received: by 2002:a1c:f715:: with SMTP id v21mr22748848wmh.2.1608649968459; 
	Tue, 22 Dec 2020 07:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20201219204848.285781-1-agruenba@redhat.com>
	<20201219204848.285781-13-agruenba@redhat.com>
	<2102390291.38869885.1608646766751.JavaMail.zimbra@redhat.com>
In-Reply-To: <2102390291.38869885.1608646766751.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 22 Dec 2020 16:12:37 +0100
Message-ID: <CAHc6FU6EkuNyvD6_m8wszhTURQV8iy+uj4v6tu+yfiLcrK_M4A@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH v2 12/20] gfs2: Clean up gfs2_log_reserve
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

On Tue, Dec 22, 2020 at 3:19 PM Bob Peterson <rpeterso@redhat.com> wrote:
>
> Hi,
>
> Comments inline.
>
> ----- Original Message -----
> > Wake up log waiters in gfs2_log_release when log space has actually become
> > available.  This is a much better place for the wakeup than gfs2_logd.
> >
> > Check if enough log space is immeditely available before anything else.  If
> > there isn't, use io_wait_event to wait instead of open-coding it.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >  fs/gfs2/log.c | 54 ++++++++++++++++++++++-----------------------------
> >  1 file changed, 23 insertions(+), 31 deletions(-)
> >
> > diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> > index 95ad444bd3dc..7a65823ad1f3 100644
> > --- a/fs/gfs2/log.c
> > +++ b/fs/gfs2/log.c
> > @@ -420,6 +420,8 @@ void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int
> > blks)
> >       trace_gfs2_log_blocks(sdp, blks);
> >       gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
> >                                 sdp->sd_jdesc->jd_blocks);
> > +     if (atomic_read(&sdp->sd_log_blks_needed))
> > +             wake_up(&sdp->sd_log_waitq);
> >  }
> >
> >  /**
> > @@ -444,36 +446,33 @@ void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned
> > int blks)
> >  {
> >       unsigned reserved_blks = 7 * (4096 / sdp->sd_vfs->s_blocksize);
> >       unsigned wanted = blks + reserved_blks;
> > -     DEFINE_WAIT(wait);
> > -     int did_wait = 0;
> >       unsigned int free_blocks;
> >
> > -     atomic_add(blks, &sdp->sd_log_blks_needed);
> > -retry:
> >       free_blocks = atomic_read(&sdp->sd_log_blks_free);
> > -     if (unlikely(free_blocks <= wanted)) {
> > -             do {
> > -                     prepare_to_wait_exclusive(&sdp->sd_log_waitq, &wait,
> > -                                     TASK_UNINTERRUPTIBLE);
> > +     while (free_blocks >= wanted) {
> > +             if (atomic_try_cmpxchg(&sdp->sd_log_blks_free, &free_blocks,
> > +                                    free_blocks - blks))
> > +                     return;
>
> This would be a good place to have cond_resched() or schedule() or something, no?

No, this is just an atomic_sub_if_positive(); see
atomic_dec_if_positive in atomic-fallback.h.

> > +     }
> > +
> > +     atomic_add(blks, &sdp->sd_log_blks_needed);
> > +     for (;;) {
> > +             if (current != sdp->sd_logd_process)
> >                       wake_up(&sdp->sd_logd_waitq);
> > -                     did_wait = 1;
> > -                     if (atomic_read(&sdp->sd_log_blks_free) <= wanted)
> > -                             io_schedule();
> > -                     free_blocks = atomic_read(&sdp->sd_log_blks_free);
> > -             } while(free_blocks <= wanted);
> > -             finish_wait(&sdp->sd_log_waitq, &wait);
> > +             io_wait_event(sdp->sd_log_waitq,
> > +                     (free_blocks = atomic_read(&sdp->sd_log_blks_free),
> > +                      free_blocks >= wanted));
> > +             do {
> > +                     if (atomic_try_cmpxchg(&sdp->sd_log_blks_free,
> > +                                            &free_blocks,
> > +                                            free_blocks - blks))
> > +                             goto reserved;
>
> Same here. We need to test these patches with a minimal number of cpus.
>
> > +             } while (free_blocks >= wanted);
> >       }
> > -     if (atomic_cmpxchg(&sdp->sd_log_blks_free, free_blocks,
> > -                             free_blocks - blks) != free_blocks)
> > -             goto retry;
> > -     atomic_sub(blks, &sdp->sd_log_blks_needed);
> > -     trace_gfs2_log_blocks(sdp, -blks);
> >
> > -     /*
> > -      * If we waited, then so might others, wake them up _after_ we get
> > -      * our share of the log.
> > -      */
> > -     if (unlikely(did_wait))
> > +reserved:
> > +     trace_gfs2_log_blocks(sdp, -blks);
> > +     if (atomic_sub_return(blks, &sdp->sd_log_blks_needed))
> >               wake_up(&sdp->sd_log_waitq);
> >  }
> >
> > @@ -1190,7 +1189,6 @@ int gfs2_logd(void *data)
> >       struct gfs2_sbd *sdp = data;
> >       unsigned long t = 1;
> >       DEFINE_WAIT(wait);
> > -     bool did_flush;
> >
> >       while (!kthread_should_stop()) {
> >
> > @@ -1209,12 +1207,10 @@ int gfs2_logd(void *data)
> >                       continue;
> >               }
> >
> > -             did_flush = false;
> >               if (gfs2_jrnl_flush_reqd(sdp) || t == 0) {
> >                       gfs2_ail1_empty(sdp, 0);
> >                       gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
> >                                      GFS2_LFC_LOGD_JFLUSH_REQD);
> > -                     did_flush = true;
> >               }
> >
> >               if (gfs2_ail_flush_reqd(sdp)) {
> > @@ -1223,12 +1219,8 @@ int gfs2_logd(void *data)
> >                       gfs2_ail1_empty(sdp, 0);
> >                       gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
> >                                      GFS2_LFC_LOGD_AIL_FLUSH_REQD);
> > -                     did_flush = true;
> >               }
> >
> > -             if (!gfs2_ail_flush_reqd(sdp) || did_flush)
> > -                     wake_up(&sdp->sd_log_waitq);
> > -
> >               t = gfs2_tune_get(sdp, gt_logd_secs) * HZ;
> >
> >               try_to_freeze();
> > --
> > 2.26.2
> >
> >

Thanks,
Andreas

