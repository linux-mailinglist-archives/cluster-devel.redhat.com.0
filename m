Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4B7265FED
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Sep 2020 14:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599829167;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=rdjaN+giuK5zUKuyCXokBmQgYHWn1aP7bkOwdFgiPBU=;
	b=L+HxsipI49ijMTaV19PLRnb4Fe/qmCGK/UY91umnOjVwAApp1eHOUTjhVp+W50YlNE50Yi
	i9Dh06frCv/e6Z+MNNEEUDBhYcssQrrqt51cQSdaxTRZLrKoRLIASop6y2TF+rlcf1uY8d
	3xnYvWPJEl3agpifkOQbyQ+6k7vxM14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-8-8CV4nkMN-8ftGld5oEdg-1; Fri, 11 Sep 2020 08:59:24 -0400
X-MC-Unique: 8-8CV4nkMN-8ftGld5oEdg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5BC3107465B;
	Fri, 11 Sep 2020 12:59:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 671DD5C1BD;
	Fri, 11 Sep 2020 12:59:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C587C922ED;
	Fri, 11 Sep 2020 12:59:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BCx9sU021182 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 08:59:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 963E52018088; Fri, 11 Sep 2020 12:59:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9189E202450A
	for <cluster-devel@redhat.com>; Fri, 11 Sep 2020 12:59:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06331801225
	for <cluster-devel@redhat.com>; Fri, 11 Sep 2020 12:59:07 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-231-xOD3J5HFM_uG5JreCYCW6w-1; Fri, 11 Sep 2020 08:59:05 -0400
X-MC-Unique: xOD3J5HFM_uG5JreCYCW6w-1
Received: by mail-wm1-f69.google.com with SMTP id a7so923274wmc.2
	for <cluster-devel@redhat.com>; Fri, 11 Sep 2020 05:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rdjaN+giuK5zUKuyCXokBmQgYHWn1aP7bkOwdFgiPBU=;
	b=IjkRjS7XbXTitbJqguMnEZiB03I04qnteaGLP+uj+jAFElt1y+Td1cxaOMdkp75RYM
	RQfyugqzItBZ6dh5vRPXSDroj1RhaT2SksbSvTyxliBntpm2lNQeSliFlaul/JV5fo+Q
	7bpJPPpc/pwlpRvwRFjZg5+9DdEtKLGO6IlLYtXddiiDXRzvq/UjotlswUbCYHPp3yp7
	njCzQGfsEggbOIUfHeUlhKd32OcwK7jE16cFHCNCvwou8RhpNuir+3hGGEHK/+dNFmFn
	5Khuc3cDboiVlblUc4SMQ1g5q2sg8Pi3tV1ObP3mhfjaV4vGR7Ge07PNsH7fUYGWIlqF
	Rn5g==
X-Gm-Message-State: AOAM533NjM4REg6fqbWj+uMQYNBKPpR5SVTbT79sIEuOoQ0coz9n9Fn6
	p9geysoipNVefFuM5oRLeRc/3WS5TnqF/0TeC2T5LsoMEGBKTJh9rBYpjRDUgPMluZid0ILpBjo
	du5bX9gTnbY98g3BzDkbeut7JJccvjyt9PODMPw==
X-Received: by 2002:a1c:2dcc:: with SMTP id t195mr1998008wmt.166.1599829143873;
	Fri, 11 Sep 2020 05:59:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxViZROtZrkYlXOPXEhT3pujGQroW/qFt9k5l4iT56SMYURv/p9Tp95Iv8ptX931ruFj71NPcitkZrj0UfvDBs=
X-Received: by 2002:a1c:2dcc:: with SMTP id t195mr1997991wmt.166.1599829143664;
	Fri, 11 Sep 2020 05:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <454279735.16583317.1599751575623.JavaMail.zimbra@redhat.com>
	<883057823.16586032.1599751594154.JavaMail.zimbra@redhat.com>
In-Reply-To: <883057823.16586032.1599751594154.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 11 Sep 2020 14:58:52 +0200
Message-ID: <CAHc6FU7Qirk5Sy-ZFZCiXAqgKxqX-BC6e2JtJ2YVD-vjfM=Mbg@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: truncate glock address space
 pages during evict
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Bob,

On Thu, Sep 10, 2020 at 5:26 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, function gfs2_evict_inode would truncate the pages
> for the inode's address space, but the address space associated with its
> glock was only truncated if the inode was deleted. In that case, it
> needs to do the truncate within a transaction because of this calling
> sequence:
>
> truncate_inode_pages
>    truncate_inode_pages_range
>       gfs2_invalidatepage
>          gfs2_discard
>             gfs2_remove_from_journal
>                gfs2_trans_add_revoke <------- Needs a transaction
>
> If, however, the inode is not deleted, it might still have pages for
> the glock's address space because gfs2_getbuf() reads them in that way.
> This may happen, for example, if a file is unlinked by another node and
> this node discovers that fact by reading the dinode using its glock
> during the process of doing delete_work_func -> create -> put -> evict.
> But if the inode is not deleted, the truncate_inode_pages for the glock
> address space was bypassed.
>
> The problem is, in some circumstances (such as the system quota file during
> unmount) an inode can have pages still queued to its glock's address space.
> That causes a kernel panic when __gfs2_glock_put for the inode glock does:
>
>     GLOCK_BUG_ON(gl, mapping && mapping->nrpages && !gfs2_withdrawn(sdp));
>
> At that point, it is too late to start a transaction for the truncate
> because the file system is then read-only, so trans_begin will return an
> error.
>
> When we free the glock, the pages shouldn't be dirty anyway, so this
> patch adds truncate_inode_pages_final for the glock's address space,
> metamapping.

not sure why, but this patch breaks xfstests generic/311 and generic/467. Also,

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/super.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 19add2da1013..3ced8d895eca 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -1456,6 +1456,10 @@ static void gfs2_evict_inode(struct inode *inode)
>                 fs_warn(sdp, "gfs2_evict_inode: %d\n", error);
>  out:
>         truncate_inode_pages_final(&inode->i_data);
> +       if (ip->i_gl) {
> +               metamapping = gfs2_glock2aspace(ip->i_gl);

don't we want to initialize metamapping earlier and also call
truncate_inode_pages_final on it before we detach the glock?

(Mind that truncate_inode_pages_final leaves AS_EXITING set in
metamapping->flags, so we'll also need to do somthing about that.)

> +               truncate_inode_pages_final(metamapping);
> +       }
>         if (ip->i_qadata)
>                 gfs2_assert_warn(sdp, ip->i_qadata->qa_ref == 0);
>         gfs2_rs_delete(ip, NULL);

Thanks,
Andreas

