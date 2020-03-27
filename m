Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 999B019608B
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Mar 2020 22:38:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585345131;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ENZCLVGOACVk9Dm3oCetJfrvTGyvS1geprhScmoJP54=;
	b=PIhqlb8uGn9RIB0nrK5DvfP+7n3JZO00xPklG5GURsiJwD9t5SrFYxcsSNdW8P+XOAJdMg
	I8QmwIq+ydDd4va3KudyXWvOrm4oDjONfxHoj/2pZT6tP22nbULb07BjhNjMu442sCVun0
	czW95Wdz8gU92wLNuU0QTFq/RkAZy7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-b6cPinBEN_mYoauh36jXCw-1; Fri, 27 Mar 2020 17:38:49 -0400
X-MC-Unique: b6cPinBEN_mYoauh36jXCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E77F01005509;
	Fri, 27 Mar 2020 21:38:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D2015C1C3;
	Fri, 27 Mar 2020 21:38:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3303F18089CD;
	Fri, 27 Mar 2020 21:38:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RLcagk023029 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 17:38:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38A112166B2C; Fri, 27 Mar 2020 21:38:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3518B2166B2B
	for <cluster-devel@redhat.com>; Fri, 27 Mar 2020 21:38:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6FA3800260
	for <cluster-devel@redhat.com>; Fri, 27 Mar 2020 21:38:33 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
	[209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-464-ZHs50Rp-NOyrOIc88UGVwA-1; Fri, 27 Mar 2020 17:38:31 -0400
X-MC-Unique: ZHs50Rp-NOyrOIc88UGVwA-1
Received: by mail-ot1-f69.google.com with SMTP id a3so8776474oti.11
	for <cluster-devel@redhat.com>; Fri, 27 Mar 2020 14:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jIHndsuizGKw7xUhYx37IgOszbHekHX4DFz5AhaWnPc=;
	b=ZCoIJZ+Lj4ubXoGE4b/NMICGlVlalkF/C3x9nrngBopKZoGmJELFuWjrzOR6sVMhdT
	Md6R3Ttym3HsILoGtuPHhB9Y5Wy04N6UMqoMOGcj9ZGJXZ+Il+FubIteHZu9nIHOAGgY
	kV2nFH+Flvs0TzJUlbawbk6HF1h+GZ6JyEqCqVX4s4o2X/2S2nCkc/QKRDhakCTDxfUt
	XbPz+UzE9G3rc8zslTXhVa475b4vyHinm9WHkzjGWf4gdv3o8TCqZN4x0shPX7rEkE7e
	+rNlOTPFR+3VQHGqcW7ta9XYYYVK5XIvjT8S9u2c6yncXDIDiZWqBGzOzHs0moYqQprZ
	IA2A==
X-Gm-Message-State: ANhLgQ0fJboGmiFL2o5TsLTVpyVjHwy23W5IwIzZUHTqGrBfN6KjP2xg
	2Uzh9QlMBxOdutJghEb+w3ol7o6kTkEzzaKgR6XCHt0USij9+l3smgwMDyWL5PKaB8bf1PttU3A
	5eoo7dhKICCpecAu1ObtjYq4O4YAupX55eyj6aA==
X-Received: by 2002:aca:5712:: with SMTP id l18mr718895oib.178.1585345110554; 
	Fri, 27 Mar 2020 14:38:30 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvkXh76x0nIb84O6Oe3zm/G4NK43RRb0K6R8ZiM7ezDJeh+E2/HRp3Ve2Zg5PM4YVTsXYvafz9yuevR4gtiYoo=
X-Received: by 2002:aca:5712:: with SMTP id l18mr718879oib.178.1585345110214; 
	Fri, 27 Mar 2020 14:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200326184020.123544-1-rpeterso@redhat.com>
	<20200326184020.123544-5-rpeterso@redhat.com>
In-Reply-To: <20200326184020.123544-5-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 27 Mar 2020 22:38:19 +0100
Message-ID: <CAHc6FU7Dm=RK2+bqxN8hpA0eW7_QSkPs6Nc_aqOH8XW2UcvMvg@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02RLcagk023029
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 4/5] gfs2: special log flush
 sequence to protect jdata writes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bob,

