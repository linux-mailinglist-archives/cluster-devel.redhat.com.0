Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2104E513B07
	for <lists+cluster-devel@lfdr.de>; Thu, 28 Apr 2022 19:39:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651167556;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qTa1PiQlC3U5vo163YBGzHkGqCZn98XvdYZbCYWOy88=;
	b=FwvpOAZu5XO1JOz4oGzstpKCVvhIia1Bo8mwzU6eK4eIC3mrl+kznmZh55439CkMJF1qGZ
	Xl5O7xXu3/chdjUnre2gy85fCrfa902oScEYfntHClbGHsiN5jvp8P0RoFYBb4mTZbGD5V
	/pdrNztC1UwcW7Omz1yKrWuVyB7cWpI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-B99_UrvsPPSQPJpwFD5ywA-1; Thu, 28 Apr 2022 13:39:11 -0400
X-MC-Unique: B99_UrvsPPSQPJpwFD5ywA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7764486B8A0;
	Thu, 28 Apr 2022 17:39:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DF162166B4D;
	Thu, 28 Apr 2022 17:39:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C91211947048;
	Thu, 28 Apr 2022 17:39:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8ED8E19466DF for <cluster-devel@listman.corp.redhat.com>;
 Thu, 28 Apr 2022 17:39:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7CCC8111CD39; Thu, 28 Apr 2022 17:39:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A0B111CD38
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 17:39:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 551C73820F7B
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 17:39:05 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-ddJy09H9MRaE3UoyToVivA-1; Thu, 28 Apr 2022 13:39:03 -0400
X-MC-Unique: ddJy09H9MRaE3UoyToVivA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n186-20020a1c27c3000000b00392ae974ca1so2288458wmn.0
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 10:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qTa1PiQlC3U5vo163YBGzHkGqCZn98XvdYZbCYWOy88=;
 b=2RmRCvvXzVZFsG1RQ4q4rXJmLsFbEK8Q7CyAuEetdJPWM+OOeMYTFvIzyVCBMJ4ITJ
 LnYSvnqcAPwwC6FBawBhnIWaNrGeG1h1eI1JjNK20RSqcCNjX9MipJ9BSiH/DSl2Dmr0
 0J7SJb3IurKOpeRgCIpIKJ0Ar5irsGJ2/DoA2s/jwSAvYWz0cbOTLziLb7LMCVDxyj5+
 OAwYTO6BL/e+2sONEZIdqikqJmF9umxgVGh3Et8JCm1tc+acCrvWza+W0NSVCunoDupe
 eC4+TKUfW2GFdB9HfRwKMC98CvC4hmNppdSDoIu8eZr/Y1mbauw0ClX+7HqkRHC4vkH8
 3Kyw==
X-Gm-Message-State: AOAM532syj8ktx0p5l2hgGZto4i0dccsj9qm8MwX+Hysh4aX0ZJC4bCu
 rlDeSKhYusQ0pRxhTAphvRnJzgBlT/mt0CFL7heoac7AoM1Te7vzILYnatIfRophAWYxpSxum7P
 JWIkUI8CqgH7YjoO+4JGdjKyd+N8wzDberVElOw==
X-Received: by 2002:a5d:45c5:0:b0:20a:be8f:aca6 with SMTP id
 b5-20020a5d45c5000000b0020abe8faca6mr28021813wrs.493.1651167542694; 
 Thu, 28 Apr 2022 10:39:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFgPQF4/R5LGWhNlocQWdfRiUJJVYdeWRr/A3EDvyI1rG3nLaEx5lvJoNRnFD6xybZRBNnf10z8gXvVl22EIc=
X-Received: by 2002:a5d:45c5:0:b0:20a:be8f:aca6 with SMTP id
 b5-20020a5d45c5000000b0020abe8faca6mr28021795wrs.493.1651167542429; Thu, 28
 Apr 2022 10:39:02 -0700 (PDT)
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
 <CAHc6FU7GkXLkns5PONLvsSi6HB+rjaNSyFeQFS034tKL-JueMw@mail.gmail.com>
 <CAHk-=wg4ypnZUA5BOHAF1miKvOhW2yQSruuBKNXMDR=dTmp+ww@mail.gmail.com>
In-Reply-To: <CAHk-=wg4ypnZUA5BOHAF1miKvOhW2yQSruuBKNXMDR=dTmp+ww@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 28 Apr 2022 19:38:51 +0200
Message-ID: <CAHc6FU6VgQDO7HT5f4S_4f=9hczKGRDQ6SbQ5kNHMi4i-6rxVA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 28, 2022 at 7:09 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Apr 28, 2022 at 6:27 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > The data corruption we've been getting unfortunately didn't have to do
> > with lock contention (we already knew that); it still occurs. I'm
> > running out of ideas on what to try there.
>
> Hmm.
>
> I don't see the bug, but I do have a suggestion on something to try.
>
> In particular, you said the problem started with commit 00bfe02f4796
> ("gfs2: Fix mmap + page fault deadlocks for buffered I/O").

Yes, but note that it's gfs2_file_buffered_write() that fails. When
the pagefault_disable/enable() around iomap_file_buffered_write() is
removed, the corruption goes away.

> And to me, I see two main things that are going on
>
>  (a) the obvious "calling generic IO functions with pagefault disabled" thing
>
>  (b) the "allow demotion" thing
>
> And I wonder if you could at least pinpoint which of the  cases it is
> that triggers it.
>
> So I'd love to see you try three things:
>
>  (1) just remove the "allow demotion" cases.
>
>      This will re-introduce the deadlock the commit is trying to fix,
> but that's such a special case that I assume you can run your
> test-suite that shows the problem even without that fix in place?
>
>      This would just pinpoint whether it's due to some odd locking issue or not.
>
> Honestly, from how you describe the symptoms, I don't think (1) is the
> cause, but I think making sure is good.
>
> It sounds much more likely that it's one of those generic vfs
> functions that screws up when a page fault happens and it gets a
> partial result instead of handling the fault.

The test should run just fine without allowing demotion. I'll try (1),
but I don't expect the outcome to change.

> Which gets us to
>
>  (2) remove the pagefault_disable/enable() around just the
> generic_file_read_iter() case in gfs2_file_read_iter().
>
> and
>
>  (3) finally, remove the pagefault_disable/enable() around the
> iomap_file_buffered_write() case in gfs2_file_buffered_write()
>
> Yeah, yeah, you say it's just the read that fails, but humor me on
> (3), just in case it's an earlier write in your test-suite and the
> read just then uncovered it.
>
> But I put it as (3) so that you'd do the obvious (2) case first, and
> narrow it down (ie if (1) still shows the bug, then do (2), and if
> that fixes the bug it will be fairly well pinpointed to
> generic_file_read_iter().

As mentioned above, we already did (3) and it didn't help. I'll do (1)
now, and then (2).

> Looking around, gfs2 is the only thing that obviously calls
> generic_file_read_iter() with pagefaults disabled, so it does smell
> like filemap_read() might have some issue, but the only thing that
> does is basically that
>
>                 copied = copy_folio_to_iter(folio, offset, bytes, iter);
>
> which should just become copy_page_to_iter_iovec(), which you'd hope
> would get things right.
>
> But it would be good to just narrow things down a bit.
>
> I'll look at that copy_page_to_iter_iovec() some more regardless, but
> doing that "let's double-check it's not somethign else" would be good.

We've actually been running most of our experiments on a 5.14-based
kernel with a plethora of backports, so pre-folio. Sorry I forgot to
mention that. I'll reproduce with mainline as well.

Thanks,
Andreas

