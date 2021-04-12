Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2792235C536
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Apr 2021 13:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618227172;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=32rsc2AMRbzObQAbgCkkNeZVKIlszgJHXH+1Cz61vsE=;
	b=gbpW9V/nESqq1fX00YAJcMO+JruugPKC5FiHZoaQyC/syIUHHgaSD3CSm737OKChrB/cqN
	c35Pi+z97WJUU0xDgBB8OiEYnnyEkBWZHpwle6YAmPuDcAyOtSQucn6UvQmLJ7Jv0rs2p7
	mN9qnK2Dbbz5bWw31W4yybpEYg+f1RA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-Z9lv7WjBN6S_zCafGVnEbw-1; Mon, 12 Apr 2021 07:32:50 -0400
X-MC-Unique: Z9lv7WjBN6S_zCafGVnEbw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87614189C44D;
	Mon, 12 Apr 2021 11:32:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E93515C559;
	Mon, 12 Apr 2021 11:32:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBDB31806D0E;
	Mon, 12 Apr 2021 11:32:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13CBWKr9004858 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 07:32:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 633081111A65; Mon, 12 Apr 2021 11:32:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E9181111A64
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 11:32:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0481A811E7A
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 11:32:18 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-106-3aRp3QoWP22U1Qj78a-YRA-1; Mon, 12 Apr 2021 07:32:16 -0400
X-MC-Unique: 3aRp3QoWP22U1Qj78a-YRA-1
Received: by mail-wm1-f71.google.com with SMTP id
	b20-20020a7bc2540000b029010f7732a35fso5968658wmj.1
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 04:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=32rsc2AMRbzObQAbgCkkNeZVKIlszgJHXH+1Cz61vsE=;
	b=sh+tUeA0WmhQyln69d/ayofsW/TNgH1zHOTdPEGR34vECAvuqnag69jlNVFmb5IUzG
	lRcZLMRFBwphSFRbuSLXo/fV2epL4t8OD8+Dum6YqBs0en4brAwo4HSXbMDCbo0WTW3S
	O5SLzuv69+vcc5uoRCxkBBv0TSlaDtqScnEJbUVyp/rEjHBf1ph8gV9nkEfUjbGKQvju
	0YBAoIipIMf45BZxhoyoMBfy2jVhg5cKjbLUqwj6JIOZVdzseHh8o2DqD2gzjYe7NCB2
	Swun9TVw0ZTAjPr4++simEayALZugueUpAneySPw0cTODxK93jx1vsLVhb8Tms3LLwVw
	arwg==
X-Gm-Message-State: AOAM532TA+dVNzHuJvDt6rgO1DsWiqxsSySymXs0PKdTQ1VscSo5R24L
	j32onPDwegTYhVILF/EfMH/DtZdI8D//Go+//GRSA4LqhCeM0LHZ6yztczzxOHRuDzAlwM1/wKW
	V+DRQ7HXJiykr99b7kcFln7o+Ol9lu5RgoNBUcw==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr14980653wrw.78.1618227134961; 
	Mon, 12 Apr 2021 04:32:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzppa93t1nwXaTt6iid4iWS6hqP6kOhO6Md8/GbM+JbVUonPnDeQFVIOPW2xDM+0m1eR6uuhZhuMiyBsOSa9oY=
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr14980643wrw.78.1618227134817; 
	Mon, 12 Apr 2021 04:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <1528588397.6568321.1618062440748.JavaMail.zimbra@redhat.com>
	<344305871.6577253.1618062541261.JavaMail.zimbra@redhat.com>
In-Reply-To: <344305871.6577253.1618062541261.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 12 Apr 2021 13:32:03 +0200
Message-ID: <CAHc6FU5=0p6=V3va3UNPB0ci2At3TuZ+TxgD2yQPBNjGzb4WqQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [gfs2 PATCH] gfs2: allocate pages for clone
	bitmaps
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 10, 2021 at 3:49 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Resource group (rgrp) bitmaps have in-core-only "clone" bitmaps that
> ensure freed fs space from deletes are not reused until the transaction
> is complete. Before this patch, these clone bitmaps were allocated with
> kmalloc, but with the default 4K block size, kmalloc is wasteful because
> of the way slab keeps track of them. As a matter of fact, kernel docs
> only recommend slab for allocations "less than page size." See:
> https://www.kernel.org/doc/html/v5.0/core-api/mm-api.html#mm-api-gfp-flags
> In fact, if you turn on kernel slab debugging options, slab will give
> you warnings that gfs2 should not do this.
>
> This patch switches the clone bitmap allocations to alloc_page, which
> has much less overhead and uses less memory. The down side is: if we
> allocate a whole page for block sizes smaller than page size, we will
> use more memory and it will be wasteful. But in general, we've always
> recommended using block size = page size for efficiency and performance.

If we really want to switch to page-granularity allocations, vmalloc
would be more appropriate. Note that vmalloc doesn't support
__GFP_NOFAIL, so we should get rid of that by doing the allocation in
a context where we can sleep first.
Looking at rgblk_free and gfs2_free_clones, another cheap improvement
would be to make a single allocation for all clone bitmaps of a
resource group instead of an allocation per bitmap.

But first, I'd like to understand what's actually going on here.

> In a recent test I did with 24 simultaneous recursive file deletes,
> on a large dataset (each working to delete a separate directory), this
> patch yielded a 16 percent increase in speed. Total accumulated real
> (clock) time of the test went from 41310 seconds (11.5 hours) down to
> just 34742 seconds (9.65 hours) (This was lock_nolock on a single node).

I find that really hard to believe. Did you look at the frequency of
clone bitmap allocations? If that is the problem, are we simply too
aggressive freeing the clone bitmaps?

Thanks,
Andreas

