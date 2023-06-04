Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA6F721554
	for <lists+cluster-devel@lfdr.de>; Sun,  4 Jun 2023 09:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685863693;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iVM5jYUzZ2n66xWhGOhqwBQIXf/tDJSlaltfL9geA/4=;
	b=CTFAClZjT/xLsWfEu9ILZHPOI+HwWfxvKZhHKg77IHd0l9rfvmQg6jc2NqZ5eL9cfFgigB
	iB3m/Um4W21+0+vzpiQ2xiYQXgQ8licirHxhHgD/HFo/Ni3MHheJyTefwRckHHvS16OALI
	P2n2ONZSx2vvGjLmIB395K9JI341G5I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-uDSYjjFeMZuBWxSwx8YRJQ-1; Sun, 04 Jun 2023 03:28:10 -0400
X-MC-Unique: uDSYjjFeMZuBWxSwx8YRJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6C96185A78F;
	Sun,  4 Jun 2023 07:28:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 483712166B25;
	Sun,  4 Jun 2023 07:28:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F3E8419465A3;
	Sun,  4 Jun 2023 07:28:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3664D1946595 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  4 Jun 2023 07:28:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0489640C6CD7; Sun,  4 Jun 2023 07:28:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B6E40C6EC4
 for <cluster-devel@redhat.com>; Sun,  4 Jun 2023 07:28:05 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D634A3C025BC
 for <cluster-devel@redhat.com>; Sun,  4 Jun 2023 07:28:05 +0000 (UTC)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-zWwarukGMaehgGluiNGSHg-1; Sun, 04 Jun 2023 03:28:02 -0400
X-MC-Unique: zWwarukGMaehgGluiNGSHg-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-65320a6e904so848067b3a.0
 for <cluster-devel@redhat.com>; Sun, 04 Jun 2023 00:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685863681; x=1688455681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iVM5jYUzZ2n66xWhGOhqwBQIXf/tDJSlaltfL9geA/4=;
 b=BJrE88Xp5vpGz/TJMCql4JavLPArfkjLz5cHZ6TLRaoURicKqKP6OD+c72RbUJqDMj
 yV83k2HIwkWp5uvyJ5PUp7P1pi2oKSF49YCY+OrTTpxTJJdPMgRAXP6ZGXmwN6ilCz7s
 AZDMhPh+bwuCaYQKYm/F1GTqfDzZQAD+1LrC3L9LTZe3nMEHqebEfEUCpQgxTYfPAc+6
 t8RY2HA0AWJV5O6wk3EXVy7T29QZSwwQQMYSMD5PynVb2B+WY67kyr8o1BEWMzi5ME0n
 qWskcosTnmPeUrSR2DMsaZ7XcqiscqTW7JuBWtVpN+ktWXO4zk9VkjknIEaZoNnVWtRA
 uxvQ==
X-Gm-Message-State: AC+VfDw3V3xx5DOn93Olm5j8Ylycwk4dfGNQEdS5ftd6svwowGoLypJX
 o3jgkwpMy0HhR+IgJdl18iiYIB0PXn3ASip/smGVzsRrTtsa9F7KTOb8I5j6SbF4wgRiA6bMvvP
 auE87kgiIg6GLOV+m4HEGrUAaC7mtB3GsWivhrw==
X-Received: by 2002:a05:6a20:918b:b0:114:9bbc:c32a with SMTP id
 v11-20020a056a20918b00b001149bbcc32amr1748400pzd.9.1685863681658; 
 Sun, 04 Jun 2023 00:28:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ69zmeOtpAI+1Goa2YbFwjYqdyUHtfJLDYR4bsav+OGtu2I8GoA18rJmxHu3V64/eooDGcRkZidtiojaLhnAgc=
X-Received: by 2002:a05:6a20:918b:b0:114:9bbc:c32a with SMTP id
 v11-20020a056a20918b00b001149bbcc32amr1748392pzd.9.1685863681303; Sun, 04 Jun
 2023 00:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230517032442.1135379-1-willy@infradead.org>
 <20230517032442.1135379-4-willy@infradead.org>
 <CAHc6FU4G1F1OXC233hT7_Vog9F8GNZyeLwsi+01USSXhFBNc_A@mail.gmail.com>
 <ZHwGhsDPYZQlYksK@casper.infradead.org>
In-Reply-To: <ZHwGhsDPYZQlYksK@casper.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sun, 4 Jun 2023 09:27:48 +0200
Message-ID: <CAHc6FU470Aip5fTsg-8nWjK=p9ND=JCOMSTgxskQ=cwdxk7RtQ@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 3/6] gfs2: Convert
 gfs2_write_jdata_page() to gfs2_write_jdata_folio()
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
Cc: Hannes Reinecke <hare@suse.com>, cluster-devel <cluster-devel@redhat.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 4, 2023 at 5:38=E2=80=AFAM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Sat, Jun 03, 2023 at 11:34:14AM +0200, Andreas Gruenbacher wrote:
> > >   * This is the same as calling block_write_full_page, but it also
> > >   * writes pages outside of i_size
> > >   */
> > > -static int gfs2_write_jdata_page(struct page *page,
> > > +static int gfs2_write_jdata_folio(struct folio *folio,
> > >                                  struct writeback_control *wbc)
> > >  {
> > > -       struct inode * const inode =3D page->mapping->host;
> > > +       struct inode * const inode =3D folio->mapping->host;
> > >         loff_t i_size =3D i_size_read(inode);
> > > -       const pgoff_t end_index =3D i_size >> PAGE_SHIFT;
> > > -       unsigned offset;
> > >
> > > +       if (folio_pos(folio) >=3D i_size)
> > > +               return 0;
> >
> > Function gfs2_write_jdata_page was originally introduced as
> > gfs2_write_full_page in commit fd4c5748b8d3 ("gfs2: writeout truncated
> > pages") to allow writing pages even when they are beyond EOF, as the
> > function description documents.
>
> Well, that was stupid of me.
>
> > This hack was added because simply skipping journaled pages isn't
> > enough on gfs2; before a journaled page can be freed, it needs to be
> > marked as "revoked" in the journal. Journal recovery will then skip
> > the revoked blocks, which allows them to be reused for regular,
> > non-journaled data. We can end up here in contexts in which we cannot
> > "revoke" pages, so instead, we write the original pages even when they
> > are beyond EOF. This hack could be revisited, but it's pretty nasty
> > code to pick apart.
> >
> > So at least the above if needs to go for now.
>
> Understood.  So we probably don't want to waste time zeroing the folio
> if it is entirely beyond i_size, right?  Because at the moment we'd
> zero some essentially random part of the folio if I just take out the
> check.  Should it look like this?
>
>         if (folio_pos(folio) < i_size &&
>             i_size < folio_pos(folio) + folio_size(folio))
>                folio_zero_segment(folio, offset_in_folio(folio, i_size),
>                                 folio_size(folio));

Yes, looking good, thanks.

If you haven't already, could you please consider my other comment as
well before you repost?

https://lore.kernel.org/linux-fsdevel/CAHc6FU6GowpTfX-MgRiqqwZZJ0r-85C9exc2=
pNkBkySCGUT0FA@mail.gmail.com/

Thanks,
Andreas

