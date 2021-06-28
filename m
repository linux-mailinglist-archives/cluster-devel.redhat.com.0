Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 007663B67FD
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Jun 2021 19:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624902926;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=9xx3aix+D5Tr8zE04rXkig/bU4Pi+06/8LbOmmRbtrw=;
	b=HS/+JhFjFDbvP0Qq7p0FeH2yStCGIeJI/xf9ONgEzySC3iFI/vDDuHM9vHJQxd0SGM9KIA
	2cXlyMvqLsQt8CP26zKfx0yWasYwPKYRj6AL5v7rMeXLhybKCSd6dhBwdnLH7SrpPzyXtI
	h2Hb71IzC5Vt7dTX/zRSJxbzkqzn3bk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-X1NPqSGwNROqo6lUkua_dw-1; Mon, 28 Jun 2021 13:55:24 -0400
X-MC-Unique: X1NPqSGwNROqo6lUkua_dw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC31C800D55;
	Mon, 28 Jun 2021 17:55:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEE7C60854;
	Mon, 28 Jun 2021 17:55:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCB771809C99;
	Mon, 28 Jun 2021 17:55:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SHtKkH019661 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 13:55:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 928F5200C0D5; Mon, 28 Jun 2021 17:55:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E685200BCD0
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 17:55:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 358B3805A30
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 17:55:18 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-548-oJ3BtJIkNcqDXgKO_JSsMA-1; Mon, 28 Jun 2021 13:55:16 -0400
X-MC-Unique: oJ3BtJIkNcqDXgKO_JSsMA-1
Received: by mail-wr1-f70.google.com with SMTP id
	x8-20020a5d54c80000b029012583535285so1132996wrv.8
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 10:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9xx3aix+D5Tr8zE04rXkig/bU4Pi+06/8LbOmmRbtrw=;
	b=JcXeBTUI36AMM8Aa4Jz3kI3GS3tOSbvDPUCIkAQTLMtLF/vo6qnfEgDbEYqEQrlw99
	wYg+ljcCbvGAItV72ycNs/en5z6yDtGkG6c4eOHd6bytiKZ1m8Yzg41hv0gho7VRgoRu
	MZk7cuKQKbDedVsOvDBVAYskKJXqEL0jAx8Xm6zSrEhlWEpSjbiVBe1jyrtQ1R0xbVtw
	J/7W1cf1bCLQZidW3PCV38EfXpXOG+CXN6RQVkkHUGBaqe7uxJnZcy20Z7YtuHcfjhCC
	OBfhXwucSAU6ZnAQvA6jZgZ119eNUzo4fLC+icHc9duZy8i4EOlP2Kww5pnfEEF7B0vv
	eKUQ==
X-Gm-Message-State: AOAM530EPJsyQFYzRmkhjpCtRXsJJF5OIWRbPlmi50yqj5XsvhCaS4/J
	DOuAjVO1huXeeXOJcj9sCTvmhbk9BxEc+bD4e18RxvgEkLbFUMh96oqq2N2tNCG7JNOrNfDlbd1
	M7Fr2+ggisCXGfa6Cxlft09mM1gDCFj5KY958MA==
X-Received: by 2002:a5d:5745:: with SMTP id q5mr1987547wrw.329.1624902915373; 
	Mon, 28 Jun 2021 10:55:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM0AJBi5M/RdX9OijjwR4Wd6ZMMoGR51dlTSusBJc5+SZh1Ir838Q0/HWfs3XJf/JcDJ92e03R7DtCTSUSI7c=
X-Received: by 2002:a5d:5745:: with SMTP id q5mr1987533wrw.329.1624902915263; 
	Mon, 28 Jun 2021 10:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210628172727.1894503-1-agruenba@redhat.com>
	<YNoJPZ4NWiqok/by@casper.infradead.org>
In-Reply-To: <YNoJPZ4NWiqok/by@casper.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 28 Jun 2021 19:55:04 +0200
Message-ID: <CAHc6FU5tkvH5WNFuiwRZKNhYZdj2z+Q2bXzp31xBP8mbnnYhzw@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: "Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-xfs@vger.kernel.org,
	cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 0/2] iomap: small block problems
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

On Mon, Jun 28, 2021 at 7:40 PM Matthew Wilcox <willy@infradead.org> wrote:
> On Mon, Jun 28, 2021 at 07:27:25PM +0200, Andreas Gruenbacher wrote:
> > (1) In iomap_readpage_actor, an iomap_page is attached to the page even
> > for inline inodes.  This is unnecessary because inline inodes don't need
> > iomap_page objects.  That alone wouldn't cause any real issues, but when
> > iomap_read_inline_data copies the inline data into the page, it sets the
> > PageUptodate flag without setting iop->uptodate, causing an
> > inconsistency between the two.  This will trigger a WARN_ON in
> > iomap_page_release.  The fix should be not to allocate iomap_page
> > objects when reading from inline inodes (patch 1).
>
> I don't have a problem with this patch.
>
> > (2) When un-inlining an inode, we must allocate a page with an attached
> > iomap_page object (iomap_page_create) and initialize the iop->uptodate
> > bitmap (iomap_set_range_uptodate).  We can't currently do that because
> > iomap_page_create and iomap_set_range_uptodate are not exported.  That
> > could be fixed by exporting those functions, or by implementing an
> > additional helper as in patch 2.  Which of the two would you prefer?
>
> Not hugely happy with either of these options, tbh.  I'd rather we apply
> a patch akin to this one (plucked from the folio tree), so won't apply:
>
> @@ -1305,7 +1311,7 @@ iomap_writepage_map(struct iomap_writepage_ctx *wpc,
>                 struct writeback_control *wbc, struct inode *inode,
>                 struct folio *folio, loff_t end_pos)
>  {
> -       struct iomap_page *iop = to_iomap_page(folio);
> +       struct iomap_page *iop = iomap_page_create(inode, folio);
>         struct iomap_ioend *ioend, *next;
>         unsigned len = i_blocksize(inode);
>         unsigned nblocks = i_blocks_per_folio(inode, folio);
> @@ -1313,7 +1319,6 @@ iomap_writepage_map(struct iomap_writepage_ctx *wpc,
>         int error = 0, count = 0, i;
>         LIST_HEAD(submit_list);
>
> -       WARN_ON_ONCE(nblocks > 1 && !iop);
>         WARN_ON_ONCE(iop && atomic_read(&iop->write_bytes_pending) != 0);
>
>         /*
>
> so permit pages without an iop to enter writeback and create an iop
> *then*.  Would that solve your problem?

It probably would. Let me do some testing based on that.

> > (3) We're not yet using iomap_page_mkwrite, so iomap_page objects don't
> > get created on .page_mkwrite, either.  Part of the reason is that
> > iomap_page_mkwrite locks the page and then calls into the filesystem for
> > uninlining and for allocating backing blocks.  This conflicts with the
> > gfs2 locking order: on gfs2, transactions must be started before locking
> > any pages.  We can fix that by calling iomap_page_create from
> > gfs2_page_mkwrite, or by doing the uninlining and allocations before
> > calling iomap_page_mkwrite.  I've implemented option 2 for now; see
> > here:
>
> I think this might also solve this problem?

Probably yes.

Thanks,
Andreas

