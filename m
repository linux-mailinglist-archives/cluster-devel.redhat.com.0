Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A409F3B6A6E
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Jun 2021 23:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624915734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=cJ767vfrh4IXdfvFNAN+IwQrIGxYG6OsAHfRcAZ7fBg=;
	b=gqefRGe96rgHmMYYbCL2K5s2gexIEUOfFmvdTz/m7VzZVWdP5KuZqjeYKyNcE+1v5dfdVb
	ToDmhnBDuBSdj6sWRvJdoSSx9epapit94P+TrtbpvwwZivLw4KTvnge8mAThLFMp3u7Qjj
	aupgFCp5qNVyuAINrCY7kcHE0QIM6EY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-Ax4KQd2dOe2HYRZGDTXSxQ-1; Mon, 28 Jun 2021 17:28:52 -0400
X-MC-Unique: Ax4KQd2dOe2HYRZGDTXSxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93D2C1940921;
	Mon, 28 Jun 2021 21:28:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92BF45D719;
	Mon, 28 Jun 2021 21:28:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC01B1809C99;
	Mon, 28 Jun 2021 21:28:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SLScB0004299 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 17:28:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 62AA8AEC85; Mon, 28 Jun 2021 21:28:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B2B2AEC8D
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 21:28:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C21180067D
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 21:28:35 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-8-CJsoljNxNamCqh1qdy1YkQ-1; Mon, 28 Jun 2021 17:28:16 -0400
X-MC-Unique: CJsoljNxNamCqh1qdy1YkQ-1
Received: by mail-wr1-f72.google.com with SMTP id
	a4-20020a0560001884b0290124b6e4a437so3304254wri.16
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 14:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cJ767vfrh4IXdfvFNAN+IwQrIGxYG6OsAHfRcAZ7fBg=;
	b=ZrkzN8qLf7lULGbWvZzZKsn5ePHAYG9rPXO1aiw1qB4CYMxcThwHdnlkLeZCxmPSmS
	UWeI2VpocSHRoTyJp/1z99wfwGjo8K8/1lsrtBTcKD/i03Fesy6b54aqaPHTRwu6YChK
	pWSSMrV1hPv6IBcbUrnh1RHuTPiHzTu7nN+l3P0BO+AV3kQ79tCq1ICEnkm0gbCHyUp0
	ka3PbqqDtfm5vaz4CgGA5BQfCG6M2TGE43AnzmqAx+k9igAM2d/8+SuTLV4An2FCliAT
	sZVO3sIZ8EV4IzKJEUhCVRXUCma2zUZsAxbGJgDpwYn34dQ5lRWNZiAbuPdwGWXSnEQD
	5Idw==
X-Gm-Message-State: AOAM531065Ct3nJNryZNVUSTTvK0In9kyJzNxnnW6DfMTqVVdLrW24iL
	kNL1zwi5VxVZy6Iqc1MwuVQokgbWAxObxONGqmWBtjAS+Jj0JU1Y4/snKhXEIh+VVG1ZdtZEdcn
	Qk4pFXcsasVPqZFC38QWI8tSLma99FCyTpjr64A==
X-Received: by 2002:a05:6000:112:: with SMTP id
	o18mr28513960wrx.289.1624915695209; 
	Mon, 28 Jun 2021 14:28:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziXT1hg1vICxPlVCGN6ewQfxaaiJ7z4+Orc+ZtFBtB0qT203Z7V708+3eTxQuHdvZEwWWyDocdducb1VXOQNw=
X-Received: by 2002:a05:6000:112:: with SMTP id
	o18mr28513946wrx.289.1624915695043; 
	Mon, 28 Jun 2021 14:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210628172727.1894503-1-agruenba@redhat.com>
	<YNoJPZ4NWiqok/by@casper.infradead.org>
	<YNoLTl602RrckQND@infradead.org>
In-Reply-To: <YNoLTl602RrckQND@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 28 Jun 2021 23:28:03 +0200
Message-ID: <CAHc6FU7Aa2ja+UDV84O=xt5hzSE7b9JkhtECzX8DRxxP=W0AXQ@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 8:07 PM Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Jun 28, 2021 at 06:39:09PM +0100, Matthew Wilcox wrote:
> > Not hugely happy with either of these options, tbh.  I'd rather we apply
> > a patch akin to this one (plucked from the folio tree), so won't apply:
>
> > so permit pages without an iop to enter writeback and create an iop
> > *then*.  Would that solve your problem?
>
> It is the right thing to do, especially when combined with a feature
> patch to not bother to create the iomap_page structure on small
> block size file systems when the extent covers the whole page.
>
> >
> > > (3) We're not yet using iomap_page_mkwrite, so iomap_page objects don't
> > > get created on .page_mkwrite, either.  Part of the reason is that
> > > iomap_page_mkwrite locks the page and then calls into the filesystem for
> > > uninlining and for allocating backing blocks.  This conflicts with the
> > > gfs2 locking order: on gfs2, transactions must be started before locking
> > > any pages.  We can fix that by calling iomap_page_create from
> > > gfs2_page_mkwrite, or by doing the uninlining and allocations before
> > > calling iomap_page_mkwrite.  I've implemented option 2 for now; see
> > > here:
> >
> > I think this might also solve this problem?
>
> We'll still need to create the iomap_page structure for page_mkwrite
> if there is an extent boundary inside the page.

Yes, but the iop wouldn't need to be allocated in page_mkwrite; that
would be taken care of by iomap_writepage / iomap_writepages as in the
patch suggested by Matthew, right?

Thanks,
Andreas

