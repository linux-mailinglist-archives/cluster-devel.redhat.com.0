Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BC70726AD17
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Sep 2020 21:09:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600196979;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=VbLDliTgSP9rHQZbx38xCpQjpQLY7qJeGMabEXaJQ2o=;
	b=QUxSkgJvxwWmH+JQnrfPYtRvdC+WUJm6cBDhrrp6UaF+hBnaCW/RGx7SsNTCmqBiby5/dR
	qVFHi36n9Xb9FxMPlLslzJ+KOpQxBZM0/ojv9kbneB+j2YQ/JUw6bHfabIM2l6LlkVBmst
	Fv1XlrcAqx063/exXYyddRH61dDNYBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-ZkHU6kQQOB-C80Gc9xijPw-1; Tue, 15 Sep 2020 15:09:37 -0400
X-MC-Unique: ZkHU6kQQOB-C80Gc9xijPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30831425DA;
	Tue, 15 Sep 2020 19:09:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2027D78800;
	Tue, 15 Sep 2020 19:09:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D0788C7AC;
	Tue, 15 Sep 2020 19:09:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FJ9WcX015584 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 15:09:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 22F2E2028CCE; Tue, 15 Sep 2020 19:09:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E8F82026F94
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 19:09:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B309858280
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 19:09:28 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-138-6gc0SyzpOJ-hH8bLaoIA8Q-1; Tue, 15 Sep 2020 15:09:26 -0400
X-MC-Unique: 6gc0SyzpOJ-hH8bLaoIA8Q-1
Received: by mail-wm1-f72.google.com with SMTP id w3so146323wmg.4
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 12:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VbLDliTgSP9rHQZbx38xCpQjpQLY7qJeGMabEXaJQ2o=;
	b=hG7IGF0NOdNsYKR89pqZYJoGTF2CJ5zy0axrV7RSy5gOaI/8NeNFVtxGDgP3F76G1/
	zJ6YCbmaOXmC9hfJyAOuaxyIY9oVVWOe4GDwUhADEkb01gCVby7padmbBu+ukfZEKWmA
	GqsF+aO7P0XMTwrE2SXhjydSaWkmz4c2z/gbmS0Qgor8n0p5xUes/9UN6iK1v5feBAz6
	+on/Xi1m1Cp7xN3w9p0/gCky16fsPNpxZiL4daKfgEmjXaPC3jUcBHnmj3tdQj887q8v
	2Y3sNMtpJ8hN5ej+/cy/WNjZbZ6rcMGmzw0ic/WppyFDRpEjdyBT8a+1wKUpatxjWIxB
	YneA==
X-Gm-Message-State: AOAM531quXgMjlp35zPzwBrNSiyoBaNIKTpIdr45at/O3j2Ntalx4D70
	J6GdKbIn6V0dpCIYBckK1Csvd/t4AyBiYpl/3vQVWfaOJ8upp+Bob+cORS7NyV1oNNxRWlkMxFE
	NZGYXOvhbRG2suh6mu03qQgPEOndllN5XXnbJzQ==
X-Received: by 2002:adf:e391:: with SMTP id e17mr22121945wrm.289.1600196965311;
	Tue, 15 Sep 2020 12:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3q1FczGVg5qAPvEMXdceslq1ZRRfEXcrEqj6E4VEDmUKP7MVBY2eKXZF71ANz9KCPfAXjfsr0jDQGDSLrzIY=
X-Received: by 2002:adf:e391:: with SMTP id e17mr22121925wrm.289.1600196965024;
	Tue, 15 Sep 2020 12:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200915143822.16485-1-rpeterso@redhat.com>
	<20200915143822.16485-4-rpeterso@redhat.com>
