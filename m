Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E5905170937
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Feb 2020 21:08:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582747727;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FZ8GugRuekixKkv1KZIVkGNus80E+SgCo2PSKtyFxlY=;
	b=QuU+7i/+LIR73UT3Cu4vLGWVGQwQLMxGN3xEQ65i2hzvLp1PaKaxX1XacMdqrKd+WtGMHQ
	Mg2wFqj8gNOAMpkuAcqhvlaiYcWAYDn1qtvTyBbBC3v5jh5DMQdgIWD4Zowhku+0QYM6ut
	Op9LT0D6o63KqgcjO/tWIZhRVxhZaiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-7OnCzCdlPt2eb_Xro9wbyw-1; Wed, 26 Feb 2020 15:08:46 -0500
X-MC-Unique: 7OnCzCdlPt2eb_Xro9wbyw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA78D1882CCC;
	Wed, 26 Feb 2020 20:08:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41BFC2708E;
	Wed, 26 Feb 2020 20:08:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32E5D18034EA;
	Wed, 26 Feb 2020 20:08:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01QK8aji002551 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 15:08:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16D532166B2A; Wed, 26 Feb 2020 20:08:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 127BD2166B28
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 20:08:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3F01800313
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 20:08:33 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
	[209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-330-VSB2l6wROSesLn18m4phyg-1; Wed, 26 Feb 2020 15:08:31 -0500
X-MC-Unique: VSB2l6wROSesLn18m4phyg-1
Received: by mail-ot1-f72.google.com with SMTP id 75so197014otc.6
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 12:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xNiLGQJkFCCur/kcyHnUCfWNHZEj+z8rs1YUd95wtNY=;
	b=TC0bGn9+v9N6CT+s2TGwKVRHVdTLZzf6NG+4Y6UPgTS0xXGPqdKNkR5zVVGvUSQyjO
	CcXezZEQkiX4x4B4VK47SjW1LlO6DJQuYBiU2OQUrAJ4L4cA1vTeO4ACRUW6qq+JXqXv
	ihVSqa8XiywUb1JO4u/WzSz8D4jt6tzCkA2A86p4MZnGFWffHBvjQP8CAK0e3v1lLIF2
	hwKSmrtgskyhoRvHLhMwAGMal/N+vGCkfO2PS7LQ2gS65V+y+wVnsC4WBqPQJWXdWUm0
	nVTTGRB4EetF7ieubscOjXM7FubxREjvPltPGU36jUhk16k1sVk9exxWKyioattWIVnD
	a9BQ==
X-Gm-Message-State: APjAAAXKwF/IjVajZX2/fel76Q4oBYi+oshn3pmhU8dP6Wkrz9VFqT41
	hKLtXAIHVIzWDy2BaDqt8v8Pf51nrqPFMVIc5Se5mwzGzSBBePj62DHMhh0aVnh/UDDfZwLQ5Et
	35s0EnbUMZhVifIkVxnl1xG5rug1di1deLYj2Tg==
X-Received: by 2002:aca:f242:: with SMTP id q63mr605316oih.72.1582747710699;
	Wed, 26 Feb 2020 12:08:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyOGYawt4tOFNdHxQkgA6S6cJtyumuT/9Rd8IhuQfJEOv9FulI3jaeyLtqJ/wm64ljBoiNVUKVDnHihasSefx4=
X-Received: by 2002:aca:f242:: with SMTP id q63mr605299oih.72.1582747710454;
	Wed, 26 Feb 2020 12:08:30 -0800 (PST)
MIME-Version: 1.0
References: <20200226154844.1264672-1-rpeterso@redhat.com>
	<20200226154844.1264672-2-rpeterso@redhat.com>
In-Reply-To: <20200226154844.1264672-2-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 26 Feb 2020 21:08:19 +0100
Message-ID: <CAHc6FU5PWrdRZsb5noAGfH13S962_CoXPPkyrA0ymDj4o0EqfQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01QK8aji002551
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 1/3] gfs2: free quota data struct
 during evict, not file close
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 4:49 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, whenever a file was closed, if it was the last
> process out, it freed the quota data via gfs2_qa_delete(). However,
> that created race conditions between closers and other operations
> like chown that relied upon the structure. This patch moves the
> freeing of quota data to inode evict, and eliminates function
> gfs2_qa_delete in favor of just freeing the structure.

This will use sizeof(struct gfs2_qadata) =3D=3D 264 more bytes for each
inode when quotas are used. I'm not categorically against that, but
maybe the locking can be fixed instead.

Please explain why we don't have the same race for reservations that
we have for quotas.

The other two patches look fine.

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/quota.c | 10 ----------
>  fs/gfs2/quota.h |  1 -
>  fs/gfs2/rgrp.c  |  1 -
>  fs/gfs2/super.c |  3 +++
>  4 files changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index 43ffe5997098..15158b6c933b 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -547,16 +547,6 @@ int gfs2_qa_alloc(struct gfs2_inode *ip)
>         return error;
>  }
>
> -void gfs2_qa_delete(struct gfs2_inode *ip, atomic_t *wcount)
> -{
> -       down_write(&ip->i_rw_mutex);
> -       if (ip->i_qadata && ((wcount =3D=3D NULL) || (atomic_read(wcount)=
 <=3D 1))) {
> -               kmem_cache_free(gfs2_qadata_cachep, ip->i_qadata);
> -               ip->i_qadata =3D NULL;
> -       }
> -       up_write(&ip->i_rw_mutex);
> -}
> -
>  int gfs2_quota_hold(struct gfs2_inode *ip, kuid_t uid, kgid_t gid)
>  {
>         struct gfs2_sbd *sdp =3D GFS2_SB(&ip->i_inode);
> diff --git a/fs/gfs2/quota.h b/fs/gfs2/quota.h
> index 765627d9a91e..4a4a09aee7d9 100644
> --- a/fs/gfs2/quota.h
> +++ b/fs/gfs2/quota.h
> @@ -16,7 +16,6 @@ struct gfs2_sbd;
>  #define NO_GID_QUOTA_CHANGE INVALID_GID
>
>  extern int gfs2_qa_alloc(struct gfs2_inode *ip);
> -extern void gfs2_qa_delete(struct gfs2_inode *ip, atomic_t *wcount);
>  extern int gfs2_quota_hold(struct gfs2_inode *ip, kuid_t uid, kgid_t gid=
);
>  extern void gfs2_quota_unhold(struct gfs2_inode *ip);
>
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index 2ee2f7d48bc1..7efc765ebc6a 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -683,7 +683,6 @@ void gfs2_rsqa_delete(struct gfs2_inode *ip, atomic_t=
 *wcount)
>         if ((wcount =3D=3D NULL) || (atomic_read(wcount) <=3D 1))
>                 gfs2_rs_deltree(&ip->i_res);
>         up_write(&ip->i_rw_mutex);
> -       gfs2_qa_delete(ip, wcount);
>  }
>
>  /**
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 693c6d13473c..3d36d8671cf6 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -1410,6 +1410,9 @@ static void gfs2_evict_inode(struct inode *inode)
>  out:
>         truncate_inode_pages_final(&inode->i_data);
>         gfs2_rsqa_delete(ip, NULL);
> +       if (ip->i_qadata)
> +               kmem_cache_free(gfs2_qadata_cachep, ip->i_qadata);
> +       ip->i_qadata =3D NULL;
>         gfs2_ordered_del_inode(ip);
>         clear_inode(inode);
>         gfs2_dir_hash_inval(ip);
> --
> 2.24.1
>

Thanks,
Andreas


