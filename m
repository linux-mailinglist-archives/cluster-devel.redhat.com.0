Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B86C265DC83
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 20:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672859064;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pTjo/9+5dGsDu5LarlQNnwmMiElbczSxkHDB5tXnbzA=;
	b=YLPfMK10yALHQ6H3in4IyJjUomMQ8KZceO2RzI/6M6PFAlGHjdpth2MFcS+nhJ/G5eYgb1
	gHrGf7FUhmV6jSjKu3KyTnlWXpi0ylsGCoUTNxLgrDNeZ8KYZhId1Nq7hGT/JebX9cW5Im
	Sx99k+ETgy7ofjyW9XpqpCmjQiYlqks=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-7EnGgdJ9NzeO93FwoQc4Ug-1; Wed, 04 Jan 2023 14:04:09 -0500
X-MC-Unique: 7EnGgdJ9NzeO93FwoQc4Ug-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACCFD1C02D25;
	Wed,  4 Jan 2023 19:03:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E40049BB6A;
	Wed,  4 Jan 2023 19:03:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0D881194658F;
	Wed,  4 Jan 2023 19:03:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3D7451946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 19:03:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1BE292026D68; Wed,  4 Jan 2023 19:03:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 141782026D4B
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 19:03:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E407118A63ED
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 19:03:12 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-amrwK24fODiDBFMcMhxlvg-1; Wed, 04 Jan 2023 14:03:08 -0500
X-MC-Unique: amrwK24fODiDBFMcMhxlvg-1
Received: by mail-qv1-f53.google.com with SMTP id t13so18138723qvp.9;
 Wed, 04 Jan 2023 11:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pTjo/9+5dGsDu5LarlQNnwmMiElbczSxkHDB5tXnbzA=;
 b=kD+fFmWGkNHKF1mGVnxdMY4ToTWkCdZATcfE5c1KJnN1b+gzZdzjmJz63iyfhbSc2m
 fB+qvbkn7E6atB0MXpFyqi3K5982tmrvuVYwlCkCguRqJWr2RkM4ZQmj/0TsWDp/Vn/f
 P+ENim1YuNnhpIYohk73eiS5/+zUP1Z0xdysZ0KCyS+MegWDVeKlcQ7zmoabed+ne2s8
 iLOd4CrCPdhz5rOa7jAl1h8Kuir4yGVv7fzMRJzGHfKXE6Vj+x2iex9Epz3XW+d9s6Fu
 eb9pJTpO3n7VVivTWWwQrImKzY+nLdydnpjqQVIxd4WwPnxVZq0dLLN1sXf0Q+fqwi+a
 bXrA==
X-Gm-Message-State: AFqh2krygN5G7WvfFJ655iVUD3Bn37lt8mNDHYIel8gsa3P03AVL77v0
 kMVxDOSQ9+Twyew25HNCgYHUo7PvoSqC3k3gDv0=
X-Google-Smtp-Source: AMrXdXupxbTpmCjTep7UhT36HT0CRXGatphE6RzlJ8cTKiAXQO4hM0H3wVvG89XbeP5wi9jFYQ0+CiINPPGFotp5LiA=
X-Received: by 2002:ad4:5908:0:b0:532:f87:7546 with SMTP id
 ez8-20020ad45908000000b005320f877546mr11568qvb.93.1672858987846; Wed, 04 Jan
 2023 11:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20221231150919.659533-1-agruenba@redhat.com>
 <20221231150919.659533-8-agruenba@redhat.com>
 <Y7W9Dfub1WeTvG8G@magnolia>
