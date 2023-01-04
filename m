Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF365DC5F
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 19:51:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672858293;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=bQHtx1jV1iYY+5vmOG5eBZD9J3BMwuA/6luLhUEcbrA=;
	b=EWITlMHMGyW6G462tPZwXl4gwpQzA6QdhTikHNLzDw/bFMniZ+vluN2pudSsoSb5l9/Gpa
	qcRVx38UbDXe/2u70G0MtHS4Uji9Us3DTmlGZgUGvPiEpdtQAoAZu8b48cAh/vf6p2xvWE
	JrN3zBLw4pA0PC70z92sImqhpVYrEv8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-zdIa2-n7MZe_l1dBogCemA-1; Wed, 04 Jan 2023 13:51:29 -0500
X-MC-Unique: zdIa2-n7MZe_l1dBogCemA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27C49857A81;
	Wed,  4 Jan 2023 18:51:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1629F492B07;
	Wed,  4 Jan 2023 18:51:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CFA00194658F;
	Wed,  4 Jan 2023 18:51:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 758B01946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 18:51:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4F33440C2004; Wed,  4 Jan 2023 18:51:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47F0F40C2064
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 18:51:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A86318E0043
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 18:51:26 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-1zEQpiz2Memsd2_8gwOSGg-1; Wed, 04 Jan 2023 13:51:24 -0500
X-MC-Unique: 1zEQpiz2Memsd2_8gwOSGg-1
Received: by mail-qk1-f176.google.com with SMTP id k3so16720645qki.13;
 Wed, 04 Jan 2023 10:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bQHtx1jV1iYY+5vmOG5eBZD9J3BMwuA/6luLhUEcbrA=;
 b=ekdLrSTpWXF87LFb5ffiNyAAIyASE98X3/AaE75601wOjwUtvDFIWruH+ZLJ1wFW4M
 yS5WSns0TZb3VPtj2zwicNTvPmZTnx7300e/VT5MV1EEqnBd9j04WHerSsI4cbv1wsYj
 y7LnZp5+4D0t8DpZSOGHN1QGAOUvOHg2Cyk0j22NiITk9tlaLLKsqourZdcndhJgyeoq
 2Ib1SykKb9Y0JRu36OL+9FfGsinJaz4bVDHdd2kIwpIWSDUofEzTyKRZr7PSvmZL6cN1
 dvAnzZbKk9VLM7eFn2NpsZH5sy2YRRGvzr0ZX+kV/xcsy+ZSrD2WHpI7NlqLD9bwrgLP
 Zg6A==
X-Gm-Message-State: AFqh2koFvep77NaKu1Si6evkcBjU2hjTiP/c382oDvb+Oql+r5Gg/Eck
 EVTPgD6255qHol4/sUtiHnX5vzXAFEp8zCFYRwU=
X-Google-Smtp-Source: AMrXdXtBsLz6jVERQ2FgRgHifewHsGn5S/jauQZ041epROuzVCvMzwihHIjCh5xjhWaDvOR5Z42UK1HfWetvk4obWeM=
X-Received: by 2002:a05:620a:8305:b0:6fe:e149:de1c with SMTP id
 pa5-20020a05620a830500b006fee149de1cmr2415370qkn.572.1672858283805; Wed, 04
 Jan 2023 10:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20221231150919.659533-1-agruenba@redhat.com>
 <20221231150919.659533-4-agruenba@redhat.com>
 <Y7W5RGsOgOThtlg3@magnolia>
In-Reply-To: <Y7W5RGsOgOThtlg3@magnolia>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Wed, 4 Jan 2023 19:51:12 +0100
Message-ID: <CAHpGcMK_=KxrhBRxv2msUHSAJ=X=vJM0yG1rnVtJwiZbhhvxTw@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v5 3/9] iomap: Rename page_done handler
 to put_folio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Mi., 4. Jan. 2023 um 18:47 Uhr schrieb Darrick J. Wong <djwong@kernel.org>:
>
> On Sat, Dec 31, 2022 at 04:09:13PM +0100, Andreas Gruenbacher wrote:
> > The ->page_done() handler in struct iomap_page_ops is now somewhat
> > misnamed in that it mainly deals with unlocking and putting a folio, so
> > rename it to ->put_folio().
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >  fs/gfs2/bmap.c         |  4 ++--
> >  fs/iomap/buffered-io.c |  4 ++--
> >  include/linux/iomap.h  | 10 +++++-----
> >  3 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> > index 46206286ad42..0c041459677b 100644
> > --- a/fs/gfs2/bmap.c
> > +++ b/fs/gfs2/bmap.c
> > @@ -967,7 +967,7 @@ static int gfs2_iomap_page_prepare(struct inode *inode, loff_t pos,
> >       return gfs2_trans_begin(sdp, RES_DINODE + blocks, 0);
> >  }
> >
> > -static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
> > +static void gfs2_iomap_put_folio(struct inode *inode, loff_t pos,
> >                                unsigned copied, struct folio *folio)
> >  {
> >       struct gfs2_trans *tr = current->journal_info;
> > @@ -994,7 +994,7 @@ static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
> >
> >  static const struct iomap_page_ops gfs2_iomap_page_ops = {
> >       .page_prepare = gfs2_iomap_page_prepare,
> > -     .page_done = gfs2_iomap_page_done,
> > +     .put_folio = gfs2_iomap_put_folio,
> >  };
> >
> >  static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index e13d5694e299..2a9bab4f3c79 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -580,8 +580,8 @@ static void iomap_put_folio(struct iomap_iter *iter, loff_t pos, size_t ret,
> >  {
> >       const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
> >
> > -     if (page_ops && page_ops->page_done) {
> > -             page_ops->page_done(iter->inode, pos, ret, folio);
> > +     if (page_ops && page_ops->put_folio) {
> > +             page_ops->put_folio(iter->inode, pos, ret, folio);
> >       } else if (folio) {
> >               folio_unlock(folio);
> >               folio_put(folio);
> > diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> > index 743e2a909162..10ec36f373f4 100644
> > --- a/include/linux/iomap.h
> > +++ b/include/linux/iomap.h
> > @@ -126,18 +126,18 @@ static inline bool iomap_inline_data_valid(const struct iomap *iomap)
> >
> >  /*
> >   * When a filesystem sets page_ops in an iomap mapping it returns, page_prepare
> > - * and page_done will be called for each page written to.  This only applies to
> > + * and put_folio will be called for each page written to.  This only applies to
>
> "...for each folio written to."

Ah, yes.

> With that fixed,
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
>
> --D
>
>
> >   * buffered writes as unbuffered writes will not typically have pages

And here, it should be "folios" as well I'd say.

Thanks,
Andreas

> >   * associated with them.
> >   *
> > - * When page_prepare succeeds, page_done will always be called to do any
> > - * cleanup work necessary.  In that page_done call, @folio will be NULL if the
> > - * associated folio could not be obtained.  When folio is not NULL, page_done
> > + * When page_prepare succeeds, put_folio will always be called to do any
> > + * cleanup work necessary.  In that put_folio call, @folio will be NULL if the
> > + * associated folio could not be obtained.  When folio is not NULL, put_folio
> >   * is responsible for unlocking and putting the folio.
> >   */
> >  struct iomap_page_ops {
> >       int (*page_prepare)(struct inode *inode, loff_t pos, unsigned len);
> > -     void (*page_done)(struct inode *inode, loff_t pos, unsigned copied,
> > +     void (*put_folio)(struct inode *inode, loff_t pos, unsigned copied,
> >                       struct folio *folio);
> >
> >       /*
> > --
> > 2.38.1
> >

