Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B29A84544FA
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Nov 2021 11:28:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637144921;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PeLytMpeobAX/Mbka1azxJ5y2EI4oXxreVBxQFm+D34=;
	b=R+rzMwnDclTIyddDaECSFWEmOvkM+OD73DuyOjA2zyOs7Dkg19ayHfGF+AmrfI/RtHAaAU
	q0mWgA1oWgFp1sVYnwBpriO6NppHONbAhylQ5EznCiKADvrK4EPAauefGM99uYvDEfPDUG
	FulZrEcKQLJU7eDDwdR1VhXj072WYjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-Jr7SuCjtO_Ww1QXtZacVjQ-1; Wed, 17 Nov 2021 05:28:38 -0500
X-MC-Unique: Jr7SuCjtO_Ww1QXtZacVjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CB081851724;
	Wed, 17 Nov 2021 10:28:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A87318A50;
	Wed, 17 Nov 2021 10:28:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA7E44A703;
	Wed, 17 Nov 2021 10:28:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHAPJKI012334 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 05:25:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E3DDA51E3; Wed, 17 Nov 2021 10:25:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE03A51DD
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 10:25:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 975AE811E76
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 10:25:10 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-545-5yicOCkVNw-GuCVKrXr6dQ-1; Wed, 17 Nov 2021 05:25:09 -0500
X-MC-Unique: 5yicOCkVNw-GuCVKrXr6dQ-1
Received: by mail-wm1-f69.google.com with SMTP id
	o18-20020a05600c511200b00332fa17a02eso1237378wms.5
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 02:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PeLytMpeobAX/Mbka1azxJ5y2EI4oXxreVBxQFm+D34=;
	b=XpYH45EQAq0m9mE1Wj7VueYxvZM6eqvGFP68IbWxlQO71beYlMf1Wj926jjYRDGk0d
	FF4N6kw2JRR+dSWaAVg988IuP4o/KFnVOvSw/dEx86AfZkbQEHCLpM6NgB4gBHNMSORw
	RPYl8grfDer8tEGjJn2I9YY+jV2RV1yF3omChne2Pac5Ec+UroWaTV+dIC5NJvc9gCJF
	Z+PoTtcdL3Ut0WkQMp9vO7sdx1XkV6e/JzpHW3v4i6a4fLrY1IiANSg19cV7k6bI+sKj
	CW0qO054NZdqU1NaAY5nW/gHeix51LGeb/Ty+QitHME6hTameuzMkAu5KkLBJ+i79yLI
	vt+A==
X-Gm-Message-State: AOAM533EvUE3FTn1Dh88J9KTwCbf6RZQNHWDCJfnXXTbRXV75GkVL1Op
	3YqeW4qgt194jSzGcghMazHviI4Ib6qnOqMwklmf8Vq3z6rukEfgEAJgUVctWrz6SJ3BSb0h9jg
	XN26bz8MhQB2yeXWswsbiBzxH+vmWNm+CreED9w==
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr19042059wrr.11.1637144708088; 
	Wed, 17 Nov 2021 02:25:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxV/yzimt/rDgfIdS6R4Pe333apTi73Ff+k6sK61bEAJtugKa8lazitGgtGHk5ESX82WxjntResUX5IKf1Fx4o=
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr19042003wrr.11.1637144707799; 
	Wed, 17 Nov 2021 02:25:07 -0800 (PST)
MIME-Version: 1.0
References: <20211111161714.584718-1-agruenba@redhat.com>
	<20211117053330.GU24307@magnolia>
In-Reply-To: <20211117053330.GU24307@magnolia>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 17 Nov 2021 11:24:56 +0100
Message-ID: <CAHc6FU4rY=G-pdKzYPVXyQ5SEhtfgh_9CK9wNKbBQRONuP=BFA@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Christoph Hellwig <hch@lst.de>, stable <stable@vger.kernel.org>
Subject: Re: [Cluster-devel] [5.15 REGRESSION v2] iomap: Fix inline extent
	handling in iomap_readpage
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 6:33 AM Darrick J. Wong <djwong@kernel.org> wrote:
> On Thu, Nov 11, 2021 at 05:17:14PM +0100, Andreas Gruenbacher wrote:
> > Before commit 740499c78408 ("iomap: fix the iomap_readpage_actor return
> > value for inline data"), when hitting an IOMAP_INLINE extent,
> > iomap_readpage_actor would report having read the entire page.  Since
> > then, it only reports having read the inline data (iomap->length).
> >
> > This will force iomap_readpage into another iteration, and the
> > filesystem will report an unaligned hole after the IOMAP_INLINE extent.
> > But iomap_readpage_actor (now iomap_readpage_iter) isn't prepared to
> > deal with unaligned extents, it will get things wrong on filesystems
> > with a block size smaller than the page size, and we'll eventually run
> > into the following warning in iomap_iter_advance:
> >
> >   WARN_ON_ONCE(iter->processed > iomap_length(iter));
> >
> > Fix that by changing iomap_readpage_iter to return 0 when hitting an
> > inline extent; this will cause iomap_iter to stop immediately.
>
> I guess this means that we also only support having inline data that
> ends at EOF?  IIRC this is true for the three(?) filesystems that have
> expressed any interest in inline data: yours, ext4, and erofs?

Yes.

> > To fix readahead as well, change iomap_readahead_iter to pass on
> > iomap_readpage_iter return values less than or equal to zero.
> >
> > Fixes: 740499c78408 ("iomap: fix the iomap_readpage_actor return value for inline data")
> > Cc: stable@vger.kernel.org # v5.15+
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >  fs/iomap/buffered-io.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index 1753c26c8e76..fe10d8a30f6b 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -256,8 +256,13 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
> >       unsigned poff, plen;
> >       sector_t sector;
> >
> > -     if (iomap->type == IOMAP_INLINE)
> > -             return min(iomap_read_inline_data(iter, page), length);
> > +     if (iomap->type == IOMAP_INLINE) {
> > +             loff_t ret = iomap_read_inline_data(iter, page);
>
> Ew, iomap_read_inline_data returns loff_t.  I think I'll slip in a
> change of return type to ssize_t, if you don't mind?

Really?

> > +
> > +             if (ret < 0)
> > +                     return ret;
>
> ...and a comment here explaining that we only support inline data that
> ends at EOF?

I'll send a separate patch that adds a description for
iomap_read_inline_data and cleans up its return value.

Thanks,
Andreas

> If the answers to all /four/ questions are 'yes', then consider this:
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
>
> --D
>
> > +             return 0;
> > +     }
> >
> >       /* zero post-eof blocks as the page may be mapped */
> >       iop = iomap_page_create(iter->inode, page);
> > @@ -370,6 +375,8 @@ static loff_t iomap_readahead_iter(const struct iomap_iter *iter,
> >                       ctx->cur_page_in_bio = false;
> >               }
> >               ret = iomap_readpage_iter(iter, ctx, done);
> > +             if (ret <= 0)
> > +                     return ret;
> >       }
> >
> >       return done;
> > --
> > 2.31.1
> >
>

