Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 95BB526AD13
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Sep 2020 21:09:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600196955;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3LmFyB/CxgiFnm8T011XV/Sofv/CcO+acYr3DHaPXw4=;
	b=T5lYTuOXQoboj9aqyra/8OxXf5a24o8bIRpvOoKyfZr6I7YJvFGl9YutozL8jEu5gKwTGC
	1ahqVUEXBGJzeD8nyrBEh8CbOZSomAxudxK6MNnT6JDp4Ogjf/LBdSPgoIdLOAvp/Fs/iV
	xcehxTWQsMQlRJBXfb7+UM0+3nx0pX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-Rj2iw06NPKSXWz5hr82jkw-1; Tue, 15 Sep 2020 15:09:11 -0400
X-MC-Unique: Rj2iw06NPKSXWz5hr82jkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AC6E8014D9;
	Tue, 15 Sep 2020 19:09:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0693B60BE2;
	Tue, 15 Sep 2020 19:09:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6C9E183D022;
	Tue, 15 Sep 2020 19:09:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FJ96NQ015562 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 15:09:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1559A200A4F3; Tue, 15 Sep 2020 19:09:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 109C7200A795
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 19:09:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0C97858280
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 19:09:02 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-483-jFAcprTxOompDyyKswBwcg-1; Tue, 15 Sep 2020 15:09:00 -0400
X-MC-Unique: jFAcprTxOompDyyKswBwcg-1
Received: by mail-wr1-f72.google.com with SMTP id n15so1564276wrv.23
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 12:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3LmFyB/CxgiFnm8T011XV/Sofv/CcO+acYr3DHaPXw4=;
	b=BWdt8Kf9x9kEwKm/ZNOhmgKXuDflVw+k3RfXrB3Nv7jZFn3PkuxlQT4eza/y6gbOze
	TQI4+vi+nUgprZUoZm+z2GUsTonwMsCZmMKjDGUJckcvCcRVx45cxIFlKXMMR2U4vJJ3
	mPEzh24HqiHEpgVI7gD2at/Q/NMRouJot+wI2aM6aFGJ2mFGtC7OEtP7gftED/o0rnhV
	JUxo9nuKi41d+veM2Cb5GKQgcG72uK/rQL/FyiOhVgkjpV3MNwGAryRGfM9DmGMFuWvD
	KMNn9T80O9zPTwSJbGe88kmrIFSExN9HLV3AvEuIIXcyZjT0Li4AR3veDBNkniOq9x0m
	b2Eg==
X-Gm-Message-State: AOAM533C/044+0cxYpuWrdwsaN49cdu9oI1fq89YiUxp6raFW4NkghbV
	vjwLY5tMPvTq/IzmFC3YjsuIITjMua5nUAlhCu21gOy2O6pxHhMGqqnon228kksrwu66f24yA/k
	yHtrdbho9HOuJJuu/yBJMcBXvbVsxNRnKFfVfig==
X-Received: by 2002:a1c:4e02:: with SMTP id g2mr773006wmh.3.1600196939745;
	Tue, 15 Sep 2020 12:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5eo9rAdrRsyoSXG1j79eWn/T8VVg224M0XsuoQ+0T+Fl8GME3PeI+ft1UV2+kXSA/7YNtb4ag8Bj8nt2TrrI=
X-Received: by 2002:a1c:4e02:: with SMTP id g2mr772996wmh.3.1600196939559;
	Tue, 15 Sep 2020 12:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200915143822.16485-1-rpeterso@redhat.com>
	<20200915143822.16485-3-rpeterso@redhat.com>
In-Reply-To: <20200915143822.16485-3-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 15 Sep 2020 21:08:48 +0200
Message-ID: <CAHc6FU7MNY4sMOiLTDJ=g7pFumRs_pWhNWn88Ts_7Ae2DMkpow@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 2/5] gfs2: factor
 delete_evicted_inode out of gfs2_evict_inode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 4:38 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Function gfs2_evict_inode is way too big, complex and unreadable. This is a
> first baby step toward breaking it apart to be more readable. It factors out
> the portion that deletes the online bits for a dinode that is unlinked and
> needs to be deleted. A future patch will factor out more. (If I factor
> out too much, the patch itself becomes unreadable).
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/super.c | 67 +++++++++++++++++++++++++++++--------------------
>  1 file changed, 40 insertions(+), 27 deletions(-)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index ab08b9a1102c..6f9e394d2a2e 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -1310,6 +1310,45 @@ static bool gfs2_upgrade_iopen_glock(struct inode *inode)
>         return true;
>  }
>
> +/**
> + * delete_evicted_inode - delete the pieces of an unlinked evicted inode

The inode is in the process of being evicted, so maybe better call
this function evict_delete_inode?

> + * @inode: The inode to evict
> + */
> +static int delete_evicted_inode(struct inode *inode)
> +{
> +       struct gfs2_inode *ip = GFS2_I(inode);
> +       int ret;
> +
> +       if (S_ISDIR(inode->i_mode) &&
> +           (ip->i_diskflags & GFS2_DIF_EXHASH)) {
> +               ret = gfs2_dir_exhash_dealloc(ip);
> +               if (ret)
> +                       goto out;
> +       }
> +
> +       if (ip->i_eattr) {
> +               ret = gfs2_ea_dealloc(ip);
> +               if (ret)
> +                       goto out;
> +       }
> +
> +       if (!gfs2_is_stuffed(ip)) {
> +               ret = gfs2_file_dealloc(ip);
> +               if (ret)
> +                       goto out;
> +       }
> +
> +       /* We're about to clear the bitmap for the dinode, but as soon as we
> +          do, gfs2_create_inode can create another inode at the same block
> +          location and try to set gl_object again. We clear gl_object here so
> +          that subsequent inode creates don't see an old gl_object. */
> +       glock_clear_object(ip->i_gl, ip);
> +       ret = gfs2_dinode_dealloc(ip);
> +       gfs2_inode_remember_delete(ip->i_gl, ip->i_no_formal_ino);
> +out:
> +       return ret;
> +}
> +
>  /**
>   * gfs2_evict_inode - Remove an inode from cache
>   * @inode: The inode to evict
> @@ -1396,33 +1435,7 @@ static void gfs2_evict_inode(struct inode *inode)
>                         goto out_truncate;
>                 }
>         }
> -
> -       if (S_ISDIR(inode->i_mode) &&
> -           (ip->i_diskflags & GFS2_DIF_EXHASH)) {
> -               ret = gfs2_dir_exhash_dealloc(ip);
> -               if (ret)
> -                       goto out_unlock;
> -       }
> -
> -       if (ip->i_eattr) {
> -               ret = gfs2_ea_dealloc(ip);
> -               if (ret)
> -                       goto out_unlock;
> -       }
> -
> -       if (!gfs2_is_stuffed(ip)) {
> -               ret = gfs2_file_dealloc(ip);
> -               if (ret)
> -                       goto out_unlock;
> -       }
> -
> -       /* We're about to clear the bitmap for the dinode, but as soon as we
> -          do, gfs2_create_inode can create another inode at the same block
> -          location and try to set gl_object again. We clear gl_object here so
> -          that subsequent inode creates don't see an old gl_object. */
> -       glock_clear_object(ip->i_gl, ip);
> -       ret = gfs2_dinode_dealloc(ip);
> -       gfs2_inode_remember_delete(ip->i_gl, ip->i_no_formal_ino);
> +       ret = delete_evicted_inode(inode);
>         goto out_unlock;
>
>  out_truncate:
> --
> 2.26.2
>

Thanks,
Andreas

