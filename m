Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B27DF513514
	for <lists+cluster-devel@lfdr.de>; Thu, 28 Apr 2022 15:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651152438;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PI/xP+D4wC4P+iwOmDNVv3yXWXyc7DwYrUAcoATm6W4=;
	b=VbsTdFnOjDeVcEn+DL0jsYCDgStdgLm+Ov+KClUweJvk4jAmtr+M1HfALxZU2AO34kHchl
	RJDU7XMd2979KnjqUO0fmzCq39xKy9N8Kafnpkf8lZ+uEx08DPaaXb7elBAfBCJAgJYBUm
	gx2jz+4FZtPddLGBKZo3rTPR7megTBI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-auz5yrs8OaeoXF1ZZ7a97w-1; Thu, 28 Apr 2022 09:27:15 -0400
X-MC-Unique: auz5yrs8OaeoXF1ZZ7a97w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEE2F85A5A8;
	Thu, 28 Apr 2022 13:27:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABB98463EF5;
	Thu, 28 Apr 2022 13:27:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 79E651947048;
	Thu, 28 Apr 2022 13:27:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 85AC719466DF for <cluster-devel@listman.corp.redhat.com>;
 Thu, 28 Apr 2022 13:27:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 58437463EC5; Thu, 28 Apr 2022 13:27:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5426446451F
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 13:27:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FF1218019CE
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 13:27:12 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-tsh6rRxfN1SXn-jO3AQgLA-1; Thu, 28 Apr 2022 09:27:10 -0400
X-MC-Unique: tsh6rRxfN1SXn-jO3AQgLA-1
Received: by mail-wr1-f69.google.com with SMTP id
 y13-20020adfc7cd000000b0020ac7c7bf2eso1940957wrg.9
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 06:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PI/xP+D4wC4P+iwOmDNVv3yXWXyc7DwYrUAcoATm6W4=;
 b=lDSVglFJpZkKyXUU1bA/nGaw7PiVhRmfEhQRd8Mu2O7T8Yncei+Tezu67q29CQle4E
 0qr+aIe0Ioy4FGA3W+sZMgdzBHknI3jXG/U9+0Va9d1asj73zmghBM+iocBXslnyDLHL
 8EZCUROt9Jh5u/95IN7fpy1c1f2l67pCHp3uGOYNA7fmYktoDwc3Rju9wdx01MPL3YU9
 cU6O4o3T7i3pNN8Pj2kF6kwkvqpwZS0p0U5F0CAxl3eK0kR14bOH6m68l3OLt4Qc13Zh
 XAxXuDLybm74PYcJGPish+xvsvwHLhZO6dz3S5tXzdqPPSnRc4j6vzEsL/DpUhVG9qSW
 V9xA==
X-Gm-Message-State: AOAM531v6JVSJtzDBzt56Td6RfCywfbb8URa9TzTtAzG3zmSAvBzUdh6
 M1YlNk4ft1PH+qYF6hUMakjEnNVqf91W+OXSHfdvWMSVdiXKUk4/ooYtF5I4ASgyjWMXYtOjB6p
 SOmgRNftgBFzaiLJzUj0eWdLnohAjxf15i92Dng==
X-Received: by 2002:adf:f30a:0:b0:20a:e193:6836 with SMTP id
 i10-20020adff30a000000b0020ae1936836mr12889314wro.654.1651152429495; 
 Thu, 28 Apr 2022 06:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0CjpOPC0Kbd/FlkmCXcGc6qY4pPex3Aoq8nPR0CxXMqVNxToxWozktkt51C+mEM+zk/XB3r9JBroyjgRVzIA=
X-Received: by 2002:adf:f30a:0:b0:20a:e193:6836 with SMTP id
 i10-20020adff30a000000b0020ae1936836mr12889292wro.654.1651152429191; Thu, 28
 Apr 2022 06:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220426145445.2282274-1-agruenba@redhat.com>
 <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
 <CAHc6FU48681X8aUK+g7UUN7q5b6rkVBzTP7h_zbE4XqZYAiw3g@mail.gmail.com>
 <CAHk-=wjMB1-xCOCBtsSMmQuFV9G+vNyCY1O_LsoqOd=0QS4yYg@mail.gmail.com>
 <CAHc6FU5Bag5W2t79+WzUq=NibtEF+7z6=jyNCkLMMp9Yqvpmqw@mail.gmail.com>
 <CAHk-=whaz-g_nOOoo8RRiWNjnv2R+h6_xk2F1J4TuSRxk1MtLw@mail.gmail.com>
 <CAHc6FU5654k7QBU97g_Ubj8cJEWuA_bXPuXOPpBBYoXVPMJG=g@mail.gmail.com>
 <CAHk-=wgSYSNc5sF2EVxhjbSc+c4LTs90aYaK2wavNd_m2bUkGg@mail.gmail.com>
 <CAHc6FU69E4ke4Xg3zQ2MqjLbfM65D9ZajdY5MRDLN0azZOGmVQ@mail.gmail.com>
 <CAHk-=whQxvMvty8SjiGMh+gM4VmCYvqn6EAwmrDXJaHT2Aa+UA@mail.gmail.com>
 <CAHk-=wicJdoCjPLu7FhaErr6Z3UaW820U2b+F-8P4qwSFUZ0mg@mail.gmail.com>
