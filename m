Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 38076627F0
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jul 2019 20:08:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB911C05E74D;
	Mon,  8 Jul 2019 18:08:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E063B101E26A;
	Mon,  8 Jul 2019 18:08:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A3BB18184A5;
	Mon,  8 Jul 2019 18:08:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x68I88UK010493 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jul 2019 14:08:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 778C05D9C8; Mon,  8 Jul 2019 18:08:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72CBF5DA35
	for <cluster-devel@redhat.com>; Mon,  8 Jul 2019 18:08:06 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
	[209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3372FC0586D8
	for <cluster-devel@redhat.com>; Mon,  8 Jul 2019 18:08:06 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id 189so6449662oii.18
	for <cluster-devel@redhat.com>; Mon, 08 Jul 2019 11:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zj2iLOms6aYPmMuG3tp7UPeDzR+cFyMyoRbVALNT9jI=;
	b=MJKcwooOaI9iAmGzpTTZZrO5+PWZwoSHgin70U8jG+NfHSl/NjVFnsIyBi+Q1ub3Lt
	ZeIpjrfNVzNSW6H8o7eNl5Pg9NLYfy4u+lmla85B0kgPWNvUHE0J57nuSELPm9sYlorp
	7Vs1VdjE/kEzWs78FcMRPDDGRAfJcgeZM8RKPX7WZ2X1TPknVioP4zecazHDHmHpO8Y+
	ox1M7Zs9dYWpLP2olww6KYME0oJlMpSk5ywm9e7Oc14vKoJYLwfiljXCv4iQLskA8F4j
	qxEpCw+kjmdd38vNGUopTHV6bG1pp+j7CG3lubbNqQyY/ulPPmM4DyTQe6ZHKYIIHX19
	20Bw==
X-Gm-Message-State: APjAAAW+ufZ23Tod7LV/K8+YnTVsUoBGOz4Vl6mvqB0zcOjRxD1ixrS3
	xJB/yZYJX4NoeFl0K56gTXHZVCnBg+NPRfrDRIuGDdKXM8D1Mfcvqpak6kgS8uOyViK61p9N4Qp
	YZfTlSI7eA2zqvz48LA6MNwntVX3qQTBs2COhbA==
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr3612614otn.297.1562609285515; 
	Mon, 08 Jul 2019 11:08:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwnFj5UcBd/Trw+H+mAYJrzi0QRC5IX/ikfUIf6USgfEpv8lXPMRG3DwfElSh/c4uqEQ2/GrTsQQGvoTIhYxJA=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr3612603otn.297.1562609285337; 
	Mon, 08 Jul 2019 11:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190705235622.22368-1-agruenba@redhat.com>
	<20190705235622.22368-3-agruenba@redhat.com>
	<20190708170619.GA10526@lst.de>
In-Reply-To: <20190708170619.GA10526@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 8 Jul 2019 20:07:54 +0200
Message-ID: <CAHc6FU4u0x7X_t6CjpfakXGzpm_TsBOYA=dWvrqUvg+oYFtraA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 2/2] gfs2: Add support for IOMAP_ZERO
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Mon, 08 Jul 2019 18:08:37 +0000 (UTC)

On Mon, 8 Jul 2019 at 19:06, Christoph Hellwig <hch@lst.de> wrote:
> Don't we actually need the write lock for zeroing as well?

Hmm. For iomap_zero_range, we don't need the
iov_iter_fault_in_readable / iov_iter_copy_from_user_atomic logic from
iomap_write_actor, so we take the write lock outside of
iomap_zero_range. I just now noticed that xfs behaves differently
there; that's an ugly difference.

