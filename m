Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F64513AA7
	for <lists+cluster-devel@lfdr.de>; Thu, 28 Apr 2022 19:09:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-mLsvN050PE2k3Rsb8qUjXQ-1; Thu, 28 Apr 2022 13:09:53 -0400
X-MC-Unique: mLsvN050PE2k3Rsb8qUjXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF3CA802819;
	Thu, 28 Apr 2022 17:09:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB21240D2971;
	Thu, 28 Apr 2022 17:09:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 66CF51947048;
	Thu, 28 Apr 2022 17:09:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A8B5419466DF for <cluster-devel@listman.corp.redhat.com>;
 Thu, 28 Apr 2022 17:09:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8975640D2978; Thu, 28 Apr 2022 17:09:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8561740D2977
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 17:09:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A277802812
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 17:09:50 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-ldB4NaA3NpCr9O6EASM8fQ-1; Thu, 28 Apr 2022 13:09:46 -0400
X-MC-Unique: ldB4NaA3NpCr9O6EASM8fQ-1
Received: by mail-lj1-f169.google.com with SMTP id l19so7553640ljb.7
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 10:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+iAkgH8cfwl83YyTEPgnjdt38nfCnmdRxiArvtIdv0w=;
 b=y4ZXAoJ1BJYyTaZYW8y4bxhKp8RCOUMd5crqGOMQgd3VsPlJxKJMoldMfG0uJcvnjy
 +TCzgU63NRbZNxFbEoO3HQH8HrrJBrBKsocZUTZbA7ERzVZfBVs1kBP6+TaH5v6J0Kim
 2HiKWJG2HpzfAdp+jEpCANGdVizw+U0ZpJnO9xTMG6erb4fVZoLpT2y8I3KNwOzNOSLm
 0Jh1xos/Zb94PU7iF/fD1jD2nkDwYMsDldk5xE3/bhsDDelo6zk8TE6wWPNt2V+P2hJ9
 kJz2j9iycNQqGSOlB5zjZlRIcsHLVSiebft97UqLF60ogZGb0UrZjHvnHizyOJrZK5xG
 3hbg==
X-Gm-Message-State: AOAM532Rf2k9+bGW+WY5w16FVXjayXWskl/yKqYlqoXggPkALB7IxNeB
 AcAzWnc6jjXowBdeaNWpAm2276j8iFwjitciq3A=
X-Google-Smtp-Source: ABdhPJw2WVClwZErq2/DAmDdMb9RbbvMMqDLYxG8O4J8Txo16zit4AwzxfZHV0nHPehvQOA0oNW04Q==
X-Received: by 2002:a2e:9d06:0:b0:24c:7dee:4d58 with SMTP id
 t6-20020a2e9d06000000b0024c7dee4d58mr22055321lji.177.1651165784496; 
 Thu, 28 Apr 2022 10:09:44 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 h19-20020ac24d33000000b00471f7c400fesm48390lfk.106.2022.04.28.10.09.43
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 10:09:43 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id bu29so9851342lfb.0
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 10:09:43 -0700 (PDT)
X-Received: by 2002:a05:6512:118f:b0:472:2b35:8528 with SMTP id
 g15-20020a056512118f00b004722b358528mr6616819lfr.531.1651165782874; Thu, 28
 Apr 2022 10:09:42 -0700 (PDT)
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
In-Reply-To: <CAHc6FU7GkXLkns5PONLvsSi6HB+rjaNSyFeQFS034tKL-JueMw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 28 Apr 2022 10:09:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg4ypnZUA5BOHAF1miKvOhW2yQSruuBKNXMDR=dTmp+ww@mail.gmail.com>
Message-ID: <CAHk-=wg4ypnZUA5BOHAF1miKvOhW2yQSruuBKNXMDR=dTmp+ww@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Thu, Apr 28, 2022 at 6:27 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> The data corruption we've been getting unfortunately didn't have to do
> with lock contention (we already knew that); it still occurs. I'm
> running out of ideas on what to try there.

Hmm.

I don't see the bug, but I do have a suggestion on something to try.

In particular, you said the problem started with commit 00bfe02f4796
("gfs2: Fix mmap + page fault deadlocks for buffered I/O").

And to me, I see two main things that are going on

 (a) the obvious "calling generic IO functions with pagefault disabled" thing

 (b) the "allow demotion" thing

And I wonder if you could at least pinpoint which of the  cases it is
that triggers it.

So I'd love to see you try three things:

 (1) just remove the "allow demotion" cases.

     This will re-introduce the deadlock the commit is trying to fix,
but that's such a special case that I assume you can run your
test-suite that shows the problem even without that fix in place?

     This would just pinpoint whether it's due to some odd locking issue or not.

Honestly, from how you describe the symptoms, I don't think (1) is the
cause, but I think making sure is good.

It sounds much more likely that it's one of those generic vfs
functions that screws up when a page fault happens and it gets a
partial result instead of handling the fault.

Which gets us to

 (2) remove the pagefault_disable/enable() around just the
generic_file_read_iter() case in gfs2_file_read_iter().

and

 (3) finally, remove the pagefault_disable/enable() around the
iomap_file_buffered_write() case in gfs2_file_buffered_write()

Yeah, yeah, you say it's just the read that fails, but humor me on
(3), just in case it's an earlier write in your test-suite and the
read just then uncovered it.

But I put it as (3) so that you'd do the obvious (2) case first, and
narrow it down (ie if (1) still shows the bug, then do (2), and if
that fixes the bug it will be fairly well pinpointed to
generic_file_read_iter().

Looking around, gfs2 is the only thing that obviously calls
generic_file_read_iter() with pagefoaults disabled, so it does smell
like filemap_read() might have some issue, but the only thing that
does is basically that

                copied = copy_folio_to_iter(folio, offset, bytes, iter);

which should just become copy_page_to_iter_iovec(), which you'd hope
would get things right.

But it would be good to just narrow things down a bit.

I'll look at that copy_page_to_iter_iovec() some more regardless, but
doing that "let's double-check it's not somethign else" would be good.

             Linus

