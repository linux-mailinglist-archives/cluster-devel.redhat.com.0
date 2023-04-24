Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E94BA6ECFFF
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 16:09:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682345360;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rrYRFX8msQfcSgt3bWYNFz3Mu87m/A3Ec4BRJpqHLHk=;
	b=Xgv1SUzz0aPXeY1TP7xCeUwymmEvVqJXsmriL5U/qxR585ElNCp+8ytWNby3g/pqcWVlSj
	fX6OWgxGp60gzOsSzD7DmFjhKgdIRmVoEWn3sOuxRZSZgX40VpSAVQQ+DTa7OoLRsWhCU9
	i+9B+qx11muhuGB3S8gta0pAXFJsR5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-cM4YBCXPNem-DnXV9mPHgA-1; Mon, 24 Apr 2023 10:09:11 -0400
X-MC-Unique: cM4YBCXPNem-DnXV9mPHgA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9940185A7A5;
	Mon, 24 Apr 2023 14:09:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACC4F1121318;
	Mon, 24 Apr 2023 14:09:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7082E194658F;
	Mon, 24 Apr 2023 14:09:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8EB1E1946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 14:09:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6E4941427AE4; Mon, 24 Apr 2023 14:09:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 663DC1427AE5
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 14:09:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AC8385C073
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 14:09:09 +0000 (UTC)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-55PuuzmRMyeNu1RVamKsdg-1; Mon, 24 Apr 2023 10:09:03 -0400
X-MC-Unique: 55PuuzmRMyeNu1RVamKsdg-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1a81e92ba00so30658515ad.2
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 07:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682345341; x=1684937341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rrYRFX8msQfcSgt3bWYNFz3Mu87m/A3Ec4BRJpqHLHk=;
 b=GsTt2Nv85xWI28JvdWCqR6KnnLysfUpE5DkFHMQYdTWYQokqANCMX5QULmCYSyogeB
 lakC5QVDAuaDEewMcJoopT6cQg7wCXPLzRm//IN1ayNesPdsWXjgDi6xoaf+/zwhLL/4
 T1JB71KWslXj8QrNOAsQubpmT23YEKn+ISrSrL8V0TvmOgskQI27dAc8sIUkzWtmS7Xf
 smFPd/S7Rc43sEfeOVcCFli65DeRChSjNKmPl9ftKTYyr9ZQ9KRwQ7YpqV/Y9x3B/O8r
 fyUZ7Ycoq/IABU7JQiKKo4NGI7D2n7wplk5wZPfAyrk8KCRhK72dUFNY0LB6y5SKSMn4
 PMWw==
X-Gm-Message-State: AC+VfDzMq9x9zgARiviY9ECvt6oPPXok9bZDz1GzA9i34C/0/lwezzGT
 ucEQKGgkf5Y3IKCRY9YIooezzm5MGcZeLVLGB5Fd6GhjIXkxStmaYiHUY4S/fsJ08ENwyXFtIvi
 whOGUN45FiOP8iB00aqnm0fz2FGWvVsCeQrx9lRvrQ0K/lntG
X-Received: by 2002:a17:902:db08:b0:1a9:7ffb:87bb with SMTP id
 m8-20020a170902db0800b001a97ffb87bbmr1944952plx.13.1682345341110; 
 Mon, 24 Apr 2023 07:09:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ57UTyTJiVzhSfIL9aj+gmp1VUfzuXvOvKrcOxpmjmx5BgFWVj3Htf+AlQo1CSGRh12wp56TGAV4Lr6oUGS4fs=
X-Received: by 2002:a17:902:db08:b0:1a9:7ffb:87bb with SMTP id
 m8-20020a170902db0800b001a97ffb87bbmr1944927plx.13.1682345340770; Mon, 24 Apr
 2023 07:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230421190710.397684-1-rpeterso@redhat.com>
 <20230421190710.397684-3-rpeterso@redhat.com>
In-Reply-To: <20230421190710.397684-3-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 24 Apr 2023 16:08:49 +0200
Message-ID: <CAHc6FU5z1T7+XpDKr3jPxNnG7FtgWxw-gaHi+QvXZUQp-+s_9A@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [GFS2 PATCH 2/4] gfs2: Perform second log flush
 in gfs2_make_fs_ro
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 9:07=E2=80=AFPM Bob Peterson <rpeterso@redhat.com> =
wrote:
> Before this patch function gfs2_make_fs_ro called gfs2_log_flush once to
> finalize the log. However, if there's dirty metadata, log flushes tend
> to sync the metadata and formulate revokes. Before this patch, those
> revokes may not be written out to the journal immediately, which meant
> unresolved glocks could still have revokes in their ail lists. When the
> glock worker runs, it tries to transition the glock, but the unresolved
> revokes in the ail still need to be written, so it tries to start a
> transaction. It's impossible to start a transaction because at that
> point the GFS2_LOG_HEAD_FLUSH_SHUTDOWN has been set by gfs2_make_fs_ro.

Do you mean that at that point, the SDF_JOURNAL_LIVE flag has already
been cleared?

> That cause the glock worker to get an error, and unable to write the
> revokes. The calling sequence looked something like this:
>
> gfs2_make_fs_ro
>    gfs2_log_flush - with GFS2_LOG_HEAD_FLUSH_SHUTDOWN flag set
>         if (flags & GFS2_LOG_HEAD_FLUSH_SHUTDOWN)
>                 clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
> ...meanwhile...
> glock_work_func
>    do_xmote
>       rgrp_go_sync (or possibly inode_go_sync)
>          ...
>          gfs2_ail_empty_gl
>             __gfs2_trans_begin
>                if (unlikely(!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags)))=
 {
>                ...
>                   return -EROFS;
>
> The previous patch in the series ("gfs2: return errors from
> gfs2_ail_empty_gl") now causes the transaction error to no longer be
> ignored, so it causes a warning from MOST of the xfstests:
>
> WARNING: CPU: 11 PID: X at fs/gfs2/super.c:603 gfs2_put_super [gfs2]
>
> which corresponds to:
>
> WARN_ON(gfs2_withdrawing(sdp));
>
> The withdraw was triggered silently from do_xmote by:
>
>         if (unlikely(sdp->sd_log_error && !gfs2_withdrawn(sdp)))
>                 gfs2_withdraw_delayed(sdp);
>
> This patch adds a second log_flush to gfs2_make_fs_ro: one to sync the
> data and one to sync any outstanding revokes and finalize the journal.
> Note that both of these log flushes need to be "special," in other
> words, not GFS2_LOG_HEAD_FLUSH_NORMAL.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/super.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index a83fa62106f0..5eed8c237500 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -552,6 +552,15 @@ void gfs2_make_fs_ro(struct gfs2_sbd *sdp)
>                 gfs2_quota_sync(sdp->sd_vfs, 0);
>                 gfs2_statfs_sync(sdp->sd_vfs, 0);
>
> +               /* We do two log flushes here. The first one commits dirt=
y inodes
> +                * and rgrps to the journal, but queues up revokes to the=
 ail list.
> +                * The second flush writes out and removes the revokes.
> +                *
> +                * The first must be done before the FLUSH_SHUTDOWN code
> +                * clears the LIVE flag, otherwise it will not be able to=
 start
> +                * a transaction to write its revokes, and the error will=
 cause
> +                * a withdraw of the file system. */
> +               gfs2_log_flush(sdp, NULL, GFS2_LFC_MAKE_FS_RO);
>                 gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
>                                GFS2_LFC_MAKE_FS_RO);
>                 wait_event_timeout(sdp->sd_log_waitq,
> --
> 2.39.2
>

Thanks,
Andreas