On Thu, Mar 26, 2020 at 7:40 PM Bob Peterson <rpeterso@redhat.com> wrote:
> This patch implements Ben Marzinkski's idea of using two locks
> as different layers of protection inside the gfs2_log_flush.
> To quote Ben:

this is all looking rather promising, but could you please describe
what problem this and the next patch are supposed to fix, and why this
approach achieves that?

>   You would need two locks, the regular log lock [sd_log_flush_lock],
>   and the updating log lock [sd_log_updating_lock]. Calling
>   gfs2_log_flush would grab and later release the updating log lock,
>   just like it currently grabs and releases sd_log_flush_lock.
>
>   Everything else that currently grabs sd_log_flush_lock, like
>   gfs2_log_reserve(), would grab the regular log lock instead.
>   (No changes if we define regular log lock =3D=3D log_flush_lock.
>
>   In a normal log flush, you would grab the regular log lock
>   [log_flush_lock], call gfs2_log_flush, which would grab and
>   later release the updating log lock, and after it returned,
>   drop the regular log lock. In this case, the two locks would
>   both lock basically the same code.
>
>   For syncs [that] don't care if new data is written after the
>   call to sync, you could do the same as rhel7 gfs2_meta_syncfs()
>   [did in RHEL7], grabbing the regular log lock [gfs2_log_flush_lock]
>   before each of the calls to gfs_log_flush(), and dropping after
>   each return. Again, the two locks would basically lock the
>   same code.
>
>   For syncs where you need to be sure that no new data is coming
>   in, like freezes and shutdowns, you need to grab the regular
>   log lock, call gfs2_log_flush(), clean out the active items list
>   like [rhel7's] gfs2_meta_syncfs() does, and then call
>   gfs2_log_flush again, this time with the freeze or shutdown type.
>
>   Only after both gfs2_log_flush() calls can you drop the regular
>   log lock. This would mean that when you are writing out the
>   active items in these syncing flushes, only the regular log lock
>   would be held. This is the only time you will be holding one
>   lock and not the other.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/incore.h     |  1 +
>  fs/gfs2/log.c        | 77 ++++++++++++++++++++++++++++----------------
>  fs/gfs2/ops_fstype.c |  1 +
>  3 files changed, 52 insertions(+), 27 deletions(-)
>
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index 84a824293a78..129cf8582a0a 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -834,6 +834,7 @@ struct gfs2_sbd {
>         int sd_log_idle;
>
>         struct rw_semaphore sd_log_flush_lock;
> +       struct rw_semaphore sd_log_updating_lock;
>         atomic_t sd_log_in_flight;
>         struct bio *sd_log_bio;
>         wait_queue_head_t sd_log_flush_wait;
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index 2abec43ae898..5371af3cd96c 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -876,6 +876,30 @@ static void ail_drain(struct gfs2_sbd *sdp)
>         spin_unlock(&sdp->sd_ail_lock);
>  }
>
> +static void gfs2_meta_syncfs(struct gfs2_sbd *sdp, u32 flags)
> +{
> +       if (!sdp->sd_log_idle) {
> +               for (;;) {
> +                       gfs2_ail1_start(sdp);
> +                       gfs2_ail1_wait(sdp);
> +                       if (gfs2_ail1_empty(sdp, 0))
> +                               break;
> +               }
> +               if (gfs2_withdrawn(sdp))
> +                       return;
> +               atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreser=
ved
> +                                                      buffer */
> +               trace_gfs2_log_blocks(sdp, -1);
> +               log_write_header(sdp, flags);
> +               sdp->sd_log_head =3D sdp->sd_log_flush_head;
> +       }
> +       if (flags & (GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
> +                    GFS2_LOG_HEAD_FLUSH_FREEZE))
> +               gfs2_log_shutdown(sdp);
> +       if (flags & GFS2_LOG_HEAD_FLUSH_FREEZE)
> +               atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
> +}
> +
>  /**
>   * gfs2_log_flush - flush incore transaction(s)
>   * @sdp: the filesystem
> @@ -884,13 +908,13 @@ static void ail_drain(struct gfs2_sbd *sdp)
>   *
>   */
>
> -void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 fla=
gs)
> +static void __gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl=
,
> +                            u32 flags)
>  {
>         struct gfs2_trans *tr =3D NULL;
>         enum gfs2_freeze_state state =3D atomic_read(&sdp->sd_freeze_stat=
e);
>
> -       down_write(&sdp->sd_log_flush_lock);
> -
> +       down_write(&sdp->sd_log_updating_lock);
>         /*
>          * Do this check while holding the log_flush_lock to prevent new
>          * buffers from being added to the ail via gfs2_pin()
> @@ -900,7 +924,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2=
_glock *gl, u32 flags)
>
>         /* Log might have been flushed while we waited for the flush lock=
 */
>         if (gl && !test_bit(GLF_LFLUSH, &gl->gl_flags)) {
> -               up_write(&sdp->sd_log_flush_lock);
> +               up_write(&sdp->sd_log_updating_lock);
>                 return;
>         }
>         trace_gfs2_log_flush(sdp, 1, flags);
> @@ -963,28 +987,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs=
2_glock *gl, u32 flags)
>         spin_unlock(&sdp->sd_ail_lock);
>         gfs2_log_unlock(sdp);
>
> -       if (!(flags & GFS2_LOG_HEAD_FLUSH_NORMAL)) {
> -               if (!sdp->sd_log_idle) {
> -                       for (;;) {
> -                               gfs2_ail1_start(sdp);
> -                               gfs2_ail1_wait(sdp);
> -                               if (gfs2_ail1_empty(sdp, 0))
> -                                       break;
> -                       }
> -                       if (gfs2_withdrawn(sdp))
> -                               goto out;
> -                       atomic_dec(&sdp->sd_log_blks_free); /* Adjust for=
 unreserved buffer */
> -                       trace_gfs2_log_blocks(sdp, -1);
> -                       log_write_header(sdp, flags);
> -                       sdp->sd_log_head =3D sdp->sd_log_flush_head;
> -               }
> -               if (flags & (GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
> -                            GFS2_LOG_HEAD_FLUSH_FREEZE))
> -                       gfs2_log_shutdown(sdp);
> -               if (flags & GFS2_LOG_HEAD_FLUSH_FREEZE)
> -                       atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
> -       }
> -
>  out:
>         if (gfs2_withdrawn(sdp)) {
>                 ail_drain(sdp); /* frees all transactions */
> @@ -992,11 +994,32 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gf=
s2_glock *gl, u32 flags)
>         }
>
>         trace_gfs2_log_flush(sdp, 0, flags);
> -       up_write(&sdp->sd_log_flush_lock);
> +       up_write(&sdp->sd_log_updating_lock);
>
>         kfree(tr);
>  }
>
> +void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 fla=
gs)
> +{
> +       u32 normal =3D 0;
> +
> +       down_write(&sdp->sd_log_flush_lock);
> +       if (flags & GFS2_LOG_HEAD_FLUSH_NORMAL)
> +               goto normal_flush;
> +
> +       normal =3D flags & ~(GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
> +                          GFS2_LOG_HEAD_FLUSH_FREEZE |
> +                          GFS2_LOG_HEAD_FLUSH_SYNC);
> +       normal |=3D GFS2_LOG_HEAD_FLUSH_NORMAL;
> +       __gfs2_log_flush(sdp, NULL, normal);
> +
> +       gfs2_meta_syncfs(sdp, flags);
> +
> +normal_flush:
> +       __gfs2_log_flush(sdp, gl, flags);
> +       up_write(&sdp->sd_log_flush_lock);
> +}
> +
>  /**
>   * gfs2_merge_trans - Merge a new transaction into a cached transaction
>   * @old: Original transaction to be expanded
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 1aeb591bfd28..11a3a471124c 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -133,6 +133,7 @@ static struct gfs2_sbd *init_sbd(struct super_block *=
sb)
>         INIT_LIST_HEAD(&sdp->sd_ail2_list);
>
>         init_rwsem(&sdp->sd_log_flush_lock);
> +       init_rwsem(&sdp->sd_log_updating_lock);
>         atomic_set(&sdp->sd_log_in_flight, 0);
>         atomic_set(&sdp->sd_reserving_log, 0);
>         init_waitqueue_head(&sdp->sd_reserving_log_wait);
> --
> 2.25.1
>

Thanks,
Andreas


