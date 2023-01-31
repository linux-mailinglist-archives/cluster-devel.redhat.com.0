Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2776838B2
	for <lists+cluster-devel@lfdr.de>; Tue, 31 Jan 2023 22:33:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675200804;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+Rg6fbl7dgG4jCUNGUH6At0nHeKDb4FxUgvQsWlsCTI=;
	b=JtBph6w6A1u9dlx5+M1GwZVKjXw0TtWp6jlAvA9NMcA3uwshYGufpODIRLulCD+WJsWYOi
	/AlBkZZ3eD4Y/gYbdxchrhPwlrnKyURRZciCe3ru/L5JGd3/KWuRSm05rRLbDHj9lqAVg7
	MJgp4ozRL0vgVChsNg7mfUjYFZ3t4KA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-99hgSfeCPWyvip2_zrUNKg-1; Tue, 31 Jan 2023 16:33:21 -0500
X-MC-Unique: 99hgSfeCPWyvip2_zrUNKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEA6129DD98A;
	Tue, 31 Jan 2023 21:33:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8767112132C;
	Tue, 31 Jan 2023 21:33:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9A4741946594;
	Tue, 31 Jan 2023 21:33:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A1C5B1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 31 Jan 2023 21:33:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 91129112132E; Tue, 31 Jan 2023 21:33:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89A6F112132C
 for <cluster-devel@redhat.com>; Tue, 31 Jan 2023 21:33:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 686D285A5B1
 for <cluster-devel@redhat.com>; Tue, 31 Jan 2023 21:33:17 +0000 (UTC)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-8XW8eX9wM9SLMqqJewRpDg-1; Tue, 31 Jan 2023 16:33:15 -0500
X-MC-Unique: 8XW8eX9wM9SLMqqJewRpDg-1
Received: by mail-pf1-f198.google.com with SMTP id
 f15-20020a62380f000000b0058db55a8d7aso7913433pfa.21
 for <cluster-devel@redhat.com>; Tue, 31 Jan 2023 13:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Rg6fbl7dgG4jCUNGUH6At0nHeKDb4FxUgvQsWlsCTI=;
 b=vLK15+uvixfifyxs1hqD+zhfInNW6AIc33zDqcgJJbJvETMHXfH8NTPDa4eWaJNwHQ
 HqrZh7zPLSkREDMgwCYM/+dniWuDq+ixqMt/fQ7XdhOaiMPSvBBdTQ6Z9SVlaLrFEUNB
 peXhntMOJWhUTkAW9cEYdJ/EDYcjHqoeuMAKJuMyzWWVlk+NsTVha4REJQtAuIrTLmqw
 3bytJZ4P7Gj590JxaV0CjXCqwZU7xURm17j5u1dPn6uoI8m3MOGrn/p6+vZ20z+jS1FG
 LukjWruq1ht9d03NKomQ4xQfTXcp2YWVcXUU3OKihj+sIbFZ44BCUSlil8PJqW8NMrD7
 aStw==
X-Gm-Message-State: AO0yUKXbRhriUtzwxAPYRX2E18CxBJcS6lQlGBtTtZERvAzm5BlpqTrO
 G4NgPCyMhRw7zKUu2+ZrTP/7dRdWhhoIznkVaY6ZS5VNy+zh1jyhzTtGqq1IngnjvFApYSB4Eoo
 UYWZzCR0+x+qxCd3JUhpEOBjoBlgyrEwUmiAG7w==
X-Received: by 2002:a17:90a:9316:b0:226:e191:4417 with SMTP id
 p22-20020a17090a931600b00226e1914417mr144883pjo.16.1675200794888; 
 Tue, 31 Jan 2023 13:33:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+3ftaiw544NuVW2ZH8VprBCE7BMkB5bi8ZRGRO28/BUbobq+S5msnCbAA7Nc5bdoIiQID9vxZV3vXM/MQm+Bg=
X-Received: by 2002:a17:90a:9316:b0:226:e191:4417 with SMTP id
 p22-20020a17090a931600b00226e1914417mr144879pjo.16.1675200794625; Tue, 31 Jan
 2023 13:33:14 -0800 (PST)
MIME-Version: 1.0
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-6-agruenba@redhat.com>
 <Y9lt/95kN6kwp+A1@casper.infradead.org>
In-Reply-To: <Y9lt/95kN6kwp+A1@casper.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 31 Jan 2023 22:33:02 +0100
Message-ID: <CAHc6FU6DoR7c5Cmwvdpzs9Vc1M-wVn4sip4vscN89LwMYiwFpQ@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [RFC v6 05/10] iomap/gfs2: Get page in
 page_prepare handler
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
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 31, 2023 at 8:37 PM Matthew Wilcox <willy@infradead.org> wrote:
> On Sun, Jan 08, 2023 at 08:40:29PM +0100, Andreas Gruenbacher wrote:
> > +static struct folio *
> > +gfs2_iomap_page_prepare(struct iomap_iter *iter, loff_t pos, unsigned len)
> >  {
> > +     struct inode *inode = iter->inode;
> >       unsigned int blockmask = i_blocksize(inode) - 1;
> >       struct gfs2_sbd *sdp = GFS2_SB(inode);
> >       unsigned int blocks;
> > +     struct folio *folio;
> > +     int status;
> >
> >       blocks = ((pos & blockmask) + len + blockmask) >> inode->i_blkbits;
> > -     return gfs2_trans_begin(sdp, RES_DINODE + blocks, 0);
> > +     status = gfs2_trans_begin(sdp, RES_DINODE + blocks, 0);
> > +     if (status)
> > +             return ERR_PTR(status);
> > +
> > +     folio = iomap_get_folio(iter, pos);
> > +     if (IS_ERR(folio))
> > +             gfs2_trans_end(sdp);
> > +     return folio;
> >  }
>
> Hi Andreas,

Hello,

> I didn't think to mention this at the time, but I was reading through
> buffered-io.c and this jumped out at me.  For filesystems which support
> folios, we pass the entire length of the write (or at least the length
> of the remaining iomap length).  That's intended to allow us to decide
> how large a folio to allocate at some point in the future.
>
> For GFS2, we do this:
>
>         if (!mapping_large_folio_support(iter->inode->i_mapping))
>                 len = min_t(size_t, len, PAGE_SIZE - offset_in_page(pos));
>
> I'd like to drop that and pass the full length of the write to
> ->get_folio().  It looks like you'll have to clamp it yourself at this
> point.

sounds reasonable to me.

I see that gfs2_page_add_databufs() hasn't been folio-ized yet, but it
looks like it might just work anway. So gfs2_iomap_get_folio() ...
gfs2_iomap_put_folio() should, in principle, work for requests bigger
than PAGE_SIZE.

Is there a reasonable way of trying it out?

We still want to keep the transaction size somewhat reasonable, but
the maximum size gfs2_iomap_begin() will return for a write is 509
blocks on a 4k-block filesystem, or slightly less than 2 MiB, which
should be fine.

>  I am kind of curious why you do one transaction per page --
> I would have thought you'd rather do one transaction for the entire write.

Only for journaled data writes. We could probably do bigger
transactions even in that case, but we'd rather get rid of data
journaling than encourage it, so we're also not spending a lot of time
on optimizing this case.

Thanks,
Andreas

