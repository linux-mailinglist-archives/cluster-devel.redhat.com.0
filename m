Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D5F510CB5
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Apr 2022 01:33:38 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-0c22N28MPLKMYpPbmXyeLg-1; Tue, 26 Apr 2022 19:33:34 -0400
X-MC-Unique: 0c22N28MPLKMYpPbmXyeLg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89C2580005D;
	Tue, 26 Apr 2022 23:33:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C377566A39;
	Tue, 26 Apr 2022 23:33:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 349811949761;
	Tue, 26 Apr 2022 23:33:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B897619451F0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 26 Apr 2022 23:33:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C4C5200C0DD; Tue, 26 Apr 2022 23:33:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8831F20111F1
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 23:33:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BA9985A5A8
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 23:33:24 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-wDWZO50qNQG4Qy7tccncmg-1; Tue, 26 Apr 2022 19:33:22 -0400
X-MC-Unique: wDWZO50qNQG4Qy7tccncmg-1
Received: by mail-lf1-f44.google.com with SMTP id x33so309448lfu.1
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 16:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YVvIQh6F4l539Ju82FbPOXOwgPIjKwZXSPtA68ehILI=;
 b=3WTNu8RTo/eq1C/BEX5ip9nPuZvYphsdealyswEULKUgsKXE2PLa0T2W5Kbzzxy1Un
 VKDol0chTguxING6k5y3aeSQemMV+yQ7rrbPiH/QQhgstNMvmfV/wz2YoLO42B4wOspZ
 tonCHaIl5Qs83Oh3Qem34r0bfIhtnhiE1rPb9da8hNE3YD4Q5ozxbzneeJPptyRvakZa
 16q5NWconbMSE1BumDUVHZtjogAW3zlweCUiJZXfuTLYe2AJ8Pwm95v1d07Um+Mp3QDd
 fTh4CIEaLLowRz6RMdCQnc8Brpprf9pzMPs7s188cZPayUq6/4DD9o6H64GKU8mpHxlh
 gRCA==
X-Gm-Message-State: AOAM533UTZgzo3yocRSCjJDMCO2bGSiwIOQk2STybEQcWlGvKGjVT+ek
 eUbKJgcjjBI7Kb3kaaMHINxUMN3588phaoR7
X-Google-Smtp-Source: ABdhPJxGuFG2bjJEMPm7UQcuK6JmBSRL1AWQaGzZmoo270jncf7ndZGl+50b6K4GNFHpv6DlfSMUbg==
X-Received: by 2002:ac2:5b0f:0:b0:472:82f:2537 with SMTP id
 v15-20020ac25b0f000000b00472082f2537mr8452968lfn.0.1651016000631; 
 Tue, 26 Apr 2022 16:33:20 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 t17-20020a2e7811000000b0024f11e202fdsm771674ljc.114.2022.04.26.16.33.19
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 16:33:19 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id q14so443674ljc.12
 for <cluster-devel@redhat.com>; Tue, 26 Apr 2022 16:33:19 -0700 (PDT)
X-Received: by 2002:a2e:8789:0:b0:24f:124c:864a with SMTP id
 n9-20020a2e8789000000b0024f124c864amr7581754lji.164.1651015999161; Tue, 26
 Apr 2022 16:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220426145445.2282274-1-agruenba@redhat.com>
 <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
 <CAHc6FU48681X8aUK+g7UUN7q5b6rkVBzTP7h_zbE4XqZYAiw3g@mail.gmail.com>
In-Reply-To: <CAHc6FU48681X8aUK+g7UUN7q5b6rkVBzTP7h_zbE4XqZYAiw3g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 26 Apr 2022 16:33:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjMB1-xCOCBtsSMmQuFV9G+vNyCY1O_LsoqOd=0QS4yYg@mail.gmail.com>
Message-ID: <CAHk-=wjMB1-xCOCBtsSMmQuFV9G+vNyCY1O_LsoqOd=0QS4yYg@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

On Tue, Apr 26, 2022 at 2:28 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Btrfs has a comment in that place that reads:
>
>     /* No increment (+=) because iomap returns a cumulative value. */

What a truly horrid interface. But you are triggering repressed
childhood memories:

> That's so that we can complete the tail of an asynchronous write
> asynchronously after a failed page fault and subsequent fault-in.

yeah, that makes me go "I remember something like that".

> That would be great, but applications don't seem to be able to cope
> with short direct writes, so we must turn partial failure into total
> failure here. There's at least one xfstest that checks for that as
> well.

What a complete crock. You're telling me that you did some writes, but
then you can't tell user space that writes happened because that would
confuse things.

Direct-IO is some truly hot disgusting garbage.

Happily it's only used for things like databases that nobody sane
would care about anyway.

Anyway, none of that makes any sense, since you do this:

                ret = gfs2_file_direct_write(iocb, from, &gh);
                if (ret < 0 || !iov_iter_count(from))
                        goto out_unlock;

                iocb->ki_flags |= IOCB_DSYNC;
                buffered = gfs2_file_buffered_write(iocb, from, &gh);

so you're saying that the direct write will never partially succeed,
but then in gfs2_file_write_iter() it very much looks like it's
falling back to buffered writes for that case.

Hmm. Very odd.

I assume this is all due to that

        /* Silently fall back to buffered I/O when writing beyond EOF */
        if (iocb->ki_pos + iov_iter_count(from) > i_size_read(&ip->i_inode))

thing, so this all makes some perverse kind of sense, but it still
looks like this code just needs some serious serious commentary.

So you *can* have a partial write if you hit the end of the file, and
then you'll continue that partial write with the buffered code.

But an actual _failure_ will not do that, and instead return an error
even if the write was partially done.

But then *some* failures aren't failures at all, and without any
comments do this

        if (ret == -ENOTBLK)
                ret = 0;


And remind me again - this all is meant for applications that
supposedly care about consistency on disk?

And the xfs tests actually have a *test* for that case, to make sure
that nobody can sanely *really* know how much of the write succeeded
if it was a DIO write?

Gotcha.

> > The reason I think I'm full of sh*t is that you say that the problem
> > occurs in gfs2_file_buffered_write(), not in that
> > gfs2_file_direct_write() case.
>
> Right, we're having that issue with buffered writes.

I have to say, compared to all the crazy things I see in the DIO path,
the buffered write path actually looks almost entirely sane.

Of course, gfs2_file_read_iter() counts how many bytes it has read in
a variable called 'written', and gfs2_file_buffered_write() counts the
bytes it has written in a variable called 'read', so "entirely sane"
is all very very relative.

I'm sure there's some good reason (job security?) for all this insanity.

But I now have to go dig my eyes out with a rusty spoon.

But before I do that, I have one more question (I'm going to regret
this, aren't I?):

In gfs2_file_buffered_write(), when it has done that
fault_in_iov_iter_readable(), and it decides that that succeeded, it
does

                        if (gfs2_holder_queued(gh))
                                goto retry_under_glock;
                        if (read && !(iocb->ki_flags & IOCB_DIRECT))
                                goto out_uninit;
                        goto retry;

so if it still has that lock (if I understand correctly), it will always retry.

But if it *lost* the lock, it will retry only if was a direct write,
and return a partial success for a regular write() rather than
continue the write.

Whaa? I'm assuming that this is more of that "direct writes have to
succeed fully or not at all", but according to POSIX *regular* writes
should also succeed fully, unless some error happens.

Losing the lock doesn't sound like an error to me.

And there are a lot of applications that do assume "write to a regular
file didn't complete fully means that the disk is full" etc. Because
that's the traditional meaning.

This doesn't seem to be related to any data corruption issue, but it does smell.

             Linus

