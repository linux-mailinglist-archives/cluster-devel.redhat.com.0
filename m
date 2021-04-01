Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B4B4A35130E
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Apr 2021 12:12:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617271969;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GM6CpTIXkVbUY7STcmh4NzlSqWx1GCDQne7SCa0TUTo=;
	b=TrxknAv8iK5k8Rp61e2jMhDkx2lw7un+cgaWWS/W1YOmDTOyvYQOC1vz3RXFF+r2fOfI+3
	ZBPnSYQ/5u/V5qu+hCuMH/rNopegbqd/fl9lTK7vDOVaLORdKnjUq9nHJAgFWQoaoZid2N
	rZyf0Ctgz4nlwE/ITamg8h5wCKV1JH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-OY19t1xsNouEjX_tECkjtg-1; Thu, 01 Apr 2021 06:12:48 -0400
X-MC-Unique: OY19t1xsNouEjX_tECkjtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9F3487A826;
	Thu,  1 Apr 2021 10:12:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCB556F978;
	Thu,  1 Apr 2021 10:12:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E9151809C83;
	Thu,  1 Apr 2021 10:12:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 131ACgW5001127 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 06:12:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D556F5194; Thu,  1 Apr 2021 10:12:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97262F00D5
	for <cluster-devel@redhat.com>; Thu,  1 Apr 2021 10:12:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0D7485A5BF
	for <cluster-devel@redhat.com>; Thu,  1 Apr 2021 10:12:38 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-204-fpuceyhQMuW9RlStDeInXQ-1; Thu, 01 Apr 2021 06:12:37 -0400
X-MC-Unique: fpuceyhQMuW9RlStDeInXQ-1
Received: by mail-wm1-f71.google.com with SMTP id j15so1195235wmq.6
	for <cluster-devel@redhat.com>; Thu, 01 Apr 2021 03:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GM6CpTIXkVbUY7STcmh4NzlSqWx1GCDQne7SCa0TUTo=;
	b=uclRN9CV7UFTBxtURk0L9oHSSv5sXc+QrVvkAF3Sl4XUweU2VTvlzVQ0P7gg1rzaFb
	Ko9w8HZTlWExuJUjVYGbpYtMTjuCsBFEixQceyV3um9BZd1p5hjIKRoK9Sxxa919Czpm
	UGlowcUVZtjmkziAANpY8JgGL3xeSkypj3H3bUzqxsKEDPckJ+2qzCsWsHQWAUjY9BSp
	3raSUMEbOp/wIlm83ZaK1tBSX2me1DcdltLGR9VsdsSlO7/BwTnZR7bwargLWfHaLcQU
	vIcKfcne8MNqEIZp5arBtJd6ND7ZFmI3OIIdzrINJjiTcfFG17XvpipjFlsUGNxjhDBS
	ox1A==
X-Gm-Message-State: AOAM532OsBzUdGa1qzvZ+0QnCbCOcdHdF1pOJgJg2ODj3axnuMx5VWpW
	FtW3x+TJ7t/I8FCnXWWmpR6o66BfkZ/1F2fIKcrvK0UZOWhY82PYB3xkoASNT5+2c7FgQLTRUH0
	4PDqFKvdiR52tInb+iUDeQwZLOAqCKFbWhRdupw==
X-Received: by 2002:a05:600c:364c:: with SMTP id
	y12mr7340826wmq.96.1617271955633; 
	Thu, 01 Apr 2021 03:12:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzci0LZ1oNKCft2FyzGAE9531acaYJ57Wd8DNovzUcG/F3337Qudoa7kOpF+jFBae9w4AoY1EwQjCgliwM6Z48=
X-Received: by 2002:a05:600c:364c:: with SMTP id
	y12mr7340809wmq.96.1617271955350; 
	Thu, 01 Apr 2021 03:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210401091839.2251916-1-agruenba@redhat.com>
	<20210401091839.2251916-3-agruenba@redhat.com>
	<4bdf64ec-835e-6d97-b1d9-b34defacb694@redhat.com>