In-Reply-To: <CAHk-=wicJdoCjPLu7FhaErr6Z3UaW820U2b+F-8P4qwSFUZ0mg@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 28 Apr 2022 15:26:58 +0200
Message-ID: <CAHc6FU7GkXLkns5PONLvsSi6HB+rjaNSyFeQFS034tKL-JueMw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 28, 2022 at 2:00 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, Apr 27, 2022 at 3:20 PM Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >
> > So I really think
> >
> >  (a) you are mis-reading the standard by attributing too strong logic
> > to paperwork that is English prose and not so exact
> >
> >  (b) documenting Linux as not doing what you are mis-reading it for is
> > only encouraging others to mis-read it too
> >
> > The whole "arbitrary writes have to be all-or-nothing wrt all other
> > system calls" is simply not realistic, and has never been. Not just
> > not in Linux, but in *ANY* operating system that POSIX was meant to
> > describe.
>
> Side note: a lot of those "atomic" things in that documentation have
> come from a history of signal handling atomicity issues, and from all
> the issues people had with (a) user-space threading implementations
> and (b) emulation layers from non-Unixy environments.
>
> So when they say that things like "rename()" has to be all-or-nothing,
> it's to clarify that you can't emulate it as a "link and delete
> original" kind of operation (which old UNIX *did* do) and claim to be
> POSIX.
>
> Because while the end result of rename() and link()+unlink()might be
> similar, people did rely on that whole "use rename as a way to create
> an atomic marker in the filesystem" (which is a very traditional UNIX
> pattern).
>
> So "rename()" has to be atomic, and the legacy behavior of link+unlink
> is not valid in POSIX.
>
> Similarly, you can't implement "pread()" as a "lseek+read+lseek back",
> because that doesn't work if somebody else is doing another "pread()"
> on the same file descriptor concurrently.
>
> Again, people *did* implement exactly those kinds of implementations
> of "pread()", and yes, they were broken for both signals and for
> threading.
>
> So there's "atomicity" and then there is "atomicity".
>
> That "all or nothing" can be a very practical thing to describe
> *roughly* how it must work on a higher level, or it can be a
> theoretical "transactional" thing that works literally like a database
> where the operation happens in full and you must not see any
> intermediate state.
>
> And no, "write()" and friends have never ever been about some
> transactional operation where you can't see how the file grows as it
> is being written to. That kind of atomicity has simply never existed,
> not even in theory.
>
> So when you see POSIX saying that a "read()" system call is "atomic",
> you should *not* see it as a transaction thing, but see it in the
> historical context of "people used to do threading libraries in user
> space, and since they didn't want a big read() to block all other
> threads, they'd split it up into many smaller reads and now another
> thread *also* doing 'read()' system calls would see the data it read
> being not one contiguous region, but multiple regions where the file
> position changed in the middle".
>
> Similarly, a "read()" system call will not be interrupted by a signal
> in the middle, where the signal handler would do a "lseek()" or
> another "read()", and now the original "read()" data suddenly is
> affected.
>
> That's why things like that whole "f_pos is atomic" is a big deal.
>
> Because there literally were threading libraries (and badly emulated
> environments) where that *WASN'T* the case, and _that_ is why POSIX
> then talks about it.
>
> So think of POSIX not as some hard set of "this is exactly how things
> work and we describe every detail".
>
> Instead, treat it a bit like historians treat Herodotus - interpreting
> his histories by taking the issues of the time into account.  POSIX is
> trying to clarify and document the problems of the time it was
> written, and taking other things for granted.

Okay fine, thanks for elaborating.

Would you mind pulling the following fix to straighten this out?

The data corruption we've been getting unfortunately didn't have to do
with lock contention (we already knew that); it still occurs. I'm
running out of ideas on what to try there.

Thanks a lot,
Andreas

--

The following changes since commit 4fad37d595b9d9a2996467d780cb2e7a1b08b2c0:

  Merge tag 'gfs2-v5.18-rc4-fix' of
git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2
(2022-04-26 11:17:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
tags/gfs2-v5.18-rc4-fix2

for you to fetch changes up to 296abc0d91d8b65d42224dd33452ace14491ad08:

  gfs2: No short reads or writes upon glock contention (2022-04-28
15:14:48 +0200)

----------------------------------------------------------------
gfs2 fix

- No short reads or writes upon glock contention

----------------------------------------------------------------
Andreas Gruenbacher (1):
      gfs2: No short reads or writes upon glock contention

 fs/gfs2/file.c | 4 ----
 1 file changed, 4 deletions(-)

