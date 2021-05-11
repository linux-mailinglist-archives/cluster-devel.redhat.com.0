Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E186137AA12
	for <lists+cluster-devel@lfdr.de>; Tue, 11 May 2021 17:00:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620745234;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KQy9BmsInGHBuMYQbKGo4/mFyEJldO4Fzjjuu4/Gw90=;
	b=a59/2Xeq/+aNvAwkyOtbcMOpf5yYXeS3z+FlhyBsUEleESP0M7KScoOiqLiNw4VUPH1WnJ
	M/lW8vXGGJIK7Dp5r5hFTBqupeHRJj9/+IBb8XgPNCRlBFJByGmh1fmNLnFh0pImF6PkgV
	sRnxBTWaelYRNpRHSPS50g+ihrQfThs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-LfByhS7HNS60nsiAY99unA-1; Tue, 11 May 2021 11:00:32 -0400
X-MC-Unique: LfByhS7HNS60nsiAY99unA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A247801B12;
	Tue, 11 May 2021 15:00:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49FA719C44;
	Tue, 11 May 2021 15:00:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B58581806D0E;
	Tue, 11 May 2021 15:00:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14BF0Kxe005327 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 May 2021 11:00:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D456B10F8E1D; Tue, 11 May 2021 15:00:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE8D110F8E1C
	for <cluster-devel@redhat.com>; Tue, 11 May 2021 15:00:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1FFC83395B
	for <cluster-devel@redhat.com>; Tue, 11 May 2021 15:00:15 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-561-yZ87RmEfNHGJoJgCnfxalQ-1; Tue, 11 May 2021 11:00:12 -0400
X-MC-Unique: yZ87RmEfNHGJoJgCnfxalQ-1
Received: by mail-wr1-f70.google.com with SMTP id
	p19-20020adfc3930000b029010e10128a04so8810915wrf.3
	for <cluster-devel@redhat.com>; Tue, 11 May 2021 08:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KQy9BmsInGHBuMYQbKGo4/mFyEJldO4Fzjjuu4/Gw90=;
	b=f1g3QTGHeTnj1uILpEK6SG130SEnreZiq/YgsTWe+iMET2h6h0gGB4OSWWHgB7w3yZ
	i438sH5VtmBc2MzgjLonTUZ4dhoUxRaR9AUxze4+b91kDobfLosZWmqWhhFC+dg+d72S
	+7ngs9DVBlllsI+JPi8/DuiklVsb9AIUC1MDjwfwESRZE8Q1vZB6ZcK3SJ+mCIrFtW4a
	9TQm1i02kDjHGuAXsXUZZxcxmsodPxBxwsMDEvDbc18mtXiVYzRW2AmZWhwI1zTmB+61
	Ksa3SHx2Ei4VNhqbZF/zg+bKFWSlgiqEhNfmNN4FDXwBQf0YJQXqMTPCGmxdYxIPD7c4
	6AeA==
X-Gm-Message-State: AOAM5301QqmYJV6/bhZeN1VKJMtIVO8nfKIN8x/uNQS1kKYEjSiYvBa2
	cW2lhdX++/OIBONchj32CJHQIpXKdJe3qcNoRcuFThf/YG3CEpN/gio4Rigrtdr7y2Hbe4n85KL
	sqW9KgglxTM3W4ldnDLNuzGQ5+5BwUmb6Ett23g==
X-Received: by 2002:a05:600c:21d5:: with SMTP id
	x21mr6111947wmj.149.1620745210653; 
	Tue, 11 May 2021 08:00:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgE6ifBgFWpvncB4Yp/ueaUboNmb37R0/BTIg4dy1wyIvx0+2z3v12HkdeJg8oHTVE/aiLRx0h5iTD71Z5u+Q=
X-Received: by 2002:a05:600c:21d5:: with SMTP id
	x21mr6111920wmj.149.1620745210398; 
	Tue, 11 May 2021 08:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210511140113.1225981-1-agruenba@redhat.com>
	<YJqQdKmBHz6oEqD1@casper.infradead.org>
In-Reply-To: <YJqQdKmBHz6oEqD1@casper.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 11 May 2021 16:59:59 +0200
Message-ID: <CAHc6FU5LMhLfQO6wj8z0RD1Q3jv0reToP7=LSj5B-e50WYGnkA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, LKML <linux-kernel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>
Subject: Re: [Cluster-devel] [PATCH] [RFC] Trigger retry from fault vm
	operation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, May 11, 2021 at 4:34 PM Matthew Wilcox <willy@infradead.org> wrote:
> On Tue, May 11, 2021 at 04:01:13PM +0200, Andreas Gruenbacher wrote:
> > we have a locking problem in gfs2 that I don't have a proper solution for, so
> > I'm looking for suggestions.
> >
> > What's happening is that a page fault triggers during a read or write
> > operation, while we're holding a glock (the cluster-wide gfs2 inode
> > lock), and the page fault requires another glock.  We can recognize and
> > handle the case when both glocks are the same, but when the page fault requires
> > another glock, there is a chance that taking that other glock would deadlock.
>
> So we're looking at something like one file on a gfs2 filesystem being
> mmaped() and then doing read() or write() to another gfs2 file with the
> mmaped address being the passed to read()/write()?

Yes, those kinds of scenarios. Here's an example that Jan Kara came up with:

Two independent processes P1, P2. Two files F1, F2, and two mappings M1, M2
where M1 is a mapping of F1, M2 is a mapping of F2. Now P1 does DIO to F1
with M2 as a buffer, P2 does DIO to F2 with M1 as a buffer. They can race
like:

P1                                      P2
read()                                  read()
  gfs2_file_read_iter()                   gfs2_file_read_iter()
    gfs2_file_direct_read()                 gfs2_file_direct_read()
      locks glock of F1                       locks glock of F2
      iomap_dio_rw()                          iomap_dio_rw()
        bio_iov_iter_get_pages()                bio_iov_iter_get_pages()
          <fault in M2>                           <fault in M1>
            gfs2_fault()                            gfs2_fault()
              tries to grab glock of F2               tries to grab glock of F1

With cluster-wide locks, we can obviously end up with distributed
deadlock scenarios as well, of course.

> Have you looked at iov_iter_fault_in_readable() as a solution to
> your locking order?  That way, you bring the mmaped page in first
> (see generic_perform_write()).

Yes. The problem there is that we need to hold the inode glock from
->iomap_begin to ->iomap_end; that's what guarantees that the mapping
returned by ->iomap_begin remains valid.

> > When we realize that we may not be able to take the other glock in gfs2_fault,
> > we need to communicate that to the read or write operation, which will then
> > drop and re-acquire the "outer" glock and retry.  However, there doesn't seem
> > to be a good way to do that; we can only indicate that a page fault should fail
> > by returning VM_FAULT_SIGBUS or similar; that will then be mapped to -EFAULT.
> > We'd need something like VM_FAULT_RESTART that can be mapped to -EBUSY so that
> > we can tell the retry case apart from genuine -EFAULT errors.
>
> We do have VM_FAULT_RETRY ... does that retry at the wrong level?

There's also VM_FAULT_NOPAGE, but that only triggers a retry at the VM
level and doesn't propagate out far enough.

My impression is that VM_FAULT_RETRY is similar to VM_FAULT_NOPAGE
except that it allows the lock dropping optimization implemented in
maybe_unlock_mmap_for_io(). That error code can also only be used when
FAULT_FLAG_ALLOW_RETRY is set it seems. Correct me if I'm getting this
wrong.

Thanks,
Andreas

