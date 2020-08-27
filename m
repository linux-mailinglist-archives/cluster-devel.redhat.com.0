Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E5878253D57
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 08:00:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598508049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Ra82U5Tyd8fe14dqucBgaDmgTtAtwsBbLEIoedgnbPc=;
	b=fFWJBzdmRZN1LhPDTxjudexpcVMkDy09aRZhIshfjhMMJOi16eTwP9fQXWtoDysAwUlOY1
	0g9HLx19+f9m7Vd66RN3CYu+a1pkZREhQI9nCcEBJ3z42HzaWdmflXNCxdAuL+0S4izmZ7
	bDlmuAdd8xGVdboakye+wMWFK34/E4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-5qeyd7JZOgC02ojQoYXw8Q-1; Thu, 27 Aug 2020 02:00:47 -0400
X-MC-Unique: 5qeyd7JZOgC02ojQoYXw8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77F9F807337;
	Thu, 27 Aug 2020 06:00:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58646702E7;
	Thu, 27 Aug 2020 06:00:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F01860376;
	Thu, 27 Aug 2020 06:00:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07R60Xka019220 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 02:00:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B8BCF5185; Thu, 27 Aug 2020 06:00:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16A20F518A
	for <cluster-devel@redhat.com>; Thu, 27 Aug 2020 06:00:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29F69101A53F
	for <cluster-devel@redhat.com>; Thu, 27 Aug 2020 06:00:27 +0000 (UTC)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
	[209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-525-2nOe1NBRPHuNBrPDZ5fsMg-1; Thu, 27 Aug 2020 02:00:23 -0400
X-MC-Unique: 2nOe1NBRPHuNBrPDZ5fsMg-1
Received: by mail-oi1-f200.google.com with SMTP id v188so2201011oie.6
	for <cluster-devel@redhat.com>; Wed, 26 Aug 2020 23:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ra82U5Tyd8fe14dqucBgaDmgTtAtwsBbLEIoedgnbPc=;
	b=QyxPqkVWNJzgjIalyZzN+dv6nvAalyM60pHCOhRn56Lm9BNT7yvYlUs8ISdLDaU2xG
	n2x6scuXw1TfjgkNLHuQBDicfsuJCuXBdWjV18jwEcvIxWhVs3WnrmeuBNw3g7L/dJHU
	Y9TCcpH1ZlZ7wcaixYZ9OHvgVW5ZF1cdbYNx+eu6xPR81yC5bUmbUbzDzcQ8AIS1dJQ1
	Gs/aHBC98EE+7RT9MHiMNY9qUVWmj6+MEdHOKNz3SdAS3nCyd8CHriWLk2Jc9ft6HoXF
	/c1biUMJ9xQ8MgDELqXEYD4xjjHOjrrBrD2Z5Na6BF3A7cJrY4lxnFYljDYpmnqxFahu
	PBRg==
X-Gm-Message-State: AOAM533xjPvRWpsB7nz6h37bEFZVVOHmqj83dm2fUq2xS8cugB9KG5T4
	ahIaYMfZtl4GCaH7SbQZa+dDjaX206MFErt6hHUSEOCaYtwo0HFNbzBO1/6w3AxIIPrUQ26KZ3w
	QncimwjhGlvnsOoHElsSpUF8SOLpOlLgFUIN4dA==
X-Received: by 2002:a9d:2dc9:: with SMTP id g67mr6906024otb.297.1598508022248; 
	Wed, 26 Aug 2020 23:00:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE4u4TlbPx8C8J+dinGV2KPU+jniJbwyrIISVxKVdLwA1KiCNH8gBfMEpdb4QQxJNFUtL+KJB7X81hJM5fhJE=
X-Received: by 2002:a9d:2dc9:: with SMTP id g67mr6906015otb.297.1598508021988; 
	Wed, 26 Aug 2020 23:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200821173337.20377-1-rpeterso@redhat.com>
	<20200821173337.20377-7-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-7-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 27 Aug 2020 08:00:00 +0200
Message-ID: <CAHc6FU4u5NW3FYwTz0E4zVp5KWejtUc67YXjMXJNmL=wJfuHjg@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 06/12] gfs2: Create transaction for
 inodes with i_nlink != 0
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
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 21, 2020 at 7:33 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, function gfs2_evict_inode would check if i_nlink
> was non-zero, and if so, go to label out. The problem is, the evicted
> file may still have outstanding pages that need invalidating, but
> the call to truncate_inode_pages_final at label out doesn't start a
> transaction. It needs a transaction in order to write revokes for any
> pages it has to invalidate.

This is only true for jdata inodes though, right? If so, I'd rather
just create transactions in the jdata case.

> This patch removes the early check for i_nlink in gfs2_evict_inode.
> Not much further down in the code, there's another check for i_nlink
> that skips to out_truncate. That one is proper because the calls
> to truncate_inode_pages after out_truncate use a proper transaction,
> so the page invalidates and subsequent revokes may be done properly.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/super.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 80ac446f0110..1f3dee740431 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -1344,7 +1344,7 @@ static void gfs2_evict_inode(struct inode *inode)
>                 return;
>         }
>
> -       if (inode->i_nlink || sb_rdonly(sb))
> +       if (sb_rdonly(sb))
>                 goto out;
>         if (test_bit(GIF_ALLOC_FAILED, &ip->i_flags)) {
> @@ -1370,15 +1370,19 @@ static void gfs2_evict_inode(struct inode *inode)
>         }
>
>         if (gfs2_inode_already_deleted(ip->i_gl, ip->i_no_formal_ino))
> -               goto out_truncate;
> +               goto out_flush;
>         error = gfs2_check_blk_type(sdp, ip->i_no_addr, GFS2_BLKST_UNLINKED);
> -       if (error)
> -               goto out_truncate;
> +       if (error) {
> +               error = 0;
> +               goto out_flush;
> +       }
>
>         if (test_bit(GIF_INVALID, &ip->i_flags)) {
>                 error = gfs2_inode_refresh(ip);
> -               if (error)
> -                       goto out_truncate;
> +               if (error) {
> +                       error = 0;
> +                       goto out_flush;
> +               }
>         }
>
>         /*
> @@ -1392,7 +1396,7 @@ static void gfs2_evict_inode(struct inode *inode)
>             test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
>                 if (!gfs2_upgrade_iopen_glock(inode)) {
>                         gfs2_holder_uninit(&ip->i_iopen_gh);
> -                       goto out_truncate;
> +                       goto out_flush;
>                 }
>         }
>
> @@ -1424,7 +1428,7 @@ static void gfs2_evict_inode(struct inode *inode)
>         gfs2_inode_remember_delete(ip->i_gl, ip->i_no_formal_ino);
>         goto out_unlock;
>
> -out_truncate:
> +out_flush:
>         gfs2_log_flush(sdp, ip->i_gl, GFS2_LOG_HEAD_FLUSH_NORMAL |
>                        GFS2_LFC_EVICT_INODE);
>         metamapping = gfs2_glock2aspace(ip->i_gl);
> @@ -1435,6 +1439,7 @@ static void gfs2_evict_inode(struct inode *inode)
>         write_inode_now(inode, 1);
>         gfs2_ail_flush(ip->i_gl, 0);
>
> +out_truncate:
>         nr_revokes = inode->i_mapping->nrpages + metamapping->nrpages;
>         if (!nr_revokes)
>                 goto out_unlock;
> --
> 2.26.2
>

Thanks,
Andreas

