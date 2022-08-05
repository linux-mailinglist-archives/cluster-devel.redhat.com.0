Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2A058AB70
	for <lists+cluster-devel@lfdr.de>; Fri,  5 Aug 2022 15:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659705256;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=grD9S62OWWi7rcrOrVLO5suUNrO5KXwVwRwkMi/FWaE=;
	b=HTkifVNivV2VKcceFjeNy83tNkH4jLqc/+Cxz6myADmur7TOMqG/JykNnCOD7fs7j+9qr6
	AvA1VTdAh35qSDj9sQlkpPEzN+QZq5A586ZG8fAw5NPUynnnUeHT5t7dLbk1LsiLzeq7Cu
	zueDRGE3kYe1p2NWPpKNAyi1dXX49FM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-K3TdLoxTOa2219wAfMJGvw-1; Fri, 05 Aug 2022 09:14:11 -0400
X-MC-Unique: K3TdLoxTOa2219wAfMJGvw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16FCF3C1014F;
	Fri,  5 Aug 2022 13:14:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8268F492C3B;
	Fri,  5 Aug 2022 13:14:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B5FAC1946A65;
	Fri,  5 Aug 2022 13:14:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 19CA51946A5F for <cluster-devel@listman.corp.redhat.com>;
 Fri,  5 Aug 2022 13:14:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 06F372166B2A; Fri,  5 Aug 2022 13:14:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 033A72166B26
 for <cluster-devel@redhat.com>; Fri,  5 Aug 2022 13:14:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAAC9299E745
 for <cluster-devel@redhat.com>; Fri,  5 Aug 2022 13:14:01 +0000 (UTC)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-qYG0IDD6PnWm84l1kJSVxw-1; Fri, 05 Aug 2022 09:14:00 -0400
X-MC-Unique: qYG0IDD6PnWm84l1kJSVxw-1
Received: by mail-pg1-f197.google.com with SMTP id
 21-20020a630015000000b0041b022ba974so1289712pga.9
 for <cluster-devel@redhat.com>; Fri, 05 Aug 2022 06:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=grD9S62OWWi7rcrOrVLO5suUNrO5KXwVwRwkMi/FWaE=;
 b=jecQ9y0WRYp+KDMOsfKN4Nk5WynkHpzvlXhzjbZc2RMxg5OYgIf85ncRrpMZoKeZlZ
 13XjhZnv0PBF+PUe1gwH2Q34zi38w4v1P7XgQ0xHT6iJ86ET541Y6NfLbpx3rqeTIem2
 VL8UXjs5HGBAyCXIVPgraxPCoZrahIQgrNkYpR2g3baoGDAwx6+299sQX63ZVXqxwRw/
 cxiY91bF4nKAWgwiJhNV/m4Zxxi+1NAlD+rpU07Am6xgQZ4Elffslix9H5K9mLuGlGfF
 zgeWUHisQDRcKtsIz5+f7E/NpXR8+oe5OZzFSrh8hIYmbxXX7Z9oy7S2jFDOVIlZZhso
 8O3w==
X-Gm-Message-State: ACgBeo3F3jtVqSPxL5wVYPV3vIOa1vdG2dcif0A3d77jwkVWlMbR7QMW
 F/Li5LlYYQsiBt0XwtMTDwtySJzQJ8hcOqzMMktoxAewA748pn9JghwSbYZIpopGcb1KPE/vAGj
 9Gv9J5VT3YpMqXIWaeYnLDZz7HyA3m0MxS3t+BA==
X-Received: by 2002:a17:902:f70c:b0:16d:20ef:7e42 with SMTP id
 h12-20020a170902f70c00b0016d20ef7e42mr6848385plo.54.1659705238711; 
 Fri, 05 Aug 2022 06:13:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ui9FKw9cTL83iCuM9QCzCEfZ7fg+fqYjjFtBP/iNo0SzzlhhIWGP5A5OXK61ANAQF5qKBbzOWwFqZ9Pc0IFE=
