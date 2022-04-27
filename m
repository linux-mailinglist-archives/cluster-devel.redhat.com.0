Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B3672511C83
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Apr 2022 19:13:44 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-3mLryJs5M_iNZlTw5Vdttw-1; Wed, 27 Apr 2022 13:13:38 -0400
X-MC-Unique: 3mLryJs5M_iNZlTw5Vdttw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A449785A5BC;
	Wed, 27 Apr 2022 17:13:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DA1E41D3E8;
	Wed, 27 Apr 2022 17:13:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C0F381947046;
	Wed, 27 Apr 2022 17:13:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6DF501947041 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 27 Apr 2022 17:13:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4CC30463E01; Wed, 27 Apr 2022 17:13:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48776415F2E
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 17:13:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C9591C07382
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 17:13:31 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-gJK7-pqaNrGk8hqWENEsuQ-1; Wed, 27 Apr 2022 13:13:29 -0400
X-MC-Unique: gJK7-pqaNrGk8hqWENEsuQ-1
Received: by mail-lf1-f51.google.com with SMTP id k12so4275231lfr.9
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 10:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BkjJC3atGNZLbDtpxaTEoGR+ldCQ7Vj1pUM/H8AnDYM=;
 b=AM8jUK9PyE2nYuKRjLegHac5qQIeCdyp8bFA5Ezj66RFO0lILiqwFNGIAfgP0d+6uk
 bcuYFTEfOWTYa/jgTwXj6U1LGTMr5e7q3Kfd588u2CrNPkfR6W8oxKtZ6WvQ2X84Obfw
 Xin0WugBF6All2D7b2INtmzuE/opLkJXwyrIXH+4gqLv50g4xxJ+q9dB/BfE8cr4bB7w
 zmmugTWOEDUkPPG6amp2oM4s6iLLJlhGt90fjaeTLaQ+rQBhdkXvSluguGG0vFG06XvT
 DYJ5MFEI5vAzlalhZhmAp3KM2nVvghe9kyhPawZPEWw3a8N5ecsCc2AmMbxfl2z5ihY2
 K+Og==
X-Gm-Message-State: AOAM533Xrbkrgorj4OOVQZ3zA/fjWSqNUHW8dz3GzcMn0DiSYaSVnIqT
 15RVumWHbE03PfdWVMf+rnDbmIy/1DEXHLQ6ZCw=
X-Google-Smtp-Source: ABdhPJwvFSVStQDFfRYcNQym2e6oYEiTy6kqnBSSMzX49imOzphO88ciubXLh+nF9MSe46Wg24elYA==
X-Received: by 2002:ac2:5f74:0:b0:471:fe5b:8f03 with SMTP id
 c20-20020ac25f74000000b00471fe5b8f03mr15088924lfc.444.1651079607606; 
 Wed, 27 Apr 2022 10:13:27 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177]) by smtp.gmail.com with ESMTPSA id
 bi2-20020a0565120e8200b0044826a117bcsm2104702lfb.44.2022.04.27.10.13.26
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:13:26 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id y19so3531814ljd.4
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 10:13:26 -0700 (PDT)
X-Received: by 2002:a2e:b8d4:0:b0:24f:2cc3:2c51 with SMTP id
 s20-20020a2eb8d4000000b0024f2cc32c51mr1706392ljp.176.1651079606302; Wed, 27
 Apr 2022 10:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220426145445.2282274-1-agruenba@redhat.com>
 <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
 <CAHc6FU48681X8aUK+g7UUN7q5b6rkVBzTP7h_zbE4XqZYAiw3g@mail.gmail.com>
 <CAHk-=wjMB1-xCOCBtsSMmQuFV9G+vNyCY1O_LsoqOd=0QS4yYg@mail.gmail.com>
 <CAHc6FU5Bag5W2t79+WzUq=NibtEF+7z6=jyNCkLMMp9Yqvpmqw@mail.gmail.com>
In-Reply-To: <CAHc6FU5Bag5W2t79+WzUq=NibtEF+7z6=jyNCkLMMp9Yqvpmqw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Apr 2022 10:13:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=whaz-g_nOOoo8RRiWNjnv2R+h6_xk2F1J4TuSRxk1MtLw@mail.gmail.com>
Message-ID: <CAHk-=whaz-g_nOOoo8RRiWNjnv2R+h6_xk2F1J4TuSRxk1MtLw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 5:29 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Regular (buffered) reads and writes are expected to be atomic with
> respect to each other.

Linux has actually never honored that completely broken POSIX
requirement, although I think some filesystems (notably XFS) have
tried.

It's a completely broken concept. It's not possible to honor atomicity
with mmap(), and nobody has *ever* cared.

And it causes huge amounts of problems and basically makes any sane
locking entirely impossible.

The fact that you literally broke regular file writes in ways that are
incompatible with (much MUCH more important) POSIX file behavior to
try to get that broken read/write atomicity is only one example among
many for why that alleged rule just has to be ignored.

We do honor the PIPE_BUF atomicity on pipes, which is a completely
different kind of atomicity wrt read/write, and doesn't have the
fundamental issues that arbitrary regular file reads/writes have.

There is absolutely no sane way to do that file atomicity wrt
arbitrary read/write calls (*), and you shouldn't even try.

That rule needs to be forgotten about, and buried 6ft deep.

So please scrub any mention of that idiotic rule from documentation,
and from your brain.

And please don't break "partial write means disk full or IO error" due
to trying to follow this broken rule, which was apparently what you
did.

Because that "regular file read/write is done in full" is a *MUCH*
more important rule, and there is a shitton of applications that most
definitely depend on *that* rule.

Just go to debian code search, and look for

   "if (write("

and you'll get thousands of hits, and on the first page of hits 9 out
of 10 of the hits are literally about that "partial write is an
error", eg code like this:

            if (write(fd,&triple,sizeof(triple)) != sizeof(triple))
                reporterr(1,NULL);

from libreoffice.

                        Linus

(*) Yeah, if you never care about performance(**) of mixed read/write,
and you don't care about mmap, and you have no other locking issues,
it's certainly possible. The old rule came about from original UNIX
literally taking an inode lock around the whole IO access, because
that was simple, and back in the days you'd never have multiple
concurrent readers/writers anyway.

(**) It's also instructive how O_DIRECT literally throws that rule
away, and then some direct-IO people said for years that direct-IO is
superior and used this as one of their arguments. Probably the same
people who thought that "oh, don't report partial success", because we
can't deal with it.

