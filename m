Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 450D63B99FD
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Jul 2021 02:20:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625185255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=rQPsdOkVHeGKBuEsStJMLYq9tWsj5wYRKjPTUAXJMQg=;
	b=U6+1EdKsbAI5DLbwC6M8q1f1/2v/ktuSDaZ/VkHw7LrTS4CwxBHm2tn+FqTyu+jjEV/Nsj
	k70xmPB6YKUuH9VBZcdrM+abOsUQ5rQSHBxNxkn/NeuEtEI+5CtQcVPdFYtgRJMq4JFstv
	JolONBL6V1B/pz4ki89H5xAkApughUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-Elk8pp4rMd23ifiQb1XaaA-1; Thu, 01 Jul 2021 20:20:54 -0400
X-MC-Unique: Elk8pp4rMd23ifiQb1XaaA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D07D1804308;
	Fri,  2 Jul 2021 00:20:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0564860864;
	Fri,  2 Jul 2021 00:20:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E96134A712;
	Fri,  2 Jul 2021 00:20:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1620KcMC026519 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Jul 2021 20:20:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C94A10F05B; Fri,  2 Jul 2021 00:20:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07AA110F059
	for <cluster-devel@redhat.com>; Fri,  2 Jul 2021 00:20:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7B0B89C7DB
	for <cluster-devel@redhat.com>; Fri,  2 Jul 2021 00:20:34 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-478-zIXQ-HeYNqG3Z9dooNkB1A-1; Thu, 01 Jul 2021 20:20:33 -0400
X-MC-Unique: zIXQ-HeYNqG3Z9dooNkB1A-1
Received: by mail-wm1-f69.google.com with SMTP id
	z4-20020a1ce2040000b02901ee8d8e151eso5431288wmg.1
	for <cluster-devel@redhat.com>; Thu, 01 Jul 2021 17:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rQPsdOkVHeGKBuEsStJMLYq9tWsj5wYRKjPTUAXJMQg=;
	b=QdTHozgvkkrKnBUH7N3+/94H5pgydxvhpRo1mE61tnUFm8eQfu/H2+ibQX4jDjuGE7
	XWz48gQ9gXlh2WxIVfV9a+pkE1zvyfhprGP/8L3ZxRYofV4MbCUYAdkXbrPbauIltsY4
	LnCk1im5xxujmzREzclcDCM0PK3po9+DZhlUo6BbEZEJRcgKCQZmt7i3mxbZShVCW8Sm
	TbL6eFtBLdiTSvbOYg7JQtF675ABYMakITY48d43HyLHhuz+H4uUaw2yLekED2RA26FJ
	bsFQ7zVS96uQDZs/fAnZi94YcBG+8dvwnkK7Gied25VzuSuXe3HlAFOron299nQgm+oa
	Ilfg==
X-Gm-Message-State: AOAM53318HmaK0/3CkwfERhqZ90+44vYxcNIXxZZ8GebcZ2OkG8tOpvi
	LImEOZAZ5d8eoDCnAYj4scdoLYbdQuhHjRDvIk2anRiTfSsBwHAYKUdb7O2NozI1DIOPmwiEVuC
	uf/kK3HmauQSGjRZ+TpI2XJtRr0PMvRzCb8ImhQ==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr13499687wmk.3.1625185232446; 
	Thu, 01 Jul 2021 17:20:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2mrmrFqhY+KJO7OmT5+cTABba2Xcud4NJgvF/TCklQGhDqfs42VqLXpLsCT79j3xMTA47vuLYlFge+nI55lQ=
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr13499672wmk.3.1625185232278; 
	Thu, 01 Jul 2021 17:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210701204246.2037142-1-agruenba@redhat.com>
	<CAHk-=wjk6KP3vSLFNPMjoaZ4xY4u=DjTM+C+hCS3QKt+XAE6OA@mail.gmail.com>
In-Reply-To: <CAHk-=wjk6KP3vSLFNPMjoaZ4xY4u=DjTM+C+hCS3QKt+XAE6OA@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 2 Jul 2021 02:20:20 +0200
Message-ID: <CAHc6FU5XMfTOBW1a0OnMaPSmgWECvO-KYAo8HeVNsCyd-HyV3g@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix mmap + page fault deadlocks
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

On Thu, Jul 1, 2021 at 11:41 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Jul 1, 2021 at 1:43 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> > here's another attempt at fixing the mmap + page fault deadlocks we're
> > seeing on gfs2.  Still not ideal because get_user_pages_fast ignores the
> > current->pagefault_disabled flag
>
> Of course get_user_pages_fast() ignores the pagefault_disabled flag,
> because it doesn't do any page faults.
>
> If you don't want to fall back to the "maybe do IO" case, you should
> use the FOLL_FAST_ONLY flag - or get_user_pages_fast_only(), which
> does that itself.
>
> > For getting get_user_pages_fast changed to fix this properly, I'd need
> > help from the memory management folks.
>
> I really don't think you need anything at all from the mm people,
> because we already support that whole "fast only" case.

Yes, fair enough.

> Also, I have to say that I think the direct-IO code is fundamentally
> mis-designed. Why it is doing the page lookup _during_ the IO is a
> complete mystery to me. Why wasn't that done ahead of time before the
> filesystem took the locks it needed?

That would be inconvenient for reads, when the number of bytes read is
much smaller than the buffer size and we won't need to page in the
entire buffer.

> So what the direct-IO code _should_ do is to turn an ITER_IOVEC into a
> ITER_KVEC by doing the page lookup ahead of time, and none of these
> issues should even exist, and then the whole pagefault_disabled and/or
> FOLL_FAST_ONLY would be a complete non-issue.
>
> Is there any reason why that isn't what it does (other than historical baggage)?

It turns out that there's an even deeper issue with keeping references
to user-space pages. Those references will essentially pin the glock
of the associated inode to the node. Moving a glock off a node
requires truncating the inode's page cache, but the page references
would prevent that. So we'd only end up with different kinds of
potential deadlocks.

If we could get iomap_dio_rw to use "fast only" mode when requested,
we could fault in the pages without keeping references, try the IO,
and repeat when necessary.

Thanks a lot,
Adreas