X-Received: by 2002:a17:902:f70c:b0:16d:20ef:7e42 with SMTP id
 h12-20020a170902f70c00b0016d20ef7e42mr6848366plo.54.1659705238363; Fri, 05
 Aug 2022 06:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220802175811.438067-1-rpeterso@redhat.com>
 <20220802175811.438067-4-rpeterso@redhat.com>
In-Reply-To: <20220802175811.438067-4-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 5 Aug 2022 15:13:46 +0200
Message-ID: <CAHc6FU7g+K8niGa+gSNwWHkpJx+WS4Si6ejHx=bM1NweFUMB4w@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 3/3] gfs2: Clear GLF_LOCK when withdraw
 prevents xmote
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Bob,

On Tue, Aug 2, 2022 at 7:58 PM Bob Peterson <rpeterso@redhat.com> wrote:
> There are a couple places in function do_xmote where normal processing
> is circumvented due to withdraws in progress. However, since we bypass
> most of do_xmote() we bypass telling dlm to lock the dlm lock, which
> means dlm will never respond with a completion callback. Since the
> completion callback ordinarily clears GLF_LOCK, this patch changes
> function do_xmote to handle those situations more gracefully so the
> file system may be unmounted after withdraw.
>
> A very similar situation happens with the GLF_DEMOTE_IN_PROGRESS flag,
> which is cleared by function finish_xmote(). Since the withdraw causes
> us to skip the majority of do_xmote, it therefore also skips the call
> to finish_xmote() so the DEMOTE_IN_PROGRESS flag needs to be cleared
> manually as well.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/glock.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index 0bfecffd71f1..d508d8fa0838 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -59,6 +59,8 @@ typedef void (*glock_examiner) (struct gfs2_glock * gl);
>
>  static void do_xmote(struct gfs2_glock *gl, struct gfs2_holder *gh, unsigned int target);
>  static void __gfs2_glock_dq(struct gfs2_holder *gh);
> +static void handle_callback(struct gfs2_glock *gl, unsigned int state,
> +                           unsigned long delay, bool remote);
>
>  static struct dentry *gfs2_root;
>  static struct workqueue_struct *glock_workqueue;
> @@ -762,8 +764,21 @@ __acquires(&gl->gl_lockref.lock)
>         int ret;
>
>         if (target != LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl) &&
> -           gh && !(gh->gh_flags & LM_FLAG_NOEXP))
> +           gh && !(gh->gh_flags & LM_FLAG_NOEXP)) {
> +               /*
> +                * We won't tell dlm to perform the lock, so we won't get a
> +                * reply that would otherwise clear GLF_LOCK. So we clear it.
> +                */
> +               handle_callback(gl, LM_ST_UNLOCKED, 0, false);
> +               clear_bit(GLF_LOCK, &gl->gl_flags);
> +               clear_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags);
> +               /*
> +                * Don't increment lockref here. The next time the worker runs it will do
> +                * glock_put, which will decrement it to 0, and free the glock.
> +                */

I don't understand the reference counting logic here: where's the
alleged reference coming from that we're passing on to the work
function here?

Note that further below in do_xmote(), we're calling gfs2_glock_hold()
followed by gfs2_glock_queue_work(), so the reference counting logic
seems normal there -- except that when ->lm_lock returns an error,
we're apparently leaking a reference. So maybe the gfs2_glock_hold()
should be moved right in front of the gfs2_glock_queue_work() calls to
make the code less fragile?

> +               __gfs2_glock_queue_work(gl, GL_GLOCK_DFT_HOLD);
>                 return;
> +       }
>         lck_flags &= (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
>                       LM_FLAG_PRIORITY);
>         GLOCK_BUG_ON(gl, gl->gl_state == target);
> @@ -848,6 +863,8 @@ __acquires(&gl->gl_lockref.lock)
>             (target != LM_ST_UNLOCKED ||
>              test_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags))) {
>                 if (!is_system_glock(gl)) {
> +                       clear_bit(GLF_LOCK, &gl->gl_flags);
> +                       clear_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags);
>                         gfs2_glock_queue_work(gl, GL_GLOCK_DFT_HOLD);
>                         goto out;
>                 } else {
> --
> 2.36.1
>

Thanks,
Andreas

