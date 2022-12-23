Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B447B65549E
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Dec 2022 21:54:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671828895;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=elNIdyx1h5Jg1j16dMpw5pELc93eL/yPHRGnY+J1k3M=;
	b=UJrJuTnhm88wM73KQK92vtViZRvunDnjEGCGdCmN6bjvvLxXfz6bRQvtyzDbIsaB9/oOw9
	Zl8zfg5InuW4ymaHzs+NBt6O+BvlHr0UoYcWeDvVfgpSCjzz1Yqolu0YlODKSyyr56ZJJQ
	V4cFpTCyVzgj4ehHixguQ7e1vt2JtpI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-6feUmHNyP4m5afK5iEu09g-1; Fri, 23 Dec 2022 15:54:52 -0500
X-MC-Unique: 6feUmHNyP4m5afK5iEu09g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B435380D0EA;
	Fri, 23 Dec 2022 20:54:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6849C15BA0;
	Fri, 23 Dec 2022 20:54:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 78E3719465B6;
	Fri, 23 Dec 2022 20:54:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 314E119465B1 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 23 Dec 2022 20:54:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 06550C15BAE; Fri, 23 Dec 2022 20:54:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F34F6C15BA0
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 20:54:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA5CD811E9C
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 20:54:48 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-fhlfyiFQNs6A0fDjk3_uqw-1; Fri, 23 Dec 2022 15:54:47 -0500
X-MC-Unique: fhlfyiFQNs6A0fDjk3_uqw-1
Received: by mail-qk1-f170.google.com with SMTP id f28so2842978qkh.10;
 Fri, 23 Dec 2022 12:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=elNIdyx1h5Jg1j16dMpw5pELc93eL/yPHRGnY+J1k3M=;
 b=n20U6/tecgUkIKyaFlf/TCAhG6fYjPtDiJtj2Ap4sFt2Y4oN+3Q4IuvOS/QSA64qSy
 IzjivsVtV4dqZM/uYPaYrkSc5Tds1TPo6Ca7IkP7SivoC7tiHzHmLXC4qON4RjpHFgEG
 Ph/q/+nBpXbEqLjY1HTlihZiuS8DFYR3VE7eKZjd4XPJQUdzVesaOaJ2JkZM9k0qak8Z
 +p2ZvKbxdaXsXnnlpTcSAEEQfPAZSW0DXdm8KBJXT9P/c85okIGmJbtKE8QgjoabpjOT
 ewXJ2CUmExOErC2p3MbuMewCfsAmB6uI0ocGMsTF9pzukrXdDMYcBIKeIADz/rA3+URo
 kb7A==
X-Gm-Message-State: AFqh2kq15gMOktCBnHnqsrueSA9assW0AF9fr6KC3P3b3e8p2C507ERQ
 M0JsaWy0Ka0ewSA9jDGqgICyDsqzr5Pv6cLLL+k=
X-Google-Smtp-Source: AMrXdXtXXrJvPZjl+kD+zsNOKG6ZjJVact6gML4iYFi1bbi/Xhv9RiWizo11/tOBp9Mw346MQ1ZFHK3wAwV+DdSSVvE=
X-Received: by 2002:a37:b04:0:b0:6ff:b5c2:e181 with SMTP id
 4-20020a370b04000000b006ffb5c2e181mr434881qkl.236.1671828886302; Fri, 23 Dec
 2022 12:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20221216150626.670312-1-agruenba@redhat.com>
 <20221216150626.670312-3-agruenba@redhat.com>
 <Y6XDAG25Qumt/iyM@infradead.org>
In-Reply-To: <Y6XDAG25Qumt/iyM@infradead.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 23 Dec 2022 21:54:34 +0100
Message-ID: <CAHpGcMJAnyn_7hHvsPL5GAiwbJs_DX04+Tt0P+6jfi_kb7jGUg@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [RFC v3 2/7] iomap: Add iomap_folio_done helper
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
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Fr., 23. Dez. 2022 um 16:12 Uhr schrieb Christoph Hellwig
<hch@infradead.org>:
> On Fri, Dec 16, 2022 at 04:06:21PM +0100, Andreas Gruenbacher wrote:
> > +static void iomap_folio_done(struct iomap_iter *iter, loff_t pos, size_t ret,
> > +             struct folio *folio)
> > +{
> > +     const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
> > +
> > +     if (folio)
> > +             folio_unlock(folio);
> > +     if (page_ops && page_ops->page_done)
> > +             page_ops->page_done(iter->inode, pos, ret, &folio->page);
> > +     if (folio)
> > +             folio_put(folio);
> > +}
>
> How is the folio dereference going to work if folio is NULL?

'&folio->page' is effectively a type cast, not a dereference. I
realize iomap_folio_done() as introduced here is not pretty, but it's
only an intermediary step and the ugliness goes away later in this
series.

> That being said, I really wonder if the current API is the right way to
> go.  Can't we just have a ->get_folio method with the same signature as
> __filemap_get_folio, and then do the __filemap_get_folio from the file
> system and avoid the page/folio == NULL clean path entirely?  Then on
> the done side move the unlock and put into the done method as well.

Yes, this is what happens later in this series (as you've seen by now).

> >       if (!folio) {
> >               status = (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
> > -             goto out_no_page;
> > +             iomap_folio_done(iter, pos, 0, NULL);
> > +             return status;
> >       }
> >
> >       /*
> > @@ -656,13 +670,9 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
> >       return 0;
> >
> >  out_unlock:
> > -     folio_unlock(folio);
> > -     folio_put(folio);
> > +     iomap_folio_done(iter, pos, 0, folio);
> >       iomap_write_failed(iter->inode, pos, len);
> >
> > -out_no_page:
> > -     if (page_ops && page_ops->page_done)
> > -             page_ops->page_done(iter->inode, pos, 0, NULL);
> >       return status;
>
> But for the current version I don't really understand why the error
> unwinding changes here.

Currently, we have this order of operations in iomap_write_begin():

  folio_unlock() // folio_put() // iomap_write_failed() // ->page_done()

and this order in iomap_write_end():

  folio_unlock() // ->page_done() // folio_put() // iomap_write_failed()

The unwinding in iomap_write_begin() works because this is the trivial
case in which nothing happens to the page. We might just as well use
the same order of operations there as in iomap_write_end() though, and
when you switch to that, this is what you get.

Thank you for the review.

Andreas

