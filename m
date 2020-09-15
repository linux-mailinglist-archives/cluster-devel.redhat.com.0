Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 246D726AD19
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Sep 2020 21:10:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600196999;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=kSJl/lFEOndHf1NklnBjU/ACYJLT5IifQuxjYpmud9U=;
	b=PgcDtBYBOYWI1lzORl0nXJMEDScCXFKCdEby5VK15F/pwe/7Wz8M2CuqEu0j8tkxR7h9rB
	MyFN+rxUX1J2qubF1ltLGgrcgiklDoOdk6wXLF8s+zTNNsr7mC7LkXJ6GL2exL2Cjhlniv
	wmf3VZ5+wpx1Jt9YkfbsS2wJzTkrQ9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-J7zgYS4GNF6iAzPe4qWttw-1; Tue, 15 Sep 2020 15:09:57 -0400
X-MC-Unique: J7zgYS4GNF6iAzPe4qWttw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B7C6186DD3C;
	Tue, 15 Sep 2020 19:09:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A6B261177;
	Tue, 15 Sep 2020 19:09:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0937D183D020;
	Tue, 15 Sep 2020 19:09:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FJ9rsK015608 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 15:09:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5532C200A4F3; Tue, 15 Sep 2020 19:09:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50B3D200AE6E
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 19:09:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04712800CAF
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 19:09:50 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-252-PugeYoPYPjSg7jGzQPzwXA-1; Tue, 15 Sep 2020 15:09:48 -0400
X-MC-Unique: PugeYoPYPjSg7jGzQPzwXA-1
Received: by mail-wr1-f69.google.com with SMTP id l17so1573347wrw.11
	for <cluster-devel@redhat.com>; Tue, 15 Sep 2020 12:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kSJl/lFEOndHf1NklnBjU/ACYJLT5IifQuxjYpmud9U=;
	b=qUSTA+8Zq8zLg7l8+sfEqS6Dx6f3UfZNZsv7+DgKBgq32DMBfj+GIMeTUMCUm1uPzk
	5O6lmIYwwiDgsCvOEfwWdA/f51F/mmz4eNckwXOk7G0UMMiaF52rsvPyl1Q2IEljZ5ZO
	YeLDea1bc2IKAOPIWkdnHe9REXXwlZ69zRKI/CUKp4A6iiwsYbSJMlRCGLuWXsIMSBUq
	WGdRMKfIUBoNVkkFWiz2+OHoqq1EDlzhPQetVY2mjXtgX2B8hIAsiKUBiIGj7B6s1Z7F
	Eg68Fi66wEhTo5rd5RDmUtvExkEaLfO5zwW1juNLyRAAZ0mgyVZSPPAJOZmMqIqhFz8V
	e8vw==
X-Gm-Message-State: AOAM530k62VX+mlHP9qgUVnWrF+AtaMAjiVqTQJWmXAYBSHAZhs/FIf4
	YmmlxnUdw+xqt5FJvDKCsERXMu8dKXPBjYcOgbGTFlsduONCF9o5EwbzxVoBcbsymGXW8jAFP0h
	oBmSkZBK1oqBnm01mwCrXvaDXUPtO+fXzdqb9bQ==
X-Received: by 2002:a1c:2dcc:: with SMTP id t195mr769714wmt.166.1600196986571; 
	Tue, 15 Sep 2020 12:09:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXtDxYsY9jGGjYHAb/P2qF9NATcrO1ldUd/uD44Y946ZQokUnHKGGkr3E2mdi0cAZneZtesCETYDCzFxU5Mco=
X-Received: by 2002:a1c:2dcc:: with SMTP id t195mr769702wmt.166.1600196986360; 
	Tue, 15 Sep 2020 12:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200915143822.16485-1-rpeterso@redhat.com>
	<20200915143822.16485-5-rpeterso@redhat.com>
