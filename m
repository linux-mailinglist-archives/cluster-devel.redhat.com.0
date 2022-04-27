Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D70E51253F
	for <lists+cluster-devel@lfdr.de>; Thu, 28 Apr 2022 00:26:36 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-MV759UtiOxqmkJiqDWrQ-w-1; Wed, 27 Apr 2022 18:26:34 -0400
X-MC-Unique: MV759UtiOxqmkJiqDWrQ-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9B221C08D3E;
	Wed, 27 Apr 2022 22:26:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59DC340E80E3;
	Wed, 27 Apr 2022 22:26:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 15B391947048;
	Wed, 27 Apr 2022 22:26:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 984461947041 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 27 Apr 2022 22:26:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 34795413736; Wed, 27 Apr 2022 22:26:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30AD3463E1A
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 22:26:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15BC9185A7B2
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 22:26:30 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-0QRAK39JPhG72AlaZj6Mbw-1; Wed, 27 Apr 2022 18:26:28 -0400
X-MC-Unique: 0QRAK39JPhG72AlaZj6Mbw-1
Received: by mail-lj1-f176.google.com with SMTP id 17so4481487lji.1
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 15:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yCYL9g4VwJRI+kOW4bU4UPGTSqELiJ7re1kAOeB0fTc=;
 b=xJLrQ4KTiZJ6ImTeXaiL46wL5BBFd2p9Hjif65ANEHv74sZHry55935wE89W+6qOu7
 SMJW48PmsTOJAdJNjAuVN8VhUlD+Uag0J0hjJuBzcBKvjS0f95fuG0rAYogiKBu33OYa
 qsTDhT/yEJeTxbxE+H4KZcSRmfDIXvTn81rrD6CMrzNGgY1DqXD60f2pqO45eZUt/zbf
 bDruG5uhUfM5v8a7csy5yFwSBaTIRMZBpUZQ0Pa2NT1jgfO17d2tau5+BzRKIPAHKey/
 HiefXYuPr9iyZ1fHknUl+FuafVp6P8+dC7BoiwyvBEnhNtbgSYlLMgxYdk7TmTKINd29
 jVtw==
X-Gm-Message-State: AOAM532sJo2+xsSZ89+2i1i2pCLovoVYZc2ikYt4xehURp9W1FPUsond
 nSYaTV7OZ3F3oPkrJfNwy51vJlHQzX3wIXZTcQY=
X-Google-Smtp-Source: ABdhPJxgGAwMYBdPMvRebsn9ZyV+yfgHpQyBf041VEdAaoenI8C2cO8wQJQGBYwuxyLFGZCjxYmKyw==
X-Received: by 2002:a2e:3112:0:b0:24f:132a:fd71 with SMTP id
 x18-20020a2e3112000000b0024f132afd71mr10744069ljx.522.1651098386436; 
 Wed, 27 Apr 2022 15:26:26 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 r26-20020ac25f9a000000b00471ffe2bf06sm1473009lfe.114.2022.04.27.15.26.25
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 15:26:26 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id bn33so4443115ljb.6
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 15:26:25 -0700 (PDT)
X-Received: by 2002:a05:6512:6c6:b0:472:296e:6dfb with SMTP id
 u6-20020a05651206c600b00472296e6dfbmr4066529lff.542.1651098018218; Wed, 27
 Apr 2022 15:20:18 -0700 (PDT)
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
In-Reply-To: <CAHc6FU69E4ke4Xg3zQ2MqjLbfM65D9ZajdY5MRDLN0azZOGmVQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Apr 2022 15:20:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=whQxvMvty8SjiGMh+gM4VmCYvqn6EAwmrDXJaHT2Aa+UA@mail.gmail.com>
Message-ID: <CAHk-=whQxvMvty8SjiGMh+gM4VmCYvqn6EAwmrDXJaHT2Aa+UA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 2:26 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Well, POSIX explicitly mentions those atomicity expectations, e.g.,
> for read [1]:

Yes. I'm aware. And my point is that we've never done _that_ kind of atomicity.

It's also somewhat ambiguous what it actually means, since what it
then talks about is "all bytes that started out together ends
together" and "interleaving".

That all implies that it's about the *position* of the reads and
writes being atomic, not the *data* of the reads and writes.

That, btw, was something we honored even before we had the locking
around f_pos accesses - a read or write system call would get its own
local *copy* the file position, the read or write would then do that
IO based on that copied position - so that things that "started out
together ends together" - and then after the operation is done it
would *update* the file position atomically.

Note that that is exactly so that data would end up "together". But it
would mean that two concurrent reads using the same file position
might read the *same* area of the file.

Which still honors that "the read is atomic wrt the range", but
obviously the actual values of "f_pos" is basically random after the
read (ie is it the end of the first read, or the end of the second
read?).

The same paragraph also explicitly mentions pipes and FIFOs, despite
an earlier paragraph dismissing them, which is all just a sign of
things being very confused.

Anyway, I'm not objecting very sternously to making it very clear in
some documentation that this "data atomicity" is not what Linux has
ever done. If you do overlapping IO, you get what you deserve.

But I do have objections.

On one hand, it's not all that different from some of the other notes
we have in the man-pages (ie documenting that whole "just under 2GB"
limit on the read size, although that's actually using the wrong
constant: it's not 0x7ffff000 bytes, it's MAX_RW_COUNT, which is
"INT_MAX & PAGE_MASK" and that constant in the man-page is as such
only true on a system with 4kB page sizes)

BUT! I'm 100% convinced that NOBODY HAS EVER given the kind of
atomicity guarantees that you would see from reading that document as
a language-lawyer.

For example, that section "2.9.7 Thread Interactions with Regular File
Operations" says that "fstat()" is atomic wrt "write()", and that you
should see "all or nothing".

I *GUARANTEE* that no operating system ever has done that, and I
further claim that reading it the way you read it is not only against
reality, it's against sanity.

Example: if I do a big write to a file that I just created, do you
really want "fstat()" in another thread or process to not even be able
to see how the file grows as the write happens?

It's not what anybody has *EVER* done, I'm pretty sure.

So I really think

 (a) you are mis-reading the standard by attributing too strong logic
to paperwork that is English prose and not so exact

 (b) documenting Linux as not doing what you are mis-reading it for is
only encouraging others to mis-read it too

The whole "arbitrary writes have to be all-or-nothing wrt all other
system calls" is simply not realistic, and has never been. Not just
not in Linux, but in *ANY* operating system that POSIX was meant to
describe.

And equally importantly: if some crazy person were to actually try to
implement such "true atomicity" things, the end result would be
objectively worse. Because you literally *want* to see a big write()
updating the file length as the write happens.

The fact that the standard then doesn't take those kinds of details
into account is simply because the standard isn't meant to be read as
a language lawyer, but as a "realistically .."

             Linus

