Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 16BD7357514
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Apr 2021 21:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617824625;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=p+RRnbsxBOHCvbnIcpSDtShQwbuZzdEL0cA3lmC4pdk=;
	b=XJqMviGtfvYxGRCYU6IV029kKAvRJuqpaF4bvE6CCRT93VWYA4eCF20QEg8zxxq9ebboLC
	pME8328Ch1G0oU7P/sWeR9G3dHa95xnfu9fDz0RM2/uLrvK5ZD+UL7DdLq1rBeGs1qoneQ
	XCm+TvEBGbQUkgytpLMwLcwCSj2dzk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-j54uxHq7OX-Ad2SLwK2Rzg-1; Wed, 07 Apr 2021 15:43:42 -0400
X-MC-Unique: j54uxHq7OX-Ad2SLwK2Rzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A08FE593BF;
	Wed,  7 Apr 2021 19:43:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 748B35D6CF;
	Wed,  7 Apr 2021 19:43:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B14F41C8F;
	Wed,  7 Apr 2021 19:43:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 137JhOnq000786 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 7 Apr 2021 15:43:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D86EEF5AC4; Wed,  7 Apr 2021 19:43:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D32DFF51BF
	for <cluster-devel@redhat.com>; Wed,  7 Apr 2021 19:43:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80CFA104D99A
	for <cluster-devel@redhat.com>; Wed,  7 Apr 2021 19:43:22 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-91-pHVyzKfXMxOgbThEyoyN3w-1; Wed, 07 Apr 2021 15:43:20 -0400
X-MC-Unique: pHVyzKfXMxOgbThEyoyN3w-1
Received: by mail-wr1-f69.google.com with SMTP id u10so5948608wrm.2
	for <cluster-devel@redhat.com>; Wed, 07 Apr 2021 12:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=p+RRnbsxBOHCvbnIcpSDtShQwbuZzdEL0cA3lmC4pdk=;
	b=WraY7Md5P2bCGSBbPtnqnShVfMRdiNyi4RL1/ahczy+haYLtyJ/BH+7TXxeB4L0gG5
	aqmJwGucywNVXIG8pJ+47NiTDJpXBlk5QgvYWUnJny63N2ij1EJirGn5+lSuTeKBuqGF
	Z92h/NFqoNgOIlwcF6kBNJ/bh05CEcrKtEPaOHgwp8VXspx+8LTSkYljrVCk2QBR9CTG
	aEF82RwjXv5p4a36d1HCqF14B7CDrlH6a6gLsw559ldzA2ZAnJ6qqRp9cSM+tOpMjKFT
	Jav6x1z4bo/kJjzHLRurL5NSFtnspbNSg3kTj2zwx4V+phtxrAsMII2hUZz6vykcJb2i
	KxqA==
X-Gm-Message-State: AOAM530bzqgZx3bMLk37Bn9jhNPHgAVawC+Cktws2okbkLUvEmAV9X8n
	Zer8YPcrRJ0yyhd/3/Qc6KAFBv3RX6htCAME7HSbytua2p6ORjWpStGrl9IR+O/BmkA03Ixwvkn
	IHfMml1FMgPULloA6LSFElUhEjFkqwFhAN89KkQ==
X-Received: by 2002:a05:600c:4c95:: with SMTP id
	g21mr4547984wmp.132.1617824599391; 
	Wed, 07 Apr 2021 12:43:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcraCK3HUnkujvLmWQKeMkoWA+2QbG/v5Y+XqOa1N9rberE66eTBorSQzKdP3/UAZz1Cgbupyq0Srlc4AsFmE=
X-Received: by 2002:a05:600c:4c95:: with SMTP id
	g21mr4547971wmp.132.1617824599186; 
	Wed, 07 Apr 2021 12:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210406170949.106524-1-agruenba@redhat.com>
In-Reply-To: <20210406170949.106524-1-agruenba@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 7 Apr 2021 21:43:08 +0200
Message-ID: <CAHc6FU6=EtX7Dq58MHFDypvmFz26YiGx2U7Dgqv5AvpsAEZQ3w@mail.gmail.com>
To: cluster-devel <cluster-devel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Allocate bufdata object before
	taking log lock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 6, 2021 at 7:09 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> Before this patch, functions gfs2_trans_add_{meta,data} would take the