In-Reply-To: <20200915143822.16485-5-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 15 Sep 2020 21:09:35 +0200
Message-ID: <CAHc6FU78QGYtLZrgADKYPnWPoBL+2Z2MFu9PdjcgpBBVkQV2hw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 4/5] gfs2: factor out evict code
 related to dinodes we are not deleting
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
> Now that we've factored out the delete-dinode case to simplify gfs2_evict_inode
> we take it a step further and factor out the other case: where we don't
> delete the inode.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/super.c | 51 ++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 18 deletions(-)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 82c79143681a..46260f370090 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -1424,6 +1424,38 @@ static int may_delete_evicted(struct inode *inode, struct gfs2_holder *gh)
>         return -EEXIST;
>  }
>
> +/**
> + * evict_saved_inode - evict an inode whose dinode has not been deleted

Maybe evict_truncate_inode or just evict_inode?

> + * @inode: The inode to evict
> + */
> +static void evict_saved_inode(struct inode *inode)
> +{
> +       struct super_block *sb = inode->i_sb;
> +       struct gfs2_sbd *sdp = sb->s_fs_info;
> +       struct gfs2_inode *ip = GFS2_I(inode);
> +       struct address_space *metamapping;
> +       int ret;
> +
> +       gfs2_log_flush(sdp, ip->i_gl, GFS2_LOG_HEAD_FLUSH_NORMAL |
> +                      GFS2_LFC_EVICT_INODE);
> +       metamapping = gfs2_glock2aspace(ip->i_gl);
> +       if (test_bit(GLF_DIRTY, &ip->i_gl->gl_flags)) {
> +               filemap_fdatawrite(metamapping);
> +               filemap_fdatawait(metamapping);
> +       }
> +       write_inode_now(inode, 1);
> +       gfs2_ail_flush(ip->i_gl, 0);
> +
> +       ret = gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
> +       if (ret)
> +               return;

Should return the error here.


> +
> +       /* Needs to be done before glock release & also in a transaction */
> +       truncate_inode_pages(&inode->i_data, 0);
> +       truncate_inode_pages(metamapping, 0);
> +       gfs2_trans_end(sdp);
> +}
> +
>  /**
>   * gfs2_evict_inode - Remove an inode from cache
>   * @inode: The inode to evict
> @@ -1451,7 +1483,6 @@ static void gfs2_evict_inode(struct inode *inode)
>         struct gfs2_sbd *sdp = sb->s_fs_info;
>         struct gfs2_inode *ip = GFS2_I(inode);
>         struct gfs2_holder gh;
> -       struct address_space *metamapping;
>         int ret;
>
>         if (test_bit(GIF_FREE_VFS_INODE, &ip->i_flags)) {
> @@ -1474,23 +1505,7 @@ static void gfs2_evict_inode(struct inode *inode)
>         goto out_unlock;
>
>  out_truncate:
> -       gfs2_log_flush(sdp, ip->i_gl, GFS2_LOG_HEAD_FLUSH_NORMAL |
> -                      GFS2_LFC_EVICT_INODE);
> -       metamapping = gfs2_glock2aspace(ip->i_gl);
> -       if (test_bit(GLF_DIRTY, &ip->i_gl->gl_flags)) {
> -               filemap_fdatawrite(metamapping);
> -               filemap_fdatawait(metamapping);
> -       }
> -       write_inode_now(inode, 1);
> -       gfs2_ail_flush(ip->i_gl, 0);
> -
> -       ret = gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
> -       if (ret)
> -               goto out_unlock;
> -       /* Needs to be done before glock release & also in a transaction */
> -       truncate_inode_pages(&inode->i_data, 0);
> -       truncate_inode_pages(metamapping, 0);
> -       gfs2_trans_end(sdp);
> +       evict_saved_inode(inode);
>
>  out_unlock:
>         if (gfs2_rs_active(&ip->i_res))
> --
> 2.26.2
>

Thanks,
Andreas

