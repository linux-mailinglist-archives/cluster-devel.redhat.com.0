Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3396D5127E1
	for <lists+cluster-devel@lfdr.de>; Thu, 28 Apr 2022 02:00:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-xh6nnFc1P1m9c4vH7Sjhow-1; Wed, 27 Apr 2022 20:00:43 -0400
X-MC-Unique: xh6nnFc1P1m9c4vH7Sjhow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D10B83396D;
	Thu, 28 Apr 2022 00:00:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18EB99E8E;
	Thu, 28 Apr 2022 00:00:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B929B1947048;
	Thu, 28 Apr 2022 00:00:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 398D11947041 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 28 Apr 2022 00:00:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0520B414A7E9; Thu, 28 Apr 2022 00:00:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00A59414A7E7
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 00:00:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8B173C0E188
 for <cluster-devel@redhat.com>; Thu, 28 Apr 2022 00:00:38 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-CT7kTX8AP1KH13Y0ex52Xw-1; Wed, 27 Apr 2022 20:00:37 -0400
X-MC-Unique: CT7kTX8AP1KH13Y0ex52Xw-1
Received: by mail-lf1-f45.google.com with SMTP id w19so5762904lfu.11
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 17:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MVJapQpQ5E9fCd/8+tW7JYOKU2HdcGDq0gA7B9hFSRA=;
 b=rF0oXbG1G3U6aZ3/CKviW98qJpHkAJ4NTs4SPz7Uv00NgU+qZ6nx/F1UwZiUdfnSBH
 PFHkPp9wzcFXmPSQ5ZaHcD5I6d2Q6XFyGpinVq3hEjGaEhMfwnY6ntniYgn965aPxhkj
 ze9Ync1AGrfEvXJhOHtl7Qr5QiIGIog8ZOq9dT0WIOSF4cnuhBJHXV3TNsXT0lwHsuQn
 ihLZhS/rsmNpEJBpwlkrtLH+NdHJjCxRgctYpiWmI7lUi3qt6C28IB2/VmjQm9rWEuQj
 VYWAqVUI0MdnC2AruC5M1d67qzauEOfR7S8F7dmJjgTRJRw0GEhTWhnNfpeZbI2UaUPN
 0aog==
X-Gm-Message-State: AOAM533/ED6tyNNdzMYBVDZJxsSlzxNAGUJNN6156aODMrgSicLiJk5q
 5OU4RutaFSLUZWaFFs/EKc2kq3eKs+C5QagXE04=
X-Google-Smtp-Source: ABdhPJyYeeUQjp7z5ILWixOKFZsatFt1LjeimPuRbaJpd8cGMIVaPwiy9RBe7fN4eK8eHkLAZc9DmQ==
X-Received: by 2002:ac2:4218:0:b0:46b:925e:d2ba with SMTP id
 y24-20020ac24218000000b0046b925ed2bamr22084277lfh.396.1651104035207; 
 Wed, 27 Apr 2022 17:00:35 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 y6-20020a2e95c6000000b0024f131c6d18sm978209ljh.46.2022.04.27.17.00.33
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 17:00:33 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id q185so4664753ljb.5
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 17:00:33 -0700 (PDT)
X-Received: by 2002:a2e:8245:0:b0:24b:48b1:a1ab with SMTP id
 j5-20020a2e8245000000b0024b48b1a1abmr19472567ljh.152.1651104032758; Wed, 27
 Apr 2022 17:00:32 -0700 (PDT)
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
In-Reply-To: <CAHk-=whQxvMvty8SjiGMh+gM4VmCYvqn6EAwmrDXJaHT2Aa+UA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Apr 2022 17:00:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wicJdoCjPLu7FhaErr6Z3UaW820U2b+F-8P4qwSFUZ0mg@mail.gmail.com>
Message-ID: <CAHk-=wicJdoCjPLu7FhaErr6Z3UaW820U2b+F-8P4qwSFUZ0mg@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 3:20 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So I really think
>
>  (a) you are mis-reading the standard by attributing too strong logic
> to paperwork that is English prose and not so exact
>
>  (b) documenting Linux as not doing what you are mis-reading it for is
> only encouraging others to mis-read it too
>
> The whole "arbitrary writes have to be all-or-nothing wrt all other
> system calls" is simply not realistic, and has never been. Not just
> not in Linux, but in *ANY* operating system that POSIX was meant to
> describe.

Side note: a lot of those "atomic" things in that documentation have
come from a history of signal handling atomicity issues, and from all
the issues people had with (a) user-space threading implementations
and (b) emulation layers from non-Unixy environments.

So when they say that things like "rename()" has to be all-or-nothing,
it's to clarify that you can't emulate it as a "link and delete
original" kind of operation (which old UNIX *did* do) and claim to be
POSIX.

Because while the end result of rename() and link()+unlink()might be
similar, people did rely on that whole "use rename as a way to create
an atomic marker in the filesystem" (which is a very traditional UNIX
pattern).

So "rename()" has to be atomic, and the legacy behavior of link+unlink
is not valid in POSIX.

Similarly, you can't implement "pread()" as a "lseek+read+lseek back",
because that doesn't work if somebody else is doing another "pread()"
on the same file descriptor concurrently.

Again, people *did* implement exactly those kinds of implementations
of "pread()", and yes, they were broken for both signals and for
threading.

So there's "atomicity" and then there is "atomicity".

That "all or nothing" can be a very practical thing to describe
*roughly* how it must work on a higher level, or it can be a
theoretical "transactional" thing that works literally like a database
where the operation happens in full and you must not see any
intermediate state.

And no, "write()" and friends have never ever been about some
transactional operation where you can't see how the file grows as it
is being written to. That kind of atomicity has simply never existed,
not even in theory.

So when you see POSIX saying that a "read()" system call is "atomic",
you should *not* see it as a transaction thing, but see it in the
historical context of "people used to do threading libraries in user
space, and since they didn't want a big read() to block all other
threads, they'd split it up into many smaller reads and now another
thread *also* doing 'read()' system calls would see the data it read
being not one contiguous region, but multiple regions where the file
position changed in the middle".

Similarly, a "read()" system call will not be interrupted by a signal
in the middle, where the signal handler would do a "lseek()" or
another "read()", and now the original "read()" data suddenly is
affected.

That's why things like that whole "f_pos is atomic" is a big deal.

Because there literally were threading libraries (and badly emulated
environments) where that *WASN'T* the case, and _that_ is why POSIX
then talks about it.

So think of POSIX not as some hard set of "this is exactly how things
work and we describe every detail".

Instead, treat it a bit like historians treat Herodotus - interpreting
his histories by taking the issues of the time into account.  POSIX is
trying to clarify and document the problems of the time it was
written, and taking other things for granted.

                 Linus