> log lock, then if they needed to allocate a new bufdata object, they
> would drop the lock and reacquire it.  This patch changes it so that if
> there's apparently no bufdata object, it allocates a new one before
> taking the log lock.  After taking the log lock, it checks for conflicts
> and takes measures to resolve the conflict.  This is for performance.
>
> I haven't verified if the page locking in gfs2_trans_add_meta,
> originally introduced in commit 18ec7d5c3f434 ("Make journaled data
> files identical to normal files on disk"), is actually still needed.

This patch is still causing locking issues, so we'll leave it out for now.

> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/gfs2/trans.c | 46 +++++++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 21 deletions(-)
>
> diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
> index 63fec11ef2ce..c50de22d7cbf 100644
> --- a/fs/gfs2/trans.c
> +++ b/fs/gfs2/trans.c
> @@ -171,7 +171,6 @@ static struct gfs2_bufdata *gfs2_alloc_bufdata(struct gfs2_glock *gl,
>         INIT_LIST_HEAD(&bd->bd_list);
>         INIT_LIST_HEAD(&bd->bd_ail_st_list);
>         INIT_LIST_HEAD(&bd->bd_ail_gl_list);
> -       bh->b_private = bd;
>         return bd;
>  }
>
> @@ -193,24 +192,24 @@ void gfs2_trans_add_data(struct gfs2_glock *gl, struct buffer_head *bh)
>  {
>         struct gfs2_trans *tr = current->journal_info;
>         struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
> -       struct gfs2_bufdata *bd;
> +       struct gfs2_bufdata *bd = NULL;
>
>         lock_buffer(bh);
>         if (buffer_pinned(bh)) {
>                 set_bit(TR_TOUCHED, &tr->tr_flags);
>                 goto out;
>         }
> -       gfs2_log_lock(sdp);
> -       bd = bh->b_private;
> -       if (bd == NULL) {
> -               gfs2_log_unlock(sdp);
> +       if (!bh->b_private) {
>                 unlock_buffer(bh);
> -               if (bh->b_private == NULL)
> -                       bd = gfs2_alloc_bufdata(gl, bh);
> -               else
> -                       bd = bh->b_private;
> +               bd = gfs2_alloc_bufdata(gl, bh);
>                 lock_buffer(bh);
> -               gfs2_log_lock(sdp);
> +       }
> +       gfs2_log_lock(sdp);
> +       if (bh->b_private) {
> +               kfree(bd);
> +               bd = bh->b_private;
> +       } else {
> +               bh->b_private = bd;
>         }
>         gfs2_assert(sdp, bd->bd_gl == gl);
>         set_bit(TR_TOUCHED, &tr->tr_flags);
> @@ -230,7 +229,7 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
>  {
>
>         struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
> -       struct gfs2_bufdata *bd;
> +       struct gfs2_bufdata *bd = NULL;
>         struct gfs2_meta_header *mh;
>         struct gfs2_trans *tr = current->journal_info;
>         enum gfs2_freeze_state state = atomic_read(&sdp->sd_freeze_state);
> @@ -240,19 +239,24 @@ void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_head *bh)
>                 set_bit(TR_TOUCHED, &tr->tr_flags);
>                 goto out;
>         }
> -       gfs2_log_lock(sdp);
> -       bd = bh->b_private;
> -       if (bd == NULL) {
> -               gfs2_log_unlock(sdp);
> +       if (!bh->b_private) {
>                 unlock_buffer(bh);
> +               bd = gfs2_alloc_bufdata(gl, bh);
> +               lock_buffer(bh);
> +       }
> +       gfs2_log_lock(sdp);
> +       if (bh->b_private) {
> +               kfree(bd);
> +               bd = bh->b_private;
> +       } else {
>                 lock_page(bh->b_page);
> -               if (bh->b_private == NULL)
> -                       bd = gfs2_alloc_bufdata(gl, bh);
> -               else
> +               if (bh->b_private) {
> +                       kfree(bd);
>                         bd = bh->b_private;
> +               } else {
> +                       bh->b_private = bd;
> +               }
>                 unlock_page(bh->b_page);
> -               lock_buffer(bh);
> -               gfs2_log_lock(sdp);
>         }
>         gfs2_assert(sdp, bd->bd_gl == gl);
>         set_bit(TR_TOUCHED, &tr->tr_flags);
> --
> 2.26.3
>

Thanks,
Andreas

