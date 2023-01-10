Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B3664E5E
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Jan 2023 22:57:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673387820;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=12ShYM7ppRE60WBKHQJNWT09XNzIxMym8fpTgxr2Dq0=;
	b=ZfEuc1Ke0G4v24RVj2sYVhZ2R7cFhj3xhJ7p0T6FIrj8jqwwVm+SRk7DkeYt5kmwlJiWWJ
	67exwFP6omwuDAtSOY/HXrATu0RWgkZvgm5CRBjCuWseB8nOe1uwkgWRp/lMkte1swG9F5
	yAR8HTJlB28OWH+RyNpxAqlMNjkaChk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-ndUiAaRzPLG0F8wHOnxECg-1; Tue, 10 Jan 2023 16:56:55 -0500
X-MC-Unique: ndUiAaRzPLG0F8wHOnxECg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01BD0811E9C;
	Tue, 10 Jan 2023 21:56:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D1E3C16031;
	Tue, 10 Jan 2023 21:56:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8DD7E1947051;
	Tue, 10 Jan 2023 21:56:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E741D1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 21:56:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AAAE74085721; Tue, 10 Jan 2023 21:56:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A32634085720
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 21:56:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87B7285A588
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 21:56:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-pKTGH3ebOtGr3QPkFFo59A-1; Tue, 10 Jan 2023 16:56:46 -0500
X-MC-Unique: pKTGH3ebOtGr3QPkFFo59A-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2441D618F9;
 Tue, 10 Jan 2023 21:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B15CC433D2;
 Tue, 10 Jan 2023 21:56:44 +0000 (UTC)
Date: Tue, 10 Jan 2023 13:56:44 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y73fHN4aDfbo6e1z@magnolia>
References: <20221231150919.659533-1-agruenba@redhat.com>
 <20221231150919.659533-8-agruenba@redhat.com>
 <Y7W9Dfub1WeTvG8G@magnolia> <Y7XOoZNxZCpjCJLH@casper.infradead.org>
 <Y7r+NkbfDqat9uHA@infradead.org>
 <CAHc6FU40OYCpRjnitmKn6s9LOZCy4O=4XobHdcUeFc=k=x5cGg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU40OYCpRjnitmKn6s9LOZCy4O=4XobHdcUeFc=k=x5cGg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 08, 2023 at 07:50:01PM +0100, Andreas Gruenbacher wrote:
> On Sun, Jan 8, 2023 at 6:32 PM Christoph Hellwig <hch@infradead.org> wrote:
> > On Wed, Jan 04, 2023 at 07:08:17PM +0000, Matthew Wilcox wrote:
> > > On Wed, Jan 04, 2023 at 09:53:17AM -0800, Darrick J. Wong wrote:
> > > > I wonder if this should be reworked a bit to reduce indenting:
> > > >
> > > >     if (PTR_ERR(folio) == -ESTALE) {
> > >
> > > FYI this is a bad habit to be in.  The compiler can optimise
> > >
> > >       if (folio == ERR_PTR(-ESTALE))
> > >
> > > better than it can optimise the other way around.
> >
> > Yes.  I think doing the recording that Darrick suggested combined
> > with this style would be best:
> >
> >         if (folio == ERR_PTR(-ESTALE)) {
> >                 iter->iomap.flags |= IOMAP_F_STALE;
> >                 return 0;
> >         }
> >         if (IS_ERR(folio))
> >                 return PTR_ERR(folio);
> 
> Again, I've implemented this as a nested if because the -ESTALE case
> should be pretty rare, and if we unnest, we end up with an additional
> check on the main code path. To be specific, the "before" code here on
> my current system is this:
> 
> ------------------------------------
>         if (IS_ERR(folio)) {
>     22ad:       48 81 fd 00 f0 ff ff    cmp    $0xfffffffffffff000,%rbp
>     22b4:       0f 87 bf 03 00 00       ja     2679 <iomap_write_begin+0x499>
>                         return 0;
>                 }
>                 return PTR_ERR(folio);
>         }
> [...]
>     2679:       89 e8                   mov    %ebp,%eax
>                 if (folio == ERR_PTR(-ESTALE)) {
>     267b:       48 83 fd 8c             cmp    $0xffffffffffffff8c,%rbp
>     267f:       0f 85 b7 fc ff ff       jne    233c <iomap_write_begin+0x15c>
>                         iter->iomap.flags |= IOMAP_F_STALE;
>     2685:       66 81 4b 42 00 02       orw    $0x200,0x42(%rbx)
>                         return 0;
>     268b:       e9 aa fc ff ff          jmp    233a <iomap_write_begin+0x15a>
> ------------------------------------
> 
> While the "after" code is this:
> 
> ------------------------------------
>         if (folio == ERR_PTR(-ESTALE)) {
>     22ad:       48 83 fd 8c             cmp    $0xffffffffffffff8c,%rbp
>     22b1:       0f 84 bc 00 00 00       je     2373 <iomap_write_begin+0x193>
>                 iter->iomap.flags |= IOMAP_F_STALE;
>                 return 0;
>         }
>         if (IS_ERR(folio))
>                 return PTR_ERR(folio);
>     22b7:       89 e8                   mov    %ebp,%eax
>         if (IS_ERR(folio))
>     22b9:       48 81 fd 00 f0 ff ff    cmp    $0xfffffffffffff000,%rbp
>     22c0:       0f 87 82 00 00 00       ja     2348 <iomap_write_begin+0x168>
> ------------------------------------
> 
> The compiler isn't smart enough to re-nest the ifs by recognizing that
> folio == ERR_PTR(-ESTALE) is a subset of IS_ERR(folio).
> 
> So do you still insist on that un-nesting even though it produces worse code?

Me?  Not anymore. :)

--D

> Thanks,
> Andreas
> 