>  Also
> I think the alloc helper would be nice to keep, and a little use
> of switch might clean things up.  How about something like this
> instead?
>
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index f42718dd292f..8f5a25f507c3 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -1027,17 +1027,8 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
>         bool unstuff, alloc_required;
>         int ret;
>
> -       ret = gfs2_write_lock(inode);
> -       if (ret)
> -               return ret;
> -
>         unstuff = gfs2_is_stuffed(ip) &&
>                   pos + length > gfs2_max_stuffed_size(ip);
> -
> -       ret = gfs2_iomap_get(inode, pos, length, flags, iomap, mp);
> -       if (ret)
> -               goto out_unlock;
> -
>         alloc_required = unstuff || iomap->type == IOMAP_HOLE;
>
>         if (alloc_required || gfs2_is_jdata(ip))
> @@ -1051,7 +1042,7 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
>
>                 ret = gfs2_quota_lock_check(ip, &ap);
>                 if (ret)
> -                       goto out_unlock;
> +                       return ret;
>
>                 ret = gfs2_inplace_reserve(ip, &ap);
>                 if (ret)
> @@ -1118,11 +1109,23 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
>  out_qunlock:
>         if (alloc_required)
>                 gfs2_quota_unlock(ip);
> -out_unlock:
> -       gfs2_write_unlock(inode);
>         return ret;
>  }
>
> +static inline bool gfs2_iomap_need_write_lock(unsigned flags)
> +{
> +       switch (flags & (IOMAP_WRITE | IOMAP_ZERO)) {
> +       case IOMAP_WRITE:
> +               if (flags & IOMAP_DIRECT)
> +                       return false;
> +               return true;
> +       case IOMAP_ZERO:
> +               return true;
> +       default:
> +               return false;
> +       }
> +}
> +
>  static int gfs2_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
>                             unsigned flags, struct iomap *iomap)
>  {
> @@ -1133,20 +1136,48 @@ static int gfs2_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
>         iomap->flags |= IOMAP_F_BUFFER_HEAD;
>
>         trace_gfs2_iomap_start(ip, pos, length, flags);
> -       if ((flags & IOMAP_WRITE) && !(flags & IOMAP_DIRECT)) {
> -               ret = gfs2_iomap_begin_write(inode, pos, length, flags, iomap, &mp);
> -       } else {
> -               ret = gfs2_iomap_get(inode, pos, length, flags, iomap, &mp);
>
> -               /*
> -                * Silently fall back to buffered I/O for stuffed files or if
> -                * we've hot a hole (see gfs2_file_direct_write).
> -                */
> -               if ((flags & IOMAP_WRITE) && (flags & IOMAP_DIRECT) &&
> -                   iomap->type != IOMAP_MAPPED)
> -                       ret = -ENOTBLK;
> +       if (gfs2_iomap_need_write_lock(flags)) {
> +               ret = gfs2_write_lock(inode);
> +               if (ret)
> +                       goto out;
>         }
> +
> +       ret = gfs2_iomap_get(inode, pos, length, flags, iomap, &mp);
> +       if (ret)
> +               goto out_unlock;
> +
> +       switch (flags & (IOMAP_WRITE | IOMAP_ZERO)) {
> +       case 0:
> +               goto out_unlock;
> +       case IOMAP_WRITE:
> +               if (flags & IOMAP_DIRECT) {
> +                       /*
> +                        * Silently fall back to buffered I/O for stuffed files
> +                        * or if we've got a hole (see gfs2_file_direct_write).
> +                        */
> +                       if (iomap->type != IOMAP_MAPPED)
> +                               ret = -ENOTBLK;
> +                       goto out_unlock;
> +               }
> +               break;
> +       case IOMAP_ZERO:
> +               if (iomap->type == IOMAP_HOLE)
> +                       goto out_unlock;
> +               break;
> +       default:
> +               WARN_ON_ONCE(1);
> +               ret = -EIO;
> +               goto out_unlock;
> +       }
> +
> +       ret = gfs2_iomap_begin_write(inode, pos, length, flags, iomap, &mp);
> +
> +out_unlock:
> +       if (ret && gfs2_iomap_need_write_lock(flags))
> +               gfs2_write_unlock(inode);
>         release_metapath(&mp);
> +out:
>         trace_gfs2_iomap_end(ip, iomap, ret);
>         return ret;
>  }
> @@ -1157,8 +1188,21 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
>         struct gfs2_inode *ip = GFS2_I(inode);
>         struct gfs2_sbd *sdp = GFS2_SB(inode);
>
> -       if ((flags & (IOMAP_WRITE | IOMAP_DIRECT)) != IOMAP_WRITE)
> -               goto out;
> +       switch (flags & (IOMAP_WRITE | IOMAP_ZERO)) {
> +       case 0:
> +               return 0;
> +       case IOMAP_WRITE:
> +               if (flags & IOMAP_DIRECT)
> +                       return 0;
> +               break;
> +       case IOMAP_ZERO:
> +               if (iomap->type == IOMAP_HOLE)
> +                       return 0;
> +               break;
> +       default:
> +               WARN_ON_ONCE(1);
> +               return -EIO;
> +       }
>
>         if (!gfs2_is_stuffed(ip))
>                 gfs2_ordered_add_inode(ip);
> @@ -1183,8 +1227,6 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
>         if (ip->i_qadata && ip->i_qadata->qa_qd_num)
>                 gfs2_quota_unlock(ip);
>         gfs2_write_unlock(inode);
> -
> -out:
>         return 0;
>  }
>
>