In-Reply-To: <4bdf64ec-835e-6d97-b1d9-b34defacb694@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 1 Apr 2021 12:12:24 +0200
Message-ID: <CAHc6FU7Q12-nJCdDAfSzm+C-pm80FYS6E+cFwAc1C+reRBeUxQ@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 2/4] gfs2: Turn gfs2_extent_map into
 gfs2_{get, alloc}_extent
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 1, 2021 at 11:46 AM Andrew Price <anprice@redhat.com> wrote:
> On 01/04/2021 10:18, Andreas Gruenbacher wrote:
> > Convert gfs2_extent_map to iomap and split it into gfs2_get_extent and
> > gfs2_alloc_extent.  Instead of hardcoding the extent size, pass it in
> > via the extlen parameter.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >   fs/gfs2/bmap.c     | 59 ++++++++++++++++++++++++++++++----------------
> >   fs/gfs2/bmap.h     |  6 +++--
> >   fs/gfs2/dir.c      | 13 +++++-----
> >   fs/gfs2/quota.c    |  4 ++--
> >   fs/gfs2/recovery.c |  4 ++--
> >   5 files changed, 53 insertions(+), 33 deletions(-)
> >
> > diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> > index cc12dc0d6955..ac959a99ea81 100644
> > --- a/fs/gfs2/bmap.c
> > +++ b/fs/gfs2/bmap.c
> > @@ -1320,28 +1320,47 @@ int gfs2_block_map(struct inode *inode, sector_t lblock,
> >       return ret;
> >   }
> >
> > -/*
> > - * Deprecated: do not use in new code
> > - */
> > -int gfs2_extent_map(struct inode *inode, u64 lblock, int *new, u64 *dblock, unsigned *extlen)
> > +int gfs2_get_extent(struct inode *inode, u64 lblock, u64 *dblock,
> > +                 unsigned int *extlen)
> >   {
> > -     struct buffer_head bh = { .b_state = 0, .b_blocknr = 0 };
> > +     unsigned int blkbits = inode->i_blkbits;
> > +     struct iomap iomap = { };
> > +     unsigned int len;
> >       int ret;
> > -     int create = *new;
> > -
> > -     BUG_ON(!extlen);
> > -     BUG_ON(!dblock);
> > -     BUG_ON(!new);
> > -
> > -     bh.b_size = BIT(inode->i_blkbits + (create ? 0 : 5));
> > -     ret = gfs2_block_map(inode, lblock, &bh, create);
> > -     *extlen = bh.b_size >> inode->i_blkbits;
> > -     *dblock = bh.b_blocknr;
> > -     if (buffer_new(&bh))
> > -             *new = 1;
> > -     else
> > -             *new = 0;
> > -     return ret;
> > +
> > +     ret = gfs2_iomap_get(inode, lblock << blkbits, *extlen << blkbits,
> > +                          &iomap);
> > +     if (ret)
> > +             return ret;
> > +     if (iomap.type != IOMAP_MAPPED)
> > +             return -EIO;
> > +     *dblock = iomap.addr >> blkbits;
> > +     len = iomap.length >> blkbits;
> > +     if (len < *extlen)
> > +             *extlen = len;
> > +     return 0;
> > +}
> > +
> > +int gfs2_alloc_extent(struct inode *inode, u64 lblock, u64 *dblock,
> > +                   unsigned int *extlen, bool *new)
> > +{
> > +     unsigned int blkbits = inode->i_blkbits;
> > +     struct iomap iomap = { };
> > +     unsigned int len;
> > +     int ret;
> > +
> > +     ret = gfs2_iomap_alloc(inode, lblock << blkbits, *extlen << blkbits,
> > +                            &iomap);
> > +     if (ret)
> > +             return ret;
> > +     if (iomap.type != IOMAP_MAPPED)
> > +             return -EIO;
> > +     *dblock = iomap.addr >> blkbits;
> > +     len = iomap.length >> blkbits;
> > +     if (len < *extlen)
> > +             *extlen = len;
> > +     *new = iomap.flags & IOMAP_F_NEW;
>
> As *new is bool, shouldn't this be !!(iomap.flags & IOMAP_F_NEW) or similar?

That's implied with type bool (but not with integer types). For example,

  (bool)(1L << (8 * sizeof(long) - 1))

is always 1.

> Otherwise, the set looks good to me.
>
> Andy
>
> > +     return 0;
> >   }
> >
> >   /*
> > diff --git a/fs/gfs2/bmap.h b/fs/gfs2/bmap.h
> > index c63efee8aaa4..67ef7cf7fdac 100644
> > --- a/fs/gfs2/bmap.h
> > +++ b/fs/gfs2/bmap.h
> > @@ -53,8 +53,10 @@ extern int gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
> >                         struct iomap *iomap);
> >   extern int gfs2_iomap_alloc(struct inode *inode, loff_t pos, loff_t length,
> >                           struct iomap *iomap);
> > -extern int gfs2_extent_map(struct inode *inode, u64 lblock, int *new,
> > -                        u64 *dblock, unsigned *extlen);
> > +extern int gfs2_get_extent(struct inode *inode, u64 lblock, u64 *dblock,
> > +                        unsigned int *extlen);
> > +extern int gfs2_alloc_extent(struct inode *inode, u64 lblock, u64 *dblock,
> > +                          unsigned *extlen, bool *new);
> >   extern int gfs2_setattr_size(struct inode *inode, u64 size);
> >   extern void gfs2_trim_blocks(struct inode *inode);
> >   extern int gfs2_truncatei_resume(struct gfs2_inode *ip);
> > diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
> > index c0f2875c946c..4517ffb7c13d 100644
> > --- a/fs/gfs2/dir.c
> > +++ b/fs/gfs2/dir.c
> > @@ -159,7 +159,7 @@ static int gfs2_dir_write_data(struct gfs2_inode *ip, const char *buf,
> >       unsigned int o;
> >       int copied = 0;
> >       int error = 0;
> > -     int new = 0;
> > +     bool new = false;
> >
> >       if (!size)
> >               return 0;
> > @@ -189,9 +189,9 @@ static int gfs2_dir_write_data(struct gfs2_inode *ip, const char *buf,
> >                       amount = sdp->sd_sb.sb_bsize - o;
> >
> >               if (!extlen) {
> > -                     new = 1;
> > -                     error = gfs2_extent_map(&ip->i_inode, lblock, &new,
> > -                                             &dblock, &extlen);
> > +                     extlen = 1;
> > +                     error = gfs2_alloc_extent(&ip->i_inode, lblock, &dblock,
> > +                                               &extlen, &new);
> >                       if (error)
> >                               goto fail;
> >                       error = -EIO;
> > @@ -286,15 +286,14 @@ static int gfs2_dir_read_data(struct gfs2_inode *ip, __be64 *buf,
> >       while (copied < size) {
> >               unsigned int amount;
> >               struct buffer_head *bh;
> > -             int new;
> >
> >               amount = size - copied;
> >               if (amount > sdp->sd_sb.sb_bsize - o)
> >                       amount = sdp->sd_sb.sb_bsize - o;
> >
> >               if (!extlen) {
> > -                     new = 0;
> > -                     error = gfs2_extent_map(&ip->i_inode, lblock, &new,
> > +                     extlen = 32;
> > +                     error = gfs2_get_extent(&ip->i_inode, lblock,
> >                                               &dblock, &extlen);
> >                       if (error || !dblock)
> >                               goto fail;
> > diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> > index 6e173ae378c4..9b1aca7e1264 100644
> > --- a/fs/gfs2/quota.c
> > +++ b/fs/gfs2/quota.c
> > @@ -1375,8 +1375,8 @@ int gfs2_quota_init(struct gfs2_sbd *sdp)
> >               unsigned int y;
> >
> >               if (!extlen) {
> > -                     int new = 0;
> > -                     error = gfs2_extent_map(&ip->i_inode, x, &new, &dblock, &extlen);
> > +                     extlen = 32;
> > +                     error = gfs2_get_extent(&ip->i_inode, x, &dblock, &extlen);
> >                       if (error)
> >                               goto fail;
> >               }
> > diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> > index 282173774005..4ab4cdbf774a 100644
> > --- a/fs/gfs2/recovery.c
> > +++ b/fs/gfs2/recovery.c
> > @@ -34,12 +34,12 @@ int gfs2_replay_read_block(struct gfs2_jdesc *jd, unsigned int blk,
> >   {
> >       struct gfs2_inode *ip = GFS2_I(jd->jd_inode);
> >       struct gfs2_glock *gl = ip->i_gl;
> > -     int new = 0;
> >       u64 dblock;
> >       u32 extlen;
> >       int error;
> >
> > -     error = gfs2_extent_map(&ip->i_inode, blk, &new, &dblock, &extlen);
> > +     extlen = 32;
> > +     error = gfs2_get_extent(&ip->i_inode, blk, &dblock, &extlen);
> >       if (error)
> >               return error;
> >       if (!dblock) {
> >
>

Thanks,
Andreas

