Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B4651230B
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Apr 2022 21:46:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651088787;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=VxlMSwwL71AQXI2HOAVlvE1k33pxxk+5fGEJtCTWrzk=;
	b=f4qRXTO6SOPNTS1HZsSHWBeWR5Yt+gV3QFCxZYA3VgtuGtrg7QHtT2b+xF9Ggxee/1D4qS
	NYnDw83D/bvsU8XV1E1oWMcPzza9RRcmTCdSt2H4AHtJtHtN5Ham5KiHpoofe69WagRl2b
	uVy2BQezTzO9oNneQ3J8EyI1KWURHnk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-4dkFF-JSOc68JHotQoMfPw-1; Wed, 27 Apr 2022 15:46:23 -0400
X-MC-Unique: 4dkFF-JSOc68JHotQoMfPw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF5F1801E67;
	Wed, 27 Apr 2022 19:46:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C85846A390;
	Wed, 27 Apr 2022 19:46:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5247C1947048;
	Wed, 27 Apr 2022 19:46:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 919221947041 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 27 Apr 2022 19:41:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 816DFC44AEF; Wed, 27 Apr 2022 19:41:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DFADC44AE9
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 19:41:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BCDE866DF9
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 19:41:37 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-0q7DzZ6sMEWpl58ZJ65lhg-1; Wed, 27 Apr 2022 15:41:35 -0400
X-MC-Unique: 0q7DzZ6sMEWpl58ZJ65lhg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j21-20020adfa555000000b0020adb9ac14fso1101953wrb.13
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 12:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VxlMSwwL71AQXI2HOAVlvE1k33pxxk+5fGEJtCTWrzk=;
 b=uN5R6LZWa5PCLdI7kdNZQhDJNVC03Rhb34eGMAKTNnvcMF4rw+vHXEOA8pbjRTZbev
 3Fzkwe30p/HuBpyYtCHv3NR3T13o7tw3ny+1m0zc3ahTjiv/cU5F7dHBPzdLiPfhfpiu
 p9LripiORp0qmv2iNQl2U6JhnMQ4FnwRk8dD894PaPu4N3wirjrH7MUtBTVxcTub26MS
 39q345DS7UsbHeSxZKtmEspy7CIInWfn8H9jdQF464doK6yHOgANEy43BxEnw5MAsQ+3
 8wjIpdedJVn7mHMfpYUO2QPZERq/tJNOAEbPNqv0/GagSqKTP5e2wWS3yzevFXXSxYBI
 5S0Q==
X-Gm-Message-State: AOAM532J+wa/Qr06yBZuVeR/fkOp8q3wTb31Mb7U63EjkVRs7nFAAfzp
 dyx93tLY+dFAV2eJkxMA/qELT9AvPaHkJQi9/QotcxOC7RYpfkQ463XnpHTxty3q/6lw6qlyfOy
 S0sAqsIikwBFAdUnzscikyUGr+jhy6x4e2b/IpQ==
X-Received: by 2002:a5d:45c5:0:b0:20a:be8f:aca6 with SMTP id
 b5-20020a5d45c5000000b0020abe8faca6mr24120522wrs.493.1651088494225; 
 Wed, 27 Apr 2022 12:41:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN8jAqVknzc7n/v3pZVq4flXFclG+lvqOba8PImYhZ/tlxU33DmGah56sHOQqwo7w20hTKEPm4Bsm/wPE46cU=
X-Received: by 2002:a5d:45c5:0:b0:20a:be8f:aca6 with SMTP id
 b5-20020a5d45c5000000b0020abe8faca6mr24120511wrs.493.1651088493957; Wed, 27
 Apr 2022 12:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220426145445.2282274-1-agruenba@redhat.com>
 <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
 <CAHc6FU48681X8aUK+g7UUN7q5b6rkVBzTP7h_zbE4XqZYAiw3g@mail.gmail.com>
 <CAHk-=wjMB1-xCOCBtsSMmQuFV9G+vNyCY1O_LsoqOd=0QS4yYg@mail.gmail.com>
 <CAHc6FU5Bag5W2t79+WzUq=NibtEF+7z6=jyNCkLMMp9Yqvpmqw@mail.gmail.com>
 <CAHk-=whaz-g_nOOoo8RRiWNjnv2R+h6_xk2F1J4TuSRxk1MtLw@mail.gmail.com>
In-Reply-To: <CAHk-=whaz-g_nOOoo8RRiWNjnv2R+h6_xk2F1J4TuSRxk1MtLw@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 27 Apr 2022 21:41:22 +0200
Message-ID: <CAHc6FU5654k7QBU97g_Ubj8cJEWuA_bXPuXOPpBBYoXVPMJG=g@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fix
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 7:13 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, Apr 27, 2022 at 5:29 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > Regular (buffered) reads and writes are expected to be atomic with
> > respect to each other.
>
> Linux has actually never honored that completely broken POSIX
> requirement, although I think some filesystems (notably XFS) have
> tried.

Okay, I can happily live with that.

I wonder if this could be documented in the read and write manual
pages. Or would that be asking too much?

> It's a completely broken concept. It's not possible to honor atomicity
> with mmap(), and nobody has *ever* cared.
>
> And it causes huge amounts of problems and basically makes any sane
> locking entirely impossible.
>
> The fact that you literally broke regular file writes in ways that are
> incompatible with (much MUCH more important) POSIX file behavior to
> try to get that broken read/write atomicity is only one example among
> many for why that alleged rule just has to be ignored.
>
> We do honor the PIPE_BUF atomicity on pipes, which is a completely
> different kind of atomicity wrt read/write, and doesn't have the
> fundamental issues that arbitrary regular file reads/writes have.
>
> There is absolutely no sane way to do that file atomicity wrt
> arbitrary read/write calls (*), and you shouldn't even try.
>
> That rule needs to be forgotten about, and buried 6ft deep.
>
> So please scrub any mention of that idiotic rule from documentation,
> and from your brain.
>
> And please don't break "partial write means disk full or IO error" due
> to trying to follow this broken rule, which was apparently what you
> did.
>
> Because that "regular file read/write is done in full" is a *MUCH*
> more important rule, and there is a shitton of applications that most
> definitely depend on *that* rule.
>
> Just go to debian code search, and look for
>
>    "if (write("
>
> and you'll get thousands of hits, and on the first page of hits 9 out
> of 10 of the hits are literally about that "partial write is an
> error", eg code like this:
>
>             if (write(fd,&triple,sizeof(triple)) != sizeof(triple))
>                 reporterr(1,NULL);
>
> from libreoffice.
>
>                         Linus
>
> (*) Yeah, if you never care about performance(**) of mixed read/write,
> and you don't care about mmap, and you have no other locking issues,
> it's certainly possible. The old rule came about from original UNIX
> literally taking an inode lock around the whole IO access, because
> that was simple, and back in the days you'd never have multiple
> concurrent readers/writers anyway.
>
> (**) It's also instructive how O_DIRECT literally throws that rule
> away, and then some direct-IO people said for years that direct-IO is
> superior and used this as one of their arguments. Probably the same
> people who thought that "oh, don't report partial success", because we
> can't deal with it.
>

Thanks a lot,
Andreas

