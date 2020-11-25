Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B74372C4671
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Nov 2020 18:08:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606324090;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=p2PGRXZgV/ejQIOQcfce/yzMdEs6U9sjGuERYZEB2bU=;
	b=E/Ld39xuNJxs+a4MRL3/WAqP/7/UrDKEWO+HdPJlXE7enkWM/mr8Jcgc6Z4rSazDqmMo9k
	oaVOgA2YmAmSPB3hSGt5LlJ7SQMSevKL/9J1qzxo6lsPPgMSOYBmLvB2aOfoQbP/aNXEXZ
	dXy/K++QNHwcIfqeWceis/zA8ontHfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-ygXZawMrOiamODsbyUjnXQ-1; Wed, 25 Nov 2020 12:08:06 -0500
X-MC-Unique: ygXZawMrOiamODsbyUjnXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8218C420F5;
	Wed, 25 Nov 2020 17:08:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7090C189B8;
	Wed, 25 Nov 2020 17:08:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 062F8180954D;
	Wed, 25 Nov 2020 17:08:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APH81wT010969 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 12:08:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 87B4C2166B29; Wed, 25 Nov 2020 17:08:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82E482166B27
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 17:07:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA1FE8007D9
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 17:07:58 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-435-q9LaX3gZMVixYvfduprJWA-1; Wed, 25 Nov 2020 12:07:56 -0500
X-MC-Unique: q9LaX3gZMVixYvfduprJWA-1
Received: by mail-wr1-f69.google.com with SMTP id p18so1003099wro.9
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 09:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p2PGRXZgV/ejQIOQcfce/yzMdEs6U9sjGuERYZEB2bU=;
	b=FymY14IxQZejLY4sl9JDrtGgsLyOhTqFWdqoreQRMFEJRSpgDZESTFKlmtDvcDRhto
	/iOQoM85SeGKfDOs2JUcFhJrCPDN4PJizShQyw9VM9FdzolLoU1aTiei4kp3MofSWLcW
	xE6ztIi03hTqTEW65xfln0UQeYIaOcQM7LEaS1bHh/JZQqFV3dIaAShOUYQn7OltnZA6
	OQjUNww6R+9ECC4TMCSvzmTVIV+MAtjzNUiY2FHOFhu5qPP3w3W4iHR+MIfNWMzrUSq4
	/2dXKAAQ04YZpwjKcwJu3ayORGYRKotE0sxF9daTBMqTBX1Z+yY8aghxxcigtBNx1be3
	FdcA==
X-Gm-Message-State: AOAM5336Oa0SY8fV0SEvXmB3zSMNDEOgdJ/Wl7TCJtk/KOdFaOuz/Mf+
	JR3eANbjk2l9FrsaNTCuBPzrOgJ3zWSAWsdXcI3rBD1AnPxIRt5jVh4btmFhryc21PlVi+EMZ5n
	DN10TTth7AzJWPTvM6vXPhZvOdzxwgRJycG3gmQ==
X-Received: by 2002:a7b:c145:: with SMTP id z5mr4968142wmi.164.1606324074890; 
	Wed, 25 Nov 2020 09:07:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwf3XLxWhmbSicXw722zZqSERUqCXp/b/RcDVFrTGstdTyMtNwl9Dup8stVE42W/OowqDsiFy89thLH9aIPYEA=
X-Received: by 2002:a7b:c145:: with SMTP id z5mr4968126wmi.164.1606324074654; 
	Wed, 25 Nov 2020 09:07:54 -0800 (PST)
MIME-Version: 1.0
References: <355304031.29450600.1606249586453.JavaMail.zimbra@redhat.com>
	<1409715771.29450602.1606249609812.JavaMail.zimbra@redhat.com>
In-Reply-To: <1409715771.29450602.1606249609812.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 25 Nov 2020 18:07:43 +0100
Message-ID: <CAHc6FU5sQf2g6NKQUmbAZDswvyDcOGvn-tAdm7Tkq_Mh-rzoDw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Remove sb_start_write from
	gfs2_statfs_sync
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Bob,

On Tue, Nov 24, 2020 at 9:27 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, function gfs2_statfs_sync called sb_start_write. This is a
> violation of the basic vfs rules that state that sb_start_write should always
> be taken before s_umount. See this document:
>
> https://www.kernel.org/doc/htmldocs/filesystems/API-sb-start-write.html
>
> "Since freeze protection behaves as a lock, users have to preserve
> ordering of freeze protection and other filesystem locks. Generally,
> freeze protection should be the outermost lock. In particular, we have:
>
> sb_start_write -> i_mutex (write path, truncate, directory ops, ...) ->
> s_umount (freeze_super, thaw_super)"
>
> deactivate_super
>    down_write(&s->s_umount); <------------------------------------ s_umount
>    deactivate_locked_super
>       gfs2_kill_sb
>          kill_block_super
>             generic_shutdown_super
>                gfs2_put_super
>                   gfs2_make_fs_ro
>                      gfs2_statfs_sync(sdp->sd_vfs, 0);
>                         sb_start_write <--------------------- sb_start_write
>
> As far as I can tell, gfs2_statfs_sync doesn't need to call sb_start_write
> any more than any other write to the file system, which are policed by glocks.
> None of the other functions in gfs2 lock sb_start_write so it only affects
> how vfs calls gfs2.

you're quite right that the sb_start_write doesn't make sense in the
above code path. That was equally true when the call was added in
commit 2e60d7683c8d2 ("GFS2: update freeze code to use
freeze/thaw_super on all nodes"), so I'm wondering what the intention
may have been here. Are there any code paths not going through the vfs
that need protection from filesystem freezes?

I'll leave this patch out for now, at least until it's more obvious
what's going on exactly.

> This patch simply removes the call to sb_start_write.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/super.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index b3d951ab8068..2f56acc41c04 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -353,7 +353,6 @@ int gfs2_statfs_sync(struct super_block *sb, int type)
>         struct buffer_head *m_bh, *l_bh;
>         int error;
>
> -       sb_start_write(sb);
>         error = gfs2_glock_nq_init(m_ip->i_gl, LM_ST_EXCLUSIVE, GL_NOCACHE,
>                                    &gh);
>         if (error)
> @@ -392,7 +391,6 @@ int gfs2_statfs_sync(struct super_block *sb, int type)
>  out_unlock:
>         gfs2_glock_dq_uninit(&gh);
>  out:
> -       sb_end_write(sb);
>         return error;
>  }
>

Thanks,
Andreas