In-Reply-To: <Y7W9Dfub1WeTvG8G@magnolia>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Wed, 4 Jan 2023 20:02:56 +0100
Message-ID: <CAHpGcMJu47qQEFgzSvodbpJtPz71HFrG66wbrXR_6AdbkZsOOw@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v5 7/9] iomap/xfs: Eliminate the
 iomap_valid handler
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 Matthew Wilcox <willy@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Mi., 4. Jan. 2023 um 19:00 Uhr schrieb Darrick J. Wong <djwong@kernel.org>:
> On Sat, Dec 31, 2022 at 04:09:17PM +0100, Andreas Gruenbacher wrote:
> > Eliminate the ->iomap_valid() handler by switching to a ->get_folio()
> > handler and validating the mapping there.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >  fs/iomap/buffered-io.c | 25 +++++--------------------
> >  fs/xfs/xfs_iomap.c     | 37 ++++++++++++++++++++++++++-----------
> >  include/linux/iomap.h  | 22 +++++-----------------
> >  3 files changed, 36 insertions(+), 48 deletions(-)
> >
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index 4f363d42dbaf..df6fca11f18c 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -630,7 +630,7 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
> >       const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
> >       const struct iomap *srcmap = iomap_iter_srcmap(iter);
> >       struct folio *folio;
> > -     int status = 0;
> > +     int status;
> >
> >       BUG_ON(pos + len > iter->iomap.offset + iter->iomap.length);
> >       if (srcmap != &iter->iomap)
> > @@ -646,27 +646,12 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
> >               folio = page_ops->get_folio(iter, pos, len);
> >       else
> >               folio = iomap_get_folio(iter, pos);
> > -     if (IS_ERR(folio))
> > -             return PTR_ERR(folio);
> > -
> > -     /*
> > -      * Now we have a locked folio, before we do anything with it we need to
> > -      * check that the iomap we have cached is not stale. The inode extent
> > -      * mapping can change due to concurrent IO in flight (e.g.
> > -      * IOMAP_UNWRITTEN state can change and memory reclaim could have
> > -      * reclaimed a previously partially written page at this index after IO
> > -      * completion before this write reaches this file offset) and hence we
> > -      * could do the wrong thing here (zero a page range incorrectly or fail
> > -      * to zero) and corrupt data.
> > -      */
> > -     if (page_ops && page_ops->iomap_valid) {
> > -             bool iomap_valid = page_ops->iomap_valid(iter->inode,
> > -                                                     &iter->iomap);
> > -             if (!iomap_valid) {
> > +     if (IS_ERR(folio)) {
> > +             if (folio == ERR_PTR(-ESTALE)) {
> >                       iter->iomap.flags |= IOMAP_F_STALE;
> > -                     status = 0;
> > -                     goto out_unlock;
> > +                     return 0;
> >               }
> > +             return PTR_ERR(folio);
>
> I wonder if this should be reworked a bit to reduce indenting:
>
>         if (PTR_ERR(folio) == -ESTALE) {
>                 iter->iomap.flags |= IOMAP_F_STALE;
>                 return 0;
>         }
>         if (IS_ERR(folio))
>                 return PTR_ERR(folio);
>
> But I don't have any strong opinions about that.

This is a relatively hot path; the compiler would have to convert the
flattened version back to the nested version for the best possible
result to avoid a redundant check. Not sure it would always do that.

> >       }
> >
> >       if (pos + len > folio_pos(folio) + folio_size(folio))
> > diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
> > index 669c1bc5c3a7..d0bf99539180 100644
> > --- a/fs/xfs/xfs_iomap.c
> > +++ b/fs/xfs/xfs_iomap.c
> > @@ -62,29 +62,44 @@ xfs_iomap_inode_sequence(
> >       return cookie | READ_ONCE(ip->i_df.if_seq);
> >  }
> >
> > -/*
> > - * Check that the iomap passed to us is still valid for the given offset and
> > - * length.
> > - */
> > -static bool
> > -xfs_iomap_valid(
> > -     struct inode            *inode,
> > -     const struct iomap      *iomap)
> > +static struct folio *
> > +xfs_get_folio(
> > +     struct iomap_iter       *iter,
> > +     loff_t                  pos,
> > +     unsigned                len)
> >  {
> > +     struct inode            *inode = iter->inode;
> > +     struct iomap            *iomap = &iter->iomap;
> >       struct xfs_inode        *ip = XFS_I(inode);
> > +     struct folio            *folio;
> >
> > +     folio = iomap_get_folio(iter, pos);
> > +     if (IS_ERR(folio))
> > +             return folio;
> > +
> > +     /*
> > +      * Now that we have a locked folio, we need to check that the iomap we
> > +      * have cached is not stale.  The inode extent mapping can change due to
> > +      * concurrent IO in flight (e.g., IOMAP_UNWRITTEN state can change and
> > +      * memory reclaim could have reclaimed a previously partially written
> > +      * page at this index after IO completion before this write reaches
> > +      * this file offset) and hence we could do the wrong thing here (zero a
> > +      * page range incorrectly or fail to zero) and corrupt data.
> > +      */
> >       if (iomap->validity_cookie !=
> >                       xfs_iomap_inode_sequence(ip, iomap->flags)) {
> >               trace_xfs_iomap_invalid(ip, iomap);
> > -             return false;
> > +             folio_unlock(folio);
> > +             folio_put(folio);
> > +             return ERR_PTR(-ESTALE);
> >       }
> >
> >       XFS_ERRORTAG_DELAY(ip->i_mount, XFS_ERRTAG_WRITE_DELAY_MS);
> > -     return true;
> > +     return folio;
> >  }
> >
> >  const struct iomap_page_ops xfs_iomap_page_ops = {
> > -     .iomap_valid            = xfs_iomap_valid,
> > +     .get_folio              = xfs_get_folio,
> >  };
> >
> >  int
> > diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> > index dd3575ada5d1..6f8e3321e475 100644
> > --- a/include/linux/iomap.h
> > +++ b/include/linux/iomap.h
> > @@ -134,29 +134,17 @@ static inline bool iomap_inline_data_valid(const struct iomap *iomap)
> >   * When get_folio succeeds, put_folio will always be called to do any
> >   * cleanup work necessary.  put_folio is responsible for unlocking and putting
> >   * @folio.
> > + *
> > + * When an iomap is created, the filesystem can store internal state (e.g., a
> > + * sequence number) in iomap->validity_cookie.  When it then detects in the
>
> I would reword this to:
>
> "When an iomap is created, the filesystem can store internal state (e.g.
> sequence number) in iomap->validity_cookie.  The get_folio handler can
> use this validity cookie to detect if the iomap is no longer up to date
> and needs to be refreshed.  If this is the case, the function should
> return ERR_PTR(-ESTALE) to retry the operation with a fresh mapping."

Yes, but "e.g." is always followed by a comma and it's "when", not
"if" here. So how about:

 * When an iomap is created, the filesystem can store internal state (e.g., a
 * sequence number) in iomap->validity_cookie.  The get_folio handler can use
 * this validity cookie to detect when the iomap needs to be refreshed because
 * it is no longer up to date.  In that case, the function should return
 * ERR_PTR(-ESTALE) to retry the operation with a fresh mapping.

I've incorporated all your feedback into this branch for now:

https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/log/?h=iomap-race

Thank you,
Andreas


> --D
>
> > + * get_folio handler that the iomap is no longer up to date and needs to be
> > + * refreshed, it can return ERR_PTR(-ESTALE) to trigger a retry.
> >   */
> >  struct iomap_page_ops {
> >       struct folio *(*get_folio)(struct iomap_iter *iter, loff_t pos,
> >                       unsigned len);
> >       void (*put_folio)(struct inode *inode, loff_t pos, unsigned copied,
> >                       struct folio *folio);
> > -
> > -     /*
> > -      * Check that the cached iomap still maps correctly to the filesystem's
> > -      * internal extent map. FS internal extent maps can change while iomap
> > -      * is iterating a cached iomap, so this hook allows iomap to detect that
> > -      * the iomap needs to be refreshed during a long running write
> > -      * operation.
> > -      *
> > -      * The filesystem can store internal state (e.g. a sequence number) in
> > -      * iomap->validity_cookie when the iomap is first mapped to be able to
> > -      * detect changes between mapping time and whenever .iomap_valid() is
> > -      * called.
> > -      *
> > -      * This is called with the folio over the specified file position held
> > -      * locked by the iomap code.
> > -      */
> > -     bool (*iomap_valid)(struct inode *inode, const struct iomap *iomap);
> >  };
> >
> >  /*
> > --
> > 2.38.1
> >