In-Reply-To: <20200915143822.16485-4-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 15 Sep 2020 21:09:14 +0200
Message-ID: <CAHc6FU4qQ4WEY70DtEeZTP0vtggwOZZaS3Z93ZJ0WnKoGcKA_g@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 3/5] gfs2: further simplify
 gfs2_evict_inode with new func may_delete_evicted
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 4:38 PM Bob Peterson <rpeterso@redhat.com> wrote:
> This patch further simplifies function gfs2_evict_inode() by adding a new
> function may_delete_evicted(). The function may also lock the inode glock.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/super.c | 115 +++++++++++++++++++++++++++++++-----------------
>  1 file changed, 75 insertions(+), 40 deletions(-)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 6f9e394d2a2e..82c79143681a 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -1350,91 +1350,126 @@ static int delete_evicted_inode(struct inode *inode)
>  }
>
>  /**
> - * gfs2_evict_inode - Remove an inode from cache
> + * may_delete_evicted - determine whether the inode is eligible for deletion

"may_delete_evicted" -> "evict_should_delete"

>   * @inode: The inode to evict
>   *
> - * There are three cases to consider:
> - * 1. i_nlink == 0, we are final opener (and must deallocate)
> - * 2. i_nlink == 0, we are not the final opener (and cannot deallocate)
> - * 3. i_nlink > 0
> + * This function determines whether the evicted inode is eligible to be deleted
> + * and locks the inode glock.
>   *
> - * If the fs is read only, then we have to treat all cases as per #3
> - * since we are unable to do any deallocation. The inode will be
> - * deallocated by the next read/write node to attempt an allocation
> - * in the same resource group
> - *
> - * We have to (at the moment) hold the inodes main lock to cover
> - * the gap between unlocking the shared lock on the iopen lock and
> - * taking the exclusive lock. I'd rather do a shared -> exclusive
> - * conversion on the iopen lock, but we can change that later. This
> - * is safe, just less efficient.
> + * Returns: 1 if the dinode associated with this inode should be deleted
> + *          0 if the dinode should not be deleted, or
> + *          -EEXIST if the decision must be deferred at this time.
>   */
> -
> -static void gfs2_evict_inode(struct inode *inode)
> +static int may_delete_evicted(struct inode *inode, struct gfs2_holder *gh)
>  {
> +       struct gfs2_inode *ip = GFS2_I(inode);
>         struct super_block *sb = inode->i_sb;
>         struct gfs2_sbd *sdp = sb->s_fs_info;
> -       struct gfs2_inode *ip = GFS2_I(inode);
> -       struct gfs2_holder gh;
> -       struct address_space *metamapping;
>         int ret;
>
> -       if (test_bit(GIF_FREE_VFS_INODE, &ip->i_flags)) {
> -               clear_inode(inode);
> -               return;
> -       }
> -
> -       if (inode->i_nlink || sb_rdonly(sb))
> -               goto out;
> -
>         if (test_bit(GIF_ALLOC_FAILED, &ip->i_flags)) {
>                 BUG_ON(!gfs2_glock_is_locked_by_me(ip->i_gl));
> -               gfs2_holder_mark_uninitialized(&gh);
> -               goto out_delete;
> +               gfs2_holder_mark_uninitialized(gh);

The holder is initialized in gfs2_evict_inode now, so this is redundant.

> +               goto may_delete;
>         }
>
>         if (test_bit(GIF_DEFERRED_DELETE, &ip->i_flags))
> -               goto out;
> +               goto defer;
>
>         /* Deletes should never happen under memory pressure anymore.  */
>         if (WARN_ON_ONCE(current->flags & PF_MEMALLOC))
> -               goto out;
> +               goto defer;
>
>         /* Must not read inode block until block type has been verified */
> -       ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, &gh);
> +       ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, gh);
>         if (unlikely(ret)) {
>                 glock_clear_object(ip->i_iopen_gh.gh_gl, ip);
>                 ip->i_iopen_gh.gh_flags |= GL_NOCACHE;
>                 gfs2_glock_dq_uninit(&ip->i_iopen_gh);
> -               goto out;
> +               goto defer;
>         }
>
>         if (gfs2_inode_already_deleted(ip->i_gl, ip->i_no_formal_ino))
> -               goto out_truncate;
> +               goto may_not_delete;
>         ret = gfs2_check_blk_type(sdp, ip->i_no_addr, GFS2_BLKST_UNLINKED);
>         if (ret)
> -               goto out_truncate;
> +               goto may_not_delete;
>
>         if (test_bit(GIF_INVALID, &ip->i_flags)) {
>                 ret = gfs2_inode_refresh(ip);
>                 if (ret)
> -                       goto out_truncate;
> +                       goto may_not_delete;
>         }
>
>         /*
>          * The inode may have been recreated in the meantime.
>          */
>         if (inode->i_nlink)
> -               goto out_truncate;
> +               goto may_not_delete;
>
> -out_delete:
> +may_delete:
>         if (gfs2_holder_initialized(&ip->i_iopen_gh) &&
>             test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
>                 if (!gfs2_upgrade_iopen_glock(inode)) {
>                         gfs2_holder_uninit(&ip->i_iopen_gh);
> -                       goto out_truncate;
> +                       goto may_not_delete;
>                 }
>         }
> +       return 1;
> +
> +may_not_delete:
> +       return 0;

Just return 0 instead of "goto may_not_delete". Same for "goto defer".
Or make this function return an enum with descriptive names; -EEXIST
doesn't really fit, anyway.

> +
> +defer:
> +       return -EEXIST;
> +}
> +
> +/**
> + * gfs2_evict_inode - Remove an inode from cache
> + * @inode: The inode to evict
> + *
> + * There are three cases to consider:
> + * 1. i_nlink == 0, we are final opener (and must deallocate)
> + * 2. i_nlink == 0, we are not the final opener (and cannot deallocate)
> + * 3. i_nlink > 0
> + *
> + * If the fs is read only, then we have to treat all cases as per #3
> + * since we are unable to do any deallocation. The inode will be
> + * deallocated by the next read/write node to attempt an allocation
> + * in the same resource group
> + *
> + * We have to (at the moment) hold the inodes main lock to cover
> + * the gap between unlocking the shared lock on the iopen lock and
> + * taking the exclusive lock. I'd rather do a shared -> exclusive
> + * conversion on the iopen lock, but we can change that later. This
> + * is safe, just less efficient.
> + */
> +
> +static void gfs2_evict_inode(struct inode *inode)
> +{
> +       struct super_block *sb = inode->i_sb;
> +       struct gfs2_sbd *sdp = sb->s_fs_info;
> +       struct gfs2_inode *ip = GFS2_I(inode);
> +       struct gfs2_holder gh;
> +       struct address_space *metamapping;
> +       int ret;
> +
> +       if (test_bit(GIF_FREE_VFS_INODE, &ip->i_flags)) {
> +               clear_inode(inode);
> +               return;
> +       }
> +
> +       if (inode->i_nlink || sb_rdonly(sb))
> +               goto out;
> +
> +       gfs2_holder_mark_uninitialized(&gh);
> +       /* may_delete_evicted also locks the inode glock */

... and maybe upgrades the iopen glock ...

I think the above comment can just go though.


> +       ret = may_delete_evicted(inode, &gh);
> +       if (ret == -EEXIST)
> +               goto out;
> +       if (!ret)
> +               goto out_truncate;
> +
>         ret = delete_evicted_inode(inode);
>         goto out_unlock;
>
> --
> 2.26.2
>

Thanks,
Andreas

